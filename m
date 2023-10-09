Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79129E95A91
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 14:22:20 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.62761.1696861331168963253
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 07:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d16tk31E;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-32799639a2aso4556973f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 07:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696861329; x=1697466129; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7p1f5Z6WuG4FleI8RM/L9NUVrTJaw0NNd7wyR3kCrpA=;
        b=d16tk31EtNlVYcVCtHlF0v2JHt7VoXhquKSCZLx8O24ZyJJx9SqHCe2ERn5XmF2zvK
         JDT+fWzDQtUnVFiGbshrzcZpKATAAYMZ68VOiQMP54MVmZCi5EhjmHegbSP6fIBqWnmR
         PbG14ZPlsXVCNeHw0Q6aZNxkoHqc9NS+iI1wK7mfzSQ4/DYu/5agCbKCtnGsSZ/veay+
         McRIcBS+DCZ7SnYQRsTWFpxW8CY6VSMn/oFx4zl+GHePuN3b+ClMTpXadDptX7BHRmWz
         qC3NEj1qup2ZxBtZL4MvxNV/cMJCNdczULHinvl9bx5u2bBZTPy6CePGlv4MinpPDHXs
         P0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696861329; x=1697466129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7p1f5Z6WuG4FleI8RM/L9NUVrTJaw0NNd7wyR3kCrpA=;
        b=qAbtgoff1Ghg/ZXIDY+hmgXY6aQqyKJOTl/eysZyN425pwglIHWkoexSG+8klhrcBp
         xRmEnYM2c+48So5X5Xr3HhbjiGjU9K8qw0UVwc1BU60zUlCWX5rjpDOvgfd5irrWq+WA
         BLvDkKuTCctzY12dPUjnu3Ka2inafRGrxG4v9+ewkFaPrzWNt6FkHGPcOUHsyW6Ioc/j
         C1HgZGt0cnHLoDz1v6KNoOKk39WJtw1P5/oOa7OUl5XMM2Q0NVQ2ULYhye83fy7llEZn
         DsZWsjkVTUCE02tPqTzaErQoO854HKIAfkAVu3wcf5waBsHkoGtwuJxhkVGfGux6sPq1
         E84A==
X-Gm-Message-State: AOJu0Yw0laUSYroh9KaxdfX1UEOB9ZYffyniy+1bm76vzOOCSEFrkSzk
	6htr5+lnJjx3dAwfMKCj0g2prJrJD0Yrnw==
X-Google-Smtp-Source: AGHT+IFnIgAWLpweP5mlQaGQfYoldvf9FRGrhq4ntHKxunzazCRfUjF1UXbhFcg7Df87bo/+Ne/zNg==
X-Received: by 2002:a5d:4dcc:0:b0:319:785a:fce5 with SMTP id f12-20020a5d4dcc000000b00319785afce5mr12920853wru.38.1696861328107;
        Mon, 09 Oct 2023 07:22:08 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.net ([2001:bc8:6005:6:8218:44ff:fef2:ade0])
        by smtp.gmail.com with ESMTPSA id h16-20020adffd50000000b003197869bcd7sm9858195wrs.13.2023.10.09.07.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 07:22:07 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] go: update 1.20.7 -> 1.20.8
Date: Mon,  9 Oct 2023 14:21:37 +0000
Message-Id: <20231009142137.976589-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 14:22:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188836

Upgrade to latest 1.20.x release [1]:

$ git log --oneline go1.20.7..go1.20.8
d5b8518043 (tag: go1.20.8) [release-branch.go1.20] go1.20.8
2070531d2f [release-branch.go1.20] html/template: properly handle special tags within the script context
023b542edf [release-branch.go1.20] html/template: support HTML-like comments in script contexts
612da32fb5 [release-branch.go1.20] cmd/compile: in expandCalls, move all arg marshalling into call block
f0b8768dbc [release-branch.go1.20] path/filepath: don't drop .. elements when cleaning invalid Windows paths
b463668275 [release-branch.go1.20] runtime: profiling on Darwin cannot use blocking reads
974a3c9af7 [release-branch.go1.20] go/types, types2: don't panic during interface completion
14e3c7338d [release-branch.go1.20] cmd/api: rename api.go to main_test.go
095cfba86b [release-branch.go1.20] crypto/tls: add GODEBUG to control max RSA key size
1a91bb94b0 [release-branch.go1.20] cmd/go: do not index std as a module in modcache
ede3e278ae [release-branch.go1.20] net/http: permit requests with invalid Host headers
201f8b40dc [release-branch.go1.20] cmd/go: refuse to build Go 1.22 code

[1] https://github.com/golang/go/compare/go1.20.7...go1.20.8

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../go/{go-1.20.7.inc => go-1.20.8.inc}                |  2 +-
 ...ary-native_1.20.7.bb => go-binary-native_1.20.8.bb} |  6 +++---
 ...-canadian_1.20.7.bb => go-cross-canadian_1.20.8.bb} |  0
 .../go/{go-cross_1.20.7.bb => go-cross_1.20.8.bb}      |  0
 .../{go-crosssdk_1.20.7.bb => go-crosssdk_1.20.8.bb}   |  0
 .../go/{go-native_1.20.7.bb => go-native_1.20.8.bb}    |  0
 .../go/{go-runtime_1.20.7.bb => go-runtime_1.20.8.bb}  |  0
 ...make-content-based-hash-generation-less-pedan.patch | 10 +++++-----
 .../go/0003-ld-add-soname-to-shareable-objects.patch   |  8 ++++----
 .../0006-cmd-go-make-GOROOT-precious-by-default.patch  |  8 ++++----
 ...ec.go-do-not-write-linker-flags-into-buildids.patch |  6 +++---
 ...-Filter-build-paths-on-staticly-linked-arches.patch |  8 ++++----
 .../recipes-devtools/go/{go_1.20.7.bb => go_1.20.8.bb} |  0
 13 files changed, 24 insertions(+), 24 deletions(-)
 rename meta/recipes-devtools/go/{go-1.20.7.inc => go-1.20.8.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.20.7.bb => go-binary-native_1.20.8.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.20.7.bb => go-cross-canadian_1.20.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.20.7.bb => go-cross_1.20.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.20.7.bb => go-crosssdk_1.20.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.20.7.bb => go-native_1.20.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.20.7.bb => go-runtime_1.20.8.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.20.7.bb => go_1.20.8.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.20.7.inc b/meta/recipes-devtools/go/go-1.20.8.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.20.7.inc
rename to meta/recipes-devtools/go/go-1.20.8.inc
index f7974367cc..958d751323 100644
--- a/meta/recipes-devtools/go/go-1.20.7.inc
+++ b/meta/recipes-devtools/go/go-1.20.8.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "2c5ee9c9ec1e733b0dbbc2bdfed3f62306e51d8172bf38f4f4e542b27520f597"
+SRC_URI[main.sha256sum] = "38d71714fa5279f97240451956d8e47e3c1b6a5de7cb84137949d62b5dd3182e"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.20.7.bb b/meta/recipes-devtools/go/go-binary-native_1.20.8.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.20.7.bb
rename to meta/recipes-devtools/go/go-binary-native_1.20.8.bb
index 3decde1954..cd6dbcb5e9 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.20.7.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.20.8.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "f0a87f1bcae91c4b69f8dc2bc6d7e6bfcd7524fceec130af525058c0c17b1b44"
-SRC_URI[go_linux_arm64.sha256sum] = "44781ae3b153c3b07651d93b6bc554e835a36e2d72a696281c1e4dad9efffe43"
-SRC_URI[go_linux_ppc64le.sha256sum] = "6318a1db307c12b8afe68808bd6fae4fba1e558a85b958216096869ed506dcb3"
+SRC_URI[go_linux_amd64.sha256sum] = "cc97c28d9c252fbf28f91950d830201aa403836cbed702a05932e63f7f0c7bc4"
+SRC_URI[go_linux_arm64.sha256sum] = "15ab379c6a2b0d086fe3e74be4599420e66549edf7426a300ee0f3809500f89e"
+SRC_URI[go_linux_ppc64le.sha256sum] = "a5034a9c7eac6c5bcc650c2605c5edb4039c7b6064e2a2ea43c415c8af91f5f6"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.20.7.bb b/meta/recipes-devtools/go/go-cross-canadian_1.20.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.20.7.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.20.8.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.20.7.bb b/meta/recipes-devtools/go/go-cross_1.20.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.20.7.bb
rename to meta/recipes-devtools/go/go-cross_1.20.8.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.20.7.bb b/meta/recipes-devtools/go/go-crosssdk_1.20.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.20.7.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.20.8.bb
diff --git a/meta/recipes-devtools/go/go-native_1.20.7.bb b/meta/recipes-devtools/go/go-native_1.20.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.20.7.bb
rename to meta/recipes-devtools/go/go-native_1.20.8.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.20.7.bb b/meta/recipes-devtools/go/go-runtime_1.20.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.20.7.bb
rename to meta/recipes-devtools/go/go-runtime_1.20.8.bb
diff --git a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
index 56487e34e3..9a2551031a 100644
--- a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
+++ b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
@@ -44,7 +44,7 @@ index 66ef5ce..fb7448a 100644
  		// Should not happen - b.CFlags was given an empty package.
  		fmt.Fprintf(os.Stderr, "go: invalid cflags: %v\n", err)
 diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index d6fa847..7e4fcb3 100644
+index 67d1193..62e1774 100644
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
 @@ -223,6 +223,8 @@ func (b *Builder) Do(ctx context.Context, root *Action) {
@@ -103,7 +103,7 @@ index d6fa847..7e4fcb3 100644
  	}
  
  	// Configuration specific to compiler toolchain.
-@@ -2970,8 +2972,25 @@ func envList(key, def string) []string {
+@@ -2989,8 +2991,25 @@ func envList(key, def string) []string {
  	return args
  }
  
@@ -130,7 +130,7 @@ index d6fa847..7e4fcb3 100644
  	if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, checkCompilerFlags); err != nil {
  		return
  	}
-@@ -2987,6 +3006,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
+@@ -3006,6 +3025,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
  	if ldflags, err = buildFlags("LDFLAGS", defaultCFlags, p.CgoLDFLAGS, checkLinkerFlags); err != nil {
  		return
  	}
@@ -144,7 +144,7 @@ index d6fa847..7e4fcb3 100644
  
  	return
  }
-@@ -3002,7 +3028,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
+@@ -3021,7 +3047,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
  
  func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo, outObj []string, err error) {
  	p := a.Package
@@ -153,7 +153,7 @@ index d6fa847..7e4fcb3 100644
  	if err != nil {
  		return nil, nil, err
  	}
-@@ -3510,7 +3536,7 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
+@@ -3577,7 +3603,7 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
  
  // Run SWIG on one SWIG input file.
  func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string, err error) {
diff --git a/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch b/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
index 2bc7d194bb..ced0be1998 100644
--- a/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
+++ b/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
@@ -18,10 +18,10 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/ld/lib.go
-index c073017..e60d39a 100644
+index 03b9f11..e91c92f 100644
 --- a/src/cmd/link/internal/ld/lib.go
 +++ b/src/cmd/link/internal/ld/lib.go
-@@ -1491,6 +1491,7 @@ func (ctxt *Link) hostlink() {
+@@ -1504,6 +1504,7 @@ func (ctxt *Link) hostlink() {
  				argv = append(argv, "-Wl,-z,relro")
  			}
  			argv = append(argv, "-shared")
@@ -29,7 +29,7 @@ index c073017..e60d39a 100644
  			if ctxt.HeadType == objabi.Hwindows {
  				argv = addASLRargs(argv, *flagAslr)
  			} else {
-@@ -1506,6 +1507,7 @@ func (ctxt *Link) hostlink() {
+@@ -1519,6 +1520,7 @@ func (ctxt *Link) hostlink() {
  			argv = append(argv, "-Wl,-z,relro")
  		}
  		argv = append(argv, "-shared")
@@ -37,7 +37,7 @@ index c073017..e60d39a 100644
  	case BuildModePlugin:
  		if ctxt.HeadType == objabi.Hdarwin {
  			argv = append(argv, "-dynamiclib")
-@@ -1514,6 +1516,7 @@ func (ctxt *Link) hostlink() {
+@@ -1527,6 +1529,7 @@ func (ctxt *Link) hostlink() {
  				argv = append(argv, "-Wl,-z,relro")
  			}
  			argv = append(argv, "-shared")
diff --git a/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch b/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
index 38b28b9877..520e41da86 100644
--- a/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
+++ b/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
@@ -66,11 +66,11 @@ index 2f2860a..8cc6166 100644
  
  // Note that flags consulted by other parts of the code
 diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index 7e4fcb3..d83b31b 100644
+index 62e1774..cde867b 100644
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
-@@ -527,6 +527,23 @@ func (b *Builder) build(ctx context.Context, a *Action) (err error) {
- 		return errors.New("binary-only packages are no longer supported")
+@@ -546,6 +546,23 @@ func (b *Builder) build(ctx context.Context, a *Action) (err error) {
+ 		return errors.New("cannot compile Go " + p.Module.GoVersion + " code")
  	}
  
 +	if goRootPrecious && (a.Package.Standard || a.Package.Goroot) {
@@ -93,7 +93,7 @@ index 7e4fcb3..d83b31b 100644
  	if err := b.Mkdir(a.Objdir); err != nil {
  		return err
  	}
-@@ -1624,6 +1641,14 @@ func (b *Builder) linkShared(ctx context.Context, a *Action) (err error) {
+@@ -1643,6 +1660,14 @@ func (b *Builder) linkShared(ctx context.Context, a *Action) (err error) {
  		return err
  	}
  
diff --git a/meta/recipes-devtools/go/go/0007-exec.go-do-not-write-linker-flags-into-buildids.patch b/meta/recipes-devtools/go/go/0007-exec.go-do-not-write-linker-flags-into-buildids.patch
index a821cf02fc..7d9869b536 100644
--- a/meta/recipes-devtools/go/go/0007-exec.go-do-not-write-linker-flags-into-buildids.patch
+++ b/meta/recipes-devtools/go/go/0007-exec.go-do-not-write-linker-flags-into-buildids.patch
@@ -15,10 +15,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index d83b31b..a646fbb 100644
+index cde867b..5cb1812 100644
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
-@@ -1312,7 +1312,7 @@ func (b *Builder) linkActionID(a *Action) cache.ActionID {
+@@ -1331,7 +1331,7 @@ func (b *Builder) linkActionID(a *Action) cache.ActionID {
  	}
  
  	// Toolchain-dependent configuration, shared with b.linkSharedActionID.
@@ -27,7 +27,7 @@ index d83b31b..a646fbb 100644
  
  	// Input files.
  	for _, a1 := range a.Deps {
-@@ -1607,7 +1607,7 @@ func (b *Builder) linkSharedActionID(a *Action) cache.ActionID {
+@@ -1626,7 +1626,7 @@ func (b *Builder) linkSharedActionID(a *Action) cache.ActionID {
  	fmt.Fprintf(h, "goos %s goarch %s\n", cfg.Goos, cfg.Goarch)
  
  	// Toolchain-dependent configuration, shared with b.linkActionID.
diff --git a/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch b/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch
index 705c922141..49da5f6297 100644
--- a/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch
+++ b/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch
@@ -16,10 +16,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 13 insertions(+), 2 deletions(-)
 
 diff --git a/src/cmd/go/internal/load/pkg.go b/src/cmd/go/internal/load/pkg.go
-index 56a4e5e..22edbdb 100644
+index f427e29..6d6dc4e 100644
 --- a/src/cmd/go/internal/load/pkg.go
 +++ b/src/cmd/go/internal/load/pkg.go
-@@ -2266,6 +2266,17 @@ func (p *Package) collectDeps() {
+@@ -2270,6 +2270,17 @@ func (p *Package) collectDeps() {
  // to their VCS information (vcsStatusError).
  var vcsStatusCache par.Cache
  
@@ -37,7 +37,7 @@ index 56a4e5e..22edbdb 100644
  // setBuildInfo gathers build information, formats it as a string to be
  // embedded in the binary, then sets p.Internal.BuildInfo to that string.
  // setBuildInfo should only be called on a main package with no errors.
-@@ -2372,7 +2383,7 @@ func (p *Package) setBuildInfo(autoVCS bool) {
+@@ -2376,7 +2387,7 @@ func (p *Package) setBuildInfo(autoVCS bool) {
  	if gcflags := BuildGcflags.String(); gcflags != "" && cfg.BuildContext.Compiler == "gc" {
  		appendSetting("-gcflags", gcflags)
  	}
@@ -46,7 +46,7 @@ index 56a4e5e..22edbdb 100644
  		// https://go.dev/issue/52372: only include ldflags if -trimpath is not set,
  		// since it can include system paths through various linker flags (notably
  		// -extar, -extld, and -extldflags).
-@@ -2418,7 +2429,7 @@ func (p *Package) setBuildInfo(autoVCS bool) {
+@@ -2422,7 +2433,7 @@ func (p *Package) setBuildInfo(autoVCS bool) {
  	// subset of flags that are known not to be paths?
  	if cfg.BuildContext.CgoEnabled && !cfg.BuildTrimpath {
  		for _, name := range []string{"CGO_CFLAGS", "CGO_CPPFLAGS", "CGO_CXXFLAGS", "CGO_LDFLAGS"} {
diff --git a/meta/recipes-devtools/go/go_1.20.7.bb b/meta/recipes-devtools/go/go_1.20.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.20.7.bb
rename to meta/recipes-devtools/go/go_1.20.8.bb
-- 
2.34.1


