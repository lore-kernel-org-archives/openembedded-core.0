Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02FF5C5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 12:12:49 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.10349.1709727168190072961
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 04:12:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AaygLb7Q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33e5978fc1bso232968f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 04:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1709727166; x=1710331966; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E3TnFVSfwYG31bgptlfG5sQ0F6fQ/8YKd3KjmGQetNA=;
        b=AaygLb7QYZHrsYgDP/+VNKwVwDuwBNgZMF/jgbJ2TzpBNkN+0SknpeRX94W61oyw1F
         z7Vzw5hYSh+vmxVuZmPaAhJtN/UqbF81FrsX9QXqCurdZ+D4PQ97MAKjyZqncS9g1Skb
         gtyGNe6+A5fpzlc96r+TDC6YqbKf8fAVzkPo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709727166; x=1710331966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E3TnFVSfwYG31bgptlfG5sQ0F6fQ/8YKd3KjmGQetNA=;
        b=XuNXHV/0ZtYGMA+7p143wY/6ekPsJ24nzSFDOLZaT7s8Yg0PDCWZF/26DRJ8qE7YhO
         affFDjsG4g1/h6kJDSSplLmjfIVJXdDlAwV69zFky91KtLb9IUukZv+fJPJ/nEs1Qinn
         0j6KSwcJSP5WE8mPimOzsFaPR5+4Yc0oA9kEbIQvIFApaU8as+3HqJKjTvQpy3rEnJGT
         99hhnzMV8kk/jzhaaH0gJyuYQTl5NACNo3fbR0wBwqa4TNGFrZwE+aqQLepokrwMFBlv
         jYAZc3ErcLnFGkZ66wKdjF2RWy8Ahk3aBUvkOzcmjwvZ7L3Llds/r9DEsp7h/oGbdJpp
         srpw==
X-Gm-Message-State: AOJu0YyLGu5S4LYs1Bm5To+eQP56lkncqPq2OeX1KHqhEtgSg70j9VWK
	2GFGDfsfOzYcBDQbybstgEFNcMuXJENUJVBwOCn0kD4QJTkVpAZ08D9T9wTMuiaFbbZWXTD1/U9
	n
X-Google-Smtp-Source: AGHT+IGvbEqGniopg0cjUsZuju2Z2hJrUyW3NqwFRbE8n1REttM7bjhoPeOLdrtIPq7SN52uPv18Wg==
X-Received: by 2002:adf:f407:0:b0:33b:784c:276e with SMTP id g7-20020adff407000000b0033b784c276emr11893132wro.25.1709727166118;
        Wed, 06 Mar 2024 04:12:46 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1f9c:b564:4f14:a0ea])
        by smtp.gmail.com with ESMTPSA id h3-20020adfa4c3000000b0033dd2a7167fsm17634099wrb.29.2024.03.06.04.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 04:12:45 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [PATCH 1/4] go: bump 1.22.0
Date: Wed,  6 Mar 2024 12:12:40 +0000
Message-Id: <20240306121243.2247637-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 12:12:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196665

From: Jose Quaresma <quaresma.jose@gmail.com>

Go 1.22 Release Notes
https://go.dev/doc/go1.22

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../go/{go-1.21.7.inc => go-1.22.0.inc}       |  2 +-
 ...e_1.21.7.bb => go-binary-native_1.22.0.bb} |  6 ++--
 ..._1.21.7.bb => go-cross-canadian_1.22.0.bb} |  0
 ...{go-cross_1.21.7.bb => go-cross_1.22.0.bb} |  0
 ...osssdk_1.21.7.bb => go-crosssdk_1.22.0.bb} |  0
 ...o-native_1.21.7.bb => go-native_1.22.0.bb} |  0
 ...runtime_1.21.7.bb => go-runtime_1.22.0.bb} |  0
 ...ent-based-hash-generation-less-pedan.patch | 32 +++++++++----------
 ...OOLDIR-to-be-overridden-in-the-envir.patch |  8 ++---
 ...3-ld-add-soname-to-shareable-objects.patch | 10 +++---
 ...de-CC-when-building-dist-and-go_boot.patch |  6 ++--
 ...dist-separate-host-and-target-builds.patch | 18 +++++------
 ...d-go-make-GOROOT-precious-by-default.patch | 22 ++++++-------
 ...not-write-linker-flags-into-buildids.patch |  8 ++---
 ...ldgo.go-do-not-hardcode-host-compile.patch |  4 +--
 ...uild-paths-on-staticly-linked-arches.patch | 10 +++---
 .../go/{go_1.21.7.bb => go_1.22.0.bb}         |  0
 18 files changed, 64 insertions(+), 64 deletions(-)
 rename meta/recipes-devtools/go/{go-1.21.7.inc => go-1.22.0.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.21.7.bb => go-binary-native_1.22.0.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.21.7.bb => go-cross-canadian_1.22.0.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.21.7.bb => go-cross_1.22.0.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.21.7.bb => go-crosssdk_1.22.0.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.21.7.bb => go-native_1.22.0.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.21.7.bb => go-runtime_1.22.0.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.21.7.bb => go_1.22.0.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index cc303afda9e..643394f3eb4 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -23,7 +23,7 @@ GDBVERSION ?= "14.%"
 GLIBCVERSION ?= "2.39%"
 LINUXLIBCVERSION ?= "6.6%"
 QEMUVERSION ?= "8.2%"
-GOVERSION ?= "1.21%"
+GOVERSION ?= "1.22%"
 RUSTVERSION ?= "1.75%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/go/go-1.21.7.inc b/meta/recipes-devtools/go/go-1.22.0.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.21.7.inc
rename to meta/recipes-devtools/go/go-1.22.0.inc
index 6de24e1e22b..230ada5e4b2 100644
--- a/meta/recipes-devtools/go/go-1.21.7.inc
+++ b/meta/recipes-devtools/go/go-1.22.0.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "00197ab20f33813832bff62fd93cca1c42a08cc689a32a6672ca49591959bff6"
+SRC_URI[main.sha256sum] = "4d196c3d41a0d6c1dfc64d04e3cc1f608b0c436bd87b7060ce3e23234e1f4d5c"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.21.7.bb b/meta/recipes-devtools/go/go-binary-native_1.22.0.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.21.7.bb
rename to meta/recipes-devtools/go/go-binary-native_1.22.0.bb
index 18779b18b62..acd2018dc37 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.21.7.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.22.0.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "13b76a9b2a26823e53062fa841b07087d48ae2ef2936445dc34c4ae03293702c"
-SRC_URI[go_linux_arm64.sha256sum] = "a9bc1ccedbfde059f25b3a2ad81ae4cdf21192ae207dfd3ccbbfe99c3749e233"
-SRC_URI[go_linux_ppc64le.sha256sum] = "48a99ecce9b1e632870c29420088f61cf17a6f0c5bdb3cc821ff5c00e14b1a8a"
+SRC_URI[go_linux_amd64.sha256sum] = "f6c8a87aa03b92c4b0bf3d558e28ea03006eb29db78917daec5cfb6ec1046265"
+SRC_URI[go_linux_arm64.sha256sum] = "6a63fef0e050146f275bf02a0896badfe77c11b6f05499bb647e7bd613a45a10"
+SRC_URI[go_linux_ppc64le.sha256sum] = "0e57f421df9449066f00155ce98a5be93744b3d81b00ee4c2c9b511be2a31d93"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.21.7.bb b/meta/recipes-devtools/go/go-cross-canadian_1.22.0.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.21.7.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.22.0.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.21.7.bb b/meta/recipes-devtools/go/go-cross_1.22.0.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.21.7.bb
rename to meta/recipes-devtools/go/go-cross_1.22.0.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.21.7.bb b/meta/recipes-devtools/go/go-crosssdk_1.22.0.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.21.7.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.22.0.bb
diff --git a/meta/recipes-devtools/go/go-native_1.21.7.bb b/meta/recipes-devtools/go/go-native_1.22.0.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.21.7.bb
rename to meta/recipes-devtools/go/go-native_1.22.0.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.21.7.bb b/meta/recipes-devtools/go/go-runtime_1.22.0.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.21.7.bb
rename to meta/recipes-devtools/go/go-runtime_1.22.0.bb
diff --git a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
index 3bd756449e7..564837c7cd1 100644
--- a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
+++ b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
@@ -32,7 +32,7 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  2 files changed, 36 insertions(+), 10 deletions(-)
 
 diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
-index c7c2e83..4a90d9d 100644
+index c7c2e83e0f..4a90d9da5c 100644
 --- a/src/cmd/go/internal/envcmd/env.go
 +++ b/src/cmd/go/internal/envcmd/env.go
 @@ -189,7 +189,7 @@ func ExtraEnvVarsCostly() []cfg.EnvVar {
@@ -45,10 +45,10 @@ index c7c2e83..4a90d9d 100644
  		// Should not happen - b.CFlags was given an empty package.
  		fmt.Fprintf(os.Stderr, "go: invalid cflags: %v\n", err)
 diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index 13d2a78..e3dd486 100644
+index e05471b06c..9724cd07d0 100644
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
-@@ -231,6 +231,8 @@ func (b *Builder) Do(ctx context.Context, root *Action) {
+@@ -232,6 +232,8 @@ func (b *Builder) Do(ctx context.Context, root *Action) {
  	writeActionGraph()
  }
  
@@ -57,7 +57,7 @@ index 13d2a78..e3dd486 100644
  // buildActionID computes the action ID for a build action.
  func (b *Builder) buildActionID(a *Action) cache.ActionID {
  	p := a.Package
-@@ -252,7 +254,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+@@ -253,7 +255,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
  		if p.Module != nil {
  			fmt.Fprintf(h, "module %s@%s\n", p.Module.Path, p.Module.Version)
  		}
@@ -66,7 +66,7 @@ index 13d2a78..e3dd486 100644
  		// The Go compiler always hides the exact value of $GOROOT
  		// when building things in GOROOT.
  		//
-@@ -284,9 +286,9 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+@@ -285,9 +287,9 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
  	}
  	if len(p.CgoFiles)+len(p.SwigFiles)+len(p.SwigCXXFiles) > 0 {
  		fmt.Fprintf(h, "cgo %q\n", b.toolID("cgo"))
@@ -78,7 +78,7 @@ index 13d2a78..e3dd486 100644
  		fmt.Fprintf(h, "CC=%q %q %q %q\n", ccExe, cppflags, cflags, ldflags)
  		// Include the C compiler tool ID so that if the C
  		// compiler changes we rebuild the package.
-@@ -294,14 +296,14 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+@@ -295,14 +297,14 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
  			fmt.Fprintf(h, "CC ID=%q\n", ccID)
  		}
  		if len(p.CXXFiles)+len(p.SwigCXXFiles) > 0 {
@@ -95,7 +95,7 @@ index 13d2a78..e3dd486 100644
  			fmt.Fprintf(h, "FC=%q %q\n", fcExe, fflags)
  			if fcID, _, err := b.gccToolID(fcExe[0], "f95"); err == nil {
  				fmt.Fprintf(h, "FC ID=%q\n", fcID)
-@@ -318,7 +320,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+@@ -319,7 +321,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
  		}
  	}
  	if p.Internal.BuildInfo != nil {
@@ -104,7 +104,7 @@ index 13d2a78..e3dd486 100644
  	}
  
  	// Configuration specific to compiler toolchain.
-@@ -3137,8 +3139,25 @@ func envList(key, def string) []string {
+@@ -2679,8 +2681,25 @@ func envList(key, def string) []string {
  	return args
  }
  
@@ -131,7 +131,7 @@ index 13d2a78..e3dd486 100644
  	if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, checkCompilerFlags); err != nil {
  		return
  	}
-@@ -3154,6 +3173,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
+@@ -2696,6 +2715,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
  	if ldflags, err = buildFlags("LDFLAGS", defaultCFlags, p.CgoLDFLAGS, checkLinkerFlags); err != nil {
  		return
  	}
@@ -145,24 +145,24 @@ index 13d2a78..e3dd486 100644
  
  	return
  }
-@@ -3169,7 +3195,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
- 
- func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo, outObj []string, err error) {
+@@ -2713,7 +2739,7 @@ func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgo
  	p := a.Package
+ 	sh := b.Shell(a)
+ 
 -	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoLDFLAGS, err := b.CFlags(p)
 +	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoLDFLAGS, err := b.CFlags(p, false)
  	if err != nil {
  		return nil, nil, err
  	}
-@@ -3725,7 +3751,7 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
+@@ -3268,7 +3294,7 @@ func (b *Builder) swigOne(a *Action, file, objdir string, pcCFLAGS []string, cxx
+ 	p := a.Package
+ 	sh := b.Shell(a)
  
- // Run SWIG on one SWIG input file.
- func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string, err error) {
 -	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err := b.CFlags(p)
 +	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err := b.CFlags(p, false)
  	if err != nil {
  		return "", "", err
  	}
 -- 
-2.43.0
+2.44.0
 
diff --git a/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch b/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
index 6d1a02e6c0e..001c94a4e78 100644
--- a/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
+++ b/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
@@ -20,7 +20,7 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  2 files changed, 8 insertions(+), 2 deletions(-)
 
 diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
-index 8973a87..adc9fd2 100644
+index 32e59b446a..06ee4de8a9 100644
 --- a/src/cmd/dist/build.go
 +++ b/src/cmd/dist/build.go
 @@ -259,7 +259,9 @@ func xinit() {
@@ -35,10 +35,10 @@ index 8973a87..adc9fd2 100644
  	goversion := findgoversion()
  	isRelease = strings.HasPrefix(goversion, "release.") || strings.HasPrefix(goversion, "go")
 diff --git a/src/cmd/go/internal/cfg/cfg.go b/src/cmd/go/internal/cfg/cfg.go
-index 8caa22a..0c322fb 100644
+index a8daa2dfc3..393ada39c9 100644
 --- a/src/cmd/go/internal/cfg/cfg.go
 +++ b/src/cmd/go/internal/cfg/cfg.go
-@@ -231,7 +231,11 @@ func SetGOROOT(goroot string, isTestGo bool) {
+@@ -230,7 +230,11 @@ func SetGOROOT(goroot string, isTestGo bool) {
  			// This matches the initialization of ToolDir in go/build, except for
  			// using ctxt.GOROOT and the installed GOOS and GOARCH rather than the
  			// GOROOT, GOOS, and GOARCH reported by the runtime package.
@@ -52,5 +52,5 @@ index 8caa22a..0c322fb 100644
  	}
  }
 -- 
-2.43.0
+2.44.0
 
diff --git a/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch b/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
index d0cd8d244e2..9cab2969c8f 100644
--- a/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
+++ b/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
@@ -19,10 +19,10 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  1 file changed, 3 insertions(+)
 
 diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/ld/lib.go
-index 5e5d255..459e9dc 100644
+index eab74dc328..ae9bbc9093 100644
 --- a/src/cmd/link/internal/ld/lib.go
 +++ b/src/cmd/link/internal/ld/lib.go
-@@ -1563,6 +1563,7 @@ func (ctxt *Link) hostlink() {
+@@ -1576,6 +1576,7 @@ func (ctxt *Link) hostlink() {
  				argv = append(argv, "-Wl,-z,relro")
  			}
  			argv = append(argv, "-shared")
@@ -30,7 +30,7 @@ index 5e5d255..459e9dc 100644
  			if ctxt.HeadType == objabi.Hwindows {
  				argv = addASLRargs(argv, *flagAslr)
  			} else {
-@@ -1578,6 +1579,7 @@ func (ctxt *Link) hostlink() {
+@@ -1591,6 +1592,7 @@ func (ctxt *Link) hostlink() {
  			argv = append(argv, "-Wl,-z,relro")
  		}
  		argv = append(argv, "-shared")
@@ -38,7 +38,7 @@ index 5e5d255..459e9dc 100644
  	case BuildModePlugin:
  		if ctxt.HeadType == objabi.Hdarwin {
  			argv = append(argv, "-dynamiclib")
-@@ -1586,6 +1588,7 @@ func (ctxt *Link) hostlink() {
+@@ -1599,6 +1601,7 @@ func (ctxt *Link) hostlink() {
  				argv = append(argv, "-Wl,-z,relro")
  			}
  			argv = append(argv, "-shared")
@@ -47,5 +47,5 @@ index 5e5d255..459e9dc 100644
  	}
  
 -- 
-2.30.2
+2.44.0
 
diff --git a/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-dist-and-go_boot.patch
index 5dd2621adc9..8889aef1cf8 100644
--- a/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-dist-and-go_boot.patch
+++ b/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-dist-and-go_boot.patch
@@ -19,10 +19,10 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/make.bash b/src/make.bash
-index 755b3b0..eddfc3c 100755
+index 76ad51624a..074e129a24 100755
 --- a/src/make.bash
 +++ b/src/make.bash
-@@ -198,7 +198,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ]; then
+@@ -198,7 +198,7 @@ if [[ "$GOROOT_BOOTSTRAP" == "$GOROOT" ]]; then
  	exit 1
  fi
  rm -f cmd/dist/dist
@@ -41,5 +41,5 @@ index 755b3b0..eddfc3c 100755
  
  # DO NOT ADD ANY NEW CODE HERE.
 -- 
-2.43.0
+2.44.0
 
diff --git a/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch b/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch
index f8dca65ed4f..02269be9699 100644
--- a/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch
+++ b/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch
@@ -44,7 +44,7 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  1 file changed, 75 insertions(+), 1 deletion(-)
 
 diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
-index adc9fd2..5fff592 100644
+index 06ee4de8a9..74b7c7098f 100644
 --- a/src/cmd/dist/build.go
 +++ b/src/cmd/dist/build.go
 @@ -46,6 +46,7 @@ var (
@@ -83,7 +83,7 @@ index adc9fd2..5fff592 100644
  	xatexit(func() {
  		if files := xreaddir(goosGoarch); len(files) == 0 {
  			xremove(goosGoarch)
-@@ -1344,14 +1350,20 @@ func cmdbootstrap() {
+@@ -1338,14 +1344,20 @@ func cmdbootstrap() {
  	defer timelog("end", "dist bootstrap")
  
  	var debug, distpack, force, noBanner, noClean bool
@@ -105,7 +105,7 @@ index adc9fd2..5fff592 100644
  
  	if noClean {
  		xprintf("warning: --no-clean is deprecated and has no effect; use 'go install std cmd' instead\n")
-@@ -1363,6 +1375,18 @@ func cmdbootstrap() {
+@@ -1357,6 +1369,18 @@ func cmdbootstrap() {
  			"Use the -force flag to build anyway.\n", goos, goarch)
  	}
  
@@ -124,7 +124,7 @@ index adc9fd2..5fff592 100644
  	// Set GOPATH to an internal directory. We shouldn't actually
  	// need to store files here, since the toolchain won't
  	// depend on modules outside of vendor directories, but if
-@@ -1440,9 +1464,14 @@ func cmdbootstrap() {
+@@ -1434,9 +1458,14 @@ func cmdbootstrap() {
  		xprintf("\n")
  	}
  
@@ -139,7 +139,7 @@ index adc9fd2..5fff592 100644
  	goBootstrap := pathf("%s/go_bootstrap", tooldir)
  	if debug {
  		run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
-@@ -1470,7 +1499,11 @@ func cmdbootstrap() {
+@@ -1464,7 +1493,11 @@ func cmdbootstrap() {
  		xprintf("\n")
  	}
  	xprintf("Building Go toolchain2 using go_bootstrap and Go toolchain1.\n")
@@ -151,7 +151,7 @@ index adc9fd2..5fff592 100644
  	// Now that cmd/go is in charge of the build process, enable GOEXPERIMENT.
  	os.Setenv("GOEXPERIMENT", goexperiment)
  	// No need to enable PGO for toolchain2.
-@@ -1523,6 +1556,7 @@ func cmdbootstrap() {
+@@ -1517,6 +1550,7 @@ func cmdbootstrap() {
  		os.Setenv("GOCACHE", oldgocache)
  	}
  
@@ -159,7 +159,7 @@ index adc9fd2..5fff592 100644
  	if goos == oldgoos && goarch == oldgoarch {
  		// Common case - not setting up for cross-compilation.
  		timelog("build", "toolchain")
-@@ -1566,6 +1600,42 @@ func cmdbootstrap() {
+@@ -1560,6 +1594,42 @@ func cmdbootstrap() {
  		checkNotStale(toolenv(), goBootstrap, toolchain...)
  		copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir), writeExec)
  	}
@@ -202,7 +202,7 @@ index adc9fd2..5fff592 100644
  
  	// Check that there are no new files in $GOROOT/bin other than
  	// go and gofmt and $GOOS_$GOARCH (target bin when cross-compiling).
-@@ -1585,8 +1655,12 @@ func cmdbootstrap() {
+@@ -1582,8 +1652,12 @@ func cmdbootstrap() {
  		}
  	}
  
@@ -216,5 +216,5 @@ index adc9fd2..5fff592 100644
  	if goos == "android" {
  		// Make sure the exec wrapper will sync a fresh $GOROOT to the device.
 -- 
-2.43.0
+2.44.0
 
diff --git a/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch b/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
index d118e726c66..262f1e96b85 100644
--- a/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
+++ b/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
@@ -29,10 +29,10 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  3 files changed, 34 insertions(+)
 
 diff --git a/src/cmd/go/internal/work/action.go b/src/cmd/go/internal/work/action.go
-index d4d0a71..42149d2 100644
+index a59072e591..9e35ebde0c 100644
 --- a/src/cmd/go/internal/work/action.go
 +++ b/src/cmd/go/internal/work/action.go
-@@ -730,6 +730,9 @@ func (b *Builder) addTransitiveLinkDeps(a, a1 *Action, shlib string) {
+@@ -754,6 +754,9 @@ func (b *Builder) addTransitiveLinkDeps(a, a1 *Action, shlib string) {
  			if p1 == nil || p1.Shlib == "" || haveShlib[filepath.Base(p1.Shlib)] {
  				continue
  			}
@@ -43,10 +43,10 @@ index d4d0a71..42149d2 100644
  			// TODO(rsc): The use of ModeInstall here is suspect, but if we only do ModeBuild,
  			// we'll end up building an overall library or executable that depends at runtime
 diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/work/build.go
-index e2e0e07..1c84137 100644
+index 408edb5119..3d60252127 100644
 --- a/src/cmd/go/internal/work/build.go
 +++ b/src/cmd/go/internal/work/build.go
-@@ -228,6 +228,8 @@ See also: go install, go get, go clean.
+@@ -233,6 +233,8 @@ See also: go install, go get, go clean.
  
  const concurrentGCBackendCompilationEnabledByDefault = true
  
@@ -55,7 +55,7 @@ index e2e0e07..1c84137 100644
  func init() {
  	// break init cycle
  	CmdBuild.Run = runBuild
-@@ -241,6 +243,10 @@ func init() {
+@@ -246,6 +248,10 @@ func init() {
  		AddCoverFlags(CmdBuild, nil)
  		AddCoverFlags(CmdInstall, nil)
  	}
@@ -67,10 +67,10 @@ index e2e0e07..1c84137 100644
  
  // Note that flags consulted by other parts of the code
 diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index e3dd486..0ea5316 100644
+index 9724cd07d0..544df461a2 100644
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
-@@ -539,6 +539,23 @@ func (b *Builder) build(ctx context.Context, a *Action) (err error) {
+@@ -544,6 +544,23 @@ func (b *Builder) build(ctx context.Context, a *Action) (err error) {
  		return err
  	}
  
@@ -91,10 +91,10 @@ index e3dd486..0ea5316 100644
 +		}
 +	}
 +
- 	if err := b.Mkdir(a.Objdir); err != nil {
+ 	if err := sh.Mkdir(a.Objdir); err != nil {
  		return err
  	}
-@@ -1722,6 +1739,14 @@ func (b *Builder) linkShared(ctx context.Context, a *Action) (err error) {
+@@ -1737,6 +1754,14 @@ func (b *Builder) linkShared(ctx context.Context, a *Action) (err error) {
  		return err
  	}
  
@@ -106,9 +106,9 @@ index e3dd486..0ea5316 100644
 +		}
 +	}
 +
- 	if err := b.Mkdir(a.Objdir); err != nil {
+ 	if err := b.Shell(a).Mkdir(a.Objdir); err != nil {
  		return err
  	}
 -- 
-2.43.0
+2.44.0
 
diff --git a/meta/recipes-devtools/go/go/0007-exec.go-do-not-write-linker-flags-into-buildids.patch b/meta/recipes-devtools/go/go/0007-exec.go-do-not-write-linker-flags-into-buildids.patch
index 3e0ba35d81f..35f3a98d800 100644
--- a/meta/recipes-devtools/go/go/0007-exec.go-do-not-write-linker-flags-into-buildids.patch
+++ b/meta/recipes-devtools/go/go/0007-exec.go-do-not-write-linker-flags-into-buildids.patch
@@ -17,10 +17,10 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index 0ea5316..d7e2d51 100644
+index 544df461a2..75df5a4aa8 100644
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
-@@ -1357,7 +1357,7 @@ func (b *Builder) linkActionID(a *Action) cache.ActionID {
+@@ -1374,7 +1374,7 @@ func (b *Builder) linkActionID(a *Action) cache.ActionID {
  	}
  
  	// Toolchain-dependent configuration, shared with b.linkSharedActionID.
@@ -29,7 +29,7 @@ index 0ea5316..d7e2d51 100644
  
  	// Input files.
  	for _, a1 := range a.Deps {
-@@ -1705,7 +1705,7 @@ func (b *Builder) linkSharedActionID(a *Action) cache.ActionID {
+@@ -1720,7 +1720,7 @@ func (b *Builder) linkSharedActionID(a *Action) cache.ActionID {
  	fmt.Fprintf(h, "goos %s goarch %s\n", cfg.Goos, cfg.Goarch)
  
  	// Toolchain-dependent configuration, shared with b.linkActionID.
@@ -39,5 +39,5 @@ index 0ea5316..d7e2d51 100644
  	// Input files.
  	for _, a1 := range a.Deps {
 -- 
-2.43.0
+2.44.0
 
diff --git a/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch b/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
index 58512207a88..0662f66af52 100644
--- a/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
+++ b/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
@@ -16,7 +16,7 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/src/cmd/dist/buildgo.go b/src/cmd/dist/buildgo.go
-index 884e9d7..2f52eda 100644
+index 884e9d729a..2f52edacfe 100644
 --- a/src/cmd/dist/buildgo.go
 +++ b/src/cmd/dist/buildgo.go
 @@ -51,8 +51,8 @@ func mkzdefaultcc(dir, file string) {
@@ -42,5 +42,5 @@ index 884e9d7..2f52eda 100644
  }
  
 -- 
-2.43.0
+2.44.0
 
diff --git a/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch b/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch
index 597a4e21045..cc45496e9cb 100644
--- a/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch
+++ b/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch
@@ -17,10 +17,10 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  1 file changed, 13 insertions(+), 2 deletions(-)
 
 diff --git a/src/cmd/go/internal/load/pkg.go b/src/cmd/go/internal/load/pkg.go
-index c0e6265..b199fee 100644
+index 1549800afb..f41fb2c4ef 100644
 --- a/src/cmd/go/internal/load/pkg.go
 +++ b/src/cmd/go/internal/load/pkg.go
-@@ -2269,6 +2269,17 @@ func appendBuildSetting(info *debug.BuildInfo, key, value string) {
+@@ -2277,6 +2277,17 @@ func appendBuildSetting(info *debug.BuildInfo, key, value string) {
  	info.Settings = append(info.Settings, debug.BuildSetting{Key: key, Value: value})
  }
  
@@ -38,7 +38,7 @@ index c0e6265..b199fee 100644
  // setBuildInfo gathers build information and sets it into
  // p.Internal.BuildInfo, which will later be formatted as a string and embedded
  // in the binary. setBuildInfo should only be called on a main package with no
-@@ -2376,7 +2387,7 @@ func (p *Package) setBuildInfo(ctx context.Context, autoVCS bool) {
+@@ -2384,7 +2395,7 @@ func (p *Package) setBuildInfo(ctx context.Context, autoVCS bool) {
  	if gcflags := BuildGcflags.String(); gcflags != "" && cfg.BuildContext.Compiler == "gc" {
  		appendSetting("-gcflags", gcflags)
  	}
@@ -47,7 +47,7 @@ index c0e6265..b199fee 100644
  		// https://go.dev/issue/52372: only include ldflags if -trimpath is not set,
  		// since it can include system paths through various linker flags (notably
  		// -extar, -extld, and -extldflags).
-@@ -2419,7 +2430,7 @@ func (p *Package) setBuildInfo(ctx context.Context, autoVCS bool) {
+@@ -2427,7 +2438,7 @@ func (p *Package) setBuildInfo(ctx context.Context, autoVCS bool) {
  	// subset of flags that are known not to be paths?
  	if cfg.BuildContext.CgoEnabled && !cfg.BuildTrimpath {
  		for _, name := range []string{"CGO_CFLAGS", "CGO_CPPFLAGS", "CGO_CXXFLAGS", "CGO_LDFLAGS"} {
@@ -57,5 +57,5 @@ index c0e6265..b199fee 100644
  	}
  	appendSetting("GOARCH", cfg.BuildContext.GOARCH)
 -- 
-2.43.0
+2.44.0
 
diff --git a/meta/recipes-devtools/go/go_1.21.7.bb b/meta/recipes-devtools/go/go_1.22.0.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.21.7.bb
rename to meta/recipes-devtools/go/go_1.22.0.bb
-- 
2.40.1


