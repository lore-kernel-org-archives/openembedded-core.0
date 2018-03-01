Return-Path: <matt@madison.systems>
Received: from mail-pl0-f48.google.com (mail-pl0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id C7963785E7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 23:17:03 +0000 (UTC)
Received: by mail-pl0-f48.google.com with SMTP id s13-v6so4546050plq.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 15:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=i6HwJZdDhQIIc3QNn4zIRd/cY/87tfUd6uLQEE0GKns=;
	b=YqnBv1s/qeSEmmcH784BoFnvFvxhkmDhOL4QVAQz6fFLbXXL0rQTLpss6yYD9ahUxC
	9AAutM5KTuSLC7Pb+gjS/kFOEY0Y6Jau8YOm/updR+NYA8ZhvQ1/scrSNIwq7DcfnZCQ
	i/R/1vX58NPhWr+hXAMX28FuKo6bNU6Rria/tRvew9/j2uSfcpr9syeTeOM/6hj4f0GC
	dMqHgqkxwdniddOnXM1+onu6ZO3pLDSlewhmcwtR5iYn1SLg9Jlet0Tqxs60CsHC4h0W
	GBnrV93x54snDKWAoimi8UCxhZnkuHooeYriFYJSICuV0RlZlJaDywces43uKzfSQDH2
	2SVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=i6HwJZdDhQIIc3QNn4zIRd/cY/87tfUd6uLQEE0GKns=;
	b=trSpM30Lb21Qf10c22NbSgcWfx71sM9kiJGEw6iXrEOAFe58qJDo9uwd5kT2vQuxa+
	CfiIvFgxn0RSaQ2jb9Wyhc6ExOtzZb3Gt0gaKaiPxSDVX5Gh655ozIiaj68oIIw6zBx5
	JRpoUa8bxaB3rIGfJpVwfEreU2jGqC7mEXC91pCcV/MaxMlFrG5V4RJ+/yTbbc3XXpfs
	qNGkqUrWXv6IvZPh4Mlf6/oYYl2oixzp2edOxwWizSkJB07e2fg7D33i6Mn/ndorjZYI
	GsEeTwNS9O4BjsADFquVpp92WIVQe4733510mnoDP5zTFk0s2WLzGFrCvNfWWvsNorrv
	b71g==
X-Gm-Message-State: APf1xPBS1klhldFh8684r5lT6rerVdMzexgLgywAjRnicz57OCcnVLZ5
	bENjYEOAYY66R01SEXFJXPa5HT/C
X-Google-Smtp-Source: AG47ELvYOMUUJXVefXaXr39NDkrDbTLiV61OGNLXva6RcE4IaSwcgx+hVlrn+XpfXT0FKlARgmxgCQ==
X-Received: by 2002:a17:902:9881:: with SMTP id
	s1-v6mr3337799plp.286.1519946223038; 
	Thu, 01 Mar 2018 15:17:03 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	p128sm7853503pga.45.2018.03.01.15.17.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 15:17:01 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 15:16:42 -0800
Message-Id: <20180301231654.24018-2-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180301231654.24018-1-matt@madison.systems>
References: <20180301231654.24018-1-matt@madison.systems>
Subject: [PATCH v3 01/13] go: update go 1.9 -> go 1.10
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
X-List-Received-Date: Thu, 01 Mar 2018 23:17:03 -0000

* Patches and recipes reworked for go 1.10's significant
  changes to its bootstrap and build steps

* Update go1.4 source tarball used for go-native
  bootstrapping to the version recommended
  in the current go documentation

* Remove test data from installed sources to eliminate
  some packaging QA warnings

* Set GOCACHE to 'off' to disable 1.10's build caching
  in the go recipes and bbclass

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/go.bbclass                            |   2 +
 meta/recipes-devtools/go/go-1.10.inc               |  21 ++
 ...1-allow-CC-and-CXX-to-have-multiple-words.patch |  33 +++
 ...-content-based-hash-generation-less-pedan.patch | 220 ++++++++++++++++
 ...OLDIR-to-be-overridden-in-the-environment.patch |  64 +++++
 .../0004-ld-add-soname-to-shareable-objects.patch  |  47 ++++
 ...verride-CC-when-building-dist-and-go_boot.patch |  40 +++
 ...-cmd-dist-separate-host-and-target-builds.patch | 277 +++++++++++++++++++++
 ...07-cmd-go-make-GOROOT-precious-by-default.patch |  97 ++++++++
 ...ld-replace-glibc-dynamic-linker-with-musl.patch | 130 ++++++++++
 meta/recipes-devtools/go/go-1.9.inc                |  26 --
 .../0001-make.bash-quote-CC_FOR_TARGET.patch       |  32 ---
 ...CC-and-CXX-environment-variable-construct.patch |  67 -----
 ...sh-better-separate-host-and-target-builds.patch |  92 -------
 ...w-GOTOOLDIR-to-be-overridden-in-the-envir.patch |  68 -----
 ...05-cmd-go-make-GOROOT-precious-by-default.patch |  41 ---
 ...dd-GOTOOLDIR_BOOTSTRAP-environment-variab.patch |  36 ---
 .../0007-ld-add-soname-to-shareable-objects.patch  |  46 ----
 ...dd-GOHOSTxx-indirection-for-cross-canadia.patch |  33 ---
 ...dmode-pie-forces-external-linking-mode-on.patch |  47 ----
 ...verride-CC-when-building-dist-and-go_boot.patch |  43 ----
 .../go/go-1.9/set-external-linker.patch            | 111 ---------
 meta/recipes-devtools/go/go-common.inc             |   2 +
 meta/recipes-devtools/go/go-cross-canadian.inc     |  28 +--
 ...s-canadian_1.9.bb => go-cross-canadian_1.10.bb} |   0
 meta/recipes-devtools/go/go-cross.inc              |  55 ++--
 .../go/{go-cross_1.9.bb => go-cross_1.10.bb}       |   0
 meta/recipes-devtools/go/go-crosssdk.inc           |  16 +-
 .../go/{go-crosssdk_1.9.bb => go-crosssdk_1.10.bb} |   0
 meta/recipes-devtools/go/go-native.inc             |  25 +-
 .../go/{go-native_1.9.bb => go-native_1.10.bb}     |   0
 meta/recipes-devtools/go/go-runtime.inc            |  58 +++--
 .../go/{go-runtime_1.9.bb => go-runtime_1.10.bb}   |   0
 meta/recipes-devtools/go/go-target.inc             |  21 +-
 meta/recipes-devtools/go/{go_1.9.bb => go_1.10.bb} |   0
 35 files changed, 1032 insertions(+), 746 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.10.inc
 create mode 100644 meta/recipes-devtools/go/go-1.10/0001-allow-CC-and-CXX-to-have-multiple-words.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0004-ld-add-soname-to-shareable-objects.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0006-cmd-dist-separate-host-and-target-builds.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0007-cmd-go-make-GOROOT-precious-by-default.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0008-ld-replace-glibc-dynamic-linker-with-musl.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9.inc
 delete mode 100644 meta/recipes-devtools/go/go-1.9/0001-make.bash-quote-CC_FOR_TARGET.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9/0002-cmd-go-fix-CC-and-CXX-environment-variable-construct.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9/0003-make.bash-better-separate-host-and-target-builds.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9/0004-cmd-go-allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9/0005-cmd-go-make-GOROOT-precious-by-default.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9/0006-make.bash-add-GOTOOLDIR_BOOTSTRAP-environment-variab.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9/0007-ld-add-soname-to-shareable-objects.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9/0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9/0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9/set-external-linker.patch
 rename meta/recipes-devtools/go/{go-cross-canadian_1.9.bb => go-cross-canadian_1.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.9.bb => go-cross_1.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.9.bb => go-crosssdk_1.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.9.bb => go-native_1.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.9.bb => go-runtime_1.10.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.9.bb => go_1.10.bb} (100%)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 7ecd8c9254..43a262d599 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -24,6 +24,7 @@ GO_LINKMODE ?= ""
 GO_LINKMODE_class-nativesdk = "--linkmode=external"
 GO_LDFLAGS ?= '-ldflags="${GO_RPATH} ${GO_LINKMODE} -extldflags '${GO_EXTLDFLAGS}'"'
 export GOBUILDFLAGS ?= "-v ${GO_LDFLAGS}"
+export GOPATH_OMIT_IN_ACTIONID ?= "1"
 export GOPTESTBUILDFLAGS ?= "${GOBUILDFLAGS} -c"
 export GOPTESTFLAGS ?= "-test.v"
 GOBUILDFLAGS_prepend_task-compile = "${GO_PARALLEL_BUILD} "
@@ -47,6 +48,7 @@ GO_INSTALL_FILTEROUT ?= "${GO_IMPORT}/vendor/"
 
 B = "${WORKDIR}/build"
 export GOPATH = "${B}"
+export GOCACHE = "off"
 GO_TMPDIR ?= "${WORKDIR}/go-tmp"
 GO_TMPDIR[vardepvalue] = ""
 
diff --git a/meta/recipes-devtools/go/go-1.10.inc b/meta/recipes-devtools/go/go-1.10.inc
new file mode 100644
index 0000000000..3a93773e2a
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.10.inc
@@ -0,0 +1,21 @@
+require go-common.inc
+
+GO_BASEVERSION = "1.10"
+FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
+
+SRC_URI += "\
+    file://0001-allow-CC-and-CXX-to-have-multiple-words.patch \
+    file://0002-cmd-go-make-content-based-hash-generation-less-pedan.patch \
+    file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch \
+    file://0004-ld-add-soname-to-shareable-objects.patch \
+    file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch \
+    file://0006-cmd-dist-separate-host-and-target-builds.patch \
+    file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
+"
+
+SRC_URI_append_libc-musl = " file://0008-ld-replace-glibc-dynamic-linker-with-musl.patch"
+
+SRC_URI[main.md5sum] = "07cbb9d0091b846c6aea40bf5bc0cea7"
+SRC_URI[main.sha256sum] = "f3de49289405fda5fd1483a8fe6bd2fa5469e005fd567df64485c4fa000c7f24"
diff --git a/meta/recipes-devtools/go/go-1.10/0001-allow-CC-and-CXX-to-have-multiple-words.patch b/meta/recipes-devtools/go/go-1.10/0001-allow-CC-and-CXX-to-have-multiple-words.patch
new file mode 100644
index 0000000000..770a06ddd0
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.10/0001-allow-CC-and-CXX-to-have-multiple-words.patch
@@ -0,0 +1,33 @@
+From 7a7de46129fa6859fb6311096eb9f54c53c7fe2f Mon Sep 17 00:00:00 2001
+From: Matt Madison <matt@madison.systems>
+Date: Mon, 19 Feb 2018 08:49:33 -0800
+Subject: [PATCH 1/8] allow CC and CXX to have multiple words
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Matt Madison <matt@madison.systems>
+---
+ src/cmd/go/internal/envcmd/env.go | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
+index 603f7b5060..f891123f9c 100644
+--- a/src/cmd/go/internal/envcmd/env.go
++++ b/src/cmd/go/internal/envcmd/env.go
+@@ -82,11 +82,11 @@ func MkEnv() []cfg.EnvVar {
+ 
+ 	cc := cfg.DefaultCC(cfg.Goos, cfg.Goarch)
+ 	if env := strings.Fields(os.Getenv("CC")); len(env) > 0 {
+-		cc = env[0]
++		cc = strings.Join(env, " ")
+ 	}
+ 	cxx := cfg.DefaultCXX(cfg.Goos, cfg.Goarch)
+ 	if env := strings.Fields(os.Getenv("CXX")); len(env) > 0 {
+-		cxx = env[0]
++		cxx = strings.Join(env, " ")
+ 	}
+ 	env = append(env, cfg.EnvVar{Name: "CC", Value: cc})
+ 	env = append(env, cfg.EnvVar{Name: "CXX", Value: cxx})
+-- 
+2.14.1
+
diff --git a/meta/recipes-devtools/go/go-1.10/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go-1.10/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
new file mode 100644
index 0000000000..5fd471960e
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.10/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
@@ -0,0 +1,220 @@
+From 4ec2b27c091fbce0e8e2fd7e3ef2c76e068af32f Mon Sep 17 00:00:00 2001
+From: Matt Madison <matt@madison.systems>
+Date: Mon, 19 Feb 2018 08:50:59 -0800
+Subject: [PATCH 2/8] cmd/go: make content-based hash generation less pedantic
+
+Go 1.10's build tool now uses content-based hashes to
+determine when something should be built or re-built.
+This same mechanism is used to maintain a built-artifact
+cache for speeding up builds.
+
+However, the hashes it generates include information that
+doesn't work well with OE, nor with using a shared runtime
+library.
+
+First, it embeds path names to source files, unless
+building within GOROOT.  This prevents the building
+of a package in GOPATH for later staging into GOROOT.
+
+This patch adds support for the environment variable
+GOPATH_OMIT_IN_ACTIONID.  If present, path name
+embedding is disabled.
+
+Second, if cgo is enabled, the build ID for cgo-related
+packages will include the current value of the environment
+variables for invoking the compiler (CC, CXX, FC) and
+any CGO_xxFLAGS variables.  Only if the settings used
+during a compilation exactly match, character for character,
+the values used for compiling runtime/cgo or any other
+cgo-enabled package being imported, will the tool
+decide that the imported package is up-to-date.
+
+This is done to help ensure correctness, but is overly
+simplistic and effectively prevents the reuse of built
+artifacts that use cgo (or shared runtime, which includes
+runtime/cgo).
+
+This patch filters out all compiler flags except those
+beginning with '-m'.  The default behavior can be restored
+by setting the CGO_PEDANTIC environment variable.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Matt Madison <matt@madison.systems>
+---
+ src/cmd/go/internal/envcmd/env.go |  2 +-
+ src/cmd/go/internal/work/exec.go  | 63 ++++++++++++++++++++++++++++-----------
+ 2 files changed, 46 insertions(+), 19 deletions(-)
+
+diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
+index f891123f9c..ebacfbfdbc 100644
+--- a/src/cmd/go/internal/envcmd/env.go
++++ b/src/cmd/go/internal/envcmd/env.go
+@@ -113,7 +113,7 @@ func findEnv(env []cfg.EnvVar, name string) string {
+ func ExtraEnvVars() []cfg.EnvVar {
+ 	var b work.Builder
+ 	b.Init()
+-	cppflags, cflags, cxxflags, fflags, ldflags, err := b.CFlags(&load.Package{})
++	cppflags, cflags, cxxflags, fflags, ldflags, err := b.CFlags(&load.Package{}, false)
+ 	if err != nil {
+ 		// Should not happen - b.CFlags was given an empty package.
+ 		fmt.Fprintf(os.Stderr, "go: invalid cflags: %v\n", err)
+diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
+index c4c1500eb2..b0f6b45647 100644
+--- a/src/cmd/go/internal/work/exec.go
++++ b/src/cmd/go/internal/work/exec.go
+@@ -173,6 +173,8 @@ func (b *Builder) Do(root *Action) {
+ 	wg.Wait()
+ }
+ 
++var omitGopath = os.Getenv("GOPATH_OMIT_IN_ACTIONID") != ""
++
+ // buildActionID computes the action ID for a build action.
+ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+ 	p := a.Package
+@@ -189,7 +191,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+ 	// but it does not hide the exact value of $GOPATH.
+ 	// Include the full dir in that case.
+ 	// Assume b.WorkDir is being trimmed properly.
+-	if !p.Goroot && !strings.HasPrefix(p.Dir, b.WorkDir) {
++	if !p.Goroot && !omitGopath && !strings.HasPrefix(p.Dir, b.WorkDir) {
+ 		fmt.Fprintf(h, "dir %s\n", p.Dir)
+ 	}
+ 	fmt.Fprintf(h, "goos %s goarch %s\n", cfg.Goos, cfg.Goarch)
+@@ -197,13 +199,13 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+ 	fmt.Fprintf(h, "omitdebug %v standard %v local %v prefix %q\n", p.Internal.OmitDebug, p.Standard, p.Internal.Local, p.Internal.LocalPrefix)
+ 	if len(p.CgoFiles)+len(p.SwigFiles) > 0 {
+ 		fmt.Fprintf(h, "cgo %q\n", b.toolID("cgo"))
+-		cppflags, cflags, cxxflags, fflags, _, _ := b.CFlags(p)
+-		fmt.Fprintf(h, "CC=%q %q %q\n", b.ccExe(), cppflags, cflags)
++		cppflags, cflags, cxxflags, fflags, _, _ := b.CFlags(p, true)
++		fmt.Fprintf(h, "CC=%q %q %q\n", b.ccExe(true), cppflags, cflags)
+ 		if len(p.CXXFiles)+len(p.SwigFiles) > 0 {
+-			fmt.Fprintf(h, "CXX=%q %q\n", b.cxxExe(), cxxflags)
++			fmt.Fprintf(h, "CXX=%q %q\n", b.cxxExe(true), cxxflags)
+ 		}
+ 		if len(p.FFiles) > 0 {
+-			fmt.Fprintf(h, "FC=%q %q\n", b.fcExe(), fflags)
++			fmt.Fprintf(h, "FC=%q %q\n", b.fcExe(true), fflags)
+ 		}
+ 		// TODO(rsc): Should we include the SWIG version or Fortran/GCC/G++/Objective-C compiler versions?
+ 	}
+@@ -1731,33 +1733,33 @@ var (
+ // gccCmd returns a gcc command line prefix
+ // defaultCC is defined in zdefaultcc.go, written by cmd/dist.
+ func (b *Builder) GccCmd(incdir, workdir string) []string {
+-	return b.compilerCmd(b.ccExe(), incdir, workdir)
++	return b.compilerCmd(b.ccExe(false), incdir, workdir)
+ }
+ 
+ // gxxCmd returns a g++ command line prefix
+ // defaultCXX is defined in zdefaultcc.go, written by cmd/dist.
+ func (b *Builder) GxxCmd(incdir, workdir string) []string {
+-	return b.compilerCmd(b.cxxExe(), incdir, workdir)
++	return b.compilerCmd(b.cxxExe(false), incdir, workdir)
+ }
+ 
+ // gfortranCmd returns a gfortran command line prefix.
+ func (b *Builder) gfortranCmd(incdir, workdir string) []string {
+-	return b.compilerCmd(b.fcExe(), incdir, workdir)
++	return b.compilerCmd(b.fcExe(false), incdir, workdir)
+ }
+ 
+ // ccExe returns the CC compiler setting without all the extra flags we add implicitly.
+-func (b *Builder) ccExe() []string {
+-	return b.compilerExe(origCC, cfg.DefaultCC(cfg.Goos, cfg.Goarch))
++func (b *Builder) ccExe(filtered bool) []string {
++	return b.compilerExe(origCC, cfg.DefaultCC(cfg.Goos, cfg.Goarch), filtered)
+ }
+ 
+ // cxxExe returns the CXX compiler setting without all the extra flags we add implicitly.
+-func (b *Builder) cxxExe() []string {
+-	return b.compilerExe(origCXX, cfg.DefaultCXX(cfg.Goos, cfg.Goarch))
++func (b *Builder) cxxExe(filtered bool) []string {
++	return b.compilerExe(origCXX, cfg.DefaultCXX(cfg.Goos, cfg.Goarch), filtered)
+ }
+ 
+ // fcExe returns the FC compiler setting without all the extra flags we add implicitly.
+-func (b *Builder) fcExe() []string {
+-	return b.compilerExe(os.Getenv("FC"), "gfortran")
++func (b *Builder) fcExe(filtered bool) []string {
++	return b.compilerExe(os.Getenv("FC"), "gfortran", filtered)
+ }
+ 
+ // compilerExe returns the compiler to use given an
+@@ -1766,11 +1768,14 @@ func (b *Builder) fcExe() []string {
+ // of the compiler but can have additional arguments if they
+ // were present in the environment value.
+ // For example if CC="gcc -DGOPHER" then the result is ["gcc", "-DGOPHER"].
+-func (b *Builder) compilerExe(envValue string, def string) []string {
++func (b *Builder) compilerExe(envValue string, def string, filtered bool) []string {
+ 	compiler := strings.Fields(envValue)
+ 	if len(compiler) == 0 {
+ 		compiler = []string{def}
+ 	}
++	if filtered {
++		return append(compiler[0:1], filterCompilerFlags(compiler[1:])...)
++	}
+ 	return compiler
+ }
+ 
+@@ -1920,8 +1925,23 @@ func envList(key, def string) []string {
+ 	return strings.Fields(v)
+ }
+ 
++var filterFlags = os.Getenv("CGO_PEDANTIC") == ""
++
++func filterCompilerFlags(flags []string) []string {
++	var newflags []string
++	if !filterFlags {
++		return flags
++	}
++	for _, flag := range flags {
++		if strings.HasPrefix(flag, "-m") {
++			newflags = append(newflags, flag)
++		}
++	}
++	return newflags
++}
++
+ // CFlags returns the flags to use when invoking the C, C++ or Fortran compilers, or cgo.
+-func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, ldflags []string, err error) {
++func (b *Builder) CFlags(p *load.Package, filtered bool) (cppflags, cflags, cxxflags, fflags, ldflags []string, err error) {
+ 	defaults := "-g -O2"
+ 
+ 	if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, checkCompilerFlags); err != nil {
+@@ -1939,6 +1959,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
+ 	if ldflags, err = buildFlags("LDFLAGS", defaults, p.CgoLDFLAGS, checkLinkerFlags); err != nil {
+ 		return
+ 	}
++	if filtered {
++		cppflags = filterCompilerFlags(cppflags)
++		cflags = filterCompilerFlags(cflags)
++		cxxflags = filterCompilerFlags(cxxflags)
++		fflags = filterCompilerFlags(fflags)
++		ldflags = filterCompilerFlags(ldflags)
++	}
+ 
+ 	return
+ }
+@@ -1954,7 +1981,7 @@ var cgoRe = regexp.MustCompile(`[/\\:]`)
+ 
+ func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo, outObj []string, err error) {
+ 	p := a.Package
+-	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoLDFLAGS, err := b.CFlags(p)
++	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoLDFLAGS, err := b.CFlags(p, false)
+ 	if err != nil {
+ 		return nil, nil, err
+ 	}
+@@ -2306,7 +2333,7 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
+ 
+ // Run SWIG on one SWIG input file.
+ func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string, err error) {
+-	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err := b.CFlags(p)
++	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err := b.CFlags(p, false)
+ 	if err != nil {
+ 		return "", "", err
+ 	}
+-- 
+2.14.1
+
diff --git a/meta/recipes-devtools/go/go-1.10/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch b/meta/recipes-devtools/go/go-1.10/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
new file mode 100644
index 0000000000..d1a674f3c2
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.10/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
@@ -0,0 +1,64 @@
+From d9bdd1bf03da06572a7a74d7dbf2a26d279cfa55 Mon Sep 17 00:00:00 2001
+From: Matt Madison <matt@madison.systems>
+Date: Sat, 17 Feb 2018 05:24:20 -0800
+Subject: [PATCH 3/8] allow GOTOOLDIR to be overridden in the environment
+
+to allow for split host/target build roots
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Matt Madison <matt@madison.systems>
+---
+ src/cmd/dist/build.go          | 4 +++-
+ src/cmd/go/internal/cfg/cfg.go | 6 +++++-
+ src/go/build/build.go          | 2 +-
+ 3 files changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
+index eb70f17790..e749cbd22e 100644
+--- a/src/cmd/dist/build.go
++++ b/src/cmd/dist/build.go
+@@ -220,7 +220,9 @@ func xinit() {
+ 	workdir = xworkdir()
+ 	xatexit(rmworkdir)
+ 
+-	tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
++	if tooldir = os.Getenv("GOTOOLDIR"); tooldir == "" {
++		tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
++	}
+ }
+ 
+ // compilerEnv returns a map from "goos/goarch" to the
+diff --git a/src/cmd/go/internal/cfg/cfg.go b/src/cmd/go/internal/cfg/cfg.go
+index 1de4f0dc79..4f6010d660 100644
+--- a/src/cmd/go/internal/cfg/cfg.go
++++ b/src/cmd/go/internal/cfg/cfg.go
+@@ -96,7 +96,11 @@ func init() {
+ 	// as the tool directory does not move based on environment variables.
+ 	// This matches the initialization of ToolDir in go/build,
+ 	// except for using GOROOT rather than runtime.GOROOT().
+-	build.ToolDir = filepath.Join(GOROOT, "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
++	if s := os.Getenv("GOTOOLDIR"); s != "" {
++		build.ToolDir = filepath.Clean(s)
++	} else {
++		build.ToolDir = filepath.Join(GOROOT, "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
++	}
+ }
+ 
+ func findGOROOT() string {
+diff --git a/src/go/build/build.go b/src/go/build/build.go
+index 68fb423983..81b1b32270 100644
+--- a/src/go/build/build.go
++++ b/src/go/build/build.go
+@@ -1594,7 +1594,7 @@ func init() {
+ }
+ 
+ // ToolDir is the directory containing build tools.
+-var ToolDir = filepath.Join(runtime.GOROOT(), "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
++var ToolDir = envOr("GOTOOLDIR", filepath.Join(runtime.GOROOT(), "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH))
+ 
+ // IsLocalImport reports whether the import path is
+ // a local import path, like ".", "..", "./foo", or "../foo".
+-- 
+2.14.1
+
diff --git a/meta/recipes-devtools/go/go-1.10/0004-ld-add-soname-to-shareable-objects.patch b/meta/recipes-devtools/go/go-1.10/0004-ld-add-soname-to-shareable-objects.patch
new file mode 100644
index 0000000000..a748391659
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.10/0004-ld-add-soname-to-shareable-objects.patch
@@ -0,0 +1,47 @@
+From 0346a4271d31aab567f6758711a4694fb6108daf Mon Sep 17 00:00:00 2001
+From: Matt Madison <matt@madison.systems>
+Date: Sat, 17 Feb 2018 06:26:10 -0800
+Subject: [PATCH 4/8] ld: add soname to shareable objects
+
+so that OE's shared library dependency handling
+can find them.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Matt Madison <matt@madison.systems>
+---
+ src/cmd/link/internal/ld/lib.go | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/ld/lib.go
+index 6dcaf64122..11cbb8a8bb 100644
+--- a/src/cmd/link/internal/ld/lib.go
++++ b/src/cmd/link/internal/ld/lib.go
+@@ -1134,6 +1134,7 @@ func (ctxt *Link) hostlink() {
+ 				argv = append(argv, "-Wl,-z,relro")
+ 			}
+ 			argv = append(argv, "-shared")
++			argv = append(argv, fmt.Sprintf("-Wl,-soname,%s", filepath.Base(*flagOutfile)))
+ 			if ctxt.HeadType != objabi.Hwindows {
+ 				// Pass -z nodelete to mark the shared library as
+ 				// non-closeable: a dlclose will do nothing.
+@@ -1145,6 +1146,8 @@ func (ctxt *Link) hostlink() {
+ 			argv = append(argv, "-Wl,-z,relro")
+ 		}
+ 		argv = append(argv, "-shared")
++		argv = append(argv, fmt.Sprintf("-Wl,-soname,%s", filepath.Base(*flagOutfile)))
++
+ 	case BuildModePlugin:
+ 		if ctxt.HeadType == objabi.Hdarwin {
+ 			argv = append(argv, "-dynamiclib")
+@@ -1153,6 +1156,7 @@ func (ctxt *Link) hostlink() {
+ 				argv = append(argv, "-Wl,-z,relro")
+ 			}
+ 			argv = append(argv, "-shared")
++			argv = append(argv, fmt.Sprintf("-Wl,-soname,%s", filepath.Base(*flagOutfile)))
+ 		}
+ 	}
+ 
+-- 
+2.14.1
+
diff --git a/meta/recipes-devtools/go/go-1.10/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go-1.10/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
new file mode 100644
index 0000000000..d15f9d299f
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.10/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
@@ -0,0 +1,40 @@
+From 215132a219461a9bcc2ff086474c620f651f463e Mon Sep 17 00:00:00 2001
+From: Matt Madison <matt@madison.systems>
+Date: Sat, 17 Feb 2018 06:32:45 -0800
+Subject: [PATCH 5/8] make.bash: override CC when building dist and
+ go_bootstrap
+
+for handling OE cross-canadian builds.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Matt Madison <matt@madison.systems>
+---
+ src/make.bash | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/make.bash b/src/make.bash
+index 93a5c43d11..3a63682bc4 100755
+--- a/src/make.bash
++++ b/src/make.bash
+@@ -162,7 +162,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ]; then
+ 	exit 1
+ fi
+ rm -f cmd/dist/dist
+-GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH="" "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
++CC="${BUILD_CC:-${CC}}" GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH="" "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
+ 
+ # -e doesn't propagate out of eval, so check success by hand.
+ eval $(./cmd/dist/dist env -p || echo FAIL=true)
+@@ -193,7 +193,7 @@ fi
+ # Run dist bootstrap to complete make.bash.
+ # Bootstrap installs a proper cmd/dist, built with the new toolchain.
+ # Throw ours, built with Go 1.4, away after bootstrap.
+-./cmd/dist/dist bootstrap $buildall $vflag $GO_DISTFLAGS "$@"
++CC="${BUILD_CC:-${CC}}" ./cmd/dist/dist bootstrap $buildall $vflag $GO_DISTFLAGS "$@"
+ rm -f ./cmd/dist/dist
+ 
+ # DO NOT ADD ANY NEW CODE HERE.
+-- 
+2.14.1
+
diff --git a/meta/recipes-devtools/go/go-1.10/0006-cmd-dist-separate-host-and-target-builds.patch b/meta/recipes-devtools/go/go-1.10/0006-cmd-dist-separate-host-and-target-builds.patch
new file mode 100644
index 0000000000..73a9db213c
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.10/0006-cmd-dist-separate-host-and-target-builds.patch
@@ -0,0 +1,277 @@
+From 4839007ac75e0d6d15392e84966bd6051a68bcc4 Mon Sep 17 00:00:00 2001
+From: Matt Madison <matt@madison.systems>
+Date: Sat, 17 Feb 2018 10:03:48 -0800
+Subject: [PATCH 6/8] cmd/dist: separate host and target builds
+
+Change the dist tool to allow for OE-style cross-
+and cross-canadian builds:
+
+ - command flags --host-only and --target only are added;
+   if one is present, the other changes mentioned below
+   take effect, and arguments may also be specified on
+   the command line to enumerate the package(s) to be
+   built.
+
+ - for OE cross builds, go_bootstrap is always built for
+   the current build host, and is moved, along with the supporting
+   toolchain (asm, compile, etc.) to a separate 'native_native'
+   directory under GOROOT/pkg/tool.
+
+ - go_bootstrap is not automatically removed after the build,
+   so it can be reused later (e.g., building both static and
+   shared runtime).
+
+Note that for --host-only builds, it would be nice to specify
+just the "cmd" package to build only the go commands/tools,
+the staleness checks in the dist tool will fail if the "std"
+library has not also been built.  So host-only builds have to
+build everything anyway.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Matt Madison <matt@madison.systems>
+
+more dist cleanup
+---
+ src/cmd/dist/build.go | 149 +++++++++++++++++++++++++++++++++++++-------------
+ 1 file changed, 111 insertions(+), 38 deletions(-)
+
+diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
+index e749cbd22e..c949429543 100644
+--- a/src/cmd/dist/build.go
++++ b/src/cmd/dist/build.go
+@@ -38,6 +38,7 @@ var (
+ 	goldflags        string
+ 	workdir          string
+ 	tooldir          string
++	build_tooldir	 string
+ 	oldgoos          string
+ 	oldgoarch        string
+ 	exe              string
+@@ -49,6 +50,7 @@ var (
+ 
+ 	rebuildall   bool
+ 	defaultclang bool
++	crossBuild   bool
+ 
+ 	vflag int // verbosity
+ )
+@@ -223,6 +225,8 @@ func xinit() {
+ 	if tooldir = os.Getenv("GOTOOLDIR"); tooldir == "" {
+ 		tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
+ 	}
++	build_tooldir = pathf("%s/pkg/tool/native_native", goroot)
++
+ }
+ 
+ // compilerEnv returns a map from "goos/goarch" to the
+@@ -252,7 +256,6 @@ func compilerEnv(envName, def string) map[string]string {
+ 		if gohostos != goos || gohostarch != goarch {
+ 			m[gohostos+"/"+gohostarch] = m[""]
+ 		}
+-		m[""] = env
+ 	}
+ 
+ 	for _, goos := range okgoos {
+@@ -479,8 +482,10 @@ func setup() {
+ 	// We keep it in pkg/, just like the object directory above.
+ 	if rebuildall {
+ 		xremoveall(tooldir)
++		xremoveall(build_tooldir)
+ 	}
+ 	xmkdirall(tooldir)
++	xmkdirall(build_tooldir)
+ 
+ 	// Remove tool binaries from before the tool/gohostos_gohostarch
+ 	xremoveall(pathf("%s/bin/tool", goroot))
+@@ -1130,11 +1135,29 @@ func cmdbootstrap() {
+ 
+ 	var noBanner bool
+ 	var debug bool
++	var hostOnly bool
++	var targetOnly bool
++	var toBuild = []string { "std", "cmd" }
++
+ 	flag.BoolVar(&rebuildall, "a", rebuildall, "rebuild all")
+ 	flag.BoolVar(&debug, "d", debug, "enable debugging of bootstrap process")
+ 	flag.BoolVar(&noBanner, "no-banner", noBanner, "do not print banner")
++	flag.BoolVar(&hostOnly, "host-only", hostOnly, "build only host binaries, not target")
++	flag.BoolVar(&targetOnly, "target-only", targetOnly, "build only target binaries, not host")
+ 
+-	xflagparse(0)
++	xflagparse(-1)
++
++	if (hostOnly && targetOnly) {
++		fatalf("specify only one of --host-only or --target-only\n")
++	}
++	crossBuild = hostOnly || targetOnly
++	if flag.NArg() > 0 {
++		if crossBuild {
++			toBuild = flag.Args()
++		} else {
++			fatalf("package names not permitted without --host-only or --target-only\n")
++		}
++	}
+ 
+ 	if debug {
+ 		// cmd/buildid is used in debug mode.
+@@ -1182,8 +1205,13 @@ func cmdbootstrap() {
+ 		xprintf("\n")
+ 	}
+ 
+-	gogcflags = os.Getenv("GO_GCFLAGS") // we were using $BOOT_GO_GCFLAGS until now
+-	goldflags = os.Getenv("GO_LDFLAGS")
++	// For split host/target cross/cross-canadian builds, we don't
++	// want to be setting these flags until after we have compiled
++	// the toolchain that runs on the build host.
++	if ! crossBuild {
++		gogcflags = os.Getenv("GO_GCFLAGS") // we were using $BOOT_GO_GCFLAGS until now
++		goldflags = os.Getenv("GO_LDFLAGS")
++	}
+ 	goBootstrap := pathf("%s/go_bootstrap", tooldir)
+ 	cmdGo := pathf("%s/go", gobin)
+ 	if debug {
+@@ -1212,7 +1240,11 @@ func cmdbootstrap() {
+ 		xprintf("\n")
+ 	}
+ 	xprintf("Building Go toolchain2 using go_bootstrap and Go toolchain1.\n")
+-	os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
++	if crossBuild {
++		os.Setenv("CC", defaultcc[""])
++	} else {
++		os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
++	}
+ 	goInstall(goBootstrap, append([]string{"-i"}, toolchain...)...)
+ 	if debug {
+ 		run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
+@@ -1249,45 +1281,82 @@ func cmdbootstrap() {
+ 	}
+ 	checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
+ 
+-	if goos == oldgoos && goarch == oldgoarch {
+-		// Common case - not setting up for cross-compilation.
+-		timelog("build", "toolchain")
+-		if vflag > 0 {
+-			xprintf("\n")
++	if crossBuild {
++		gogcflags = os.Getenv("GO_GCFLAGS")
++		goldflags = os.Getenv("GO_LDFLAGS")
++		tool_files, _ := filepath.Glob(pathf("%s/*", tooldir))
++		for _, f := range tool_files {
++			copyfile(pathf("%s/%s", build_tooldir, filepath.Base(f)), f, writeExec)
++			xremove(f)
++		}
++		os.Setenv("GOTOOLDIR", build_tooldir)
++		goBootstrap = pathf("%s/go_bootstrap", build_tooldir)
++		if hostOnly {
++			timelog("build", "host toolchain")
++			if vflag > 0 {
++				xprintf("\n")
++			}
++			xprintf("Building %s for host, %s/%s.\n", strings.Join(toBuild, ","), goos, goarch)
++			goInstall(goBootstrap, toBuild...)
++			checkNotStale(goBootstrap, toBuild...)
++			// Skip cmdGo staleness checks here, since we can't necessarily run the cmdGo binary
++
++			timelog("build", "target toolchain")
++			if vflag > 0 {
++				xprintf("\n")
++			}
++		} else if targetOnly {
++			goos = oldgoos
++			goarch = oldgoarch
++			os.Setenv("GOOS", goos)
++			os.Setenv("GOARCH", goarch)
++			os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
++			xprintf("Building %s for target, %s/%s.\n", strings.Join(toBuild, ","), goos, goarch)
++			goInstall(goBootstrap, toBuild...)
++			checkNotStale(goBootstrap, toBuild...)
++			// Skip cmdGo staleness checks here, since we can't run the target's cmdGo binary
+ 		}
+-		xprintf("Building packages and commands for %s/%s.\n", goos, goarch)
+ 	} else {
+-		// GOOS/GOARCH does not match GOHOSTOS/GOHOSTARCH.
+-		// Finish GOHOSTOS/GOHOSTARCH installation and then
+-		// run GOOS/GOARCH installation.
+-		timelog("build", "host toolchain")
+-		if vflag > 0 {
+-			xprintf("\n")
++		if goos == oldgoos && goarch == oldgoarch {
++			// Common case - not setting up for cross-compilation.
++			timelog("build", "toolchain")
++			if vflag > 0 {
++				xprintf("\n")
++			}
++			xprintf("Building packages and commands for %s/%s.\n", goos, goarch)
++		} else {
++			// GOOS/GOARCH does not match GOHOSTOS/GOHOSTARCH.
++			// Finish GOHOSTOS/GOHOSTARCH installation and then
++			// run GOOS/GOARCH installation.
++			timelog("build", "host toolchain")
++			if vflag > 0 {
++				xprintf("\n")
++			}
++			xprintf("Building packages and commands for host, %s/%s.\n", goos, goarch)
++			goInstall(goBootstrap, "std", "cmd")
++			checkNotStale(goBootstrap, "std", "cmd")
++			checkNotStale(cmdGo, "std", "cmd")
++
++			timelog("build", "target toolchain")
++			if vflag > 0 {
++				xprintf("\n")
++			}
++			goos = oldgoos
++			goarch = oldgoarch
++			os.Setenv("GOOS", goos)
++			os.Setenv("GOARCH", goarch)
++			os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
++			xprintf("Building packages and commands for target, %s/%s.\n", goos, goarch)
+ 		}
+-		xprintf("Building packages and commands for host, %s/%s.\n", goos, goarch)
+ 		goInstall(goBootstrap, "std", "cmd")
+ 		checkNotStale(goBootstrap, "std", "cmd")
+ 		checkNotStale(cmdGo, "std", "cmd")
+-
+-		timelog("build", "target toolchain")
+-		if vflag > 0 {
+-			xprintf("\n")
++		if debug {
++			run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
++			run("", ShowOutput|CheckExit, pathf("%s/buildid", tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
++			checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
++			copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir), writeExec)
+ 		}
+-		goos = oldgoos
+-		goarch = oldgoarch
+-		os.Setenv("GOOS", goos)
+-		os.Setenv("GOARCH", goarch)
+-		os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
+-		xprintf("Building packages and commands for target, %s/%s.\n", goos, goarch)
+-	}
+-	goInstall(goBootstrap, "std", "cmd")
+-	checkNotStale(goBootstrap, "std", "cmd")
+-	checkNotStale(cmdGo, "std", "cmd")
+-	if debug {
+-		run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
+-		run("", ShowOutput|CheckExit, pathf("%s/buildid", tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
+-		checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
+-		copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir), writeExec)
+ 	}
+ 
+ 	// Check that there are no new files in $GOROOT/bin other than
+@@ -1305,7 +1374,11 @@ func cmdbootstrap() {
+ 	}
+ 
+ 	// Remove go_bootstrap now that we're done.
+-	xremove(pathf("%s/go_bootstrap", tooldir))
++	// Except that for split host/target cross-builds, we need to
++	// keep it.
++	if ! crossBuild {
++		xremove(pathf("%s/go_bootstrap", tooldir))
++	}
+ 
+ 	// Print trailing banner unless instructed otherwise.
+ 	if !noBanner {
+-- 
+2.14.1
+
diff --git a/meta/recipes-devtools/go/go-1.10/0007-cmd-go-make-GOROOT-precious-by-default.patch b/meta/recipes-devtools/go/go-1.10/0007-cmd-go-make-GOROOT-precious-by-default.patch
new file mode 100644
index 0000000000..cadca3012b
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.10/0007-cmd-go-make-GOROOT-precious-by-default.patch
@@ -0,0 +1,97 @@
+From 71653883c263093624e6c92d4cd5187433887690 Mon Sep 17 00:00:00 2001
+From: Matt Madison <matt@madison.systems>
+Date: Sun, 18 Feb 2018 15:03:14 -0800
+Subject: [PATCH 7/8] cmd/go: make GOROOT precious by default
+
+The go build tool normally rebuilds whatever it detects is
+stale.  This can be a problem when GOROOT is intended to
+be read-only and the go runtime has been built as a shared
+library, since we don't want every application to be rebuilding
+the shared runtime - particularly in cross-build/packaging
+setups, since that would lead to 'abi mismatch' runtime errors.
+
+This patch adds logic to treat the standard library and all
+other GOROOT-resident packages as essentially binary-only.
+If, during compilation, any of those packages are 'stale',
+an error is issued instead of rebuilding the stale components.
+
+For an OE build, staleness errors would indicate a problem
+with the build (missing dependencies, sstate issues, etc.).
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Matt Madison <matt@madison.systems>
+---
+ src/cmd/go/internal/work/build.go   |  5 +++++
+ src/cmd/go/internal/work/buildid.go |  2 +-
+ src/cmd/go/internal/work/exec.go    | 18 ++++++++++++++++++
+ 3 files changed, 24 insertions(+), 1 deletion(-)
+
+diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/work/build.go
+index 57b7b00879..e2ba95420e 100644
+--- a/src/cmd/go/internal/work/build.go
++++ b/src/cmd/go/internal/work/build.go
+@@ -143,6 +143,7 @@ See also: go install, go get, go clean.
+ }
+ 
+ const concurrentGCBackendCompilationEnabledByDefault = true
++var goRootPrecious bool = true
+ 
+ func init() {
+ 	// break init cycle
+@@ -156,6 +157,10 @@ func init() {
+ 
+ 	AddBuildFlags(CmdBuild)
+ 	AddBuildFlags(CmdInstall)
++
++	if x := os.Getenv("GOROOT_OVERRIDE"); x != "" {
++		goRootPrecious = false
++	}
+ }
+ 
+ // Note that flags consulted by other parts of the code
+diff --git a/src/cmd/go/internal/work/buildid.go b/src/cmd/go/internal/work/buildid.go
+index 39ca20ee4f..a047430177 100644
+--- a/src/cmd/go/internal/work/buildid.go
++++ b/src/cmd/go/internal/work/buildid.go
+@@ -463,7 +463,7 @@ func (b *Builder) useCache(a *Action, p *load.Package, actionHash cache.ActionID
+ 
+ 	if b.ComputeStaleOnly {
+ 		// Invoked during go list only to compute and record staleness.
+-		if p := a.Package; p != nil && !p.Stale {
++		if p := a.Package; p != nil && !p.Stale && !(goRootPrecious && (p.Standard || p.Goroot)) {
+ 			p.Stale = true
+ 			if cfg.BuildA {
+ 				p.StaleReason = "build -a flag in use"
+diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
+index b0f6b45647..a876d59347 100644
+--- a/src/cmd/go/internal/work/exec.go
++++ b/src/cmd/go/internal/work/exec.go
+@@ -371,6 +371,24 @@ func (b *Builder) build(a *Action) (err error) {
+ 		return fmt.Errorf("missing or invalid binary-only package")
+ 	}
+ 
++	if goRootPrecious && (a.Package.Standard || a.Package.Goroot) {
++		_, err := os.Stat(a.Package.Target)
++		if err == nil {
++			a.built = a.Package.Target
++			a.Target = a.Package.Target
++			a.buildID = b.fileHash(a.Package.Target)
++			a.Package.Stale = false
++			a.Package.StaleReason = "GOROOT-resident package"
++			return nil
++		}
++		if b.ComputeStaleOnly {
++			a.Package.Stale = true
++			a.Package.StaleReason = "missing or invalid GOROOT-resident package"
++			return nil
++		}
++		return fmt.Errorf("missing or invalid GOROOT-resident package")
++	}
++
+ 	if err := b.Mkdir(a.Objdir); err != nil {
+ 		return err
+ 	}
+-- 
+2.14.1
+
diff --git a/meta/recipes-devtools/go/go-1.10/0008-ld-replace-glibc-dynamic-linker-with-musl.patch b/meta/recipes-devtools/go/go-1.10/0008-ld-replace-glibc-dynamic-linker-with-musl.patch
new file mode 100644
index 0000000000..cc7179cb2c
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.10/0008-ld-replace-glibc-dynamic-linker-with-musl.patch
@@ -0,0 +1,130 @@
+From 5c3ed89c29d4f40ea4e66d569b1f6c9c4a51cd42 Mon Sep 17 00:00:00 2001
+From: Matt Madison <matt@madison.systems>
+Date: Sun, 18 Feb 2018 08:24:05 -0800
+Subject: [PATCH 8/8] ld: replace glibc dynamic linker with musl
+
+Rework of patch by Khem Raj <raj.khem@gmail.com>
+for go 1.10.  Should be applied conditionally on
+musl being the system C library.
+
+Upstream-Status: Inappropriate [Real fix should be portable across libcs]
+
+Signed-off-by: Matt Madison <matt@madison.systems>
+---
+ src/cmd/link/internal/amd64/obj.go  | 2 +-
+ src/cmd/link/internal/arm/obj.go    | 2 +-
+ src/cmd/link/internal/arm64/obj.go  | 2 +-
+ src/cmd/link/internal/mips/obj.go   | 2 +-
+ src/cmd/link/internal/mips64/obj.go | 2 +-
+ src/cmd/link/internal/ppc64/obj.go  | 2 +-
+ src/cmd/link/internal/s390x/obj.go  | 2 +-
+ src/cmd/link/internal/x86/obj.go    | 2 +-
+ 8 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/src/cmd/link/internal/amd64/obj.go b/src/cmd/link/internal/amd64/obj.go
+index 87e809166a..f522a63034 100644
+--- a/src/cmd/link/internal/amd64/obj.go
++++ b/src/cmd/link/internal/amd64/obj.go
+@@ -62,7 +62,7 @@ func Init() (*sys.Arch, ld.Arch) {
+ 		PEreloc1:         pereloc1,
+ 		TLSIEtoLE:        tlsIEtoLE,
+ 
+-		Linuxdynld:     "/lib64/ld-linux-x86-64.so.2",
++		Linuxdynld:     "/lib64/ld-musl-x86-64.so.1",
+ 		Freebsddynld:   "/libexec/ld-elf.so.1",
+ 		Openbsddynld:   "/usr/libexec/ld.so",
+ 		Netbsddynld:    "/libexec/ld.elf_so",
+diff --git a/src/cmd/link/internal/arm/obj.go b/src/cmd/link/internal/arm/obj.go
+index da16f92345..fd14940ede 100644
+--- a/src/cmd/link/internal/arm/obj.go
++++ b/src/cmd/link/internal/arm/obj.go
+@@ -58,7 +58,7 @@ func Init() (*sys.Arch, ld.Arch) {
+ 		Gentext:          gentext,
+ 		Machoreloc1:      machoreloc1,
+ 
+-		Linuxdynld:     "/lib/ld-linux.so.3", // 2 for OABI, 3 for EABI
++		Linuxdynld:     "/lib/ld-musl-armhf.so.1",
+ 		Freebsddynld:   "/usr/libexec/ld-elf.so.1",
+ 		Openbsddynld:   "/usr/libexec/ld.so",
+ 		Netbsddynld:    "/libexec/ld.elf_so",
+diff --git a/src/cmd/link/internal/arm64/obj.go b/src/cmd/link/internal/arm64/obj.go
+index 6b386ad737..99863712cc 100644
+--- a/src/cmd/link/internal/arm64/obj.go
++++ b/src/cmd/link/internal/arm64/obj.go
+@@ -57,7 +57,7 @@ func Init() (*sys.Arch, ld.Arch) {
+ 		Gentext:          gentext,
+ 		Machoreloc1:      machoreloc1,
+ 
+-		Linuxdynld: "/lib/ld-linux-aarch64.so.1",
++		Linuxdynld: "/lib/ld-musl-aarch64.so.1",
+ 
+ 		Freebsddynld:   "XXX",
+ 		Openbsddynld:   "XXX",
+diff --git a/src/cmd/link/internal/mips/obj.go b/src/cmd/link/internal/mips/obj.go
+index c5d3451c39..fd85e6368d 100644
+--- a/src/cmd/link/internal/mips/obj.go
++++ b/src/cmd/link/internal/mips/obj.go
+@@ -60,7 +60,7 @@ func Init() (*sys.Arch, ld.Arch) {
+ 		Gentext:          gentext,
+ 		Machoreloc1:      machoreloc1,
+ 
+-		Linuxdynld: "/lib/ld.so.1",
++		Linuxdynld: "/lib/ld-musl-mipsle.so.1",
+ 
+ 		Freebsddynld:   "XXX",
+ 		Openbsddynld:   "XXX",
+diff --git a/src/cmd/link/internal/mips64/obj.go b/src/cmd/link/internal/mips64/obj.go
+index 83974e5b56..097224f6da 100644
+--- a/src/cmd/link/internal/mips64/obj.go
++++ b/src/cmd/link/internal/mips64/obj.go
+@@ -59,7 +59,7 @@ func Init() (*sys.Arch, ld.Arch) {
+ 		Gentext:          gentext,
+ 		Machoreloc1:      machoreloc1,
+ 
+-		Linuxdynld:     "/lib64/ld64.so.1",
++		Linuxdynld:     "/lib64/ld-musl-mips64le.so.1",
+ 		Freebsddynld:   "XXX",
+ 		Openbsddynld:   "XXX",
+ 		Netbsddynld:    "XXX",
+diff --git a/src/cmd/link/internal/ppc64/obj.go b/src/cmd/link/internal/ppc64/obj.go
+index 273d9b42cb..a503abe8ea 100644
+--- a/src/cmd/link/internal/ppc64/obj.go
++++ b/src/cmd/link/internal/ppc64/obj.go
+@@ -62,7 +62,7 @@ func Init() (*sys.Arch, ld.Arch) {
+ 		Machoreloc1:      machoreloc1,
+ 
+ 		// TODO(austin): ABI v1 uses /usr/lib/ld.so.1,
+-		Linuxdynld: "/lib64/ld64.so.1",
++		Linuxdynld: "/lib64/ld-musl-powerpc64le.so.1",
+ 
+ 		Freebsddynld:   "XXX",
+ 		Openbsddynld:   "XXX",
+diff --git a/src/cmd/link/internal/s390x/obj.go b/src/cmd/link/internal/s390x/obj.go
+index 9ac7eb8217..3825ff7abe 100644
+--- a/src/cmd/link/internal/s390x/obj.go
++++ b/src/cmd/link/internal/s390x/obj.go
+@@ -57,7 +57,7 @@ func Init() (*sys.Arch, ld.Arch) {
+ 		Gentext:          gentext,
+ 		Machoreloc1:      machoreloc1,
+ 
+-		Linuxdynld: "/lib64/ld64.so.1",
++		Linuxdynld: "/lib64/ld-musl-s390x.so.1",
+ 
+ 		// not relevant for s390x
+ 		Freebsddynld:   "XXX",
+diff --git a/src/cmd/link/internal/x86/obj.go b/src/cmd/link/internal/x86/obj.go
+index 6a744dc04e..d81f392549 100644
+--- a/src/cmd/link/internal/x86/obj.go
++++ b/src/cmd/link/internal/x86/obj.go
+@@ -58,7 +58,7 @@ func Init() (*sys.Arch, ld.Arch) {
+ 		Machoreloc1:      machoreloc1,
+ 		PEreloc1:         pereloc1,
+ 
+-		Linuxdynld:   "/lib/ld-linux.so.2",
++		Linuxdynld:   "/lib/ld-musl-i386.so.1",
+ 		Freebsddynld: "/usr/libexec/ld-elf.so.1",
+ 		Openbsddynld: "/usr/libexec/ld.so",
+ 		Netbsddynld:  "/usr/libexec/ld.elf_so",
+-- 
+2.14.1
+
diff --git a/meta/recipes-devtools/go/go-1.9.inc b/meta/recipes-devtools/go/go-1.9.inc
deleted file mode 100644
index 2823304b7c..0000000000
--- a/meta/recipes-devtools/go/go-1.9.inc
+++ /dev/null
@@ -1,26 +0,0 @@
-require go-common.inc
-
-GO_BASEVERSION = "1.9"
-GO_MINOR = ".4"
-PV .= "${GO_MINOR}"
-
-FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
-
-SRC_URI += "\
-        file://0001-make.bash-quote-CC_FOR_TARGET.patch \
-        file://0002-cmd-go-fix-CC-and-CXX-environment-variable-construct.patch \
-        file://0003-make.bash-better-separate-host-and-target-builds.patch \
-        file://0004-cmd-go-allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch \
-        file://0005-cmd-go-make-GOROOT-precious-by-default.patch \
-        file://0006-make.bash-add-GOTOOLDIR_BOOTSTRAP-environment-variab.patch \
-        file://0007-ld-add-soname-to-shareable-objects.patch \
-        file://0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch \
-        file://0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch \
-        file://0010-make.bash-override-CC-when-building-dist-and-go_boot.patch \
-"
-SRC_URI_append_libc-musl = " file://set-external-linker.patch"
-
-SRC_URI[main.md5sum] = "6816441fd6680c63865cdd5cb8bc1960"
-SRC_URI[main.sha256sum] = "0573a8df33168977185aa44173305e5a0450f55213600e94541604b75d46dc06"
diff --git a/meta/recipes-devtools/go/go-1.9/0001-make.bash-quote-CC_FOR_TARGET.patch b/meta/recipes-devtools/go/go-1.9/0001-make.bash-quote-CC_FOR_TARGET.patch
deleted file mode 100644
index 7800975e48..0000000000
--- a/meta/recipes-devtools/go/go-1.9/0001-make.bash-quote-CC_FOR_TARGET.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From d24734ad44006791fd48fc45ea34fe608ff672fb Mon Sep 17 00:00:00 2001
-From: Matt Madison <matt@madison.systems>
-Date: Wed, 13 Sep 2017 08:04:23 -0700
-Subject: [PATCH 1/7] make.bash: quote CC_FOR_TARGET
-
-For OE cross-builds, $CC_FOR_TARGET has more than
-one word and needs to be quoted.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Matt Madison <matt@madison.systems>
----
- src/make.bash | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/make.bash b/src/make.bash
-index 71e7531..dcf3256 100755
---- a/src/make.bash
-+++ b/src/make.bash
-@@ -175,7 +175,7 @@ echo "##### Building packages and commands for $GOOS/$GOARCH."
- 
- old_bin_files=$(cd $GOROOT/bin && echo *)
- 
--CC=$CC_FOR_TARGET "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
-+CC="$CC_FOR_TARGET" "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
- 
- # Check that there are no new files in $GOROOT/bin other than go and gofmt
- # and $GOOS_$GOARCH (a directory used when cross-compiling).
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/go/go-1.9/0002-cmd-go-fix-CC-and-CXX-environment-variable-construct.patch b/meta/recipes-devtools/go/go-1.9/0002-cmd-go-fix-CC-and-CXX-environment-variable-construct.patch
deleted file mode 100644
index a4e42261c3..0000000000
--- a/meta/recipes-devtools/go/go-1.9/0002-cmd-go-fix-CC-and-CXX-environment-variable-construct.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From a7170d32a13aead608abd18996f6dab2e2a631b5 Mon Sep 17 00:00:00 2001
-From: Matt Madison <matt@madison.systems>
-Date: Wed, 13 Sep 2017 08:06:37 -0700
-Subject: [PATCH 2/7] cmd/go: fix CC and CXX environment variable construction
-
-For OE cross-builds, CC and CXX have multiple words, and
-we need their complete definitions when setting up the
-environment during Go builds.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Matt Madison <matt@madison.systems>
----
- src/cmd/go/internal/envcmd/env.go |  4 ++--
- src/cmd/go/internal/work/build.go | 12 ++++++++++++
- 2 files changed, 14 insertions(+), 2 deletions(-)
-
-diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
-index 43d4334..529d21d 100644
---- a/src/cmd/go/internal/envcmd/env.go
-+++ b/src/cmd/go/internal/envcmd/env.go
-@@ -74,10 +74,10 @@ func MkEnv() []cfg.EnvVar {
- 	}
- 
- 	cmd := b.GccCmd(".")
--	env = append(env, cfg.EnvVar{Name: "CC", Value: cmd[0]})
-+	env = append(env, cfg.EnvVar{Name: "CC", Value: strings.Join(b.GccCmdForReal(), " ")})
- 	env = append(env, cfg.EnvVar{Name: "GOGCCFLAGS", Value: strings.Join(cmd[3:], " ")})
- 	cmd = b.GxxCmd(".")
--	env = append(env, cfg.EnvVar{Name: "CXX", Value: cmd[0]})
-+	env = append(env, cfg.EnvVar{Name: "CXX", Value: strings.Join(b.GxxCmdForReal(), " ")})
- 
- 	if cfg.BuildContext.CgoEnabled {
- 		env = append(env, cfg.EnvVar{Name: "CGO_ENABLED", Value: "1"})
-diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/work/build.go
-index 7d667ff..85df0b3 100644
---- a/src/cmd/go/internal/work/build.go
-+++ b/src/cmd/go/internal/work/build.go
-@@ -3127,12 +3127,24 @@ func (b *Builder) GccCmd(objdir string) []string {
- 	return b.ccompilerCmd("CC", cfg.DefaultCC, objdir)
- }
- 
-+// gccCmd returns a gcc command line prefix
-+// defaultCC is defined in zdefaultcc.go, written by cmd/dist.
-+func (b *Builder) GccCmdForReal() []string {
-+	return envList("CC", cfg.DefaultCC)
-+}
-+
- // gxxCmd returns a g++ command line prefix
- // defaultCXX is defined in zdefaultcc.go, written by cmd/dist.
- func (b *Builder) GxxCmd(objdir string) []string {
- 	return b.ccompilerCmd("CXX", cfg.DefaultCXX, objdir)
- }
- 
-+// gxxCmd returns a g++ command line prefix
-+// defaultCXX is defined in zdefaultcc.go, written by cmd/dist.
-+func (b *Builder) GxxCmdForReal() []string {
-+	return envList("CXX", cfg.DefaultCXX)
-+}
-+
- // gfortranCmd returns a gfortran command line prefix.
- func (b *Builder) gfortranCmd(objdir string) []string {
- 	return b.ccompilerCmd("FC", "gfortran", objdir)
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/go/go-1.9/0003-make.bash-better-separate-host-and-target-builds.patch b/meta/recipes-devtools/go/go-1.9/0003-make.bash-better-separate-host-and-target-builds.patch
deleted file mode 100644
index ffd9f2359c..0000000000
--- a/meta/recipes-devtools/go/go-1.9/0003-make.bash-better-separate-host-and-target-builds.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From 31e88f06af7ab787d8fe0c1ca625193e1799e167 Mon Sep 17 00:00:00 2001
-From: Matt Madison <matt@madison.systems>
-Date: Wed, 13 Sep 2017 08:12:04 -0700
-Subject: [PATCH 3/7] make.bash: better separate host and target builds
-
-Fore OE cross-builds, the simple checks in make.bash are
-insufficient for distinguishing host and target build
-environments, so add some options for telling the
-script which parts are being built.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Matt Madison <matt@madison.systems>
----
- src/make.bash | 51 ++++++++++++++++++++++++++++-----------------------
- 1 file changed, 28 insertions(+), 23 deletions(-)
-
-diff --git a/src/make.bash b/src/make.bash
-index dcf3256..9553623 100755
---- a/src/make.bash
-+++ b/src/make.bash
-@@ -156,13 +156,22 @@ if [ "$1" = "--no-clean" ]; then
- 	buildall=""
- 	shift
- fi
--./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds go_bootstrap
-+do_host_build="yes"
-+do_target_build="yes"
-+if [ "$1" = "--target-only" ]; then
-+	do_host_build="no"
-+	shift
-+elif [ "$1" = "--host-only" ]; then
-+	do_target_build="no"
-+	shift
-+fi
- 
--# Delay move of dist tool to now, because bootstrap may clear tool directory.
--mv cmd/dist/dist "$GOTOOLDIR"/dist
--echo
-+if [ "$do_host_build" = "yes" ]; then
-+	./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds go_bootstrap
-+	# Delay move of dist tool to now, because bootstrap may clear tool directory.
-+	mv cmd/dist/dist "$GOTOOLDIR"/dist
-+	echo
- 
--if [ "$GOHOSTARCH" != "$GOARCH" -o "$GOHOSTOS" != "$GOOS" ]; then
- 	echo "##### Building packages and commands for host, $GOHOSTOS/$GOHOSTARCH."
- 	# CC_FOR_TARGET is recorded as the default compiler for the go tool. When building for the host, however,
- 	# use the host compiler, CC, from `cmd/dist/dist env` instead.
-@@ -171,24 +180,20 @@ if [ "$GOHOSTARCH" != "$GOARCH" -o "$GOHOSTOS" != "$GOOS" ]; then
- 	echo
- fi
- 
--echo "##### Building packages and commands for $GOOS/$GOARCH."
--
--old_bin_files=$(cd $GOROOT/bin && echo *)
--
--CC="$CC_FOR_TARGET" "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
--
--# Check that there are no new files in $GOROOT/bin other than go and gofmt
--# and $GOOS_$GOARCH (a directory used when cross-compiling).
--(cd $GOROOT/bin && for f in *; do
--	if ! expr " $old_bin_files go gofmt ${GOOS}_${GOARCH} " : ".* $f " >/dev/null 2>/dev/null; then
--		echo 1>&2 "ERROR: unexpected new file in $GOROOT/bin: $f"
--		exit 1
--	fi
--done)
--
--echo
--
--rm -f "$GOTOOLDIR"/go_bootstrap
-+if [ "$do_target_build" = "yes" ]; then
-+    GO_INSTALL="${GO_TARGET_INSTALL:-std cmd}"
-+    echo "##### Building packages and commands for $GOOS/$GOARCH."
-+    if [ "$GOHOSTOS" = "$GOOS" -a "$GOHOSTARCH" = "$GOARCH" -a "$do_host_build" = "yes" ]; then
-+	rm -rf ./host-tools
-+	mkdir ./host-tools
-+	mv "$GOTOOLDIR"/* ./host-tools
-+	GOTOOLDIR="$PWD/host-tools"
-+    fi
-+    GOTOOLDIR="$GOTOOLDIR" CC="$CC_FOR_TARGET" "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v ${GO_INSTALL}
-+    echo
-+
-+    rm -f "$GOTOOLDIR"/go_bootstrap
-+fi
- 
- if [ "$1" != "--no-banner" ]; then
- 	"$GOTOOLDIR"/dist banner
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/go/go-1.9/0004-cmd-go-allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch b/meta/recipes-devtools/go/go-1.9/0004-cmd-go-allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
deleted file mode 100644
index 180b06a4d3..0000000000
--- a/meta/recipes-devtools/go/go-1.9/0004-cmd-go-allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 1369178b497b12088ec4c2794606cc9f14cc327c Mon Sep 17 00:00:00 2001
-From: Matt Madison <matt@madison.systems>
-Date: Wed, 13 Sep 2017 08:15:03 -0700
-Subject: [PATCH 4/7] cmd/go: allow GOTOOLDIR to be overridden in the
- environment
-
-For OE cross-builds, host-side tools reside in the native
-GOROOT, not the target GOROOT.  Allow GOTOOLDIR to be set
-in the environment to allow that split, rather than always
-computing GOTOOLDIR relative to the GOROOT setting.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Matt Madison <matt@madison.systems>
----
- src/cmd/go/internal/cfg/cfg.go    | 7 ++++++-
- src/cmd/go/internal/work/build.go | 2 +-
- src/go/build/build.go             | 2 +-
- 3 files changed, 8 insertions(+), 3 deletions(-)
-
-diff --git a/src/cmd/go/internal/cfg/cfg.go b/src/cmd/go/internal/cfg/cfg.go
-index b3ad1ce..c1dc974 100644
---- a/src/cmd/go/internal/cfg/cfg.go
-+++ b/src/cmd/go/internal/cfg/cfg.go
-@@ -91,7 +91,12 @@ func init() {
- 	// as the tool directory does not move based on environment variables.
- 	// This matches the initialization of ToolDir in go/build,
- 	// except for using GOROOT rather than runtime.GOROOT().
--	build.ToolDir = filepath.Join(GOROOT, "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
-+	s := os.Getenv("GOTOOLDIR")
-+	if s == "" {
-+		build.ToolDir = filepath.Join(GOROOT, "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
-+	} else {
-+		build.ToolDir = s
-+	}
- }
- 
- func findGOROOT() string {
-diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/work/build.go
-index 85df0b3..7b9a69e 100644
---- a/src/cmd/go/internal/work/build.go
-+++ b/src/cmd/go/internal/work/build.go
-@@ -1337,7 +1337,7 @@ func (b *Builder) build(a *Action) (err error) {
- 		}
- 
- 		var cgoExe string
--		if a.cgo != nil && a.cgo.Target != "" {
-+		if a.cgo != nil && a.cgo.Target != "" && os.Getenv("GOTOOLDIR") == "" {
- 			cgoExe = a.cgo.Target
- 		} else {
- 			cgoExe = base.Tool("cgo")
-diff --git a/src/go/build/build.go b/src/go/build/build.go
-index fd89871..e16145b 100644
---- a/src/go/build/build.go
-+++ b/src/go/build/build.go
-@@ -1588,7 +1588,7 @@ func init() {
- }
- 
- // ToolDir is the directory containing build tools.
--var ToolDir = filepath.Join(runtime.GOROOT(), "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
-+var ToolDir = envOr("GOTOOLDIR", filepath.Join(runtime.GOROOT(), "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH))
- 
- // IsLocalImport reports whether the import path is
- // a local import path, like ".", "..", "./foo", or "../foo".
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/go/go-1.9/0005-cmd-go-make-GOROOT-precious-by-default.patch b/meta/recipes-devtools/go/go-1.9/0005-cmd-go-make-GOROOT-precious-by-default.patch
deleted file mode 100644
index 6e93bcb6ce..0000000000
--- a/meta/recipes-devtools/go/go-1.9/0005-cmd-go-make-GOROOT-precious-by-default.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 44f961975dac6cf464a77b5f6dd0c47cc192c4fd Mon Sep 17 00:00:00 2001
-From: Matt Madison <matt@madison.systems>
-Date: Wed, 13 Sep 2017 08:19:52 -0700
-Subject: [PATCH 5/7] cmd/go: make GOROOT precious by default
-
-For OE builds, we never want packages that have
-already been installed into the build root to be
-modified, so prevent the go build tool from checking
-if they should be rebuilt.
-
-Also add an environment variable to override this
-behavior, just for building the Go runtime.
-
-Upstream-Status: Pending
-
-Signed-off-by: Matt Madison <matt@madison.systems>
----
- src/cmd/go/internal/load/pkg.go | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/src/cmd/go/internal/load/pkg.go b/src/cmd/go/internal/load/pkg.go
-index 60de666..2660d3f 100644
---- a/src/cmd/go/internal/load/pkg.go
-+++ b/src/cmd/go/internal/load/pkg.go
-@@ -1530,6 +1530,13 @@ func isStale(p *Package) (bool, string) {
- 		return true, "build ID mismatch"
- 	}
- 
-+	// For OE builds, make anything in GOROOT non-stale,
-+	// to prevent a package build from overwriting the
-+	// build root.
-+	if p.Goroot && os.Getenv("GOROOT_OVERRIDE") != "1" {
-+		return false, "GOROOT-resident packages do not get rebuilt"
-+	}
-+
- 	// Package is stale if a dependency is.
- 	for _, p1 := range p.Internal.Deps {
- 		if p1.Stale {
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/go/go-1.9/0006-make.bash-add-GOTOOLDIR_BOOTSTRAP-environment-variab.patch b/meta/recipes-devtools/go/go-1.9/0006-make.bash-add-GOTOOLDIR_BOOTSTRAP-environment-variab.patch
deleted file mode 100644
index f0f564044b..0000000000
--- a/meta/recipes-devtools/go/go-1.9/0006-make.bash-add-GOTOOLDIR_BOOTSTRAP-environment-variab.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From aae74d1045ca03306ba4159206ee3bac72bcdfbb Mon Sep 17 00:00:00 2001
-From: Matt Madison <matt@madison.systems>
-Date: Wed, 13 Sep 2017 08:23:23 -0700
-Subject: [PATCH 6/7] make.bash: add GOTOOLDIR_BOOTSTRAP environment variable
-
-For cross-canadian builds, we need to use the native
-GOTOOLDIR during the bootstrap phase, so provide a way
-to pass that setting into the build script.
-
-Upstream-Status: Pending
-
-Signed-off-by: Matt Madison <matt@madison.systems>
----
- src/make.bash | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/make.bash b/src/make.bash
-index 9553623..2e6fb05 100755
---- a/src/make.bash
-+++ b/src/make.bash
-@@ -172,10 +172,11 @@ if [ "$do_host_build" = "yes" ]; then
- 	mv cmd/dist/dist "$GOTOOLDIR"/dist
- 	echo
- 
-+	GOTOOLDIR_BOOTSTRAP="${GOTOOLDIR_BOOTSTRAP:-$GOTOOLDIR}"
- 	echo "##### Building packages and commands for host, $GOHOSTOS/$GOHOSTARCH."
- 	# CC_FOR_TARGET is recorded as the default compiler for the go tool. When building for the host, however,
- 	# use the host compiler, CC, from `cmd/dist/dist env` instead.
--	CC=$CC GOOS=$GOHOSTOS GOARCH=$GOHOSTARCH \
-+	CC=$CC GOOS=$GOHOSTOS GOARCH=$GOHOSTARCH GOTOOLDIR="$GOTOOLDIR_BOOTSTRAP" \
- 		"$GOTOOLDIR"/go_bootstrap install -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
- 	echo
- fi
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/go/go-1.9/0007-ld-add-soname-to-shareable-objects.patch b/meta/recipes-devtools/go/go-1.9/0007-ld-add-soname-to-shareable-objects.patch
deleted file mode 100644
index 6459782d81..0000000000
--- a/meta/recipes-devtools/go/go-1.9/0007-ld-add-soname-to-shareable-objects.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From e957c3458d53e37bf416f51d2f8bf54c195e50f5 Mon Sep 17 00:00:00 2001
-From: Matt Madison <matt@madison.systems>
-Date: Wed, 13 Sep 2017 08:27:02 -0700
-Subject: [PATCH 7/7] ld: add soname to shareable objects
-
-Shared library handling in OE depends on the inclusion
-of an soname header, so update the go linker to add that
-header for both internal and external linking.
-
-Upstream-Status: Pending
-
-Signed-off-by: Matt Madison <matt@madison.systems>
----
- src/cmd/link/internal/ld/lib.go | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/ld/lib.go
-index 0234105..0b9e2d0 100644
---- a/src/cmd/link/internal/ld/lib.go
-+++ b/src/cmd/link/internal/ld/lib.go
-@@ -1124,12 +1124,14 @@ func (l *Link) hostlink() {
- 			// Pass -z nodelete to mark the shared library as
- 			// non-closeable: a dlclose will do nothing.
- 			argv = append(argv, "-shared", "-Wl,-z,nodelete")
-+			argv = append(argv, fmt.Sprintf("-Wl,-soname,%s", filepath.Base(*flagOutfile)))
- 		}
- 	case BuildmodeShared:
- 		if UseRelro() {
- 			argv = append(argv, "-Wl,-z,relro")
- 		}
- 		argv = append(argv, "-shared")
-+		argv = append(argv, fmt.Sprintf("-Wl,-soname,%s", filepath.Base(*flagOutfile)))
- 	case BuildmodePlugin:
- 		if Headtype == objabi.Hdarwin {
- 			argv = append(argv, "-dynamiclib")
-@@ -1138,6 +1140,7 @@ func (l *Link) hostlink() {
- 				argv = append(argv, "-Wl,-z,relro")
- 			}
- 			argv = append(argv, "-shared")
-+			argv = append(argv, fmt.Sprintf("-Wl,-soname,%s", filepath.Base(*flagOutfile)))
- 		}
- 	}
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/go/go-1.9/0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch b/meta/recipes-devtools/go/go-1.9/0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch
deleted file mode 100644
index 0977c78350..0000000000
--- a/meta/recipes-devtools/go/go-1.9/0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 03e6c339d4fb712fbb8c4ca6ef2fc7100dcdb3d7 Mon Sep 17 00:00:00 2001
-From: Matt Madison <matt@madison.systems>
-Date: Thu, 14 Sep 2017 05:38:10 -0700
-Subject: [PATCH 8/8] make.bash: add GOHOSTxx indirection for cross-canadian
- builds
-
-Add environment variables for specifying the host OS/arch
-that we are building the compiler for, so it can differ from
-the build host OS/arch.
-
-Upstream-Status: Pending
-
-Signed-off-by: Matt Madison <matt@madison.systems>
----
- src/make.bash | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/make.bash b/src/make.bash
-index 2e6fb05..0bdadc6 100755
---- a/src/make.bash
-+++ b/src/make.bash
-@@ -173,6 +173,8 @@ if [ "$do_host_build" = "yes" ]; then
- 	echo
- 
- 	GOTOOLDIR_BOOTSTRAP="${GOTOOLDIR_BOOTSTRAP:-$GOTOOLDIR}"
-+	GOHOSTOS="${GOHOSTOS_CROSS:-$GOHOSTOS}"
-+	GOHOSTARCH="${GOHOSTARCH_CROSS:-$GOHOSTARCH}"
- 	echo "##### Building packages and commands for host, $GOHOSTOS/$GOHOSTARCH."
- 	# CC_FOR_TARGET is recorded as the default compiler for the go tool. When building for the host, however,
- 	# use the host compiler, CC, from `cmd/dist/dist env` instead.
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/go/go-1.9/0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch b/meta/recipes-devtools/go/go-1.9/0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch
deleted file mode 100644
index aa5fcfdd23..0000000000
--- a/meta/recipes-devtools/go/go-1.9/0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From aae44527c8065d54f6acaf87c82cba1ac96fae59 Mon Sep 17 00:00:00 2001
-From: Ian Lance Taylor <iant@golang.org>
-Date: Fri, 18 Aug 2017 17:46:03 -0700
-Subject: [PATCH] cmd/go: -buildmode=pie forces external linking mode on all
- systems
-
-The go tool assumed that -buildmode=pie implied internal linking on
-linux-amd64. However, that was changed by CL 36417 for issue #18968.
-
-Fixes #21452
-
-Change-Id: I8ed13aea52959cc5c53223f4c41ba35329445545
-Reviewed-on: https://go-review.googlesource.com/57231
-Run-TryBot: Ian Lance Taylor <iant@golang.org>
-TryBot-Result: Gobot Gobot <gobot@golang.org>
-Reviewed-by: Avelino <t@avelino.xxx>
-Reviewed-by: Rob Pike <r@golang.org>
----
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- src/cmd/go/internal/load/pkg.go | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/src/cmd/go/internal/load/pkg.go b/src/cmd/go/internal/load/pkg.go
-index 2660d3f..d40773b 100644
---- a/src/cmd/go/internal/load/pkg.go
-+++ b/src/cmd/go/internal/load/pkg.go
-@@ -954,11 +954,12 @@ func (p *Package) load(stk *ImportStack, bp *build.Package, err error) *Package
- 
- 	if cfg.BuildContext.CgoEnabled && p.Name == "main" && !p.Goroot {
- 		// Currently build modes c-shared, pie (on systems that do not
--		// support PIE with internal linking mode), plugin, and
--		// -linkshared force external linking mode, as of course does
-+		// support PIE with internal linking mode (currently all
-+		// systems: issue #18968)), plugin, and -linkshared force
-+		// external linking mode, as of course does
- 		// -ldflags=-linkmode=external. External linking mode forces
- 		// an import of runtime/cgo.
--		pieCgo := cfg.BuildBuildmode == "pie" && (cfg.BuildContext.GOOS != "linux" || cfg.BuildContext.GOARCH != "amd64")
-+		pieCgo := cfg.BuildBuildmode == "pie"
- 		linkmodeExternal := false
- 		for i, a := range cfg.BuildLdflags {
- 			if a == "-linkmode=external" {
--- 
-2.14.1
-
diff --git a/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
deleted file mode 100644
index 83fd78c3d7..0000000000
--- a/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 21d83dd9499e5be30eea28dd7034d1ea2a01c838 Mon Sep 17 00:00:00 2001
-From: Matt Madison <matt@madison.systems>
-Date: Tue, 14 Nov 2017 07:38:42 -0800
-Subject: [PATCH 10/10] make.bash: override CC when building dist and
- go_bootstrap
-
-For cross-canadian builds, dist and go_bootstrap
-run on the build host, so CC needs to point to the
-build host's C compiler.  Add a BUILD_CC environment
-for this, falling back to $CC if not present.
-
-Upstream-Status: Pending
-
-Signed-off-by: Matt Madison <matt@madison.systems>
----
- src/make.bash | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/make.bash b/src/make.bash
-index 0bdadc6..f199349 100755
---- a/src/make.bash
-+++ b/src/make.bash
-@@ -131,7 +131,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ]; then
- 	exit 1
- fi
- rm -f cmd/dist/dist
--GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH="" "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
-+CC=${BUILD_CC:-${CC}} GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH="" "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
- 
- # -e doesn't propagate out of eval, so check success by hand.
- eval $(./cmd/dist/dist env -p || echo FAIL=true)
-@@ -167,7 +167,7 @@ elif [ "$1" = "--host-only" ]; then
- fi
- 
- if [ "$do_host_build" = "yes" ]; then
--	./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds go_bootstrap
-+	CC=${BUILD_CC:-${CC}} ./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds go_bootstrap
- 	# Delay move of dist tool to now, because bootstrap may clear tool directory.
- 	mv cmd/dist/dist "$GOTOOLDIR"/dist
- 	echo
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/go/go-1.9/set-external-linker.patch b/meta/recipes-devtools/go/go-1.9/set-external-linker.patch
deleted file mode 100644
index d6bd7fa39c..0000000000
--- a/meta/recipes-devtools/go/go-1.9/set-external-linker.patch
+++ /dev/null
@@ -1,111 +0,0 @@
-Change the dynamic linker hardcoding to use musl when not using glibc
-this should be applied conditional to musl being the system C library
-
-Upstream-Status: Inappropriate [Real Fix should be portable across libcs]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: go/src/cmd/link/internal/amd64/obj.go
-===================================================================
---- go.orig/src/cmd/link/internal/amd64/obj.go
-+++ go/src/cmd/link/internal/amd64/obj.go
-@@ -67,7 +67,7 @@ func Init() {
- 	ld.Thearch.Append64 = ld.Append64l
- 	ld.Thearch.TLSIEtoLE = tlsIEtoLE
- 
--	ld.Thearch.Linuxdynld = "/lib64/ld-linux-x86-64.so.2"
-+	ld.Thearch.Linuxdynld = "/lib/ld-musl-x86_64.so.1"
- 	ld.Thearch.Freebsddynld = "/libexec/ld-elf.so.1"
- 	ld.Thearch.Openbsddynld = "/usr/libexec/ld.so"
- 	ld.Thearch.Netbsddynld = "/libexec/ld.elf_so"
-Index: go/src/cmd/link/internal/arm/obj.go
-===================================================================
---- go.orig/src/cmd/link/internal/arm/obj.go
-+++ go/src/cmd/link/internal/arm/obj.go
-@@ -63,7 +63,7 @@ func Init() {
- 	ld.Thearch.Append32 = ld.Append32l
- 	ld.Thearch.Append64 = ld.Append64l
- 
--	ld.Thearch.Linuxdynld = "/lib/ld-linux.so.3" // 2 for OABI, 3 for EABI
-+	ld.Thearch.Linuxdynld = "/lib/ld-musl-armhf.so.1"
- 	ld.Thearch.Freebsddynld = "/usr/libexec/ld-elf.so.1"
- 	ld.Thearch.Openbsddynld = "/usr/libexec/ld.so"
- 	ld.Thearch.Netbsddynld = "/libexec/ld.elf_so"
-Index: go/src/cmd/link/internal/arm64/obj.go
-===================================================================
---- go.orig/src/cmd/link/internal/arm64/obj.go
-+++ go/src/cmd/link/internal/arm64/obj.go
-@@ -62,7 +62,7 @@ func Init() {
- 	ld.Thearch.Append32 = ld.Append32l
- 	ld.Thearch.Append64 = ld.Append64l
- 
--	ld.Thearch.Linuxdynld = "/lib/ld-linux-aarch64.so.1"
-+	ld.Thearch.Linuxdynld = "/lib/ld-musl-aarch64.so.1"
- 
- 	ld.Thearch.Freebsddynld = "XXX"
- 	ld.Thearch.Openbsddynld = "XXX"
-Index: go/src/cmd/link/internal/mips/obj.go
-===================================================================
---- go.orig/src/cmd/link/internal/mips/obj.go
-+++ go/src/cmd/link/internal/mips/obj.go
-@@ -77,7 +77,7 @@ func Init() {
- 		ld.Thearch.Append64 = ld.Append64b
- 	}
- 
--	ld.Thearch.Linuxdynld = "/lib/ld.so.1"
-+	ld.Thearch.Linuxdynld = "/lib/ld-musl-mipsle.so.1"
- 
- 	ld.Thearch.Freebsddynld = "XXX"
- 	ld.Thearch.Openbsddynld = "XXX"
-Index: go/src/cmd/link/internal/mips64/obj.go
-===================================================================
---- go.orig/src/cmd/link/internal/mips64/obj.go
-+++ go/src/cmd/link/internal/mips64/obj.go
-@@ -75,7 +75,7 @@ func Init() {
- 		ld.Thearch.Append64 = ld.Append64b
- 	}
- 
--	ld.Thearch.Linuxdynld = "/lib64/ld64.so.1"
-+	ld.Thearch.Linuxdynld = "/lib64/ld-musl-mips64le.so.1"
- 
- 	ld.Thearch.Freebsddynld = "XXX"
- 	ld.Thearch.Openbsddynld = "XXX"
-Index: go/src/cmd/link/internal/ppc64/obj.go
-===================================================================
---- go.orig/src/cmd/link/internal/ppc64/obj.go
-+++ go/src/cmd/link/internal/ppc64/obj.go
-@@ -77,7 +77,7 @@ func Init() {
- 	}
- 
- 	// TODO(austin): ABI v1 uses /usr/lib/ld.so.1
--	ld.Thearch.Linuxdynld = "/lib64/ld64.so.1"
-+	ld.Thearch.Linuxdynld = "/lib/ld-musl-powerpc64le.so.1"
- 
- 	ld.Thearch.Freebsddynld = "XXX"
- 	ld.Thearch.Openbsddynld = "XXX"
-Index: go/src/cmd/link/internal/s390x/obj.go
-===================================================================
---- go.orig/src/cmd/link/internal/s390x/obj.go
-+++ go/src/cmd/link/internal/s390x/obj.go
-@@ -62,7 +62,7 @@ func Init() {
- 	ld.Thearch.Append32 = ld.Append32b
- 	ld.Thearch.Append64 = ld.Append64b
- 
--	ld.Thearch.Linuxdynld = "/lib64/ld64.so.1"
-+	ld.Thearch.Linuxdynld = "/lib/ld-musl-s390x.so.1"
- 
- 	// not relevant for s390x
- 	ld.Thearch.Freebsddynld = "XXX"
-Index: go/src/cmd/link/internal/x86/obj.go
-===================================================================
---- go.orig/src/cmd/link/internal/x86/obj.go
-+++ go/src/cmd/link/internal/x86/obj.go
-@@ -63,7 +63,7 @@ func Init() {
- 	ld.Thearch.Append32 = ld.Append32l
- 	ld.Thearch.Append64 = ld.Append64l
- 
--	ld.Thearch.Linuxdynld = "/lib/ld-linux.so.2"
-+	ld.Thearch.Linuxdynld = "/lib/ld-musl-i386.so.1"
- 	ld.Thearch.Freebsddynld = "/usr/libexec/ld-elf.so.1"
- 	ld.Thearch.Openbsddynld = "/usr/libexec/ld.so"
- 	ld.Thearch.Netbsddynld = "/usr/libexec/ld.elf_so"
diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index 37138b51ed..611775b2cc 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -22,6 +22,8 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.src\.tar"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 SSTATE_SCAN_CMD = "true"
 
+export GOROOT_OVERRIDE = "1"
+
 do_compile_prepend() {
 	BUILD_CC=${BUILD_CC}
 }
diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc b/meta/recipes-devtools/go/go-cross-canadian.inc
index 8afda6b2ce..c84aa4c9eb 100644
--- a/meta/recipes-devtools/go/go-cross-canadian.inc
+++ b/meta/recipes-devtools/go/go-cross-canadian.inc
@@ -7,34 +7,34 @@ PN = "go-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
 export GOHOSTOS = "${BUILD_GOOS}"
 export GOHOSTARCH = "${BUILD_GOARCH}"
-export GOHOSTOS_CROSS = "${HOST_GOOS}"
-export GOHOSTARCH_CROSS = "${HOST_GOARCH}"
 export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
 export GOTOOLDIR_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/${HOST_SYS}/go/pkg/tool/${BUILD_GOTUPLE}"
 export GOROOT_FINAL = "${libdir}/go"
 export CGO_ENABLED = "1"
-export CC_FOR_TARGET = "${TARGET_PREFIX}gcc"
-export CXX_FOR_TARGET = "${TARGET_PREFIX}g++"
-CC = "${HOST_PREFIX}gcc"
-export CGO_CFLAGS = "--sysroot=${STAGING_DIR_TARGET} ${HOST_CC_ARCH} ${CFLAGS}"
-export CGO_LDFLAGS = "--sysroot=${STAGING_DIR_TARGET} ${HOST_CC_ARCH} ${LDFLAGS}"
-export GO_LDFLAGS = '-linkmode external -extld ${HOST_PREFIX}gcc -extldflags "--sysroot=${STAGING_DIR_TARGET} ${HOST_CC_ARCH} ${LDFLAGS}"'
+export GOCACHE = "off"
+export GOTMPDIR ?= "${WORKDIR}/go-tmp"
+GOTMPDIR[vardepvalue] = ""
+#CC = "${HOST_PREFIX}gcc"
+export CGO_CFLAGS = "${CFLAGS}"
+export CGO_LDFLAGS = "${LDFLAGS}"
+export GO_LDFLAGS = '-v -linkmode external -extld ${HOST_PREFIX}gcc -extldflags "--sysroot=${STAGING_DIR_HOST} ${HOST_CC_ARCH} ${LDFLAGS}"'
 
 do_configure[noexec] = "1"
 
 do_compile() {
-	export GOBIN="${B}/bin"
-	rm -rf ${GOBIN} ${B}/pkg
-	mkdir ${GOBIN}
+	export CC_FOR_${HOST_GOOS}_${HOST_GOARCH}="${HOST_PREFIX}gcc --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE}"
+	export CXX_FOR_${HOST_GOOS}_${HOST_GOARCH}="${HOST_PREFIX}gxx --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE}"
 	cd src
 	./make.bash --host-only --no-banner
 	cd ${B}
 }
+do_compile[dirs] =+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
+do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin ${B}/pkg"
 
 
 make_wrapper() {
-    rm -f ${D}${bindir}/$2
-    cat <<END >${D}${bindir}/$2
+	rm -f ${D}${bindir}/$2
+	cat <<END >${D}${bindir}/$2
 #!/bin/sh
 here=\`dirname \$0\`
 native_goroot=\`readlink -f \$here/../../lib/${TARGET_SYS}/go\`
@@ -46,7 +46,7 @@ export GOTOOLDIR="\$native_goroot/pkg/tool/${HOST_GOTUPLE}"
 test -n "\$GOROOT" || export GOROOT="\$OECORE_TARGET_SYSROOT/${target_libdir}/go"
 \$here/../../lib/${TARGET_SYS}/go/bin/$1 "\$@"
 END
-    chmod +x ${D}${bindir}/$2
+	chmod +x ${D}${bindir}/$2
 }
 
 do_install() {
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.9.bb b/meta/recipes-devtools/go/go-cross-canadian_1.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.9.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.10.bb
diff --git a/meta/recipes-devtools/go/go-cross.inc b/meta/recipes-devtools/go/go-cross.inc
index 3ac7211bc3..fe92651581 100644
--- a/meta/recipes-devtools/go/go-cross.inc
+++ b/meta/recipes-devtools/go/go-cross.inc
@@ -1,7 +1,7 @@
 inherit cross
 
 PROVIDES = "virtual/${TARGET_PREFIX}go"
-DEPENDS += "go-native"
+DEPENDS = "go-native"
 
 PN = "go-cross-${TARGET_ARCH}"
 
@@ -13,26 +13,27 @@ export GOARM = "${TARGET_GOARM}"
 export GO386 = "${TARGET_GO386}"
 export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
 export GOROOT_FINAL = "${libdir}/go"
+export GOCACHE = "off"
+export GOTMPDIR ?= "${WORKDIR}/go-tmp"
+GOTMPDIR[vardepvalue] = ""
 export CGO_ENABLED = "1"
-export CC_FOR_TARGET="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
-export CXX_FOR_TARGET="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
 CC = "${@d.getVar('BUILD_CC').strip()}"
 
 do_configure[noexec] = "1"
 
 do_compile() {
-    export GOBIN="${B}/bin"
-    rm -rf ${GOBIN} ${B}/pkg
-    mkdir ${GOBIN}
-    cd src
-    ./make.bash --host-only
-    cd ${B}
+	export CC_FOR_${GOOS}_${GOARCH}="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
+	export CXX_FOR_${GOOS}_${GOARCh}="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
+	cd src
+	./make.bash --host-only --no-banner
+	cd ${B}
 }
-
+do_compile[dirs] =+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
+do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin ${B}/pkg"
 
 make_wrapper() {
-    rm -f ${D}${bindir}/$2
-    cat <<END >${D}${bindir}/$2
+	rm -f ${D}${bindir}/$2
+	cat <<END >${D}${bindir}/$2
 #!/bin/bash
 here=\`dirname \$0\`
 export GOARCH="${TARGET_GOARCH}"
@@ -41,22 +42,22 @@ export GOARM="\${GOARM:-${TARGET_GOARM}}"
 export GO386="\${GO386:-${TARGET_GO386}}"
 \$here/../../lib/${CROSS_TARGET_SYS_DIR}/go/bin/$1 "\$@"
 END
-    chmod +x ${D}${bindir}/$2
+	chmod +x ${D}${bindir}/$2
 }
 
 do_install() {
-    install -d ${D}${libdir}/go
-    cp --preserve=mode,timestamps -R ${B}/pkg ${D}${libdir}/go/
-    install -d ${D}${libdir}/go/src
-    (cd ${S}/src; for d in *; do \
-        [ ! -d $d ] || cp --preserve=mode,timestamps -R ${S}/src/$d ${D}${libdir}/go/src/; \
-    done)
-    rm -rf ${D}${libdir}/go/src/runtime/pprof/testdata
-    install -d ${D}${bindir} ${D}${libdir}/go/bin
-    for f in ${B}/bin/*
-    do
-        base=`basename $f`
-        install -m755 $f ${D}${libdir}/go/bin
-        make_wrapper $base ${TARGET_PREFIX}$base
-    done
+	install -d ${D}${libdir}/go
+	cp --preserve=mode,timestamps -R ${B}/pkg ${D}${libdir}/go/
+	install -d ${D}${libdir}/go/src
+	(cd ${S}/src; for d in *; do \
+		[ ! -d $d ] || cp --preserve=mode,timestamps -R ${S}/src/$d ${D}${libdir}/go/src/; \
+	done)
+	find ${D}${libdir}/go/src -depth -type d -name testdata -exec rm -rf {} \;
+	install -d ${D}${bindir} ${D}${libdir}/go/bin
+	for f in ${B}/bin/*
+	do
+		base=`basename $f`
+		install -m755 $f ${D}${libdir}/go/bin
+		make_wrapper $base ${TARGET_PREFIX}$base
+	done
 }
diff --git a/meta/recipes-devtools/go/go-cross_1.9.bb b/meta/recipes-devtools/go/go-cross_1.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.9.bb
rename to meta/recipes-devtools/go/go-cross_1.10.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk.inc b/meta/recipes-devtools/go/go-crosssdk.inc
index f67e4b92a0..05ca62eba8 100644
--- a/meta/recipes-devtools/go/go-crosssdk.inc
+++ b/meta/recipes-devtools/go/go-crosssdk.inc
@@ -11,21 +11,21 @@ export GOARCH = "${TARGET_GOARCH}"
 export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
 export GOROOT_FINAL = "${libdir}/go"
 export CGO_ENABLED = "1"
-export CC_FOR_TARGET="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}${SDKPATHNATIVE}"
-export CXX_FOR_TARGET="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}${SDKPATHNATIVE}"
-export GO_INSTALL = "cmd"
-CC = "${@d.getVar('BUILD_CC').strip()}"
+export GOCACHE = "off"
+export GOTMPDIR ?= "${WORKDIR}/go-tmp"
+GOTMPDIR[vardepvalue] = ""
 
 do_configure[noexec] = "1"
 
 do_compile() {
-	export GOBIN="${B}/bin"
-	rm -rf ${GOBIN} ${B}/pkg
-	mkdir ${GOBIN}
+	export CC_FOR_${TARGET_GOOS}_${TARGET_GOARCH}="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}${SDKPATHNATIVE}"
+	export CXX_FOR_${TARGET_GOOS}_${TARGET_GOARCH}="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}${SDKPATHNATIVE}"
 	cd src
-	./make.bash --host-only
+	./make.bash --host-only --no-banner
 	cd ${B}
 }
+do_compile[dirs] =+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
+do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin ${B}/pkg"
 
 make_wrapper() {
     rm -f ${D}${bindir}/$2
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.9.bb b/meta/recipes-devtools/go/go-crosssdk_1.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.9.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.10.bb
diff --git a/meta/recipes-devtools/go/go-native.inc b/meta/recipes-devtools/go/go-native.inc
index 95db1c2b7c..31e899da82 100644
--- a/meta/recipes-devtools/go/go-native.inc
+++ b/meta/recipes-devtools/go/go-native.inc
@@ -4,34 +4,33 @@ nonstaging_libdir := "${libdir}"
 
 inherit native
 
-SRC_URI_append = " http://golang.org/dl/go1.4.3.src.tar.gz;name=bootstrap;subdir=go1.4"
-SRC_URI[bootstrap.md5sum] = "dfb604511115dd402a77a553a5923a04"
-SRC_URI[bootstrap.sha256sum] = "9947fc705b0b841b5938c48b22dc33e9647ec0752bae66e50278df4f23f64959"
+SRC_URI_append = " https://dl.google.com/go/go1.4-bootstrap-20171003.tar.gz;name=bootstrap;subdir=go1.4"
+SRC_URI[bootstrap.md5sum] = "dbf727a4b0e365bf88d97cbfde590016"
+SRC_URI[bootstrap.sha256sum] = "f4ff5b5eb3a3cae1c993723f3eab519c5bae18866b5e5f96fe1102f0cb5c3e52"
 
 export GOOS = "${BUILD_GOOS}"
 export GOARCH = "${BUILD_GOARCH}"
+export GOTMPDIR ?= "${WORKDIR}/go-tmp"
+GOTMPDIR[vardepvalue] = ""
 CC = "${@d.getVar('BUILD_CC').strip()}"
 
 export CGO_ENABLED = "1"
 
 do_configure() {
-    cd ${WORKDIR}/go1.4/go/src
-    CGO_ENABLED=0 GOROOT=${WORKDIR}/go1.4/go ./make.bash
+	cd ${WORKDIR}/go1.4/go/src
+	CGO_ENABLED=0 GOROOT=${WORKDIR}/go1.4/go ./make.bash
 }
 
 do_compile() {
-	export GOBIN="${B}/bin"
 	export GOROOT_FINAL="${nonstaging_libdir}/go"
 	export GOROOT_BOOTSTRAP="${WORKDIR}/go1.4/go"
-	rm -rf ${GOBIN}
-	mkdir ${GOBIN}
-
-	export TMPDIR=${WORKDIR}/build-tmp
-	mkdir -p ${WORKDIR}/build-tmp
 
 	cd src
-	./make.bash --host-only
+	./make.bash --no-banner
+	cd ${B}
 }
+do_compile[dirs] =+ "${GOTMPDIR} ${B}/bin"
+do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin"
 
 make_wrapper() {
 	rm -f ${D}${bindir}/$2$3
@@ -51,7 +50,7 @@ do_install() {
 	(cd ${S}/src; for d in *; do \
 		[ -d $d ] && cp -a ${S}/src/$d ${D}${libdir}/go/src/; \
 	done)
-	rm -rf ${D}${libdir}/go/src/runtime/pprof/testdata
+	find ${D}${libdir}/go/src -depth -type d -name testdata -exec rm -rf {} \;
 	install -d ${D}${bindir} ${D}${libdir}/go/bin
 	for f in ${B}/bin/*
 	do
diff --git a/meta/recipes-devtools/go/go-native_1.9.bb b/meta/recipes-devtools/go/go-native_1.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.9.bb
rename to meta/recipes-devtools/go/go-native_1.10.bb
diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devtools/go/go-runtime.inc
index 29ae86e4ee..7a3b415b3f 100644
--- a/meta/recipes-devtools/go/go-runtime.inc
+++ b/meta/recipes-devtools/go/go-runtime.inc
@@ -10,11 +10,18 @@ export GOARM = "${TARGET_GOARM}"
 export GO386 = "${TARGET_GO386}"
 export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
 export GOROOT_FINAL = "${libdir}/go"
-export GO_TARGET_INSTALL = "std"
 export CGO_ENABLED = "1"
-export CC_FOR_TARGET="${CC}"
-export CXX_FOR_TARGET="${CXX}"
-export GOROOT_OVERRIDE = "1"
+export CGO_CFLAGS = "${CFLAGS}"
+export CGO_CPPFLAGS = "${CPPFLAGS}"
+export CGO_CXXFLAGS = "${CXXFLAGS}"
+export CGO_LDFLAGS = "${LDFLAGS}"
+export GOCACHE = "off"
+export GOTMPDIR ?= "${WORKDIR}/go-tmp"
+GOTMPDIR[vardepvalue] = ""
+GO_EXTLDFLAGS ?= "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${LDFLAGS}"
+GO_LINKMODE ?= ""
+GO_LINKMODE_class-nativesdk = "--linkmode=external"
+GO_LDFLAGS ?= '-ldflags="${GO_LINKMODE} -extldflags '${GO_EXTLDFLAGS}'"'
 
 do_configure() {
 	:
@@ -25,21 +32,20 @@ do_configure_libc-musl() {
 }
 
 do_compile() {
-	export GOBIN="${B}/bin"
-	export CC="${@d.getVar('BUILD_CC').strip()}"
-	rm -rf ${GOBIN} ${B}/pkg
-	mkdir ${GOBIN}
+	export CC_FOR_${TARGET_GOOS}_${TARGET_GOARCH}="${CC}"
+	export CXX_FOR_${TARGET_GOOS}_${TARGET_GOARCH}="${CXX}"
+
 	cd src
-	./make.bash --host-only
-	cp ${B}/pkg/tool/${BUILD_GOTUPLE}/go_bootstrap ${B}
-	rm -rf ${B}/pkg/${TARGET_GOTUPLE}
-	./make.bash --target-only
+	./make.bash --target-only --no-banner std
 	if [ -n "${GO_DYNLINK}" ]; then
-		cp ${B}/go_bootstrap ${B}/pkg/tool/${BUILD_GOTUPLE}
-		GO_FLAGS="-buildmode=shared" GO_LDFLAGS="-extldflags \"${LDFLAGS}\"" ./make.bash --target-only
+		export GOTOOLDIR="${B}/pkg/tool/native_native"
+		CC="$CC_FOR_${TARGET_GOOS}_${TARGET_GOARCH}" GOARCH="${TARGET_GOARCH}" GOOS="${TARGET_GOOS}" GOROOT=${B} \
+			$GOTOOLDIR/go_bootstrap install -linkshared -buildmode=shared ${GO_LDFLAGS} std
 	fi
 	cd ${B}
 }
+do_compile[dirs] =+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
+do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin ${B}/pkg"
 
 do_install() {
 	install -d ${D}${libdir}/go/src
@@ -54,20 +60,10 @@ do_install() {
 	find src -mindepth 1 -maxdepth 1 -type d | while read srcdir; do
 		cp --preserve=mode,timestamps -R $srcdir ${D}${libdir}/go/src/
 	done
+	find ${D}${libdir}/go/src -depth -type d -name testdata -exec rm -rf {} \;
 	rm -f ${D}${libdir}/go/src/cmd/dist/dist
 }
 
-# Remove test binaries that cannot be relocated
-do_install_append_class-nativesdk() {
-	rm -rf ${D}${libdir}/go/src/runtime/pprof/testdata
-}
-
-# These testdata directories aren't needed for builds and contain binaries
-# that can cause errors in sysroot_strip(), so just remove them.
-sysroot_stage_all_append() {
-	find ${SYSROOT_DESTDIR}${libdir}/go/src -depth -type d -name 'testdata' -exec rm -rf {} \;
-}
-
 ALLOW_EMPTY_${PN} = "1"
 FILES_${PN} = "${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*${SOLIBSDEV}"
 FILES_${PN}-dev = "${libdir}/go/src ${libdir}/go/pkg/include \
@@ -78,8 +74,6 @@ FILES_${PN}-dev = "${libdir}/go/src ${libdir}/go/pkg/include \
                    ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*.shlibname \
                    ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*/*.shlibname \
                    ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*/*/*.shlibname \
-"
-FILES_${PN}-staticdev = "${libdir}/go/pkg/${TARGET_GOTUPLE} \
                    ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*.a \
                    ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*.a \
                    ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*.a \
@@ -88,11 +82,15 @@ FILES_${PN}-staticdev = "${libdir}/go/pkg/${TARGET_GOTUPLE} \
                    ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*/*.a \
                    ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*/*/*.a \
 "
-# The testdata directories in the source tree include some binaries for various
-# architectures, scripts, and .a files
-INSANE_SKIP_${PN}-dev = "staticdev ldflags file-rdeps arch"
+FILES_${PN}-staticdev = "${libdir}/go/pkg/${TARGET_GOTUPLE}"
+
+# Go sources include some scripts and pre-built binaries for
+# multiple architectures.  The static .a files for dynamically-linked
+# runtime are also required in -dev.
+INSANE_SKIP_${PN}-dev = "staticdev file-rdeps arch"
 
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+INHIBIT_SYSROOT_STRIP = "1"
 
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/go/go-runtime_1.9.bb b/meta/recipes-devtools/go/go-runtime_1.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.9.bb
rename to meta/recipes-devtools/go/go-runtime_1.10.bb
diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/recipes-devtools/go/go-target.inc
index cac5d78227..a53a314c78 100644
--- a/meta/recipes-devtools/go/go-target.inc
+++ b/meta/recipes-devtools/go/go-target.inc
@@ -11,10 +11,9 @@ export GO386 = "${TARGET_GO386}"
 export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
 export GOROOT_FINAL = "${libdir}/go"
 export CGO_ENABLED = "1"
-export CC_FOR_TARGET = "${CC}"
-export CXX_FOR_TARGET = "${CXX}"
-export GO_TARGET_INSTALL = "cmd"
-export GO_FLAGS = "-a"
+export GOCACHE = "off"
+export GOTMPDIR ?= "${WORKDIR}/go-tmp"
+GOTMPDIR[vardepvalue] = ""
 GO_LDFLAGS = ""
 GO_LDFLAGS_class-nativesdk = "-linkmode external"
 export GO_LDFLAGS
@@ -25,24 +24,22 @@ SECURITY_LDFLAGS = ""
 do_configure[noexec] = "1"
 
 do_compile() {
-	export GOBIN="${B}/bin"
-	export CC="${@d.getVar('BUILD_CC').strip()}"
-	rm -rf ${GOBIN} ${B}/pkg
-	mkdir ${GOBIN}
-
-	export TMPDIR=${WORKDIR}/build-tmp
-	mkdir -p ${WORKDIR}/build-tmp
+	export CC_FOR_${TARGET_GOOS}_${TARGET_GOARCH}="${CC}"
+	export CXX_FOR_${TARGET_GOOS}_${TARGET_GOARCH}="${CXX}"
 
 	cd src
-	./make.bash
+	./make.bash --target-only --no-banner
 	cd ${B}
 }
+do_compile[dirs] =+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
+do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin ${B}/pkg"
 
 do_install() {
 	install -d ${D}${libdir}/go/pkg/tool
 	cp --preserve=mode,timestamps -R ${B}/pkg/tool/${TARGET_GOTUPLE} ${D}${libdir}/go/pkg/tool/
 	install -d ${D}${libdir}/go/src
 	cp --preserve=mode,timestamps -R ${S}/src/cmd ${D}${libdir}/go/src/
+	find ${D}${libdir}/go/src -depth -type d -name testdata -exec rm -rf {} \;
 	install -d ${D}${libdir}/go/bin
 	install -d ${D}${bindir}
 	for f in ${B}/${GO_BUILD_BINDIR}/*; do
diff --git a/meta/recipes-devtools/go/go_1.9.bb b/meta/recipes-devtools/go/go_1.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.9.bb
rename to meta/recipes-devtools/go/go_1.10.bb
-- 
2.14.1


