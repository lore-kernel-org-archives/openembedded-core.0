Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 26CCF7847D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 19:48:42 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id z14so1427101pfe.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 11:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=/UIh5QJ55L7w/kn3Iu6xvvEX9P+i1PWJ+SYC4C5K2ik=;
	b=HePJvbwZKMlBTLjBNY2Y3vFm6vgoOwH9mlummPWBP2Pxdtq3e585bd+tEsHT+6bwPP
	obqDa63JkEBiIc4SD70rW1Q0EIoZCOtKjRZewqh7Wvx/MDSGFADe4jpry6nDaAyzrj/t
	P8AfrpMb4zfGrKMED3y7oAJtn3L2xWT5bd5OYtJVshY+7eFF/eMd/bk5m/jTZoegKrJe
	BIxDJZmLdNlaST0cXM+/nGWA9jOBq6oB6gLROh/l0Qnt4KK2JfTzn4ih3L870l9sS4MA
	BnJloNfMx2uPrAKf32GHmCgpVqYq6cTQ5yyB56odmOrEvXWDXnIdwt8UrRGZxMByS7qi
	SOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=/UIh5QJ55L7w/kn3Iu6xvvEX9P+i1PWJ+SYC4C5K2ik=;
	b=PxKCyxSD5AhkC0YECNXNf0jGKT7vIVfzxwuEFENl63vyK2rNzP5Pjbe8zvrLGgHQDp
	MXXs/73ZTYI1c/3FJ3eo6VQcqUDVJaO05dZFF0lLCNrfkU+BDSqtcEwwuTll7uAIetkB
	wGKOxo+E4Z9ILL79MWSYe+2gKYgaG/YElioAAVMQSuBdirFfZmwFQszJhO6pZrfsSFDy
	1BaZlASX7wwY9gVjJlv/oXLfHtfLDE//a1BKBEmcZfpNoWxlaVg9fRtsNQyhjyDOaGpi
	mx+kGUXNpOcwCLSupgfWwdihSXGQ7RrHFLAAzyuzCUrRJbTyl6D7KL90YyyCcb2z699L
	xPAg==
X-Gm-Message-State: APf1xPCUFkv9qlFmtnlJeCO5i4NRSpp+Mw5t5H9Dksmd55MrIO0L98na
	2pXQinTPGMXgYMi9r8s9D0ztMQ1sdrM9bNC+YPVafw==
X-Google-Smtp-Source: AG47ELvuSxF568DdUNXtx2ZVb/TJ3Pn9ePbUA2M0gLaiivi3yQg6YJCsPeB/9ahjc8OiVL+mxkz4+aJNHE+glytPoTo=
X-Received: by 10.99.64.66 with SMTP id n63mr4007686pga.204.1519847321414;
	Wed, 28 Feb 2018 11:48:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.139.97 with HTTP; Wed, 28 Feb 2018 11:48:10 -0800 (PST)
In-Reply-To: <20180227123634.2812-2-matt@madison.systems>
References: <20180227123634.2812-1-matt@madison.systems>
	<20180227123634.2812-2-matt@madison.systems>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Feb 2018 11:48:10 -0800
Message-ID: <CAMKF1squeGT_+E3SZcKkZJuJ5gTTaV0yMBktap4n_3oY_ZYLww@mail.gmail.com>
To: Matt Madison <matt@madison.systems>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 28 Feb 2018 19:48:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2018 at 4:36 AM, Matt Madison <matt@madison.systems> wrote:
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

I gave it a shot and its failing to compile some of the modues with this er=
ror

| /tmp/go-link-766579509/go.o:go.go:runtime.main_init=C2=B7f: error:
undefined reference to 'main.init'
| /tmp/go-link-766579509/go.o:go.go:runtime.main_main=C2=B7f: error:
undefined reference to 'main.main'
| collect2: error: ld returned 1 exit status


In order to reproduce the error you can try to add my fork meta-influx laye=
r

https://github.com/kraj/meta-influx -b kraj/develop

then

bitbake github.com-oneofone-xxhash

> Signed-off-by: Matt Madison <matt@madison.systems>
> ---
>  meta/classes/go.bbclass                            |   2 +
>  meta/recipes-devtools/go/go-1.10.inc               |  21 ++
>  ...1-allow-CC-and-CXX-to-have-multiple-words.patch |  49 ++++
>  ...-content-based-hash-generation-less-pedan.patch | 220 +++++++++++++++=
+
>  ...OLDIR-to-be-overridden-in-the-environment.patch |  64 +++++
>  .../0004-ld-add-soname-to-shareable-objects.patch  |  47 ++++
>  ...verride-CC-when-building-dist-and-go_boot.patch |  40 +++
>  ...-cmd-dist-separate-host-and-target-builds.patch | 277 +++++++++++++++=
++++++
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
>  ...s-canadian_1.9.bb =3D> go-cross-canadian_1.10.bb} |   0
>  meta/recipes-devtools/go/go-cross.inc              |  55 ++--
>  .../go/{go-cross_1.9.bb =3D> go-cross_1.10.bb}       |   0
>  meta/recipes-devtools/go/go-crosssdk.inc           |  16 +-
>  .../go/{go-crosssdk_1.9.bb =3D> go-crosssdk_1.10.bb} |   0
>  meta/recipes-devtools/go/go-native.inc             |  25 +-
>  .../go/{go-native_1.9.bb =3D> go-native_1.10.bb}     |   0
>  meta/recipes-devtools/go/go-runtime.inc            |  58 +++--
>  .../go/{go-runtime_1.9.bb =3D> go-runtime_1.10.bb}   |   0
>  meta/recipes-devtools/go/go-target.inc             |  21 +-
>  meta/recipes-devtools/go/{go_1.9.bb =3D> go_1.10.bb} |   0
>  35 files changed, 1048 insertions(+), 746 deletions(-)
>  create mode 100644 meta/recipes-devtools/go/go-1.10.inc
>  create mode 100644 meta/recipes-devtools/go/go-1.10/0001-allow-CC-and-CX=
X-to-have-multiple-words.patch
>  create mode 100644 meta/recipes-devtools/go/go-1.10/0002-cmd-go-make-con=
tent-based-hash-generation-less-pedan.patch
>  create mode 100644 meta/recipes-devtools/go/go-1.10/0003-allow-GOTOOLDIR=
-to-be-overridden-in-the-environment.patch
>  create mode 100644 meta/recipes-devtools/go/go-1.10/0004-ld-add-soname-t=
o-shareable-objects.patch
>  create mode 100644 meta/recipes-devtools/go/go-1.10/0005-make.bash-overr=
ide-CC-when-building-dist-and-go_boot.patch
>  create mode 100644 meta/recipes-devtools/go/go-1.10/0006-cmd-dist-separa=
te-host-and-target-builds.patch
>  create mode 100644 meta/recipes-devtools/go/go-1.10/0007-cmd-go-make-GOR=
OOT-precious-by-default.patch
>  create mode 100644 meta/recipes-devtools/go/go-1.10/0008-ld-replace-glib=
c-dynamic-linker-with-musl.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.9.inc
>  delete mode 100644 meta/recipes-devtools/go/go-1.9/0001-make.bash-quote-=
CC_FOR_TARGET.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.9/0002-cmd-go-fix-CC-an=
d-CXX-environment-variable-construct.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.9/0003-make.bash-better=
-separate-host-and-target-builds.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.9/0004-cmd-go-allow-GOT=
OOLDIR-to-be-overridden-in-the-envir.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.9/0005-cmd-go-make-GORO=
OT-precious-by-default.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.9/0006-make.bash-add-GO=
TOOLDIR_BOOTSTRAP-environment-variab.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.9/0007-ld-add-soname-to=
-shareable-objects.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.9/0008-make.bash-add-GO=
HOSTxx-indirection-for-cross-canadia.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.9/0009-cmd-go-buildmode=
-pie-forces-external-linking-mode-on.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.9/0010-make.bash-overri=
de-CC-when-building-dist-and-go_boot.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.9/set-external-linker.p=
atch
>  rename meta/recipes-devtools/go/{go-cross-canadian_1.9.bb =3D> go-cross-=
canadian_1.10.bb} (100%)
>  rename meta/recipes-devtools/go/{go-cross_1.9.bb =3D> go-cross_1.10.bb} =
(100%)
>  rename meta/recipes-devtools/go/{go-crosssdk_1.9.bb =3D> go-crosssdk_1.1=
0.bb} (100%)
>  rename meta/recipes-devtools/go/{go-native_1.9.bb =3D> go-native_1.10.bb=
} (100%)
>  rename meta/recipes-devtools/go/{go-runtime_1.9.bb =3D> go-runtime_1.10.=
bb} (100%)
>  rename meta/recipes-devtools/go/{go_1.9.bb =3D> go_1.10.bb} (100%)
>
> diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
> index 7ecd8c9254..43a262d599 100644
> --- a/meta/classes/go.bbclass
> +++ b/meta/classes/go.bbclass
> @@ -24,6 +24,7 @@ GO_LINKMODE ?=3D ""
>  GO_LINKMODE_class-nativesdk =3D "--linkmode=3Dexternal"
>  GO_LDFLAGS ?=3D '-ldflags=3D"${GO_RPATH} ${GO_LINKMODE} -extldflags '${G=
O_EXTLDFLAGS}'"'
>  export GOBUILDFLAGS ?=3D "-v ${GO_LDFLAGS}"
> +export GOPATH_OMIT_IN_ACTIONID ?=3D "1"
>  export GOPTESTBUILDFLAGS ?=3D "${GOBUILDFLAGS} -c"
>  export GOPTESTFLAGS ?=3D "-test.v"
>  GOBUILDFLAGS_prepend_task-compile =3D "${GO_PARALLEL_BUILD} "
> @@ -47,6 +48,7 @@ GO_INSTALL_FILTEROUT ?=3D "${GO_IMPORT}/vendor/"
>
>  B =3D "${WORKDIR}/build"
>  export GOPATH =3D "${B}"
> +export GOCACHE =3D "off"
>  GO_TMPDIR ?=3D "${WORKDIR}/go-tmp"
>  GO_TMPDIR[vardepvalue] =3D ""
>
> diff --git a/meta/recipes-devtools/go/go-1.10.inc b/meta/recipes-devtools=
/go/go-1.10.inc
> new file mode 100644
> index 0000000000..3a93773e2a
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.10.inc
> @@ -0,0 +1,21 @@
> +require go-common.inc
> +
> +GO_BASEVERSION =3D "1.10"
> +FILESEXTRAPATHS_prepend :=3D "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
> +
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74=
707"
> +
> +SRC_URI +=3D "\
> +    file://0001-allow-CC-and-CXX-to-have-multiple-words.patch \
> +    file://0002-cmd-go-make-content-based-hash-generation-less-pedan.pat=
ch \
> +    file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patc=
h \
> +    file://0004-ld-add-soname-to-shareable-objects.patch \
> +    file://0005-make.bash-override-CC-when-building-dist-and-go_boot.pat=
ch \
> +    file://0006-cmd-dist-separate-host-and-target-builds.patch \
> +    file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
> +"
> +
> +SRC_URI_append_libc-musl =3D " file://0008-ld-replace-glibc-dynamic-link=
er-with-musl.patch"
> +
> +SRC_URI[main.md5sum] =3D "07cbb9d0091b846c6aea40bf5bc0cea7"
> +SRC_URI[main.sha256sum] =3D "f3de49289405fda5fd1483a8fe6bd2fa5469e005fd5=
67df64485c4fa000c7f24"
> diff --git a/meta/recipes-devtools/go/go-1.10/0001-allow-CC-and-CXX-to-ha=
ve-multiple-words.patch b/meta/recipes-devtools/go/go-1.10/0001-allow-CC-an=
d-CXX-to-have-multiple-words.patch
> new file mode 100644
> index 0000000000..4584590632
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.10/0001-allow-CC-and-CXX-to-have-mult=
iple-words.patch
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
> +-      if output, err :=3D exec.Command(defaultcc[""], "--help").Combine=
dOutput(); err !=3D nil {
> ++      cc :=3D strings.Split(defaultcc[""], " ")
> ++      args :=3D append(cc[1:], "--help")
> ++      if output, err :=3D exec.Command(cc[0], args...).CombinedOutput()=
; err !=3D nil {
> +               outputHdr :=3D ""
> +               if len(output) > 0 {
> +                       outputHdr =3D "\nCommand output:\n\n"
> +diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/env=
cmd/env.go
> +index 603f7b5060..f891123f9c 100644
> +--- a/src/cmd/go/internal/envcmd/env.go
> ++++ b/src/cmd/go/internal/envcmd/env.go
> +@@ -82,11 +82,11 @@ func MkEnv() []cfg.EnvVar {
> +
> +       cc :=3D cfg.DefaultCC(cfg.Goos, cfg.Goarch)
> +       if env :=3D strings.Fields(os.Getenv("CC")); len(env) > 0 {
> +-              cc =3D env[0]
> ++              cc =3D strings.Join(env, " ")
> +       }
> +       cxx :=3D cfg.DefaultCXX(cfg.Goos, cfg.Goarch)
> +       if env :=3D strings.Fields(os.Getenv("CXX")); len(env) > 0 {
> +-              cxx =3D env[0]
> ++              cxx =3D strings.Join(env, " ")
> +       }
> +       env =3D append(env, cfg.EnvVar{Name: "CC", Value: cc})
> +       env =3D append(env, cfg.EnvVar{Name: "CXX", Value: cxx})
> +--
> +2.14.1
> +
> diff --git a/meta/recipes-devtools/go/go-1.10/0002-cmd-go-make-content-ba=
sed-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go-1.10/000=
2-cmd-go-make-content-based-hash-generation-less-pedan.patch
> new file mode 100644
> index 0000000000..5fd471960e
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.10/0002-cmd-go-make-content-based-has=
h-generation-less-pedan.patch
> @@ -0,0 +1,220 @@
> +From 4ec2b27c091fbce0e8e2fd7e3ef2c76e068af32f Mon Sep 17 00:00:00 2001
> +From: Matt Madison <matt@madison.systems>
> +Date: Mon, 19 Feb 2018 08:50:59 -0800
> +Subject: [PATCH 2/8] cmd/go: make content-based hash generation less ped=
antic
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
> + src/cmd/go/internal/work/exec.go  | 63 ++++++++++++++++++++++++++++----=
-------
> + 2 files changed, 46 insertions(+), 19 deletions(-)
> +
> +diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/env=
cmd/env.go
> +index f891123f9c..ebacfbfdbc 100644
> +--- a/src/cmd/go/internal/envcmd/env.go
> ++++ b/src/cmd/go/internal/envcmd/env.go
> +@@ -113,7 +113,7 @@ func findEnv(env []cfg.EnvVar, name string) string {
> + func ExtraEnvVars() []cfg.EnvVar {
> +       var b work.Builder
> +       b.Init()
> +-      cppflags, cflags, cxxflags, fflags, ldflags, err :=3D b.CFlags(&l=
oad.Package{})
> ++      cppflags, cflags, cxxflags, fflags, ldflags, err :=3D b.CFlags(&l=
oad.Package{}, false)
> +       if err !=3D nil {
> +               // Should not happen - b.CFlags was given an empty packag=
e.
> +               fmt.Fprintf(os.Stderr, "go: invalid cflags: %v\n", err)
> +diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work=
/exec.go
> +index c4c1500eb2..b0f6b45647 100644
> +--- a/src/cmd/go/internal/work/exec.go
> ++++ b/src/cmd/go/internal/work/exec.go
> +@@ -173,6 +173,8 @@ func (b *Builder) Do(root *Action) {
> +       wg.Wait()
> + }
> +
> ++var omitGopath =3D os.Getenv("GOPATH_OMIT_IN_ACTIONID") !=3D ""
> ++
> + // buildActionID computes the action ID for a build action.
> + func (b *Builder) buildActionID(a *Action) cache.ActionID {
> +       p :=3D a.Package
> +@@ -189,7 +191,7 @@ func (b *Builder) buildActionID(a *Action) cache.Act=
ionID {
> +       // but it does not hide the exact value of $GOPATH.
> +       // Include the full dir in that case.
> +       // Assume b.WorkDir is being trimmed properly.
> +-      if !p.Goroot && !strings.HasPrefix(p.Dir, b.WorkDir) {
> ++      if !p.Goroot && !omitGopath && !strings.HasPrefix(p.Dir, b.WorkDi=
r) {
> +               fmt.Fprintf(h, "dir %s\n", p.Dir)
> +       }
> +       fmt.Fprintf(h, "goos %s goarch %s\n", cfg.Goos, cfg.Goarch)
> +@@ -197,13 +199,13 @@ func (b *Builder) buildActionID(a *Action) cache.A=
ctionID {
> +       fmt.Fprintf(h, "omitdebug %v standard %v local %v prefix %q\n", p=
.Internal.OmitDebug, p.Standard, p.Internal.Local, p.Internal.LocalPrefix)
> +       if len(p.CgoFiles)+len(p.SwigFiles) > 0 {
> +               fmt.Fprintf(h, "cgo %q\n", b.toolID("cgo"))
> +-              cppflags, cflags, cxxflags, fflags, _, _ :=3D b.CFlags(p)
> +-              fmt.Fprintf(h, "CC=3D%q %q %q\n", b.ccExe(), cppflags, cf=
lags)
> ++              cppflags, cflags, cxxflags, fflags, _, _ :=3D b.CFlags(p,=
 true)
> ++              fmt.Fprintf(h, "CC=3D%q %q %q\n", b.ccExe(true), cppflags=
, cflags)
> +               if len(p.CXXFiles)+len(p.SwigFiles) > 0 {
> +-                      fmt.Fprintf(h, "CXX=3D%q %q\n", b.cxxExe(), cxxfl=
ags)
> ++                      fmt.Fprintf(h, "CXX=3D%q %q\n", b.cxxExe(true), c=
xxflags)
> +               }
> +               if len(p.FFiles) > 0 {
> +-                      fmt.Fprintf(h, "FC=3D%q %q\n", b.fcExe(), fflags)
> ++                      fmt.Fprintf(h, "FC=3D%q %q\n", b.fcExe(true), ffl=
ags)
> +               }
> +               // TODO(rsc): Should we include the SWIG version or Fortr=
an/GCC/G++/Objective-C compiler versions?
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
> + // ccExe returns the CC compiler setting without all the extra flags we=
 add implicitly.
> +-func (b *Builder) ccExe() []string {
> +-      return b.compilerExe(origCC, cfg.DefaultCC(cfg.Goos, cfg.Goarch))
> ++func (b *Builder) ccExe(filtered bool) []string {
> ++      return b.compilerExe(origCC, cfg.DefaultCC(cfg.Goos, cfg.Goarch),=
 filtered)
> + }
> +
> + // cxxExe returns the CXX compiler setting without all the extra flags =
we add implicitly.
> +-func (b *Builder) cxxExe() []string {
> +-      return b.compilerExe(origCXX, cfg.DefaultCXX(cfg.Goos, cfg.Goarch=
))
> ++func (b *Builder) cxxExe(filtered bool) []string {
> ++      return b.compilerExe(origCXX, cfg.DefaultCXX(cfg.Goos, cfg.Goarch=
), filtered)
> + }
> +
> + // fcExe returns the FC compiler setting without all the extra flags we=
 add implicitly.
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
> + // For example if CC=3D"gcc -DGOPHER" then the result is ["gcc", "-DGOP=
HER"].
> +-func (b *Builder) compilerExe(envValue string, def string) []string {
> ++func (b *Builder) compilerExe(envValue string, def string, filtered boo=
l) []string {
> +       compiler :=3D strings.Fields(envValue)
> +       if len(compiler) =3D=3D 0 {
> +               compiler =3D []string{def}
> +       }
> ++      if filtered {
> ++              return append(compiler[0:1], filterCompilerFlags(compiler=
[1:])...)
> ++      }
> +       return compiler
> + }
> +
> +@@ -1920,8 +1925,23 @@ func envList(key, def string) []string {
> +       return strings.Fields(v)
> + }
> +
> ++var filterFlags =3D os.Getenv("CGO_PEDANTIC") =3D=3D ""
> ++
> ++func filterCompilerFlags(flags []string) []string {
> ++      var newflags []string
> ++      if !filterFlags {
> ++              return flags
> ++      }
> ++      for _, flag :=3D range flags {
> ++              if strings.HasPrefix(flag, "-m") {
> ++                      newflags =3D append(newflags, flag)
> ++              }
> ++      }
> ++      return newflags
> ++}
> ++
> + // CFlags returns the flags to use when invoking the C, C++ or Fortran =
compilers, or cgo.
> +-func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, =
fflags, ldflags []string, err error) {
> ++func (b *Builder) CFlags(p *load.Package, filtered bool) (cppflags, cfl=
ags, cxxflags, fflags, ldflags []string, err error) {
> +       defaults :=3D "-g -O2"
> +
> +       if cppflags, err =3D buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, ch=
eckCompilerFlags); err !=3D nil {
> +@@ -1939,6 +1959,13 @@ func (b *Builder) CFlags(p *load.Package) (cppfla=
gs, cflags, cxxflags, fflags, l
> +       if ldflags, err =3D buildFlags("LDFLAGS", defaults, p.CgoLDFLAGS,=
 checkLinkerFlags); err !=3D nil {
> +               return
> +       }
> ++      if filtered {
> ++              cppflags =3D filterCompilerFlags(cppflags)
> ++              cflags =3D filterCompilerFlags(cflags)
> ++              cxxflags =3D filterCompilerFlags(cxxflags)
> ++              fflags =3D filterCompilerFlags(fflags)
> ++              ldflags =3D filterCompilerFlags(ldflags)
> ++      }
> +
> +       return
> + }
> +@@ -1954,7 +1981,7 @@ var cgoRe =3D regexp.MustCompile(`[/\\:]`)
> +
> + func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDF=
LAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo, outObj=
 []string, err error) {
> +       p :=3D a.Package
> +-      cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoLDFLAGS, err :=
=3D b.CFlags(p)
> ++      cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoLDFLAGS, err :=
=3D b.CFlags(p, false)
> +       if err !=3D nil {
> +               return nil, nil, err
> +       }
> +@@ -2306,7 +2333,7 @@ func (b *Builder) swigIntSize(objdir string) (ints=
ize string, err error) {
> +
> + // Run SWIG on one SWIG input file.
> + func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir stri=
ng, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string, err=
 error) {
> +-      cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err :=3D b.CFlags(p)
> ++      cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err :=3D b.CFlags(p, f=
alse)
> +       if err !=3D nil {
> +               return "", "", err
> +       }
> +--
> +2.14.1
> +
> diff --git a/meta/recipes-devtools/go/go-1.10/0003-allow-GOTOOLDIR-to-be-=
overridden-in-the-environment.patch b/meta/recipes-devtools/go/go-1.10/0003=
-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> new file mode 100644
> index 0000000000..d1a674f3c2
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.10/0003-allow-GOTOOLDIR-to-be-overrid=
den-in-the-environment.patch
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
> +       workdir =3D xworkdir()
> +       xatexit(rmworkdir)
> +
> +-      tooldir =3D pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostar=
ch)
> ++      if tooldir =3D os.Getenv("GOTOOLDIR"); tooldir =3D=3D "" {
> ++              tooldir =3D pathf("%s/pkg/tool/%s_%s", goroot, gohostos, =
gohostarch)
> ++      }
> + }
> +
> + // compilerEnv returns a map from "goos/goarch" to the
> +diff --git a/src/cmd/go/internal/cfg/cfg.go b/src/cmd/go/internal/cfg/cf=
g.go
> +index 1de4f0dc79..4f6010d660 100644
> +--- a/src/cmd/go/internal/cfg/cfg.go
> ++++ b/src/cmd/go/internal/cfg/cfg.go
> +@@ -96,7 +96,11 @@ func init() {
> +       // as the tool directory does not move based on environment varia=
bles.
> +       // This matches the initialization of ToolDir in go/build,
> +       // except for using GOROOT rather than runtime.GOROOT().
> +-      build.ToolDir =3D filepath.Join(GOROOT, "pkg/tool/"+runtime.GOOS+=
"_"+runtime.GOARCH)
> ++      if s :=3D os.Getenv("GOTOOLDIR"); s !=3D "" {
> ++              build.ToolDir =3D filepath.Clean(s)
> ++      } else {
> ++              build.ToolDir =3D filepath.Join(GOROOT, "pkg/tool/"+runti=
me.GOOS+"_"+runtime.GOARCH)
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
> +-var ToolDir =3D filepath.Join(runtime.GOROOT(), "pkg/tool/"+runtime.GOO=
S+"_"+runtime.GOARCH)
> ++var ToolDir =3D envOr("GOTOOLDIR", filepath.Join(runtime.GOROOT(), "pkg=
/tool/"+runtime.GOOS+"_"+runtime.GOARCH))
> +
> + // IsLocalImport reports whether the import path is
> + // a local import path, like ".", "..", "./foo", or "../foo".
> +--
> +2.14.1
> +
> diff --git a/meta/recipes-devtools/go/go-1.10/0004-ld-add-soname-to-share=
able-objects.patch b/meta/recipes-devtools/go/go-1.10/0004-ld-add-soname-to=
-shareable-objects.patch
> new file mode 100644
> index 0000000000..a748391659
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.10/0004-ld-add-soname-to-shareable-ob=
jects.patch
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
> +diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/ld/=
lib.go
> +index 6dcaf64122..11cbb8a8bb 100644
> +--- a/src/cmd/link/internal/ld/lib.go
> ++++ b/src/cmd/link/internal/ld/lib.go
> +@@ -1134,6 +1134,7 @@ func (ctxt *Link) hostlink() {
> +                               argv =3D append(argv, "-Wl,-z,relro")
> +                       }
> +                       argv =3D append(argv, "-shared")
> ++                      argv =3D append(argv, fmt.Sprintf("-Wl,-soname,%s=
", filepath.Base(*flagOutfile)))
> +                       if ctxt.HeadType !=3D objabi.Hwindows {
> +                               // Pass -z nodelete to mark the shared li=
brary as
> +                               // non-closeable: a dlclose will do nothi=
ng.
> +@@ -1145,6 +1146,8 @@ func (ctxt *Link) hostlink() {
> +                       argv =3D append(argv, "-Wl,-z,relro")
> +               }
> +               argv =3D append(argv, "-shared")
> ++              argv =3D append(argv, fmt.Sprintf("-Wl,-soname,%s", filep=
ath.Base(*flagOutfile)))
> ++
> +       case BuildModePlugin:
> +               if ctxt.HeadType =3D=3D objabi.Hdarwin {
> +                       argv =3D append(argv, "-dynamiclib")
> +@@ -1153,6 +1156,7 @@ func (ctxt *Link) hostlink() {
> +                               argv =3D append(argv, "-Wl,-z,relro")
> +                       }
> +                       argv =3D append(argv, "-shared")
> ++                      argv =3D append(argv, fmt.Sprintf("-Wl,-soname,%s=
", filepath.Base(*flagOutfile)))
> +               }
> +       }
> +
> +--
> +2.14.1
> +
> diff --git a/meta/recipes-devtools/go/go-1.10/0005-make.bash-override-CC-=
when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go-1.10/000=
5-make.bash-override-CC-when-building-dist-and-go_boot.patch
> new file mode 100644
> index 0000000000..d15f9d299f
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.10/0005-make.bash-override-CC-when-bu=
ilding-dist-and-go_boot.patch
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
> +@@ -162,7 +162,7 @@ if [ "$GOROOT_BOOTSTRAP" =3D "$GOROOT" ]; then
> +       exit 1
> + fi
> + rm -f cmd/dist/dist
> +-GOROOT=3D"$GOROOT_BOOTSTRAP" GOOS=3D"" GOARCH=3D"" "$GOROOT_BOOTSTRAP/b=
in/go" build -o cmd/dist/dist ./cmd/dist
> ++CC=3D"${BUILD_CC:-${CC}}" GOROOT=3D"$GOROOT_BOOTSTRAP" GOOS=3D"" GOARCH=
=3D"" "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
> +
> + # -e doesn't propagate out of eval, so check success by hand.
> + eval $(./cmd/dist/dist env -p || echo FAIL=3Dtrue)
> +@@ -193,7 +193,7 @@ fi
> + # Run dist bootstrap to complete make.bash.
> + # Bootstrap installs a proper cmd/dist, built with the new toolchain.
> + # Throw ours, built with Go 1.4, away after bootstrap.
> +-./cmd/dist/dist bootstrap $buildall $vflag $GO_DISTFLAGS "$@"
> ++CC=3D"${BUILD_CC:-${CC}}" ./cmd/dist/dist bootstrap $buildall $vflag $G=
O_DISTFLAGS "$@"
> + rm -f ./cmd/dist/dist
> +
> + # DO NOT ADD ANY NEW CODE HERE.
> +--
> +2.14.1
> +
> diff --git a/meta/recipes-devtools/go/go-1.10/0006-cmd-dist-separate-host=
-and-target-builds.patch b/meta/recipes-devtools/go/go-1.10/0006-cmd-dist-s=
eparate-host-and-target-builds.patch
> new file mode 100644
> index 0000000000..73a9db213c
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.10/0006-cmd-dist-separate-host-and-ta=
rget-builds.patch
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
> + src/cmd/dist/build.go | 149 +++++++++++++++++++++++++++++++++++++------=
-------
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
> +       if tooldir =3D os.Getenv("GOTOOLDIR"); tooldir =3D=3D "" {
> +               tooldir =3D pathf("%s/pkg/tool/%s_%s", goroot, gohostos, =
gohostarch)
> +       }
> ++      build_tooldir =3D pathf("%s/pkg/tool/native_native", goroot)
> ++
> + }
> +
> + // compilerEnv returns a map from "goos/goarch" to the
> +@@ -252,7 +256,6 @@ func compilerEnv(envName, def string) map[string]str=
ing {
> +               if gohostos !=3D goos || gohostarch !=3D goarch {
> +                       m[gohostos+"/"+gohostarch] =3D m[""]
> +               }
> +-              m[""] =3D env
> +       }
> +
> +       for _, goos :=3D range okgoos {
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
> ++      var toBuild =3D []string { "std", "cmd" }
> ++
> +       flag.BoolVar(&rebuildall, "a", rebuildall, "rebuild all")
> +       flag.BoolVar(&debug, "d", debug, "enable debugging of bootstrap p=
rocess")
> +       flag.BoolVar(&noBanner, "no-banner", noBanner, "do not print bann=
er")
> ++      flag.BoolVar(&hostOnly, "host-only", hostOnly, "build only host b=
inaries, not target")
> ++      flag.BoolVar(&targetOnly, "target-only", targetOnly, "build only =
target binaries, not host")
> +
> +-      xflagparse(0)
> ++      xflagparse(-1)
> ++
> ++      if (hostOnly && targetOnly) {
> ++              fatalf("specify only one of --host-only or --target-only\=
n")
> ++      }
> ++      crossBuild =3D hostOnly || targetOnly
> ++      if flag.NArg() > 0 {
> ++              if crossBuild {
> ++                      toBuild =3D flag.Args()
> ++              } else {
> ++                      fatalf("package names not permitted without --hos=
t-only or --target-only\n")
> ++              }
> ++      }
> +
> +       if debug {
> +               // cmd/buildid is used in debug mode.
> +@@ -1182,8 +1205,13 @@ func cmdbootstrap() {
> +               xprintf("\n")
> +       }
> +
> +-      gogcflags =3D os.Getenv("GO_GCFLAGS") // we were using $BOOT_GO_G=
CFLAGS until now
> +-      goldflags =3D os.Getenv("GO_LDFLAGS")
> ++      // For split host/target cross/cross-canadian builds, we don't
> ++      // want to be setting these flags until after we have compiled
> ++      // the toolchain that runs on the build host.
> ++      if ! crossBuild {
> ++              gogcflags =3D os.Getenv("GO_GCFLAGS") // we were using $B=
OOT_GO_GCFLAGS until now
> ++              goldflags =3D os.Getenv("GO_LDFLAGS")
> ++      }
> +       goBootstrap :=3D pathf("%s/go_bootstrap", tooldir)
> +       cmdGo :=3D pathf("%s/go", gobin)
> +       if debug {
> +@@ -1212,7 +1240,11 @@ func cmdbootstrap() {
> +               xprintf("\n")
> +       }
> +       xprintf("Building Go toolchain2 using go_bootstrap and Go toolcha=
in1.\n")
> +-      os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
> ++      if crossBuild {
> ++              os.Setenv("CC", defaultcc[""])
> ++      } else {
> ++              os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch=
))
> ++      }
> +       goInstall(goBootstrap, append([]string{"-i"}, toolchain...)...)
> +       if debug {
> +               run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir=
), "-V=3Dfull")
> +@@ -1249,45 +1281,82 @@ func cmdbootstrap() {
> +       }
> +       checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sy=
s")...)
> +
> +-      if goos =3D=3D oldgoos && goarch =3D=3D oldgoarch {
> +-              // Common case - not setting up for cross-compilation.
> +-              timelog("build", "toolchain")
> +-              if vflag > 0 {
> +-                      xprintf("\n")
> ++      if crossBuild {
> ++              gogcflags =3D os.Getenv("GO_GCFLAGS")
> ++              goldflags =3D os.Getenv("GO_LDFLAGS")
> ++              tool_files, _ :=3D filepath.Glob(pathf("%s/*", tooldir))
> ++              for _, f :=3D range tool_files {
> ++                      copyfile(pathf("%s/%s", build_tooldir, filepath.B=
ase(f)), f, writeExec)
> ++                      xremove(f)
> ++              }
> ++              os.Setenv("GOTOOLDIR", build_tooldir)
> ++              goBootstrap =3D pathf("%s/go_bootstrap", build_tooldir)
> ++              if hostOnly {
> ++                      timelog("build", "host toolchain")
> ++                      if vflag > 0 {
> ++                              xprintf("\n")
> ++                      }
> ++                      xprintf("Building %s for host, %s/%s.\n", strings=
.Join(toBuild, ","), goos, goarch)
> ++                      goInstall(goBootstrap, toBuild...)
> ++                      checkNotStale(goBootstrap, toBuild...)
> ++                      // Skip cmdGo staleness checks here, since we can=
't necessarily run the cmdGo binary
> ++
> ++                      timelog("build", "target toolchain")
> ++                      if vflag > 0 {
> ++                              xprintf("\n")
> ++                      }
> ++              } else if targetOnly {
> ++                      goos =3D oldgoos
> ++                      goarch =3D oldgoarch
> ++                      os.Setenv("GOOS", goos)
> ++                      os.Setenv("GOARCH", goarch)
> ++                      os.Setenv("CC", compilerEnvLookup(defaultcc, goos=
, goarch))
> ++                      xprintf("Building %s for target, %s/%s.\n", strin=
gs.Join(toBuild, ","), goos, goarch)
> ++                      goInstall(goBootstrap, toBuild...)
> ++                      checkNotStale(goBootstrap, toBuild...)
> ++                      // Skip cmdGo staleness checks here, since we can=
't run the target's cmdGo binary
> +               }
> +-              xprintf("Building packages and commands for %s/%s.\n", go=
os, goarch)
> +       } else {
> +-              // GOOS/GOARCH does not match GOHOSTOS/GOHOSTARCH.
> +-              // Finish GOHOSTOS/GOHOSTARCH installation and then
> +-              // run GOOS/GOARCH installation.
> +-              timelog("build", "host toolchain")
> +-              if vflag > 0 {
> +-                      xprintf("\n")
> ++              if goos =3D=3D oldgoos && goarch =3D=3D oldgoarch {
> ++                      // Common case - not setting up for cross-compila=
tion.
> ++                      timelog("build", "toolchain")
> ++                      if vflag > 0 {
> ++                              xprintf("\n")
> ++                      }
> ++                      xprintf("Building packages and commands for %s/%s=
.\n", goos, goarch)
> ++              } else {
> ++                      // GOOS/GOARCH does not match GOHOSTOS/GOHOSTARCH=
.
> ++                      // Finish GOHOSTOS/GOHOSTARCH installation and th=
en
> ++                      // run GOOS/GOARCH installation.
> ++                      timelog("build", "host toolchain")
> ++                      if vflag > 0 {
> ++                              xprintf("\n")
> ++                      }
> ++                      xprintf("Building packages and commands for host,=
 %s/%s.\n", goos, goarch)
> ++                      goInstall(goBootstrap, "std", "cmd")
> ++                      checkNotStale(goBootstrap, "std", "cmd")
> ++                      checkNotStale(cmdGo, "std", "cmd")
> ++
> ++                      timelog("build", "target toolchain")
> ++                      if vflag > 0 {
> ++                              xprintf("\n")
> ++                      }
> ++                      goos =3D oldgoos
> ++                      goarch =3D oldgoarch
> ++                      os.Setenv("GOOS", goos)
> ++                      os.Setenv("GOARCH", goarch)
> ++                      os.Setenv("CC", compilerEnvLookup(defaultcc, goos=
, goarch))
> ++                      xprintf("Building packages and commands for targe=
t, %s/%s.\n", goos, goarch)
> +               }
> +-              xprintf("Building packages and commands for host, %s/%s.\=
n", goos, goarch)
> +               goInstall(goBootstrap, "std", "cmd")
> +               checkNotStale(goBootstrap, "std", "cmd")
> +               checkNotStale(cmdGo, "std", "cmd")
> +-
> +-              timelog("build", "target toolchain")
> +-              if vflag > 0 {
> +-                      xprintf("\n")
> ++              if debug {
> ++                      run("", ShowOutput|CheckExit, pathf("%s/compile",=
 tooldir), "-V=3Dfull")
> ++                      run("", ShowOutput|CheckExit, pathf("%s/buildid",=
 tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarc=
h))
> ++                      checkNotStale(goBootstrap, append(toolchain, "run=
time/internal/sys")...)
> ++                      copyfile(pathf("%s/compile4", tooldir), pathf("%s=
/compile", tooldir), writeExec)
> +               }
> +-              goos =3D oldgoos
> +-              goarch =3D oldgoarch
> +-              os.Setenv("GOOS", goos)
> +-              os.Setenv("GOARCH", goarch)
> +-              os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch=
))
> +-              xprintf("Building packages and commands for target, %s/%s=
.\n", goos, goarch)
> +-      }
> +-      goInstall(goBootstrap, "std", "cmd")
> +-      checkNotStale(goBootstrap, "std", "cmd")
> +-      checkNotStale(cmdGo, "std", "cmd")
> +-      if debug {
> +-              run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir=
), "-V=3Dfull")
> +-              run("", ShowOutput|CheckExit, pathf("%s/buildid", tooldir=
), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
> +-              checkNotStale(goBootstrap, append(toolchain, "runtime/int=
ernal/sys")...)
> +-              copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile=
", tooldir), writeExec)
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
> diff --git a/meta/recipes-devtools/go/go-1.10/0007-cmd-go-make-GOROOT-pre=
cious-by-default.patch b/meta/recipes-devtools/go/go-1.10/0007-cmd-go-make-=
GOROOT-precious-by-default.patch
> new file mode 100644
> index 0000000000..cadca3012b
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.10/0007-cmd-go-make-GOROOT-precious-b=
y-default.patch
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
> +diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/wor=
k/build.go
> +index 57b7b00879..e2ba95420e 100644
> +--- a/src/cmd/go/internal/work/build.go
> ++++ b/src/cmd/go/internal/work/build.go
> +@@ -143,6 +143,7 @@ See also: go install, go get, go clean.
> + }
> +
> + const concurrentGCBackendCompilationEnabledByDefault =3D true
> ++var goRootPrecious bool =3D true
> +
> + func init() {
> +       // break init cycle
> +@@ -156,6 +157,10 @@ func init() {
> +
> +       AddBuildFlags(CmdBuild)
> +       AddBuildFlags(CmdInstall)
> ++
> ++      if x :=3D os.Getenv("GOROOT_OVERRIDE"); x !=3D "" {
> ++              goRootPrecious =3D false
> ++      }
> + }
> +
> + // Note that flags consulted by other parts of the code
> +diff --git a/src/cmd/go/internal/work/buildid.go b/src/cmd/go/internal/w=
ork/buildid.go
> +index 39ca20ee4f..a047430177 100644
> +--- a/src/cmd/go/internal/work/buildid.go
> ++++ b/src/cmd/go/internal/work/buildid.go
> +@@ -463,7 +463,7 @@ func (b *Builder) useCache(a *Action, p *load.Packag=
e, actionHash cache.ActionID
> +
> +       if b.ComputeStaleOnly {
> +               // Invoked during go list only to compute and record stal=
eness.
> +-              if p :=3D a.Package; p !=3D nil && !p.Stale {
> ++              if p :=3D a.Package; p !=3D nil && !p.Stale && !(goRootPr=
ecious && (p.Standard || p.Goroot)) {
> +                       p.Stale =3D true
> +                       if cfg.BuildA {
> +                               p.StaleReason =3D "build -a flag in use"
> +diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work=
/exec.go
> +index b0f6b45647..a876d59347 100644
> +--- a/src/cmd/go/internal/work/exec.go
> ++++ b/src/cmd/go/internal/work/exec.go
> +@@ -371,6 +371,24 @@ func (b *Builder) build(a *Action) (err error) {
> +               return fmt.Errorf("missing or invalid binary-only package=
")
> +       }
> +
> ++      if goRootPrecious && (a.Package.Standard || a.Package.Goroot) {
> ++              _, err :=3D os.Stat(a.Package.Target)
> ++              if err =3D=3D nil {
> ++                      a.built =3D a.Package.Target
> ++                      a.Target =3D a.Package.Target
> ++                      a.buildID =3D b.fileHash(a.Package.Target)
> ++                      a.Package.Stale =3D false
> ++                      a.Package.StaleReason =3D "GOROOT-resident packag=
e"
> ++                      return nil
> ++              }
> ++              if b.ComputeStaleOnly {
> ++                      a.Package.Stale =3D true
> ++                      a.Package.StaleReason =3D "missing or invalid GOR=
OOT-resident package"
> ++                      return nil
> ++              }
> ++              return fmt.Errorf("missing or invalid GOROOT-resident pac=
kage")
> ++      }
> ++
> +       if err :=3D b.Mkdir(a.Objdir); err !=3D nil {
> +               return err
> +       }
> +--
> +2.14.1
> +
> diff --git a/meta/recipes-devtools/go/go-1.10/0008-ld-replace-glibc-dynam=
ic-linker-with-musl.patch b/meta/recipes-devtools/go/go-1.10/0008-ld-replac=
e-glibc-dynamic-linker-with-musl.patch
> new file mode 100644
> index 0000000000..cc7179cb2c
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.10/0008-ld-replace-glibc-dynamic-link=
er-with-musl.patch
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
> +Upstream-Status: Inappropriate [Real fix should be portable across libcs=
]
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
> +diff --git a/src/cmd/link/internal/amd64/obj.go b/src/cmd/link/internal/=
amd64/obj.go
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
> +diff --git a/src/cmd/link/internal/arm/obj.go b/src/cmd/link/internal/ar=
m/obj.go
> +index da16f92345..fd14940ede 100644
> +--- a/src/cmd/link/internal/arm/obj.go
> ++++ b/src/cmd/link/internal/arm/obj.go
> +@@ -58,7 +58,7 @@ func Init() (*sys.Arch, ld.Arch) {
> +               Gentext:          gentext,
> +               Machoreloc1:      machoreloc1,
> +
> +-              Linuxdynld:     "/lib/ld-linux.so.3", // 2 for OABI, 3 fo=
r EABI
> ++              Linuxdynld:     "/lib/ld-musl-armhf.so.1",
> +               Freebsddynld:   "/usr/libexec/ld-elf.so.1",
> +               Openbsddynld:   "/usr/libexec/ld.so",
> +               Netbsddynld:    "/libexec/ld.elf_so",
> +diff --git a/src/cmd/link/internal/arm64/obj.go b/src/cmd/link/internal/=
arm64/obj.go
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
> +diff --git a/src/cmd/link/internal/mips/obj.go b/src/cmd/link/internal/m=
ips/obj.go
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
> +diff --git a/src/cmd/link/internal/mips64/obj.go b/src/cmd/link/internal=
/mips64/obj.go
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
> +diff --git a/src/cmd/link/internal/ppc64/obj.go b/src/cmd/link/internal/=
ppc64/obj.go
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
> +diff --git a/src/cmd/link/internal/s390x/obj.go b/src/cmd/link/internal/=
s390x/obj.go
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
> +diff --git a/src/cmd/link/internal/x86/obj.go b/src/cmd/link/internal/x8=
6/obj.go
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
> diff --git a/meta/recipes-devtools/go/go-1.9.inc b/meta/recipes-devtools/=
go/go-1.9.inc
> deleted file mode 100644
> index 2823304b7c..0000000000
> --- a/meta/recipes-devtools/go/go-1.9.inc
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -require go-common.inc
> -
> -GO_BASEVERSION =3D "1.9"
> -GO_MINOR =3D ".4"
> -PV .=3D "${GO_MINOR}"
> -
> -FILESEXTRAPATHS_prepend :=3D "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
> -
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74=
707"
> -
> -SRC_URI +=3D "\
> -        file://0001-make.bash-quote-CC_FOR_TARGET.patch \
> -        file://0002-cmd-go-fix-CC-and-CXX-environment-variable-construct=
.patch \
> -        file://0003-make.bash-better-separate-host-and-target-builds.pat=
ch \
> -        file://0004-cmd-go-allow-GOTOOLDIR-to-be-overridden-in-the-envir=
.patch \
> -        file://0005-cmd-go-make-GOROOT-precious-by-default.patch \
> -        file://0006-make.bash-add-GOTOOLDIR_BOOTSTRAP-environment-variab=
.patch \
> -        file://0007-ld-add-soname-to-shareable-objects.patch \
> -        file://0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia=
.patch \
> -        file://0009-cmd-go-buildmode-pie-forces-external-linking-mode-on=
.patch \
> -        file://0010-make.bash-override-CC-when-building-dist-and-go_boot=
.patch \
> -"
> -SRC_URI_append_libc-musl =3D " file://set-external-linker.patch"
> -
> -SRC_URI[main.md5sum] =3D "6816441fd6680c63865cdd5cb8bc1960"
> -SRC_URI[main.sha256sum] =3D "0573a8df33168977185aa44173305e5a0450f552136=
00e94541604b75d46dc06"
> diff --git a/meta/recipes-devtools/go/go-1.9/0001-make.bash-quote-CC_FOR_=
TARGET.patch b/meta/recipes-devtools/go/go-1.9/0001-make.bash-quote-CC_FOR_=
TARGET.patch
> deleted file mode 100644
> index 7800975e48..0000000000
> --- a/meta/recipes-devtools/go/go-1.9/0001-make.bash-quote-CC_FOR_TARGET.=
patch
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
> -@@ -175,7 +175,7 @@ echo "##### Building packages and commands for $GOOS=
/$GOARCH."
> -
> - old_bin_files=3D$(cd $GOROOT/bin && echo *)
> -
> --CC=3D$CC_FOR_TARGET "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcflag=
s "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
> -+CC=3D"$CC_FOR_TARGET" "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcfl=
ags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
> -
> - # Check that there are no new files in $GOROOT/bin other than go and go=
fmt
> - # and $GOOS_$GOARCH (a directory used when cross-compiling).
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-devtools/go/go-1.9/0002-cmd-go-fix-CC-and-CXX-e=
nvironment-variable-construct.patch b/meta/recipes-devtools/go/go-1.9/0002-=
cmd-go-fix-CC-and-CXX-environment-variable-construct.patch
> deleted file mode 100644
> index a4e42261c3..0000000000
> --- a/meta/recipes-devtools/go/go-1.9/0002-cmd-go-fix-CC-and-CXX-environm=
ent-variable-construct.patch
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -From a7170d32a13aead608abd18996f6dab2e2a631b5 Mon Sep 17 00:00:00 2001
> -From: Matt Madison <matt@madison.systems>
> -Date: Wed, 13 Sep 2017 08:06:37 -0700
> -Subject: [PATCH 2/7] cmd/go: fix CC and CXX environment variable constru=
ction
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
> -diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/env=
cmd/env.go
> -index 43d4334..529d21d 100644
> ---- a/src/cmd/go/internal/envcmd/env.go
> -+++ b/src/cmd/go/internal/envcmd/env.go
> -@@ -74,10 +74,10 @@ func MkEnv() []cfg.EnvVar {
> -       }
> -
> -       cmd :=3D b.GccCmd(".")
> --      env =3D append(env, cfg.EnvVar{Name: "CC", Value: cmd[0]})
> -+      env =3D append(env, cfg.EnvVar{Name: "CC", Value: strings.Join(b.=
GccCmdForReal(), " ")})
> -       env =3D append(env, cfg.EnvVar{Name: "GOGCCFLAGS", Value: strings=
.Join(cmd[3:], " ")})
> -       cmd =3D b.GxxCmd(".")
> --      env =3D append(env, cfg.EnvVar{Name: "CXX", Value: cmd[0]})
> -+      env =3D append(env, cfg.EnvVar{Name: "CXX", Value: strings.Join(b=
.GxxCmdForReal(), " ")})
> -
> -       if cfg.BuildContext.CgoEnabled {
> -               env =3D append(env, cfg.EnvVar{Name: "CGO_ENABLED", Value=
: "1"})
> -diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/wor=
k/build.go
> -index 7d667ff..85df0b3 100644
> ---- a/src/cmd/go/internal/work/build.go
> -+++ b/src/cmd/go/internal/work/build.go
> -@@ -3127,12 +3127,24 @@ func (b *Builder) GccCmd(objdir string) []string=
 {
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
> diff --git a/meta/recipes-devtools/go/go-1.9/0003-make.bash-better-separa=
te-host-and-target-builds.patch b/meta/recipes-devtools/go/go-1.9/0003-make=
.bash-better-separate-host-and-target-builds.patch
> deleted file mode 100644
> index ffd9f2359c..0000000000
> --- a/meta/recipes-devtools/go/go-1.9/0003-make.bash-better-separate-host=
-and-target-builds.patch
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
> -@@ -156,13 +156,22 @@ if [ "$1" =3D "--no-clean" ]; then
> -       buildall=3D""
> -       shift
> - fi
> --./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds go_bootst=
rap
> -+do_host_build=3D"yes"
> -+do_target_build=3D"yes"
> -+if [ "$1" =3D "--target-only" ]; then
> -+      do_host_build=3D"no"
> -+      shift
> -+elif [ "$1" =3D "--host-only" ]; then
> -+      do_target_build=3D"no"
> -+      shift
> -+fi
> -
> --# Delay move of dist tool to now, because bootstrap may clear tool dire=
ctory.
> --mv cmd/dist/dist "$GOTOOLDIR"/dist
> --echo
> -+if [ "$do_host_build" =3D "yes" ]; then
> -+      ./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds go_=
bootstrap
> -+      # Delay move of dist tool to now, because bootstrap may clear too=
l directory.
> -+      mv cmd/dist/dist "$GOTOOLDIR"/dist
> -+      echo
> -
> --if [ "$GOHOSTARCH" !=3D "$GOARCH" -o "$GOHOSTOS" !=3D "$GOOS" ]; then
> -       echo "##### Building packages and commands for host, $GOHOSTOS/$G=
OHOSTARCH."
> -       # CC_FOR_TARGET is recorded as the default compiler for the go to=
ol. When building for the host, however,
> -       # use the host compiler, CC, from `cmd/dist/dist env` instead.
> -@@ -171,24 +180,20 @@ if [ "$GOHOSTARCH" !=3D "$GOARCH" -o "$GOHOSTOS" !=
=3D "$GOOS" ]; then
> -       echo
> - fi
> -
> --echo "##### Building packages and commands for $GOOS/$GOARCH."
> --
> --old_bin_files=3D$(cd $GOROOT/bin && echo *)
> --
> --CC=3D"$CC_FOR_TARGET" "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcfl=
ags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
> --
> --# Check that there are no new files in $GOROOT/bin other than go and go=
fmt
> --# and $GOOS_$GOARCH (a directory used when cross-compiling).
> --(cd $GOROOT/bin && for f in *; do
> --      if ! expr " $old_bin_files go gofmt ${GOOS}_${GOARCH} " : ".* $f =
" >/dev/null 2>/dev/null; then
> --              echo 1>&2 "ERROR: unexpected new file in $GOROOT/bin: $f"
> --              exit 1
> --      fi
> --done)
> --
> --echo
> --
> --rm -f "$GOTOOLDIR"/go_bootstrap
> -+if [ "$do_target_build" =3D "yes" ]; then
> -+    GO_INSTALL=3D"${GO_TARGET_INSTALL:-std cmd}"
> -+    echo "##### Building packages and commands for $GOOS/$GOARCH."
> -+    if [ "$GOHOSTOS" =3D "$GOOS" -a "$GOHOSTARCH" =3D "$GOARCH" -a "$do=
_host_build" =3D "yes" ]; then
> -+      rm -rf ./host-tools
> -+      mkdir ./host-tools
> -+      mv "$GOTOOLDIR"/* ./host-tools
> -+      GOTOOLDIR=3D"$PWD/host-tools"
> -+    fi
> -+    GOTOOLDIR=3D"$GOTOOLDIR" CC=3D"$CC_FOR_TARGET" "$GOTOOLDIR"/go_boot=
strap install $GO_FLAGS -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v ${=
GO_INSTALL}
> -+    echo
> -+
> -+    rm -f "$GOTOOLDIR"/go_bootstrap
> -+fi
> -
> - if [ "$1" !=3D "--no-banner" ]; then
> -       "$GOTOOLDIR"/dist banner
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-devtools/go/go-1.9/0004-cmd-go-allow-GOTOOLDIR-=
to-be-overridden-in-the-envir.patch b/meta/recipes-devtools/go/go-1.9/0004-=
cmd-go-allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
> deleted file mode 100644
> index 180b06a4d3..0000000000
> --- a/meta/recipes-devtools/go/go-1.9/0004-cmd-go-allow-GOTOOLDIR-to-be-o=
verridden-in-the-envir.patch
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
> -diff --git a/src/cmd/go/internal/cfg/cfg.go b/src/cmd/go/internal/cfg/cf=
g.go
> -index b3ad1ce..c1dc974 100644
> ---- a/src/cmd/go/internal/cfg/cfg.go
> -+++ b/src/cmd/go/internal/cfg/cfg.go
> -@@ -91,7 +91,12 @@ func init() {
> -       // as the tool directory does not move based on environment varia=
bles.
> -       // This matches the initialization of ToolDir in go/build,
> -       // except for using GOROOT rather than runtime.GOROOT().
> --      build.ToolDir =3D filepath.Join(GOROOT, "pkg/tool/"+runtime.GOOS+=
"_"+runtime.GOARCH)
> -+      s :=3D os.Getenv("GOTOOLDIR")
> -+      if s =3D=3D "" {
> -+              build.ToolDir =3D filepath.Join(GOROOT, "pkg/tool/"+runti=
me.GOOS+"_"+runtime.GOARCH)
> -+      } else {
> -+              build.ToolDir =3D s
> -+      }
> - }
> -
> - func findGOROOT() string {
> -diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/wor=
k/build.go
> -index 85df0b3..7b9a69e 100644
> ---- a/src/cmd/go/internal/work/build.go
> -+++ b/src/cmd/go/internal/work/build.go
> -@@ -1337,7 +1337,7 @@ func (b *Builder) build(a *Action) (err error) {
> -               }
> -
> -               var cgoExe string
> --              if a.cgo !=3D nil && a.cgo.Target !=3D "" {
> -+              if a.cgo !=3D nil && a.cgo.Target !=3D "" && os.Getenv("G=
OTOOLDIR") =3D=3D "" {
> -                       cgoExe =3D a.cgo.Target
> -               } else {
> -                       cgoExe =3D base.Tool("cgo")
> -diff --git a/src/go/build/build.go b/src/go/build/build.go
> -index fd89871..e16145b 100644
> ---- a/src/go/build/build.go
> -+++ b/src/go/build/build.go
> -@@ -1588,7 +1588,7 @@ func init() {
> - }
> -
> - // ToolDir is the directory containing build tools.
> --var ToolDir =3D filepath.Join(runtime.GOROOT(), "pkg/tool/"+runtime.GOO=
S+"_"+runtime.GOARCH)
> -+var ToolDir =3D envOr("GOTOOLDIR", filepath.Join(runtime.GOROOT(), "pkg=
/tool/"+runtime.GOOS+"_"+runtime.GOARCH))
> -
> - // IsLocalImport reports whether the import path is
> - // a local import path, like ".", "..", "./foo", or "../foo".
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-devtools/go/go-1.9/0005-cmd-go-make-GOROOT-prec=
ious-by-default.patch b/meta/recipes-devtools/go/go-1.9/0005-cmd-go-make-GO=
ROOT-precious-by-default.patch
> deleted file mode 100644
> index 6e93bcb6ce..0000000000
> --- a/meta/recipes-devtools/go/go-1.9/0005-cmd-go-make-GOROOT-precious-by=
-default.patch
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
> -diff --git a/src/cmd/go/internal/load/pkg.go b/src/cmd/go/internal/load/=
pkg.go
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
> -+      if p.Goroot && os.Getenv("GOROOT_OVERRIDE") !=3D "1" {
> -+              return false, "GOROOT-resident packages do not get rebuil=
t"
> -+      }
> -+
> -       // Package is stale if a dependency is.
> -       for _, p1 :=3D range p.Internal.Deps {
> -               if p1.Stale {
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-devtools/go/go-1.9/0006-make.bash-add-GOTOOLDIR=
_BOOTSTRAP-environment-variab.patch b/meta/recipes-devtools/go/go-1.9/0006-=
make.bash-add-GOTOOLDIR_BOOTSTRAP-environment-variab.patch
> deleted file mode 100644
> index f0f564044b..0000000000
> --- a/meta/recipes-devtools/go/go-1.9/0006-make.bash-add-GOTOOLDIR_BOOTST=
RAP-environment-variab.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From aae74d1045ca03306ba4159206ee3bac72bcdfbb Mon Sep 17 00:00:00 2001
> -From: Matt Madison <matt@madison.systems>
> -Date: Wed, 13 Sep 2017 08:23:23 -0700
> -Subject: [PATCH 6/7] make.bash: add GOTOOLDIR_BOOTSTRAP environment vari=
able
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
> -@@ -172,10 +172,11 @@ if [ "$do_host_build" =3D "yes" ]; then
> -       mv cmd/dist/dist "$GOTOOLDIR"/dist
> -       echo
> -
> -+      GOTOOLDIR_BOOTSTRAP=3D"${GOTOOLDIR_BOOTSTRAP:-$GOTOOLDIR}"
> -       echo "##### Building packages and commands for host, $GOHOSTOS/$G=
OHOSTARCH."
> -       # CC_FOR_TARGET is recorded as the default compiler for the go to=
ol. When building for the host, however,
> -       # use the host compiler, CC, from `cmd/dist/dist env` instead.
> --      CC=3D$CC GOOS=3D$GOHOSTOS GOARCH=3D$GOHOSTARCH \
> -+      CC=3D$CC GOOS=3D$GOHOSTOS GOARCH=3D$GOHOSTARCH GOTOOLDIR=3D"$GOTO=
OLDIR_BOOTSTRAP" \
> -               "$GOTOOLDIR"/go_bootstrap install -gcflags "$GO_GCFLAGS" =
-ldflags "$GO_LDFLAGS" -v std cmd
> -       echo
> - fi
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-devtools/go/go-1.9/0007-ld-add-soname-to-sharea=
ble-objects.patch b/meta/recipes-devtools/go/go-1.9/0007-ld-add-soname-to-s=
hareable-objects.patch
> deleted file mode 100644
> index 6459782d81..0000000000
> --- a/meta/recipes-devtools/go/go-1.9/0007-ld-add-soname-to-shareable-obj=
ects.patch
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
> -diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/ld/=
lib.go
> -index 0234105..0b9e2d0 100644
> ---- a/src/cmd/link/internal/ld/lib.go
> -+++ b/src/cmd/link/internal/ld/lib.go
> -@@ -1124,12 +1124,14 @@ func (l *Link) hostlink() {
> -                       // Pass -z nodelete to mark the shared library as
> -                       // non-closeable: a dlclose will do nothing.
> -                       argv =3D append(argv, "-shared", "-Wl,-z,nodelete=
")
> -+                      argv =3D append(argv, fmt.Sprintf("-Wl,-soname,%s=
", filepath.Base(*flagOutfile)))
> -               }
> -       case BuildmodeShared:
> -               if UseRelro() {
> -                       argv =3D append(argv, "-Wl,-z,relro")
> -               }
> -               argv =3D append(argv, "-shared")
> -+              argv =3D append(argv, fmt.Sprintf("-Wl,-soname,%s", filep=
ath.Base(*flagOutfile)))
> -       case BuildmodePlugin:
> -               if Headtype =3D=3D objabi.Hdarwin {
> -                       argv =3D append(argv, "-dynamiclib")
> -@@ -1138,6 +1140,7 @@ func (l *Link) hostlink() {
> -                               argv =3D append(argv, "-Wl,-z,relro")
> -                       }
> -                       argv =3D append(argv, "-shared")
> -+                      argv =3D append(argv, fmt.Sprintf("-Wl,-soname,%s=
", filepath.Base(*flagOutfile)))
> -               }
> -       }
> -
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-devtools/go/go-1.9/0008-make.bash-add-GOHOSTxx-=
indirection-for-cross-canadia.patch b/meta/recipes-devtools/go/go-1.9/0008-=
make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch
> deleted file mode 100644
> index 0977c78350..0000000000
> --- a/meta/recipes-devtools/go/go-1.9/0008-make.bash-add-GOHOSTxx-indirec=
tion-for-cross-canadia.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 03e6c339d4fb712fbb8c4ca6ef2fc7100dcdb3d7 Mon Sep 17 00:00:00 2001
> -From: Matt Madison <matt@madison.systems>
> -Date: Thu, 14 Sep 2017 05:38:10 -0700
> -Subject: [PATCH 8/8] make.bash: add GOHOSTxx indirection for cross-canad=
ian
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
> -@@ -173,6 +173,8 @@ if [ "$do_host_build" =3D "yes" ]; then
> -       echo
> -
> -       GOTOOLDIR_BOOTSTRAP=3D"${GOTOOLDIR_BOOTSTRAP:-$GOTOOLDIR}"
> -+      GOHOSTOS=3D"${GOHOSTOS_CROSS:-$GOHOSTOS}"
> -+      GOHOSTARCH=3D"${GOHOSTARCH_CROSS:-$GOHOSTARCH}"
> -       echo "##### Building packages and commands for host, $GOHOSTOS/$G=
OHOSTARCH."
> -       # CC_FOR_TARGET is recorded as the default compiler for the go to=
ol. When building for the host, however,
> -       # use the host compiler, CC, from `cmd/dist/dist env` instead.
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-devtools/go/go-1.9/0009-cmd-go-buildmode-pie-fo=
rces-external-linking-mode-on.patch b/meta/recipes-devtools/go/go-1.9/0009-=
cmd-go-buildmode-pie-forces-external-linking-mode-on.patch
> deleted file mode 100644
> index aa5fcfdd23..0000000000
> --- a/meta/recipes-devtools/go/go-1.9/0009-cmd-go-buildmode-pie-forces-ex=
ternal-linking-mode-on.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From aae44527c8065d54f6acaf87c82cba1ac96fae59 Mon Sep 17 00:00:00 2001
> -From: Ian Lance Taylor <iant@golang.org>
> -Date: Fri, 18 Aug 2017 17:46:03 -0700
> -Subject: [PATCH] cmd/go: -buildmode=3Dpie forces external linking mode o=
n all
> - systems
> -
> -The go tool assumed that -buildmode=3Dpie implied internal linking on
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
> -diff --git a/src/cmd/go/internal/load/pkg.go b/src/cmd/go/internal/load/=
pkg.go
> -index 2660d3f..d40773b 100644
> ---- a/src/cmd/go/internal/load/pkg.go
> -+++ b/src/cmd/go/internal/load/pkg.go
> -@@ -954,11 +954,12 @@ func (p *Package) load(stk *ImportStack, bp *build=
.Package, err error) *Package
> -
> -       if cfg.BuildContext.CgoEnabled && p.Name =3D=3D "main" && !p.Goro=
ot {
> -               // Currently build modes c-shared, pie (on systems that d=
o not
> --              // support PIE with internal linking mode), plugin, and
> --              // -linkshared force external linking mode, as of course =
does
> -+              // support PIE with internal linking mode (currently all
> -+              // systems: issue #18968)), plugin, and -linkshared force
> -+              // external linking mode, as of course does
> -               // -ldflags=3D-linkmode=3Dexternal. External linking mode=
 forces
> -               // an import of runtime/cgo.
> --              pieCgo :=3D cfg.BuildBuildmode =3D=3D "pie" && (cfg.Build=
Context.GOOS !=3D "linux" || cfg.BuildContext.GOARCH !=3D "amd64")
> -+              pieCgo :=3D cfg.BuildBuildmode =3D=3D "pie"
> -               linkmodeExternal :=3D false
> -               for i, a :=3D range cfg.BuildLdflags {
> -                       if a =3D=3D "-linkmode=3Dexternal" {
> ---
> -2.14.1
> -
> diff --git a/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-w=
hen-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go-1.9/0010-=
make.bash-override-CC-when-building-dist-and-go_boot.patch
> deleted file mode 100644
> index 83fd78c3d7..0000000000
> --- a/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-bui=
lding-dist-and-go_boot.patch
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
> -@@ -131,7 +131,7 @@ if [ "$GOROOT_BOOTSTRAP" =3D "$GOROOT" ]; then
> -       exit 1
> - fi
> - rm -f cmd/dist/dist
> --GOROOT=3D"$GOROOT_BOOTSTRAP" GOOS=3D"" GOARCH=3D"" "$GOROOT_BOOTSTRAP/b=
in/go" build -o cmd/dist/dist ./cmd/dist
> -+CC=3D${BUILD_CC:-${CC}} GOROOT=3D"$GOROOT_BOOTSTRAP" GOOS=3D"" GOARCH=
=3D"" "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
> -
> - # -e doesn't propagate out of eval, so check success by hand.
> - eval $(./cmd/dist/dist env -p || echo FAIL=3Dtrue)
> -@@ -167,7 +167,7 @@ elif [ "$1" =3D "--host-only" ]; then
> - fi
> -
> - if [ "$do_host_build" =3D "yes" ]; then
> --      ./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds go_=
bootstrap
> -+      CC=3D${BUILD_CC:-${CC}} ./cmd/dist/dist bootstrap $buildall $GO_D=
ISTFLAGS -v # builds go_bootstrap
> -       # Delay move of dist tool to now, because bootstrap may clear too=
l directory.
> -       mv cmd/dist/dist "$GOTOOLDIR"/dist
> -       echo
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-devtools/go/go-1.9/set-external-linker.patch b/=
meta/recipes-devtools/go/go-1.9/set-external-linker.patch
> deleted file mode 100644
> index d6bd7fa39c..0000000000
> --- a/meta/recipes-devtools/go/go-1.9/set-external-linker.patch
> +++ /dev/null
> @@ -1,111 +0,0 @@
> -Change the dynamic linker hardcoding to use musl when not using glibc
> -this should be applied conditional to musl being the system C library
> -
> -Upstream-Status: Inappropriate [Real Fix should be portable across libcs=
]
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Index: go/src/cmd/link/internal/amd64/obj.go
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- go.orig/src/cmd/link/internal/amd64/obj.go
> -+++ go/src/cmd/link/internal/amd64/obj.go
> -@@ -67,7 +67,7 @@ func Init() {
> -       ld.Thearch.Append64 =3D ld.Append64l
> -       ld.Thearch.TLSIEtoLE =3D tlsIEtoLE
> -
> --      ld.Thearch.Linuxdynld =3D "/lib64/ld-linux-x86-64.so.2"
> -+      ld.Thearch.Linuxdynld =3D "/lib/ld-musl-x86_64.so.1"
> -       ld.Thearch.Freebsddynld =3D "/libexec/ld-elf.so.1"
> -       ld.Thearch.Openbsddynld =3D "/usr/libexec/ld.so"
> -       ld.Thearch.Netbsddynld =3D "/libexec/ld.elf_so"
> -Index: go/src/cmd/link/internal/arm/obj.go
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- go.orig/src/cmd/link/internal/arm/obj.go
> -+++ go/src/cmd/link/internal/arm/obj.go
> -@@ -63,7 +63,7 @@ func Init() {
> -       ld.Thearch.Append32 =3D ld.Append32l
> -       ld.Thearch.Append64 =3D ld.Append64l
> -
> --      ld.Thearch.Linuxdynld =3D "/lib/ld-linux.so.3" // 2 for OABI, 3 f=
or EABI
> -+      ld.Thearch.Linuxdynld =3D "/lib/ld-musl-armhf.so.1"
> -       ld.Thearch.Freebsddynld =3D "/usr/libexec/ld-elf.so.1"
> -       ld.Thearch.Openbsddynld =3D "/usr/libexec/ld.so"
> -       ld.Thearch.Netbsddynld =3D "/libexec/ld.elf_so"
> -Index: go/src/cmd/link/internal/arm64/obj.go
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- go.orig/src/cmd/link/internal/arm64/obj.go
> -+++ go/src/cmd/link/internal/arm64/obj.go
> -@@ -62,7 +62,7 @@ func Init() {
> -       ld.Thearch.Append32 =3D ld.Append32l
> -       ld.Thearch.Append64 =3D ld.Append64l
> -
> --      ld.Thearch.Linuxdynld =3D "/lib/ld-linux-aarch64.so.1"
> -+      ld.Thearch.Linuxdynld =3D "/lib/ld-musl-aarch64.so.1"
> -
> -       ld.Thearch.Freebsddynld =3D "XXX"
> -       ld.Thearch.Openbsddynld =3D "XXX"
> -Index: go/src/cmd/link/internal/mips/obj.go
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- go.orig/src/cmd/link/internal/mips/obj.go
> -+++ go/src/cmd/link/internal/mips/obj.go
> -@@ -77,7 +77,7 @@ func Init() {
> -               ld.Thearch.Append64 =3D ld.Append64b
> -       }
> -
> --      ld.Thearch.Linuxdynld =3D "/lib/ld.so.1"
> -+      ld.Thearch.Linuxdynld =3D "/lib/ld-musl-mipsle.so.1"
> -
> -       ld.Thearch.Freebsddynld =3D "XXX"
> -       ld.Thearch.Openbsddynld =3D "XXX"
> -Index: go/src/cmd/link/internal/mips64/obj.go
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- go.orig/src/cmd/link/internal/mips64/obj.go
> -+++ go/src/cmd/link/internal/mips64/obj.go
> -@@ -75,7 +75,7 @@ func Init() {
> -               ld.Thearch.Append64 =3D ld.Append64b
> -       }
> -
> --      ld.Thearch.Linuxdynld =3D "/lib64/ld64.so.1"
> -+      ld.Thearch.Linuxdynld =3D "/lib64/ld-musl-mips64le.so.1"
> -
> -       ld.Thearch.Freebsddynld =3D "XXX"
> -       ld.Thearch.Openbsddynld =3D "XXX"
> -Index: go/src/cmd/link/internal/ppc64/obj.go
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- go.orig/src/cmd/link/internal/ppc64/obj.go
> -+++ go/src/cmd/link/internal/ppc64/obj.go
> -@@ -77,7 +77,7 @@ func Init() {
> -       }
> -
> -       // TODO(austin): ABI v1 uses /usr/lib/ld.so.1
> --      ld.Thearch.Linuxdynld =3D "/lib64/ld64.so.1"
> -+      ld.Thearch.Linuxdynld =3D "/lib/ld-musl-powerpc64le.so.1"
> -
> -       ld.Thearch.Freebsddynld =3D "XXX"
> -       ld.Thearch.Openbsddynld =3D "XXX"
> -Index: go/src/cmd/link/internal/s390x/obj.go
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- go.orig/src/cmd/link/internal/s390x/obj.go
> -+++ go/src/cmd/link/internal/s390x/obj.go
> -@@ -62,7 +62,7 @@ func Init() {
> -       ld.Thearch.Append32 =3D ld.Append32b
> -       ld.Thearch.Append64 =3D ld.Append64b
> -
> --      ld.Thearch.Linuxdynld =3D "/lib64/ld64.so.1"
> -+      ld.Thearch.Linuxdynld =3D "/lib/ld-musl-s390x.so.1"
> -
> -       // not relevant for s390x
> -       ld.Thearch.Freebsddynld =3D "XXX"
> -Index: go/src/cmd/link/internal/x86/obj.go
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- go.orig/src/cmd/link/internal/x86/obj.go
> -+++ go/src/cmd/link/internal/x86/obj.go
> -@@ -63,7 +63,7 @@ func Init() {
> -       ld.Thearch.Append32 =3D ld.Append32l
> -       ld.Thearch.Append64 =3D ld.Append64l
> -
> --      ld.Thearch.Linuxdynld =3D "/lib/ld-linux.so.2"
> -+      ld.Thearch.Linuxdynld =3D "/lib/ld-musl-i386.so.1"
> -       ld.Thearch.Freebsddynld =3D "/usr/libexec/ld-elf.so.1"
> -       ld.Thearch.Openbsddynld =3D "/usr/libexec/ld.so"
> -       ld.Thearch.Netbsddynld =3D "/usr/libexec/ld.elf_so"
> diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtoo=
ls/go/go-common.inc
> index 37138b51ed..611775b2cc 100644
> --- a/meta/recipes-devtools/go/go-common.inc
> +++ b/meta/recipes-devtools/go/go-common.inc
> @@ -22,6 +22,8 @@ UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)\.src\.t=
ar"
>  INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
>  SSTATE_SCAN_CMD =3D "true"
>
> +export GOROOT_OVERRIDE =3D "1"
> +
>  do_compile_prepend() {
>         BUILD_CC=3D${BUILD_CC}
>  }
> diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc b/meta/recipe=
s-devtools/go/go-cross-canadian.inc
> index 8afda6b2ce..c84aa4c9eb 100644
> --- a/meta/recipes-devtools/go/go-cross-canadian.inc
> +++ b/meta/recipes-devtools/go/go-cross-canadian.inc
> @@ -7,34 +7,34 @@ PN =3D "go-cross-canadian-${TRANSLATED_TARGET_ARCH}"
>
>  export GOHOSTOS =3D "${BUILD_GOOS}"
>  export GOHOSTARCH =3D "${BUILD_GOARCH}"
> -export GOHOSTOS_CROSS =3D "${HOST_GOOS}"
> -export GOHOSTARCH_CROSS =3D "${HOST_GOARCH}"
>  export GOROOT_BOOTSTRAP =3D "${STAGING_LIBDIR_NATIVE}/go"
>  export GOTOOLDIR_BOOTSTRAP =3D "${STAGING_LIBDIR_NATIVE}/${HOST_SYS}/go/=
pkg/tool/${BUILD_GOTUPLE}"
>  export GOROOT_FINAL =3D "${libdir}/go"
>  export CGO_ENABLED =3D "1"
> -export CC_FOR_TARGET =3D "${TARGET_PREFIX}gcc"
> -export CXX_FOR_TARGET =3D "${TARGET_PREFIX}g++"
> -CC =3D "${HOST_PREFIX}gcc"
> -export CGO_CFLAGS =3D "--sysroot=3D${STAGING_DIR_TARGET} ${HOST_CC_ARCH}=
 ${CFLAGS}"
> -export CGO_LDFLAGS =3D "--sysroot=3D${STAGING_DIR_TARGET} ${HOST_CC_ARCH=
} ${LDFLAGS}"
> -export GO_LDFLAGS =3D '-linkmode external -extld ${HOST_PREFIX}gcc -extl=
dflags "--sysroot=3D${STAGING_DIR_TARGET} ${HOST_CC_ARCH} ${LDFLAGS}"'
> +export GOCACHE =3D "off"
> +export GOTMPDIR ?=3D "${WORKDIR}/go-tmp"
> +GOTMPDIR[vardepvalue] =3D ""
> +#CC =3D "${HOST_PREFIX}gcc"
> +export CGO_CFLAGS =3D "${CFLAGS}"
> +export CGO_LDFLAGS =3D "${LDFLAGS}"
> +export GO_LDFLAGS =3D '-v -linkmode external -extld ${HOST_PREFIX}gcc -e=
xtldflags "--sysroot=3D${STAGING_DIR_HOST} ${HOST_CC_ARCH} ${LDFLAGS}"'
>
>  do_configure[noexec] =3D "1"
>
>  do_compile() {
> -       export GOBIN=3D"${B}/bin"
> -       rm -rf ${GOBIN} ${B}/pkg
> -       mkdir ${GOBIN}
> +       export CC_FOR_${HOST_GOOS}_${HOST_GOARCH}=3D"${HOST_PREFIX}gcc --=
sysroot=3D${STAGING_DIR_HOST}${SDKPATHNATIVE}"
> +       export CXX_FOR_${HOST_GOOS}_${HOST_GOARCH}=3D"${HOST_PREFIX}gxx -=
-sysroot=3D${STAGING_DIR_HOST}${SDKPATHNATIVE}"
>         cd src
>         ./make.bash --host-only --no-banner
>         cd ${B}
>  }
> +do_compile[dirs] =3D+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
> +do_compile[cleandirs] +=3D "${GOTMPDIR} ${B}/bin ${B}/pkg"
>
>
>  make_wrapper() {
> -    rm -f ${D}${bindir}/$2
> -    cat <<END >${D}${bindir}/$2
> +       rm -f ${D}${bindir}/$2
> +       cat <<END >${D}${bindir}/$2
>  #!/bin/sh
>  here=3D\`dirname \$0\`
>  native_goroot=3D\`readlink -f \$here/../../lib/${TARGET_SYS}/go\`
> @@ -46,7 +46,7 @@ export GOTOOLDIR=3D"\$native_goroot/pkg/tool/${HOST_GOT=
UPLE}"
>  test -n "\$GOROOT" || export GOROOT=3D"\$OECORE_TARGET_SYSROOT/${target_=
libdir}/go"
>  \$here/../../lib/${TARGET_SYS}/go/bin/$1 "\$@"
>  END
> -    chmod +x ${D}${bindir}/$2
> +       chmod +x ${D}${bindir}/$2
>  }
>
>  do_install() {
> diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.9.bb b/meta/rec=
ipes-devtools/go/go-cross-canadian_1.10.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-cross-canadian_1.9.bb
> rename to meta/recipes-devtools/go/go-cross-canadian_1.10.bb
> diff --git a/meta/recipes-devtools/go/go-cross.inc b/meta/recipes-devtool=
s/go/go-cross.inc
> index 3ac7211bc3..fe92651581 100644
> --- a/meta/recipes-devtools/go/go-cross.inc
> +++ b/meta/recipes-devtools/go/go-cross.inc
> @@ -1,7 +1,7 @@
>  inherit cross
>
>  PROVIDES =3D "virtual/${TARGET_PREFIX}go"
> -DEPENDS +=3D "go-native"
> +DEPENDS =3D "go-native"
>
>  PN =3D "go-cross-${TARGET_ARCH}"
>
> @@ -13,26 +13,27 @@ export GOARM =3D "${TARGET_GOARM}"
>  export GO386 =3D "${TARGET_GO386}"
>  export GOROOT_BOOTSTRAP =3D "${STAGING_LIBDIR_NATIVE}/go"
>  export GOROOT_FINAL =3D "${libdir}/go"
> +export GOCACHE =3D "off"
> +export GOTMPDIR ?=3D "${WORKDIR}/go-tmp"
> +GOTMPDIR[vardepvalue] =3D ""
>  export CGO_ENABLED =3D "1"
> -export CC_FOR_TARGET=3D"${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=
=3D${STAGING_DIR_TARGET}"
> -export CXX_FOR_TARGET=3D"${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=
=3D${STAGING_DIR_TARGET}"
>  CC =3D "${@d.getVar('BUILD_CC').strip()}"
>
>  do_configure[noexec] =3D "1"
>
>  do_compile() {
> -    export GOBIN=3D"${B}/bin"
> -    rm -rf ${GOBIN} ${B}/pkg
> -    mkdir ${GOBIN}
> -    cd src
> -    ./make.bash --host-only
> -    cd ${B}
> +       export CC_FOR_${GOOS}_${GOARCH}=3D"${TARGET_PREFIX}gcc ${TARGET_C=
C_ARCH} --sysroot=3D${STAGING_DIR_TARGET}"
> +       export CXX_FOR_${GOOS}_${GOARCh}=3D"${TARGET_PREFIX}g++ ${TARGET_=
CC_ARCH} --sysroot=3D${STAGING_DIR_TARGET}"
> +       cd src
> +       ./make.bash --host-only --no-banner
> +       cd ${B}
>  }
> -
> +do_compile[dirs] =3D+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
> +do_compile[cleandirs] +=3D "${GOTMPDIR} ${B}/bin ${B}/pkg"
>
>  make_wrapper() {
> -    rm -f ${D}${bindir}/$2
> -    cat <<END >${D}${bindir}/$2
> +       rm -f ${D}${bindir}/$2
> +       cat <<END >${D}${bindir}/$2
>  #!/bin/bash
>  here=3D\`dirname \$0\`
>  export GOARCH=3D"${TARGET_GOARCH}"
> @@ -41,22 +42,22 @@ export GOARM=3D"\${GOARM:-${TARGET_GOARM}}"
>  export GO386=3D"\${GO386:-${TARGET_GO386}}"
>  \$here/../../lib/${CROSS_TARGET_SYS_DIR}/go/bin/$1 "\$@"
>  END
> -    chmod +x ${D}${bindir}/$2
> +       chmod +x ${D}${bindir}/$2
>  }
>
>  do_install() {
> -    install -d ${D}${libdir}/go
> -    cp --preserve=3Dmode,timestamps -R ${B}/pkg ${D}${libdir}/go/
> -    install -d ${D}${libdir}/go/src
> -    (cd ${S}/src; for d in *; do \
> -        [ ! -d $d ] || cp --preserve=3Dmode,timestamps -R ${S}/src/$d ${=
D}${libdir}/go/src/; \
> -    done)
> -    rm -rf ${D}${libdir}/go/src/runtime/pprof/testdata
> -    install -d ${D}${bindir} ${D}${libdir}/go/bin
> -    for f in ${B}/bin/*
> -    do
> -        base=3D`basename $f`
> -        install -m755 $f ${D}${libdir}/go/bin
> -        make_wrapper $base ${TARGET_PREFIX}$base
> -    done
> +       install -d ${D}${libdir}/go
> +       cp --preserve=3Dmode,timestamps -R ${B}/pkg ${D}${libdir}/go/
> +       install -d ${D}${libdir}/go/src
> +       (cd ${S}/src; for d in *; do \
> +               [ ! -d $d ] || cp --preserve=3Dmode,timestamps -R ${S}/sr=
c/$d ${D}${libdir}/go/src/; \
> +       done)
> +       find ${D}${libdir}/go/src -depth -type d -name testdata -exec rm =
-rf {} \;
> +       install -d ${D}${bindir} ${D}${libdir}/go/bin
> +       for f in ${B}/bin/*
> +       do
> +               base=3D`basename $f`
> +               install -m755 $f ${D}${libdir}/go/bin
> +               make_wrapper $base ${TARGET_PREFIX}$base
> +       done
>  }
> diff --git a/meta/recipes-devtools/go/go-cross_1.9.bb b/meta/recipes-devt=
ools/go/go-cross_1.10.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-cross_1.9.bb
> rename to meta/recipes-devtools/go/go-cross_1.10.bb
> diff --git a/meta/recipes-devtools/go/go-crosssdk.inc b/meta/recipes-devt=
ools/go/go-crosssdk.inc
> index f67e4b92a0..05ca62eba8 100644
> --- a/meta/recipes-devtools/go/go-crosssdk.inc
> +++ b/meta/recipes-devtools/go/go-crosssdk.inc
> @@ -11,21 +11,21 @@ export GOARCH =3D "${TARGET_GOARCH}"
>  export GOROOT_BOOTSTRAP =3D "${STAGING_LIBDIR_NATIVE}/go"
>  export GOROOT_FINAL =3D "${libdir}/go"
>  export CGO_ENABLED =3D "1"
> -export CC_FOR_TARGET=3D"${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=
=3D${STAGING_DIR_TARGET}${SDKPATHNATIVE}"
> -export CXX_FOR_TARGET=3D"${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=
=3D${STAGING_DIR_TARGET}${SDKPATHNATIVE}"
> -export GO_INSTALL =3D "cmd"
> -CC =3D "${@d.getVar('BUILD_CC').strip()}"
> +export GOCACHE =3D "off"
> +export GOTMPDIR ?=3D "${WORKDIR}/go-tmp"
> +GOTMPDIR[vardepvalue] =3D ""
>
>  do_configure[noexec] =3D "1"
>
>  do_compile() {
> -       export GOBIN=3D"${B}/bin"
> -       rm -rf ${GOBIN} ${B}/pkg
> -       mkdir ${GOBIN}
> +       export CC_FOR_${TARGET_GOOS}_${TARGET_GOARCH}=3D"${TARGET_PREFIX}=
gcc ${TARGET_CC_ARCH} --sysroot=3D${STAGING_DIR_TARGET}${SDKPATHNATIVE}"
> +       export CXX_FOR_${TARGET_GOOS}_${TARGET_GOARCH}=3D"${TARGET_PREFIX=
}g++ ${TARGET_CC_ARCH} --sysroot=3D${STAGING_DIR_TARGET}${SDKPATHNATIVE}"
>         cd src
> -       ./make.bash --host-only
> +       ./make.bash --host-only --no-banner
>         cd ${B}
>  }
> +do_compile[dirs] =3D+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
> +do_compile[cleandirs] +=3D "${GOTMPDIR} ${B}/bin ${B}/pkg"
>
>  make_wrapper() {
>      rm -f ${D}${bindir}/$2
> diff --git a/meta/recipes-devtools/go/go-crosssdk_1.9.bb b/meta/recipes-d=
evtools/go/go-crosssdk_1.10.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-crosssdk_1.9.bb
> rename to meta/recipes-devtools/go/go-crosssdk_1.10.bb
> diff --git a/meta/recipes-devtools/go/go-native.inc b/meta/recipes-devtoo=
ls/go/go-native.inc
> index 95db1c2b7c..31e899da82 100644
> --- a/meta/recipes-devtools/go/go-native.inc
> +++ b/meta/recipes-devtools/go/go-native.inc
> @@ -4,34 +4,33 @@ nonstaging_libdir :=3D "${libdir}"
>
>  inherit native
>
> -SRC_URI_append =3D " http://golang.org/dl/go1.4.3.src.tar.gz;name=3Dboot=
strap;subdir=3Dgo1.4"
> -SRC_URI[bootstrap.md5sum] =3D "dfb604511115dd402a77a553a5923a04"
> -SRC_URI[bootstrap.sha256sum] =3D "9947fc705b0b841b5938c48b22dc33e9647ec0=
752bae66e50278df4f23f64959"
> +SRC_URI_append =3D " https://dl.google.com/go/go1.4-bootstrap-20171003.t=
ar.gz;name=3Dbootstrap;subdir=3Dgo1.4"
> +SRC_URI[bootstrap.md5sum] =3D "dbf727a4b0e365bf88d97cbfde590016"
> +SRC_URI[bootstrap.sha256sum] =3D "f4ff5b5eb3a3cae1c993723f3eab519c5bae18=
866b5e5f96fe1102f0cb5c3e52"
>
>  export GOOS =3D "${BUILD_GOOS}"
>  export GOARCH =3D "${BUILD_GOARCH}"
> +export GOTMPDIR ?=3D "${WORKDIR}/go-tmp"
> +GOTMPDIR[vardepvalue] =3D ""
>  CC =3D "${@d.getVar('BUILD_CC').strip()}"
>
>  export CGO_ENABLED =3D "1"
>
>  do_configure() {
> -    cd ${WORKDIR}/go1.4/go/src
> -    CGO_ENABLED=3D0 GOROOT=3D${WORKDIR}/go1.4/go ./make.bash
> +       cd ${WORKDIR}/go1.4/go/src
> +       CGO_ENABLED=3D0 GOROOT=3D${WORKDIR}/go1.4/go ./make.bash
>  }
>
>  do_compile() {
> -       export GOBIN=3D"${B}/bin"
>         export GOROOT_FINAL=3D"${nonstaging_libdir}/go"
>         export GOROOT_BOOTSTRAP=3D"${WORKDIR}/go1.4/go"
> -       rm -rf ${GOBIN}
> -       mkdir ${GOBIN}
> -
> -       export TMPDIR=3D${WORKDIR}/build-tmp
> -       mkdir -p ${WORKDIR}/build-tmp
>
>         cd src
> -       ./make.bash --host-only
> +       ./make.bash --no-banner
> +       cd ${B}
>  }
> +do_compile[dirs] =3D+ "${GOTMPDIR} ${B}/bin"
> +do_compile[cleandirs] +=3D "${GOTMPDIR} ${B}/bin"
>
>  make_wrapper() {
>         rm -f ${D}${bindir}/$2$3
> @@ -51,7 +50,7 @@ do_install() {
>         (cd ${S}/src; for d in *; do \
>                 [ -d $d ] && cp -a ${S}/src/$d ${D}${libdir}/go/src/; \
>         done)
> -       rm -rf ${D}${libdir}/go/src/runtime/pprof/testdata
> +       find ${D}${libdir}/go/src -depth -type d -name testdata -exec rm =
-rf {} \;
>         install -d ${D}${bindir} ${D}${libdir}/go/bin
>         for f in ${B}/bin/*
>         do
> diff --git a/meta/recipes-devtools/go/go-native_1.9.bb b/meta/recipes-dev=
tools/go/go-native_1.10.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-native_1.9.bb
> rename to meta/recipes-devtools/go/go-native_1.10.bb
> diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devto=
ols/go/go-runtime.inc
> index 29ae86e4ee..7a3b415b3f 100644
> --- a/meta/recipes-devtools/go/go-runtime.inc
> +++ b/meta/recipes-devtools/go/go-runtime.inc
> @@ -10,11 +10,18 @@ export GOARM =3D "${TARGET_GOARM}"
>  export GO386 =3D "${TARGET_GO386}"
>  export GOROOT_BOOTSTRAP =3D "${STAGING_LIBDIR_NATIVE}/go"
>  export GOROOT_FINAL =3D "${libdir}/go"
> -export GO_TARGET_INSTALL =3D "std"
>  export CGO_ENABLED =3D "1"
> -export CC_FOR_TARGET=3D"${CC}"
> -export CXX_FOR_TARGET=3D"${CXX}"
> -export GOROOT_OVERRIDE =3D "1"
> +export CGO_CFLAGS =3D "${CFLAGS}"
> +export CGO_CPPFLAGS =3D "${CPPFLAGS}"
> +export CGO_CXXFLAGS =3D "${CXXFLAGS}"
> +export CGO_LDFLAGS =3D "${LDFLAGS}"
> +export GOCACHE =3D "off"
> +export GOTMPDIR ?=3D "${WORKDIR}/go-tmp"
> +GOTMPDIR[vardepvalue] =3D ""
> +GO_EXTLDFLAGS ?=3D "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${LDFLAGS}"
> +GO_LINKMODE ?=3D ""
> +GO_LINKMODE_class-nativesdk =3D "--linkmode=3Dexternal"
> +GO_LDFLAGS ?=3D '-ldflags=3D"${GO_LINKMODE} -extldflags '${GO_EXTLDFLAGS=
}'"'
>
>  do_configure() {
>         :
> @@ -25,21 +32,20 @@ do_configure_libc-musl() {
>  }
>
>  do_compile() {
> -       export GOBIN=3D"${B}/bin"
> -       export CC=3D"${@d.getVar('BUILD_CC').strip()}"
> -       rm -rf ${GOBIN} ${B}/pkg
> -       mkdir ${GOBIN}
> +       export CC_FOR_${TARGET_GOOS}_${TARGET_GOARCH}=3D"${CC}"
> +       export CXX_FOR_${TARGET_GOOS}_${TARGET_GOARCH}=3D"${CXX}"
> +
>         cd src
> -       ./make.bash --host-only
> -       cp ${B}/pkg/tool/${BUILD_GOTUPLE}/go_bootstrap ${B}
> -       rm -rf ${B}/pkg/${TARGET_GOTUPLE}
> -       ./make.bash --target-only
> +       ./make.bash --target-only --no-banner std
>         if [ -n "${GO_DYNLINK}" ]; then
> -               cp ${B}/go_bootstrap ${B}/pkg/tool/${BUILD_GOTUPLE}
> -               GO_FLAGS=3D"-buildmode=3Dshared" GO_LDFLAGS=3D"-extldflag=
s \"${LDFLAGS}\"" ./make.bash --target-only
> +               export GOTOOLDIR=3D"${B}/pkg/tool/native_native"
> +               CC=3D"$CC_FOR_${TARGET_GOOS}_${TARGET_GOARCH}" GOARCH=3D"=
${TARGET_GOARCH}" GOOS=3D"${TARGET_GOOS}" GOROOT=3D${B} \
> +                       $GOTOOLDIR/go_bootstrap install -linkshared -buil=
dmode=3Dshared ${GO_LDFLAGS} std
>         fi
>         cd ${B}
>  }
> +do_compile[dirs] =3D+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
> +do_compile[cleandirs] +=3D "${GOTMPDIR} ${B}/bin ${B}/pkg"
>
>  do_install() {
>         install -d ${D}${libdir}/go/src
> @@ -54,20 +60,10 @@ do_install() {
>         find src -mindepth 1 -maxdepth 1 -type d | while read srcdir; do
>                 cp --preserve=3Dmode,timestamps -R $srcdir ${D}${libdir}/=
go/src/
>         done
> +       find ${D}${libdir}/go/src -depth -type d -name testdata -exec rm =
-rf {} \;
>         rm -f ${D}${libdir}/go/src/cmd/dist/dist
>  }
>
> -# Remove test binaries that cannot be relocated
> -do_install_append_class-nativesdk() {
> -       rm -rf ${D}${libdir}/go/src/runtime/pprof/testdata
> -}
> -
> -# These testdata directories aren't needed for builds and contain binari=
es
> -# that can cause errors in sysroot_strip(), so just remove them.
> -sysroot_stage_all_append() {
> -       find ${SYSROOT_DESTDIR}${libdir}/go/src -depth -type d -name 'tes=
tdata' -exec rm -rf {} \;
> -}
> -
>  ALLOW_EMPTY_${PN} =3D "1"
>  FILES_${PN} =3D "${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*${SOLIBSDEV=
}"
>  FILES_${PN}-dev =3D "${libdir}/go/src ${libdir}/go/pkg/include \
> @@ -78,8 +74,6 @@ FILES_${PN}-dev =3D "${libdir}/go/src ${libdir}/go/pkg/=
include \
>                     ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*.=
shlibname \
>                     ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*/=
*.shlibname \
>                     ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*/=
*/*.shlibname \
> -"
> -FILES_${PN}-staticdev =3D "${libdir}/go/pkg/${TARGET_GOTUPLE} \
>                     ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*.a \
>                     ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*.a \
>                     ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*.a \
> @@ -88,11 +82,15 @@ FILES_${PN}-staticdev =3D "${libdir}/go/pkg/${TARGET_=
GOTUPLE} \
>                     ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*/=
*.a \
>                     ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*/=
*/*.a \
>  "
> -# The testdata directories in the source tree include some binaries for =
various
> -# architectures, scripts, and .a files
> -INSANE_SKIP_${PN}-dev =3D "staticdev ldflags file-rdeps arch"
> +FILES_${PN}-staticdev =3D "${libdir}/go/pkg/${TARGET_GOTUPLE}"
> +
> +# Go sources include some scripts and pre-built binaries for
> +# multiple architectures.  The static .a files for dynamically-linked
> +# runtime are also required in -dev.
> +INSANE_SKIP_${PN}-dev =3D "staticdev file-rdeps arch"
>
>  INHIBIT_PACKAGE_STRIP =3D "1"
>  INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> +INHIBIT_SYSROOT_STRIP =3D "1"
>
>  BBCLASSEXTEND =3D "nativesdk"
> diff --git a/meta/recipes-devtools/go/go-runtime_1.9.bb b/meta/recipes-de=
vtools/go/go-runtime_1.10.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-runtime_1.9.bb
> rename to meta/recipes-devtools/go/go-runtime_1.10.bb
> diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/recipes-devtoo=
ls/go/go-target.inc
> index cac5d78227..a53a314c78 100644
> --- a/meta/recipes-devtools/go/go-target.inc
> +++ b/meta/recipes-devtools/go/go-target.inc
> @@ -11,10 +11,9 @@ export GO386 =3D "${TARGET_GO386}"
>  export GOROOT_BOOTSTRAP =3D "${STAGING_LIBDIR_NATIVE}/go"
>  export GOROOT_FINAL =3D "${libdir}/go"
>  export CGO_ENABLED =3D "1"
> -export CC_FOR_TARGET =3D "${CC}"
> -export CXX_FOR_TARGET =3D "${CXX}"
> -export GO_TARGET_INSTALL =3D "cmd"
> -export GO_FLAGS =3D "-a"
> +export GOCACHE =3D "off"
> +export GOTMPDIR ?=3D "${WORKDIR}/go-tmp"
> +GOTMPDIR[vardepvalue] =3D ""
>  GO_LDFLAGS =3D ""
>  GO_LDFLAGS_class-nativesdk =3D "-linkmode external"
>  export GO_LDFLAGS
> @@ -25,24 +24,22 @@ SECURITY_LDFLAGS =3D ""
>  do_configure[noexec] =3D "1"
>
>  do_compile() {
> -       export GOBIN=3D"${B}/bin"
> -       export CC=3D"${@d.getVar('BUILD_CC').strip()}"
> -       rm -rf ${GOBIN} ${B}/pkg
> -       mkdir ${GOBIN}
> -
> -       export TMPDIR=3D${WORKDIR}/build-tmp
> -       mkdir -p ${WORKDIR}/build-tmp
> +       export CC_FOR_${TARGET_GOOS}_${TARGET_GOARCH}=3D"${CC}"
> +       export CXX_FOR_${TARGET_GOOS}_${TARGET_GOARCH}=3D"${CXX}"
>
>         cd src
> -       ./make.bash
> +       ./make.bash --target-only --no-banner
>         cd ${B}
>  }
> +do_compile[dirs] =3D+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
> +do_compile[cleandirs] +=3D "${GOTMPDIR} ${B}/bin ${B}/pkg"
>
>  do_install() {
>         install -d ${D}${libdir}/go/pkg/tool
>         cp --preserve=3Dmode,timestamps -R ${B}/pkg/tool/${TARGET_GOTUPLE=
} ${D}${libdir}/go/pkg/tool/
>         install -d ${D}${libdir}/go/src
>         cp --preserve=3Dmode,timestamps -R ${S}/src/cmd ${D}${libdir}/go/=
src/
> +       find ${D}${libdir}/go/src -depth -type d -name testdata -exec rm =
-rf {} \;
>         install -d ${D}${libdir}/go/bin
>         install -d ${D}${bindir}
>         for f in ${B}/${GO_BUILD_BINDIR}/*; do
> diff --git a/meta/recipes-devtools/go/go_1.9.bb b/meta/recipes-devtools/g=
o/go_1.10.bb
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

