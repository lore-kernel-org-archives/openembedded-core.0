Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5ABCD7CD92
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Mar 2019 00:11:06 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id 196so12586098pgf.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2019 16:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=CqxKOLQinBZiorqTE+VP212D+EVcPfmbW7HL0hONf98=;
	b=Zd/OoK6GkCVmdByl+YK6BoTKCpf9ne3RIGeWbXIcCBuHjBDTOMyZm9hcaaG/7MwQPc
	FUgpxiY2wf+bO4lLvyHlNMZKLSUEcaBL7ixQBOuEr7SDHIXjuLyMCnuwCW2K6w3ke9Ao
	KzOryYFiyzJJmdDefDeWQ0YHkv2pQ/WdWBfWyWCEDzGFCCnonYra3CYeQnG2Nn2AhdkC
	ZDmw1PqWksVXC8Tw6O9Q12OK8khueeh55DdJEng0oTrlwhga+5f4wXZxac1QdNZFlrJl
	Xi0ur++x7yCEH60StJs5882UYrMrfaJ1lTI8ir7l0igNeHi1ARZKXfuMaYREKzlAbn9f
	KLUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CqxKOLQinBZiorqTE+VP212D+EVcPfmbW7HL0hONf98=;
	b=uSYH0pdzG12s7Pstn+3uwjUM9lPiduAh1RVfGaS4H+5A3frBNoDcLdchv4QN+DFAKx
	2e83V2BxzLJirfrxrFAD9wKvbyMpKhq207CLZBMZYU2Hx6KdDpl96vTGtbqKOKRS6tUn
	9i4NP3SZP6Pd5Z9i5OednDg22JLEgunVVseHshQzROBWtKk9SLUpPY5rGThoAMB/3A2e
	qpWa7aAegCj8Ay5+iPLGX0bXrH6Pvw+iqnmTEtPcTT6GEiURaiqDSrPjbGemLugWpeJ8
	0/2L4urVmZt2O+K7w96FCxRo97ng7JXvLddUvCVy95+K6wJMH17YuD+cgp25VqOBVHGM
	BJhw==
X-Gm-Message-State: APjAAAW1MDvK3rJYLm2EhPcoO2nNI08vFXtBKd7J+FKqfqeF1gUfZZRo
	Y9KTQMk7c3qimRguBpPzmUuvwOgN
X-Google-Smtp-Source: APXvYqybFNwetptWgYJVQ8bgQaX3YTl9ykRBnjwQUAGIOTxQ7Wva6sJqhj6NpQBeoLT1Z3SXmvt1Qw==
X-Received: by 2002:a17:902:2947:: with SMTP id
	g65mr15614561plb.258.1552003866369; 
	Thu, 07 Mar 2019 16:11:06 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3401])
	by smtp.gmail.com with ESMTPSA id
	p14sm22139496pgn.34.2019.03.07.16.11.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Mar 2019 16:11:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Mar 2019 16:10:56 -0800
Message-Id: <20190308001056.7610-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190308001056.7610-1-raj.khem@gmail.com>
References: <20190308001056.7610-1-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: Avelino <t@avelino.xxx>, Rob Pike <r@golang.org>
Subject: [PATCH v3 2/2] go-1.9: Drop the recipes
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
X-List-Received-Date: Fri, 08 Mar 2019 00:11:06 -0000
Content-Transfer-Encoding: 8bit

We now have 1.11 and 1.12

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebased ( no changes )
v3: Remove remaining 1.9 recipe files

 meta/recipes-devtools/go/go-1.9.inc           |  27 -----
 .../0001-make.bash-quote-CC_FOR_TARGET.patch  |  32 -----
 ...d-CXX-environment-variable-construct.patch |  67 -----------
 ...tter-separate-host-and-target-builds.patch |  92 ---------------
 ...OOLDIR-to-be-overridden-in-the-envir.patch |  68 -----------
 ...d-go-make-GOROOT-precious-by-default.patch |  41 -------
 ...TOOLDIR_BOOTSTRAP-environment-variab.patch |  36 ------
 ...7-ld-add-soname-to-shareable-objects.patch |  46 --------
 ...HOSTxx-indirection-for-cross-canadia.patch |  33 ------
 ...-pie-forces-external-linking-mode-on.patch |  47 --------
 ...de-CC-when-building-dist-and-go_boot.patch |  43 -------
 ...011-use-GOBUILDMODE-to-set-buildmode.patch |  40 -------
 .../go/go-1.9/set-external-linker.patch       | 111 ------------------
 .../go/go-cross-canadian_1.9.bb               |  12 --
 meta/recipes-devtools/go/go-cross_1.9.bb      |  10 --
 meta/recipes-devtools/go/go-crosssdk_1.9.bb   |  11 --
 meta/recipes-devtools/go/go-native_1.9.bb     |   4 -
 meta/recipes-devtools/go/go-runtime_1.9.bb    |  23 ----
 meta/recipes-devtools/go/go_1.9.bb            |  28 -----
 19 files changed, 771 deletions(-)
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
 delete mode 100644 meta/recipes-devtools/go/go-1.9/0011-use-GOBUILDMODE-to-set-buildmode.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9/set-external-linker.patch
 delete mode 100644 meta/recipes-devtools/go/go-cross-canadian_1.9.bb
 delete mode 100644 meta/recipes-devtools/go/go-cross_1.9.bb
 delete mode 100644 meta/recipes-devtools/go/go-crosssdk_1.9.bb
 delete mode 100644 meta/recipes-devtools/go/go-native_1.9.bb
 delete mode 100644 meta/recipes-devtools/go/go-runtime_1.9.bb
 delete mode 100644 meta/recipes-devtools/go/go_1.9.bb

diff --git a/meta/recipes-devtools/go/go-1.9.inc b/meta/recipes-devtools/go/go-1.9.inc
deleted file mode 100644
index ba1eaa051a..0000000000
--- a/meta/recipes-devtools/go/go-1.9.inc
+++ /dev/null
@@ -1,27 +0,0 @@
-require go-common.inc
-
-GO_BASEVERSION = "1.9"
-GO_MINOR = ".7"
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
-        file://0011-use-GOBUILDMODE-to-set-buildmode.patch \
-"
-SRC_URI_append_libc-musl = " file://set-external-linker.patch"
-
-SRC_URI[main.md5sum] = "3c2cf876ed6612a022574a565206c6ea"
-SRC_URI[main.sha256sum] = "582814fa45e8ecb0859a208e517b48aa0ad951e3b36c7fff203d834e0ef27722"
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
diff --git a/meta/recipes-devtools/go/go-1.9/0011-use-GOBUILDMODE-to-set-buildmode.patch b/meta/recipes-devtools/go/go-1.9/0011-use-GOBUILDMODE-to-set-buildmode.patch
deleted file mode 100644
index da93dc5c14..0000000000
--- a/meta/recipes-devtools/go/go-1.9/0011-use-GOBUILDMODE-to-set-buildmode.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From b928fafab1d9425aae9341806bd2f6178ba1da1f Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 26 Oct 2018 16:32:50 +0800
-Subject: [PATCH] use GOBUILDMODE to set buildmode
-
-While building go itself, the go build system does not support
-to set `-buildmode=pie' from environment.
-
-Add GOBUILDMODE to support it which make PIE executables the default
-build mode, as PIE executables are required as of Yocto
-
-Refers: https://groups.google.com/forum/#!topic/golang-dev/gRCe5URKewI
-Upstream-Status: Denied [upstream choose antoher solution: `17a256b
-cmd/go: -buildmode=pie for android/arm']
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- src/cmd/go/internal/work/build.go | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/work/build.go
-index b276de5..1683e7e 100644
---- a/src/cmd/go/internal/work/build.go
-+++ b/src/cmd/go/internal/work/build.go
-@@ -211,7 +211,11 @@ func AddBuildFlags(cmd *base.Command) {
- 
- 	cmd.Flag.Var((*base.StringsFlag)(&buildAsmflags), "asmflags", "")
- 	cmd.Flag.Var(buildCompiler{}, "compiler", "")
--	cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode", "default", "")
-+	if bm := os.Getenv("GOBUILDMODE"); bm != "" {
-+		cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode", bm, "")
-+	} else {
-+		cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode", "default", "")
-+	}
- 	cmd.Flag.Var((*base.StringsFlag)(&buildGcflags), "gcflags", "")
- 	cmd.Flag.Var((*base.StringsFlag)(&buildGccgoflags), "gccgoflags", "")
- 	cmd.Flag.StringVar(&cfg.BuildContext.InstallSuffix, "installsuffix", "", "")
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
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.9.bb b/meta/recipes-devtools/go/go-cross-canadian_1.9.bb
deleted file mode 100644
index 367a967056..0000000000
--- a/meta/recipes-devtools/go/go-cross-canadian_1.9.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require go-cross-canadian.inc
-require go-${PV}.inc
-
-export GOHOSTOS_CROSS = "${HOST_GOOS}"
-export GOHOSTARCH_CROSS = "${HOST_GOARCH}"
-export CC_FOR_TARGET = "${HOST_PREFIX}gcc --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE} ${SECURITY_NOPIE_CFLAGS}"
-export CXX_FOR_TARGET = "${HOST_PREFIX}g++ --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE} ${SECURITY_NOPIE_CFLAGS}"
-
-do_compile_prepend() {
-	export GOBIN="${B}/bin"
-	export TMPDIR="$GOTMPDIR"
-}
diff --git a/meta/recipes-devtools/go/go-cross_1.9.bb b/meta/recipes-devtools/go/go-cross_1.9.bb
deleted file mode 100644
index 4739c7d5c4..0000000000
--- a/meta/recipes-devtools/go/go-cross_1.9.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require go-cross.inc
-require go-${PV}.inc
-
-export CC_FOR_TARGET = "${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
-export CXX_FOR_TARGET = "${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
-
-do_compile_prepend() {
-	export GOBIN="${B}/bin"
-	export TMPDIR="$GOTMPDIR"
-}
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.9.bb b/meta/recipes-devtools/go/go-crosssdk_1.9.bb
deleted file mode 100644
index 3ac629bd41..0000000000
--- a/meta/recipes-devtools/go/go-crosssdk_1.9.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require go-crosssdk.inc
-require go-${PV}.inc
-
-export CC_FOR_TARGET = "${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
-export CXX_FOR_TARGET = "${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
-export GO_INSTALL = "cmd"
-
-do_compile_prepend() {
-	export GOBIN="${B}/bin"
-	export TMPDIR="$GOTMPDIR"
-}
diff --git a/meta/recipes-devtools/go/go-native_1.9.bb b/meta/recipes-devtools/go/go-native_1.9.bb
deleted file mode 100644
index 8621e1df32..0000000000
--- a/meta/recipes-devtools/go/go-native_1.9.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require ${PN}.inc
-require go-${PV}.inc
-
-GOMAKEARGS = "--host-only --no-banner"
diff --git a/meta/recipes-devtools/go/go-runtime_1.9.bb b/meta/recipes-devtools/go/go-runtime_1.9.bb
deleted file mode 100644
index d5279ea897..0000000000
--- a/meta/recipes-devtools/go/go-runtime_1.9.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-require go-${PV}.inc
-require go-runtime.inc
-
-export GO_TARGET_INSTALL = "std"
-export CC_FOR_TARGET = "${CC}"
-export CXX_FOR_TARGET = "${CXX}"
-
-do_compile() {
-	export GOBIN="${B}/bin"
-	export TMPDIR="$GOTMPDIR"
-	export CC=$BUILD_CC
-
-	cd src
-	CGO_CFLAGS="${BUILD_CFLAGS}" CGO_LDFLAGS="${BUILD_LDFLAGS}" ./make.bash --host-only
-	cp ${B}/pkg/tool/${BUILD_GOTUPLE}/go_bootstrap ${B}
-	rm -rf ${B}/pkg/${TARGET_GOTUPLE}
-	./make.bash --target-only
-	if [ -n "${GO_DYNLINK}" ]; then
-		cp ${B}/go_bootstrap ${B}/pkg/tool/${BUILD_GOTUPLE}
-		GO_FLAGS="-buildmode=shared" GO_LDFLAGS="-extldflags \"${LDFLAGS}\"" ./make.bash --target-only
-	fi
-	cd ${B}
-}
diff --git a/meta/recipes-devtools/go/go_1.9.bb b/meta/recipes-devtools/go/go_1.9.bb
deleted file mode 100644
index c23ea0c1ae..0000000000
--- a/meta/recipes-devtools/go/go_1.9.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-require go-${PV}.inc
-require go-target.inc
-
-export GO_TARGET_INSTALL = "cmd"
-export GO_FLAGS = "-a"
-export CC_FOR_TARGET = "${CC}"
-export CXX_FOR_TARGET = "${CXX}"
-export GOBUILDMODE=""
-
-do_compile() {
-	export GOBIN="${B}/bin"
-	export TMPDIR="$GOTMPDIR"
-	export CC=$BUILD_CC
-
-	cd src
-	./make.bash
-	cd ${B}
-}
-
-# Add pie to GOBUILDMODE to satisfy "textrel" QA checking, but mips
-# doesn't support -buildmode=pie, so skip the QA checking for mips and its
-# variants.
-python() {
-    if 'mips' in d.getVar('TARGET_ARCH'):
-        d.appendVar('INSANE_SKIP_%s' % d.getVar('PN'), " textrel")
-    else:
-        d.setVar('GOBUILDMODE', 'pie')
-}
-- 
2.21.0


