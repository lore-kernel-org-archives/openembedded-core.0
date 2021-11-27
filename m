Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC27C433EF
	for <webhook@archiver.kernel.org>; Sat, 27 Nov 2021 09:54:19 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.34226.1638006857694999458
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Nov 2021 01:54:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UHUwmlZi;
 spf=pass (domain: gmail.com, ip: 209.85.128.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id
 az34-20020a05600c602200b0033bf8662572so8380749wmb.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Nov 2021 01:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q3tIgQnSJsh2T46eAYH/XEvktZLPX0ZbW4niL0cQ4Gc=;
        b=UHUwmlZiWEC/alPgn9dVxLdZOmjvK38NiI2ZYLc1/FyZCD1NmR5Tw1HzuY/jgby8kF
         93FyVCAS6JkXJvnRK3Pmxr0f7+iIyRd5QLH54/pg8dDw5/8jYaPsrSdPT4FLo5HU9QyA
         xu5LiwZWHA1eMqlISW3+miXnRxsCBKXrxxAEvM9afARWJw31sHh+0f2UNSM+H1kyCKzP
         DWtbQTGYLRQKiD3emY0+n2s1aSeul2gBDdkGAZusJWpLuBR8uDiBD9w/GqHbCINvHGW+
         l1WNBh+uPVsXTMjBTlHbRIRKss6J8dPY1HaJ3NuhBtVyuruUNiiV652W3d0ZdIxLnKpH
         zNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q3tIgQnSJsh2T46eAYH/XEvktZLPX0ZbW4niL0cQ4Gc=;
        b=gEmRya+Px2pVwbFM/YOnDz7g2h+pMzOApTNWVzMTZ/z5POihY4XWcoE0uPyhQZQtjw
         CGzIZ46MW9K4KbViPtvXx9+rtjlkZHP0tAXggloo8QRn2Q9CPMq7TE8/UuB/lquOPHA7
         DRsWlwsmUcOnPKssKslJsYgJySm4tugq3hdyqGWtRFaaBnEn2NM7u77sN8/K/KpGaQaq
         a0WozcyX9C4oZ4Aci1kr0yMmotdBarQJPBybRzoe9EeanDkevx//QqO8lHFwQL5O9Zvz
         rb9dtNWmiL722bmj36NhYpqP0lxl6C3M98OxkmBbEs9X4LRO633ZtHRwBB4j69oJAAUA
         Ihow==
X-Gm-Message-State: AOAM531djqC+gRcGYm3xPjbMP4BsChqQylff8SQHt/NQtaa468Kcmk3m
	Wo0F4rzGlxik55OFIbuMLB5XI383GR9ypA==
X-Google-Smtp-Source: 
 ABdhPJxQkF4IjF+WVCTMYKFlDREJC8mXVXN4Xjz79WZdRhBQVCZWF/2Q7VqwvgYmPMrFNz9cHYS+Xw==
X-Received: by 2002:a1c:5409:: with SMTP id i9mr20852520wmb.146.1638006855995;
        Sat, 27 Nov 2021 01:54:15 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 w4sm8484302wrs.88.2021.11.27.01.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 01:54:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/13] go: update 1.16.10 -> 1.17.3
Date: Sat, 27 Nov 2021 10:53:56 +0100
Message-Id: <20211127095357.1748429-12-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211127095357.1748429-1-alex@linutronix.de>
References: <20211127095357.1748429-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Nov 2021 09:54:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158861

This was additionally verified with meta-virtualization:
$ bitbake packagegroup-container packagegroup-kubernetes
$ bitbake container-base kvm-image-minimal xen-guest-image-minimal

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../go/{go-1.16.10.inc => go-1.17.3.inc}      |  6 +-
 ...ow-CC-and-CXX-to-have-multiple-words.patch |  0
 ...ent-based-hash-generation-less-pedan.patch | 64 ++++++++++++-------
 ...-to-be-overridden-in-the-environment.patch | 15 +++--
 ...4-ld-add-soname-to-shareable-objects.patch |  0
 ...de-CC-when-building-dist-and-go_boot.patch | 16 +++--
 ...dist-separate-host-and-target-builds.patch | 61 ++++++++++--------
 ...d-go-make-GOROOT-precious-by-default.patch |  0
 ...008-use-GOBUILDMODE-to-set-buildmode.patch |  0
 ...go-make-sure-CC-and-CXX-are-absolute.patch | 27 ++++----
 ..._1.16.10.bb => go-binary-native_1.17.3.bb} |  4 +-
 ...1.16.10.bb => go-cross-canadian_1.17.3.bb} |  0
 ...go-cross_1.16.10.bb => go-cross_1.17.3.bb} |  0
 ...sssdk_1.16.10.bb => go-crosssdk_1.17.3.bb} |  0
 ...-native_1.16.10.bb => go-native_1.17.3.bb} |  0
 ...untime_1.16.10.bb => go-runtime_1.17.3.bb} |  0
 .../go/{go_1.16.10.bb => go_1.17.3.bb}        |  0
 18 files changed, 113 insertions(+), 82 deletions(-)
 rename meta/recipes-devtools/go/{go-1.16.10.inc => go-1.17.3.inc} (82%)
 rename meta/recipes-devtools/go/{go-1.16 => go-1.17}/0001-allow-CC-and-CXX-to-have-multiple-words.patch (100%)
 rename meta/recipes-devtools/go/{go-1.16 => go-1.17}/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch (80%)
 rename meta/recipes-devtools/go/{go-1.16 => go-1.17}/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch (76%)
 rename meta/recipes-devtools/go/{go-1.16 => go-1.17}/0004-ld-add-soname-to-shareable-objects.patch (100%)
 rename meta/recipes-devtools/go/{go-1.16 => go-1.17}/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch (72%)
 rename meta/recipes-devtools/go/{go-1.16 => go-1.17}/0006-cmd-dist-separate-host-and-target-builds.patch (89%)
 rename meta/recipes-devtools/go/{go-1.16 => go-1.17}/0007-cmd-go-make-GOROOT-precious-by-default.patch (100%)
 rename meta/recipes-devtools/go/{go-1.16 => go-1.17}/0008-use-GOBUILDMODE-to-set-buildmode.patch (100%)
 rename meta/recipes-devtools/go/{go-1.16 => go-1.17}/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch (83%)
 rename meta/recipes-devtools/go/{go-binary-native_1.16.10.bb => go-binary-native_1.17.3.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.16.10.bb => go-cross-canadian_1.17.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.16.10.bb => go-cross_1.17.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.16.10.bb => go-crosssdk_1.17.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.16.10.bb => go-native_1.17.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.10.bb => go-runtime_1.17.3.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.16.10.bb => go_1.17.3.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index d5167ee9ad..946dec74b6 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -23,7 +23,7 @@ GDBVERSION ?= "11.%"
 GLIBCVERSION ?= "2.34"
 LINUXLIBCVERSION ?= "5.15%"
 QEMUVERSION ?= "6.1%"
-GOVERSION ?= "1.16%"
+GOVERSION ?= "1.17%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
 LLVMVERSION ?= "12.0.1"
diff --git a/meta/recipes-devtools/go/go-1.16.10.inc b/meta/recipes-devtools/go/go-1.17.3.inc
similarity index 82%
rename from meta/recipes-devtools/go/go-1.16.10.inc
rename to meta/recipes-devtools/go/go-1.17.3.inc
index 7549ffc211..4fe091787b 100644
--- a/meta/recipes-devtools/go/go-1.16.10.inc
+++ b/meta/recipes-devtools/go/go-1.17.3.inc
@@ -1,8 +1,6 @@
 require go-common.inc
 
-GO_BASEVERSION = "1.16"
-PV = "1.16.10"
-FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
+FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go-1.17:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 
@@ -17,7 +15,7 @@ SRC_URI += "\
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
     file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
 "
-SRC_URI[main.sha256sum] = "a905472011585e403d00d2a41de7ced29b8884309d73482a307f689fd0f320b5"
+SRC_URI[main.sha256sum] = "705c64251e5b25d5d55ede1039c6aa22bea40a7a931d14c370339853643c3df0"
 
 # Upstream don't believe it is a signifiant real world issue and will only
 # fix in 1.17 onwards where we can drop this.
diff --git a/meta/recipes-devtools/go/go-1.16/0001-allow-CC-and-CXX-to-have-multiple-words.patch b/meta/recipes-devtools/go/go-1.17/0001-allow-CC-and-CXX-to-have-multiple-words.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.16/0001-allow-CC-and-CXX-to-have-multiple-words.patch
rename to meta/recipes-devtools/go/go-1.17/0001-allow-CC-and-CXX-to-have-multiple-words.patch
diff --git a/meta/recipes-devtools/go/go-1.16/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go-1.17/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
similarity index 80%
rename from meta/recipes-devtools/go/go-1.16/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
rename to meta/recipes-devtools/go/go-1.17/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
index 04d0e496c0..42cd568ef9 100644
--- a/meta/recipes-devtools/go/go-1.16/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
+++ b/meta/recipes-devtools/go/go-1.17/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
@@ -1,7 +1,7 @@
-From a13ae484e41139094505d2834437e9262a5315f7 Mon Sep 17 00:00:00 2001
+From c403b45995c5daa6747ac4d95b39bc9a6feb2cda Mon Sep 17 00:00:00 2001
 From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:14:22 +0430
-Subject: [PATCH 2/9] cmd/go: make content-based hash generation less pedantic
+Subject: [PATCH] cmd/go: make content-based hash generation less pedantic
 
 Upstream-Status: Inappropriate [OE specific]
 
@@ -50,9 +50,11 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  src/cmd/go/internal/work/exec.go  | 66 ++++++++++++++++++++++---------
  2 files changed, 49 insertions(+), 19 deletions(-)
 
+diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
+index 20d0587..ff6f0d8 100644
 --- a/src/cmd/go/internal/envcmd/env.go
 +++ b/src/cmd/go/internal/envcmd/env.go
-@@ -157,7 +157,7 @@ func ExtraEnvVars() []cfg.EnvVar {
+@@ -160,7 +160,7 @@ func ExtraEnvVars() []cfg.EnvVar {
  func ExtraEnvVarsCostly() []cfg.EnvVar {
  	var b work.Builder
  	b.Init()
@@ -61,9 +63,11 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  	if err != nil {
  		// Should not happen - b.CFlags was given an empty package.
  		fmt.Fprintf(os.Stderr, "go: invalid cflags: %v\n", err)
+diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
+index 5a225fb..a37872e 100644
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
-@@ -37,6 +37,8 @@ import (
+@@ -38,6 +38,8 @@ import (
  	"cmd/go/internal/trace"
  )
  
@@ -72,7 +76,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  // actionList returns the list of actions in the dag rooted at root
  // as visited in a depth-first post-order traversal.
  func actionList(root *Action) []*Action {
-@@ -228,7 +230,7 @@ func (b *Builder) buildActionID(a *Actio
+@@ -229,7 +231,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
  	// Assume b.WorkDir is being trimmed properly.
  	// When -trimpath is used with a package built from the module cache,
  	// use the module path and version instead of the directory.
@@ -81,25 +85,36 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  		fmt.Fprintf(h, "dir %s\n", p.Dir)
  	} else if cfg.BuildTrimpath && p.Module != nil {
  		fmt.Fprintf(h, "module %s@%s\n", p.Module.Path, p.Module.Version)
-@@ -247,13 +249,13 @@ func (b *Builder) buildActionID(a *Actio
+@@ -248,9 +250,9 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
  	}
- 	if len(p.CgoFiles)+len(p.SwigFiles) > 0 {
+ 	if len(p.CgoFiles)+len(p.SwigFiles)+len(p.SwigCXXFiles) > 0 {
  		fmt.Fprintf(h, "cgo %q\n", b.toolID("cgo"))
 -		cppflags, cflags, cxxflags, fflags, ldflags, _ := b.CFlags(p)
--		fmt.Fprintf(h, "CC=%q %q %q %q\n", b.ccExe(), cppflags, cflags, ldflags)
 +		cppflags, cflags, cxxflags, fflags, ldflags, _ := b.CFlags(p, true)
-+		fmt.Fprintf(h, "CC=%q %q %q %q\n", b.ccExe(true), cppflags, cflags, ldflags)
- 		if len(p.CXXFiles)+len(p.SwigFiles) > 0 {
--			fmt.Fprintf(h, "CXX=%q %q\n", b.cxxExe(), cxxflags)
-+			fmt.Fprintf(h, "CXX=%q %q\n", b.cxxExe(true), cxxflags)
+ 
+-		ccExe := b.ccExe()
++		ccExe := b.ccExe(true)
+ 		fmt.Fprintf(h, "CC=%q %q %q %q\n", ccExe, cppflags, cflags, ldflags)
+ 		// Include the C compiler tool ID so that if the C
+ 		// compiler changes we rebuild the package.
+@@ -263,14 +265,14 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+ 			}
  		}
- 		if len(p.FFiles) > 0 {
--			fmt.Fprintf(h, "FC=%q %q\n", b.fcExe(), fflags)
-+			fmt.Fprintf(h, "FC=%q %q\n", b.fcExe(true), fflags)
+ 		if len(p.CXXFiles)+len(p.SwigCXXFiles) > 0 {
+-			cxxExe := b.cxxExe()
++			cxxExe := b.cxxExe(true)
+ 			fmt.Fprintf(h, "CXX=%q %q\n", cxxExe, cxxflags)
+ 			if cxxID, err := b.gccToolID(cxxExe[0], "c++"); err == nil {
+ 				fmt.Fprintf(h, "CXX ID=%q\n", cxxID)
+ 			}
  		}
- 		// TODO(rsc): Should we include the SWIG version or Fortran/GCC/G++/Objective-C compiler versions?
- 	}
-@@ -2401,33 +2403,48 @@ var (
+ 		if len(p.FFiles) > 0 {
+-			fcExe := b.fcExe()
++			fcExe := b.fcExe(true)
+ 			fmt.Fprintf(h, "FC=%q %q\n", fcExe, fflags)
+ 			if fcID, err := b.gccToolID(fcExe[0], "f95"); err == nil {
+ 				fmt.Fprintf(h, "FC ID=%q\n", fcID)
+@@ -2438,33 +2440,48 @@ var (
  // gccCmd returns a gcc command line prefix
  // defaultCC is defined in zdefaultcc.go, written by cmd/dist.
  func (b *Builder) GccCmd(incdir, workdir string) []string {
@@ -157,7 +172,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  }
  
  // compilerExe returns the compiler to use given an
-@@ -2436,11 +2453,16 @@ func (b *Builder) fcExe() []string {
+@@ -2473,11 +2490,16 @@ func (b *Builder) fcExe() []string {
  // of the compiler but can have additional arguments if they
  // were present in the environment value.
  // For example if CC="gcc -DGOPHER" then the result is ["gcc", "-DGOPHER"].
@@ -175,7 +190,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  	return compiler
  }
  
-@@ -2620,7 +2642,7 @@ func envList(key, def string) []string {
+@@ -2667,7 +2689,7 @@ func envList(key, def string) []string {
  }
  
  // CFlags returns the flags to use when invoking the C, C++ or Fortran compilers, or cgo.
@@ -184,7 +199,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  	defaults := "-g -O2"
  
  	if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, checkCompilerFlags); err != nil {
-@@ -2639,6 +2661,14 @@ func (b *Builder) CFlags(p *load.Package
+@@ -2686,6 +2708,14 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
  		return
  	}
  
@@ -199,7 +214,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  	return
  }
  
-@@ -2653,7 +2683,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
+@@ -2700,7 +2730,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
  
  func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo, outObj []string, err error) {
  	p := a.Package
@@ -208,7 +223,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  	if err != nil {
  		return nil, nil, err
  	}
-@@ -3104,7 +3134,7 @@ func (b *Builder) swigIntSize(objdir str
+@@ -3151,7 +3181,7 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
  
  // Run SWIG on one SWIG input file.
  func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string, err error) {
@@ -217,3 +232,6 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  	if err != nil {
  		return "", "", err
  	}
+-- 
+2.20.1
+
diff --git a/meta/recipes-devtools/go/go-1.16/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch b/meta/recipes-devtools/go/go-1.17/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
similarity index 76%
rename from meta/recipes-devtools/go/go-1.16/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
rename to meta/recipes-devtools/go/go-1.17/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
index 662c705471..2a86bdccf3 100644
--- a/meta/recipes-devtools/go/go-1.16/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
+++ b/meta/recipes-devtools/go/go-1.17/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
@@ -1,7 +1,7 @@
-From 28ada8896b76d620240bafc22aa395071d601482 Mon Sep 17 00:00:00 2001
+From 8512964c0bfdfc3c9c3805743ea7de551a1d476a Mon Sep 17 00:00:00 2001
 From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:15:37 +0430
-Subject: [PATCH 3/9] cmd/go: Allow GOTOOLDIR to be overridden in the environment
+Subject: [PATCH] cmd/go: Allow GOTOOLDIR to be overridden in the environment
 
 to allow for split host/target build roots
 
@@ -12,15 +12,18 @@ Matt Madison <matt@madison.systems>.
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
+
 ---
  src/cmd/dist/build.go          | 4 +++-
  src/cmd/go/internal/cfg/cfg.go | 6 +++++-
  2 files changed, 8 insertions(+), 2 deletions(-)
 
+diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
+index bec1769..d82f612 100644
 --- a/src/cmd/dist/build.go
 +++ b/src/cmd/dist/build.go
-@@ -246,7 +246,9 @@ func xinit() {
- 	workdir = xworkdir()
+@@ -248,7 +248,9 @@ func xinit() {
+ 	}
  	xatexit(rmworkdir)
  
 -	tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
@@ -30,9 +33,11 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  }
  
  // compilerEnv returns a map from "goos/goarch" to the
+diff --git a/src/cmd/go/internal/cfg/cfg.go b/src/cmd/go/internal/cfg/cfg.go
+index 57a3c1f..825d8c7 100644
 --- a/src/cmd/go/internal/cfg/cfg.go
 +++ b/src/cmd/go/internal/cfg/cfg.go
-@@ -64,7 +64,11 @@ func defaultContext() build.Context {
+@@ -67,7 +67,11 @@ func defaultContext() build.Context {
  		// variables. This matches the initialization of ToolDir in
  		// go/build, except for using ctxt.GOROOT rather than
  		// runtime.GOROOT.
diff --git a/meta/recipes-devtools/go/go-1.16/0004-ld-add-soname-to-shareable-objects.patch b/meta/recipes-devtools/go/go-1.17/0004-ld-add-soname-to-shareable-objects.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.16/0004-ld-add-soname-to-shareable-objects.patch
rename to meta/recipes-devtools/go/go-1.17/0004-ld-add-soname-to-shareable-objects.patch
diff --git a/meta/recipes-devtools/go/go-1.16/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go-1.17/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
similarity index 72%
rename from meta/recipes-devtools/go/go-1.16/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
rename to meta/recipes-devtools/go/go-1.17/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
index 59c12d9546..2845d21382 100644
--- a/meta/recipes-devtools/go/go-1.16/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
+++ b/meta/recipes-devtools/go/go-1.17/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
@@ -1,8 +1,7 @@
-From f05ef3ded52b98537c10efd0b15cd9612471524d Mon Sep 17 00:00:00 2001
+From 153e2dda6103fd9dd871be4bb495a8da5328301e Mon Sep 17 00:00:00 2001
 From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:17:16 +0430
-Subject: [PATCH 5/9] make.bash: override CC when building dist and
- go_bootstrap
+Subject: [PATCH] make.bash: override CC when building dist and go_bootstrap
 
 for handling OE cross-canadian builds.
 
@@ -13,13 +12,16 @@ Matt Madison <matt@madison.systems>.
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
+
 ---
  src/make.bash | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
+diff --git a/src/make.bash b/src/make.bash
+index 7986125..dd67029 100755
 --- a/src/make.bash
 +++ b/src/make.bash
-@@ -178,7 +178,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ];
+@@ -181,7 +181,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ]; then
  	exit 1
  fi
  rm -f cmd/dist/dist
@@ -28,12 +30,12 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  
  # -e doesn't propagate out of eval, so check success by hand.
  eval $(./cmd/dist/dist env -p || echo FAIL=true)
-@@ -209,7 +209,7 @@ fi
+@@ -206,7 +206,7 @@ fi
  # Run dist bootstrap to complete make.bash.
  # Bootstrap installs a proper cmd/dist, built with the new toolchain.
  # Throw ours, built with Go 1.4, away after bootstrap.
--./cmd/dist/dist bootstrap $buildall $vflag $GO_DISTFLAGS "$@"
-+CC="${BUILD_CC:-${CC}}" ./cmd/dist/dist bootstrap $buildall $vflag $GO_DISTFLAGS "$@"
+-./cmd/dist/dist bootstrap -a $vflag $GO_DISTFLAGS "$@"
++CC="${BUILD_CC:-${CC}}" ./cmd/dist/dist bootstrap -a $vflag $GO_DISTFLAGS "$@"
  rm -f ./cmd/dist/dist
  
  # DO NOT ADD ANY NEW CODE HERE.
diff --git a/meta/recipes-devtools/go/go-1.16/0006-cmd-dist-separate-host-and-target-builds.patch b/meta/recipes-devtools/go/go-1.17/0006-cmd-dist-separate-host-and-target-builds.patch
similarity index 89%
rename from meta/recipes-devtools/go/go-1.16/0006-cmd-dist-separate-host-and-target-builds.patch
rename to meta/recipes-devtools/go/go-1.17/0006-cmd-dist-separate-host-and-target-builds.patch
index 7aee0bac43..68e8efc1d2 100644
--- a/meta/recipes-devtools/go/go-1.16/0006-cmd-dist-separate-host-and-target-builds.patch
+++ b/meta/recipes-devtools/go/go-1.17/0006-cmd-dist-separate-host-and-target-builds.patch
@@ -1,7 +1,7 @@
-From 10735bb84df17ba657f76835f483cd8543a879c1 Mon Sep 17 00:00:00 2001
+From 7bc891e00be4263311d75aa2b2ee6a3b7b75355f Mon Sep 17 00:00:00 2001
 From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:18:12 +0430
-Subject: [PATCH 6/9] cmd/dist: separate host and target builds
+Subject: [PATCH] cmd/dist: separate host and target builds
 
 Upstream-Status: Inappropriate [OE specific]
 
@@ -34,21 +34,24 @@ the meta/recipes-devtools/go tree by
 Matt Madison <matt@madison.systems>.
 
 Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
+
 ---
- src/cmd/dist/build.go | 155 ++++++++++++++++++++++++++++++------------
- 1 file changed, 112 insertions(+), 43 deletions(-)
+ src/cmd/dist/build.go | 156 ++++++++++++++++++++++++++++++------------
+ 1 file changed, 113 insertions(+), 43 deletions(-)
 
+diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
+index d82f612..5c8459c 100644
 --- a/src/cmd/dist/build.go
 +++ b/src/cmd/dist/build.go
-@@ -41,6 +41,7 @@ var (
- 	goldflags        string
+@@ -43,6 +43,7 @@ var (
+ 	goexperiment     string
  	workdir          string
  	tooldir          string
 +	build_tooldir    string
  	oldgoos          string
  	oldgoarch        string
  	exe              string
-@@ -53,6 +54,7 @@ var (
+@@ -55,6 +56,7 @@ var (
  
  	rebuildall   bool
  	defaultclang bool
@@ -56,7 +59,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  
  	vflag int // verbosity
  )
-@@ -249,6 +251,8 @@ func xinit() {
+@@ -251,6 +253,8 @@ func xinit() {
  	if tooldir = os.Getenv("GOTOOLDIR"); tooldir == "" {
  		tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
  	}
@@ -65,7 +68,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  }
  
  // compilerEnv returns a map from "goos/goarch" to the
-@@ -480,8 +484,10 @@ func setup() {
+@@ -496,8 +500,10 @@ func setup() {
  	p := pathf("%s/pkg/%s_%s", goroot, gohostos, gohostarch)
  	if rebuildall {
  		xremoveall(p)
@@ -76,9 +79,9 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  
  	if goos != gohostos || goarch != gohostarch {
  		p := pathf("%s/pkg/%s_%s", goroot, goos, goarch)
-@@ -1244,12 +1250,29 @@ func cmdbootstrap() {
+@@ -1267,17 +1273,35 @@ func cmdbootstrap() {
  
- 	var noBanner bool
+ 	var noBanner, noClean bool
  	var debug bool
 +	var hostOnly bool
 +	var targetOnly bool
@@ -87,12 +90,17 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  	flag.BoolVar(&rebuildall, "a", rebuildall, "rebuild all")
  	flag.BoolVar(&debug, "d", debug, "enable debugging of bootstrap process")
  	flag.BoolVar(&noBanner, "no-banner", noBanner, "do not print banner")
+ 	flag.BoolVar(&noClean, "no-clean", noClean, "print deprecation warning")
 +	flag.BoolVar(&hostOnly, "host-only", hostOnly, "build only host binaries, not target")
 +	flag.BoolVar(&targetOnly, "target-only", targetOnly, "build only target binaries, not host")
  
 -	xflagparse(0)
 +	xflagparse(-1)
  
+ 	if noClean {
+ 		xprintf("warning: --no-clean is deprecated and has no effect; use 'go install std cmd' instead\n")
+ 	}
+ 
 +	if hostOnly && targetOnly {
 +		fatalf("specify only one of --host-only or --target-only\n")
 +	}
@@ -104,10 +112,11 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
 +			fatalf("package names not permitted without --host-only or --target-only\n")
 +		}
 +	}
++
  	// Set GOPATH to an internal directory. We shouldn't actually
  	// need to store files here, since the toolchain won't
  	// depend on modules outside of vendor directories, but if
-@@ -1303,8 +1326,13 @@ func cmdbootstrap() {
+@@ -1345,8 +1369,13 @@ func cmdbootstrap() {
  		xprintf("\n")
  	}
  
@@ -123,7 +132,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  	goBootstrap := pathf("%s/go_bootstrap", tooldir)
  	cmdGo := pathf("%s/go", gobin)
  	if debug {
-@@ -1333,7 +1361,11 @@ func cmdbootstrap() {
+@@ -1375,7 +1404,11 @@ func cmdbootstrap() {
  		xprintf("\n")
  	}
  	xprintf("Building Go toolchain2 using go_bootstrap and Go toolchain1.\n")
@@ -133,10 +142,10 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
 +	} else {
 +		os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
 +	}
+ 	// Now that cmd/go is in charge of the build process, enable GOEXPERIMENT.
+ 	os.Setenv("GOEXPERIMENT", goexperiment)
  	goInstall(goBootstrap, append([]string{"-i"}, toolchain...)...)
- 	if debug {
- 		run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
-@@ -1370,50 +1402,84 @@ func cmdbootstrap() {
+@@ -1414,50 +1447,84 @@ func cmdbootstrap() {
  	}
  	checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
  
@@ -188,6 +197,8 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
 -		timelog("build", "host toolchain")
 -		if vflag > 0 {
 -			xprintf("\n")
+-		}
+-		xprintf("Building packages and commands for host, %s/%s.\n", goos, goarch)
 +
 +		if goos == oldgoos && goarch == oldgoarch {
 +			// Common case - not setting up for cross-compilation.
@@ -219,8 +230,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
 +			os.Setenv("GOARCH", goarch)
 +			os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
 +			xprintf("Building packages and commands for target, %s/%s.\n", goos, goarch)
- 		}
--		xprintf("Building packages and commands for host, %s/%s.\n", goos, goarch)
++		}
  		goInstall(goBootstrap, "std", "cmd")
  		checkNotStale(goBootstrap, "std", "cmd")
  		checkNotStale(cmdGo, "std", "cmd")
@@ -228,7 +238,12 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
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
@@ -249,16 +264,10 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
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
-@@ -1430,8 +1496,11 @@ func cmdbootstrap() {
+@@ -1474,8 +1541,11 @@ func cmdbootstrap() {
  		}
  	}
  
diff --git a/meta/recipes-devtools/go/go-1.16/0007-cmd-go-make-GOROOT-precious-by-default.patch b/meta/recipes-devtools/go/go-1.17/0007-cmd-go-make-GOROOT-precious-by-default.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.16/0007-cmd-go-make-GOROOT-precious-by-default.patch
rename to meta/recipes-devtools/go/go-1.17/0007-cmd-go-make-GOROOT-precious-by-default.patch
diff --git a/meta/recipes-devtools/go/go-1.16/0008-use-GOBUILDMODE-to-set-buildmode.patch b/meta/recipes-devtools/go/go-1.17/0008-use-GOBUILDMODE-to-set-buildmode.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.16/0008-use-GOBUILDMODE-to-set-buildmode.patch
rename to meta/recipes-devtools/go/go-1.17/0008-use-GOBUILDMODE-to-set-buildmode.patch
diff --git a/meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch b/meta/recipes-devtools/go/go-1.17/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
similarity index 83%
rename from meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
rename to meta/recipes-devtools/go/go-1.17/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
index dcbdf58752..f857b72234 100644
--- a/meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
+++ b/meta/recipes-devtools/go/go-1.17/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
@@ -1,4 +1,4 @@
-From a983bc6cd48fb0da939e3329cac18d7a3b29ecf8 Mon Sep 17 00:00:00 2001
+From 66a45dae3af140662e17ef85c2e6fe40270a2553 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 22 Feb 2021 17:54:01 -0800
 Subject: [PATCH] Revert "cmd/go: make sure CC and CXX are absolute"
@@ -17,20 +17,20 @@ Upstream-Status: Inappropriate [OE-Specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/cmd/go/internal/envcmd/env.go        |  5 -----
- src/cmd/go/internal/work/init.go         |  7 -------
+ src/cmd/go/internal/work/init.go         |  6 ------
  src/cmd/go/testdata/script/env_write.txt | 24 ------------------------
- 3 files changed, 36 deletions(-)
+ 3 files changed, 35 deletions(-)
 
 diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
-index 6937187522..29f9057c3f 100644
+index ff6f0d8..43b94e7 100644
 --- a/src/cmd/go/internal/envcmd/env.go
 +++ b/src/cmd/go/internal/envcmd/env.go
-@@ -427,11 +427,6 @@ func checkEnvWrite(key, val string) error {
+@@ -457,11 +457,6 @@ func checkEnvWrite(key, val string) error {
  		if !filepath.IsAbs(val) && val != "" {
  			return fmt.Errorf("GOPATH entry is relative; must be absolute path: %q", val)
  		}
 -	// Make sure CC and CXX are absolute paths
--	case "CC", "CXX":
+-	case "CC", "CXX", "GOMODCACHE":
 -		if !filepath.IsAbs(val) && val != "" && val != filepath.Base(val) {
 -			return fmt.Errorf("%s entry is relative; must be absolute path: %q", key, val)
 -		}
@@ -38,10 +38,10 @@ index 6937187522..29f9057c3f 100644
  
  	if !utf8.ValidString(val) {
 diff --git a/src/cmd/go/internal/work/init.go b/src/cmd/go/internal/work/init.go
-index ba7c7c2fbb..3a6df5f758 100644
+index 37a3e2d..316b0cf 100644
 --- a/src/cmd/go/internal/work/init.go
 +++ b/src/cmd/go/internal/work/init.go
-@@ -41,13 +41,6 @@ func BuildInit() {
+@@ -39,12 +39,6 @@ func BuildInit() {
  		cfg.BuildPkgdir = p
  	}
  
@@ -51,12 +51,11 @@ index ba7c7c2fbb..3a6df5f758 100644
 -			base.Fatalf("go %s: %s environment variable is relative; must be absolute path: %s\n", flag.Args()[0], key, path)
 -		}
 -	}
--
- 	// For each experiment that has been enabled in the toolchain, define a
- 	// build tag with the same name but prefixed by "goexperiment." which can be
- 	// used for compiling alternative files for the experiment. This allows
+ }
+ 
+ func instrumentInit() {
 diff --git a/src/cmd/go/testdata/script/env_write.txt b/src/cmd/go/testdata/script/env_write.txt
-index bda1e57826..c99aadb7f2 100644
+index b5e9739..566c876 100644
 --- a/src/cmd/go/testdata/script/env_write.txt
 +++ b/src/cmd/go/testdata/script/env_write.txt
 @@ -129,30 +129,6 @@ go env -w GOTMPDIR=
@@ -91,5 +90,5 @@ index bda1e57826..c99aadb7f2 100644
  env GOOS=
  env GOARCH=
 -- 
-2.30.1
+2.20.1
 
diff --git a/meta/recipes-devtools/go/go-binary-native_1.16.10.bb b/meta/recipes-devtools/go/go-binary-native_1.17.3.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.16.10.bb
rename to meta/recipes-devtools/go/go-binary-native_1.17.3.bb
index 4866c9f847..1b43a804da 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.16.10.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.17.3.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "414cd18ce1d193769b9e97d2401ad718755ab47816e13b2a1cde203d263b55cf"
-SRC_URI[go_linux_arm64.sha256sum] = "bfe1d4b82626c742b4690a832ca59a21e3d702161556f3c0ed26dffb368927e9"
+SRC_URI[go_linux_amd64.sha256sum] = "550f9845451c0c94be679faf116291e7807a8d78b43149f9506c1b15eb89008c"
+SRC_URI[go_linux_arm64.sha256sum] = "06f505c8d27203f78706ad04e47050b49092f1b06dc9ac4fbee4f0e4d015c8d4"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.16.10.bb b/meta/recipes-devtools/go/go-cross-canadian_1.17.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.16.10.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.17.3.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.16.10.bb b/meta/recipes-devtools/go/go-cross_1.17.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.16.10.bb
rename to meta/recipes-devtools/go/go-cross_1.17.3.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.16.10.bb b/meta/recipes-devtools/go/go-crosssdk_1.17.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.16.10.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.17.3.bb
diff --git a/meta/recipes-devtools/go/go-native_1.16.10.bb b/meta/recipes-devtools/go/go-native_1.17.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.16.10.bb
rename to meta/recipes-devtools/go/go-native_1.17.3.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.16.10.bb b/meta/recipes-devtools/go/go-runtime_1.17.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.16.10.bb
rename to meta/recipes-devtools/go/go-runtime_1.17.3.bb
diff --git a/meta/recipes-devtools/go/go_1.16.10.bb b/meta/recipes-devtools/go/go_1.17.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.16.10.bb
rename to meta/recipes-devtools/go/go_1.17.3.bb
-- 
2.20.1


