Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id C72FD7887D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 11:00:26 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id 30so2775513iog.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 03:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tnQCmB2Fc5yUTpMtIIjFi40v/WDMYpdm/xQh07Z0V10=;
	b=nqxdaX0b29d438iN2KIxX06exu4Vb2bU3johq9B6vJOE3TxKUmiRpqU4T4MB4H8ZLT
	E0II4eWXSZrQhCOkLsPFd6bBJ2CP4+Ex4qIAziUShfJRU8VY+qmnrYKssQ62Y6X6CKbv
	7SGnJXqqyCatIzmNHGAZOiSIkNRHxLpMDuBUW1nnlETwEBHszwO3CSb6l/+Nr5vyMi7g
	wwK+FK/paph+1CjujPEDV4DQwUdj8WxMCS7QIaN4vmAnFgpMbySbE5jKwDecvEtjIP/W
	7RDLIUwkCYA/GBgmqLVUJxfQAowXfO6Fl5AocKAHTal9wOUSrETUN0t+/EmVdSLYsXBz
	e44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tnQCmB2Fc5yUTpMtIIjFi40v/WDMYpdm/xQh07Z0V10=;
	b=akH1JJkn68AKMSrw2vBRo1+nUblFexmsh2nMLIFepYHu05UK2kKK0euqcletPVBWxC
	tGDM4xypcECvIxlvH9zsiCyf/Vx4JGWzbkg0OEq+eMKRM8KkN3l2VCnmp6UDuQXnmRAR
	p5sD+wRlWbVVIHazHv7+L+C6F1Y8Vy6dYJMee8ljugAmFvwNgFn6PW+Z3oUpFb9Ay1J1
	zJj+7YBevChwKjbdUFFtS2fCRv+kuv4BWTP0tt7P5d2nwkykqHnurBrpqXrhV5fbOPtD
	oAMUYRnSUrcyqaW7mJslWv9/Z++zayBd4aEupgONeX/F0Nj+OdREOZvdCrkKsQlTQJnD
	y+kQ==
X-Gm-Message-State: APf1xPA9tgwCs5YhWWkF0go9cdiXCfy/CbaDzIhboIz1kMdJM/eBWG/v
	PV4Oj9/I2KVlb0xxHRMR3Bs0aneXz/jTixwlCmCddQ==
X-Google-Smtp-Source: AG47ELt6XZVrasgJ4jK2HfcPbY8IdLYD9bfyzJzlestLQB+gnLw/diyqWeJf0a77vBlQ4gvt+rwuT0AFPPbz1vNJtIM=
X-Received: by 10.107.183.76 with SMTP id h73mr19628228iof.201.1519815626534; 
	Wed, 28 Feb 2018 03:00:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Wed, 28 Feb 2018 03:00:06 -0800 (PST)
In-Reply-To: <20180227123634.2812-2-matt@madison.systems>
References: <20180227123634.2812-1-matt@madison.systems>
	<20180227123634.2812-2-matt@madison.systems>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 28 Feb 2018 11:00:06 +0000
Message-ID: <CAJTo0LbN8+a+J4pJL5SATDrPSWRiLniNRu19znJOD_4Ch6-m8w@mail.gmail.com>
To: Matt Madison <matt@madison.systems>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/8] go: update go 1.9 -> go 1.10
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Feb 2018 11:00:27 -0000
Content-Type: multipart/alternative; boundary="94eb2c0b9e3a8b4713056643a68d"

--94eb2c0b9e3a8b4713056643a68d
Content-Type: text/plain; charset="UTF-8"

Something in this series breaks:

ERROR: go-helloworld-0.1-r0 do_compile: Function failed: do_compile (log
file is located at
/data/poky-tmp/master/work/corei7-64-poky-linux/go-helloworld/0.1-r0/temp/log.do_compile.12028)
ERROR: Logfile of failure stored in:
/data/poky-tmp/master/work/corei7-64-poky-linux/go-helloworld/0.1-r0/temp/log.do_compile.12028
Log data follows:
| DEBUG: Executing shell function do_compile
| github.com/golang/example/stringutil
| #
/data/poky-tmp/master/work/corei7-64-poky-linux/go-helloworld/0.1-r0/go-tmp/go-build469569525/b188/libstd.so
|
/data/poky-tmp/master/work/corei7-64-poky-linux/go-helloworld/0.1-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/go/pkg/tool/linux_amd64/link:
running x86_64-poky-linux-gcc failed: exit status 1
| /tmp/go-link-351787050/go.o:(.data.rel.ro+0x4181b0): undefined reference
to `main.init'
| /tmp/go-link-351787050/go.o:(.data.rel.ro+0x4181b8): undefined reference
to `main.main'
| collect2: error: ld returned 1 exit status
|
| WARNING: exit code 2 from a shell command.
| ERROR: Function failed: do_compile (log file is located at
/data/poky-tmp/master/work/corei7-64-poky-linux/go-helloworld/0.1-r0/temp/log.do_compile.12028)
ERROR: Task
(/home/ross/Yocto/poky/meta/recipes-extended/go-examples/go-helloworld_0.1.bb:do_compile)
failed with exit code '1'

(same recipe built without the series)

Ross

On 27 February 2018 at 12:36, Matt Madison <matt@madison.systems> wrote:

> * Patches and recipes reworked for go 1.10's significant
>   changes to its bootstrap and build steps
>
> * Update go1.4 source tarball used for go-native
>   bootstrapping to the version recommended
>   in the current go documentation
>
> * Remove test data from installed sources to eliminate
>   some packaging QA warnings
>
> * Set GOCACHE to 'off' to disable 1.10's build caching
>   in the go recipes and bbclass
>
> Signed-off-by: Matt Madison <matt@madison.systems>
> ---
>  meta/classes/go.bbclass                            |   2 +
>  meta/recipes-devtools/go/go-1.10.inc               |  21 ++
>  ...1-allow-CC-and-CXX-to-have-multiple-words.patch |  49 ++++
>  ...-content-based-hash-generation-less-pedan.patch | 220 ++++++++++++++++
>  ...OLDIR-to-be-overridden-in-the-environment.patch |  64 +++++
>  .../0004-ld-add-soname-to-shareable-objects.patch  |  47 ++++
>  ...verride-CC-when-building-dist-and-go_boot.patch |  40 +++
>  ...-cmd-dist-separate-host-and-target-builds.patch | 277
> +++++++++++++++++++++
>  ...07-cmd-go-make-GOROOT-precious-by-default.patch |  97 ++++++++
>  ...ld-replace-glibc-dynamic-linker-with-musl.patch | 130 ++++++++++
>  meta/recipes-devtools/go/go-1.9.inc                |  26 --
>  .../0001-make.bash-quote-CC_FOR_TARGET.patch       |  32 ---
>  ...CC-and-CXX-environment-variable-construct.patch |  67 -----
>  ...sh-better-separate-host-and-target-builds.patch |  92 -------
>  ...w-GOTOOLDIR-to-be-overridden-in-the-envir.patch |  68 -----
>  ...05-cmd-go-make-GOROOT-precious-by-default.patch |  41 ---
>  ...dd-GOTOOLDIR_BOOTSTRAP-environment-variab.patch |  36 ---
>  .../0007-ld-add-soname-to-shareable-objects.patch  |  46 ----
>  ...dd-GOHOSTxx-indirection-for-cross-canadia.patch |  33 ---
>  ...dmode-pie-forces-external-linking-mode-on.patch |  47 ----
>  ...verride-CC-when-building-dist-and-go_boot.patch |  43 ----
>  .../go/go-1.9/set-external-linker.patch            | 111 ---------
>  meta/recipes-devtools/go/go-common.inc             |   2 +
>  meta/recipes-devtools/go/go-cross-canadian.inc     |  28 +--
>  ...s-canadian_1.9.bb => go-cross-canadian_1.10.bb} |   0
>  meta/recipes-devtools/go/go-cross.inc              |  55 ++--
>  .../go/{go-cross_1.9.bb => go-cross_1.10.bb}       |   0
>  meta/recipes-devtools/go/go-crosssdk.inc           |  16 +-
>  .../go/{go-crosssdk_1.9.bb => go-crosssdk_1.10.bb} |   0
>  meta/recipes-devtools/go/go-native.inc             |  25 +-
>  .../go/{go-native_1.9.bb => go-native_1.10.bb}     |   0
>  meta/recipes-devtools/go/go-runtime.inc            |  58 +++--
>  .../go/{go-runtime_1.9.bb => go-runtime_1.10.bb}   |   0
>  meta/recipes-devtools/go/go-target.inc             |  21 +-
>  meta/recipes-devtools/go/{go_1.9.bb => go_1.10.bb} |   0
>  35 files changed, 1048 insertions(+), 746 deletions(-)
>  create mode 100644 meta/recipes-devtools/go/go-1.10.inc
>  create mode 100644 meta/recipes-devtools/go/go-1.
> 10/0001-allow-CC-and-CXX-to-have-multiple-words.patch
>  create mode 100644 meta/recipes-devtools/go/go-1.
> 10/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
>  create mode 100644 meta/recipes-devtools/go/go-1.
> 10/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
>  create mode 100644 meta/recipes-devtools/go/go-1.
> 10/0004-ld-add-soname-to-shareable-objects.patch
>  create mode 100644 meta/recipes-devtools/go/go-1.
> 10/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
>  create mode 100644 meta/recipes-devtools/go/go-1.
> 10/0006-cmd-dist-separate-host-and-target-builds.patch
>  create mode 100644 meta/recipes-devtools/go/go-1.
> 10/0007-cmd-go-make-GOROOT-precious-by-default.patch
>  create mode 100644 meta/recipes-devtools/go/go-1.
> 10/0008-ld-replace-glibc-dynamic-linker-with-musl.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.9.inc
>  delete mode 100644 meta/recipes-devtools/go/go-1.
> 9/0001-make.bash-quote-CC_FOR_TARGET.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.
> 9/0002-cmd-go-fix-CC-and-CXX-environment-variable-construct.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.9/0003-make.bash-better-
> separate-host-and-target-builds.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.
> 9/0004-cmd-go-allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.
> 9/0005-cmd-go-make-GOROOT-precious-by-default.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.9/0006-make.bash-add-
> GOTOOLDIR_BOOTSTRAP-environment-variab.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.9/0007-ld-add-soname-to-
> shareable-objects.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.
> 9/0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.
> 9/0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.
> 9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.
> 9/set-external-linker.patch
>  rename meta/recipes-devtools/go/{go-cross-canadian_1.9.bb =>
> go-cross-canadian_1.10.bb} (100%)
>  rename meta/recipes-devtools/go/{go-cross_1.9.bb => go-cross_1.10.bb}
> (100%)
>  rename meta/recipes-devtools/go/{go-crosssdk_1.9.bb =>
> go-crosssdk_1.10.bb} (100%)
>  rename meta/recipes-devtools/go/{go-native_1.9.bb => go-native_1.10.bb}
> (100%)
>  rename meta/recipes-devtools/go/{go-runtime_1.9.bb => go-runtime_1.10.bb}
> (100%)
>  rename meta/recipes-devtools/go/{go_1.9.bb => go_1.10.bb} (100%)
>
> diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
> index 7ecd8c9254..43a262d599 100644
> --- a/meta/classes/go.bbclass
> +++ b/meta/classes/go.bbclass
> @@ -24,6 +24,7 @@ GO_LINKMODE ?= ""
>  GO_LINKMODE_class-nativesdk = "--linkmode=external"
>  GO_LDFLAGS ?= '-ldflags="${GO_RPATH} ${GO_LINKMODE} -extldflags
> '${GO_EXTLDFLAGS}'"'
>  export GOBUILDFLAGS ?= "-v ${GO_LDFLAGS}"
> +export GOPATH_OMIT_IN_ACTIONID ?= "1"
>  export GOPTESTBUILDFLAGS ?= "${GOBUILDFLAGS} -c"
>  export GOPTESTFLAGS ?= "-test.v"
>  GOBUILDFLAGS_prepend_task-compile = "${GO_PARALLEL_BUILD} "
> @@ -47,6 +48,7 @@ GO_INSTALL_FILTEROUT ?= "${GO_IMPORT}/vendor/"
>
>  B = "${WORKDIR}/build"
>  export GOPATH = "${B}"
> +export GOCACHE = "off"
>  GO_TMPDIR ?= "${WORKDIR}/go-tmp"
>  GO_TMPDIR[vardepvalue] = ""
>
> diff --git a/meta/recipes-devtools/go/go-1.10.inc
> b/meta/recipes-devtools/go/go-1.10.inc
> new file mode 100644
> index 0000000000..3a93773e2a
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.10.inc
> @@ -0,0 +1,21 @@
> +require go-common.inc
> +
> +GO_BASEVERSION = "1.10"
> +FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
> +
> +SRC_URI += "\
> +    file://0001-allow-CC-and-CXX-to-have-multiple-words.patch \
> +    file://0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> \
> +    file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> \
> +    file://0004-ld-add-soname-to-shareable-objects.patch \
> +    file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> \
> +    file://0006-cmd-dist-separate-host-and-target-builds.patch \
> +    file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
> +"
> +
> +SRC_URI_append_libc-musl = " file://0008-ld-replace-glibc-
> dynamic-linker-with-musl.patch"
> +
> +SRC_URI[main.md5sum] = "07cbb9d0091b846c6aea40bf5bc0cea7"
> +SRC_URI[main.sha256sum] = "f3de49289405fda5fd1483a8fe6bd2
> fa5469e005fd567df64485c4fa000c7f24"
> diff --git a/meta/recipes-devtools/go/go-1.10/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> b/meta/recipes-devtools/go/go-1.10/0001-allow-CC-and-CXX-to-
> have-multiple-words.patch
> new file mode 100644
> index 0000000000..4584590632
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.10/0001-allow-CC-and-CXX-to-
> have-multiple-words.patch
> @@ -0,0 +1,49 @@
> +From c287c18856575139e4495b320f20cf96856896db Mon Sep 17 00:00:00 2001
> +From: Matt Madison <matt@madison.systems>
> +Date: Mon, 19 Feb 2018 08:49:33 -0800
> +Subject: [PATCH 1/8] allow CC and CXX to have multiple words
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Matt Madison <matt@madison.systems>
> +---
> + src/cmd/dist/build.go             | 4 +++-
> + src/cmd/go/internal/envcmd/env.go | 4 ++--
> + 2 files changed, 5 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
> +index 49ed80033e..eb70f17790 100644
> +--- a/src/cmd/dist/build.go
> ++++ b/src/cmd/dist/build.go
> +@@ -1406,7 +1406,9 @@ func checkCC() {
> +       if !needCC() {
> +               return
> +       }
> +-      if output, err := exec.Command(defaultcc[""],
> "--help").CombinedOutput(); err != nil {
> ++      cc := strings.Split(defaultcc[""], " ")
> ++      args := append(cc[1:], "--help")
> ++      if output, err := exec.Command(cc[0], args...).CombinedOutput();
> err != nil {
> +               outputHdr := ""
> +               if len(output) > 0 {
> +                       outputHdr = "\nCommand output:\n\n"
> +diff --git a/src/cmd/go/internal/envcmd/env.go
> b/src/cmd/go/internal/envcmd/env.go
> +index 603f7b5060..f891123f9c 100644
> +--- a/src/cmd/go/internal/envcmd/env.go
> ++++ b/src/cmd/go/internal/envcmd/env.go
> +@@ -82,11 +82,11 @@ func MkEnv() []cfg.EnvVar {
> +
> +       cc := cfg.DefaultCC(cfg.Goos, cfg.Goarch)
> +       if env := strings.Fields(os.Getenv("CC")); len(env) > 0 {
> +-              cc = env[0]
> ++              cc = strings.Join(env, " ")
> +       }
> +       cxx := cfg.DefaultCXX(cfg.Goos, cfg.Goarch)
> +       if env := strings.Fields(os.Getenv("CXX")); len(env) > 0 {
> +-              cxx = env[0]
> ++              cxx = strings.Join(env, " ")
> +       }
> +       env = append(env, cfg.EnvVar{Name: "CC", Value: cc})
> +       env = append(env, cfg.EnvVar{Name: "CXX", Value: cxx})
> +--
> +2.14.1
> +
> diff --git a/meta/recipes-devtools/go/go-1.10/0002-cmd-go-make-content-
> based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go-
> 1.10/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> new file mode 100644
> index 0000000000..5fd471960e
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.10/0002-cmd-go-make-content-
> based-hash-generation-less-pedan.patch
> @@ -0,0 +1,220 @@
> +From 4ec2b27c091fbce0e8e2fd7e3ef2c76e068af32f Mon Sep 17 00:00:00 2001
> +From: Matt Madison <matt@madison.systems>
> +Date: Mon, 19 Feb 2018 08:50:59 -0800
> +Subject: [PATCH 2/8] cmd/go: make content-based hash generation less
> pedantic
> +
> +Go 1.10's build tool now uses content-based hashes to
> +determine when something should be built or re-built.
> +This same mechanism is used to maintain a built-artifact
> +cache for speeding up builds.
> +
> +However, the hashes it generates include information that
> +doesn't work well with OE, nor with using a shared runtime
> +library.
> +
> +First, it embeds path names to source files, unless
> +building within GOROOT.  This prevents the building
> +of a package in GOPATH for later staging into GOROOT.
> +
> +This patch adds support for the environment variable
> +GOPATH_OMIT_IN_ACTIONID.  If present, path name
> +embedding is disabled.
> +
> +Second, if cgo is enabled, the build ID for cgo-related
> +packages will include the current value of the environment
> +variables for invoking the compiler (CC, CXX, FC) and
> +any CGO_xxFLAGS variables.  Only if the settings used
> +during a compilation exactly match, character for character,
> +the values used for compiling runtime/cgo or any other
> +cgo-enabled package being imported, will the tool
> +decide that the imported package is up-to-date.
> +
> +This is done to help ensure correctness, but is overly
> +simplistic and effectively prevents the reuse of built
> +artifacts that use cgo (or shared runtime, which includes
> +runtime/cgo).
> +
> +This patch filters out all compiler flags except those
> +beginning with '-m'.  The default behavior can be restored
> +by setting the CGO_PEDANTIC environment variable.
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Matt Madison <matt@madison.systems>
> +---
> + src/cmd/go/internal/envcmd/env.go |  2 +-
> + src/cmd/go/internal/work/exec.go  | 63 ++++++++++++++++++++++++++++--
> ---------
> + 2 files changed, 46 insertions(+), 19 deletions(-)
> +
> +diff --git a/src/cmd/go/internal/envcmd/env.go
> b/src/cmd/go/internal/envcmd/env.go
> +index f891123f9c..ebacfbfdbc 100644
> +--- a/src/cmd/go/internal/envcmd/env.go
> ++++ b/src/cmd/go/internal/envcmd/env.go
> +@@ -113,7 +113,7 @@ func findEnv(env []cfg.EnvVar, name string) string {
> + func ExtraEnvVars() []cfg.EnvVar {
> +       var b work.Builder
> +       b.Init()
> +-      cppflags, cflags, cxxflags, fflags, ldflags, err :=
> b.CFlags(&load.Package{})
> ++      cppflags, cflags, cxxflags, fflags, ldflags, err :=
> b.CFlags(&load.Package{}, false)
> +       if err != nil {
> +               // Should not happen - b.CFlags was given an empty package.
> +               fmt.Fprintf(os.Stderr, "go: invalid cflags: %v\n", err)
> +diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/
> exec.go
> +index c4c1500eb2..b0f6b45647 100644
> +--- a/src/cmd/go/internal/work/exec.go
> ++++ b/src/cmd/go/internal/work/exec.go
> +@@ -173,6 +173,8 @@ func (b *Builder) Do(root *Action) {
> +       wg.Wait()
> + }
> +
> ++var omitGopath = os.Getenv("GOPATH_OMIT_IN_ACTIONID") != ""
> ++
> + // buildActionID computes the action ID for a build action.
> + func (b *Builder) buildActionID(a *Action) cache.ActionID {
> +       p := a.Package
> +@@ -189,7 +191,7 @@ func (b *Builder) buildActionID(a *Action)
> cache.ActionID {
> +       // but it does not hide the exact value of $GOPATH.
> +       // Include the full dir in that case.
> +       // Assume b.WorkDir is being trimmed properly.
> +-      if !p.Goroot && !strings.HasPrefix(p.Dir, b.WorkDir) {
> ++      if !p.Goroot && !omitGopath && !strings.HasPrefix(p.Dir,
> b.WorkDir) {
> +               fmt.Fprintf(h, "dir %s\n", p.Dir)
> +       }
> +       fmt.Fprintf(h, "goos %s goarch %s\n", cfg.Goos, cfg.Goarch)
> +@@ -197,13 +199,13 @@ func (b *Builder) buildActionID(a *Action)
> cache.ActionID {
> +       fmt.Fprintf(h, "omitdebug %v standard %v local %v prefix %q\n",
> p.Internal.OmitDebug, p.Standard, p.Internal.Local, p.Internal.LocalPrefix)
> +       if len(p.CgoFiles)+len(p.SwigFiles) > 0 {
> +               fmt.Fprintf(h, "cgo %q\n", b.toolID("cgo"))
> +-              cppflags, cflags, cxxflags, fflags, _, _ := b.CFlags(p)
> +-              fmt.Fprintf(h, "CC=%q %q %q\n", b.ccExe(), cppflags,
> cflags)
> ++              cppflags, cflags, cxxflags, fflags, _, _ := b.CFlags(p,
> true)
> ++              fmt.Fprintf(h, "CC=%q %q %q\n", b.ccExe(true), cppflags,
> cflags)
> +               if len(p.CXXFiles)+len(p.SwigFiles) > 0 {
> +-                      fmt.Fprintf(h, "CXX=%q %q\n", b.cxxExe(), cxxflags)
> ++                      fmt.Fprintf(h, "CXX=%q %q\n", b.cxxExe(true),
> cxxflags)
> +               }
> +               if len(p.FFiles) > 0 {
> +-                      fmt.Fprintf(h, "FC=%q %q\n", b.fcExe(), fflags)
> ++                      fmt.Fprintf(h, "FC=%q %q\n", b.fcExe(true), fflags)
> +               }
> +               // TODO(rsc): Should we include the SWIG version or
> Fortran/GCC/G++/Objective-C compiler versions?
> +       }
> +@@ -1731,33 +1733,33 @@ var (
> + // gccCmd returns a gcc command line prefix
> + // defaultCC is defined in zdefaultcc.go, written by cmd/dist.
> + func (b *Builder) GccCmd(incdir, workdir string) []string {
> +-      return b.compilerCmd(b.ccExe(), incdir, workdir)
> ++      return b.compilerCmd(b.ccExe(false), incdir, workdir)
> + }
> +
> + // gxxCmd returns a g++ command line prefix
> + // defaultCXX is defined in zdefaultcc.go, written by cmd/dist.
> + func (b *Builder) GxxCmd(incdir, workdir string) []string {
> +-      return b.compilerCmd(b.cxxExe(), incdir, workdir)
> ++      return b.compilerCmd(b.cxxExe(false), incdir, workdir)
> + }
> +
> + // gfortranCmd returns a gfortran command line prefix.
> + func (b *Builder) gfortranCmd(incdir, workdir string) []string {
> +-      return b.compilerCmd(b.fcExe(), incdir, workdir)
> ++      return b.compilerCmd(b.fcExe(false), incdir, workdir)
> + }
> +
> + // ccExe returns the CC compiler setting without all the extra flags we
> add implicitly.
> +-func (b *Builder) ccExe() []string {
> +-      return b.compilerExe(origCC, cfg.DefaultCC(cfg.Goos, cfg.Goarch))
> ++func (b *Builder) ccExe(filtered bool) []string {
> ++      return b.compilerExe(origCC, cfg.DefaultCC(cfg.Goos, cfg.Goarch),
> filtered)
> + }
> +
> + // cxxExe returns the CXX compiler setting without all the extra flags
> we add implicitly.
> +-func (b *Builder) cxxExe() []string {
> +-      return b.compilerExe(origCXX, cfg.DefaultCXX(cfg.Goos, cfg.Goarch))
> ++func (b *Builder) cxxExe(filtered bool) []string {
> ++      return b.compilerExe(origCXX, cfg.DefaultCXX(cfg.Goos,
> cfg.Goarch), filtered)
> + }
> +
> + // fcExe returns the FC compiler setting without all the extra flags we
> add implicitly.
> +-func (b *Builder) fcExe() []string {
> +-      return b.compilerExe(os.Getenv("FC"), "gfortran")
> ++func (b *Builder) fcExe(filtered bool) []string {
> ++      return b.compilerExe(os.Getenv("FC"), "gfortran", filtered)
> + }
> +
> + // compilerExe returns the compiler to use given an
> +@@ -1766,11 +1768,14 @@ func (b *Builder) fcExe() []string {
> + // of the compiler but can have additional arguments if they
> + // were present in the environment value.
> + // For example if CC="gcc -DGOPHER" then the result is ["gcc",
> "-DGOPHER"].
> +-func (b *Builder) compilerExe(envValue string, def string) []string {
> ++func (b *Builder) compilerExe(envValue string, def string, filtered
> bool) []string {
> +       compiler := strings.Fields(envValue)
> +       if len(compiler) == 0 {
> +               compiler = []string{def}
> +       }
> ++      if filtered {
> ++              return append(compiler[0:1], filterCompilerFlags(compiler[
> 1:])...)
> ++      }
> +       return compiler
> + }
> +
> +@@ -1920,8 +1925,23 @@ func envList(key, def string) []string {
> +       return strings.Fields(v)
> + }
> +
> ++var filterFlags = os.Getenv("CGO_PEDANTIC") == ""
> ++
> ++func filterCompilerFlags(flags []string) []string {
> ++      var newflags []string
> ++      if !filterFlags {
> ++              return flags
> ++      }
> ++      for _, flag := range flags {
> ++              if strings.HasPrefix(flag, "-m") {
> ++                      newflags = append(newflags, flag)
> ++              }
> ++      }
> ++      return newflags
> ++}
> ++
> + // CFlags returns the flags to use when invoking the C, C++ or Fortran
> compilers, or cgo.
> +-func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags,
> fflags, ldflags []string, err error) {
> ++func (b *Builder) CFlags(p *load.Package, filtered bool) (cppflags,
> cflags, cxxflags, fflags, ldflags []string, err error) {
> +       defaults := "-g -O2"
> +
> +       if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS,
> checkCompilerFlags); err != nil {
> +@@ -1939,6 +1959,13 @@ func (b *Builder) CFlags(p *load.Package)
> (cppflags, cflags, cxxflags, fflags, l
> +       if ldflags, err = buildFlags("LDFLAGS", defaults, p.CgoLDFLAGS,
> checkLinkerFlags); err != nil {
> +               return
> +       }
> ++      if filtered {
> ++              cppflags = filterCompilerFlags(cppflags)
> ++              cflags = filterCompilerFlags(cflags)
> ++              cxxflags = filterCompilerFlags(cxxflags)
> ++              fflags = filterCompilerFlags(fflags)
> ++              ldflags = filterCompilerFlags(ldflags)
> ++      }
> +
> +       return
> + }
> +@@ -1954,7 +1981,7 @@ var cgoRe = regexp.MustCompile(`[/\\:]`)
> +
> + func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS,
> pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo,
> outObj []string, err error) {
> +       p := a.Package
> +-      cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoLDFLAGS, err :=
> b.CFlags(p)
> ++      cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoLDFLAGS, err :=
> b.CFlags(p, false)
> +       if err != nil {
> +               return nil, nil, err
> +       }
> +@@ -2306,7 +2333,7 @@ func (b *Builder) swigIntSize(objdir string)
> (intsize string, err error) {
> +
> + // Run SWIG on one SWIG input file.
> + func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir
> string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string,
> err error) {
> +-      cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err := b.CFlags(p)
> ++      cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err := b.CFlags(p,
> false)
> +       if err != nil {
> +               return "", "", err
> +       }
> +--
> +2.14.1
> +
> diff --git a/meta/recipes-devtools/go/go-1.10/0003-allow-GOTOOLDIR-to-
> be-overridden-in-the-environment.patch b/meta/recipes-devtools/go/go-
> 1.10/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> new file mode 100644
> index 0000000000..d1a674f3c2
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.10/0003-allow-GOTOOLDIR-to-
> be-overridden-in-the-environment.patch
> @@ -0,0 +1,64 @@
> +From d9bdd1bf03da06572a7a74d7dbf2a26d279cfa55 Mon Sep 17 00:00:00 2001
> +From: Matt Madison <matt@madison.systems>
> +Date: Sat, 17 Feb 2018 05:24:20 -0800
> +Subject: [PATCH 3/8] allow GOTOOLDIR to be overridden in the environment
> +
> +to allow for split host/target build roots
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Matt Madison <matt@madison.systems>
> +---
> + src/cmd/dist/build.go          | 4 +++-
> + src/cmd/go/internal/cfg/cfg.go | 6 +++++-
> + src/go/build/build.go          | 2 +-
> + 3 files changed, 9 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
> +index eb70f17790..e749cbd22e 100644
> +--- a/src/cmd/dist/build.go
> ++++ b/src/cmd/dist/build.go
> +@@ -220,7 +220,9 @@ func xinit() {
> +       workdir = xworkdir()
> +       xatexit(rmworkdir)
> +
> +-      tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
> ++      if tooldir = os.Getenv("GOTOOLDIR"); tooldir == "" {
> ++              tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos,
> gohostarch)
> ++      }
> + }
> +
> + // compilerEnv returns a map from "goos/goarch" to the
> +diff --git a/src/cmd/go/internal/cfg/cfg.go
> b/src/cmd/go/internal/cfg/cfg.go
> +index 1de4f0dc79..4f6010d660 100644
> +--- a/src/cmd/go/internal/cfg/cfg.go
> ++++ b/src/cmd/go/internal/cfg/cfg.go
> +@@ -96,7 +96,11 @@ func init() {
> +       // as the tool directory does not move based on environment
> variables.
> +       // This matches the initialization of ToolDir in go/build,
> +       // except for using GOROOT rather than runtime.GOROOT().
> +-      build.ToolDir = filepath.Join(GOROOT, "pkg/tool/"+runtime.GOOS+"_"+
> runtime.GOARCH)
> ++      if s := os.Getenv("GOTOOLDIR"); s != "" {
> ++              build.ToolDir = filepath.Clean(s)
> ++      } else {
> ++              build.ToolDir = filepath.Join(GOROOT,
> "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
> ++      }
> + }
> +
> + func findGOROOT() string {
> +diff --git a/src/go/build/build.go b/src/go/build/build.go
> +index 68fb423983..81b1b32270 100644
> +--- a/src/go/build/build.go
> ++++ b/src/go/build/build.go
> +@@ -1594,7 +1594,7 @@ func init() {
> + }
> +
> + // ToolDir is the directory containing build tools.
> +-var ToolDir = filepath.Join(runtime.GOROOT(),
> "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
> ++var ToolDir = envOr("GOTOOLDIR", filepath.Join(runtime.GOROOT(),
> "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH))
> +
> + // IsLocalImport reports whether the import path is
> + // a local import path, like ".", "..", "./foo", or "../foo".
> +--
> +2.14.1
> +
> diff --git a/meta/recipes-devtools/go/go-1.10/0004-ld-add-soname-to-shareable-objects.patch
> b/meta/recipes-devtools/go/go-1.10/0004-ld-add-soname-to-
> shareable-objects.patch
> new file mode 100644
> index 0000000000..a748391659
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.10/0004-ld-add-soname-to-
> shareable-objects.patch
> @@ -0,0 +1,47 @@
> +From 0346a4271d31aab567f6758711a4694fb6108daf Mon Sep 17 00:00:00 2001
> +From: Matt Madison <matt@madison.systems>
> +Date: Sat, 17 Feb 2018 06:26:10 -0800
> +Subject: [PATCH 4/8] ld: add soname to shareable objects
> +
> +so that OE's shared library dependency handling
> +can find them.
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Matt Madison <matt@madison.systems>
> +---
> + src/cmd/link/internal/ld/lib.go | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/ld/
> lib.go
> +index 6dcaf64122..11cbb8a8bb 100644
> +--- a/src/cmd/link/internal/ld/lib.go
> ++++ b/src/cmd/link/internal/ld/lib.go
> +@@ -1134,6 +1134,7 @@ func (ctxt *Link) hostlink() {
> +                               argv = append(argv, "-Wl,-z,relro")
> +                       }
> +                       argv = append(argv, "-shared")
> ++                      argv = append(argv, fmt.Sprintf("-Wl,-soname,%s",
> filepath.Base(*flagOutfile)))
> +                       if ctxt.HeadType != objabi.Hwindows {
> +                               // Pass -z nodelete to mark the shared
> library as
> +                               // non-closeable: a dlclose will do
> nothing.
> +@@ -1145,6 +1146,8 @@ func (ctxt *Link) hostlink() {
> +                       argv = append(argv, "-Wl,-z,relro")
> +               }
> +               argv = append(argv, "-shared")
> ++              argv = append(argv, fmt.Sprintf("-Wl,-soname,%s",
> filepath.Base(*flagOutfile)))
> ++
> +       case BuildModePlugin:
> +               if ctxt.HeadType == objabi.Hdarwin {
> +                       argv = append(argv, "-dynamiclib")
> +@@ -1153,6 +1156,7 @@ func (ctxt *Link) hostlink() {
> +                               argv = append(argv, "-Wl,-z,relro")
> +                       }
> +                       argv = append(argv, "-shared")
> ++                      argv = append(argv, fmt.Sprintf("-Wl,-soname,%s",
> filepath.Base(*flagOutfile)))
> +               }
> +       }
> +
> +--
> +2.14.1
> +
> diff --git a/meta/recipes-devtools/go/go-1.10/0005-make.bash-override-
> CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go-
> 1.10/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> new file mode 100644
> index 0000000000..d15f9d299f
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.10/0005-make.bash-override-
> CC-when-building-dist-and-go_boot.patch
> @@ -0,0 +1,40 @@
> +From 215132a219461a9bcc2ff086474c620f651f463e Mon Sep 17 00:00:00 2001
> +From: Matt Madison <matt@madison.systems>
> +Date: Sat, 17 Feb 2018 06:32:45 -0800
> +Subject: [PATCH 5/8] make.bash: override CC when building dist and
> + go_bootstrap
> +
> +for handling OE cross-canadian builds.
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Matt Madison <matt@madison.systems>
> +---
> + src/make.bash | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/make.bash b/src/make.bash
> +index 93a5c43d11..3a63682bc4 100755
> +--- a/src/make.bash
> ++++ b/src/make.bash
> +@@ -162,7 +162,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ]; then
> +       exit 1
> + fi
> + rm -f cmd/dist/dist
> +-GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH="" "$GOROOT_BOOTSTRAP/bin/go"
> build -o cmd/dist/dist ./cmd/dist
> ++CC="${BUILD_CC:-${CC}}" GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH=""
> "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
> +
> + # -e doesn't propagate out of eval, so check success by hand.
> + eval $(./cmd/dist/dist env -p || echo FAIL=true)
> +@@ -193,7 +193,7 @@ fi
> + # Run dist bootstrap to complete make.bash.
> + # Bootstrap installs a proper cmd/dist, built with the new toolchain.
> + # Throw ours, built with Go 1.4, away after bootstrap.
> +-./cmd/dist/dist bootstrap $buildall $vflag $GO_DISTFLAGS "$@"
> ++CC="${BUILD_CC:-${CC}}" ./cmd/dist/dist bootstrap $buildall $vflag
> $GO_DISTFLAGS "$@"
> + rm -f ./cmd/dist/dist
> +
> + # DO NOT ADD ANY NEW CODE HERE.
> +--
> +2.14.1
> +
> diff --git a/meta/recipes-devtools/go/go-1.10/0006-cmd-dist-separate-host-and-target-builds.patch
> b/meta/recipes-devtools/go/go-1.10/0006-cmd-dist-separate-
> host-and-target-builds.patch
> new file mode 100644
> index 0000000000..73a9db213c
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.10/0006-cmd-dist-separate-
> host-and-target-builds.patch
> @@ -0,0 +1,277 @@
> +From 4839007ac75e0d6d15392e84966bd6051a68bcc4 Mon Sep 17 00:00:00 2001
> +From: Matt Madison <matt@madison.systems>
> +Date: Sat, 17 Feb 2018 10:03:48 -0800
> +Subject: [PATCH 6/8] cmd/dist: separate host and target builds
> +
> +Change the dist tool to allow for OE-style cross-
> +and cross-canadian builds:
> +
> + - command flags --host-only and --target only are added;
> +   if one is present, the other changes mentioned below
> +   take effect, and arguments may also be specified on
> +   the command line to enumerate the package(s) to be
> +   built.
> +
> + - for OE cross builds, go_bootstrap is always built for
> +   the current build host, and is moved, along with the supporting
> +   toolchain (asm, compile, etc.) to a separate 'native_native'
> +   directory under GOROOT/pkg/tool.
> +
> + - go_bootstrap is not automatically removed after the build,
> +   so it can be reused later (e.g., building both static and
> +   shared runtime).
> +
> +Note that for --host-only builds, it would be nice to specify
> +just the "cmd" package to build only the go commands/tools,
> +the staleness checks in the dist tool will fail if the "std"
> +library has not also been built.  So host-only builds have to
> +build everything anyway.
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Matt Madison <matt@madison.systems>
> +
> +more dist cleanup
> +---
> + src/cmd/dist/build.go | 149 ++++++++++++++++++++++++++++++
> +++++++-------------
> + 1 file changed, 111 insertions(+), 38 deletions(-)
> +
> +diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
> +index e749cbd22e..c949429543 100644
> +--- a/src/cmd/dist/build.go
> ++++ b/src/cmd/dist/build.go
> +@@ -38,6 +38,7 @@ var (
> +       goldflags        string
> +       workdir          string
> +       tooldir          string
> ++      build_tooldir    string
> +       oldgoos          string
> +       oldgoarch        string
> +       exe              string
> +@@ -49,6 +50,7 @@ var (
> +
> +       rebuildall   bool
> +       defaultclang bool
> ++      crossBuild   bool
> +
> +       vflag int // verbosity
> + )
> +@@ -223,6 +225,8 @@ func xinit() {
> +       if tooldir = os.Getenv("GOTOOLDIR"); tooldir == "" {
> +               tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos,
> gohostarch)
> +       }
> ++      build_tooldir = pathf("%s/pkg/tool/native_native", goroot)
> ++
> + }
> +
> + // compilerEnv returns a map from "goos/goarch" to the
> +@@ -252,7 +256,6 @@ func compilerEnv(envName, def string)
> map[string]string {
> +               if gohostos != goos || gohostarch != goarch {
> +                       m[gohostos+"/"+gohostarch] = m[""]
> +               }
> +-              m[""] = env
> +       }
> +
> +       for _, goos := range okgoos {
> +@@ -479,8 +482,10 @@ func setup() {
> +       // We keep it in pkg/, just like the object directory above.
> +       if rebuildall {
> +               xremoveall(tooldir)
> ++              xremoveall(build_tooldir)
> +       }
> +       xmkdirall(tooldir)
> ++      xmkdirall(build_tooldir)
> +
> +       // Remove tool binaries from before the tool/gohostos_gohostarch
> +       xremoveall(pathf("%s/bin/tool", goroot))
> +@@ -1130,11 +1135,29 @@ func cmdbootstrap() {
> +
> +       var noBanner bool
> +       var debug bool
> ++      var hostOnly bool
> ++      var targetOnly bool
> ++      var toBuild = []string { "std", "cmd" }
> ++
> +       flag.BoolVar(&rebuildall, "a", rebuildall, "rebuild all")
> +       flag.BoolVar(&debug, "d", debug, "enable debugging of bootstrap
> process")
> +       flag.BoolVar(&noBanner, "no-banner", noBanner, "do not print
> banner")
> ++      flag.BoolVar(&hostOnly, "host-only", hostOnly, "build only host
> binaries, not target")
> ++      flag.BoolVar(&targetOnly, "target-only", targetOnly, "build only
> target binaries, not host")
> +
> +-      xflagparse(0)
> ++      xflagparse(-1)
> ++
> ++      if (hostOnly && targetOnly) {
> ++              fatalf("specify only one of --host-only or
> --target-only\n")
> ++      }
> ++      crossBuild = hostOnly || targetOnly
> ++      if flag.NArg() > 0 {
> ++              if crossBuild {
> ++                      toBuild = flag.Args()
> ++              } else {
> ++                      fatalf("package names not permitted without
> --host-only or --target-only\n")
> ++              }
> ++      }
> +
> +       if debug {
> +               // cmd/buildid is used in debug mode.
> +@@ -1182,8 +1205,13 @@ func cmdbootstrap() {
> +               xprintf("\n")
> +       }
> +
> +-      gogcflags = os.Getenv("GO_GCFLAGS") // we were using
> $BOOT_GO_GCFLAGS until now
> +-      goldflags = os.Getenv("GO_LDFLAGS")
> ++      // For split host/target cross/cross-canadian builds, we don't
> ++      // want to be setting these flags until after we have compiled
> ++      // the toolchain that runs on the build host.
> ++      if ! crossBuild {
> ++              gogcflags = os.Getenv("GO_GCFLAGS") // we were using
> $BOOT_GO_GCFLAGS until now
> ++              goldflags = os.Getenv("GO_LDFLAGS")
> ++      }
> +       goBootstrap := pathf("%s/go_bootstrap", tooldir)
> +       cmdGo := pathf("%s/go", gobin)
> +       if debug {
> +@@ -1212,7 +1240,11 @@ func cmdbootstrap() {
> +               xprintf("\n")
> +       }
> +       xprintf("Building Go toolchain2 using go_bootstrap and Go
> toolchain1.\n")
> +-      os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
> ++      if crossBuild {
> ++              os.Setenv("CC", defaultcc[""])
> ++      } else {
> ++              os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
> ++      }
> +       goInstall(goBootstrap, append([]string{"-i"}, toolchain...)...)
> +       if debug {
> +               run("", ShowOutput|CheckExit, pathf("%s/compile",
> tooldir), "-V=full")
> +@@ -1249,45 +1281,82 @@ func cmdbootstrap() {
> +       }
> +       checkNotStale(goBootstrap, append(toolchain,
> "runtime/internal/sys")...)
> +
> +-      if goos == oldgoos && goarch == oldgoarch {
> +-              // Common case - not setting up for cross-compilation.
> +-              timelog("build", "toolchain")
> +-              if vflag > 0 {
> +-                      xprintf("\n")
> ++      if crossBuild {
> ++              gogcflags = os.Getenv("GO_GCFLAGS")
> ++              goldflags = os.Getenv("GO_LDFLAGS")
> ++              tool_files, _ := filepath.Glob(pathf("%s/*", tooldir))
> ++              for _, f := range tool_files {
> ++                      copyfile(pathf("%s/%s", build_tooldir,
> filepath.Base(f)), f, writeExec)
> ++                      xremove(f)
> ++              }
> ++              os.Setenv("GOTOOLDIR", build_tooldir)
> ++              goBootstrap = pathf("%s/go_bootstrap", build_tooldir)
> ++              if hostOnly {
> ++                      timelog("build", "host toolchain")
> ++                      if vflag > 0 {
> ++                              xprintf("\n")
> ++                      }
> ++                      xprintf("Building %s for host, %s/%s.\n",
> strings.Join(toBuild, ","), goos, goarch)
> ++                      goInstall(goBootstrap, toBuild...)
> ++                      checkNotStale(goBootstrap, toBuild...)
> ++                      // Skip cmdGo staleness checks here, since we
> can't necessarily run the cmdGo binary
> ++
> ++                      timelog("build", "target toolchain")
> ++                      if vflag > 0 {
> ++                              xprintf("\n")
> ++                      }
> ++              } else if targetOnly {
> ++                      goos = oldgoos
> ++                      goarch = oldgoarch
> ++                      os.Setenv("GOOS", goos)
> ++                      os.Setenv("GOARCH", goarch)
> ++                      os.Setenv("CC", compilerEnvLookup(defaultcc, goos,
> goarch))
> ++                      xprintf("Building %s for target, %s/%s.\n",
> strings.Join(toBuild, ","), goos, goarch)
> ++                      goInstall(goBootstrap, toBuild...)
> ++                      checkNotStale(goBootstrap, toBuild...)
> ++                      // Skip cmdGo staleness checks here, since we
> can't run the target's cmdGo binary
> +               }
> +-              xprintf("Building packages and commands for %s/%s.\n",
> goos, goarch)
> +       } else {
> +-              // GOOS/GOARCH does not match GOHOSTOS/GOHOSTARCH.
> +-              // Finish GOHOSTOS/GOHOSTARCH installation and then
> +-              // run GOOS/GOARCH installation.
> +-              timelog("build", "host toolchain")
> +-              if vflag > 0 {
> +-                      xprintf("\n")
> ++              if goos == oldgoos && goarch == oldgoarch {
> ++                      // Common case - not setting up for
> cross-compilation.
> ++                      timelog("build", "toolchain")
> ++                      if vflag > 0 {
> ++                              xprintf("\n")
> ++                      }
> ++                      xprintf("Building packages and commands for
> %s/%s.\n", goos, goarch)
> ++              } else {
> ++                      // GOOS/GOARCH does not match GOHOSTOS/GOHOSTARCH.
> ++                      // Finish GOHOSTOS/GOHOSTARCH installation and then
> ++                      // run GOOS/GOARCH installation.
> ++                      timelog("build", "host toolchain")
> ++                      if vflag > 0 {
> ++                              xprintf("\n")
> ++                      }
> ++                      xprintf("Building packages and commands for host,
> %s/%s.\n", goos, goarch)
> ++                      goInstall(goBootstrap, "std", "cmd")
> ++                      checkNotStale(goBootstrap, "std", "cmd")
> ++                      checkNotStale(cmdGo, "std", "cmd")
> ++
> ++                      timelog("build", "target toolchain")
> ++                      if vflag > 0 {
> ++                              xprintf("\n")
> ++                      }
> ++                      goos = oldgoos
> ++                      goarch = oldgoarch
> ++                      os.Setenv("GOOS", goos)
> ++                      os.Setenv("GOARCH", goarch)
> ++                      os.Setenv("CC", compilerEnvLookup(defaultcc, goos,
> goarch))
> ++                      xprintf("Building packages and commands for
> target, %s/%s.\n", goos, goarch)
> +               }
> +-              xprintf("Building packages and commands for host,
> %s/%s.\n", goos, goarch)
> +               goInstall(goBootstrap, "std", "cmd")
> +               checkNotStale(goBootstrap, "std", "cmd")
> +               checkNotStale(cmdGo, "std", "cmd")
> +-
> +-              timelog("build", "target toolchain")
> +-              if vflag > 0 {
> +-                      xprintf("\n")
> ++              if debug {
> ++                      run("", ShowOutput|CheckExit, pathf("%s/compile",
> tooldir), "-V=full")
> ++                      run("", ShowOutput|CheckExit, pathf("%s/buildid",
> tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos,
> goarch))
> ++                      checkNotStale(goBootstrap, append(toolchain,
> "runtime/internal/sys")...)
> ++                      copyfile(pathf("%s/compile4", tooldir),
> pathf("%s/compile", tooldir), writeExec)
> +               }
> +-              goos = oldgoos
> +-              goarch = oldgoarch
> +-              os.Setenv("GOOS", goos)
> +-              os.Setenv("GOARCH", goarch)
> +-              os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
> +-              xprintf("Building packages and commands for target,
> %s/%s.\n", goos, goarch)
> +-      }
> +-      goInstall(goBootstrap, "std", "cmd")
> +-      checkNotStale(goBootstrap, "std", "cmd")
> +-      checkNotStale(cmdGo, "std", "cmd")
> +-      if debug {
> +-              run("", ShowOutput|CheckExit, pathf("%s/compile",
> tooldir), "-V=full")
> +-              run("", ShowOutput|CheckExit, pathf("%s/buildid",
> tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos,
> goarch))
> +-              checkNotStale(goBootstrap, append(toolchain,
> "runtime/internal/sys")...)
> +-              copyfile(pathf("%s/compile4", tooldir),
> pathf("%s/compile", tooldir), writeExec)
> +       }
> +
> +       // Check that there are no new files in $GOROOT/bin other than
> +@@ -1305,7 +1374,11 @@ func cmdbootstrap() {
> +       }
> +
> +       // Remove go_bootstrap now that we're done.
> +-      xremove(pathf("%s/go_bootstrap", tooldir))
> ++      // Except that for split host/target cross-builds, we need to
> ++      // keep it.
> ++      if ! crossBuild {
> ++              xremove(pathf("%s/go_bootstrap", tooldir))
> ++      }
> +
> +       // Print trailing banner unless instructed otherwise.
> +       if !noBanner {
> +--
> +2.14.1
> +
> diff --git a/meta/recipes-devtools/go/go-1.10/0007-cmd-go-make-GOROOT-precious-by-default.patch
> b/meta/recipes-devtools/go/go-1.10/0007-cmd-go-make-GOROOT-
> precious-by-default.patch
> new file mode 100644
> index 0000000000..cadca3012b
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.10/0007-cmd-go-make-GOROOT-
> precious-by-default.patch
> @@ -0,0 +1,97 @@
> +From 71653883c263093624e6c92d4cd5187433887690 Mon Sep 17 00:00:00 2001
> +From: Matt Madison <matt@madison.systems>
> +Date: Sun, 18 Feb 2018 15:03:14 -0800
> +Subject: [PATCH 7/8] cmd/go: make GOROOT precious by default
> +
> +The go build tool normally rebuilds whatever it detects is
> +stale.  This can be a problem when GOROOT is intended to
> +be read-only and the go runtime has been built as a shared
> +library, since we don't want every application to be rebuilding
> +the shared runtime - particularly in cross-build/packaging
> +setups, since that would lead to 'abi mismatch' runtime errors.
> +
> +This patch adds logic to treat the standard library and all
> +other GOROOT-resident packages as essentially binary-only.
> +If, during compilation, any of those packages are 'stale',
> +an error is issued instead of rebuilding the stale components.
> +
> +For an OE build, staleness errors would indicate a problem
> +with the build (missing dependencies, sstate issues, etc.).
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Matt Madison <matt@madison.systems>
> +---
> + src/cmd/go/internal/work/build.go   |  5 +++++
> + src/cmd/go/internal/work/buildid.go |  2 +-
> + src/cmd/go/internal/work/exec.go    | 18 ++++++++++++++++++
> + 3 files changed, 24 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/cmd/go/internal/work/build.go
> b/src/cmd/go/internal/work/build.go
> +index 57b7b00879..e2ba95420e 100644
> +--- a/src/cmd/go/internal/work/build.go
> ++++ b/src/cmd/go/internal/work/build.go
> +@@ -143,6 +143,7 @@ See also: go install, go get, go clean.
> + }
> +
> + const concurrentGCBackendCompilationEnabledByDefault = true
> ++var goRootPrecious bool = true
> +
> + func init() {
> +       // break init cycle
> +@@ -156,6 +157,10 @@ func init() {
> +
> +       AddBuildFlags(CmdBuild)
> +       AddBuildFlags(CmdInstall)
> ++
> ++      if x := os.Getenv("GOROOT_OVERRIDE"); x != "" {
> ++              goRootPrecious = false
> ++      }
> + }
> +
> + // Note that flags consulted by other parts of the code
> +diff --git a/src/cmd/go/internal/work/buildid.go
> b/src/cmd/go/internal/work/buildid.go
> +index 39ca20ee4f..a047430177 100644
> +--- a/src/cmd/go/internal/work/buildid.go
> ++++ b/src/cmd/go/internal/work/buildid.go
> +@@ -463,7 +463,7 @@ func (b *Builder) useCache(a *Action, p
> *load.Package, actionHash cache.ActionID
> +
> +       if b.ComputeStaleOnly {
> +               // Invoked during go list only to compute and record
> staleness.
> +-              if p := a.Package; p != nil && !p.Stale {
> ++              if p := a.Package; p != nil && !p.Stale &&
> !(goRootPrecious && (p.Standard || p.Goroot)) {
> +                       p.Stale = true
> +                       if cfg.BuildA {
> +                               p.StaleReason = "build -a flag in use"
> +diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/
> exec.go
> +index b0f6b45647..a876d59347 100644
> +--- a/src/cmd/go/internal/work/exec.go
> ++++ b/src/cmd/go/internal/work/exec.go
> +@@ -371,6 +371,24 @@ func (b *Builder) build(a *Action) (err error) {
> +               return fmt.Errorf("missing or invalid binary-only package")
> +       }
> +
> ++      if goRootPrecious && (a.Package.Standard || a.Package.Goroot) {
> ++              _, err := os.Stat(a.Package.Target)
> ++              if err == nil {
> ++                      a.built = a.Package.Target
> ++                      a.Target = a.Package.Target
> ++                      a.buildID = b.fileHash(a.Package.Target)
> ++                      a.Package.Stale = false
> ++                      a.Package.StaleReason = "GOROOT-resident package"
> ++                      return nil
> ++              }
> ++              if b.ComputeStaleOnly {
> ++                      a.Package.Stale = true
> ++                      a.Package.StaleReason = "missing or invalid
> GOROOT-resident package"
> ++                      return nil
> ++              }
> ++              return fmt.Errorf("missing or invalid GOROOT-resident
> package")
> ++      }
> ++
> +       if err := b.Mkdir(a.Objdir); err != nil {
> +               return err
> +       }
> +--
> +2.14.1
> +
> diff --git a/meta/recipes-devtools/go/go-1.10/0008-ld-replace-glibc-dynamic-linker-with-musl.patch
> b/meta/recipes-devtools/go/go-1.10/0008-ld-replace-glibc-
> dynamic-linker-with-musl.patch
> new file mode 100644
> index 0000000000..cc7179cb2c
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.10/0008-ld-replace-glibc-
> dynamic-linker-with-musl.patch
> @@ -0,0 +1,130 @@
> +From 5c3ed89c29d4f40ea4e66d569b1f6c9c4a51cd42 Mon Sep 17 00:00:00 2001
> +From: Matt Madison <matt@madison.systems>
> +Date: Sun, 18 Feb 2018 08:24:05 -0800
> +Subject: [PATCH 8/8] ld: replace glibc dynamic linker with musl
> +
> +Rework of patch by Khem Raj <raj.khem@gmail.com>
> +for go 1.10.  Should be applied conditionally on
> +musl being the system C library.
> +
> +Upstream-Status: Inappropriate [Real fix should be portable across libcs]
> +
> +Signed-off-by: Matt Madison <matt@madison.systems>
> +---
> + src/cmd/link/internal/amd64/obj.go  | 2 +-
> + src/cmd/link/internal/arm/obj.go    | 2 +-
> + src/cmd/link/internal/arm64/obj.go  | 2 +-
> + src/cmd/link/internal/mips/obj.go   | 2 +-
> + src/cmd/link/internal/mips64/obj.go | 2 +-
> + src/cmd/link/internal/ppc64/obj.go  | 2 +-
> + src/cmd/link/internal/s390x/obj.go  | 2 +-
> + src/cmd/link/internal/x86/obj.go    | 2 +-
> + 8 files changed, 8 insertions(+), 8 deletions(-)
> +
> +diff --git a/src/cmd/link/internal/amd64/obj.go
> b/src/cmd/link/internal/amd64/obj.go
> +index 87e809166a..f522a63034 100644
> +--- a/src/cmd/link/internal/amd64/obj.go
> ++++ b/src/cmd/link/internal/amd64/obj.go
> +@@ -62,7 +62,7 @@ func Init() (*sys.Arch, ld.Arch) {
> +               PEreloc1:         pereloc1,
> +               TLSIEtoLE:        tlsIEtoLE,
> +
> +-              Linuxdynld:     "/lib64/ld-linux-x86-64.so.2",
> ++              Linuxdynld:     "/lib64/ld-musl-x86-64.so.1",
> +               Freebsddynld:   "/libexec/ld-elf.so.1",
> +               Openbsddynld:   "/usr/libexec/ld.so",
> +               Netbsddynld:    "/libexec/ld.elf_so",
> +diff --git a/src/cmd/link/internal/arm/obj.go
> b/src/cmd/link/internal/arm/obj.go
> +index da16f92345..fd14940ede 100644
> +--- a/src/cmd/link/internal/arm/obj.go
> ++++ b/src/cmd/link/internal/arm/obj.go
> +@@ -58,7 +58,7 @@ func Init() (*sys.Arch, ld.Arch) {
> +               Gentext:          gentext,
> +               Machoreloc1:      machoreloc1,
> +
> +-              Linuxdynld:     "/lib/ld-linux.so.3", // 2 for OABI, 3 for
> EABI
> ++              Linuxdynld:     "/lib/ld-musl-armhf.so.1",
> +               Freebsddynld:   "/usr/libexec/ld-elf.so.1",
> +               Openbsddynld:   "/usr/libexec/ld.so",
> +               Netbsddynld:    "/libexec/ld.elf_so",
> +diff --git a/src/cmd/link/internal/arm64/obj.go
> b/src/cmd/link/internal/arm64/obj.go
> +index 6b386ad737..99863712cc 100644
> +--- a/src/cmd/link/internal/arm64/obj.go
> ++++ b/src/cmd/link/internal/arm64/obj.go
> +@@ -57,7 +57,7 @@ func Init() (*sys.Arch, ld.Arch) {
> +               Gentext:          gentext,
> +               Machoreloc1:      machoreloc1,
> +
> +-              Linuxdynld: "/lib/ld-linux-aarch64.so.1",
> ++              Linuxdynld: "/lib/ld-musl-aarch64.so.1",
> +
> +               Freebsddynld:   "XXX",
> +               Openbsddynld:   "XXX",
> +diff --git a/src/cmd/link/internal/mips/obj.go
> b/src/cmd/link/internal/mips/obj.go
> +index c5d3451c39..fd85e6368d 100644
> +--- a/src/cmd/link/internal/mips/obj.go
> ++++ b/src/cmd/link/internal/mips/obj.go
> +@@ -60,7 +60,7 @@ func Init() (*sys.Arch, ld.Arch) {
> +               Gentext:          gentext,
> +               Machoreloc1:      machoreloc1,
> +
> +-              Linuxdynld: "/lib/ld.so.1",
> ++              Linuxdynld: "/lib/ld-musl-mipsle.so.1",
> +
> +               Freebsddynld:   "XXX",
> +               Openbsddynld:   "XXX",
> +diff --git a/src/cmd/link/internal/mips64/obj.go b/src/cmd/link/internal/
> mips64/obj.go
> +index 83974e5b56..097224f6da 100644
> +--- a/src/cmd/link/internal/mips64/obj.go
> ++++ b/src/cmd/link/internal/mips64/obj.go
> +@@ -59,7 +59,7 @@ func Init() (*sys.Arch, ld.Arch) {
> +               Gentext:          gentext,
> +               Machoreloc1:      machoreloc1,
> +
> +-              Linuxdynld:     "/lib64/ld64.so.1",
> ++              Linuxdynld:     "/lib64/ld-musl-mips64le.so.1",
> +               Freebsddynld:   "XXX",
> +               Openbsddynld:   "XXX",
> +               Netbsddynld:    "XXX",
> +diff --git a/src/cmd/link/internal/ppc64/obj.go
> b/src/cmd/link/internal/ppc64/obj.go
> +index 273d9b42cb..a503abe8ea 100644
> +--- a/src/cmd/link/internal/ppc64/obj.go
> ++++ b/src/cmd/link/internal/ppc64/obj.go
> +@@ -62,7 +62,7 @@ func Init() (*sys.Arch, ld.Arch) {
> +               Machoreloc1:      machoreloc1,
> +
> +               // TODO(austin): ABI v1 uses /usr/lib/ld.so.1,
> +-              Linuxdynld: "/lib64/ld64.so.1",
> ++              Linuxdynld: "/lib64/ld-musl-powerpc64le.so.1",
> +
> +               Freebsddynld:   "XXX",
> +               Openbsddynld:   "XXX",
> +diff --git a/src/cmd/link/internal/s390x/obj.go
> b/src/cmd/link/internal/s390x/obj.go
> +index 9ac7eb8217..3825ff7abe 100644
> +--- a/src/cmd/link/internal/s390x/obj.go
> ++++ b/src/cmd/link/internal/s390x/obj.go
> +@@ -57,7 +57,7 @@ func Init() (*sys.Arch, ld.Arch) {
> +               Gentext:          gentext,
> +               Machoreloc1:      machoreloc1,
> +
> +-              Linuxdynld: "/lib64/ld64.so.1",
> ++              Linuxdynld: "/lib64/ld-musl-s390x.so.1",
> +
> +               // not relevant for s390x
> +               Freebsddynld:   "XXX",
> +diff --git a/src/cmd/link/internal/x86/obj.go
> b/src/cmd/link/internal/x86/obj.go
> +index 6a744dc04e..d81f392549 100644
> +--- a/src/cmd/link/internal/x86/obj.go
> ++++ b/src/cmd/link/internal/x86/obj.go
> +@@ -58,7 +58,7 @@ func Init() (*sys.Arch, ld.Arch) {
> +               Machoreloc1:      machoreloc1,
> +               PEreloc1:         pereloc1,
> +
> +-              Linuxdynld:   "/lib/ld-linux.so.2",
> ++              Linuxdynld:   "/lib/ld-musl-i386.so.1",
> +               Freebsddynld: "/usr/libexec/ld-elf.so.1",
> +               Openbsddynld: "/usr/libexec/ld.so",
> +               Netbsddynld:  "/usr/libexec/ld.elf_so",
> +--
> +2.14.1
> +
> diff --git a/meta/recipes-devtools/go/go-1.9.inc
> b/meta/recipes-devtools/go/go-1.9.inc
> deleted file mode 100644
> index 2823304b7c..0000000000
> --- a/meta/recipes-devtools/go/go-1.9.inc
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -require go-common.inc
> -
> -GO_BASEVERSION = "1.9"
> -GO_MINOR = ".4"
> -PV .= "${GO_MINOR}"
> -
> -FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
> -
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
> -
> -SRC_URI += "\
> -        file://0001-make.bash-quote-CC_FOR_TARGET.patch \
> -        file://0002-cmd-go-fix-CC-and-CXX-environment-variable-construct.patch
> \
> -        file://0003-make.bash-better-separate-host-and-target-builds.patch
> \
> -        file://0004-cmd-go-allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
> \
> -        file://0005-cmd-go-make-GOROOT-precious-by-default.patch \
> -        file://0006-make.bash-add-GOTOOLDIR_BOOTSTRAP-environment-variab.patch
> \
> -        file://0007-ld-add-soname-to-shareable-objects.patch \
> -        file://0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch
> \
> -        file://0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch
> \
> -        file://0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
> \
> -"
> -SRC_URI_append_libc-musl = " file://set-external-linker.patch"
> -
> -SRC_URI[main.md5sum] = "6816441fd6680c63865cdd5cb8bc1960"
> -SRC_URI[main.sha256sum] = "0573a8df33168977185aa44173305e
> 5a0450f55213600e94541604b75d46dc06"
> diff --git a/meta/recipes-devtools/go/go-1.9/0001-make.bash-quote-CC_FOR_TARGET.patch
> b/meta/recipes-devtools/go/go-1.9/0001-make.bash-quote-CC_FOR_TARGET.patch
> deleted file mode 100644
> index 7800975e48..0000000000
> --- a/meta/recipes-devtools/go/go-1.9/0001-make.bash-quote-CC_
> FOR_TARGET.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From d24734ad44006791fd48fc45ea34fe608ff672fb Mon Sep 17 00:00:00 2001
> -From: Matt Madison <matt@madison.systems>
> -Date: Wed, 13 Sep 2017 08:04:23 -0700
> -Subject: [PATCH 1/7] make.bash: quote CC_FOR_TARGET
> -
> -For OE cross-builds, $CC_FOR_TARGET has more than
> -one word and needs to be quoted.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Signed-off-by: Matt Madison <matt@madison.systems>
> ----
> - src/make.bash | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/make.bash b/src/make.bash
> -index 71e7531..dcf3256 100755
> ---- a/src/make.bash
> -+++ b/src/make.bash
> -@@ -175,7 +175,7 @@ echo "##### Building packages and commands for
> $GOOS/$GOARCH."
> -
> - old_bin_files=$(cd $GOROOT/bin && echo *)
> -
> --CC=$CC_FOR_TARGET "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcflags
> "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
> -+CC="$CC_FOR_TARGET" "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcflags
> "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
> -
> - # Check that there are no new files in $GOROOT/bin other than go and
> gofmt
> - # and $GOOS_$GOARCH (a directory used when cross-compiling).
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-devtools/go/go-1.9/0002-cmd-go-fix-CC-and-
> CXX-environment-variable-construct.patch b/meta/recipes-devtools/go/go-
> 1.9/0002-cmd-go-fix-CC-and-CXX-environment-variable-construct.patch
> deleted file mode 100644
> index a4e42261c3..0000000000
> --- a/meta/recipes-devtools/go/go-1.9/0002-cmd-go-fix-CC-and-
> CXX-environment-variable-construct.patch
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -From a7170d32a13aead608abd18996f6dab2e2a631b5 Mon Sep 17 00:00:00 2001
> -From: Matt Madison <matt@madison.systems>
> -Date: Wed, 13 Sep 2017 08:06:37 -0700
> -Subject: [PATCH 2/7] cmd/go: fix CC and CXX environment variable
> construction
> -
> -For OE cross-builds, CC and CXX have multiple words, and
> -we need their complete definitions when setting up the
> -environment during Go builds.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Signed-off-by: Matt Madison <matt@madison.systems>
> ----
> - src/cmd/go/internal/envcmd/env.go |  4 ++--
> - src/cmd/go/internal/work/build.go | 12 ++++++++++++
> - 2 files changed, 14 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/cmd/go/internal/envcmd/env.go
> b/src/cmd/go/internal/envcmd/env.go
> -index 43d4334..529d21d 100644
> ---- a/src/cmd/go/internal/envcmd/env.go
> -+++ b/src/cmd/go/internal/envcmd/env.go
> -@@ -74,10 +74,10 @@ func MkEnv() []cfg.EnvVar {
> -       }
> -
> -       cmd := b.GccCmd(".")
> --      env = append(env, cfg.EnvVar{Name: "CC", Value: cmd[0]})
> -+      env = append(env, cfg.EnvVar{Name: "CC", Value:
> strings.Join(b.GccCmdForReal(), " ")})
> -       env = append(env, cfg.EnvVar{Name: "GOGCCFLAGS", Value:
> strings.Join(cmd[3:], " ")})
> -       cmd = b.GxxCmd(".")
> --      env = append(env, cfg.EnvVar{Name: "CXX", Value: cmd[0]})
> -+      env = append(env, cfg.EnvVar{Name: "CXX", Value:
> strings.Join(b.GxxCmdForReal(), " ")})
> -
> -       if cfg.BuildContext.CgoEnabled {
> -               env = append(env, cfg.EnvVar{Name: "CGO_ENABLED", Value:
> "1"})
> -diff --git a/src/cmd/go/internal/work/build.go
> b/src/cmd/go/internal/work/build.go
> -index 7d667ff..85df0b3 100644
> ---- a/src/cmd/go/internal/work/build.go
> -+++ b/src/cmd/go/internal/work/build.go
> -@@ -3127,12 +3127,24 @@ func (b *Builder) GccCmd(objdir string) []string {
> -       return b.ccompilerCmd("CC", cfg.DefaultCC, objdir)
> - }
> -
> -+// gccCmd returns a gcc command line prefix
> -+// defaultCC is defined in zdefaultcc.go, written by cmd/dist.
> -+func (b *Builder) GccCmdForReal() []string {
> -+      return envList("CC", cfg.DefaultCC)
> -+}
> -+
> - // gxxCmd returns a g++ command line prefix
> - // defaultCXX is defined in zdefaultcc.go, written by cmd/dist.
> - func (b *Builder) GxxCmd(objdir string) []string {
> -       return b.ccompilerCmd("CXX", cfg.DefaultCXX, objdir)
> - }
> -
> -+// gxxCmd returns a g++ command line prefix
> -+// defaultCXX is defined in zdefaultcc.go, written by cmd/dist.
> -+func (b *Builder) GxxCmdForReal() []string {
> -+      return envList("CXX", cfg.DefaultCXX)
> -+}
> -+
> - // gfortranCmd returns a gfortran command line prefix.
> - func (b *Builder) gfortranCmd(objdir string) []string {
> -       return b.ccompilerCmd("FC", "gfortran", objdir)
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-devtools/go/go-1.9/0003-make.bash-better-
> separate-host-and-target-builds.patch b/meta/recipes-devtools/go/go-
> 1.9/0003-make.bash-better-separate-host-and-target-builds.patch
> deleted file mode 100644
> index ffd9f2359c..0000000000
> --- a/meta/recipes-devtools/go/go-1.9/0003-make.bash-better-
> separate-host-and-target-builds.patch
> +++ /dev/null
> @@ -1,92 +0,0 @@
> -From 31e88f06af7ab787d8fe0c1ca625193e1799e167 Mon Sep 17 00:00:00 2001
> -From: Matt Madison <matt@madison.systems>
> -Date: Wed, 13 Sep 2017 08:12:04 -0700
> -Subject: [PATCH 3/7] make.bash: better separate host and target builds
> -
> -Fore OE cross-builds, the simple checks in make.bash are
> -insufficient for distinguishing host and target build
> -environments, so add some options for telling the
> -script which parts are being built.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Signed-off-by: Matt Madison <matt@madison.systems>
> ----
> - src/make.bash | 51 ++++++++++++++++++++++++++++-----------------------
> - 1 file changed, 28 insertions(+), 23 deletions(-)
> -
> -diff --git a/src/make.bash b/src/make.bash
> -index dcf3256..9553623 100755
> ---- a/src/make.bash
> -+++ b/src/make.bash
> -@@ -156,13 +156,22 @@ if [ "$1" = "--no-clean" ]; then
> -       buildall=""
> -       shift
> - fi
> --./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds
> go_bootstrap
> -+do_host_build="yes"
> -+do_target_build="yes"
> -+if [ "$1" = "--target-only" ]; then
> -+      do_host_build="no"
> -+      shift
> -+elif [ "$1" = "--host-only" ]; then
> -+      do_target_build="no"
> -+      shift
> -+fi
> -
> --# Delay move of dist tool to now, because bootstrap may clear tool
> directory.
> --mv cmd/dist/dist "$GOTOOLDIR"/dist
> --echo
> -+if [ "$do_host_build" = "yes" ]; then
> -+      ./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds
> go_bootstrap
> -+      # Delay move of dist tool to now, because bootstrap may clear tool
> directory.
> -+      mv cmd/dist/dist "$GOTOOLDIR"/dist
> -+      echo
> -
> --if [ "$GOHOSTARCH" != "$GOARCH" -o "$GOHOSTOS" != "$GOOS" ]; then
> -       echo "##### Building packages and commands for host,
> $GOHOSTOS/$GOHOSTARCH."
> -       # CC_FOR_TARGET is recorded as the default compiler for the go
> tool. When building for the host, however,
> -       # use the host compiler, CC, from `cmd/dist/dist env` instead.
> -@@ -171,24 +180,20 @@ if [ "$GOHOSTARCH" != "$GOARCH" -o "$GOHOSTOS" !=
> "$GOOS" ]; then
> -       echo
> - fi
> -
> --echo "##### Building packages and commands for $GOOS/$GOARCH."
> --
> --old_bin_files=$(cd $GOROOT/bin && echo *)
> --
> --CC="$CC_FOR_TARGET" "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcflags
> "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
> --
> --# Check that there are no new files in $GOROOT/bin other than go and
> gofmt
> --# and $GOOS_$GOARCH (a directory used when cross-compiling).
> --(cd $GOROOT/bin && for f in *; do
> --      if ! expr " $old_bin_files go gofmt ${GOOS}_${GOARCH} " : ".* $f "
> >/dev/null 2>/dev/null; then
> --              echo 1>&2 "ERROR: unexpected new file in $GOROOT/bin: $f"
> --              exit 1
> --      fi
> --done)
> --
> --echo
> --
> --rm -f "$GOTOOLDIR"/go_bootstrap
> -+if [ "$do_target_build" = "yes" ]; then
> -+    GO_INSTALL="${GO_TARGET_INSTALL:-std cmd}"
> -+    echo "##### Building packages and commands for $GOOS/$GOARCH."
> -+    if [ "$GOHOSTOS" = "$GOOS" -a "$GOHOSTARCH" = "$GOARCH" -a
> "$do_host_build" = "yes" ]; then
> -+      rm -rf ./host-tools
> -+      mkdir ./host-tools
> -+      mv "$GOTOOLDIR"/* ./host-tools
> -+      GOTOOLDIR="$PWD/host-tools"
> -+    fi
> -+    GOTOOLDIR="$GOTOOLDIR" CC="$CC_FOR_TARGET" "$GOTOOLDIR"/go_bootstrap
> install $GO_FLAGS -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v
> ${GO_INSTALL}
> -+    echo
> -+
> -+    rm -f "$GOTOOLDIR"/go_bootstrap
> -+fi
> -
> - if [ "$1" != "--no-banner" ]; then
> -       "$GOTOOLDIR"/dist banner
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-devtools/go/go-1.9/0004-cmd-go-allow-
> GOTOOLDIR-to-be-overridden-in-the-envir.patch
> b/meta/recipes-devtools/go/go-1.9/0004-cmd-go-allow-
> GOTOOLDIR-to-be-overridden-in-the-envir.patch
> deleted file mode 100644
> index 180b06a4d3..0000000000
> --- a/meta/recipes-devtools/go/go-1.9/0004-cmd-go-allow-
> GOTOOLDIR-to-be-overridden-in-the-envir.patch
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -From 1369178b497b12088ec4c2794606cc9f14cc327c Mon Sep 17 00:00:00 2001
> -From: Matt Madison <matt@madison.systems>
> -Date: Wed, 13 Sep 2017 08:15:03 -0700
> -Subject: [PATCH 4/7] cmd/go: allow GOTOOLDIR to be overridden in the
> - environment
> -
> -For OE cross-builds, host-side tools reside in the native
> -GOROOT, not the target GOROOT.  Allow GOTOOLDIR to be set
> -in the environment to allow that split, rather than always
> -computing GOTOOLDIR relative to the GOROOT setting.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Signed-off-by: Matt Madison <matt@madison.systems>
> ----
> - src/cmd/go/internal/cfg/cfg.go    | 7 ++++++-
> - src/cmd/go/internal/work/build.go | 2 +-
> - src/go/build/build.go             | 2 +-
> - 3 files changed, 8 insertions(+), 3 deletions(-)
> -
> -diff --git a/src/cmd/go/internal/cfg/cfg.go
> b/src/cmd/go/internal/cfg/cfg.go
> -index b3ad1ce..c1dc974 100644
> ---- a/src/cmd/go/internal/cfg/cfg.go
> -+++ b/src/cmd/go/internal/cfg/cfg.go
> -@@ -91,7 +91,12 @@ func init() {
> -       // as the tool directory does not move based on environment
> variables.
> -       // This matches the initialization of ToolDir in go/build,
> -       // except for using GOROOT rather than runtime.GOROOT().
> --      build.ToolDir = filepath.Join(GOROOT, "pkg/tool/"+runtime.GOOS+"_"+
> runtime.GOARCH)
> -+      s := os.Getenv("GOTOOLDIR")
> -+      if s == "" {
> -+              build.ToolDir = filepath.Join(GOROOT,
> "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
> -+      } else {
> -+              build.ToolDir = s
> -+      }
> - }
> -
> - func findGOROOT() string {
> -diff --git a/src/cmd/go/internal/work/build.go
> b/src/cmd/go/internal/work/build.go
> -index 85df0b3..7b9a69e 100644
> ---- a/src/cmd/go/internal/work/build.go
> -+++ b/src/cmd/go/internal/work/build.go
> -@@ -1337,7 +1337,7 @@ func (b *Builder) build(a *Action) (err error) {
> -               }
> -
> -               var cgoExe string
> --              if a.cgo != nil && a.cgo.Target != "" {
> -+              if a.cgo != nil && a.cgo.Target != "" &&
> os.Getenv("GOTOOLDIR") == "" {
> -                       cgoExe = a.cgo.Target
> -               } else {
> -                       cgoExe = base.Tool("cgo")
> -diff --git a/src/go/build/build.go b/src/go/build/build.go
> -index fd89871..e16145b 100644
> ---- a/src/go/build/build.go
> -+++ b/src/go/build/build.go
> -@@ -1588,7 +1588,7 @@ func init() {
> - }
> -
> - // ToolDir is the directory containing build tools.
> --var ToolDir = filepath.Join(runtime.GOROOT(),
> "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
> -+var ToolDir = envOr("GOTOOLDIR", filepath.Join(runtime.GOROOT(),
> "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH))
> -
> - // IsLocalImport reports whether the import path is
> - // a local import path, like ".", "..", "./foo", or "../foo".
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-devtools/go/go-1.9/0005-cmd-go-make-GOROOT-precious-by-default.patch
> b/meta/recipes-devtools/go/go-1.9/0005-cmd-go-make-GOROOT-
> precious-by-default.patch
> deleted file mode 100644
> index 6e93bcb6ce..0000000000
> --- a/meta/recipes-devtools/go/go-1.9/0005-cmd-go-make-GOROOT-
> precious-by-default.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 44f961975dac6cf464a77b5f6dd0c47cc192c4fd Mon Sep 17 00:00:00 2001
> -From: Matt Madison <matt@madison.systems>
> -Date: Wed, 13 Sep 2017 08:19:52 -0700
> -Subject: [PATCH 5/7] cmd/go: make GOROOT precious by default
> -
> -For OE builds, we never want packages that have
> -already been installed into the build root to be
> -modified, so prevent the go build tool from checking
> -if they should be rebuilt.
> -
> -Also add an environment variable to override this
> -behavior, just for building the Go runtime.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Matt Madison <matt@madison.systems>
> ----
> - src/cmd/go/internal/load/pkg.go | 7 +++++++
> - 1 file changed, 7 insertions(+)
> -
> -diff --git a/src/cmd/go/internal/load/pkg.go b/src/cmd/go/internal/load/
> pkg.go
> -index 60de666..2660d3f 100644
> ---- a/src/cmd/go/internal/load/pkg.go
> -+++ b/src/cmd/go/internal/load/pkg.go
> -@@ -1530,6 +1530,13 @@ func isStale(p *Package) (bool, string) {
> -               return true, "build ID mismatch"
> -       }
> -
> -+      // For OE builds, make anything in GOROOT non-stale,
> -+      // to prevent a package build from overwriting the
> -+      // build root.
> -+      if p.Goroot && os.Getenv("GOROOT_OVERRIDE") != "1" {
> -+              return false, "GOROOT-resident packages do not get rebuilt"
> -+      }
> -+
> -       // Package is stale if a dependency is.
> -       for _, p1 := range p.Internal.Deps {
> -               if p1.Stale {
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-devtools/go/go-1.9/0006-make.bash-add-
> GOTOOLDIR_BOOTSTRAP-environment-variab.patch
> b/meta/recipes-devtools/go/go-1.9/0006-make.bash-add-GOTOOLDIR_BOOTSTRAP-
> environment-variab.patch
> deleted file mode 100644
> index f0f564044b..0000000000
> --- a/meta/recipes-devtools/go/go-1.9/0006-make.bash-add-
> GOTOOLDIR_BOOTSTRAP-environment-variab.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From aae74d1045ca03306ba4159206ee3bac72bcdfbb Mon Sep 17 00:00:00 2001
> -From: Matt Madison <matt@madison.systems>
> -Date: Wed, 13 Sep 2017 08:23:23 -0700
> -Subject: [PATCH 6/7] make.bash: add GOTOOLDIR_BOOTSTRAP environment
> variable
> -
> -For cross-canadian builds, we need to use the native
> -GOTOOLDIR during the bootstrap phase, so provide a way
> -to pass that setting into the build script.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Matt Madison <matt@madison.systems>
> ----
> - src/make.bash | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/src/make.bash b/src/make.bash
> -index 9553623..2e6fb05 100755
> ---- a/src/make.bash
> -+++ b/src/make.bash
> -@@ -172,10 +172,11 @@ if [ "$do_host_build" = "yes" ]; then
> -       mv cmd/dist/dist "$GOTOOLDIR"/dist
> -       echo
> -
> -+      GOTOOLDIR_BOOTSTRAP="${GOTOOLDIR_BOOTSTRAP:-$GOTOOLDIR}"
> -       echo "##### Building packages and commands for host,
> $GOHOSTOS/$GOHOSTARCH."
> -       # CC_FOR_TARGET is recorded as the default compiler for the go
> tool. When building for the host, however,
> -       # use the host compiler, CC, from `cmd/dist/dist env` instead.
> --      CC=$CC GOOS=$GOHOSTOS GOARCH=$GOHOSTARCH \
> -+      CC=$CC GOOS=$GOHOSTOS GOARCH=$GOHOSTARCH GOTOOLDIR="$GOTOOLDIR_BOOTSTRAP"
> \
> -               "$GOTOOLDIR"/go_bootstrap install -gcflags "$GO_GCFLAGS"
> -ldflags "$GO_LDFLAGS" -v std cmd
> -       echo
> - fi
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-devtools/go/go-1.9/0007-ld-add-soname-to-shareable-objects.patch
> b/meta/recipes-devtools/go/go-1.9/0007-ld-add-soname-to-
> shareable-objects.patch
> deleted file mode 100644
> index 6459782d81..0000000000
> --- a/meta/recipes-devtools/go/go-1.9/0007-ld-add-soname-to-
> shareable-objects.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From e957c3458d53e37bf416f51d2f8bf54c195e50f5 Mon Sep 17 00:00:00 2001
> -From: Matt Madison <matt@madison.systems>
> -Date: Wed, 13 Sep 2017 08:27:02 -0700
> -Subject: [PATCH 7/7] ld: add soname to shareable objects
> -
> -Shared library handling in OE depends on the inclusion
> -of an soname header, so update the go linker to add that
> -header for both internal and external linking.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Matt Madison <matt@madison.systems>
> ----
> - src/cmd/link/internal/ld/lib.go | 3 +++
> - 1 file changed, 3 insertions(+)
> -
> -diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/ld/
> lib.go
> -index 0234105..0b9e2d0 100644
> ---- a/src/cmd/link/internal/ld/lib.go
> -+++ b/src/cmd/link/internal/ld/lib.go
> -@@ -1124,12 +1124,14 @@ func (l *Link) hostlink() {
> -                       // Pass -z nodelete to mark the shared library as
> -                       // non-closeable: a dlclose will do nothing.
> -                       argv = append(argv, "-shared", "-Wl,-z,nodelete")
> -+                      argv = append(argv, fmt.Sprintf("-Wl,-soname,%s",
> filepath.Base(*flagOutfile)))
> -               }
> -       case BuildmodeShared:
> -               if UseRelro() {
> -                       argv = append(argv, "-Wl,-z,relro")
> -               }
> -               argv = append(argv, "-shared")
> -+              argv = append(argv, fmt.Sprintf("-Wl,-soname,%s",
> filepath.Base(*flagOutfile)))
> -       case BuildmodePlugin:
> -               if Headtype == objabi.Hdarwin {
> -                       argv = append(argv, "-dynamiclib")
> -@@ -1138,6 +1140,7 @@ func (l *Link) hostlink() {
> -                               argv = append(argv, "-Wl,-z,relro")
> -                       }
> -                       argv = append(argv, "-shared")
> -+                      argv = append(argv, fmt.Sprintf("-Wl,-soname,%s",
> filepath.Base(*flagOutfile)))
> -               }
> -       }
> -
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-devtools/go/go-1.9/0008-make.bash-add-
> GOHOSTxx-indirection-for-cross-canadia.patch
> b/meta/recipes-devtools/go/go-1.9/0008-make.bash-add-
> GOHOSTxx-indirection-for-cross-canadia.patch
> deleted file mode 100644
> index 0977c78350..0000000000
> --- a/meta/recipes-devtools/go/go-1.9/0008-make.bash-add-
> GOHOSTxx-indirection-for-cross-canadia.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 03e6c339d4fb712fbb8c4ca6ef2fc7100dcdb3d7 Mon Sep 17 00:00:00 2001
> -From: Matt Madison <matt@madison.systems>
> -Date: Thu, 14 Sep 2017 05:38:10 -0700
> -Subject: [PATCH 8/8] make.bash: add GOHOSTxx indirection for
> cross-canadian
> - builds
> -
> -Add environment variables for specifying the host OS/arch
> -that we are building the compiler for, so it can differ from
> -the build host OS/arch.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Matt Madison <matt@madison.systems>
> ----
> - src/make.bash | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/src/make.bash b/src/make.bash
> -index 2e6fb05..0bdadc6 100755
> ---- a/src/make.bash
> -+++ b/src/make.bash
> -@@ -173,6 +173,8 @@ if [ "$do_host_build" = "yes" ]; then
> -       echo
> -
> -       GOTOOLDIR_BOOTSTRAP="${GOTOOLDIR_BOOTSTRAP:-$GOTOOLDIR}"
> -+      GOHOSTOS="${GOHOSTOS_CROSS:-$GOHOSTOS}"
> -+      GOHOSTARCH="${GOHOSTARCH_CROSS:-$GOHOSTARCH}"
> -       echo "##### Building packages and commands for host,
> $GOHOSTOS/$GOHOSTARCH."
> -       # CC_FOR_TARGET is recorded as the default compiler for the go
> tool. When building for the host, however,
> -       # use the host compiler, CC, from `cmd/dist/dist env` instead.
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-devtools/go/go-1.9/0009-cmd-go-buildmode-pie-
> forces-external-linking-mode-on.patch b/meta/recipes-devtools/go/go-
> 1.9/0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch
> deleted file mode 100644
> index aa5fcfdd23..0000000000
> --- a/meta/recipes-devtools/go/go-1.9/0009-cmd-go-buildmode-pie-
> forces-external-linking-mode-on.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From aae44527c8065d54f6acaf87c82cba1ac96fae59 Mon Sep 17 00:00:00 2001
> -From: Ian Lance Taylor <iant@golang.org>
> -Date: Fri, 18 Aug 2017 17:46:03 -0700
> -Subject: [PATCH] cmd/go: -buildmode=pie forces external linking mode on
> all
> - systems
> -
> -The go tool assumed that -buildmode=pie implied internal linking on
> -linux-amd64. However, that was changed by CL 36417 for issue #18968.
> -
> -Fixes #21452
> -
> -Change-Id: I8ed13aea52959cc5c53223f4c41ba35329445545
> -Reviewed-on: https://go-review.googlesource.com/57231
> -Run-TryBot: Ian Lance Taylor <iant@golang.org>
> -TryBot-Result: Gobot Gobot <gobot@golang.org>
> -Reviewed-by: Avelino <t@avelino.xxx>
> -Reviewed-by: Rob Pike <r@golang.org>
> ----
> -Upstream-Status: Backport
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> - src/cmd/go/internal/load/pkg.go | 7 ++++---
> - 1 file changed, 4 insertions(+), 3 deletions(-)
> -
> -diff --git a/src/cmd/go/internal/load/pkg.go b/src/cmd/go/internal/load/
> pkg.go
> -index 2660d3f..d40773b 100644
> ---- a/src/cmd/go/internal/load/pkg.go
> -+++ b/src/cmd/go/internal/load/pkg.go
> -@@ -954,11 +954,12 @@ func (p *Package) load(stk *ImportStack, bp
> *build.Package, err error) *Package
> -
> -       if cfg.BuildContext.CgoEnabled && p.Name == "main" && !p.Goroot {
> -               // Currently build modes c-shared, pie (on systems that do
> not
> --              // support PIE with internal linking mode), plugin, and
> --              // -linkshared force external linking mode, as of course
> does
> -+              // support PIE with internal linking mode (currently all
> -+              // systems: issue #18968)), plugin, and -linkshared force
> -+              // external linking mode, as of course does
> -               // -ldflags=-linkmode=external. External linking mode
> forces
> -               // an import of runtime/cgo.
> --              pieCgo := cfg.BuildBuildmode == "pie" &&
> (cfg.BuildContext.GOOS != "linux" || cfg.BuildContext.GOARCH != "amd64")
> -+              pieCgo := cfg.BuildBuildmode == "pie"
> -               linkmodeExternal := false
> -               for i, a := range cfg.BuildLdflags {
> -                       if a == "-linkmode=external" {
> ---
> -2.14.1
> -
> diff --git a/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-
> CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go-
> 1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
> deleted file mode 100644
> index 83fd78c3d7..0000000000
> --- a/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-
> CC-when-building-dist-and-go_boot.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From 21d83dd9499e5be30eea28dd7034d1ea2a01c838 Mon Sep 17 00:00:00 2001
> -From: Matt Madison <matt@madison.systems>
> -Date: Tue, 14 Nov 2017 07:38:42 -0800
> -Subject: [PATCH 10/10] make.bash: override CC when building dist and
> - go_bootstrap
> -
> -For cross-canadian builds, dist and go_bootstrap
> -run on the build host, so CC needs to point to the
> -build host's C compiler.  Add a BUILD_CC environment
> -for this, falling back to $CC if not present.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Matt Madison <matt@madison.systems>
> ----
> - src/make.bash | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/make.bash b/src/make.bash
> -index 0bdadc6..f199349 100755
> ---- a/src/make.bash
> -+++ b/src/make.bash
> -@@ -131,7 +131,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ]; then
> -       exit 1
> - fi
> - rm -f cmd/dist/dist
> --GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH="" "$GOROOT_BOOTSTRAP/bin/go"
> build -o cmd/dist/dist ./cmd/dist
> -+CC=${BUILD_CC:-${CC}} GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH=""
> "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
> -
> - # -e doesn't propagate out of eval, so check success by hand.
> - eval $(./cmd/dist/dist env -p || echo FAIL=true)
> -@@ -167,7 +167,7 @@ elif [ "$1" = "--host-only" ]; then
> - fi
> -
> - if [ "$do_host_build" = "yes" ]; then
> --      ./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds
> go_bootstrap
> -+      CC=${BUILD_CC:-${CC}} ./cmd/dist/dist bootstrap $buildall
> $GO_DISTFLAGS -v # builds go_bootstrap
> -       # Delay move of dist tool to now, because bootstrap may clear tool
> directory.
> -       mv cmd/dist/dist "$GOTOOLDIR"/dist
> -       echo
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-devtools/go/go-1.9/set-external-linker.patch
> b/meta/recipes-devtools/go/go-1.9/set-external-linker.patch
> deleted file mode 100644
> index d6bd7fa39c..0000000000
> --- a/meta/recipes-devtools/go/go-1.9/set-external-linker.patch
> +++ /dev/null
> @@ -1,111 +0,0 @@
> -Change the dynamic linker hardcoding to use musl when not using glibc
> -this should be applied conditional to musl being the system C library
> -
> -Upstream-Status: Inappropriate [Real Fix should be portable across libcs]
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Index: go/src/cmd/link/internal/amd64/obj.go
> -===================================================================
> ---- go.orig/src/cmd/link/internal/amd64/obj.go
> -+++ go/src/cmd/link/internal/amd64/obj.go
> -@@ -67,7 +67,7 @@ func Init() {
> -       ld.Thearch.Append64 = ld.Append64l
> -       ld.Thearch.TLSIEtoLE = tlsIEtoLE
> -
> --      ld.Thearch.Linuxdynld = "/lib64/ld-linux-x86-64.so.2"
> -+      ld.Thearch.Linuxdynld = "/lib/ld-musl-x86_64.so.1"
> -       ld.Thearch.Freebsddynld = "/libexec/ld-elf.so.1"
> -       ld.Thearch.Openbsddynld = "/usr/libexec/ld.so"
> -       ld.Thearch.Netbsddynld = "/libexec/ld.elf_so"
> -Index: go/src/cmd/link/internal/arm/obj.go
> -===================================================================
> ---- go.orig/src/cmd/link/internal/arm/obj.go
> -+++ go/src/cmd/link/internal/arm/obj.go
> -@@ -63,7 +63,7 @@ func Init() {
> -       ld.Thearch.Append32 = ld.Append32l
> -       ld.Thearch.Append64 = ld.Append64l
> -
> --      ld.Thearch.Linuxdynld = "/lib/ld-linux.so.3" // 2 for OABI, 3 for
> EABI
> -+      ld.Thearch.Linuxdynld = "/lib/ld-musl-armhf.so.1"
> -       ld.Thearch.Freebsddynld = "/usr/libexec/ld-elf.so.1"
> -       ld.Thearch.Openbsddynld = "/usr/libexec/ld.so"
> -       ld.Thearch.Netbsddynld = "/libexec/ld.elf_so"
> -Index: go/src/cmd/link/internal/arm64/obj.go
> -===================================================================
> ---- go.orig/src/cmd/link/internal/arm64/obj.go
> -+++ go/src/cmd/link/internal/arm64/obj.go
> -@@ -62,7 +62,7 @@ func Init() {
> -       ld.Thearch.Append32 = ld.Append32l
> -       ld.Thearch.Append64 = ld.Append64l
> -
> --      ld.Thearch.Linuxdynld = "/lib/ld-linux-aarch64.so.1"
> -+      ld.Thearch.Linuxdynld = "/lib/ld-musl-aarch64.so.1"
> -
> -       ld.Thearch.Freebsddynld = "XXX"
> -       ld.Thearch.Openbsddynld = "XXX"
> -Index: go/src/cmd/link/internal/mips/obj.go
> -===================================================================
> ---- go.orig/src/cmd/link/internal/mips/obj.go
> -+++ go/src/cmd/link/internal/mips/obj.go
> -@@ -77,7 +77,7 @@ func Init() {
> -               ld.Thearch.Append64 = ld.Append64b
> -       }
> -
> --      ld.Thearch.Linuxdynld = "/lib/ld.so.1"
> -+      ld.Thearch.Linuxdynld = "/lib/ld-musl-mipsle.so.1"
> -
> -       ld.Thearch.Freebsddynld = "XXX"
> -       ld.Thearch.Openbsddynld = "XXX"
> -Index: go/src/cmd/link/internal/mips64/obj.go
> -===================================================================
> ---- go.orig/src/cmd/link/internal/mips64/obj.go
> -+++ go/src/cmd/link/internal/mips64/obj.go
> -@@ -75,7 +75,7 @@ func Init() {
> -               ld.Thearch.Append64 = ld.Append64b
> -       }
> -
> --      ld.Thearch.Linuxdynld = "/lib64/ld64.so.1"
> -+      ld.Thearch.Linuxdynld = "/lib64/ld-musl-mips64le.so.1"
> -
> -       ld.Thearch.Freebsddynld = "XXX"
> -       ld.Thearch.Openbsddynld = "XXX"
> -Index: go/src/cmd/link/internal/ppc64/obj.go
> -===================================================================
> ---- go.orig/src/cmd/link/internal/ppc64/obj.go
> -+++ go/src/cmd/link/internal/ppc64/obj.go
> -@@ -77,7 +77,7 @@ func Init() {
> -       }
> -
> -       // TODO(austin): ABI v1 uses /usr/lib/ld.so.1
> --      ld.Thearch.Linuxdynld = "/lib64/ld64.so.1"
> -+      ld.Thearch.Linuxdynld = "/lib/ld-musl-powerpc64le.so.1"
> -
> -       ld.Thearch.Freebsddynld = "XXX"
> -       ld.Thearch.Openbsddynld = "XXX"
> -Index: go/src/cmd/link/internal/s390x/obj.go
> -===================================================================
> ---- go.orig/src/cmd/link/internal/s390x/obj.go
> -+++ go/src/cmd/link/internal/s390x/obj.go
> -@@ -62,7 +62,7 @@ func Init() {
> -       ld.Thearch.Append32 = ld.Append32b
> -       ld.Thearch.Append64 = ld.Append64b
> -
> --      ld.Thearch.Linuxdynld = "/lib64/ld64.so.1"
> -+      ld.Thearch.Linuxdynld = "/lib/ld-musl-s390x.so.1"
> -
> -       // not relevant for s390x
> -       ld.Thearch.Freebsddynld = "XXX"
> -Index: go/src/cmd/link/internal/x86/obj.go
> -===================================================================
> ---- go.orig/src/cmd/link/internal/x86/obj.go
> -+++ go/src/cmd/link/internal/x86/obj.go
> -@@ -63,7 +63,7 @@ func Init() {
> -       ld.Thearch.Append32 = ld.Append32l
> -       ld.Thearch.Append64 = ld.Append64l
> -
> --      ld.Thearch.Linuxdynld = "/lib/ld-linux.so.2"
> -+      ld.Thearch.Linuxdynld = "/lib/ld-musl-i386.so.1"
> -       ld.Thearch.Freebsddynld = "/usr/libexec/ld-elf.so.1"
> -       ld.Thearch.Openbsddynld = "/usr/libexec/ld.so"
> -       ld.Thearch.Netbsddynld = "/usr/libexec/ld.elf_so"
> diff --git a/meta/recipes-devtools/go/go-common.inc
> b/meta/recipes-devtools/go/go-common.inc
> index 37138b51ed..611775b2cc 100644
> --- a/meta/recipes-devtools/go/go-common.inc
> +++ b/meta/recipes-devtools/go/go-common.inc
> @@ -22,6 +22,8 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.src\.tar"
>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>  SSTATE_SCAN_CMD = "true"
>
> +export GOROOT_OVERRIDE = "1"
> +
>  do_compile_prepend() {
>         BUILD_CC=${BUILD_CC}
>  }
> diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc
> b/meta/recipes-devtools/go/go-cross-canadian.inc
> index 8afda6b2ce..c84aa4c9eb 100644
> --- a/meta/recipes-devtools/go/go-cross-canadian.inc
> +++ b/meta/recipes-devtools/go/go-cross-canadian.inc
> @@ -7,34 +7,34 @@ PN = "go-cross-canadian-${TRANSLATED_TARGET_ARCH}"
>
>  export GOHOSTOS = "${BUILD_GOOS}"
>  export GOHOSTARCH = "${BUILD_GOARCH}"
> -export GOHOSTOS_CROSS = "${HOST_GOOS}"
> -export GOHOSTARCH_CROSS = "${HOST_GOARCH}"
>  export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
>  export GOTOOLDIR_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/${
> HOST_SYS}/go/pkg/tool/${BUILD_GOTUPLE}"
>  export GOROOT_FINAL = "${libdir}/go"
>  export CGO_ENABLED = "1"
> -export CC_FOR_TARGET = "${TARGET_PREFIX}gcc"
> -export CXX_FOR_TARGET = "${TARGET_PREFIX}g++"
> -CC = "${HOST_PREFIX}gcc"
> -export CGO_CFLAGS = "--sysroot=${STAGING_DIR_TARGET} ${HOST_CC_ARCH}
> ${CFLAGS}"
> -export CGO_LDFLAGS = "--sysroot=${STAGING_DIR_TARGET} ${HOST_CC_ARCH}
> ${LDFLAGS}"
> -export GO_LDFLAGS = '-linkmode external -extld ${HOST_PREFIX}gcc
> -extldflags "--sysroot=${STAGING_DIR_TARGET} ${HOST_CC_ARCH} ${LDFLAGS}"'
> +export GOCACHE = "off"
> +export GOTMPDIR ?= "${WORKDIR}/go-tmp"
> +GOTMPDIR[vardepvalue] = ""
> +#CC = "${HOST_PREFIX}gcc"
> +export CGO_CFLAGS = "${CFLAGS}"
> +export CGO_LDFLAGS = "${LDFLAGS}"
> +export GO_LDFLAGS = '-v -linkmode external -extld ${HOST_PREFIX}gcc
> -extldflags "--sysroot=${STAGING_DIR_HOST} ${HOST_CC_ARCH} ${LDFLAGS}"'
>
>  do_configure[noexec] = "1"
>
>  do_compile() {
> -       export GOBIN="${B}/bin"
> -       rm -rf ${GOBIN} ${B}/pkg
> -       mkdir ${GOBIN}
> +       export CC_FOR_${HOST_GOOS}_${HOST_GOARCH}="${HOST_PREFIX}gcc
> --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE}"
> +       export CXX_FOR_${HOST_GOOS}_${HOST_GOARCH}="${HOST_PREFIX}gxx
> --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE}"
>         cd src
>         ./make.bash --host-only --no-banner
>         cd ${B}
>  }
> +do_compile[dirs] =+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
> +do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin ${B}/pkg"
>
>
>  make_wrapper() {
> -    rm -f ${D}${bindir}/$2
> -    cat <<END >${D}${bindir}/$2
> +       rm -f ${D}${bindir}/$2
> +       cat <<END >${D}${bindir}/$2
>  #!/bin/sh
>  here=\`dirname \$0\`
>  native_goroot=\`readlink -f \$here/../../lib/${TARGET_SYS}/go\`
> @@ -46,7 +46,7 @@ export GOTOOLDIR="\$native_goroot/
> pkg/tool/${HOST_GOTUPLE}"
>  test -n "\$GOROOT" || export GOROOT="\$OECORE_TARGET_
> SYSROOT/${target_libdir}/go"
>  \$here/../../lib/${TARGET_SYS}/go/bin/$1 "\$@"
>  END
> -    chmod +x ${D}${bindir}/$2
> +       chmod +x ${D}${bindir}/$2
>  }
>
>  do_install() {
> diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.9.bb
> b/meta/recipes-devtools/go/go-cross-canadian_1.10.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-cross-canadian_1.9.bb
> rename to meta/recipes-devtools/go/go-cross-canadian_1.10.bb
> diff --git a/meta/recipes-devtools/go/go-cross.inc
> b/meta/recipes-devtools/go/go-cross.inc
> index 3ac7211bc3..fe92651581 100644
> --- a/meta/recipes-devtools/go/go-cross.inc
> +++ b/meta/recipes-devtools/go/go-cross.inc
> @@ -1,7 +1,7 @@
>  inherit cross
>
>  PROVIDES = "virtual/${TARGET_PREFIX}go"
> -DEPENDS += "go-native"
> +DEPENDS = "go-native"
>
>  PN = "go-cross-${TARGET_ARCH}"
>
> @@ -13,26 +13,27 @@ export GOARM = "${TARGET_GOARM}"
>  export GO386 = "${TARGET_GO386}"
>  export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
>  export GOROOT_FINAL = "${libdir}/go"
> +export GOCACHE = "off"
> +export GOTMPDIR ?= "${WORKDIR}/go-tmp"
> +GOTMPDIR[vardepvalue] = ""
>  export CGO_ENABLED = "1"
> -export CC_FOR_TARGET="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH}
> --sysroot=${STAGING_DIR_TARGET}"
> -export CXX_FOR_TARGET="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH}
> --sysroot=${STAGING_DIR_TARGET}"
>  CC = "${@d.getVar('BUILD_CC').strip()}"
>
>  do_configure[noexec] = "1"
>
>  do_compile() {
> -    export GOBIN="${B}/bin"
> -    rm -rf ${GOBIN} ${B}/pkg
> -    mkdir ${GOBIN}
> -    cd src
> -    ./make.bash --host-only
> -    cd ${B}
> +       export CC_FOR_${GOOS}_${GOARCH}="${TARGET_PREFIX}gcc
> ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
> +       export CXX_FOR_${GOOS}_${GOARCh}="${TARGET_PREFIX}g++
> ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
> +       cd src
> +       ./make.bash --host-only --no-banner
> +       cd ${B}
>  }
> -
> +do_compile[dirs] =+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
> +do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin ${B}/pkg"
>
>  make_wrapper() {
> -    rm -f ${D}${bindir}/$2
> -    cat <<END >${D}${bindir}/$2
> +       rm -f ${D}${bindir}/$2
> +       cat <<END >${D}${bindir}/$2
>  #!/bin/bash
>  here=\`dirname \$0\`
>  export GOARCH="${TARGET_GOARCH}"
> @@ -41,22 +42,22 @@ export GOARM="\${GOARM:-${TARGET_GOARM}}"
>  export GO386="\${GO386:-${TARGET_GO386}}"
>  \$here/../../lib/${CROSS_TARGET_SYS_DIR}/go/bin/$1 "\$@"
>  END
> -    chmod +x ${D}${bindir}/$2
> +       chmod +x ${D}${bindir}/$2
>  }
>
>  do_install() {
> -    install -d ${D}${libdir}/go
> -    cp --preserve=mode,timestamps -R ${B}/pkg ${D}${libdir}/go/
> -    install -d ${D}${libdir}/go/src
> -    (cd ${S}/src; for d in *; do \
> -        [ ! -d $d ] || cp --preserve=mode,timestamps -R ${S}/src/$d
> ${D}${libdir}/go/src/; \
> -    done)
> -    rm -rf ${D}${libdir}/go/src/runtime/pprof/testdata
> -    install -d ${D}${bindir} ${D}${libdir}/go/bin
> -    for f in ${B}/bin/*
> -    do
> -        base=`basename $f`
> -        install -m755 $f ${D}${libdir}/go/bin
> -        make_wrapper $base ${TARGET_PREFIX}$base
> -    done
> +       install -d ${D}${libdir}/go
> +       cp --preserve=mode,timestamps -R ${B}/pkg ${D}${libdir}/go/
> +       install -d ${D}${libdir}/go/src
> +       (cd ${S}/src; for d in *; do \
> +               [ ! -d $d ] || cp --preserve=mode,timestamps -R
> ${S}/src/$d ${D}${libdir}/go/src/; \
> +       done)
> +       find ${D}${libdir}/go/src -depth -type d -name testdata -exec rm
> -rf {} \;
> +       install -d ${D}${bindir} ${D}${libdir}/go/bin
> +       for f in ${B}/bin/*
> +       do
> +               base=`basename $f`
> +               install -m755 $f ${D}${libdir}/go/bin
> +               make_wrapper $base ${TARGET_PREFIX}$base
> +       done
>  }
> diff --git a/meta/recipes-devtools/go/go-cross_1.9.bb
> b/meta/recipes-devtools/go/go-cross_1.10.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-cross_1.9.bb
> rename to meta/recipes-devtools/go/go-cross_1.10.bb
> diff --git a/meta/recipes-devtools/go/go-crosssdk.inc
> b/meta/recipes-devtools/go/go-crosssdk.inc
> index f67e4b92a0..05ca62eba8 100644
> --- a/meta/recipes-devtools/go/go-crosssdk.inc
> +++ b/meta/recipes-devtools/go/go-crosssdk.inc
> @@ -11,21 +11,21 @@ export GOARCH = "${TARGET_GOARCH}"
>  export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
>  export GOROOT_FINAL = "${libdir}/go"
>  export CGO_ENABLED = "1"
> -export CC_FOR_TARGET="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH}
> --sysroot=${STAGING_DIR_TARGET}${SDKPATHNATIVE}"
> -export CXX_FOR_TARGET="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH}
> --sysroot=${STAGING_DIR_TARGET}${SDKPATHNATIVE}"
> -export GO_INSTALL = "cmd"
> -CC = "${@d.getVar('BUILD_CC').strip()}"
> +export GOCACHE = "off"
> +export GOTMPDIR ?= "${WORKDIR}/go-tmp"
> +GOTMPDIR[vardepvalue] = ""
>
>  do_configure[noexec] = "1"
>
>  do_compile() {
> -       export GOBIN="${B}/bin"
> -       rm -rf ${GOBIN} ${B}/pkg
> -       mkdir ${GOBIN}
> +       export CC_FOR_${TARGET_GOOS}_${TARGET_GOARCH}="${TARGET_PREFIX}gcc
> ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}${SDKPATHNATIVE}"
> +       export CXX_FOR_${TARGET_GOOS}_${TARGET_GOARCH}="${TARGET_PREFIX}g++
> ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}${SDKPATHNATIVE}"
>         cd src
> -       ./make.bash --host-only
> +       ./make.bash --host-only --no-banner
>         cd ${B}
>  }
> +do_compile[dirs] =+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
> +do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin ${B}/pkg"
>
>  make_wrapper() {
>      rm -f ${D}${bindir}/$2
> diff --git a/meta/recipes-devtools/go/go-crosssdk_1.9.bb
> b/meta/recipes-devtools/go/go-crosssdk_1.10.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-crosssdk_1.9.bb
> rename to meta/recipes-devtools/go/go-crosssdk_1.10.bb
> diff --git a/meta/recipes-devtools/go/go-native.inc
> b/meta/recipes-devtools/go/go-native.inc
> index 95db1c2b7c..31e899da82 100644
> --- a/meta/recipes-devtools/go/go-native.inc
> +++ b/meta/recipes-devtools/go/go-native.inc
> @@ -4,34 +4,33 @@ nonstaging_libdir := "${libdir}"
>
>  inherit native
>
> -SRC_URI_append = " http://golang.org/dl/go1.4.3.
> src.tar.gz;name=bootstrap;subdir=go1.4"
> -SRC_URI[bootstrap.md5sum] = "dfb604511115dd402a77a553a5923a04"
> -SRC_URI[bootstrap.sha256sum] = "9947fc705b0b841b5938c48b22dc33
> e9647ec0752bae66e50278df4f23f64959"
> +SRC_URI_append = " https://dl.google.com/go/go1.
> 4-bootstrap-20171003.tar.gz;name=bootstrap;subdir=go1.4"
> +SRC_URI[bootstrap.md5sum] = "dbf727a4b0e365bf88d97cbfde590016"
> +SRC_URI[bootstrap.sha256sum] = "f4ff5b5eb3a3cae1c993723f3eab51
> 9c5bae18866b5e5f96fe1102f0cb5c3e52"
>
>  export GOOS = "${BUILD_GOOS}"
>  export GOARCH = "${BUILD_GOARCH}"
> +export GOTMPDIR ?= "${WORKDIR}/go-tmp"
> +GOTMPDIR[vardepvalue] = ""
>  CC = "${@d.getVar('BUILD_CC').strip()}"
>
>  export CGO_ENABLED = "1"
>
>  do_configure() {
> -    cd ${WORKDIR}/go1.4/go/src
> -    CGO_ENABLED=0 GOROOT=${WORKDIR}/go1.4/go ./make.bash
> +       cd ${WORKDIR}/go1.4/go/src
> +       CGO_ENABLED=0 GOROOT=${WORKDIR}/go1.4/go ./make.bash
>  }
>
>  do_compile() {
> -       export GOBIN="${B}/bin"
>         export GOROOT_FINAL="${nonstaging_libdir}/go"
>         export GOROOT_BOOTSTRAP="${WORKDIR}/go1.4/go"
> -       rm -rf ${GOBIN}
> -       mkdir ${GOBIN}
> -
> -       export TMPDIR=${WORKDIR}/build-tmp
> -       mkdir -p ${WORKDIR}/build-tmp
>
>         cd src
> -       ./make.bash --host-only
> +       ./make.bash --no-banner
> +       cd ${B}
>  }
> +do_compile[dirs] =+ "${GOTMPDIR} ${B}/bin"
> +do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin"
>
>  make_wrapper() {
>         rm -f ${D}${bindir}/$2$3
> @@ -51,7 +50,7 @@ do_install() {
>         (cd ${S}/src; for d in *; do \
>                 [ -d $d ] && cp -a ${S}/src/$d ${D}${libdir}/go/src/; \
>         done)
> -       rm -rf ${D}${libdir}/go/src/runtime/pprof/testdata
> +       find ${D}${libdir}/go/src -depth -type d -name testdata -exec rm
> -rf {} \;
>         install -d ${D}${bindir} ${D}${libdir}/go/bin
>         for f in ${B}/bin/*
>         do
> diff --git a/meta/recipes-devtools/go/go-native_1.9.bb
> b/meta/recipes-devtools/go/go-native_1.10.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-native_1.9.bb
> rename to meta/recipes-devtools/go/go-native_1.10.bb
> diff --git a/meta/recipes-devtools/go/go-runtime.inc
> b/meta/recipes-devtools/go/go-runtime.inc
> index 29ae86e4ee..7a3b415b3f 100644
> --- a/meta/recipes-devtools/go/go-runtime.inc
> +++ b/meta/recipes-devtools/go/go-runtime.inc
> @@ -10,11 +10,18 @@ export GOARM = "${TARGET_GOARM}"
>  export GO386 = "${TARGET_GO386}"
>  export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
>  export GOROOT_FINAL = "${libdir}/go"
> -export GO_TARGET_INSTALL = "std"
>  export CGO_ENABLED = "1"
> -export CC_FOR_TARGET="${CC}"
> -export CXX_FOR_TARGET="${CXX}"
> -export GOROOT_OVERRIDE = "1"
> +export CGO_CFLAGS = "${CFLAGS}"
> +export CGO_CPPFLAGS = "${CPPFLAGS}"
> +export CGO_CXXFLAGS = "${CXXFLAGS}"
> +export CGO_LDFLAGS = "${LDFLAGS}"
> +export GOCACHE = "off"
> +export GOTMPDIR ?= "${WORKDIR}/go-tmp"
> +GOTMPDIR[vardepvalue] = ""
> +GO_EXTLDFLAGS ?= "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${LDFLAGS}"
> +GO_LINKMODE ?= ""
> +GO_LINKMODE_class-nativesdk = "--linkmode=external"
> +GO_LDFLAGS ?= '-ldflags="${GO_LINKMODE} -extldflags '${GO_EXTLDFLAGS}'"'
>
>  do_configure() {
>         :
> @@ -25,21 +32,20 @@ do_configure_libc-musl() {
>  }
>
>  do_compile() {
> -       export GOBIN="${B}/bin"
> -       export CC="${@d.getVar('BUILD_CC').strip()}"
> -       rm -rf ${GOBIN} ${B}/pkg
> -       mkdir ${GOBIN}
> +       export CC_FOR_${TARGET_GOOS}_${TARGET_GOARCH}="${CC}"
> +       export CXX_FOR_${TARGET_GOOS}_${TARGET_GOARCH}="${CXX}"
> +
>         cd src
> -       ./make.bash --host-only
> -       cp ${B}/pkg/tool/${BUILD_GOTUPLE}/go_bootstrap ${B}
> -       rm -rf ${B}/pkg/${TARGET_GOTUPLE}
> -       ./make.bash --target-only
> +       ./make.bash --target-only --no-banner std
>         if [ -n "${GO_DYNLINK}" ]; then
> -               cp ${B}/go_bootstrap ${B}/pkg/tool/${BUILD_GOTUPLE}
> -               GO_FLAGS="-buildmode=shared" GO_LDFLAGS="-extldflags
> \"${LDFLAGS}\"" ./make.bash --target-only
> +               export GOTOOLDIR="${B}/pkg/tool/native_native"
> +               CC="$CC_FOR_${TARGET_GOOS}_${TARGET_GOARCH}"
> GOARCH="${TARGET_GOARCH}" GOOS="${TARGET_GOOS}" GOROOT=${B} \
> +                       $GOTOOLDIR/go_bootstrap install -linkshared
> -buildmode=shared ${GO_LDFLAGS} std
>         fi
>         cd ${B}
>  }
> +do_compile[dirs] =+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
> +do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin ${B}/pkg"
>
>  do_install() {
>         install -d ${D}${libdir}/go/src
> @@ -54,20 +60,10 @@ do_install() {
>         find src -mindepth 1 -maxdepth 1 -type d | while read srcdir; do
>                 cp --preserve=mode,timestamps -R $srcdir
> ${D}${libdir}/go/src/
>         done
> +       find ${D}${libdir}/go/src -depth -type d -name testdata -exec rm
> -rf {} \;
>         rm -f ${D}${libdir}/go/src/cmd/dist/dist
>  }
>
> -# Remove test binaries that cannot be relocated
> -do_install_append_class-nativesdk() {
> -       rm -rf ${D}${libdir}/go/src/runtime/pprof/testdata
> -}
> -
> -# These testdata directories aren't needed for builds and contain binaries
> -# that can cause errors in sysroot_strip(), so just remove them.
> -sysroot_stage_all_append() {
> -       find ${SYSROOT_DESTDIR}${libdir}/go/src -depth -type d -name
> 'testdata' -exec rm -rf {} \;
> -}
> -
>  ALLOW_EMPTY_${PN} = "1"
>  FILES_${PN} = "${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*${SOLIBSDEV}"
>  FILES_${PN}-dev = "${libdir}/go/src ${libdir}/go/pkg/include \
> @@ -78,8 +74,6 @@ FILES_${PN}-dev = "${libdir}/go/src
> ${libdir}/go/pkg/include \
>                     ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*.shlibname
> \
>                     ${libdir}/go/pkg/${TARGET_
> GOTUPLE}_dynlink/*/*/*/*/*/*.shlibname \
>                     ${libdir}/go/pkg/${TARGET_
> GOTUPLE}_dynlink/*/*/*/*/*/*/*.shlibname \
> -"
> -FILES_${PN}-staticdev = "${libdir}/go/pkg/${TARGET_GOTUPLE} \
>                     ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*.a \
>                     ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*.a \
>                     ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*.a \
> @@ -88,11 +82,15 @@ FILES_${PN}-staticdev = "${libdir}/go/pkg/${TARGET_GOTUPLE}
> \
>                     ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*/*.a
> \
>                     ${libdir}/go/pkg/${TARGET_
> GOTUPLE}_dynlink/*/*/*/*/*/*/*.a \
>  "
> -# The testdata directories in the source tree include some binaries for
> various
> -# architectures, scripts, and .a files
> -INSANE_SKIP_${PN}-dev = "staticdev ldflags file-rdeps arch"
> +FILES_${PN}-staticdev = "${libdir}/go/pkg/${TARGET_GOTUPLE}"
> +
> +# Go sources include some scripts and pre-built binaries for
> +# multiple architectures.  The static .a files for dynamically-linked
> +# runtime are also required in -dev.
> +INSANE_SKIP_${PN}-dev = "staticdev file-rdeps arch"
>
>  INHIBIT_PACKAGE_STRIP = "1"
>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +INHIBIT_SYSROOT_STRIP = "1"
>
>  BBCLASSEXTEND = "nativesdk"
> diff --git a/meta/recipes-devtools/go/go-runtime_1.9.bb
> b/meta/recipes-devtools/go/go-runtime_1.10.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-runtime_1.9.bb
> rename to meta/recipes-devtools/go/go-runtime_1.10.bb
> diff --git a/meta/recipes-devtools/go/go-target.inc
> b/meta/recipes-devtools/go/go-target.inc
> index cac5d78227..a53a314c78 100644
> --- a/meta/recipes-devtools/go/go-target.inc
> +++ b/meta/recipes-devtools/go/go-target.inc
> @@ -11,10 +11,9 @@ export GO386 = "${TARGET_GO386}"
>  export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
>  export GOROOT_FINAL = "${libdir}/go"
>  export CGO_ENABLED = "1"
> -export CC_FOR_TARGET = "${CC}"
> -export CXX_FOR_TARGET = "${CXX}"
> -export GO_TARGET_INSTALL = "cmd"
> -export GO_FLAGS = "-a"
> +export GOCACHE = "off"
> +export GOTMPDIR ?= "${WORKDIR}/go-tmp"
> +GOTMPDIR[vardepvalue] = ""
>  GO_LDFLAGS = ""
>  GO_LDFLAGS_class-nativesdk = "-linkmode external"
>  export GO_LDFLAGS
> @@ -25,24 +24,22 @@ SECURITY_LDFLAGS = ""
>  do_configure[noexec] = "1"
>
>  do_compile() {
> -       export GOBIN="${B}/bin"
> -       export CC="${@d.getVar('BUILD_CC').strip()}"
> -       rm -rf ${GOBIN} ${B}/pkg
> -       mkdir ${GOBIN}
> -
> -       export TMPDIR=${WORKDIR}/build-tmp
> -       mkdir -p ${WORKDIR}/build-tmp
> +       export CC_FOR_${TARGET_GOOS}_${TARGET_GOARCH}="${CC}"
> +       export CXX_FOR_${TARGET_GOOS}_${TARGET_GOARCH}="${CXX}"
>
>         cd src
> -       ./make.bash
> +       ./make.bash --target-only --no-banner
>         cd ${B}
>  }
> +do_compile[dirs] =+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
> +do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin ${B}/pkg"
>
>  do_install() {
>         install -d ${D}${libdir}/go/pkg/tool
>         cp --preserve=mode,timestamps -R ${B}/pkg/tool/${TARGET_GOTUPLE}
> ${D}${libdir}/go/pkg/tool/
>         install -d ${D}${libdir}/go/src
>         cp --preserve=mode,timestamps -R ${S}/src/cmd ${D}${libdir}/go/src/
> +       find ${D}${libdir}/go/src -depth -type d -name testdata -exec rm
> -rf {} \;
>         install -d ${D}${libdir}/go/bin
>         install -d ${D}${bindir}
>         for f in ${B}/${GO_BUILD_BINDIR}/*; do
> diff --git a/meta/recipes-devtools/go/go_1.9.bb
> b/meta/recipes-devtools/go/go_1.10.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go_1.9.bb
> rename to meta/recipes-devtools/go/go_1.10.bb
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c0b9e3a8b4713056643a68d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Something in this series breaks:<div><br></div><div><div>E=
RROR: go-helloworld-0.1-r0 do_compile: Function failed: do_compile (log fil=
e is located at /data/poky-tmp/master/work/corei7-64-poky-linux/go-hellowor=
ld/0.1-r0/temp/log.do_compile.12028)</div><div>ERROR: Logfile of failure st=
ored in: /data/poky-tmp/master/work/corei7-64-poky-linux/go-helloworld/0.1-=
r0/temp/log.do_compile.12028</div><div>Log data follows:</div><div>| DEBUG:=
 Executing shell function do_compile</div><div>| <a href=3D"http://github.c=
om/golang/example/stringutil">github.com/golang/example/stringutil</a></div=
><div>| # /data/poky-tmp/master/work/corei7-64-poky-linux/go-helloworld/0.1=
-r0/go-tmp/go-build469569525/b188/libstd.so</div><div>| /data/poky-tmp/mast=
er/work/corei7-64-poky-linux/go-helloworld/0.1-r0/recipe-sysroot-native/usr=
/lib/x86_64-poky-linux/go/pkg/tool/linux_amd64/link: running x86_64-poky-li=
nux-gcc failed: exit status 1</div><div>| /tmp/go-link-351787050/go.o:(.<a =
href=3D"http://data.rel.ro">data.rel.ro</a>+0x4181b0): undefined reference =
to `main.init&#39;</div><div>| /tmp/go-link-351787050/go.o:(.<a href=3D"htt=
p://data.rel.ro">data.rel.ro</a>+0x4181b8): undefined reference to `main.ma=
in&#39;</div><div>| collect2: error: ld returned 1 exit status</div><div>|<=
/div><div>| WARNING: exit code 2 from a shell command.</div><div>| ERROR: F=
unction failed: do_compile (log file is located at /data/poky-tmp/master/wo=
rk/corei7-64-poky-linux/go-helloworld/0.1-r0/temp/log.do_compile.12028)</di=
v><div>ERROR: Task (/home/ross/Yocto/poky/meta/recipes-extended/go-examples=
/go-helloworld_0.1.bb:do_compile) failed with exit code &#39;1&#39;</div></=
div><div><br></div><div>(same recipe built without the series)</div><div><b=
r></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On 27 February 2018 at 12:36, Matt Madison <span dir=3D"ltr">&l=
t;<a href=3D"mailto:matt@madison.systems" target=3D"_blank">matt@madison.sy=
stems</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">* Patches and=
 recipes reworked for go 1.10&#39;s significant<br>
=C2=A0 changes to its bootstrap and build steps<br>
<br>
* Update go1.4 source tarball used for go-native<br>
=C2=A0 bootstrapping to the version recommended<br>
=C2=A0 in the current go documentation<br>
<br>
* Remove test data from installed sources to eliminate<br>
=C2=A0 some packaging QA warnings<br>
<br>
* Set GOCACHE to &#39;off&#39; to disable 1.10&#39;s build caching<br>
=C2=A0 in the go recipes and bbclass<br>
<br>
Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
---<br>
=C2=A0meta/classes/go.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0meta/recipes-devtools/go/go-1.<wbr>10.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 21 ++<br>
=C2=A0...1-allow-CC-and-CXX-to-have-<wbr>multiple-words.patch |=C2=A0 49 ++=
++<br>
=C2=A0...-content-based-hash-<wbr>generation-less-pedan.patch | 220 +++++++=
+++++++++<br>
=C2=A0...OLDIR-to-be-overridden-in-<wbr>the-environment.patch |=C2=A0 64 ++=
+++<br>
=C2=A0.../0004-ld-add-soname-to-<wbr>shareable-objects.patch=C2=A0 |=C2=A0 =
47 ++++<br>
=C2=A0...verride-CC-when-building-<wbr>dist-and-go_boot.patch |=C2=A0 40 ++=
+<br>
=C2=A0...-cmd-dist-separate-host-<wbr>and-target-builds.patch | 277 +++++++=
++++++++++++++<br>
=C2=A0...07-cmd-go-make-GOROOT-<wbr>precious-by-default.patch |=C2=A0 97 ++=
++++++<br>
=C2=A0...ld-replace-glibc-dynamic-<wbr>linker-with-musl.patch | 130 +++++++=
+++<br>
=C2=A0meta/recipes-devtools/go/go-1.<wbr>9.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 26 --<br>
=C2=A0.../0001-make.bash-quote-CC_<wbr>FOR_TARGET.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 32 ---<br>
=C2=A0...CC-and-CXX-environment-<wbr>variable-construct.patch |=C2=A0 67 --=
---<br>
=C2=A0...sh-better-separate-host-<wbr>and-target-builds.patch |=C2=A0 92 --=
-----<br>
=C2=A0...w-GOTOOLDIR-to-be-<wbr>overridden-in-the-envir.patch |=C2=A0 68 --=
---<br>
=C2=A0...05-cmd-go-make-GOROOT-<wbr>precious-by-default.patch |=C2=A0 41 --=
-<br>
=C2=A0...dd-GOTOOLDIR_BOOTSTRAP-<wbr>environment-variab.patch |=C2=A0 36 --=
-<br>
=C2=A0.../0007-ld-add-soname-to-<wbr>shareable-objects.patch=C2=A0 |=C2=A0 =
46 ----<br>
=C2=A0...dd-GOHOSTxx-indirection-<wbr>for-cross-canadia.patch |=C2=A0 33 --=
-<br>
=C2=A0...dmode-pie-forces-external-<wbr>linking-mode-on.patch |=C2=A0 47 --=
--<br>
=C2=A0...verride-CC-when-building-<wbr>dist-and-go_boot.patch |=C2=A0 43 --=
--<br>
=C2=A0.../go/go-1.9/set-external-<wbr>linker.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 111 ---------<br>
=C2=A0meta/recipes-devtools/go/go-<wbr>common.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0meta/recipes-devtools/go/go-<wbr>cross-canadian.inc=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 28 +--<br>
=C2=A0...<a href=3D"http://s-canadian_1.9.bb" rel=3D"noreferrer" target=3D"=
_blank">s-canadian_1.9.bb</a> =3D&gt; <a href=3D"http://go-cross-canadian_1=
.10.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.10.bb</a>}=
 |=C2=A0 =C2=A00<br>
=C2=A0meta/recipes-devtools/go/go-<wbr>cross.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 55 ++--<br>
=C2=A0.../go/{<a href=3D"http://go-cross_1.9.bb" rel=3D"noreferrer" target=
=3D"_blank">go-cross_1.9.bb</a> =3D&gt; <a href=3D"http://go-cross_1.10.bb"=
 rel=3D"noreferrer" target=3D"_blank">go-cross_1.10.bb</a>}=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0meta/recipes-devtools/go/go-<wbr>crosssdk.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 16 +-<br>
=C2=A0.../go/{<a href=3D"http://go-crosssdk_1.9.bb" rel=3D"noreferrer" targ=
et=3D"_blank">go-crosssdk_1.9.bb</a> =3D&gt; <a href=3D"http://go-crosssdk_=
1.10.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.10.bb</a>} |=C2=
=A0 =C2=A00<br>
=C2=A0meta/recipes-devtools/go/go-<wbr>native.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 25 +-<br>
=C2=A0.../go/{<a href=3D"http://go-native_1.9.bb" rel=3D"noreferrer" target=
=3D"_blank">go-native_1.9.bb</a> =3D&gt; <a href=3D"http://go-native_1.10.b=
b" rel=3D"noreferrer" target=3D"_blank">go-native_1.10.bb</a>}=C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0meta/recipes-devtools/go/go-<wbr>runtime.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 58 +++--<br>
=C2=A0.../go/{<a href=3D"http://go-runtime_1.9.bb" rel=3D"noreferrer" targe=
t=3D"_blank">go-runtime_1.9.bb</a> =3D&gt; <a href=3D"http://go-runtime_1.1=
0.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.10.bb</a>}=C2=A0 =
=C2=A0|=C2=A0 =C2=A00<br>
=C2=A0meta/recipes-devtools/go/go-<wbr>target.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 21 +-<br>
=C2=A0meta/recipes-devtools/go/{<a href=3D"http://go_1.9.bb" rel=3D"norefer=
rer" target=3D"_blank">go_<wbr>1.9.bb</a> =3D&gt; <a href=3D"http://go_1.10=
.bb" rel=3D"noreferrer" target=3D"_blank">go_1.10.bb</a>} |=C2=A0 =C2=A00<b=
r>
=C2=A035 files changed, 1048 insertions(+), 746 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-1.<wbr>10.inc<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-1.<wbr>10/0001-allow-C=
C-and-CXX-to-<wbr>have-multiple-words.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-1.<wbr>10/0002-cmd-go-=
make-content-<wbr>based-hash-generation-less-<wbr>pedan.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-1.<wbr>10/0003-allow-G=
OTOOLDIR-to-be-<wbr>overridden-in-the-environment.<wbr>patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-1.<wbr>10/0004-ld-add-=
soname-to-<wbr>shareable-objects.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-1.<wbr>10/0005-make.ba=
sh-override-CC-<wbr>when-building-dist-and-go_<wbr>boot.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-1.<wbr>10/0006-cmd-dis=
t-separate-<wbr>host-and-target-builds.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-1.<wbr>10/0007-cmd-go-=
make-GOROOT-<wbr>precious-by-default.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-1.<wbr>10/0008-ld-repl=
ace-glibc-<wbr>dynamic-linker-with-musl.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>9.inc<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>9/0001-make.bas=
h-quote-CC_FOR_<wbr>TARGET.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>9/0002-cmd-go-f=
ix-CC-and-CXX-<wbr>environment-variable-<wbr>construct.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>9/0003-make.bas=
h-better-<wbr>separate-host-and-target-<wbr>builds.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>9/0004-cmd-go-a=
llow-GOTOOLDIR-<wbr>to-be-overridden-in-the-envir.<wbr>patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>9/0005-cmd-go-m=
ake-GOROOT-<wbr>precious-by-default.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>9/0006-make.bas=
h-add-<wbr>GOTOOLDIR_BOOTSTRAP-<wbr>environment-variab.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>9/0007-ld-add-s=
oname-to-<wbr>shareable-objects.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>9/0008-make.bas=
h-add-GOHOSTxx-<wbr>indirection-for-cross-canadia.<wbr>patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>9/0009-cmd-go-b=
uildmode-pie-<wbr>forces-external-linking-mode-<wbr>on.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>9/0010-make.bas=
h-override-CC-<wbr>when-building-dist-and-go_<wbr>boot.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>9/set-external-=
linker.patch<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-cross-canadian_=
1.9.bb" rel=3D"noreferrer" target=3D"_blank">go-<wbr>cross-canadian_1.9.bb<=
/a> =3D&gt; <a href=3D"http://go-cross-canadian_1.10.bb" rel=3D"noreferrer"=
 target=3D"_blank">go-cross-canadian_1.10.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-cross_1.9.bb" r=
el=3D"noreferrer" target=3D"_blank">go-<wbr>cross_1.9.bb</a> =3D&gt; <a hre=
f=3D"http://go-cross_1.10.bb" rel=3D"noreferrer" target=3D"_blank">go-cross=
_1.10.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-crosssdk_1.9.bb=
" rel=3D"noreferrer" target=3D"_blank">go-<wbr>crosssdk_1.9.bb</a> =3D&gt; =
<a href=3D"http://go-crosssdk_1.10.bb" rel=3D"noreferrer" target=3D"_blank"=
>go-crosssdk_1.10.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-native_1.9.bb" =
rel=3D"noreferrer" target=3D"_blank">go-<wbr>native_1.9.bb</a> =3D&gt; <a h=
ref=3D"http://go-native_1.10.bb" rel=3D"noreferrer" target=3D"_blank">go-na=
tive_1.10.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-runtime_1.9.bb"=
 rel=3D"noreferrer" target=3D"_blank">go-<wbr>runtime_1.9.bb</a> =3D&gt; <a=
 href=3D"http://go-runtime_1.10.bb" rel=3D"noreferrer" target=3D"_blank">go=
-runtime_1.10.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go_1.9.bb" rel=3D"=
noreferrer" target=3D"_blank">go_<wbr>1.9.bb</a> =3D&gt; <a href=3D"http://=
go_1.10.bb" rel=3D"noreferrer" target=3D"_blank">go_1.10.bb</a>} (100%)<br>
<br>
diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass<br>
index 7ecd8c9254..43a262d599 100644<br>
--- a/meta/classes/go.bbclass<br>
+++ b/meta/classes/go.bbclass<br>
@@ -24,6 +24,7 @@ GO_LINKMODE ?=3D &quot;&quot;<br>
=C2=A0GO_LINKMODE_class-nativesdk =3D &quot;--linkmode=3Dexternal&quot;<br>
=C2=A0GO_LDFLAGS ?=3D &#39;-ldflags=3D&quot;${GO_RPATH} ${GO_LINKMODE} -ext=
ldflags &#39;${GO_EXTLDFLAGS}&#39;&quot;&#39;<br>
=C2=A0export GOBUILDFLAGS ?=3D &quot;-v ${GO_LDFLAGS}&quot;<br>
+export GOPATH_OMIT_IN_ACTIONID ?=3D &quot;1&quot;<br>
=C2=A0export GOPTESTBUILDFLAGS ?=3D &quot;${GOBUILDFLAGS} -c&quot;<br>
=C2=A0export GOPTESTFLAGS ?=3D &quot;-test.v&quot;<br>
=C2=A0GOBUILDFLAGS_prepend_task-<wbr>compile =3D &quot;${GO_PARALLEL_BUILD}=
 &quot;<br>
@@ -47,6 +48,7 @@ GO_INSTALL_FILTEROUT ?=3D &quot;${GO_IMPORT}/vendor/&quot=
;<br>
<br>
=C2=A0B =3D &quot;${WORKDIR}/build&quot;<br>
=C2=A0export GOPATH =3D &quot;${B}&quot;<br>
+export GOCACHE =3D &quot;off&quot;<br>
=C2=A0GO_TMPDIR ?=3D &quot;${WORKDIR}/go-tmp&quot;<br>
=C2=A0GO_TMPDIR[vardepvalue] =3D &quot;&quot;<br>
<br>
diff --git a/meta/recipes-devtools/go/go-<wbr>1.10.inc b/meta/recipes-devto=
ols/go/go-<wbr>1.10.inc<br>
new file mode 100644<br>
index 0000000000..3a93773e2a<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/go-<wbr>1.10.inc<br>
@@ -0,0 +1,21 @@<br>
+require go-common.inc<br>
+<br>
+GO_BASEVERSION =3D &quot;1.10&quot;<br>
+FILESEXTRAPATHS_prepend :=3D &quot;${FILE_DIRNAME}/go-${GO_<wbr>BASEVERSIO=
N}:&quot;<br>
+<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>5d4950ecb7b26d2c5e4e7=
b4e0dd747<wbr>07&quot;<br>
+<br>
+SRC_URI +=3D &quot;\<br>
+=C2=A0 =C2=A0 file://0001-allow-CC-and-CXX-<wbr>to-have-multiple-words.pat=
ch \<br>
+=C2=A0 =C2=A0 file://0002-cmd-go-make-<wbr>content-based-hash-generation-<=
wbr>less-pedan.patch \<br>
+=C2=A0 =C2=A0 file://0003-allow-GOTOOLDIR-<wbr>to-be-overridden-in-the-<wb=
r>environment.patch \<br>
+=C2=A0 =C2=A0 file://0004-ld-add-soname-to-<wbr>shareable-objects.patch \<=
br>
+=C2=A0 =C2=A0 file://0005-make.bash-<wbr>override-CC-when-building-<wbr>di=
st-and-go_boot.patch \<br>
+=C2=A0 =C2=A0 file://0006-cmd-dist-separate-<wbr>host-and-target-builds.pa=
tch \<br>
+=C2=A0 =C2=A0 file://0007-cmd-go-make-<wbr>GOROOT-precious-by-default.<wbr=
>patch \<br>
+&quot;<br>
+<br>
+SRC_URI_append_libc-musl =3D &quot; file://0008-ld-replace-glibc-<wbr>dyna=
mic-linker-with-musl.<wbr>patch&quot;<br>
+<br>
+SRC_URI[main.md5sum] =3D &quot;<wbr>07cbb9d0091b846c6aea40bf5bc0ce<wbr>a7&=
quot;<br>
+SRC_URI[main.sha256sum] =3D &quot;<wbr>f3de49289405fda5fd1483a8fe6bd2<wbr>=
fa5469e005fd567df64485c4fa000c<wbr>7f24&quot;<br>
diff --git a/meta/recipes-devtools/go/go-<wbr>1.10/0001-allow-CC-and-CXX-to=
-<wbr>have-multiple-words.patch b/meta/recipes-devtools/go/go-<wbr>1.10/000=
1-allow-CC-and-CXX-to-<wbr>have-multiple-words.patch<br>
new file mode 100644<br>
index 0000000000..4584590632<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/go-<wbr>1.10/0001-allow-CC-and-CXX-to-<wbr>h=
ave-multiple-words.patch<br>
@@ -0,0 +1,49 @@<br>
+From c287c18856575139e4495b320f20cf<wbr>96856896db Mon Sep 17 00:00:00 200=
1<br>
+From: Matt Madison &lt;matt@madison.systems&gt;<br>
+Date: Mon, 19 Feb 2018 08:49:33 -0800<br>
+Subject: [PATCH 1/8] allow CC and CXX to have multiple words<br>
+<br>
+Upstream-Status: Inappropriate [OE specific]<br>
+<br>
+Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
+---<br>
+ src/cmd/dist/build.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 =
+++-<br>
+ src/cmd/go/internal/envcmd/<wbr>env.go | 4 ++--<br>
+ 2 files changed, 5 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go<br>
+index 49ed80033e..eb70f17790 100644<br>
+--- a/src/cmd/dist/build.go<br>
++++ b/src/cmd/dist/build.go<br>
+@@ -1406,7 +1406,9 @@ func checkCC() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if !needCC() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 if output, err :=3D exec.Command(defaultcc[&quot;&qu=
ot;], &quot;--help&quot;).CombinedOutput(); err !=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 cc :=3D strings.Split(defaultcc[&quot;&quot;], &quot=
; &quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 args :=3D append(cc[1:], &quot;--help&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 if output, err :=3D exec.Command(cc[0], args...).Com=
binedOutput(); err !=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0outputHdr :=3D &quo=
t;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if len(output) &gt;=
 0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0outputHdr =3D &quot;\nCommand output:\n\n&quot;<br>
+diff --git a/src/cmd/go/internal/envcmd/<wbr>env.go b/src/cmd/go/internal/=
envcmd/<wbr>env.go<br>
+index 603f7b5060..f891123f9c 100644<br>
+--- a/src/cmd/go/internal/envcmd/<wbr>env.go<br>
++++ b/src/cmd/go/internal/envcmd/<wbr>env.go<br>
+@@ -82,11 +82,11 @@ func MkEnv() []cfg.EnvVar {<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cc :=3D cfg.DefaultCC(cfg.Goos, cfg.Goarch)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if env :=3D strings.Fields(os.Getenv(&quot;CC&q=
uot;)<wbr>); len(env) &gt; 0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cc =3D env[0]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cc =3D strings.Join(env,=
 &quot; &quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cxx :=3D cfg.DefaultCXX(cfg.Goos, cfg.Goarch)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if env :=3D strings.Fields(os.Getenv(&quot;CXX&=
quot;<wbr>)); len(env) &gt; 0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cxx =3D env[0]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cxx =3D strings.Join(env=
, &quot; &quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0env =3D append(env, cfg.EnvVar{Name: &quot;CC&q=
uot;, Value: cc})<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0env =3D append(env, cfg.EnvVar{Name: &quot;CXX&=
quot;, Value: cxx})<br>
+--<br>
+2.14.1<br>
+<br>
diff --git a/meta/recipes-devtools/go/go-<wbr>1.10/0002-cmd-go-make-content=
-<wbr>based-hash-generation-less-<wbr>pedan.patch b/meta/recipes-devtools/g=
o/go-<wbr>1.10/0002-cmd-go-make-content-<wbr>based-hash-generation-less-<wb=
r>pedan.patch<br>
new file mode 100644<br>
index 0000000000..5fd471960e<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/go-<wbr>1.10/0002-cmd-go-make-content-<wbr>b=
ased-hash-generation-less-<wbr>pedan.patch<br>
@@ -0,0 +1,220 @@<br>
+From 4ec2b27c091fbce0e8e2fd7e3ef2c7<wbr>6e068af32f Mon Sep 17 00:00:00 200=
1<br>
+From: Matt Madison &lt;matt@madison.systems&gt;<br>
+Date: Mon, 19 Feb 2018 08:50:59 -0800<br>
+Subject: [PATCH 2/8] cmd/go: make content-based hash generation less pedan=
tic<br>
+<br>
+Go 1.10&#39;s build tool now uses content-based hashes to<br>
+determine when something should be built or re-built.<br>
+This same mechanism is used to maintain a built-artifact<br>
+cache for speeding up builds.<br>
+<br>
+However, the hashes it generates include information that<br>
+doesn&#39;t work well with OE, nor with using a shared runtime<br>
+library.<br>
+<br>
+First, it embeds path names to source files, unless<br>
+building within GOROOT.=C2=A0 This prevents the building<br>
+of a package in GOPATH for later staging into GOROOT.<br>
+<br>
+This patch adds support for the environment variable<br>
+GOPATH_OMIT_IN_ACTIONID.=C2=A0 If present, path name<br>
+embedding is disabled.<br>
+<br>
+Second, if cgo is enabled, the build ID for cgo-related<br>
+packages will include the current value of the environment<br>
+variables for invoking the compiler (CC, CXX, FC) and<br>
+any CGO_xxFLAGS variables.=C2=A0 Only if the settings used<br>
+during a compilation exactly match, character for character,<br>
+the values used for compiling runtime/cgo or any other<br>
+cgo-enabled package being imported, will the tool<br>
+decide that the imported package is up-to-date.<br>
+<br>
+This is done to help ensure correctness, but is overly<br>
+simplistic and effectively prevents the reuse of built<br>
+artifacts that use cgo (or shared runtime, which includes<br>
+runtime/cgo).<br>
+<br>
+This patch filters out all compiler flags except those<br>
+beginning with &#39;-m&#39;.=C2=A0 The default behavior can be restored<br=
>
+by setting the CGO_PEDANTIC environment variable.<br>
+<br>
+Upstream-Status: Inappropriate [OE specific]<br>
+<br>
+Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
+---<br>
+ src/cmd/go/internal/envcmd/<wbr>env.go |=C2=A0 2 +-<br>
+ src/cmd/go/internal/work/exec.<wbr>go=C2=A0 | 63 ++++++++++++++++++++++++=
++++--<wbr>---------<br>
+ 2 files changed, 46 insertions(+), 19 deletions(-)<br>
+<br>
+diff --git a/src/cmd/go/internal/envcmd/<wbr>env.go b/src/cmd/go/internal/=
envcmd/<wbr>env.go<br>
+index f891123f9c..ebacfbfdbc 100644<br>
+--- a/src/cmd/go/internal/envcmd/<wbr>env.go<br>
++++ b/src/cmd/go/internal/envcmd/<wbr>env.go<br>
+@@ -113,7 +113,7 @@ func findEnv(env []cfg.EnvVar, name string) string {<b=
r>
+ func ExtraEnvVars() []cfg.EnvVar {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0var b work.Builder<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0b.Init()<br>
+-=C2=A0 =C2=A0 =C2=A0 cppflags, cflags, cxxflags, fflags, ldflags, err :=
=3D b.CFlags(&amp;load.Package{})<br>
++=C2=A0 =C2=A0 =C2=A0 cppflags, cflags, cxxflags, fflags, ldflags, err :=
=3D b.CFlags(&amp;load.Package{}, false)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Should not happe=
n - b.CFlags was given an empty package.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fmt.Fprintf(os.Stde=
rr, &quot;go: invalid cflags: %v\n&quot;, err)<br>
+diff --git a/src/cmd/go/internal/work/<wbr>exec.go b/src/cmd/go/internal/w=
ork/<wbr>exec.go<br>
+index c4c1500eb2..b0f6b45647 100644<br>
+--- a/src/cmd/go/internal/work/<wbr>exec.go<br>
++++ b/src/cmd/go/internal/work/<wbr>exec.go<br>
+@@ -173,6 +173,8 @@ func (b *Builder) Do(root *Action) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0wg.Wait()<br>
+ }<br>
+<br>
++var omitGopath =3D os.Getenv(&quot;GOPATH_OMIT_IN_<wbr>ACTIONID&quot;) !=
=3D &quot;&quot;<br>
++<br>
+ // buildActionID computes the action ID for a build action.<br>
+ func (b *Builder) buildActionID(a *Action) cache.ActionID {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0p :=3D a.Package<br>
+@@ -189,7 +191,7 @@ func (b *Builder) buildActionID(a *Action) cache.Actio=
nID {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// but it does not hide the exact value of $GOP=
ATH.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Include the full dir in that case.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Assume b.WorkDir is being trimmed properly.<=
br>
+-=C2=A0 =C2=A0 =C2=A0 if !p.Goroot &amp;&amp; !strings.HasPrefix(p.Dir, b.=
WorkDir) {<br>
++=C2=A0 =C2=A0 =C2=A0 if !p.Goroot &amp;&amp; !omitGopath &amp;&amp; !stri=
ngs.HasPrefix(p.Dir, b.WorkDir) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fmt.Fprintf(h, &quo=
t;dir %s\n&quot;, p.Dir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fmt.Fprintf(h, &quot;goos %s goarch %s\n&quot;,=
 cfg.Goos, cfg.Goarch)<br>
+@@ -197,13 +199,13 @@ func (b *Builder) buildActionID(a *Action) cache.Act=
ionID {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fmt.Fprintf(h, &quot;omitdebug %v standard %v l=
ocal %v prefix %q\n&quot;, p.Internal.OmitDebug, p.Standard, p.Internal.Loc=
al, p.Internal.LocalPrefix)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if len(p.CgoFiles)+len(p.<wbr>SwigFiles) &gt; 0=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fmt.Fprintf(h, &quo=
t;cgo %q\n&quot;, b.toolID(&quot;cgo&quot;))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cppflags, cflags, cxxfla=
gs, fflags, _, _ :=3D b.CFlags(p)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fmt.Fprintf(h, &quot;CC=
=3D%q %q %q\n&quot;, b.ccExe(), cppflags, cflags)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cppflags, cflags, cxxfla=
gs, fflags, _, _ :=3D b.CFlags(p, true)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fmt.Fprintf(h, &quot;CC=
=3D%q %q %q\n&quot;, b.ccExe(true), cppflags, cflags)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if len(p.CXXFiles)+=
len(p.<wbr>SwigFiles) &gt; 0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fmt.Fprintf(h, &quot;CXX=3D%q %q\n&quot;, b.cxxExe(), cxxflags)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fmt.Fprintf(h, &quot;CXX=3D%q %q\n&quot;, b.cxxExe(true), cxxflags)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if len(p.FFiles) &g=
t; 0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fmt.Fprintf(h, &quot;FC=3D%q %q\n&quot;, b.fcExe(), fflags)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fmt.Fprintf(h, &quot;FC=3D%q %q\n&quot;, b.fcExe(true), fflags)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// TODO(rsc): Shoul=
d we include the SWIG version or Fortran/GCC/G++/Objective-C compiler versi=
ons?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -1731,33 +1733,33 @@ var (<br>
+ // gccCmd returns a gcc command line prefix<br>
+ // defaultCC is defined in zdefaultcc.go, written by cmd/dist.<br>
+ func (b *Builder) GccCmd(incdir, workdir string) []string {<br>
+-=C2=A0 =C2=A0 =C2=A0 return b.compilerCmd(b.ccExe(), incdir, workdir)<br>
++=C2=A0 =C2=A0 =C2=A0 return b.compilerCmd(b.ccExe(false), incdir, workdir=
)<br>
+ }<br>
+<br>
+ // gxxCmd returns a g++ command line prefix<br>
+ // defaultCXX is defined in zdefaultcc.go, written by cmd/dist.<br>
+ func (b *Builder) GxxCmd(incdir, workdir string) []string {<br>
+-=C2=A0 =C2=A0 =C2=A0 return b.compilerCmd(b.cxxExe(), incdir, workdir)<br=
>
++=C2=A0 =C2=A0 =C2=A0 return b.compilerCmd(b.cxxExe(false), incdir, workdi=
r)<br>
+ }<br>
+<br>
+ // gfortranCmd returns a gfortran command line prefix.<br>
+ func (b *Builder) gfortranCmd(incdir, workdir string) []string {<br>
+-=C2=A0 =C2=A0 =C2=A0 return b.compilerCmd(b.fcExe(), incdir, workdir)<br>
++=C2=A0 =C2=A0 =C2=A0 return b.compilerCmd(b.fcExe(false), incdir, workdir=
)<br>
+ }<br>
+<br>
+ // ccExe returns the CC compiler setting without all the extra flags we a=
dd implicitly.<br>
+-func (b *Builder) ccExe() []string {<br>
+-=C2=A0 =C2=A0 =C2=A0 return b.compilerExe(origCC, cfg.DefaultCC(cfg.Goos,=
 cfg.Goarch))<br>
++func (b *Builder) ccExe(filtered bool) []string {<br>
++=C2=A0 =C2=A0 =C2=A0 return b.compilerExe(origCC, cfg.DefaultCC(cfg.Goos,=
 cfg.Goarch), filtered)<br>
+ }<br>
+<br>
+ // cxxExe returns the CXX compiler setting without all the extra flags we=
 add implicitly.<br>
+-func (b *Builder) cxxExe() []string {<br>
+-=C2=A0 =C2=A0 =C2=A0 return b.compilerExe(origCXX, cfg.DefaultCXX(cfg.Goo=
s, cfg.Goarch))<br>
++func (b *Builder) cxxExe(filtered bool) []string {<br>
++=C2=A0 =C2=A0 =C2=A0 return b.compilerExe(origCXX, cfg.DefaultCXX(cfg.Goo=
s, cfg.Goarch), filtered)<br>
+ }<br>
+<br>
+ // fcExe returns the FC compiler setting without all the extra flags we a=
dd implicitly.<br>
+-func (b *Builder) fcExe() []string {<br>
+-=C2=A0 =C2=A0 =C2=A0 return b.compilerExe(os.Getenv(&quot;FC&quot;), &quo=
t;gfortran&quot;)<br>
++func (b *Builder) fcExe(filtered bool) []string {<br>
++=C2=A0 =C2=A0 =C2=A0 return b.compilerExe(os.Getenv(&quot;FC&quot;), &quo=
t;gfortran&quot;, filtered)<br>
+ }<br>
+<br>
+ // compilerExe returns the compiler to use given an<br>
+@@ -1766,11 +1768,14 @@ func (b *Builder) fcExe() []string {<br>
+ // of the compiler but can have additional arguments if they<br>
+ // were present in the environment value.<br>
+ // For example if CC=3D&quot;gcc -DGOPHER&quot; then the result is [&quot=
;gcc&quot;, &quot;-DGOPHER&quot;].<br>
+-func (b *Builder) compilerExe(envValue string, def string) []string {<br>
++func (b *Builder) compilerExe(envValue string, def string, filtered bool)=
 []string {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0compiler :=3D strings.Fields(envValue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if len(compiler) =3D=3D 0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compiler =3D []stri=
ng{def}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 if filtered {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return append(compiler[0=
:1], filterCompilerFlags(compiler[<wbr>1:])...)<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return compiler<br>
+ }<br>
+<br>
+@@ -1920,8 +1925,23 @@ func envList(key, def string) []string {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return strings.Fields(v)<br>
+ }<br>
+<br>
++var filterFlags =3D os.Getenv(&quot;CGO_PEDANTIC&quot;) =3D=3D &quot;&quo=
t;<br>
++<br>
++func filterCompilerFlags(flags []string) []string {<br>
++=C2=A0 =C2=A0 =C2=A0 var newflags []string<br>
++=C2=A0 =C2=A0 =C2=A0 if !filterFlags {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return flags<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 for _, flag :=3D range flags {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if strings.HasPrefix(fla=
g, &quot;-m&quot;) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 newflags =3D append(newflags, flag)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 return newflags<br>
++}<br>
++<br>
+ // CFlags returns the flags to use when invoking the C, C++ or Fortran co=
mpilers, or cgo.<br>
+-func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, ff=
lags, ldflags []string, err error) {<br>
++func (b *Builder) CFlags(p *load.Package, filtered bool) (cppflags, cflag=
s, cxxflags, fflags, ldflags []string, err error) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0defaults :=3D &quot;-g -O2&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if cppflags, err =3D buildFlags(&quot;CPPFLAGS&=
quot;, &quot;&quot;, p.CgoCPPFLAGS, checkCompilerFlags); err !=3D nil {<br>
+@@ -1939,6 +1959,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags=
, cflags, cxxflags, fflags, l<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ldflags, err =3D buildFlags(&quot;LDFLAGS&qu=
ot;, defaults, p.CgoLDFLAGS, checkLinkerFlags); err !=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 if filtered {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cppflags =3D filterCompi=
lerFlags(cppflags)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cflags =3D filterCompile=
rFlags(cflags)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cxxflags =3D filterCompi=
lerFlags(cxxflags)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fflags =3D filterCompile=
rFlags(fflags)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ldflags =3D filterCompil=
erFlags(ldflags)<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
+ }<br>
+@@ -1954,7 +1981,7 @@ var cgoRe =3D regexp.MustCompile(`[/\\:]`)<br>
+<br>
+ func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLA=
GS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo, outObj [=
]string, err error) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0p :=3D a.Package<br>
+-=C2=A0 =C2=A0 =C2=A0 cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoL=
DFLAGS, err :=3D b.CFlags(p)<br>
++=C2=A0 =C2=A0 =C2=A0 cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoL=
DFLAGS, err :=3D b.CFlags(p, false)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nil, nil, er=
r<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -2306,7 +2333,7 @@ func (b *Builder) swigIntSize(objdir string) (intsiz=
e string, err error) {<br>
+<br>
+ // Run SWIG on one SWIG input file.<br>
+ func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir string=
, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string, err e=
rror) {<br>
+-=C2=A0 =C2=A0 =C2=A0 cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err :=3D =
b.CFlags(p)<br>
++=C2=A0 =C2=A0 =C2=A0 cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err :=3D =
b.CFlags(p, false)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;&quot;=
, &quot;&quot;, err<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+--<br>
+2.14.1<br>
+<br>
diff --git a/meta/recipes-devtools/go/go-<wbr>1.10/0003-allow-GOTOOLDIR-to-=
<wbr>be-overridden-in-the-<wbr>environment.patch b/meta/recipes-devtools/go=
/go-<wbr>1.10/0003-allow-GOTOOLDIR-to-<wbr>be-overridden-in-the-<wbr>enviro=
nment.patch<br>
new file mode 100644<br>
index 0000000000..d1a674f3c2<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/go-<wbr>1.10/0003-allow-GOTOOLDIR-to-<wbr>be=
-overridden-in-the-<wbr>environment.patch<br>
@@ -0,0 +1,64 @@<br>
+From d9bdd1bf03da06572a7a74d7dbf2a2<wbr>6d279cfa55 Mon Sep 17 00:00:00 200=
1<br>
+From: Matt Madison &lt;matt@madison.systems&gt;<br>
+Date: Sat, 17 Feb 2018 05:24:20 -0800<br>
+Subject: [PATCH 3/8] allow GOTOOLDIR to be overridden in the environment<b=
r>
+<br>
+to allow for split host/target build roots<br>
+<br>
+Upstream-Status: Inappropriate [OE specific]<br>
+<br>
+Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
+---<br>
+ src/cmd/dist/build.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 +++-<br>
+ src/cmd/go/internal/cfg/cfg.go | 6 +++++-<br>
+ src/go/build/build.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
+ 3 files changed, 9 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go<br>
+index eb70f17790..e749cbd22e 100644<br>
+--- a/src/cmd/dist/build.go<br>
++++ b/src/cmd/dist/build.go<br>
+@@ -220,7 +220,9 @@ func xinit() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0workdir =3D xworkdir()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0xatexit(rmworkdir)<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 tooldir =3D pathf(&quot;%s/pkg/tool/%s_%s&quot;, gor=
oot, gohostos, gohostarch)<br>
++=C2=A0 =C2=A0 =C2=A0 if tooldir =3D os.Getenv(&quot;GOTOOLDIR&quot;); too=
ldir =3D=3D &quot;&quot; {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tooldir =3D pathf(&quot;=
%s/pkg/tool/%s_%s&quot;, goroot, gohostos, gohostarch)<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+ }<br>
+<br>
+ // compilerEnv returns a map from &quot;goos/goarch&quot; to the<br>
+diff --git a/src/cmd/go/internal/cfg/cfg.<wbr>go b/src/cmd/go/internal/cfg=
/cfg.<wbr>go<br>
+index 1de4f0dc79..4f6010d660 100644<br>
+--- a/src/cmd/go/internal/cfg/cfg.<wbr>go<br>
++++ b/src/cmd/go/internal/cfg/cfg.<wbr>go<br>
+@@ -96,7 +96,11 @@ func init() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// as the tool directory does not move based on=
 environment variables.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// This matches the initialization of ToolDir i=
n go/build,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// except for using GOROOT rather than runtime.=
GOROOT().<br>
+-=C2=A0 =C2=A0 =C2=A0 build.ToolDir =3D filepath.Join(GOROOT, &quot;pkg/to=
ol/&quot;+runtime.GOOS+&quot;_&quot;+<wbr>runtime.GOARCH)<br>
++=C2=A0 =C2=A0 =C2=A0 if s :=3D os.Getenv(&quot;GOTOOLDIR&quot;); s !=3D &=
quot;&quot; {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build.ToolDir =3D filepa=
th.Clean(s)<br>
++=C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build.ToolDir =3D filepa=
th.Join(GOROOT, &quot;pkg/tool/&quot;+runtime.GOOS+&quot;_&quot;+<wbr>runti=
me.GOARCH)<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+ }<br>
+<br>
+ func findGOROOT() string {<br>
+diff --git a/src/go/build/build.go b/src/go/build/build.go<br>
+index 68fb423983..81b1b32270 100644<br>
+--- a/src/go/build/build.go<br>
++++ b/src/go/build/build.go<br>
+@@ -1594,7 +1594,7 @@ func init() {<br>
+ }<br>
+<br>
+ // ToolDir is the directory containing build tools.<br>
+-var ToolDir =3D filepath.Join(runtime.GOROOT()<wbr>, &quot;pkg/tool/&quot=
;+runtime.GOOS+&quot;_&quot;+<wbr>runtime.GOARCH)<br>
++var ToolDir =3D envOr(&quot;GOTOOLDIR&quot;, filepath.Join(runtime.GOROOT=
()<wbr>, &quot;pkg/tool/&quot;+runtime.GOOS+&quot;_&quot;+<wbr>runtime.GOAR=
CH))<br>
+<br>
+ // IsLocalImport reports whether the import path is<br>
+ // a local import path, like &quot;.&quot;, &quot;..&quot;, &quot;./foo&q=
uot;, or &quot;../foo&quot;.<br>
+--<br>
+2.14.1<br>
+<br>
diff --git a/meta/recipes-devtools/go/go-<wbr>1.10/0004-ld-add-soname-to-<w=
br>shareable-objects.patch b/meta/recipes-devtools/go/go-<wbr>1.10/0004-ld-=
add-soname-to-<wbr>shareable-objects.patch<br>
new file mode 100644<br>
index 0000000000..a748391659<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/go-<wbr>1.10/0004-ld-add-soname-to-<wbr>shar=
eable-objects.patch<br>
@@ -0,0 +1,47 @@<br>
+From 0346a4271d31aab567f6758711a469<wbr>4fb6108daf Mon Sep 17 00:00:00 200=
1<br>
+From: Matt Madison &lt;matt@madison.systems&gt;<br>
+Date: Sat, 17 Feb 2018 06:26:10 -0800<br>
+Subject: [PATCH 4/8] ld: add soname to shareable objects<br>
+<br>
+so that OE&#39;s shared library dependency handling<br>
+can find them.<br>
+<br>
+Upstream-Status: Inappropriate [OE specific]<br>
+<br>
+Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
+---<br>
+ src/cmd/link/internal/ld/lib.<wbr>go | 4 ++++<br>
+ 1 file changed, 4 insertions(+)<br>
+<br>
+diff --git a/src/cmd/link/internal/ld/<wbr>lib.go b/src/cmd/link/internal/=
ld/<wbr>lib.go<br>
+index 6dcaf64122..11cbb8a8bb 100644<br>
+--- a/src/cmd/link/internal/ld/<wbr>lib.go<br>
++++ b/src/cmd/link/internal/ld/<wbr>lib.go<br>
+@@ -1134,6 +1134,7 @@ func (ctxt *Link) hostlink() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argv =3D append(argv, &quot;-Wl,-z,re=
lro&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0argv =3D append(argv, &quot;-shared&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 argv =3D append(argv, fmt.Sprintf(&quot;-Wl,-soname,%s&quot;, filepath.=
Base(*flagOutfile)))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if ctxt.HeadType !=3D objabi.Hwindows {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Pass -z nodelete to mark the share=
d library as<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// non-closeable: a dlclose will do n=
othing.<br>
+@@ -1145,6 +1146,8 @@ func (ctxt *Link) hostlink() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0argv =3D append(argv, &quot;-Wl,-z,relro&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argv =3D append(arg=
v, &quot;-shared&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 argv =3D append(argv, fm=
t.Sprintf(&quot;-Wl,-soname,%s&quot;, filepath.Base(*flagOutfile)))<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case BuildModePlugin:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ctxt.HeadType =
=3D=3D objabi.Hdarwin {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0argv =3D append(argv, &quot;-dynamiclib&quot;)<br>
+@@ -1153,6 +1156,7 @@ func (ctxt *Link) hostlink() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argv =3D append(argv, &quot;-Wl,-z,re=
lro&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0argv =3D append(argv, &quot;-shared&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 argv =3D append(argv, fmt.Sprintf(&quot;-Wl,-soname,%s&quot;, filepath.=
Base(*flagOutfile)))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+--<br>
+2.14.1<br>
+<br>
diff --git a/meta/recipes-devtools/go/go-<wbr>1.10/0005-make.bash-override-=
<wbr>CC-when-building-dist-and-go_<wbr>boot.patch b/meta/recipes-devtools/g=
o/go-<wbr>1.10/0005-make.bash-override-<wbr>CC-when-building-dist-and-go_<w=
br>boot.patch<br>
new file mode 100644<br>
index 0000000000..d15f9d299f<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/go-<wbr>1.10/0005-make.bash-override-<wbr>CC=
-when-building-dist-and-go_<wbr>boot.patch<br>
@@ -0,0 +1,40 @@<br>
+From 215132a219461a9bcc2ff086474c62<wbr>0f651f463e Mon Sep 17 00:00:00 200=
1<br>
+From: Matt Madison &lt;matt@madison.systems&gt;<br>
+Date: Sat, 17 Feb 2018 06:32:45 -0800<br>
+Subject: [PATCH 5/8] make.bash: override CC when building dist and<br>
+ go_bootstrap<br>
+<br>
+for handling OE cross-canadian builds.<br>
+<br>
+Upstream-Status: Inappropriate [OE specific]<br>
+<br>
+Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
+---<br>
+ src/make.bash | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/src/make.bash b/src/make.bash<br>
+index 93a5c43d11..3a63682bc4 100755<br>
+--- a/src/make.bash<br>
++++ b/src/make.bash<br>
+@@ -162,7 +162,7 @@ if [ &quot;$GOROOT_BOOTSTRAP&quot; =3D &quot;$GOROOT&q=
uot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
+ fi<br>
+ rm -f cmd/dist/dist<br>
+-GOROOT=3D&quot;$GOROOT_BOOTSTRAP&quot; GOOS=3D&quot;&quot; GOARCH=3D&quot=
;&quot; &quot;$GOROOT_BOOTSTRAP/bin/go&quot; build -o cmd/dist/dist ./cmd/d=
ist<br>
++CC=3D&quot;${BUILD_CC:-${CC}}&quot; GOROOT=3D&quot;$GOROOT_BOOTSTRAP&quot=
; GOOS=3D&quot;&quot; GOARCH=3D&quot;&quot; &quot;$GOROOT_BOOTSTRAP/bin/go&=
quot; build -o cmd/dist/dist ./cmd/dist<br>
+<br>
+ # -e doesn&#39;t propagate out of eval, so check success by hand.<br>
+ eval $(./cmd/dist/dist env -p || echo FAIL=3Dtrue)<br>
+@@ -193,7 +193,7 @@ fi<br>
+ # Run dist bootstrap to complete make.bash.<br>
+ # Bootstrap installs a proper cmd/dist, built with the new toolchain.<br>
+ # Throw ours, built with Go 1.4, away after bootstrap.<br>
+-./cmd/dist/dist bootstrap $buildall $vflag $GO_DISTFLAGS &quot;$@&quot;<b=
r>
++CC=3D&quot;${BUILD_CC:-${CC}}&quot; ./cmd/dist/dist bootstrap $buildall $=
vflag $GO_DISTFLAGS &quot;$@&quot;<br>
+ rm -f ./cmd/dist/dist<br>
+<br>
+ # DO NOT ADD ANY NEW CODE HERE.<br>
+--<br>
+2.14.1<br>
+<br>
diff --git a/meta/recipes-devtools/go/go-<wbr>1.10/0006-cmd-dist-separate-<=
wbr>host-and-target-builds.patch b/meta/recipes-devtools/go/go-<wbr>1.10/00=
06-cmd-dist-separate-<wbr>host-and-target-builds.patch<br>
new file mode 100644<br>
index 0000000000..73a9db213c<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/go-<wbr>1.10/0006-cmd-dist-separate-<wbr>hos=
t-and-target-builds.patch<br>
@@ -0,0 +1,277 @@<br>
+From 4839007ac75e0d6d15392e84966bd6<wbr>051a68bcc4 Mon Sep 17 00:00:00 200=
1<br>
+From: Matt Madison &lt;matt@madison.systems&gt;<br>
+Date: Sat, 17 Feb 2018 10:03:48 -0800<br>
+Subject: [PATCH 6/8] cmd/dist: separate host and target builds<br>
+<br>
+Change the dist tool to allow for OE-style cross-<br>
+and cross-canadian builds:<br>
+<br>
+ - command flags --host-only and --target only are added;<br>
+=C2=A0 =C2=A0if one is present, the other changes mentioned below<br>
+=C2=A0 =C2=A0take effect, and arguments may also be specified on<br>
+=C2=A0 =C2=A0the command line to enumerate the package(s) to be<br>
+=C2=A0 =C2=A0built.<br>
+<br>
+ - for OE cross builds, go_bootstrap is always built for<br>
+=C2=A0 =C2=A0the current build host, and is moved, along with the supporti=
ng<br>
+=C2=A0 =C2=A0toolchain (asm, compile, etc.) to a separate &#39;native_nati=
ve&#39;<br>
+=C2=A0 =C2=A0directory under GOROOT/pkg/tool.<br>
+<br>
+ - go_bootstrap is not automatically removed after the build,<br>
+=C2=A0 =C2=A0so it can be reused later (e.g., building both static and<br>
+=C2=A0 =C2=A0shared runtime).<br>
+<br>
+Note that for --host-only builds, it would be nice to specify<br>
+just the &quot;cmd&quot; package to build only the go commands/tools,<br>
+the staleness checks in the dist tool will fail if the &quot;std&quot;<br>
+library has not also been built.=C2=A0 So host-only builds have to<br>
+build everything anyway.<br>
+<br>
+Upstream-Status: Inappropriate [OE specific]<br>
+<br>
+Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
+<br>
+more dist cleanup<br>
+---<br>
+ src/cmd/dist/build.go | 149 ++++++++++++++++++++++++++++++<wbr>+++++++---=
----------<br>
+ 1 file changed, 111 insertions(+), 38 deletions(-)<br>
+<br>
+diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go<br>
+index e749cbd22e..c949429543 100644<br>
+--- a/src/cmd/dist/build.go<br>
++++ b/src/cmd/dist/build.go<br>
+@@ -38,6 +38,7 @@ var (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0goldflags=C2=A0 =C2=A0 =C2=A0 =C2=A0 string<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0workdir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strin=
g<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tooldir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strin=
g<br>
++=C2=A0 =C2=A0 =C2=A0 build_tooldir=C2=A0 =C2=A0 string<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0oldgoos=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strin=
g<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0oldgoarch=C2=A0 =C2=A0 =C2=A0 =C2=A0 string<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0exe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 string<br>
+@@ -49,6 +50,7 @@ var (<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rebuildall=C2=A0 =C2=A0bool<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0defaultclang bool<br>
++=C2=A0 =C2=A0 =C2=A0 crossBuild=C2=A0 =C2=A0bool<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vflag int // verbosity<br>
+ )<br>
+@@ -223,6 +225,8 @@ func xinit() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if tooldir =3D os.Getenv(&quot;GOTOOLDIR&quot;)=
; tooldir =3D=3D &quot;&quot; {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tooldir =3D pathf(&=
quot;%s/pkg/tool/%s_%s&quot;, goroot, gohostos, gohostarch)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 build_tooldir =3D pathf(&quot;%s/pkg/tool/native_<wb=
r>native&quot;, goroot)<br>
++<br>
+ }<br>
+<br>
+ // compilerEnv returns a map from &quot;goos/goarch&quot; to the<br>
+@@ -252,7 +256,6 @@ func compilerEnv(envName, def string) map[string]strin=
g {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if gohostos !=3D go=
os || gohostarch !=3D goarch {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0m[gohostos+&quot;/&quot;+gohostarch] =3D m[&quot;&quot;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m[&quot;&quot;] =3D env<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for _, goos :=3D range okgoos {<br>
+@@ -479,8 +482,10 @@ func setup() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// We keep it in pkg/, just like the object dir=
ectory above.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if rebuildall {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xremoveall(tooldir)=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xremoveall(build_tooldir=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0xmkdirall(tooldir)<br>
++=C2=A0 =C2=A0 =C2=A0 xmkdirall(build_tooldir)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Remove tool binaries from before the tool/go=
hostos_gohostarch<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0xremoveall(pathf(&quot;%s/bin/tool&quot;<wbr>, =
goroot))<br>
+@@ -1130,11 +1135,29 @@ func cmdbootstrap() {<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0var noBanner bool<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0var debug bool<br>
++=C2=A0 =C2=A0 =C2=A0 var hostOnly bool<br>
++=C2=A0 =C2=A0 =C2=A0 var targetOnly bool<br>
++=C2=A0 =C2=A0 =C2=A0 var toBuild =3D []string { &quot;std&quot;, &quot;cm=
d&quot; }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0flag.BoolVar(&amp;rebuildall, &quot;a&quot;, re=
buildall, &quot;rebuild all&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0flag.BoolVar(&amp;debug, &quot;d&quot;, debug, =
&quot;enable debugging of bootstrap process&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0flag.BoolVar(&amp;noBanner, &quot;no-banner&quo=
t;, noBanner, &quot;do not print banner&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 flag.BoolVar(&amp;hostOnly, &quot;host-only&quot;, h=
ostOnly, &quot;build only host binaries, not target&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 flag.BoolVar(&amp;targetOnly, &quot;target-only&quot=
;, targetOnly, &quot;build only target binaries, not host&quot;)<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 xflagparse(0)<br>
++=C2=A0 =C2=A0 =C2=A0 xflagparse(-1)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (hostOnly &amp;&amp; targetOnly) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fatalf(&quot;specify onl=
y one of --host-only or --target-only\n&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 crossBuild =3D hostOnly || targetOnly<br>
++=C2=A0 =C2=A0 =C2=A0 if flag.NArg() &gt; 0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if crossBuild {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 toBuild =3D flag.Args()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fatalf(&quot;package names not permitted without --host-only or --targe=
t-only\n&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if debug {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// cmd/buildid is u=
sed in debug mode.<br>
+@@ -1182,8 +1205,13 @@ func cmdbootstrap() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xprintf(&quot;\n&qu=
ot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 gogcflags =3D os.Getenv(&quot;GO_GCFLAGS&quot;) // w=
e were using $BOOT_GO_GCFLAGS until now<br>
+-=C2=A0 =C2=A0 =C2=A0 goldflags =3D os.Getenv(&quot;GO_LDFLAGS&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 // For split host/target cross/cross-canadian builds=
, we don&#39;t<br>
++=C2=A0 =C2=A0 =C2=A0 // want to be setting these flags until after we hav=
e compiled<br>
++=C2=A0 =C2=A0 =C2=A0 // the toolchain that runs on the build host.<br>
++=C2=A0 =C2=A0 =C2=A0 if ! crossBuild {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gogcflags =3D os.Getenv(=
&quot;GO_GCFLAGS&quot;) // we were using $BOOT_GO_GCFLAGS until now<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goldflags =3D os.Getenv(=
&quot;GO_LDFLAGS&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0goBootstrap :=3D pathf(&quot;%s/go_bootstrap&qu=
ot;, tooldir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cmdGo :=3D pathf(&quot;%s/go&quot;, gobin)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if debug {<br>
+@@ -1212,7 +1240,11 @@ func cmdbootstrap() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xprintf(&quot;\n&qu=
ot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0xprintf(&quot;Building Go toolchain2 using go_b=
ootstrap and Go toolchain1.\n&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;CC&quot;, compilerEnvLookup(defaultc=
c, goos, goarch))<br>
++=C2=A0 =C2=A0 =C2=A0 if crossBuild {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;CC&quot;=
, defaultcc[&quot;&quot;])<br>
++=C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;CC&quot;=
, compilerEnvLookup(defaultcc, goos, goarch))<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0goInstall(goBootstrap, append([]string{&quot;-i=
&quot;}, toolchain...)...)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if debug {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0run(&quot;&quot;, S=
howOutput|CheckExit, pathf(&quot;%s/compile&quot;, tooldir), &quot;-V=3Dful=
l&quot;)<br>
+@@ -1249,45 +1281,82 @@ func cmdbootstrap() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0checkNotStale(goBootstrap, append(toolchain, &q=
uot;runtime/internal/sys&quot;)...)<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 if goos =3D=3D oldgoos &amp;&amp; goarch =3D=3D oldg=
oarch {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Common case - not set=
ting up for cross-compilation.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timelog(&quot;build&quot=
;, &quot;toolchain&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if vflag &gt; 0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xprintf(&quot;\n&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 if crossBuild {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gogcflags =3D os.Getenv(=
&quot;GO_GCFLAGS&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goldflags =3D os.Getenv(=
&quot;GO_LDFLAGS&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tool_files, _ :=3D filep=
ath.Glob(pathf(&quot;%s/*&quot;, tooldir))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for _, f :=3D range tool=
_files {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 copyfile(pathf(&quot;%s/%s&quot;, build_tooldir, filepath.Base(f)), f, =
writeExec)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xremove(f)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;GOTOOLDI=
R&quot;, build_tooldir)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goBootstrap =3D pathf(&q=
uot;%s/go_bootstrap&quot;, build_tooldir)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if hostOnly {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 timelog(&quot;build&quot;, &quot;host toolchain&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if vflag &gt; 0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;\n&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xprintf(&quot;Building %s for host, %s/%s.\n&quot;, strings.Join(toBuil=
d, &quot;,&quot;), goos, goarch)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goInstall(goBootstrap, toBuild...)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 checkNotStale(goBootstrap, toBuild...)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // Skip cmdGo staleness checks here, since we can&#39;t necessarily run=
 the cmdGo binary<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 timelog(&quot;build&quot;, &quot;target toolchain&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if vflag &gt; 0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;\n&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if targetOnly {<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goos =3D oldgoos<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goarch =3D oldgoarch<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 os.Setenv(&quot;GOOS&quot;, goos)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 os.Setenv(&quot;GOARCH&quot;, goarch)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 os.Setenv(&quot;CC&quot;, compilerEnvLookup(defaultcc, goos, goarch))<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xprintf(&quot;Building %s for target, %s/%s.\n&quot;, strings.Join(toBu=
ild, &quot;,&quot;), goos, goarch)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goInstall(goBootstrap, toBuild...)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 checkNotStale(goBootstrap, toBuild...)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // Skip cmdGo staleness checks here, since we can&#39;t run the target&=
#39;s cmdGo binary<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;Building p=
ackages and commands for %s/%s.\n&quot;, goos, goarch)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // GOOS/GOARCH does not =
match GOHOSTOS/GOHOSTARCH.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Finish GOHOSTOS/GOHOS=
TARCH installation and then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // run GOOS/GOARCH insta=
llation.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timelog(&quot;build&quot=
;, &quot;host toolchain&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if vflag &gt; 0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xprintf(&quot;\n&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if goos =3D=3D oldgoos &=
amp;&amp; goarch =3D=3D oldgoarch {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // Common case - not setting up for cross-compilation.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 timelog(&quot;build&quot;, &quot;toolchain&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if vflag &gt; 0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;\n&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xprintf(&quot;Building packages and commands for %s/%s.\n&quot;, goos, =
goarch)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // GOOS/GOARCH does not match GOHOSTOS/GOHOSTARCH.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // Finish GOHOSTOS/GOHOSTARCH installation and then<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // run GOOS/GOARCH installation.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 timelog(&quot;build&quot;, &quot;host toolchain&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if vflag &gt; 0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;\n&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xprintf(&quot;Building packages and commands for host, %s/%s.\n&quot;, =
goos, goarch)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goInstall(goBootstrap, &quot;std&quot;, &quot;cmd&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 checkNotStale(goBootstrap, &quot;std&quot;, &quot;cmd&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 checkNotStale(cmdGo, &quot;std&quot;, &quot;cmd&quot;)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 timelog(&quot;build&quot;, &quot;target toolchain&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if vflag &gt; 0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;\n&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goos =3D oldgoos<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goarch =3D oldgoarch<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 os.Setenv(&quot;GOOS&quot;, goos)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 os.Setenv(&quot;GOARCH&quot;, goarch)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 os.Setenv(&quot;CC&quot;, compilerEnvLookup(defaultcc, goos, goarch))<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xprintf(&quot;Building packages and commands for target, %s/%s.\n&quot;=
, goos, goarch)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;Building p=
ackages and commands for host, %s/%s.\n&quot;, goos, goarch)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goInstall(goBootstr=
ap, &quot;std&quot;, &quot;cmd&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkNotStale(goBoo=
tstrap, &quot;std&quot;, &quot;cmd&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkNotStale(cmdGo=
, &quot;std&quot;, &quot;cmd&quot;)<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timelog(&quot;build&quot=
;, &quot;target toolchain&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if vflag &gt; 0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xprintf(&quot;\n&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if debug {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 run(&quot;&quot;, ShowOutput|CheckExit, pathf(&quot;%s/compile&quot;, t=
ooldir), &quot;-V=3Dfull&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 run(&quot;&quot;, ShowOutput|CheckExit, pathf(&quot;%s/buildid&quot;, t=
ooldir), pathf(&quot;%s/pkg/%s_%s/runtime/<wbr>internal/sys.a&quot;, goroot=
, goos, goarch))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 checkNotStale(goBootstrap, append(toolchain, &quot;runtime/internal/sys=
&quot;)...)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 copyfile(pathf(&quot;%s/compile4&quot;, tooldir), pathf(&quot;%s/compil=
e&quot;, tooldir), writeExec)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goos =3D oldgoos<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goarch =3D oldgoarch<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;GOOS&quo=
t;, goos)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;GOARCH&q=
uot;, goarch)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;CC&quot;=
, compilerEnvLookup(defaultcc, goos, goarch))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;Building p=
ackages and commands for target, %s/%s.\n&quot;, goos, goarch)<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 goInstall(goBootstrap, &quot;std&quot;, &quot;cmd&qu=
ot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 checkNotStale(goBootstrap, &quot;std&quot;, &quot;cm=
d&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 checkNotStale(cmdGo, &quot;std&quot;, &quot;cmd&quot=
;)<br>
+-=C2=A0 =C2=A0 =C2=A0 if debug {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 run(&quot;&quot;, ShowOu=
tput|CheckExit, pathf(&quot;%s/compile&quot;, tooldir), &quot;-V=3Dfull&quo=
t;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 run(&quot;&quot;, ShowOu=
tput|CheckExit, pathf(&quot;%s/buildid&quot;, tooldir), pathf(&quot;%s/pkg/=
%s_%s/runtime/<wbr>internal/sys.a&quot;, goroot, goos, goarch))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 checkNotStale(goBootstra=
p, append(toolchain, &quot;runtime/internal/sys&quot;)...)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copyfile(pathf(&quot;%s/=
compile4&quot;, tooldir), pathf(&quot;%s/compile&quot;, tooldir), writeExec=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Check that there are no new files in $GOROOT=
/bin other than<br>
+@@ -1305,7 +1374,11 @@ func cmdbootstrap() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Remove go_bootstrap now that we&#39;re done.=
<br>
+-=C2=A0 =C2=A0 =C2=A0 xremove(pathf(&quot;%s/go_<wbr>bootstrap&quot;, tool=
dir))<br>
++=C2=A0 =C2=A0 =C2=A0 // Except that for split host/target cross-builds, w=
e need to<br>
++=C2=A0 =C2=A0 =C2=A0 // keep it.<br>
++=C2=A0 =C2=A0 =C2=A0 if ! crossBuild {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xremove(pathf(&quot;%s/g=
o_<wbr>bootstrap&quot;, tooldir))<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Print trailing banner unless instructed othe=
rwise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if !noBanner {<br>
+--<br>
+2.14.1<br>
+<br>
diff --git a/meta/recipes-devtools/go/go-<wbr>1.10/0007-cmd-go-make-GOROOT-=
<wbr>precious-by-default.patch b/meta/recipes-devtools/go/go-<wbr>1.10/0007=
-cmd-go-make-GOROOT-<wbr>precious-by-default.patch<br>
new file mode 100644<br>
index 0000000000..cadca3012b<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/go-<wbr>1.10/0007-cmd-go-make-GOROOT-<wbr>pr=
ecious-by-default.patch<br>
@@ -0,0 +1,97 @@<br>
+From 71653883c263093624e6c92d4cd518<wbr>7433887690 Mon Sep 17 00:00:00 200=
1<br>
+From: Matt Madison &lt;matt@madison.systems&gt;<br>
+Date: Sun, 18 Feb 2018 15:03:14 -0800<br>
+Subject: [PATCH 7/8] cmd/go: make GOROOT precious by default<br>
+<br>
+The go build tool normally rebuilds whatever it detects is<br>
+stale.=C2=A0 This can be a problem when GOROOT is intended to<br>
+be read-only and the go runtime has been built as a shared<br>
+library, since we don&#39;t want every application to be rebuilding<br>
+the shared runtime - particularly in cross-build/packaging<br>
+setups, since that would lead to &#39;abi mismatch&#39; runtime errors.<br=
>
+<br>
+This patch adds logic to treat the standard library and all<br>
+other GOROOT-resident packages as essentially binary-only.<br>
+If, during compilation, any of those packages are &#39;stale&#39;,<br>
+an error is issued instead of rebuilding the stale components.<br>
+<br>
+For an OE build, staleness errors would indicate a problem<br>
+with the build (missing dependencies, sstate issues, etc.).<br>
+<br>
+Upstream-Status: Inappropriate [OE specific]<br>
+<br>
+Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
+---<br>
+ src/cmd/go/internal/work/<wbr>build.go=C2=A0 =C2=A0|=C2=A0 5 +++++<br>
+ src/cmd/go/internal/work/<wbr>buildid.go |=C2=A0 2 +-<br>
+ src/cmd/go/internal/work/exec.<wbr>go=C2=A0 =C2=A0 | 18 +++++++++++++++++=
+<br>
+ 3 files changed, 24 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/cmd/go/internal/work/<wbr>build.go b/src/cmd/go/internal/=
work/<wbr>build.go<br>
+index 57b7b00879..e2ba95420e 100644<br>
+--- a/src/cmd/go/internal/work/<wbr>build.go<br>
++++ b/src/cmd/go/internal/work/<wbr>build.go<br>
+@@ -143,6 +143,7 @@ See also: go install, go get, go clean.<br>
+ }<br>
+<br>
+ const concurrentGCBackendCompilation<wbr>EnabledByDefault =3D true<br>
++var goRootPrecious bool =3D true<br>
+<br>
+ func init() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// break init cycle<br>
+@@ -156,6 +157,10 @@ func init() {<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0AddBuildFlags(CmdBuild)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0AddBuildFlags(CmdInstall)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if x :=3D os.Getenv(&quot;GOROOT_OVERRIDE&quot;); x =
!=3D &quot;&quot; {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goRootPrecious =3D false=
<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+ }<br>
+<br>
+ // Note that flags consulted by other parts of the code<br>
+diff --git a/src/cmd/go/internal/work/<wbr>buildid.go b/src/cmd/go/interna=
l/work/<wbr>buildid.go<br>
+index 39ca20ee4f..a047430177 100644<br>
+--- a/src/cmd/go/internal/work/<wbr>buildid.go<br>
++++ b/src/cmd/go/internal/work/<wbr>buildid.go<br>
+@@ -463,7 +463,7 @@ func (b *Builder) useCache(a *Action, p *load.Package,=
 actionHash cache.ActionID<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if b.ComputeStaleOnly {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Invoked during g=
o list only to compute and record staleness.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if p :=3D a.Package; p !=
=3D nil &amp;&amp; !p.Stale {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if p :=3D a.Package; p !=
=3D nil &amp;&amp; !p.Stale &amp;&amp; !(goRootPrecious &amp;&amp; (p.Stand=
ard || p.Goroot)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0p.Stale =3D true<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if cfg.BuildA {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p.StaleReason =3D &quot;build -a flag=
 in use&quot;<br>
+diff --git a/src/cmd/go/internal/work/<wbr>exec.go b/src/cmd/go/internal/w=
ork/<wbr>exec.go<br>
+index b0f6b45647..a876d59347 100644<br>
+--- a/src/cmd/go/internal/work/<wbr>exec.go<br>
++++ b/src/cmd/go/internal/work/<wbr>exec.go<br>
+@@ -371,6 +371,24 @@ func (b *Builder) build(a *Action) (err error) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return fmt.Errorf(&=
quot;missing or invalid binary-only package&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
++=C2=A0 =C2=A0 =C2=A0 if goRootPrecious &amp;&amp; (a.Package.Standard || =
a.Package.Goroot) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _, err :=3D os.Stat(a.Pa=
ckage.Target)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if err =3D=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 a.built =3D a.Package.Target<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 a.Target =3D a.Package.Target<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 a.buildID =3D b.fileHash(a.Package.Target)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 a.Package.Stale =3D false<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 a.Package.StaleReason =3D &quot;GOROOT-resident package&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return nil<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if b.ComputeStaleOnly {<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 a.Package.Stale =3D true<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 a.Package.StaleReason =3D &quot;missing or invalid GOROOT-resident pack=
age&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return nil<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return fmt.Errorf(&quot;=
missing or invalid GOROOT-resident package&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if err :=3D b.Mkdir(a.Objdir); err !=3D nil {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+--<br>
+2.14.1<br>
+<br>
diff --git a/meta/recipes-devtools/go/go-<wbr>1.10/0008-ld-replace-glibc-<w=
br>dynamic-linker-with-musl.patch b/meta/recipes-devtools/go/go-<wbr>1.10/0=
008-ld-replace-glibc-<wbr>dynamic-linker-with-musl.patch<br>
new file mode 100644<br>
index 0000000000..cc7179cb2c<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/go-<wbr>1.10/0008-ld-replace-glibc-<wbr>dyna=
mic-linker-with-musl.patch<br>
@@ -0,0 +1,130 @@<br>
+From 5c3ed89c29d4f40ea4e66d569b1f6c<wbr>9c4a51cd42 Mon Sep 17 00:00:00 200=
1<br>
+From: Matt Madison &lt;matt@madison.systems&gt;<br>
+Date: Sun, 18 Feb 2018 08:24:05 -0800<br>
+Subject: [PATCH 8/8] ld: replace glibc dynamic linker with musl<br>
+<br>
+Rework of patch by Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.=
khem@gmail.com</a>&gt;<br>
+for go 1.10.=C2=A0 Should be applied conditionally on<br>
+musl being the system C library.<br>
+<br>
+Upstream-Status: Inappropriate [Real fix should be portable across libcs]<=
br>
+<br>
+Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
+---<br>
+ src/cmd/link/internal/amd64/<wbr>obj.go=C2=A0 | 2 +-<br>
+ src/cmd/link/internal/arm/obj.<wbr>go=C2=A0 =C2=A0 | 2 +-<br>
+ src/cmd/link/internal/arm64/<wbr>obj.go=C2=A0 | 2 +-<br>
+ src/cmd/link/internal/mips/<wbr>obj.go=C2=A0 =C2=A0| 2 +-<br>
+ src/cmd/link/internal/mips64/<wbr>obj.go | 2 +-<br>
+ src/cmd/link/internal/ppc64/<wbr>obj.go=C2=A0 | 2 +-<br>
+ src/cmd/link/internal/s390x/<wbr>obj.go=C2=A0 | 2 +-<br>
+ src/cmd/link/internal/x86/obj.<wbr>go=C2=A0 =C2=A0 | 2 +-<br>
+ 8 files changed, 8 insertions(+), 8 deletions(-)<br>
+<br>
+diff --git a/src/cmd/link/internal/amd64/<wbr>obj.go b/src/cmd/link/intern=
al/amd64/<wbr>obj.go<br>
+index 87e809166a..f522a63034 100644<br>
+--- a/src/cmd/link/internal/amd64/<wbr>obj.go<br>
++++ b/src/cmd/link/internal/amd64/<wbr>obj.go<br>
+@@ -62,7 +62,7 @@ func Init() (*sys.Arch, ld.Arch) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PEreloc1:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0pereloc1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TLSIEtoLE:=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 tlsIEtoLE,<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld:=C2=A0 =C2=A0=
 =C2=A0&quot;/lib64/ld-linux-x86-64.so.2&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld:=C2=A0 =C2=A0=
 =C2=A0&quot;/lib64/ld-musl-x86-64.so.1&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Freebsddynld:=C2=A0=
 =C2=A0&quot;/libexec/ld-elf.so.1&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Openbsddynld:=C2=A0=
 =C2=A0&quot;/usr/libexec/ld.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Netbsddynld:=C2=A0 =
=C2=A0 &quot;/libexec/ld.elf_so&quot;,<br>
+diff --git a/src/cmd/link/internal/arm/<wbr>obj.go b/src/cmd/link/internal=
/arm/<wbr>obj.go<br>
+index da16f92345..fd14940ede 100644<br>
+--- a/src/cmd/link/internal/arm/<wbr>obj.go<br>
++++ b/src/cmd/link/internal/arm/<wbr>obj.go<br>
+@@ -58,7 +58,7 @@ func Init() (*sys.Arch, ld.Arch) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Gentext:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 gentext,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Machoreloc1:=C2=A0 =
=C2=A0 =C2=A0 machoreloc1,<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld:=C2=A0 =C2=A0=
 =C2=A0&quot;/lib/ld-linux.so.3&quot;, // 2 for OABI, 3 for EABI<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld:=C2=A0 =C2=A0=
 =C2=A0&quot;/lib/ld-musl-armhf.so.1&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Freebsddynld:=C2=A0=
 =C2=A0&quot;/usr/libexec/ld-elf.so.1&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Openbsddynld:=C2=A0=
 =C2=A0&quot;/usr/libexec/ld.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Netbsddynld:=C2=A0 =
=C2=A0 &quot;/libexec/ld.elf_so&quot;,<br>
+diff --git a/src/cmd/link/internal/arm64/<wbr>obj.go b/src/cmd/link/intern=
al/arm64/<wbr>obj.go<br>
+index 6b386ad737..99863712cc 100644<br>
+--- a/src/cmd/link/internal/arm64/<wbr>obj.go<br>
++++ b/src/cmd/link/internal/arm64/<wbr>obj.go<br>
+@@ -57,7 +57,7 @@ func Init() (*sys.Arch, ld.Arch) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Gentext:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 gentext,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Machoreloc1:=C2=A0 =
=C2=A0 =C2=A0 machoreloc1,<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld: &quot;/lib/l=
d-linux-aarch64.so.1&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld: &quot;/lib/l=
d-musl-aarch64.so.1&quot;,<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Freebsddynld:=C2=A0=
 =C2=A0&quot;XXX&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Openbsddynld:=C2=A0=
 =C2=A0&quot;XXX&quot;,<br>
+diff --git a/src/cmd/link/internal/mips/<wbr>obj.go b/src/cmd/link/interna=
l/mips/<wbr>obj.go<br>
+index c5d3451c39..fd85e6368d 100644<br>
+--- a/src/cmd/link/internal/mips/<wbr>obj.go<br>
++++ b/src/cmd/link/internal/mips/<wbr>obj.go<br>
+@@ -60,7 +60,7 @@ func Init() (*sys.Arch, ld.Arch) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Gentext:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 gentext,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Machoreloc1:=C2=A0 =
=C2=A0 =C2=A0 machoreloc1,<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld: &quot;/lib/l=
d.so.1&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld: &quot;/lib/l=
d-musl-mipsle.so.1&quot;,<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Freebsddynld:=C2=A0=
 =C2=A0&quot;XXX&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Openbsddynld:=C2=A0=
 =C2=A0&quot;XXX&quot;,<br>
+diff --git a/src/cmd/link/internal/<wbr>mips64/obj.go b/src/cmd/link/inter=
nal/<wbr>mips64/obj.go<br>
+index 83974e5b56..097224f6da 100644<br>
+--- a/src/cmd/link/internal/<wbr>mips64/obj.go<br>
++++ b/src/cmd/link/internal/<wbr>mips64/obj.go<br>
+@@ -59,7 +59,7 @@ func Init() (*sys.Arch, ld.Arch) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Gentext:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 gentext,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Machoreloc1:=C2=A0 =
=C2=A0 =C2=A0 machoreloc1,<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld:=C2=A0 =C2=A0=
 =C2=A0&quot;/lib64/ld64.so.1&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld:=C2=A0 =C2=A0=
 =C2=A0&quot;/lib64/ld-musl-mips64le.so.1&quot;<wbr>,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Freebsddynld:=C2=A0=
 =C2=A0&quot;XXX&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Openbsddynld:=C2=A0=
 =C2=A0&quot;XXX&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Netbsddynld:=C2=A0 =
=C2=A0 &quot;XXX&quot;,<br>
+diff --git a/src/cmd/link/internal/ppc64/<wbr>obj.go b/src/cmd/link/intern=
al/ppc64/<wbr>obj.go<br>
+index 273d9b42cb..a503abe8ea 100644<br>
+--- a/src/cmd/link/internal/ppc64/<wbr>obj.go<br>
++++ b/src/cmd/link/internal/ppc64/<wbr>obj.go<br>
+@@ -62,7 +62,7 @@ func Init() (*sys.Arch, ld.Arch) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Machoreloc1:=C2=A0 =
=C2=A0 =C2=A0 machoreloc1,<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// TODO(austin): AB=
I v1 uses /usr/lib/ld.so.1,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld: &quot;/lib64=
/ld64.so.1&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld: &quot;/lib64=
/ld-musl-powerpc64le.<wbr>so.1&quot;,<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Freebsddynld:=C2=A0=
 =C2=A0&quot;XXX&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Openbsddynld:=C2=A0=
 =C2=A0&quot;XXX&quot;,<br>
+diff --git a/src/cmd/link/internal/s390x/<wbr>obj.go b/src/cmd/link/intern=
al/s390x/<wbr>obj.go<br>
+index 9ac7eb8217..3825ff7abe 100644<br>
+--- a/src/cmd/link/internal/s390x/<wbr>obj.go<br>
++++ b/src/cmd/link/internal/s390x/<wbr>obj.go<br>
+@@ -57,7 +57,7 @@ func Init() (*sys.Arch, ld.Arch) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Gentext:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 gentext,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Machoreloc1:=C2=A0 =
=C2=A0 =C2=A0 machoreloc1,<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld: &quot;/lib64=
/ld64.so.1&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld: &quot;/lib64=
/ld-musl-s390x.so.1&quot;,<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// not relevant for=
 s390x<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Freebsddynld:=C2=A0=
 =C2=A0&quot;XXX&quot;,<br>
+diff --git a/src/cmd/link/internal/x86/<wbr>obj.go b/src/cmd/link/internal=
/x86/<wbr>obj.go<br>
+index 6a744dc04e..d81f392549 100644<br>
+--- a/src/cmd/link/internal/x86/<wbr>obj.go<br>
++++ b/src/cmd/link/internal/x86/<wbr>obj.go<br>
+@@ -58,7 +58,7 @@ func Init() (*sys.Arch, ld.Arch) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Machoreloc1:=C2=A0 =
=C2=A0 =C2=A0 machoreloc1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PEreloc1:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0pereloc1,<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld:=C2=A0 =C2=A0=
&quot;/lib/ld-linux.so.2&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld:=C2=A0 =C2=A0=
&quot;/lib/ld-musl-i386.so.1&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Freebsddynld: &quot=
;/usr/libexec/ld-elf.so.1&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Openbsddynld: &quot=
;/usr/libexec/ld.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Netbsddynld:=C2=A0 =
&quot;/usr/libexec/ld.elf_so&quot;,<br>
+--<br>
+2.14.1<br>
+<br>
diff --git a/meta/recipes-devtools/go/go-<wbr>1.9.inc b/meta/recipes-devtoo=
ls/go/go-<wbr>1.9.inc<br>
deleted file mode 100644<br>
index 2823304b7c..0000000000<br>
--- a/meta/recipes-devtools/go/go-<wbr>1.9.inc<br>
+++ /dev/null<br>
@@ -1,26 +0,0 @@<br>
-require go-common.inc<br>
-<br>
-GO_BASEVERSION =3D &quot;1.9&quot;<br>
-GO_MINOR =3D &quot;.4&quot;<br>
-PV .=3D &quot;${GO_MINOR}&quot;<br>
-<br>
-FILESEXTRAPATHS_prepend :=3D &quot;${FILE_DIRNAME}/go-${GO_<wbr>BASEVERSIO=
N}:&quot;<br>
-<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>5d4950ecb7b26d2c5e4e7=
b4e0dd747<wbr>07&quot;<br>
-<br>
-SRC_URI +=3D &quot;\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-make.bash-quote-<wbr>CC_FOR_TARGET=
.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-cmd-go-fix-CC-and-<wbr>CXX-environ=
ment-variable-<wbr>construct.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-make.bash-better-<wbr>separate-hos=
t-and-target-<wbr>builds.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-cmd-go-allow-<wbr>GOTOOLDIR-to-be-=
overridden-in-<wbr>the-envir.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0005-cmd-go-make-<wbr>GOROOT-precious-b=
y-default.<wbr>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0006-make.bash-add-<wbr>GOTOOLDIR_BOOTS=
TRAP-<wbr>environment-variab.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0007-ld-add-soname-to-<wbr>shareable-ob=
jects.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0008-make.bash-add-<wbr>GOHOSTxx-indire=
ction-for-<wbr>cross-canadia.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0009-cmd-go-buildmode-<wbr>pie-forces-e=
xternal-linking-<wbr>mode-on.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0010-make.bash-<wbr>override-CC-when-bu=
ilding-<wbr>dist-and-go_boot.patch \<br>
-&quot;<br>
-SRC_URI_append_libc-musl =3D &quot; file://set-external-linker.<wbr>patch&=
quot;<br>
-<br>
-SRC_URI[main.md5sum] =3D &quot;<wbr>6816441fd6680c63865cdd5cb8bc19<wbr>60&=
quot;<br>
-SRC_URI[main.sha256sum] =3D &quot;<wbr>0573a8df33168977185aa44173305e<wbr>=
5a0450f55213600e94541604b75d46<wbr>dc06&quot;<br>
diff --git a/meta/recipes-devtools/go/go-<wbr>1.9/0001-make.bash-quote-CC_<=
wbr>FOR_TARGET.patch b/meta/recipes-devtools/go/go-<wbr>1.9/0001-make.bash-=
quote-CC_<wbr>FOR_TARGET.patch<br>
deleted file mode 100644<br>
index 7800975e48..0000000000<br>
--- a/meta/recipes-devtools/go/go-<wbr>1.9/0001-make.bash-quote-CC_<wbr>FOR=
_TARGET.patch<br>
+++ /dev/null<br>
@@ -1,32 +0,0 @@<br>
-From d24734ad44006791fd48fc45ea34fe<wbr>608ff672fb Mon Sep 17 00:00:00 200=
1<br>
-From: Matt Madison &lt;matt@madison.systems&gt;<br>
-Date: Wed, 13 Sep 2017 08:04:23 -0700<br>
-Subject: [PATCH 1/7] make.bash: quote CC_FOR_TARGET<br>
-<br>
-For OE cross-builds, $CC_FOR_TARGET has more than<br>
-one word and needs to be quoted.<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
-Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
----<br>
- src/make.bash | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/src/make.bash b/src/make.bash<br>
-index 71e7531..dcf3256 100755<br>
---- a/src/make.bash<br>
-+++ b/src/make.bash<br>
-@@ -175,7 +175,7 @@ echo &quot;##### Building packages and commands for $G=
OOS/$GOARCH.&quot;<br>
-<br>
- old_bin_files=3D$(cd $GOROOT/bin &amp;&amp; echo *)<br>
-<br>
--CC=3D$CC_FOR_TARGET &quot;$GOTOOLDIR&quot;/go_bootstrap install $GO_FLAGS=
 -gcflags &quot;$GO_GCFLAGS&quot; -ldflags &quot;$GO_LDFLAGS&quot; -v std c=
md<br>
-+CC=3D&quot;$CC_FOR_TARGET&quot; &quot;$GOTOOLDIR&quot;/go_bootstrap insta=
ll $GO_FLAGS -gcflags &quot;$GO_GCFLAGS&quot; -ldflags &quot;$GO_LDFLAGS&qu=
ot; -v std cmd<br>
-<br>
- # Check that there are no new files in $GOROOT/bin other than go and gofm=
t<br>
- # and $GOOS_$GOARCH (a directory used when cross-compiling).<br>
---<br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-devtools/go/go-<wbr>1.9/0002-cmd-go-fix-CC-and-<w=
br>CXX-environment-variable-<wbr>construct.patch b/meta/recipes-devtools/go=
/go-<wbr>1.9/0002-cmd-go-fix-CC-and-<wbr>CXX-environment-variable-<wbr>cons=
truct.patch<br>
deleted file mode 100644<br>
index a4e42261c3..0000000000<br>
--- a/meta/recipes-devtools/go/go-<wbr>1.9/0002-cmd-go-fix-CC-and-<wbr>CXX-=
environment-variable-<wbr>construct.patch<br>
+++ /dev/null<br>
@@ -1,67 +0,0 @@<br>
-From a7170d32a13aead608abd18996f6da<wbr>b2e2a631b5 Mon Sep 17 00:00:00 200=
1<br>
-From: Matt Madison &lt;matt@madison.systems&gt;<br>
-Date: Wed, 13 Sep 2017 08:06:37 -0700<br>
-Subject: [PATCH 2/7] cmd/go: fix CC and CXX environment variable construct=
ion<br>
-<br>
-For OE cross-builds, CC and CXX have multiple words, and<br>
-we need their complete definitions when setting up the<br>
-environment during Go builds.<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
-Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
----<br>
- src/cmd/go/internal/envcmd/<wbr>env.go |=C2=A0 4 ++--<br>
- src/cmd/go/internal/work/<wbr>build.go | 12 ++++++++++++<br>
- 2 files changed, 14 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/src/cmd/go/internal/envcmd/<wbr>env.go b/src/cmd/go/internal/=
envcmd/<wbr>env.go<br>
-index 43d4334..529d21d 100644<br>
---- a/src/cmd/go/internal/envcmd/<wbr>env.go<br>
-+++ b/src/cmd/go/internal/envcmd/<wbr>env.go<br>
-@@ -74,10 +74,10 @@ func MkEnv() []cfg.EnvVar {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd :=3D b.GccCmd(&quot;.&quot;)<br>
--=C2=A0 =C2=A0 =C2=A0 env =3D append(env, cfg.EnvVar{Name: &quot;CC&quot;,=
 Value: cmd[0]})<br>
-+=C2=A0 =C2=A0 =C2=A0 env =3D append(env, cfg.EnvVar{Name: &quot;CC&quot;,=
 Value: strings.Join(b.GccCmdForReal()<wbr>, &quot; &quot;)})<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0env =3D append(env, cfg.EnvVar{Name: &quot;GOGC=
CFLAGS&quot;, Value: strings.Join(cmd[3:], &quot; &quot;)})<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D b.GxxCmd(&quot;.&quot;)<br>
--=C2=A0 =C2=A0 =C2=A0 env =3D append(env, cfg.EnvVar{Name: &quot;CXX&quot;=
, Value: cmd[0]})<br>
-+=C2=A0 =C2=A0 =C2=A0 env =3D append(env, cfg.EnvVar{Name: &quot;CXX&quot;=
, Value: strings.Join(b.GxxCmdForReal()<wbr>, &quot; &quot;)})<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if cfg.BuildContext.CgoEnabled {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env =3D append(env,=
 cfg.EnvVar{Name: &quot;CGO_ENABLED&quot;, Value: &quot;1&quot;})<br>
-diff --git a/src/cmd/go/internal/work/<wbr>build.go b/src/cmd/go/internal/=
work/<wbr>build.go<br>
-index 7d667ff..85df0b3 100644<br>
---- a/src/cmd/go/internal/work/<wbr>build.go<br>
-+++ b/src/cmd/go/internal/work/<wbr>build.go<br>
-@@ -3127,12 +3127,24 @@ func (b *Builder) GccCmd(objdir string) []string {=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return b.ccompilerCmd(&quot;CC&quot;, cfg.Defau=
ltCC, objdir)<br>
- }<br>
-<br>
-+// gccCmd returns a gcc command line prefix<br>
-+// defaultCC is defined in zdefaultcc.go, written by cmd/dist.<br>
-+func (b *Builder) GccCmdForReal() []string {<br>
-+=C2=A0 =C2=A0 =C2=A0 return envList(&quot;CC&quot;, cfg.DefaultCC)<br>
-+}<br>
-+<br>
- // gxxCmd returns a g++ command line prefix<br>
- // defaultCXX is defined in zdefaultcc.go, written by cmd/dist.<br>
- func (b *Builder) GxxCmd(objdir string) []string {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return b.ccompilerCmd(&quot;CXX&quot;, cfg.Defa=
ultCXX, objdir)<br>
- }<br>
-<br>
-+// gxxCmd returns a g++ command line prefix<br>
-+// defaultCXX is defined in zdefaultcc.go, written by cmd/dist.<br>
-+func (b *Builder) GxxCmdForReal() []string {<br>
-+=C2=A0 =C2=A0 =C2=A0 return envList(&quot;CXX&quot;, cfg.DefaultCXX)<br>
-+}<br>
-+<br>
- // gfortranCmd returns a gfortran command line prefix.<br>
- func (b *Builder) gfortranCmd(objdir string) []string {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return b.ccompilerCmd(&quot;FC&quot;, &quot;gfo=
rtran&quot;, objdir)<br>
---<br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-devtools/go/go-<wbr>1.9/0003-make.bash-better-<wb=
r>separate-host-and-target-<wbr>builds.patch b/meta/recipes-devtools/go/go-=
<wbr>1.9/0003-make.bash-better-<wbr>separate-host-and-target-<wbr>builds.pa=
tch<br>
deleted file mode 100644<br>
index ffd9f2359c..0000000000<br>
--- a/meta/recipes-devtools/go/go-<wbr>1.9/0003-make.bash-better-<wbr>separ=
ate-host-and-target-<wbr>builds.patch<br>
+++ /dev/null<br>
@@ -1,92 +0,0 @@<br>
-From 31e88f06af7ab787d8fe0c1ca62519<wbr>3e1799e167 Mon Sep 17 00:00:00 200=
1<br>
-From: Matt Madison &lt;matt@madison.systems&gt;<br>
-Date: Wed, 13 Sep 2017 08:12:04 -0700<br>
-Subject: [PATCH 3/7] make.bash: better separate host and target builds<br>
-<br>
-Fore OE cross-builds, the simple checks in make.bash are<br>
-insufficient for distinguishing host and target build<br>
-environments, so add some options for telling the<br>
-script which parts are being built.<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
-Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
----<br>
- src/make.bash | 51 ++++++++++++++++++++++++++++--<wbr>-------------------=
--<br>
- 1 file changed, 28 insertions(+), 23 deletions(-)<br>
-<br>
-diff --git a/src/make.bash b/src/make.bash<br>
-index dcf3256..9553623 100755<br>
---- a/src/make.bash<br>
-+++ b/src/make.bash<br>
-@@ -156,13 +156,22 @@ if [ &quot;$1&quot; =3D &quot;--no-clean&quot; ]; th=
en<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0buildall=3D&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0shift<br>
- fi<br>
--./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds go_bootstra=
p<br>
-+do_host_build=3D&quot;yes&quot;<br>
-+do_target_build=3D&quot;yes&quot;<br>
-+if [ &quot;$1&quot; =3D &quot;--target-only&quot; ]; then<br>
-+=C2=A0 =C2=A0 =C2=A0 do_host_build=3D&quot;no&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 shift<br>
-+elif [ &quot;$1&quot; =3D &quot;--host-only&quot; ]; then<br>
-+=C2=A0 =C2=A0 =C2=A0 do_target_build=3D&quot;no&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 shift<br>
-+fi<br>
-<br>
--# Delay move of dist tool to now, because bootstrap may clear tool direct=
ory.<br>
--mv cmd/dist/dist &quot;$GOTOOLDIR&quot;/dist<br>
--echo<br>
-+if [ &quot;$do_host_build&quot; =3D &quot;yes&quot; ]; then<br>
-+=C2=A0 =C2=A0 =C2=A0 ./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v=
 # builds go_bootstrap<br>
-+=C2=A0 =C2=A0 =C2=A0 # Delay move of dist tool to now, because bootstrap =
may clear tool directory.<br>
-+=C2=A0 =C2=A0 =C2=A0 mv cmd/dist/dist &quot;$GOTOOLDIR&quot;/dist<br>
-+=C2=A0 =C2=A0 =C2=A0 echo<br>
-<br>
--if [ &quot;$GOHOSTARCH&quot; !=3D &quot;$GOARCH&quot; -o &quot;$GOHOSTOS&=
quot; !=3D &quot;$GOOS&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;##### Building packages and commands=
 for host, $GOHOSTOS/$GOHOSTARCH.&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# CC_FOR_TARGET is recorded as the default comp=
iler for the go tool. When building for the host, however,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# use the host compiler, CC, from `cmd/dist/dis=
t env` instead.<br>
-@@ -171,24 +180,20 @@ if [ &quot;$GOHOSTARCH&quot; !=3D &quot;$GOARCH&quot=
; -o &quot;$GOHOSTOS&quot; !=3D &quot;$GOOS&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo<br>
- fi<br>
-<br>
--echo &quot;##### Building packages and commands for $GOOS/$GOARCH.&quot;<=
br>
--<br>
--old_bin_files=3D$(cd $GOROOT/bin &amp;&amp; echo *)<br>
--<br>
--CC=3D&quot;$CC_FOR_TARGET&quot; &quot;$GOTOOLDIR&quot;/go_bootstrap insta=
ll $GO_FLAGS -gcflags &quot;$GO_GCFLAGS&quot; -ldflags &quot;$GO_LDFLAGS&qu=
ot; -v std cmd<br>
--<br>
--# Check that there are no new files in $GOROOT/bin other than go and gofm=
t<br>
--# and $GOOS_$GOARCH (a directory used when cross-compiling).<br>
--(cd $GOROOT/bin &amp;&amp; for f in *; do<br>
--=C2=A0 =C2=A0 =C2=A0 if ! expr &quot; $old_bin_files go gofmt ${GOOS}_${G=
OARCH} &quot; : &quot;.* $f &quot; &gt;/dev/null 2&gt;/dev/null; then<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 1&gt;&amp;2 &quot;E=
RROR: unexpected new file in $GOROOT/bin: $f&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
--=C2=A0 =C2=A0 =C2=A0 fi<br>
--done)<br>
--<br>
--echo<br>
--<br>
--rm -f &quot;$GOTOOLDIR&quot;/go_bootstrap<br>
-+if [ &quot;$do_target_build&quot; =3D &quot;yes&quot; ]; then<br>
-+=C2=A0 =C2=A0 GO_INSTALL=3D&quot;${GO_TARGET_<wbr>INSTALL:-std cmd}&quot;=
<br>
-+=C2=A0 =C2=A0 echo &quot;##### Building packages and commands for $GOOS/$=
GOARCH.&quot;<br>
-+=C2=A0 =C2=A0 if [ &quot;$GOHOSTOS&quot; =3D &quot;$GOOS&quot; -a &quot;$=
GOHOSTARCH&quot; =3D &quot;$GOARCH&quot; -a &quot;$do_host_build&quot; =3D =
&quot;yes&quot; ]; then<br>
-+=C2=A0 =C2=A0 =C2=A0 rm -rf ./host-tools<br>
-+=C2=A0 =C2=A0 =C2=A0 mkdir ./host-tools<br>
-+=C2=A0 =C2=A0 =C2=A0 mv &quot;$GOTOOLDIR&quot;/* ./host-tools<br>
-+=C2=A0 =C2=A0 =C2=A0 GOTOOLDIR=3D&quot;$PWD/host-tools&quot;<br>
-+=C2=A0 =C2=A0 fi<br>
-+=C2=A0 =C2=A0 GOTOOLDIR=3D&quot;$GOTOOLDIR&quot; CC=3D&quot;$CC_FOR_TARGE=
T&quot; &quot;$GOTOOLDIR&quot;/go_bootstrap install $GO_FLAGS -gcflags &quo=
t;$GO_GCFLAGS&quot; -ldflags &quot;$GO_LDFLAGS&quot; -v ${GO_INSTALL}<br>
-+=C2=A0 =C2=A0 echo<br>
-+<br>
-+=C2=A0 =C2=A0 rm -f &quot;$GOTOOLDIR&quot;/go_bootstrap<br>
-+fi<br>
-<br>
- if [ &quot;$1&quot; !=3D &quot;--no-banner&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$GOTOOLDIR&quot;/dist banner<br>
---<br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-devtools/go/go-<wbr>1.9/0004-cmd-go-allow-<wbr>GO=
TOOLDIR-to-be-overridden-in-<wbr>the-envir.patch b/meta/recipes-devtools/go=
/go-<wbr>1.9/0004-cmd-go-allow-<wbr>GOTOOLDIR-to-be-overridden-in-<wbr>the-=
envir.patch<br>
deleted file mode 100644<br>
index 180b06a4d3..0000000000<br>
--- a/meta/recipes-devtools/go/go-<wbr>1.9/0004-cmd-go-allow-<wbr>GOTOOLDIR=
-to-be-overridden-in-<wbr>the-envir.patch<br>
+++ /dev/null<br>
@@ -1,68 +0,0 @@<br>
-From 1369178b497b12088ec4c2794606cc<wbr>9f14cc327c Mon Sep 17 00:00:00 200=
1<br>
-From: Matt Madison &lt;matt@madison.systems&gt;<br>
-Date: Wed, 13 Sep 2017 08:15:03 -0700<br>
-Subject: [PATCH 4/7] cmd/go: allow GOTOOLDIR to be overridden in the<br>
- environment<br>
-<br>
-For OE cross-builds, host-side tools reside in the native<br>
-GOROOT, not the target GOROOT.=C2=A0 Allow GOTOOLDIR to be set<br>
-in the environment to allow that split, rather than always<br>
-computing GOTOOLDIR relative to the GOROOT setting.<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
-Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
----<br>
- src/cmd/go/internal/cfg/cfg.go=C2=A0 =C2=A0 | 7 ++++++-<br>
- src/cmd/go/internal/work/<wbr>build.go | 2 +-<br>
- src/go/build/build.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 =
+-<br>
- 3 files changed, 8 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/src/cmd/go/internal/cfg/cfg.<wbr>go b/src/cmd/go/internal/cfg=
/cfg.<wbr>go<br>
-index b3ad1ce..c1dc974 100644<br>
---- a/src/cmd/go/internal/cfg/cfg.<wbr>go<br>
-+++ b/src/cmd/go/internal/cfg/cfg.<wbr>go<br>
-@@ -91,7 +91,12 @@ func init() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// as the tool directory does not move based on=
 environment variables.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// This matches the initialization of ToolDir i=
n go/build,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// except for using GOROOT rather than runtime.=
GOROOT().<br>
--=C2=A0 =C2=A0 =C2=A0 build.ToolDir =3D filepath.Join(GOROOT, &quot;pkg/to=
ol/&quot;+runtime.GOOS+&quot;_&quot;+<wbr>runtime.GOARCH)<br>
-+=C2=A0 =C2=A0 =C2=A0 s :=3D os.Getenv(&quot;GOTOOLDIR&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 if s =3D=3D &quot;&quot; {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build.ToolDir =3D filepa=
th.Join(GOROOT, &quot;pkg/tool/&quot;+runtime.GOOS+&quot;_&quot;+<wbr>runti=
me.GOARCH)<br>
-+=C2=A0 =C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build.ToolDir =3D s<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
- }<br>
-<br>
- func findGOROOT() string {<br>
-diff --git a/src/cmd/go/internal/work/<wbr>build.go b/src/cmd/go/internal/=
work/<wbr>build.go<br>
-index 85df0b3..7b9a69e 100644<br>
---- a/src/cmd/go/internal/work/<wbr>build.go<br>
-+++ b/src/cmd/go/internal/work/<wbr>build.go<br>
-@@ -1337,7 +1337,7 @@ func (b *Builder) build(a *Action) (err error) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0var cgoExe string<b=
r>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if a.cgo !=3D nil &amp;&=
amp; a.cgo.Target !=3D &quot;&quot; {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if a.cgo !=3D nil &amp;&=
amp; a.cgo.Target !=3D &quot;&quot; &amp;&amp; os.Getenv(&quot;GOTOOLDIR&qu=
ot;) =3D=3D &quot;&quot; {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0cgoExe =3D a.cgo.Target<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0cgoExe =3D base.Tool(&quot;cgo&quot;)<br>
-diff --git a/src/go/build/build.go b/src/go/build/build.go<br>
-index fd89871..e16145b 100644<br>
---- a/src/go/build/build.go<br>
-+++ b/src/go/build/build.go<br>
-@@ -1588,7 +1588,7 @@ func init() {<br>
- }<br>
-<br>
- // ToolDir is the directory containing build tools.<br>
--var ToolDir =3D filepath.Join(runtime.GOROOT()<wbr>, &quot;pkg/tool/&quot=
;+runtime.GOOS+&quot;_&quot;+<wbr>runtime.GOARCH)<br>
-+var ToolDir =3D envOr(&quot;GOTOOLDIR&quot;, filepath.Join(runtime.GOROOT=
()<wbr>, &quot;pkg/tool/&quot;+runtime.GOOS+&quot;_&quot;+<wbr>runtime.GOAR=
CH))<br>
-<br>
- // IsLocalImport reports whether the import path is<br>
- // a local import path, like &quot;.&quot;, &quot;..&quot;, &quot;./foo&q=
uot;, or &quot;../foo&quot;.<br>
---<br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-devtools/go/go-<wbr>1.9/0005-cmd-go-make-GOROOT-<=
wbr>precious-by-default.patch b/meta/recipes-devtools/go/go-<wbr>1.9/0005-c=
md-go-make-GOROOT-<wbr>precious-by-default.patch<br>
deleted file mode 100644<br>
index 6e93bcb6ce..0000000000<br>
--- a/meta/recipes-devtools/go/go-<wbr>1.9/0005-cmd-go-make-GOROOT-<wbr>pre=
cious-by-default.patch<br>
+++ /dev/null<br>
@@ -1,41 +0,0 @@<br>
-From 44f961975dac6cf464a77b5f6dd0c4<wbr>7cc192c4fd Mon Sep 17 00:00:00 200=
1<br>
-From: Matt Madison &lt;matt@madison.systems&gt;<br>
-Date: Wed, 13 Sep 2017 08:19:52 -0700<br>
-Subject: [PATCH 5/7] cmd/go: make GOROOT precious by default<br>
-<br>
-For OE builds, we never want packages that have<br>
-already been installed into the build root to be<br>
-modified, so prevent the go build tool from checking<br>
-if they should be rebuilt.<br>
-<br>
-Also add an environment variable to override this<br>
-behavior, just for building the Go runtime.<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
----<br>
- src/cmd/go/internal/load/pkg.<wbr>go | 7 +++++++<br>
- 1 file changed, 7 insertions(+)<br>
-<br>
-diff --git a/src/cmd/go/internal/load/<wbr>pkg.go b/src/cmd/go/internal/lo=
ad/<wbr>pkg.go<br>
-index 60de666..2660d3f 100644<br>
---- a/src/cmd/go/internal/load/<wbr>pkg.go<br>
-+++ b/src/cmd/go/internal/load/<wbr>pkg.go<br>
-@@ -1530,6 +1530,13 @@ func isStale(p *Package) (bool, string) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true, &quot;=
build ID mismatch&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-+=C2=A0 =C2=A0 =C2=A0 // For OE builds, make anything in GOROOT non-stale,=
<br>
-+=C2=A0 =C2=A0 =C2=A0 // to prevent a package build from overwriting the<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 // build root.<br>
-+=C2=A0 =C2=A0 =C2=A0 if p.Goroot &amp;&amp; os.Getenv(&quot;GOROOT_OVERRI=
DE&quot;) !=3D &quot;1&quot; {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false, &quot;GORO=
OT-resident packages do not get rebuilt&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// Package is stale if a dependency is.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for _, p1 :=3D range p.Internal.Deps {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if p1.Stale {<br>
---<br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-devtools/go/go-<wbr>1.9/0006-make.bash-add-<wbr>G=
OTOOLDIR_BOOTSTRAP-<wbr>environment-variab.patch b/meta/recipes-devtools/go=
/go-<wbr>1.9/0006-make.bash-add-<wbr>GOTOOLDIR_BOOTSTRAP-<wbr>environment-v=
ariab.patch<br>
deleted file mode 100644<br>
index f0f564044b..0000000000<br>
--- a/meta/recipes-devtools/go/go-<wbr>1.9/0006-make.bash-add-<wbr>GOTOOLDI=
R_BOOTSTRAP-<wbr>environment-variab.patch<br>
+++ /dev/null<br>
@@ -1,36 +0,0 @@<br>
-From aae74d1045ca03306ba4159206ee3b<wbr>ac72bcdfbb Mon Sep 17 00:00:00 200=
1<br>
-From: Matt Madison &lt;matt@madison.systems&gt;<br>
-Date: Wed, 13 Sep 2017 08:23:23 -0700<br>
-Subject: [PATCH 6/7] make.bash: add GOTOOLDIR_BOOTSTRAP environment variab=
le<br>
-<br>
-For cross-canadian builds, we need to use the native<br>
-GOTOOLDIR during the bootstrap phase, so provide a way<br>
-to pass that setting into the build script.<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
----<br>
- src/make.bash | 3 ++-<br>
- 1 file changed, 2 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/src/make.bash b/src/make.bash<br>
-index 9553623..2e6fb05 100755<br>
---- a/src/make.bash<br>
-+++ b/src/make.bash<br>
-@@ -172,10 +172,11 @@ if [ &quot;$do_host_build&quot; =3D &quot;yes&quot; =
]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mv cmd/dist/dist &quot;$GOTOOLDIR&quot;/dist<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo<br>
-<br>
-+=C2=A0 =C2=A0 =C2=A0 GOTOOLDIR_BOOTSTRAP=3D&quot;${<wbr>GOTOOLDIR_BOOTSTR=
AP:-$<wbr>GOTOOLDIR}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;##### Building packages and commands=
 for host, $GOHOSTOS/$GOHOSTARCH.&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# CC_FOR_TARGET is recorded as the default comp=
iler for the go tool. When building for the host, however,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# use the host compiler, CC, from `cmd/dist/dis=
t env` instead.<br>
--=C2=A0 =C2=A0 =C2=A0 CC=3D$CC GOOS=3D$GOHOSTOS GOARCH=3D$GOHOSTARCH \<br>
-+=C2=A0 =C2=A0 =C2=A0 CC=3D$CC GOOS=3D$GOHOSTOS GOARCH=3D$GOHOSTARCH GOTOO=
LDIR=3D&quot;$GOTOOLDIR_<wbr>BOOTSTRAP&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$GOTOOLDIR&qu=
ot;/go_bootstrap install -gcflags &quot;$GO_GCFLAGS&quot; -ldflags &quot;$G=
O_LDFLAGS&quot; -v std cmd<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo<br>
- fi<br>
---<br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-devtools/go/go-<wbr>1.9/0007-ld-add-soname-to-<wb=
r>shareable-objects.patch b/meta/recipes-devtools/go/go-<wbr>1.9/0007-ld-ad=
d-soname-to-<wbr>shareable-objects.patch<br>
deleted file mode 100644<br>
index 6459782d81..0000000000<br>
--- a/meta/recipes-devtools/go/go-<wbr>1.9/0007-ld-add-soname-to-<wbr>share=
able-objects.patch<br>
+++ /dev/null<br>
@@ -1,46 +0,0 @@<br>
-From e957c3458d53e37bf416f51d2f8bf5<wbr>4c195e50f5 Mon Sep 17 00:00:00 200=
1<br>
-From: Matt Madison &lt;matt@madison.systems&gt;<br>
-Date: Wed, 13 Sep 2017 08:27:02 -0700<br>
-Subject: [PATCH 7/7] ld: add soname to shareable objects<br>
-<br>
-Shared library handling in OE depends on the inclusion<br>
-of an soname header, so update the go linker to add that<br>
-header for both internal and external linking.<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
----<br>
- src/cmd/link/internal/ld/lib.<wbr>go | 3 +++<br>
- 1 file changed, 3 insertions(+)<br>
-<br>
-diff --git a/src/cmd/link/internal/ld/<wbr>lib.go b/src/cmd/link/internal/=
ld/<wbr>lib.go<br>
-index 0234105..0b9e2d0 100644<br>
---- a/src/cmd/link/internal/ld/<wbr>lib.go<br>
-+++ b/src/cmd/link/internal/ld/<wbr>lib.go<br>
-@@ -1124,12 +1124,14 @@ func (l *Link) hostlink() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0// Pass -z nodelete to mark the shared library as<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0// non-closeable: a dlclose will do nothing.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0argv =3D append(argv, &quot;-shared&quot;, &quot;-Wl,-z,nodelete&=
quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 argv =3D append(argv, fmt.Sprintf(&quot;-Wl,-soname,%s&quot;, filepath.=
Base(*flagOutfile)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case BuildmodeShared:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if UseRelro() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0argv =3D append(argv, &quot;-Wl,-z,relro&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argv =3D append(arg=
v, &quot;-shared&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 argv =3D append(argv, fm=
t.Sprintf(&quot;-Wl,-soname,%s&quot;, filepath.Base(*flagOutfile)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case BuildmodePlugin:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if Headtype =3D=3D =
objabi.Hdarwin {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0argv =3D append(argv, &quot;-dynamiclib&quot;)<br>
-@@ -1138,6 +1140,7 @@ func (l *Link) hostlink() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argv =3D append(argv, &quot;-Wl,-z,re=
lro&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0argv =3D append(argv, &quot;-shared&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 argv =3D append(argv, fmt.Sprintf(&quot;-Wl,-soname,%s&quot;, filepath.=
Base(*flagOutfile)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
---<br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-devtools/go/go-<wbr>1.9/0008-make.bash-add-<wbr>G=
OHOSTxx-indirection-for-<wbr>cross-canadia.patch b/meta/recipes-devtools/go=
/go-<wbr>1.9/0008-make.bash-add-<wbr>GOHOSTxx-indirection-for-<wbr>cross-ca=
nadia.patch<br>
deleted file mode 100644<br>
index 0977c78350..0000000000<br>
--- a/meta/recipes-devtools/go/go-<wbr>1.9/0008-make.bash-add-<wbr>GOHOSTxx=
-indirection-for-<wbr>cross-canadia.patch<br>
+++ /dev/null<br>
@@ -1,33 +0,0 @@<br>
-From 03e6c339d4fb712fbb8c4ca6ef2fc7<wbr>100dcdb3d7 Mon Sep 17 00:00:00 200=
1<br>
-From: Matt Madison &lt;matt@madison.systems&gt;<br>
-Date: Thu, 14 Sep 2017 05:38:10 -0700<br>
-Subject: [PATCH 8/8] make.bash: add GOHOSTxx indirection for cross-canadia=
n<br>
- builds<br>
-<br>
-Add environment variables for specifying the host OS/arch<br>
-that we are building the compiler for, so it can differ from<br>
-the build host OS/arch.<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
----<br>
- src/make.bash | 2 ++<br>
- 1 file changed, 2 insertions(+)<br>
-<br>
-diff --git a/src/make.bash b/src/make.bash<br>
-index 2e6fb05..0bdadc6 100755<br>
---- a/src/make.bash<br>
-+++ b/src/make.bash<br>
-@@ -173,6 +173,8 @@ if [ &quot;$do_host_build&quot; =3D &quot;yes&quot; ];=
 then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0GOTOOLDIR_BOOTSTRAP=3D&quot;${<wbr>GOTOOLDIR_BO=
OTSTRAP:-$<wbr>GOTOOLDIR}&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 GOHOSTOS=3D&quot;${GOHOSTOS_CROSS:-$<wbr>GOHOSTOS}&q=
uot;<br>
-+=C2=A0 =C2=A0 =C2=A0 GOHOSTARCH=3D&quot;${GOHOSTARCH_<wbr>CROSS:-$GOHOSTA=
RCH}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;##### Building packages and commands=
 for host, $GOHOSTOS/$GOHOSTARCH.&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# CC_FOR_TARGET is recorded as the default comp=
iler for the go tool. When building for the host, however,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# use the host compiler, CC, from `cmd/dist/dis=
t env` instead.<br>
---<br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-devtools/go/go-<wbr>1.9/0009-cmd-go-buildmode-pie=
-<wbr>forces-external-linking-mode-<wbr>on.patch b/meta/recipes-devtools/go=
/go-<wbr>1.9/0009-cmd-go-buildmode-pie-<wbr>forces-external-linking-mode-<w=
br>on.patch<br>
deleted file mode 100644<br>
index aa5fcfdd23..0000000000<br>
--- a/meta/recipes-devtools/go/go-<wbr>1.9/0009-cmd-go-buildmode-pie-<wbr>f=
orces-external-linking-mode-<wbr>on.patch<br>
+++ /dev/null<br>
@@ -1,47 +0,0 @@<br>
-From aae44527c8065d54f6acaf87c82cba<wbr>1ac96fae59 Mon Sep 17 00:00:00 200=
1<br>
-From: Ian Lance Taylor &lt;<a href=3D"mailto:iant@golang.org">iant@golang.=
org</a>&gt;<br>
-Date: Fri, 18 Aug 2017 17:46:03 -0700<br>
-Subject: [PATCH] cmd/go: -buildmode=3Dpie forces external linking mode on =
all<br>
- systems<br>
-<br>
-The go tool assumed that -buildmode=3Dpie implied internal linking on<br>
-linux-amd64. However, that was changed by CL 36417 for issue #18968.<br>
-<br>
-Fixes #21452<br>
-<br>
-Change-Id: I8ed13aea52959cc5c53223f4c41ba<wbr>35329445545<br>
-Reviewed-on: <a href=3D"https://go-review.googlesource.com/57231" rel=3D"n=
oreferrer" target=3D"_blank">https://go-review.<wbr>googlesource.com/57231<=
/a><br>
-Run-TryBot: Ian Lance Taylor &lt;<a href=3D"mailto:iant@golang.org">iant@g=
olang.org</a>&gt;<br>
-TryBot-Result: Gobot Gobot &lt;<a href=3D"mailto:gobot@golang.org">gobot@g=
olang.org</a>&gt;<br>
-Reviewed-by: Avelino &lt;t@avelino.xxx&gt;<br>
-Reviewed-by: Rob Pike &lt;<a href=3D"mailto:r@golang.org">r@golang.org</a>=
&gt;<br>
----<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
-<br>
- src/cmd/go/internal/load/pkg.<wbr>go | 7 ++++---<br>
- 1 file changed, 4 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/src/cmd/go/internal/load/<wbr>pkg.go b/src/cmd/go/internal/lo=
ad/<wbr>pkg.go<br>
-index 2660d3f..d40773b 100644<br>
---- a/src/cmd/go/internal/load/<wbr>pkg.go<br>
-+++ b/src/cmd/go/internal/load/<wbr>pkg.go<br>
-@@ -954,11 +954,12 @@ func (p *Package) load(stk *ImportStack, bp *build.P=
ackage, err error) *Package<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if cfg.BuildContext.CgoEnabled &amp;&amp; p.Nam=
e =3D=3D &quot;main&quot; &amp;&amp; !p.Goroot {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Currently build =
modes c-shared, pie (on systems that do not<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // support PIE with inte=
rnal linking mode), plugin, and<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // -linkshared force ext=
ernal linking mode, as of course does<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // support PIE with inte=
rnal linking mode (currently all<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // systems: issue #18968=
)), plugin, and -linkshared force<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // external linking mode=
, as of course does<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// -ldflags=3D-link=
mode=3Dexternal. External linking mode forces<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// an import of run=
time/cgo.<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pieCgo :=3D cfg.BuildBui=
ldmode =3D=3D &quot;pie&quot; &amp;&amp; (cfg.BuildContext.GOOS !=3D &quot;=
linux&quot; || cfg.BuildContext.GOARCH !=3D &quot;amd64&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pieCgo :=3D cfg.BuildBui=
ldmode =3D=3D &quot;pie&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linkmodeExternal :=
=3D false<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for i, a :=3D range=
 cfg.BuildLdflags {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if a =3D=3D &quot;-linkmode=3Dexternal&quot; {<br>
---<br>
-2.14.1<br>
-<br>
diff --git a/meta/recipes-devtools/go/go-<wbr>1.9/0010-make.bash-override-<=
wbr>CC-when-building-dist-and-go_<wbr>boot.patch b/meta/recipes-devtools/go=
/go-<wbr>1.9/0010-make.bash-override-<wbr>CC-when-building-dist-and-go_<wbr=
>boot.patch<br>
deleted file mode 100644<br>
index 83fd78c3d7..0000000000<br>
--- a/meta/recipes-devtools/go/go-<wbr>1.9/0010-make.bash-override-<wbr>CC-=
when-building-dist-and-go_<wbr>boot.patch<br>
+++ /dev/null<br>
@@ -1,43 +0,0 @@<br>
-From 21d83dd9499e5be30eea28dd7034d1<wbr>ea2a01c838 Mon Sep 17 00:00:00 200=
1<br>
-From: Matt Madison &lt;matt@madison.systems&gt;<br>
-Date: Tue, 14 Nov 2017 07:38:42 -0800<br>
-Subject: [PATCH 10/10] make.bash: override CC when building dist and<br>
- go_bootstrap<br>
-<br>
-For cross-canadian builds, dist and go_bootstrap<br>
-run on the build host, so CC needs to point to the<br>
-build host&#39;s C compiler.=C2=A0 Add a BUILD_CC environment<br>
-for this, falling back to $CC if not present.<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
----<br>
- src/make.bash | 4 ++--<br>
- 1 file changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/src/make.bash b/src/make.bash<br>
-index 0bdadc6..f199349 100755<br>
---- a/src/make.bash<br>
-+++ b/src/make.bash<br>
-@@ -131,7 +131,7 @@ if [ &quot;$GOROOT_BOOTSTRAP&quot; =3D &quot;$GOROOT&q=
uot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
- fi<br>
- rm -f cmd/dist/dist<br>
--GOROOT=3D&quot;$GOROOT_BOOTSTRAP&quot; GOOS=3D&quot;&quot; GOARCH=3D&quot=
;&quot; &quot;$GOROOT_BOOTSTRAP/bin/go&quot; build -o cmd/dist/dist ./cmd/d=
ist<br>
-+CC=3D${BUILD_CC:-${CC}} GOROOT=3D&quot;$GOROOT_BOOTSTRAP&quot; GOOS=3D&qu=
ot;&quot; GOARCH=3D&quot;&quot; &quot;$GOROOT_BOOTSTRAP/bin/go&quot; build =
-o cmd/dist/dist ./cmd/dist<br>
-<br>
- # -e doesn&#39;t propagate out of eval, so check success by hand.<br>
- eval $(./cmd/dist/dist env -p || echo FAIL=3Dtrue)<br>
-@@ -167,7 +167,7 @@ elif [ &quot;$1&quot; =3D &quot;--host-only&quot; ]; t=
hen<br>
- fi<br>
-<br>
- if [ &quot;$do_host_build&quot; =3D &quot;yes&quot; ]; then<br>
--=C2=A0 =C2=A0 =C2=A0 ./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v=
 # builds go_bootstrap<br>
-+=C2=A0 =C2=A0 =C2=A0 CC=3D${BUILD_CC:-${CC}} ./cmd/dist/dist bootstrap $b=
uildall $GO_DISTFLAGS -v # builds go_bootstrap<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Delay move of dist tool to now, because boots=
trap may clear tool directory.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mv cmd/dist/dist &quot;$GOTOOLDIR&quot;/dist<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo<br>
---<br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-devtools/go/go-<wbr>1.9/set-external-linker.patch=
 b/meta/recipes-devtools/go/go-<wbr>1.9/set-external-linker.patch<br>
deleted file mode 100644<br>
index d6bd7fa39c..0000000000<br>
--- a/meta/recipes-devtools/go/go-<wbr>1.9/set-external-linker.patch<br>
+++ /dev/null<br>
@@ -1,111 +0,0 @@<br>
-Change the dynamic linker hardcoding to use musl when not using glibc<br>
-this should be applied conditional to musl being the system C library<br>
-<br>
-Upstream-Status: Inappropriate [Real Fix should be portable across libcs]<=
br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
-<br>
-Index: go/src/cmd/link/internal/<wbr>amd64/obj.go<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- go.orig/src/cmd/link/internal/<wbr>amd64/obj.go<br>
-+++ go/src/cmd/link/internal/<wbr>amd64/obj.go<br>
-@@ -67,7 +67,7 @@ func Init() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Append64 =3D ld.Append64l<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.TLSIEtoLE =3D tlsIEtoLE<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib64/ld-linux-x86-=
64.so.2&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib/ld-musl-x86_64.=
so.1&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Freebsddynld =3D &quot;/libexec/ld-e=
lf.so.1&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Openbsddynld =3D &quot;/usr/libexec/=
ld.so&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Netbsddynld =3D &quot;/libexec/ld.el=
f_so&quot;<br>
-Index: go/src/cmd/link/internal/arm/<wbr>obj.go<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- go.orig/src/cmd/link/internal/<wbr>arm/obj.go<br>
-+++ go/src/cmd/link/internal/arm/<wbr>obj.go<br>
-@@ -63,7 +63,7 @@ func Init() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Append32 =3D ld.Append32l<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Append64 =3D ld.Append64l<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib/ld-linux.so.3&q=
uot; // 2 for OABI, 3 for EABI<br>
-+=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib/ld-musl-armhf.s=
o.1&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Freebsddynld =3D &quot;/usr/libexec/=
ld-elf.so.1&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Openbsddynld =3D &quot;/usr/libexec/=
ld.so&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Netbsddynld =3D &quot;/libexec/ld.el=
f_so&quot;<br>
-Index: go/src/cmd/link/internal/<wbr>arm64/obj.go<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- go.orig/src/cmd/link/internal/<wbr>arm64/obj.go<br>
-+++ go/src/cmd/link/internal/<wbr>arm64/obj.go<br>
-@@ -62,7 +62,7 @@ func Init() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Append32 =3D ld.Append32l<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Append64 =3D ld.Append64l<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib/ld-linux-aarch6=
4.so.1&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib/ld-musl-aarch64=
.so.1&quot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Freebsddynld =3D &quot;XXX&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Openbsddynld =3D &quot;XXX&quot;<br>
-Index: go/src/cmd/link/internal/mips/<wbr>obj.go<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- go.orig/src/cmd/link/internal/<wbr>mips/obj.go<br>
-+++ go/src/cmd/link/internal/mips/<wbr>obj.go<br>
-@@ -77,7 +77,7 @@ func Init() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Append64=
 =3D ld.Append64b<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib/ld.so.1&quot;<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib/ld-musl-mipsle.=
so.1&quot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Freebsddynld =3D &quot;XXX&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Openbsddynld =3D &quot;XXX&quot;<br>
-Index: go/src/cmd/link/internal/<wbr>mips64/obj.go<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- go.orig/src/cmd/link/internal/<wbr>mips64/obj.go<br>
-+++ go/src/cmd/link/internal/<wbr>mips64/obj.go<br>
-@@ -75,7 +75,7 @@ func Init() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Append64=
 =3D ld.Append64b<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib64/ld64.so.1&quo=
t;<br>
-+=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib64/ld-musl-mips6=
4le.so.1&quot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Freebsddynld =3D &quot;XXX&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Openbsddynld =3D &quot;XXX&quot;<br>
-Index: go/src/cmd/link/internal/<wbr>ppc64/obj.go<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- go.orig/src/cmd/link/internal/<wbr>ppc64/obj.go<br>
-+++ go/src/cmd/link/internal/<wbr>ppc64/obj.go<br>
-@@ -77,7 +77,7 @@ func Init() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// TODO(austin): ABI v1 uses /usr/lib/ld.so.1<b=
r>
--=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib64/ld64.so.1&quo=
t;<br>
-+=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib/ld-musl-powerpc=
64le.so.<wbr>1&quot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Freebsddynld =3D &quot;XXX&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Openbsddynld =3D &quot;XXX&quot;<br>
-Index: go/src/cmd/link/internal/<wbr>s390x/obj.go<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- go.orig/src/cmd/link/internal/<wbr>s390x/obj.go<br>
-+++ go/src/cmd/link/internal/<wbr>s390x/obj.go<br>
-@@ -62,7 +62,7 @@ func Init() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Append32 =3D ld.Append32b<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Append64 =3D ld.Append64b<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib64/ld64.so.1&quo=
t;<br>
-+=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib/ld-musl-s390x.s=
o.1&quot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// not relevant for s390x<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Freebsddynld =3D &quot;XXX&quot;<br>
-Index: go/src/cmd/link/internal/x86/<wbr>obj.go<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- go.orig/src/cmd/link/internal/<wbr>x86/obj.go<br>
-+++ go/src/cmd/link/internal/x86/<wbr>obj.go<br>
-@@ -63,7 +63,7 @@ func Init() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Append32 =3D ld.Append32l<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Append64 =3D ld.Append64l<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib/ld-linux.so.2&q=
uot;<br>
-+=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib/ld-musl-i386.so=
.1&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Freebsddynld =3D &quot;/usr/libexec/=
ld-elf.so.1&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Openbsddynld =3D &quot;/usr/libexec/=
ld.so&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Netbsddynld =3D &quot;/usr/libexec/l=
d.elf_so&quot;<br>
diff --git a/meta/recipes-devtools/go/go-<wbr>common.inc b/meta/recipes-dev=
tools/go/go-<wbr>common.inc<br>
index 37138b51ed..611775b2cc 100644<br>
--- a/meta/recipes-devtools/go/go-<wbr>common.inc<br>
+++ b/meta/recipes-devtools/go/go-<wbr>common.inc<br>
@@ -22,6 +22,8 @@ UPSTREAM_CHECK_REGEX =3D &quot;(?P&lt;pver&gt;\d+(\.\d+)+=
)\.src\.<wbr>tar&quot;<br>
=C2=A0INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;1&quot;<br>
=C2=A0SSTATE_SCAN_CMD =3D &quot;true&quot;<br>
<br>
+export GOROOT_OVERRIDE =3D &quot;1&quot;<br>
+<br>
=C2=A0do_compile_prepend() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 BUILD_CC=3D${BUILD_CC}<br>
=C2=A0}<br>
diff --git a/meta/recipes-devtools/go/go-<wbr>cross-canadian.inc b/meta/rec=
ipes-devtools/go/go-<wbr>cross-canadian.inc<br>
index 8afda6b2ce..c84aa4c9eb 100644<br>
--- a/meta/recipes-devtools/go/go-<wbr>cross-canadian.inc<br>
+++ b/meta/recipes-devtools/go/go-<wbr>cross-canadian.inc<br>
@@ -7,34 +7,34 @@ PN =3D &quot;go-cross-canadian-${<wbr>TRANSLATED_TARGET_A=
RCH}&quot;<br>
<br>
=C2=A0export GOHOSTOS =3D &quot;${BUILD_GOOS}&quot;<br>
=C2=A0export GOHOSTARCH =3D &quot;${BUILD_GOARCH}&quot;<br>
-export GOHOSTOS_CROSS =3D &quot;${HOST_GOOS}&quot;<br>
-export GOHOSTARCH_CROSS =3D &quot;${HOST_GOARCH}&quot;<br>
=C2=A0export GOROOT_BOOTSTRAP =3D &quot;${STAGING_LIBDIR_NATIVE}/go&quot;<b=
r>
=C2=A0export GOTOOLDIR_BOOTSTRAP =3D &quot;${STAGING_LIBDIR_NATIVE}/${<wbr>=
HOST_SYS}/go/pkg/tool/${BUILD_<wbr>GOTUPLE}&quot;<br>
=C2=A0export GOROOT_FINAL =3D &quot;${libdir}/go&quot;<br>
=C2=A0export CGO_ENABLED =3D &quot;1&quot;<br>
-export CC_FOR_TARGET =3D &quot;${TARGET_PREFIX}gcc&quot;<br>
-export CXX_FOR_TARGET =3D &quot;${TARGET_PREFIX}g++&quot;<br>
-CC =3D &quot;${HOST_PREFIX}gcc&quot;<br>
-export CGO_CFLAGS =3D &quot;--sysroot=3D${STAGING_DIR_<wbr>TARGET} ${HOST_=
CC_ARCH} ${CFLAGS}&quot;<br>
-export CGO_LDFLAGS =3D &quot;--sysroot=3D${STAGING_DIR_<wbr>TARGET} ${HOST=
_CC_ARCH} ${LDFLAGS}&quot;<br>
-export GO_LDFLAGS =3D &#39;-linkmode external -extld ${HOST_PREFIX}gcc -ex=
tldflags &quot;--sysroot=3D${STAGING_DIR_<wbr>TARGET} ${HOST_CC_ARCH} ${LDF=
LAGS}&quot;&#39;<br>
+export GOCACHE =3D &quot;off&quot;<br>
+export GOTMPDIR ?=3D &quot;${WORKDIR}/go-tmp&quot;<br>
+GOTMPDIR[vardepvalue] =3D &quot;&quot;<br>
+#CC =3D &quot;${HOST_PREFIX}gcc&quot;<br>
+export CGO_CFLAGS =3D &quot;${CFLAGS}&quot;<br>
+export CGO_LDFLAGS =3D &quot;${LDFLAGS}&quot;<br>
+export GO_LDFLAGS =3D &#39;-v -linkmode external -extld ${HOST_PREFIX}gcc =
-extldflags &quot;--sysroot=3D${STAGING_DIR_HOST} ${HOST_CC_ARCH} ${LDFLAGS=
}&quot;&#39;<br>
<br>
=C2=A0do_configure[noexec] =3D &quot;1&quot;<br>
<br>
=C2=A0do_compile() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOBIN=3D&quot;${B}/bin&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${GOBIN} ${B}/pkg<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir ${GOBIN}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export CC_FOR_${HOST_GOOS}_${HOST_<wbr>GOARCH}=
=3D&quot;${HOST_PREFIX}gcc --sysroot=3D${STAGING_DIR_HOST}$<wbr>{SDKPATHNAT=
IVE}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export CXX_FOR_${HOST_GOOS}_${HOST_<wbr>GOARCH}=
=3D&quot;${HOST_PREFIX}gxx --sysroot=3D${STAGING_DIR_HOST}$<wbr>{SDKPATHNAT=
IVE}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd src<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ./make.bash --host-only --no-banner<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${B}<br>
=C2=A0}<br>
+do_compile[dirs] =3D+ &quot;${GOTMPDIR} ${B}/bin ${B}/pkg&quot;<br>
+do_compile[cleandirs] +=3D &quot;${GOTMPDIR} ${B}/bin ${B}/pkg&quot;<br>
<br>
<br>
=C2=A0make_wrapper() {<br>
-=C2=A0 =C2=A0 rm -f ${D}${bindir}/$2<br>
-=C2=A0 =C2=A0 cat &lt;&lt;END &gt;${D}${bindir}/$2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}${bindir}/$2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cat &lt;&lt;END &gt;${D}${bindir}/$2<br>
=C2=A0#!/bin/sh<br>
=C2=A0here=3D\`dirname \$0\`<br>
=C2=A0native_goroot=3D\`readlink -f \$here/../../lib/${TARGET_SYS}<wbr>/go\=
`<br>
@@ -46,7 +46,7 @@ export GOTOOLDIR=3D&quot;\$native_goroot/<wbr>pkg/tool/${=
HOST_GOTUPLE}&quot;<br>
=C2=A0test -n &quot;\$GOROOT&quot; || export GOROOT=3D&quot;\$OECORE_TARGET=
_<wbr>SYSROOT/${target_libdir}/go&quot;<br>
=C2=A0\$here/../../lib/${TARGET_SYS}<wbr>/go/bin/$1 &quot;\$@&quot;<br>
=C2=A0END<br>
-=C2=A0 =C2=A0 chmod +x ${D}${bindir}/$2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chmod +x ${D}${bindir}/$2<br>
=C2=A0}<br>
<br>
=C2=A0do_install() {<br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-cross-canadian_1=
.9.bb" rel=3D"noreferrer" target=3D"_blank">go-<wbr>cross-canadian_1.9.bb</=
a> b/meta/recipes-devtools/go/<a href=3D"http://go-cross-canadian_1.10.bb" =
rel=3D"noreferrer" target=3D"_blank">go-<wbr>cross-canadian_1.10.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go-cross-canadian_1.=
9.bb" rel=3D"noreferrer" target=3D"_blank">go-<wbr>cross-canadian_1.9.bb</a=
><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go-cross-canadian_1.10=
.bb" rel=3D"noreferrer" target=3D"_blank">go-<wbr>cross-canadian_1.10.bb</a=
><br>
diff --git a/meta/recipes-devtools/go/go-<wbr>cross.inc b/meta/recipes-devt=
ools/go/go-<wbr>cross.inc<br>
index 3ac7211bc3..fe92651581 100644<br>
--- a/meta/recipes-devtools/go/go-<wbr>cross.inc<br>
+++ b/meta/recipes-devtools/go/go-<wbr>cross.inc<br>
@@ -1,7 +1,7 @@<br>
=C2=A0inherit cross<br>
<br>
=C2=A0PROVIDES =3D &quot;virtual/${TARGET_PREFIX}go&quot;<br>
-DEPENDS +=3D &quot;go-native&quot;<br>
+DEPENDS =3D &quot;go-native&quot;<br>
<br>
=C2=A0PN =3D &quot;go-cross-${TARGET_ARCH}&quot;<br>
<br>
@@ -13,26 +13,27 @@ export GOARM =3D &quot;${TARGET_GOARM}&quot;<br>
=C2=A0export GO386 =3D &quot;${TARGET_GO386}&quot;<br>
=C2=A0export GOROOT_BOOTSTRAP =3D &quot;${STAGING_LIBDIR_NATIVE}/go&quot;<b=
r>
=C2=A0export GOROOT_FINAL =3D &quot;${libdir}/go&quot;<br>
+export GOCACHE =3D &quot;off&quot;<br>
+export GOTMPDIR ?=3D &quot;${WORKDIR}/go-tmp&quot;<br>
+GOTMPDIR[vardepvalue] =3D &quot;&quot;<br>
=C2=A0export CGO_ENABLED =3D &quot;1&quot;<br>
-export CC_FOR_TARGET=3D&quot;${TARGET_<wbr>PREFIX}gcc ${TARGET_CC_ARCH} --=
sysroot=3D${STAGING_DIR_<wbr>TARGET}&quot;<br>
-export CXX_FOR_TARGET=3D&quot;${TARGET_<wbr>PREFIX}g++ ${TARGET_CC_ARCH} -=
-sysroot=3D${STAGING_DIR_<wbr>TARGET}&quot;<br>
=C2=A0CC =3D &quot;${@d.getVar(&#39;BUILD_CC&#39;).<wbr>strip()}&quot;<br>
<br>
=C2=A0do_configure[noexec] =3D &quot;1&quot;<br>
<br>
=C2=A0do_compile() {<br>
-=C2=A0 =C2=A0 export GOBIN=3D&quot;${B}/bin&quot;<br>
-=C2=A0 =C2=A0 rm -rf ${GOBIN} ${B}/pkg<br>
-=C2=A0 =C2=A0 mkdir ${GOBIN}<br>
-=C2=A0 =C2=A0 cd src<br>
-=C2=A0 =C2=A0 ./make.bash --host-only<br>
-=C2=A0 =C2=A0 cd ${B}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export CC_FOR_${GOOS}_${GOARCH}=3D&quot;${<wbr>=
TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=3D${STAGING_DIR_<wbr>TARGET}&=
quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export CXX_FOR_${GOOS}_${GOARCh}=3D&quot;${<wbr=
>TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=3D${STAGING_DIR_<wbr>TARGET}=
&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd src<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0./make.bash --host-only --no-banner<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${B}<br>
=C2=A0}<br>
-<br>
+do_compile[dirs] =3D+ &quot;${GOTMPDIR} ${B}/bin ${B}/pkg&quot;<br>
+do_compile[cleandirs] +=3D &quot;${GOTMPDIR} ${B}/bin ${B}/pkg&quot;<br>
<br>
=C2=A0make_wrapper() {<br>
-=C2=A0 =C2=A0 rm -f ${D}${bindir}/$2<br>
-=C2=A0 =C2=A0 cat &lt;&lt;END &gt;${D}${bindir}/$2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}${bindir}/$2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cat &lt;&lt;END &gt;${D}${bindir}/$2<br>
=C2=A0#!/bin/bash<br>
=C2=A0here=3D\`dirname \$0\`<br>
=C2=A0export GOARCH=3D&quot;${TARGET_GOARCH}&quot;<br>
@@ -41,22 +42,22 @@ export GOARM=3D&quot;\${GOARM:-${TARGET_<wbr>GOARM}}&qu=
ot;<br>
=C2=A0export GO386=3D&quot;\${GO386:-${TARGET_<wbr>GO386}}&quot;<br>
=C2=A0\$here/../../lib/${CROSS_<wbr>TARGET_SYS_DIR}/go/bin/$1 &quot;\$@&quo=
t;<br>
=C2=A0END<br>
-=C2=A0 =C2=A0 chmod +x ${D}${bindir}/$2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chmod +x ${D}${bindir}/$2<br>
=C2=A0}<br>
<br>
=C2=A0do_install() {<br>
-=C2=A0 =C2=A0 install -d ${D}${libdir}/go<br>
-=C2=A0 =C2=A0 cp --preserve=3Dmode,timestamps -R ${B}/pkg ${D}${libdir}/go=
/<br>
-=C2=A0 =C2=A0 install -d ${D}${libdir}/go/src<br>
-=C2=A0 =C2=A0 (cd ${S}/src; for d in *; do \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ ! -d $d ] || cp --preserve=3Dmode,timestamps=
 -R ${S}/src/$d ${D}${libdir}/go/src/; \<br>
-=C2=A0 =C2=A0 done)<br>
-=C2=A0 =C2=A0 rm -rf ${D}${libdir}/go/src/runtime/<wbr>pprof/testdata<br>
-=C2=A0 =C2=A0 install -d ${D}${bindir} ${D}${libdir}/go/bin<br>
-=C2=A0 =C2=A0 for f in ${B}/bin/*<br>
-=C2=A0 =C2=A0 do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 base=3D`basename $f`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m755 $f ${D}${libdir}/go/bin<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 make_wrapper $base ${TARGET_PREFIX}$base<br>
-=C2=A0 =C2=A0 done<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${libdir}/go<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp --preserve=3Dmode,timestamps -R ${B}/pkg ${D=
}${libdir}/go/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${libdir}/go/src<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(cd ${S}/src; for d in *; do \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ ! -d $d ] || cp -=
-preserve=3Dmode,timestamps -R ${S}/src/$d ${D}${libdir}/go/src/; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0find ${D}${libdir}/go/src -depth -type d -name =
testdata -exec rm -rf {} \;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${bindir} ${D}${libdir}/go/bin<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for f in ${B}/bin/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base=3D`basename $f=
`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m755 $f ${=
D}${libdir}/go/bin<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0make_wrapper $base =
${TARGET_PREFIX}$base<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
=C2=A0}<br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-cross_1.9.bb" re=
l=3D"noreferrer" target=3D"_blank">go-<wbr>cross_1.9.bb</a> b/meta/recipes-=
devtools/go/<a href=3D"http://go-cross_1.10.bb" rel=3D"noreferrer" target=
=3D"_blank">go-<wbr>cross_1.10.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go-cross_1.9.bb" rel=
=3D"noreferrer" target=3D"_blank">go-<wbr>cross_1.9.bb</a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go-cross_1.10.bb" rel=
=3D"noreferrer" target=3D"_blank">go-<wbr>cross_1.10.bb</a><br>
diff --git a/meta/recipes-devtools/go/go-<wbr>crosssdk.inc b/meta/recipes-d=
evtools/go/go-<wbr>crosssdk.inc<br>
index f67e4b92a0..05ca62eba8 100644<br>
--- a/meta/recipes-devtools/go/go-<wbr>crosssdk.inc<br>
+++ b/meta/recipes-devtools/go/go-<wbr>crosssdk.inc<br>
@@ -11,21 +11,21 @@ export GOARCH =3D &quot;${TARGET_GOARCH}&quot;<br>
=C2=A0export GOROOT_BOOTSTRAP =3D &quot;${STAGING_LIBDIR_NATIVE}/go&quot;<b=
r>
=C2=A0export GOROOT_FINAL =3D &quot;${libdir}/go&quot;<br>
=C2=A0export CGO_ENABLED =3D &quot;1&quot;<br>
-export CC_FOR_TARGET=3D&quot;${TARGET_<wbr>PREFIX}gcc ${TARGET_CC_ARCH} --=
sysroot=3D${STAGING_DIR_<wbr>TARGET}${SDKPATHNATIVE}&quot;<br>
-export CXX_FOR_TARGET=3D&quot;${TARGET_<wbr>PREFIX}g++ ${TARGET_CC_ARCH} -=
-sysroot=3D${STAGING_DIR_<wbr>TARGET}${SDKPATHNATIVE}&quot;<br>
-export GO_INSTALL =3D &quot;cmd&quot;<br>
-CC =3D &quot;${@d.getVar(&#39;BUILD_CC&#39;).<wbr>strip()}&quot;<br>
+export GOCACHE =3D &quot;off&quot;<br>
+export GOTMPDIR ?=3D &quot;${WORKDIR}/go-tmp&quot;<br>
+GOTMPDIR[vardepvalue] =3D &quot;&quot;<br>
<br>
=C2=A0do_configure[noexec] =3D &quot;1&quot;<br>
<br>
=C2=A0do_compile() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOBIN=3D&quot;${B}/bin&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${GOBIN} ${B}/pkg<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir ${GOBIN}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export CC_FOR_${TARGET_GOOS}_${<wbr>TARGET_GOAR=
CH}=3D&quot;${TARGET_<wbr>PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=3D${STAGIN=
G_DIR_<wbr>TARGET}${SDKPATHNATIVE}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export CXX_FOR_${TARGET_GOOS}_${<wbr>TARGET_GOA=
RCH}=3D&quot;${TARGET_<wbr>PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=3D${STAGI=
NG_DIR_<wbr>TARGET}${SDKPATHNATIVE}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd src<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0./make.bash --host-only<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0./make.bash --host-only --no-banner<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${B}<br>
=C2=A0}<br>
+do_compile[dirs] =3D+ &quot;${GOTMPDIR} ${B}/bin ${B}/pkg&quot;<br>
+do_compile[cleandirs] +=3D &quot;${GOTMPDIR} ${B}/bin ${B}/pkg&quot;<br>
<br>
=C2=A0make_wrapper() {<br>
=C2=A0 =C2=A0 =C2=A0rm -f ${D}${bindir}/$2<br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.9.bb"=
 rel=3D"noreferrer" target=3D"_blank">go-<wbr>crosssdk_1.9.bb</a> b/meta/re=
cipes-devtools/go/<a href=3D"http://go-crosssdk_1.10.bb" rel=3D"noreferrer"=
 target=3D"_blank">go-<wbr>crosssdk_1.10.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.9.bb" =
rel=3D"noreferrer" target=3D"_blank">go-<wbr>crosssdk_1.9.bb</a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.10.bb" r=
el=3D"noreferrer" target=3D"_blank">go-<wbr>crosssdk_1.10.bb</a><br>
diff --git a/meta/recipes-devtools/go/go-<wbr>native.inc b/meta/recipes-dev=
tools/go/go-<wbr>native.inc<br>
index 95db1c2b7c..31e899da82 100644<br>
--- a/meta/recipes-devtools/go/go-<wbr>native.inc<br>
+++ b/meta/recipes-devtools/go/go-<wbr>native.inc<br>
@@ -4,34 +4,33 @@ nonstaging_libdir :=3D &quot;${libdir}&quot;<br>
<br>
=C2=A0inherit native<br>
<br>
-SRC_URI_append =3D &quot; <a href=3D"http://golang.org/dl/go1.4.3.src.tar.=
gz;name=3Dbootstrap;subdir=3Dgo1.4" rel=3D"noreferrer" target=3D"_blank">ht=
tp://golang.org/dl/go1.4.3.<wbr>src.tar.gz;name=3Dbootstrap;<wbr>subdir=3Dg=
o1.4</a>&quot;<br>
-SRC_URI[bootstrap.md5sum] =3D &quot;<wbr>dfb604511115dd402a77a553a5923a<wb=
r>04&quot;<br>
-SRC_URI[bootstrap.sha256sum] =3D &quot;<wbr>9947fc705b0b841b5938c48b22dc33=
<wbr>e9647ec0752bae66e50278df4f23f6<wbr>4959&quot;<br>
+SRC_URI_append =3D &quot; <a href=3D"https://dl.google.com/go/go1.4-bootst=
rap-20171003.tar.gz;name=3Dbootstrap;subdir=3Dgo1.4" rel=3D"noreferrer" tar=
get=3D"_blank">https://dl.google.com/go/go1.<wbr>4-bootstrap-20171003.tar.g=
z;<wbr>name=3Dbootstrap;subdir=3Dgo1.4</a>&quot;<br>
+SRC_URI[bootstrap.md5sum] =3D &quot;<wbr>dbf727a4b0e365bf88d97cbfde5900<wb=
r>16&quot;<br>
+SRC_URI[bootstrap.sha256sum] =3D &quot;<wbr>f4ff5b5eb3a3cae1c993723f3eab51=
<wbr>9c5bae18866b5e5f96fe1102f0cb5c<wbr>3e52&quot;<br>
<br>
=C2=A0export GOOS =3D &quot;${BUILD_GOOS}&quot;<br>
=C2=A0export GOARCH =3D &quot;${BUILD_GOARCH}&quot;<br>
+export GOTMPDIR ?=3D &quot;${WORKDIR}/go-tmp&quot;<br>
+GOTMPDIR[vardepvalue] =3D &quot;&quot;<br>
=C2=A0CC =3D &quot;${@d.getVar(&#39;BUILD_CC&#39;).<wbr>strip()}&quot;<br>
<br>
=C2=A0export CGO_ENABLED =3D &quot;1&quot;<br>
<br>
=C2=A0do_configure() {<br>
-=C2=A0 =C2=A0 cd ${WORKDIR}/go1.4/go/src<br>
-=C2=A0 =C2=A0 CGO_ENABLED=3D0 GOROOT=3D${WORKDIR}/go1.4/go ./make.bash<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${WORKDIR}/go1.4/go/src<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0CGO_ENABLED=3D0 GOROOT=3D${WORKDIR}/go1.4/go ./=
make.bash<br>
=C2=A0}<br>
<br>
=C2=A0do_compile() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOBIN=3D&quot;${B}/bin&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOROOT_FINAL=3D&quot;${nonstaging_<wbr>l=
ibdir}/go&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOROOT_BOOTSTRAP=3D&quot;${WORKDIR}/<wbr=
>go1.4/go&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${GOBIN}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir ${GOBIN}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export TMPDIR=3D${WORKDIR}/build-tmp<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${WORKDIR}/build-tmp<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd src<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0./make.bash --host-only<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0./make.bash --no-banner<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${B}<br>
=C2=A0}<br>
+do_compile[dirs] =3D+ &quot;${GOTMPDIR} ${B}/bin&quot;<br>
+do_compile[cleandirs] +=3D &quot;${GOTMPDIR} ${B}/bin&quot;<br>
<br>
=C2=A0make_wrapper() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${D}${bindir}/$2$3<br>
@@ -51,7 +50,7 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (cd ${S}/src; for d in *; do \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -d $d ] &amp;&amp=
; cp -a ${S}/src/$d ${D}${libdir}/go/src/; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${libdir}/go/src/runtime/<wbr>pprof/=
testdata<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0find ${D}${libdir}/go/src -depth -type d -name =
testdata -exec rm -rf {} \;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir} ${D}${libdir}/go/bin<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for f in ${B}/bin/*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 do<br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-native_1.9.bb" r=
el=3D"noreferrer" target=3D"_blank">go-<wbr>native_1.9.bb</a> b/meta/recipe=
s-devtools/go/<a href=3D"http://go-native_1.10.bb" rel=3D"noreferrer" targe=
t=3D"_blank">go-<wbr>native_1.10.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go-native_1.9.bb" re=
l=3D"noreferrer" target=3D"_blank">go-<wbr>native_1.9.bb</a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go-native_1.10.bb" rel=
=3D"noreferrer" target=3D"_blank">go-<wbr>native_1.10.bb</a><br>
diff --git a/meta/recipes-devtools/go/go-<wbr>runtime.inc b/meta/recipes-de=
vtools/go/go-<wbr>runtime.inc<br>
index 29ae86e4ee..7a3b415b3f 100644<br>
--- a/meta/recipes-devtools/go/go-<wbr>runtime.inc<br>
+++ b/meta/recipes-devtools/go/go-<wbr>runtime.inc<br>
@@ -10,11 +10,18 @@ export GOARM =3D &quot;${TARGET_GOARM}&quot;<br>
=C2=A0export GO386 =3D &quot;${TARGET_GO386}&quot;<br>
=C2=A0export GOROOT_BOOTSTRAP =3D &quot;${STAGING_LIBDIR_NATIVE}/go&quot;<b=
r>
=C2=A0export GOROOT_FINAL =3D &quot;${libdir}/go&quot;<br>
-export GO_TARGET_INSTALL =3D &quot;std&quot;<br>
=C2=A0export CGO_ENABLED =3D &quot;1&quot;<br>
-export CC_FOR_TARGET=3D&quot;${CC}&quot;<br>
-export CXX_FOR_TARGET=3D&quot;${CXX}&quot;<br>
-export GOROOT_OVERRIDE =3D &quot;1&quot;<br>
+export CGO_CFLAGS =3D &quot;${CFLAGS}&quot;<br>
+export CGO_CPPFLAGS =3D &quot;${CPPFLAGS}&quot;<br>
+export CGO_CXXFLAGS =3D &quot;${CXXFLAGS}&quot;<br>
+export CGO_LDFLAGS =3D &quot;${LDFLAGS}&quot;<br>
+export GOCACHE =3D &quot;off&quot;<br>
+export GOTMPDIR ?=3D &quot;${WORKDIR}/go-tmp&quot;<br>
+GOTMPDIR[vardepvalue] =3D &quot;&quot;<br>
+GO_EXTLDFLAGS ?=3D &quot;${HOST_CC_ARCH}${TOOLCHAIN_<wbr>OPTIONS} ${LDFLAG=
S}&quot;<br>
+GO_LINKMODE ?=3D &quot;&quot;<br>
+GO_LINKMODE_class-nativesdk =3D &quot;--linkmode=3Dexternal&quot;<br>
+GO_LDFLAGS ?=3D &#39;-ldflags=3D&quot;${GO_LINKMODE} -extldflags &#39;${GO=
_EXTLDFLAGS}&#39;&quot;&#39;<br>
<br>
=C2=A0do_configure() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 :<br>
@@ -25,21 +32,20 @@ do_configure_libc-musl() {<br>
=C2=A0}<br>
<br>
=C2=A0do_compile() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOBIN=3D&quot;${B}/bin&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CC=3D&quot;${@d.getVar(&#39;BUILD_CC&#39=
;).<wbr>strip()}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${GOBIN} ${B}/pkg<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir ${GOBIN}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export CC_FOR_${TARGET_GOOS}_${<wbr>TARGET_GOAR=
CH}=3D&quot;${CC}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export CXX_FOR_${TARGET_GOOS}_${<wbr>TARGET_GOA=
RCH}=3D&quot;${CXX}&quot;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd src<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0./make.bash --host-only<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${B}/pkg/tool/${BUILD_GOTUPLE}<wbr>/go_boots=
trap ${B}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${B}/pkg/${TARGET_GOTUPLE}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0./make.bash --target-only<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0./make.bash --target-only --no-banner std<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;${GO_DYNLINK}&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${B}/go_bootstra=
p ${B}/pkg/tool/${BUILD_GOTUPLE}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GO_FLAGS=3D&quot;-b=
uildmode=3Dshared&quot; GO_LDFLAGS=3D&quot;-extldflags \&quot;${LDFLAGS}\&q=
uot;&quot; ./make.bash --target-only<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export GOTOOLDIR=3D=
&quot;${B}/pkg/tool/<wbr>native_native&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CC=3D&quot;$CC_FOR_=
${TARGET_GOOS}_${<wbr>TARGET_GOARCH}&quot; GOARCH=3D&quot;${TARGET_GOARCH}&=
quot; GOOS=3D&quot;${TARGET_GOOS}&quot; GOROOT=3D${B} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0$GOTOOLDIR/go_bootstrap install -linkshared -buildmode=3Dshared $=
{GO_LDFLAGS} std<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${B}<br>
=C2=A0}<br>
+do_compile[dirs] =3D+ &quot;${GOTMPDIR} ${B}/bin ${B}/pkg&quot;<br>
+do_compile[cleandirs] +=3D &quot;${GOTMPDIR} ${B}/bin ${B}/pkg&quot;<br>
<br>
=C2=A0do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${libdir}/go/src<br>
@@ -54,20 +60,10 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 find src -mindepth 1 -maxdepth 1 -type d | whil=
e read srcdir; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp --preserve=3Dmod=
e,timestamps -R $srcdir ${D}${libdir}/go/src/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0find ${D}${libdir}/go/src -depth -type d -name =
testdata -exec rm -rf {} \;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${D}${libdir}/go/src/cmd/dist/<wbr>dist<b=
r>
=C2=A0}<br>
<br>
-# Remove test binaries that cannot be relocated<br>
-do_install_append_class-<wbr>nativesdk() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${libdir}/go/src/runtime/<wbr>pprof/=
testdata<br>
-}<br>
-<br>
-# These testdata directories aren&#39;t needed for builds and contain bina=
ries<br>
-# that can cause errors in sysroot_strip(), so just remove them.<br>
-sysroot_stage_all_append() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0find ${SYSROOT_DESTDIR}${libdir}/<wbr>go/src -d=
epth -type d -name &#39;testdata&#39; -exec rm -rf {} \;<br>
-}<br>
-<br>
=C2=A0ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
=C2=A0FILES_${PN} =3D &quot;${libdir}/go/pkg/${TARGET_<wbr>GOTUPLE}_dynlink=
/*${SOLIBSDEV}<wbr>&quot;<br>
=C2=A0FILES_${PN}-dev =3D &quot;${libdir}/go/src ${libdir}/go/pkg/include \=
<br>
@@ -78,8 +74,6 @@ FILES_${PN}-dev =3D &quot;${libdir}/go/src ${libdir}/go/p=
kg/include \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${lib=
dir}/go/pkg/${TARGET_<wbr>GOTUPLE}_dynlink/*/*/*/*/*.<wbr>shlibname \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${lib=
dir}/go/pkg/${TARGET_<wbr>GOTUPLE}_dynlink/*/*/*/*/*/*.<wbr>shlibname \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${lib=
dir}/go/pkg/${TARGET_<wbr>GOTUPLE}_dynlink/*/*/*/*/*/*/*<wbr>.shlibname \<b=
r>
-&quot;<br>
-FILES_${PN}-staticdev =3D &quot;${libdir}/go/pkg/${TARGET_<wbr>GOTUPLE} \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${lib=
dir}/go/pkg/${TARGET_<wbr>GOTUPLE}_dynlink/*.a \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${lib=
dir}/go/pkg/${TARGET_<wbr>GOTUPLE}_dynlink/*/*.a \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${lib=
dir}/go/pkg/${TARGET_<wbr>GOTUPLE}_dynlink/*/*/*.a \<br>
@@ -88,11 +82,15 @@ FILES_${PN}-staticdev =3D &quot;${libdir}/go/pkg/${TARG=
ET_<wbr>GOTUPLE} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${lib=
dir}/go/pkg/${TARGET_<wbr>GOTUPLE}_dynlink/*/*/*/*/*/*.a \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${lib=
dir}/go/pkg/${TARGET_<wbr>GOTUPLE}_dynlink/*/*/*/*/*/*/*<wbr>.a \<br>
=C2=A0&quot;<br>
-# The testdata directories in the source tree include some binaries for va=
rious<br>
-# architectures, scripts, and .a files<br>
-INSANE_SKIP_${PN}-dev =3D &quot;staticdev ldflags file-rdeps arch&quot;<br=
>
+FILES_${PN}-staticdev =3D &quot;${libdir}/go/pkg/${TARGET_<wbr>GOTUPLE}&qu=
ot;<br>
+<br>
+# Go sources include some scripts and pre-built binaries for<br>
+# multiple architectures.=C2=A0 The static .a files for dynamically-linked=
<br>
+# runtime are also required in -dev.<br>
+INSANE_SKIP_${PN}-dev =3D &quot;staticdev file-rdeps arch&quot;<br>
<br>
=C2=A0INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
=C2=A0INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;1&quot;<br>
+INHIBIT_SYSROOT_STRIP =3D &quot;1&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;nativesdk&quot;<br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.9.bb" =
rel=3D"noreferrer" target=3D"_blank">go-<wbr>runtime_1.9.bb</a> b/meta/reci=
pes-devtools/go/<a href=3D"http://go-runtime_1.10.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">go-<wbr>runtime_1.10.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.9.bb" r=
el=3D"noreferrer" target=3D"_blank">go-<wbr>runtime_1.9.bb</a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.10.bb" re=
l=3D"noreferrer" target=3D"_blank">go-<wbr>runtime_1.10.bb</a><br>
diff --git a/meta/recipes-devtools/go/go-<wbr>target.inc b/meta/recipes-dev=
tools/go/go-<wbr>target.inc<br>
index cac5d78227..a53a314c78 100644<br>
--- a/meta/recipes-devtools/go/go-<wbr>target.inc<br>
+++ b/meta/recipes-devtools/go/go-<wbr>target.inc<br>
@@ -11,10 +11,9 @@ export GO386 =3D &quot;${TARGET_GO386}&quot;<br>
=C2=A0export GOROOT_BOOTSTRAP =3D &quot;${STAGING_LIBDIR_NATIVE}/go&quot;<b=
r>
=C2=A0export GOROOT_FINAL =3D &quot;${libdir}/go&quot;<br>
=C2=A0export CGO_ENABLED =3D &quot;1&quot;<br>
-export CC_FOR_TARGET =3D &quot;${CC}&quot;<br>
-export CXX_FOR_TARGET =3D &quot;${CXX}&quot;<br>
-export GO_TARGET_INSTALL =3D &quot;cmd&quot;<br>
-export GO_FLAGS =3D &quot;-a&quot;<br>
+export GOCACHE =3D &quot;off&quot;<br>
+export GOTMPDIR ?=3D &quot;${WORKDIR}/go-tmp&quot;<br>
+GOTMPDIR[vardepvalue] =3D &quot;&quot;<br>
=C2=A0GO_LDFLAGS =3D &quot;&quot;<br>
=C2=A0GO_LDFLAGS_class-nativesdk =3D &quot;-linkmode external&quot;<br>
=C2=A0export GO_LDFLAGS<br>
@@ -25,24 +24,22 @@ SECURITY_LDFLAGS =3D &quot;&quot;<br>
=C2=A0do_configure[noexec] =3D &quot;1&quot;<br>
<br>
=C2=A0do_compile() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOBIN=3D&quot;${B}/bin&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CC=3D&quot;${@d.getVar(&#39;BUILD_CC&#39=
;).<wbr>strip()}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${GOBIN} ${B}/pkg<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir ${GOBIN}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export TMPDIR=3D${WORKDIR}/build-tmp<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${WORKDIR}/build-tmp<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export CC_FOR_${TARGET_GOOS}_${<wbr>TARGET_GOAR=
CH}=3D&quot;${CC}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export CXX_FOR_${TARGET_GOOS}_${<wbr>TARGET_GOA=
RCH}=3D&quot;${CXX}&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd src<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0./make.bash<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0./make.bash --target-only --no-banner<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${B}<br>
=C2=A0}<br>
+do_compile[dirs] =3D+ &quot;${GOTMPDIR} ${B}/bin ${B}/pkg&quot;<br>
+do_compile[cleandirs] +=3D &quot;${GOTMPDIR} ${B}/bin ${B}/pkg&quot;<br>
<br>
=C2=A0do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${libdir}/go/pkg/tool<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp --preserve=3Dmode,timestamps -R ${B}/pkg/too=
l/${TARGET_<wbr>GOTUPLE} ${D}${libdir}/go/pkg/tool/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${libdir}/go/src<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp --preserve=3Dmode,timestamps -R ${S}/src/cmd=
 ${D}${libdir}/go/src/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0find ${D}${libdir}/go/src -depth -type d -name =
testdata -exec rm -rf {} \;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${libdir}/go/bin<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for f in ${B}/${GO_BUILD_BINDIR}/*; do<br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go_1.9.bb" rel=3D"n=
oreferrer" target=3D"_blank">go_<wbr>1.9.bb</a> b/meta/recipes-devtools/go/=
<a href=3D"http://go_1.10.bb" rel=3D"noreferrer" target=3D"_blank">go_<wbr>=
1.10.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go_1.9.bb" rel=3D"no=
referrer" target=3D"_blank">go_1.<wbr>9.bb</a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go_1.10.bb" rel=3D"nor=
eferrer" target=3D"_blank">go_1.<wbr>10.bb</a><br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.14.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--94eb2c0b9e3a8b4713056643a68d--
