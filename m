Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E06C3F6B0
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:38:56 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.22580.1659940733923775125
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:38:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O9HlY4ag;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id z2so10104769edc.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rEuqPeKgdCBSAB96EjsVVTE05/qOuUt5EH3pe/qjmN0=;
        b=O9HlY4agtDpxTRVeslkSjBHgXHfpd9d0gaGf96y+H4p868fqNeO0/qs8TG5UgPXxwE
         NZmotHuiUUjQxbBo7+8Y7wQAH85810Lnl8BDp4sV9I8HLPgxUZJLekaruvEP9WxxRz5q
         YlgVtQfyyIu5QxRfOxOUc6taY2DNBp2x1CmfOfSOuu3j5QXwk9FppD37EGxHz7q64UlX
         pCt3NiOuyljx5MbZwAVes4cZQ0BU8x/a4VxMvX6kZF1banZTsQtqhfGc6sm+g41d4oTo
         VjkUpx/hJnc453S5va4SZcj49wG7nJSohsl8xrvd+kYBTOZUeBHUhf3WzevpC2azunxd
         vtbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rEuqPeKgdCBSAB96EjsVVTE05/qOuUt5EH3pe/qjmN0=;
        b=V6qdZykE5pcU2yABZrzahArIf26sHnAFbPxA5WuOPC/Oi+ZQiaT61NirLf64AgDeAG
         L/Tk+qKAdYXOHpXrwO2qxt/pzepDbwRg1kxkiprQJ5jSBWJlxCher3yawKXVIxjkvOX4
         lGO3Tq4cDJ7ak7SmUhCi1s4Nb4TijVDZOTUBbHWOJ5cKFQ64bMoTi+EpQKk/bac1UdCM
         UvtxuN6RdsNnmQPJ1DouT5jHCNRZgsnP6ikbf1RQzgr/eVs+mNECtAtaBvt5HewemeV5
         gK0C/KP1U30TopUHVj0nfZ7/dBpxRGFMQyzpG0pEMp16oyu16i+gY1ECFrX4RjydkKcj
         4HEg==
X-Gm-Message-State: ACgBeo1Ap+ss/3OwvXDNOolUH3aZh32ibxvaUwQTrFVGkckRhFnl5r4O
	nI1wiHctmVv5DAnhWvP326wO5r2GpnU=
X-Google-Smtp-Source: 
 AA6agR6giWBllv/qWhPlN+TNNIieFNkZabB2XWa3u6LMHOo8801nw8GKyl2v3KKkodZE0yKGHrpgvg==
X-Received: by 2002:a05:6402:530c:b0:43b:c6bf:a496 with SMTP id
 eo12-20020a056402530c00b0043bc6bfa496mr16513346edb.282.1659940732143;
        Sun, 07 Aug 2022 23:38:52 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 k22-20020aa7c056000000b0043ce5d4d2c3sm4092644edo.14.2022.08.07.23.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:38:51 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/45] go: update 1.18.4 -> 1.19
Date: Mon,  8 Aug 2022 08:38:02 +0200
Message-Id: <20220808063843.3975130-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808063843.3975130-1-alex@linutronix.de>
References: <20220808063843.3975130-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:38:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169019

Rebase patches.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../go/{go-1.18.4.inc => go-1.19.inc}         |  2 +-
 ...ive_1.18.4.bb => go-binary-native_1.19.bb} |  4 +-
 ...an_1.18.4.bb => go-cross-canadian_1.19.bb} |  0
 .../{go-cross_1.18.4.bb => go-cross_1.19.bb}  |  0
 ...crosssdk_1.18.4.bb => go-crosssdk_1.19.bb} |  0
 ...{go-native_1.18.4.bb => go-native_1.19.bb} |  0
 ...o-runtime_1.18.4.bb => go-runtime_1.19.bb} |  0
 ...ent-based-hash-generation-less-pedan.patch | 39 ++++++++------
 ...-to-be-overridden-in-the-environment.patch | 18 ++++---
 ...4-ld-add-soname-to-shareable-objects.patch | 17 +++---
 ...de-CC-when-building-dist-and-go_boot.patch | 12 +++--
 ...dist-separate-host-and-target-builds.patch | 41 +++++++-------
 .../go/go/filter-build-paths.patch            | 53 +++++++++++--------
 .../go/{go_1.18.4.bb => go_1.19.bb}           |  0
 15 files changed, 106 insertions(+), 82 deletions(-)
 rename meta/recipes-devtools/go/{go-1.18.4.inc => go-1.19.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.18.4.bb => go-binary-native_1.19.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.18.4.bb => go-cross-canadian_1.19.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.18.4.bb => go-cross_1.19.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.18.4.bb => go-crosssdk_1.19.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.18.4.bb => go-native_1.19.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.18.4.bb => go-runtime_1.19.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.18.4.bb => go_1.19.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 4477689157..a3227ecb71 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -23,7 +23,7 @@ GDBVERSION ?= "12.%"
 GLIBCVERSION ?= "2.35"
 LINUXLIBCVERSION ?= "5.16%"
 QEMUVERSION ?= "7.0%"
-GOVERSION ?= "1.18%"
+GOVERSION ?= "1.19%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
 LLVMVERSION ?= "14.0.6"
diff --git a/meta/recipes-devtools/go/go-1.18.4.inc b/meta/recipes-devtools/go/go-1.19.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.18.4.inc
rename to meta/recipes-devtools/go/go-1.19.inc
index bfda15c54f..3bccfcbecf 100644
--- a/meta/recipes-devtools/go/go-1.18.4.inc
+++ b/meta/recipes-devtools/go/go-1.19.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://filter-build-paths.patch \
 "
-SRC_URI[main.sha256sum] = "4525aa6b0e3cecb57845f4060a7075aafc9ab752bb7b6b4cf8a212d43078e1e4"
+SRC_URI[main.sha256sum] = "9419cc70dc5a2523f29a77053cafff658ed21ef3561d9b6b020280ebceab28b9"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.18.4.bb b/meta/recipes-devtools/go/go-binary-native_1.19.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.18.4.bb
rename to meta/recipes-devtools/go/go-binary-native_1.19.bb
index 252c467a00..ca424a66b8 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.18.4.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.19.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "c9b099b68d93f5c5c8a8844a89f8db07eaa58270e3a1e01804f17f4cf8df02f5"
-SRC_URI[go_linux_arm64.sha256sum] = "35014d92b50d97da41dade965df7ebeb9a715da600206aa59ce1b2d05527421f"
+SRC_URI[go_linux_amd64.sha256sum] = "464b6b66591f6cf055bc5df90a9750bf5fbc9d038722bb84a9d56a2bea974be6"
+SRC_URI[go_linux_arm64.sha256sum] = "efa97fac9574fc6ef6c9ff3e3758fb85f1439b046573bf434cccb5e012bd00c8"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.18.4.bb b/meta/recipes-devtools/go/go-cross-canadian_1.19.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.18.4.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.19.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.18.4.bb b/meta/recipes-devtools/go/go-cross_1.19.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.18.4.bb
rename to meta/recipes-devtools/go/go-cross_1.19.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.18.4.bb b/meta/recipes-devtools/go/go-crosssdk_1.19.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.18.4.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.19.bb
diff --git a/meta/recipes-devtools/go/go-native_1.18.4.bb b/meta/recipes-devtools/go/go-native_1.19.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.18.4.bb
rename to meta/recipes-devtools/go/go-native_1.19.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.18.4.bb b/meta/recipes-devtools/go/go-runtime_1.19.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.18.4.bb
rename to meta/recipes-devtools/go/go-runtime_1.19.bb
diff --git a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
index f9db5df4eb..8cbed93017 100644
--- a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
+++ b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
@@ -1,4 +1,4 @@
-From 61de6067f5ad127d246543527947a357647f95e5 Mon Sep 17 00:00:00 2001
+From a3db4da51df37d163ff9e8c1e1057280c648c545 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 28 Mar 2022 10:59:03 -0700
 Subject: [PATCH] cmd/go: make content-based hash generation less pedantic
@@ -25,14 +25,17 @@ Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Alex Kube <alexander.j.kube@gmail.com>
 Signed-off-by: Matt Madison <matt@madison.systems>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/cmd/go/internal/envcmd/env.go |  2 +-
- src/cmd/go/internal/work/exec.go  | 42 +++++++++++++++++++++++++------
- 2 files changed, 35 insertions(+), 9 deletions(-)
+ src/cmd/go/internal/work/exec.go  | 42 ++++++++++++++++++++++++-------
+ 2 files changed, 34 insertions(+), 10 deletions(-)
 
+diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
+index 529351d..df791b0 100644
 --- a/src/cmd/go/internal/envcmd/env.go
 +++ b/src/cmd/go/internal/envcmd/env.go
-@@ -169,7 +169,7 @@ func ExtraEnvVars() []cfg.EnvVar {
+@@ -176,7 +176,7 @@ func ExtraEnvVars() []cfg.EnvVar {
  func ExtraEnvVarsCostly() []cfg.EnvVar {
  	var b work.Builder
  	b.Init()
@@ -41,9 +44,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	if err != nil {
  		// Should not happen - b.CFlags was given an empty package.
  		fmt.Fprintf(os.Stderr, "go: invalid cflags: %v\n", err)
+diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
+index c88b315..a06455c 100644
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
-@@ -213,6 +213,8 @@ func (b *Builder) Do(ctx context.Context
+@@ -213,6 +213,8 @@ func (b *Builder) Do(ctx context.Context, root *Action) {
  	writeActionGraph()
  }
  
@@ -52,7 +57,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  // buildActionID computes the action ID for a build action.
  func (b *Builder) buildActionID(a *Action) cache.ActionID {
  	p := a.Package
-@@ -234,7 +236,7 @@ func (b *Builder) buildActionID(a *Actio
+@@ -234,7 +236,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
  		if p.Module != nil {
  			fmt.Fprintf(h, "module %s@%s\n", p.Module.Path, p.Module.Version)
  		}
@@ -61,7 +66,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  		// The Go compiler always hides the exact value of $GOROOT
  		// when building things in GOROOT.
  		//
-@@ -266,9 +268,9 @@ func (b *Builder) buildActionID(a *Actio
+@@ -266,9 +268,9 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
  	}
  	if len(p.CgoFiles)+len(p.SwigFiles)+len(p.SwigCXXFiles) > 0 {
  		fmt.Fprintf(h, "cgo %q\n", b.toolID("cgo"))
@@ -73,7 +78,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  		fmt.Fprintf(h, "CC=%q %q %q %q\n", ccExe, cppflags, cflags, ldflags)
  		// Include the C compiler tool ID so that if the C
  		// compiler changes we rebuild the package.
-@@ -281,14 +283,14 @@ func (b *Builder) buildActionID(a *Actio
+@@ -281,14 +283,14 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
  			}
  		}
  		if len(p.CXXFiles)+len(p.SwigCXXFiles) > 0 {
@@ -90,16 +95,16 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  			fmt.Fprintf(h, "FC=%q %q\n", fcExe, fflags)
  			if fcID, err := b.gccToolID(fcExe[0], "f95"); err == nil {
  				fmt.Fprintf(h, "FC ID=%q\n", fcID)
-@@ -304,7 +306,7 @@ func (b *Builder) buildActionID(a *Actio
- 			fmt.Fprintf(h, "fuzz %q\n", fuzzFlags)
+@@ -305,7 +307,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
  		}
  	}
--	fmt.Fprintf(h, "modinfo %q\n", p.Internal.BuildInfo)
-+	//fmt.Fprintf(h, "modinfo %q\n", p.Internal.BuildInfo)
+ 	if p.Internal.BuildInfo != "" {
+-		fmt.Fprintf(h, "modinfo %q\n", p.Internal.BuildInfo)
++		//fmt.Fprintf(h, "modinfo %q\n", p.Internal.BuildInfo)
+ 	}
  
  	// Configuration specific to compiler toolchain.
- 	switch cfg.BuildToolchainName {
-@@ -2679,8 +2681,23 @@ func envList(key, def string) []string {
+@@ -2705,8 +2707,23 @@ func envList(key, def string) []string {
  	return args
  }
  
@@ -124,7 +129,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	defaults := "-g -O2"
  
  	if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, checkCompilerFlags); err != nil {
-@@ -2698,6 +2715,13 @@ func (b *Builder) CFlags(p *load.Package
+@@ -2724,6 +2741,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
  	if ldflags, err = buildFlags("LDFLAGS", defaults, p.CgoLDFLAGS, checkLinkerFlags); err != nil {
  		return
  	}
@@ -138,7 +143,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  	return
  }
-@@ -2713,7 +2737,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
+@@ -2739,7 +2763,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
  
  func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo, outObj []string, err error) {
  	p := a.Package
@@ -147,7 +152,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	if err != nil {
  		return nil, nil, err
  	}
-@@ -3174,7 +3198,7 @@ func (b *Builder) swigIntSize(objdir str
+@@ -3246,7 +3270,7 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
  
  // Run SWIG on one SWIG input file.
  func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string, err error) {
diff --git a/meta/recipes-devtools/go/go/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch b/meta/recipes-devtools/go/go/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
index c3ccffc3e9..30068d8e74 100644
--- a/meta/recipes-devtools/go/go/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
+++ b/meta/recipes-devtools/go/go/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
@@ -1,4 +1,4 @@
-From 8512964c0bfdfc3c9c3805743ea7de551a1d476a Mon Sep 17 00:00:00 2001
+From 7e0136a882757da0a374ab8592209586eced0e1c Mon Sep 17 00:00:00 2001
 From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:15:37 +0430
 Subject: [PATCH] cmd/go: Allow GOTOOLDIR to be overridden in the environment
@@ -18,9 +18,11 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  src/cmd/go/internal/cfg/cfg.go | 6 +++++-
  2 files changed, 8 insertions(+), 2 deletions(-)
 
+diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
+index 7c44c4a..3024d0c 100644
 --- a/src/cmd/dist/build.go
 +++ b/src/cmd/dist/build.go
-@@ -251,7 +251,9 @@ func xinit() {
+@@ -264,7 +264,9 @@ func xinit() {
  	}
  	xatexit(rmworkdir)
  
@@ -31,18 +33,20 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  }
  
  // compilerEnv returns a map from "goos/goarch" to the
+diff --git a/src/cmd/go/internal/cfg/cfg.go b/src/cmd/go/internal/cfg/cfg.go
+index c6ddfe5..605adb1 100644
 --- a/src/cmd/go/internal/cfg/cfg.go
 +++ b/src/cmd/go/internal/cfg/cfg.go
-@@ -76,7 +76,11 @@ func defaultContext() build.Context {
+@@ -162,7 +162,11 @@ func SetGOROOT(goroot string) {
  		// variables. This matches the initialization of ToolDir in
- 		// go/build, except for using ctxt.GOROOT rather than
+ 		// go/build, except for using BuildContext.GOROOT rather than
  		// runtime.GOROOT.
--		build.ToolDir = filepath.Join(ctxt.GOROOT, "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
+-		build.ToolDir = filepath.Join(goroot, "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
 +		if s := os.Getenv("GOTOOLDIR"); s != "" {
 +			build.ToolDir = filepath.Clean(s)
 +		} else {
-+			build.ToolDir = filepath.Join(ctxt.GOROOT, "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
++			build.ToolDir = filepath.Join(goroot, "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
 +		}
  	}
+ }
  
- 	ctxt.GOPATH = envOr("GOPATH", gopath(ctxt))
diff --git a/meta/recipes-devtools/go/go/0004-ld-add-soname-to-shareable-objects.patch b/meta/recipes-devtools/go/go/0004-ld-add-soname-to-shareable-objects.patch
index 058fa64225..b700634910 100644
--- a/meta/recipes-devtools/go/go/0004-ld-add-soname-to-shareable-objects.patch
+++ b/meta/recipes-devtools/go/go/0004-ld-add-soname-to-shareable-objects.patch
@@ -1,7 +1,7 @@
-From bf5cf5301ae5914498454c87293d1df2e1d8489f Mon Sep 17 00:00:00 2001
+From 68867eae5d3a51f32b2a2e16374323338408781e Mon Sep 17 00:00:00 2001
 From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:16:32 +0430
-Subject: [PATCH 4/9] ld: add soname to shareable objects
+Subject: [PATCH] ld: add soname to shareable objects
 
 so that OE's shared library dependency handling
 can find them.
@@ -13,21 +13,24 @@ Matt Madison <matt@madison.systems>.
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
+
 ---
  src/cmd/link/internal/ld/lib.go | 3 +++
  1 file changed, 3 insertions(+)
 
+diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/ld/lib.go
+index 18910dd..b2e1d36 100644
 --- a/src/cmd/link/internal/ld/lib.go
 +++ b/src/cmd/link/internal/ld/lib.go
-@@ -1347,6 +1347,7 @@ func (ctxt *Link) hostlink() {
+@@ -1459,6 +1459,7 @@ func (ctxt *Link) hostlink() {
  				argv = append(argv, "-Wl,-z,relro")
  			}
  			argv = append(argv, "-shared")
 +			argv = append(argv, fmt.Sprintf("-Wl,-soname,%s", filepath.Base(*flagOutfile)))
  			if ctxt.HeadType == objabi.Hwindows {
- 				if *flagAslr {
- 					argv = addASLRargs(argv)
-@@ -1364,6 +1365,7 @@ func (ctxt *Link) hostlink() {
+ 				argv = addASLRargs(argv, *flagAslr)
+ 			} else {
+@@ -1474,6 +1475,7 @@ func (ctxt *Link) hostlink() {
  			argv = append(argv, "-Wl,-z,relro")
  		}
  		argv = append(argv, "-shared")
@@ -35,7 +38,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  	case BuildModePlugin:
  		if ctxt.HeadType == objabi.Hdarwin {
  			argv = append(argv, "-dynamiclib")
-@@ -1372,6 +1374,7 @@ func (ctxt *Link) hostlink() {
+@@ -1482,6 +1484,7 @@ func (ctxt *Link) hostlink() {
  				argv = append(argv, "-Wl,-z,relro")
  			}
  			argv = append(argv, "-shared")
diff --git a/meta/recipes-devtools/go/go/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
index a6937672f5..608f1eb5a0 100644
--- a/meta/recipes-devtools/go/go/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
+++ b/meta/recipes-devtools/go/go/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
@@ -1,4 +1,4 @@
-From 153e2dda6103fd9dd871be4bb495a8da5328301e Mon Sep 17 00:00:00 2001
+From 8f020921c464e95ded850950382115154448580a Mon Sep 17 00:00:00 2001
 From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:17:16 +0430
 Subject: [PATCH] make.bash: override CC when building dist and go_bootstrap
@@ -17,18 +17,20 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  src/make.bash | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
+diff --git a/src/make.bash b/src/make.bash
+index ab2ce19..37ec1fb 100755
 --- a/src/make.bash
 +++ b/src/make.bash
-@@ -195,7 +195,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ];
+@@ -198,7 +198,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ]; then
  	exit 1
  fi
  rm -f cmd/dist/dist
--GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH="" GO111MODULE=off "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
-+CC="${BUILD_CC:-${CC}}" GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH="" GO111MODULE=off "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
+-GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH="" GO111MODULE=off GOEXPERIMENT="" GOENV=off GOFLAGS="" "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
++CC="${BUILD_CC:-${CC}}" GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH="" GO111MODULE=off GOEXPERIMENT="" GOENV=off GOFLAGS="" "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
  
  # -e doesn't propagate out of eval, so check success by hand.
  eval $(./cmd/dist/dist env -p || echo FAIL=true)
-@@ -220,7 +220,7 @@ fi
+@@ -223,7 +223,7 @@ fi
  # Run dist bootstrap to complete make.bash.
  # Bootstrap installs a proper cmd/dist, built with the new toolchain.
  # Throw ours, built with Go 1.4, away after bootstrap.
diff --git a/meta/recipes-devtools/go/go/0006-cmd-dist-separate-host-and-target-builds.patch b/meta/recipes-devtools/go/go/0006-cmd-dist-separate-host-and-target-builds.patch
index ee743ab990..2c864baa0e 100644
--- a/meta/recipes-devtools/go/go/0006-cmd-dist-separate-host-and-target-builds.patch
+++ b/meta/recipes-devtools/go/go/0006-cmd-dist-separate-host-and-target-builds.patch
@@ -1,4 +1,4 @@
-From 7bc891e00be4263311d75aa2b2ee6a3b7b75355f Mon Sep 17 00:00:00 2001
+From ef5fddafdec78cab9963d21736e64d71ca520bcc Mon Sep 17 00:00:00 2001
 From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:18:12 +0430
 Subject: [PATCH] cmd/dist: separate host and target builds
@@ -36,12 +36,14 @@ Matt Madison <matt@madison.systems>.
 Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
 
 ---
- src/cmd/dist/build.go | 156 ++++++++++++++++++++++++++++++------------
- 1 file changed, 113 insertions(+), 43 deletions(-)
+ src/cmd/dist/build.go | 154 ++++++++++++++++++++++++++++++------------
+ 1 file changed, 112 insertions(+), 42 deletions(-)
 
+diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
+index 3024d0c..45ebee0 100644
 --- a/src/cmd/dist/build.go
 +++ b/src/cmd/dist/build.go
-@@ -44,6 +44,7 @@ var (
+@@ -45,6 +45,7 @@ var (
  	goexperiment     string
  	workdir          string
  	tooldir          string
@@ -49,7 +51,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  	oldgoos          string
  	oldgoarch        string
  	exe              string
-@@ -54,6 +55,7 @@ var (
+@@ -55,6 +56,7 @@ var (
  
  	rebuildall   bool
  	defaultclang bool
@@ -57,7 +59,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  
  	vflag int // verbosity
  )
-@@ -254,6 +256,8 @@ func xinit() {
+@@ -267,6 +269,8 @@ func xinit() {
  	if tooldir = os.Getenv("GOTOOLDIR"); tooldir == "" {
  		tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
  	}
@@ -66,7 +68,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  }
  
  // compilerEnv returns a map from "goos/goarch" to the
-@@ -499,8 +503,10 @@ func setup() {
+@@ -468,8 +472,10 @@ func setup() {
  	p := pathf("%s/pkg/%s_%s", goroot, gohostos, gohostarch)
  	if rebuildall {
  		xremoveall(p)
@@ -77,7 +79,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  
  	if goos != gohostos || goarch != gohostarch {
  		p := pathf("%s/pkg/%s_%s", goroot, goos, goarch)
-@@ -1252,17 +1258,35 @@ func cmdbootstrap() {
+@@ -1248,17 +1254,35 @@ func cmdbootstrap() {
  
  	var noBanner, noClean bool
  	var debug bool
@@ -114,7 +116,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  	// Set GOPATH to an internal directory. We shouldn't actually
  	// need to store files here, since the toolchain won't
  	// depend on modules outside of vendor directories, but if
-@@ -1330,8 +1354,13 @@ func cmdbootstrap() {
+@@ -1326,8 +1350,13 @@ func cmdbootstrap() {
  		xprintf("\n")
  	}
  
@@ -128,9 +130,9 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
 +		goldflags = os.Getenv("GO_LDFLAGS") // we were using $BOOT_GO_LDFLAGS until now
 +	}
  	goBootstrap := pathf("%s/go_bootstrap", tooldir)
- 	cmdGo := pathf("%s/go", gobin)
+ 	cmdGo := pathf("%s/go", gorootBin)
  	if debug {
-@@ -1360,7 +1389,11 @@ func cmdbootstrap() {
+@@ -1356,7 +1385,11 @@ func cmdbootstrap() {
  		xprintf("\n")
  	}
  	xprintf("Building Go toolchain2 using go_bootstrap and Go toolchain1.\n")
@@ -143,7 +145,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  	// Now that cmd/go is in charge of the build process, enable GOEXPERIMENT.
  	os.Setenv("GOEXPERIMENT", goexperiment)
  	goInstall(goBootstrap, append([]string{"-i"}, toolchain...)...)
-@@ -1399,50 +1432,84 @@ func cmdbootstrap() {
+@@ -1395,50 +1428,84 @@ func cmdbootstrap() {
  	}
  	checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
  
@@ -235,7 +237,12 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
 -		timelog("build", "target toolchain")
 -		if vflag > 0 {
 -			xprintf("\n")
--		}
++		if debug {
++			run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
++			run("", ShowOutput|CheckExit, pathf("%s/buildid", tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
++			checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
++			copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir), writeExec)
+ 		}
 -		goos = oldgoos
 -		goarch = oldgoarch
 -		os.Setenv("GOOS", goos)
@@ -256,16 +263,10 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
 -		run("", ShowOutput|CheckExit, pathf("%s/buildid", tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
 -		checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
 -		copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir), writeExec)
-+		if debug {
-+			run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
-+			run("", ShowOutput|CheckExit, pathf("%s/buildid", tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
-+			checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
-+			copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir), writeExec)
-+		}
  	}
  
  	// Check that there are no new files in $GOROOT/bin other than
-@@ -1459,8 +1526,11 @@ func cmdbootstrap() {
+@@ -1455,8 +1522,11 @@ func cmdbootstrap() {
  		}
  	}
  
diff --git a/meta/recipes-devtools/go/go/filter-build-paths.patch b/meta/recipes-devtools/go/go/filter-build-paths.patch
index caf727714e..a1aa37c2a4 100644
--- a/meta/recipes-devtools/go/go/filter-build-paths.patch
+++ b/meta/recipes-devtools/go/go/filter-build-paths.patch
@@ -1,3 +1,8 @@
+From 3bdbce685c688a27eece36ccc8be9b50b4849498 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Sat, 2 Jul 2022 23:08:13 +0100
+Subject: [PATCH] go: Filter build paths on staticly linked arches
+
 Filter out build time paths from ldflags and other flags variables when they're
 embedded in the go binary so that builds are reproducible regardless of build
 location. This codepath is hit for statically linked go binaries such as those
@@ -6,11 +11,15 @@ on mips/ppc.
 Upstream-Status: Pending
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
-Index: go/src/cmd/go/internal/load/pkg.go
-===================================================================
---- go.orig/src/cmd/go/internal/load/pkg.go
-+++ go/src/cmd/go/internal/load/pkg.go
-@@ -2225,6 +2225,17 @@ func (p *Package) collectDeps() {
+---
+ src/cmd/go/internal/load/pkg.go | 15 +++++++++++++--
+ 1 file changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/src/cmd/go/internal/load/pkg.go b/src/cmd/go/internal/load/pkg.go
+index 046f508..353cbc4 100644
+--- a/src/cmd/go/internal/load/pkg.go
++++ b/src/cmd/go/internal/load/pkg.go
+@@ -2256,6 +2256,17 @@ func (p *Package) collectDeps() {
  // to their VCS information (vcsStatusError).
  var vcsStatusCache par.Cache
  
@@ -28,21 +37,21 @@ Index: go/src/cmd/go/internal/load/pkg.go
  // setBuildInfo gathers build information, formats it as a string to be
  // embedded in the binary, then sets p.Internal.BuildInfo to that string.
  // setBuildInfo should only be called on a main package with no errors.
-@@ -2329,7 +2340,7 @@ func (p *Package) setBuildInfo(includeVC
- 			appendSetting("-gcflags", BuildGcflags.String())
- 		}
- 		if BuildLdflags.present {
--			appendSetting("-ldflags", BuildLdflags.String())
-+			appendSetting("-ldflags", filterCompilerFlags(BuildLdflags.String()))
- 		}
- 		if cfg.BuildMSan {
- 			appendSetting("-msan", "true")
-@@ -2347,7 +2358,7 @@ func (p *Package) setBuildInfo(includeVC
- 		appendSetting("CGO_ENABLED", cgo)
- 		if cfg.BuildContext.CgoEnabled {
- 			for _, name := range []string{"CGO_CFLAGS", "CGO_CPPFLAGS", "CGO_CXXFLAGS", "CGO_LDFLAGS"} {
--				appendSetting(name, cfg.Getenv(name))
-+				appendSetting(name, filterCompilerFlags(cfg.Getenv(name)))
- 			}
+@@ -2353,7 +2364,7 @@ func (p *Package) setBuildInfo(includeVCS bool) {
+ 	if gcflags := BuildGcflags.String(); gcflags != "" && cfg.BuildContext.Compiler == "gc" {
+ 		appendSetting("-gcflags", gcflags)
+ 	}
+-	if ldflags := BuildLdflags.String(); ldflags != "" {
++	if ldflags := filterCompilerFlags(BuildLdflags.String()); ldflags != "" {
+ 		// https://go.dev/issue/52372: only include ldflags if -trimpath is not set,
+ 		// since it can include system paths through various linker flags (notably
+ 		// -extar, -extld, and -extldflags).
+@@ -2392,7 +2403,7 @@ func (p *Package) setBuildInfo(includeVCS bool) {
+ 	// subset of flags that are known not to be paths?
+ 	if cfg.BuildContext.CgoEnabled && !cfg.BuildTrimpath {
+ 		for _, name := range []string{"CGO_CFLAGS", "CGO_CPPFLAGS", "CGO_CXXFLAGS", "CGO_LDFLAGS"} {
+-			appendSetting(name, cfg.Getenv(name))
++			appendSetting(name, filterCompilerFlags(cfg.Getenv(name)))
  		}
- 		appendSetting("GOARCH", cfg.BuildContext.GOARCH)
+ 	}
+ 	appendSetting("GOARCH", cfg.BuildContext.GOARCH)
diff --git a/meta/recipes-devtools/go/go_1.18.4.bb b/meta/recipes-devtools/go/go_1.19.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.18.4.bb
rename to meta/recipes-devtools/go/go_1.19.bb
-- 
2.30.2


