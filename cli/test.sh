#!/usr/bin/env bash

ROOT=$(cd -P "$(dirname "${BASH_SOURCE[0]}")"; pwd -P)

cd "$ROOT" || exit

export PATH=$ROOT:$PATH

set -x

make ys

ys --help

ys --version

cat test/hello.ys

ys test/hello.ys

ys --load test/hello.ys

ys --eval 'println: "Hello, World!"'

ys -e 'println: "Hello, World!"' -e 'identity: 12345'

ys -e 'println: "Hello, World!"' -e 'identity: 12345' test/hello.ys

ys -e 'range: 25' --json

ys -Ye 'range: 10'

ys -Ee 'range: 30'

ys --compile test/hello.ys

ys -ce 'println: "Hello, World!"'

ys -c -e 'println: "Hello, World!"' -e 'identity: 12345'

ys -c -e 'println: "Hello, World!"' \
      -e 'println: "YAMLScript!!"' \
      test/hello.ys

ys -c -x parse -x build -x print -e 'println: "Hello, World!"'

ys -x all -e 'println: inc(41)'