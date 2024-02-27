Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07126C5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 10:08:00 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.8951.1709028472258960265
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 02:07:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hCJwuh/D;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-512ff385589so2246775e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 02:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709028470; x=1709633270; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=seqi6eoqBBW8awyFjoScNq2afb8jqENJor1mCoNmVvY=;
        b=hCJwuh/DHxWiZchqsBQYNO/jksTUlU9ksktlxP3LeQhqiak2tta+RDHjjmC1lKyBTx
         hgV9Qqxa+ZELdky3ggviAYzc9zs1N6H9Od/ZSvMZgewHdHm9y18w5R6CuHT4zJE21QkZ
         vkIsLm5yJis2ogCYRFRN7u8aG474oS3eSRDd1TzJSy1x9sQcHKM9rinrdMwyOEyfbdoV
         JFwu7pFm/id4fx0TUdHhjiqbnmVlRSW0poKo1ujGSH9B8Bx8w2Rzm7pAMsDZl4AqcneK
         1F4YRq5QzwCWwL2jCzQ4W5ieOq6X0PwDp4x0UDtebwN1sawteKLW/QyEeHLE64pe9QAo
         KZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709028470; x=1709633270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=seqi6eoqBBW8awyFjoScNq2afb8jqENJor1mCoNmVvY=;
        b=ZECZkahNIDfK7URPqoDKl5fl1OAWiFVmDsfJajetWW7hr1rVzn1JVikfU4RTVL1eXe
         G69B48fW6y9zP8rlFm/V/Fwj1KUGJBnQdPZssyIBxKbkS5624YcwZ82K3Iu1yPKYc2Z+
         mtqbVgomSBcbJKmNEnCY+QizjoYkNHSa9Nu9jPwjeB57iDZdlOX/9okdia/Ro+bHGKmu
         dDWWWOGzI/iaGeRbkh/+vvGI4AQLK1JEQEUZy3EV8FVaSwHj2a50RNHI8qI4/7qxh70j
         YJKewrKyi2HGdXpWTDgTLA4ZxLo7cap8NGXHNAYBBL0KOeldFBL2veRi/AgrzCVMICI+
         P+hg==
X-Gm-Message-State: AOJu0YyApcNTgATEPSrkrmCBsbZclA6VlqXq+DixDL8/vC1tNVB5OwWG
	gfYmC68mbv44dpvduQ8m8/vvdSpd1gFUTe2BtSteoc7iFlKvqwnXJw6mD6D6
X-Google-Smtp-Source: AGHT+IFCd6NjAHhrnnTqA5PNNWQhEyNHzhXblIXeaILDqf1CmoELwi9PgQbVkm63MXziExj6lfzuyg==
X-Received: by 2002:a05:6512:94d:b0:512:e85f:175b with SMTP id u13-20020a056512094d00b00512e85f175bmr5349293lft.16.1709028469622;
        Tue, 27 Feb 2024 02:07:49 -0800 (PST)
Received: from toster.lan (bl23-106-114.dsl.telepac.pt. [144.64.106.114])
        by smtp.gmail.com with ESMTPSA id n17-20020a5d4211000000b0033d97bd5ddasm10857918wrq.85.2024.02.27.02.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 02:07:49 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [RFC OE-core][PATCH 2/3] go: bump 1.21.0
Date: Tue, 27 Feb 2024 10:07:08 +0000
Message-ID: <20240227100709.1154-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240227100709.1154-1-jose.quaresma@foundries.io>
References: <20240227100709.1154-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 10:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196252

Go 1.21 Release Notes
https://go.dev/doc/go1.21

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../go/{go-1.20.14.inc => go-1.21.0.inc}      |  2 +-
 ..._1.20.14.bb => go-binary-native_1.21.0.bb} |  6 +-
 ...1.20.14.bb => go-cross-canadian_1.21.0.bb} |  0
 ...go-cross_1.20.14.bb => go-cross_1.21.0.bb} |  0
 ...sssdk_1.20.14.bb => go-crosssdk_1.21.0.bb} |  0
 ...-native_1.20.14.bb => go-native_1.21.0.bb} |  0
 ...untime_1.20.14.bb => go-runtime_1.21.0.bb} |  0
 ...ent-based-hash-generation-less-pedan.patch | 35 ++++-----
 ...OOLDIR-to-be-overridden-in-the-envir.patch | 17 +++--
 ...3-ld-add-soname-to-shareable-objects.patch | 11 +--
 ...de-CC-when-building-dist-and-go_boot.patch | 15 ++--
 ...dist-separate-host-and-target-builds.patch | 74 ++++++++++---------
 ...d-go-make-GOROOT-precious-by-default.patch | 27 +++----
 ...not-write-linker-flags-into-buildids.patch | 12 +--
 ...ldgo.go-do-not-hardcode-host-compile.patch | 12 +--
 ...uild-paths-on-staticly-linked-arches.patch | 23 +++---
 .../go/{go_1.20.14.bb => go_1.21.0.bb}        |  0
 18 files changed, 125 insertions(+), 111 deletions(-)
 rename meta/recipes-devtools/go/{go-1.20.14.inc => go-1.21.0.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.20.14.bb => go-binary-native_1.21.0.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.20.14.bb => go-cross-canadian_1.21.0.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.20.14.bb => go-cross_1.21.0.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.20.14.bb => go-crosssdk_1.21.0.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.20.14.bb => go-native_1.21.0.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.20.14.bb => go-runtime_1.21.0.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.20.14.bb => go_1.21.0.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 94e413efe1..87666e5837 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -23,7 +23,7 @@ GDBVERSION ?= "14.%"
 GLIBCVERSION ?= "2.39%"
 LINUXLIBCVERSION ?= "6.6%"
 QEMUVERSION ?= "8.2%"
-GOVERSION ?= "1.20%"
+GOVERSION ?= "1.21%"
 RUSTVERSION ?= "1.74%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/go/go-1.20.14.inc b/meta/recipes-devtools/go/go-1.21.0.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.20.14.inc
rename to meta/recipes-devtools/go/go-1.21.0.inc
index 7e425effe5..2933793b8b 100644
--- a/meta/recipes-devtools/go/go-1.20.14.inc
+++ b/meta/recipes-devtools/go/go-1.21.0.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "1aef321a0e3e38b7e91d2d7eb64040666cabdcc77d383de3c9522d0d69b67f4e"
+SRC_URI[main.sha256sum] = "818d46ede85682dd551ad378ef37a4d247006f12ec59b5b755601d2ce114369a"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.20.14.bb b/meta/recipes-devtools/go/go-binary-native_1.21.0.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.20.14.bb
rename to meta/recipes-devtools/go/go-binary-native_1.21.0.bb
index 95211e6696..5d0427f56f 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.20.14.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.21.0.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "ff445e48af27f93f66bd949ae060d97991c83e11289009d311f25426258f9c44"
-SRC_URI[go_linux_arm64.sha256sum] = "2096507509a98782850d1f0669786c09727053e9fe3c92b03c0d96f48700282b"
-SRC_URI[go_linux_ppc64le.sha256sum] = "237b1da9b65629a9b0fcf1f3ca75b4c84ef55fca1fc3eadf1681da7bbcb2e9cd"
+SRC_URI[go_linux_amd64.sha256sum] = "d0398903a16ba2232b389fb31032ddf57cac34efda306a0eebac34f0965a0742"
+SRC_URI[go_linux_arm64.sha256sum] = "f3d4548edf9b22f26bbd49720350bbfe59d75b7090a1a2bff1afad8214febaf3"
+SRC_URI[go_linux_ppc64le.sha256sum] = "e938ffc81d8ebe5efc179240960ba22da6a841ff05d5cab7ce2547112b14a47f"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.20.14.bb b/meta/recipes-devtools/go/go-cross-canadian_1.21.0.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.20.14.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.21.0.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.20.14.bb b/meta/recipes-devtools/go/go-cross_1.21.0.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.20.14.bb
rename to meta/recipes-devtools/go/go-cross_1.21.0.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.20.14.bb b/meta/recipes-devtools/go/go-crosssdk_1.21.0.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.20.14.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.21.0.bb
diff --git a/meta/recipes-devtools/go/go-native_1.20.14.bb b/meta/recipes-devtools/go/go-native_1.21.0.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.20.14.bb
rename to meta/recipes-devtools/go/go-native_1.21.0.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.20.14.bb b/meta/recipes-devtools/go/go-runtime_1.21.0.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.20.14.bb
rename to meta/recipes-devtools/go/go-runtime_1.21.0.bb
diff --git a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
index 9a2551031a..3bd756449e 100644
--- a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
+++ b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
@@ -1,4 +1,4 @@
-From 10766ca6f4007b96e3f6bf4fb496e5df74397eb9 Mon Sep 17 00:00:00 2001
+From 9a6c5040cbcd88b10ceb8ceaebc8d6158c086670 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 28 Mar 2022 10:59:03 -0700
 Subject: [PATCH 1/9] cmd/go: make content-based hash generation less pedantic
@@ -25,16 +25,17 @@ Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Alex Kube <alexander.j.kube@gmail.com>
 Signed-off-by: Matt Madison <matt@madison.systems>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
 ---
  src/cmd/go/internal/envcmd/env.go |  2 +-
  src/cmd/go/internal/work/exec.go  | 44 ++++++++++++++++++++++++-------
  2 files changed, 36 insertions(+), 10 deletions(-)
 
 diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
-index 66ef5ce..fb7448a 100644
+index c7c2e83..4a90d9d 100644
 --- a/src/cmd/go/internal/envcmd/env.go
 +++ b/src/cmd/go/internal/envcmd/env.go
-@@ -183,7 +183,7 @@ func ExtraEnvVarsCostly() []cfg.EnvVar {
+@@ -189,7 +189,7 @@ func ExtraEnvVarsCostly() []cfg.EnvVar {
  		}
  	}()
  
@@ -44,10 +45,10 @@ index 66ef5ce..fb7448a 100644
  		// Should not happen - b.CFlags was given an empty package.
  		fmt.Fprintf(os.Stderr, "go: invalid cflags: %v\n", err)
 diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index 67d1193..62e1774 100644
+index 13d2a78..e3dd486 100644
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
-@@ -223,6 +223,8 @@ func (b *Builder) Do(ctx context.Context, root *Action) {
+@@ -231,6 +231,8 @@ func (b *Builder) Do(ctx context.Context, root *Action) {
  	writeActionGraph()
  }
  
@@ -56,7 +57,7 @@ index 67d1193..62e1774 100644
  // buildActionID computes the action ID for a build action.
  func (b *Builder) buildActionID(a *Action) cache.ActionID {
  	p := a.Package
-@@ -244,7 +246,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+@@ -252,7 +254,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
  		if p.Module != nil {
  			fmt.Fprintf(h, "module %s@%s\n", p.Module.Path, p.Module.Version)
  		}
@@ -65,7 +66,7 @@ index 67d1193..62e1774 100644
  		// The Go compiler always hides the exact value of $GOROOT
  		// when building things in GOROOT.
  		//
-@@ -276,9 +278,9 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+@@ -284,9 +286,9 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
  	}
  	if len(p.CgoFiles)+len(p.SwigFiles)+len(p.SwigCXXFiles) > 0 {
  		fmt.Fprintf(h, "cgo %q\n", b.toolID("cgo"))
@@ -77,7 +78,7 @@ index 67d1193..62e1774 100644
  		fmt.Fprintf(h, "CC=%q %q %q %q\n", ccExe, cppflags, cflags, ldflags)
  		// Include the C compiler tool ID so that if the C
  		// compiler changes we rebuild the package.
-@@ -286,14 +288,14 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+@@ -294,14 +296,14 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
  			fmt.Fprintf(h, "CC ID=%q\n", ccID)
  		}
  		if len(p.CXXFiles)+len(p.SwigCXXFiles) > 0 {
@@ -94,16 +95,16 @@ index 67d1193..62e1774 100644
  			fmt.Fprintf(h, "FC=%q %q\n", fcExe, fflags)
  			if fcID, _, err := b.gccToolID(fcExe[0], "f95"); err == nil {
  				fmt.Fprintf(h, "FC ID=%q\n", fcID)
-@@ -310,7 +312,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+@@ -318,7 +320,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
  		}
  	}
- 	if p.Internal.BuildInfo != "" {
--		fmt.Fprintf(h, "modinfo %q\n", p.Internal.BuildInfo)
-+		//fmt.Fprintf(h, "modinfo %q\n", p.Internal.BuildInfo)
+ 	if p.Internal.BuildInfo != nil {
+-		fmt.Fprintf(h, "modinfo %q\n", p.Internal.BuildInfo.String())
++		//fmt.Fprintf(h, "modinfo %q\n", p.Internal.BuildInfo.String())
  	}
  
  	// Configuration specific to compiler toolchain.
-@@ -2989,8 +2991,25 @@ func envList(key, def string) []string {
+@@ -3137,8 +3139,25 @@ func envList(key, def string) []string {
  	return args
  }
  
@@ -130,7 +131,7 @@ index 67d1193..62e1774 100644
  	if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, checkCompilerFlags); err != nil {
  		return
  	}
-@@ -3006,6 +3025,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
+@@ -3154,6 +3173,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
  	if ldflags, err = buildFlags("LDFLAGS", defaultCFlags, p.CgoLDFLAGS, checkLinkerFlags); err != nil {
  		return
  	}
@@ -144,7 +145,7 @@ index 67d1193..62e1774 100644
  
  	return
  }
-@@ -3021,7 +3047,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
+@@ -3169,7 +3195,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
  
  func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo, outObj []string, err error) {
  	p := a.Package
@@ -153,7 +154,7 @@ index 67d1193..62e1774 100644
  	if err != nil {
  		return nil, nil, err
  	}
-@@ -3577,7 +3603,7 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
+@@ -3725,7 +3751,7 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
  
  // Run SWIG on one SWIG input file.
  func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string, err error) {
@@ -163,5 +164,5 @@ index 67d1193..62e1774 100644
  		return "", "", err
  	}
 -- 
-2.30.2
+2.43.0
 
diff --git a/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch b/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
index 6abd424733..cf7ad02f86 100644
--- a/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
+++ b/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
@@ -1,4 +1,4 @@
-From 5cca2fa5997292a87302bdc7e7ed3231371e98bd Mon Sep 17 00:00:00 2001
+From e3f9a8a69d3a340c1a1d0bba566e71f20f635a43 Mon Sep 17 00:00:00 2001
 From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:15:37 +0430
 Subject: [PATCH 2/9] cmd/go: Allow GOTOOLDIR to be overridden in the
@@ -13,16 +13,17 @@ Matt Madison <matt@madison.systems>.
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
+Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
 ---
  src/cmd/dist/build.go          | 4 +++-
  src/cmd/go/internal/cfg/cfg.go | 6 +++++-
  2 files changed, 8 insertions(+), 2 deletions(-)
 
 diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
-index c36a12e..5d31718 100644
+index 8973a87..adc9fd2 100644
 --- a/src/cmd/dist/build.go
 +++ b/src/cmd/dist/build.go
-@@ -264,7 +264,9 @@ func xinit() {
+@@ -259,7 +259,9 @@ func xinit() {
  	}
  	xatexit(rmworkdir)
  
@@ -30,14 +31,14 @@ index c36a12e..5d31718 100644
 +	if tooldir = os.Getenv("GOTOOLDIR"); tooldir == "" {
 +		tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
 +	}
- }
  
- // compilerEnv returns a map from "goos/goarch" to the
+ 	goversion := findgoversion()
+ 	isRelease = strings.HasPrefix(goversion, "release.") || strings.HasPrefix(goversion, "go")
 diff --git a/src/cmd/go/internal/cfg/cfg.go b/src/cmd/go/internal/cfg/cfg.go
-index 3257140..bb46253 100644
+index 8a82e55..1141fc2 100644
 --- a/src/cmd/go/internal/cfg/cfg.go
 +++ b/src/cmd/go/internal/cfg/cfg.go
-@@ -229,7 +229,11 @@ func SetGOROOT(goroot string, isTestGo bool) {
+@@ -231,7 +231,11 @@ func SetGOROOT(goroot string, isTestGo bool) {
  			// This matches the initialization of ToolDir in go/build, except for
  			// using ctxt.GOROOT and the installed GOOS and GOARCH rather than the
  			// GOROOT, GOOS, and GOARCH reported by the runtime package.
@@ -51,5 +52,5 @@ index 3257140..bb46253 100644
  	}
  }
 -- 
-2.30.2
+2.43.0
 
diff --git a/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch b/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
index 8f5ad04e5c..be4af096ce 100644
--- a/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
+++ b/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
@@ -1,4 +1,4 @@
-From c7536a820f713013ab1d4acef74a4c8bd970bf8f Mon Sep 17 00:00:00 2001
+From 7dde77b3ce8138314dd2736604b1b110dbcc0ac1 Mon Sep 17 00:00:00 2001
 From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:16:32 +0430
 Subject: [PATCH 3/9] ld: add soname to shareable objects
@@ -13,15 +13,16 @@ Matt Madison <matt@madison.systems>.
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
+Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
 ---
  src/cmd/link/internal/ld/lib.go | 3 +++
  1 file changed, 3 insertions(+)
 
 diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/ld/lib.go
-index 6eae900..0462ee8 100644
+index 91e2d51..e98b912 100644
 --- a/src/cmd/link/internal/ld/lib.go
 +++ b/src/cmd/link/internal/ld/lib.go
-@@ -1508,6 +1508,7 @@ func (ctxt *Link) hostlink() {
+@@ -1554,6 +1554,7 @@ func (ctxt *Link) hostlink() {
  				argv = append(argv, "-Wl,-z,relro")
  			}
  			argv = append(argv, "-shared")
@@ -29,7 +30,7 @@ index 6eae900..0462ee8 100644
  			if ctxt.HeadType == objabi.Hwindows {
  				argv = addASLRargs(argv, *flagAslr)
  			} else {
-@@ -1523,6 +1524,7 @@ func (ctxt *Link) hostlink() {
+@@ -1569,6 +1570,7 @@ func (ctxt *Link) hostlink() {
  			argv = append(argv, "-Wl,-z,relro")
  		}
  		argv = append(argv, "-shared")
@@ -37,7 +38,7 @@ index 6eae900..0462ee8 100644
  	case BuildModePlugin:
  		if ctxt.HeadType == objabi.Hdarwin {
  			argv = append(argv, "-dynamiclib")
-@@ -1531,6 +1533,7 @@ func (ctxt *Link) hostlink() {
+@@ -1577,6 +1579,7 @@ func (ctxt *Link) hostlink() {
  				argv = append(argv, "-Wl,-z,relro")
  			}
  			argv = append(argv, "-shared")
diff --git a/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-dist-and-go_boot.patch
index 85e42f7660..5dd2621adc 100644
--- a/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-dist-and-go_boot.patch
+++ b/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-dist-and-go_boot.patch
@@ -1,4 +1,4 @@
-From 31ff609cc3d3bfcc2f2257fda1dbaafaec31eb0b Mon Sep 17 00:00:00 2001
+From 9f59e46991074d3e3c4d00f3971e62bfcd707167 Mon Sep 17 00:00:00 2001
 From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:17:16 +0430
 Subject: [PATCH 4/9] make.bash: override CC when building dist and
@@ -13,24 +13,25 @@ Matt Madison <matt@madison.systems>.
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
+Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
 ---
  src/make.bash | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/make.bash b/src/make.bash
-index c07f39b..6ca7242 100755
+index 755b3b0..eddfc3c 100755
 --- a/src/make.bash
 +++ b/src/make.bash
-@@ -194,7 +194,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ]; then
+@@ -198,7 +198,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ]; then
  	exit 1
  fi
  rm -f cmd/dist/dist
--GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH="" GO111MODULE=off GOEXPERIMENT="" GOENV=off GOFLAGS="" "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
-+CC="${BUILD_CC:-${CC}}" GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH="" GO111MODULE=off GOEXPERIMENT="" GOENV=off GOFLAGS="" "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
+-GOROOT="$GOROOT_BOOTSTRAP" nogoenv "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
++CC="${BUILD_CC:-${CC}}" GOROOT="$GOROOT_BOOTSTRAP" nogoenv "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
  
  # -e doesn't propagate out of eval, so check success by hand.
  eval $(./cmd/dist/dist env -p || echo FAIL=true)
-@@ -219,7 +219,7 @@ fi
+@@ -223,7 +223,7 @@ fi
  # Run dist bootstrap to complete make.bash.
  # Bootstrap installs a proper cmd/dist, built with the new toolchain.
  # Throw ours, built with the bootstrap toolchain, away after bootstrap.
@@ -40,5 +41,5 @@ index c07f39b..6ca7242 100755
  
  # DO NOT ADD ANY NEW CODE HERE.
 -- 
-2.30.2
+2.43.0
 
diff --git a/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch b/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch
index aa2df58995..f8dca65ed4 100644
--- a/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch
+++ b/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch
@@ -1,4 +1,4 @@
-From 7a191e5191c8b813e929caedb3f3918bb08692a1 Mon Sep 17 00:00:00 2001
+From 6dda78d528e60993a4688cd9d49440a726378ac8 Mon Sep 17 00:00:00 2001
 From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:18:12 +0430
 Subject: [PATCH 5/9] cmd/dist: separate host and target builds
@@ -31,8 +31,8 @@ Adapted to Go 1.13 from patches originally submitted to
 the meta/recipes-devtools/go tree by
 Matt Madison <matt@madison.systems>.
 
-Rework the patch to avoid identation, it's more hard to read
-but easy to rebase.
+Rework the patch to avoid identation, it's more hard to read but
+easy to rebase.
 Jose Quaresma <jose.quaresma@foundries.io>
 
 Upstream-Status: Inappropriate [OE specific]
@@ -44,35 +44,35 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  1 file changed, 75 insertions(+), 1 deletion(-)
 
 diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
-index 5d3171856a..d0ba54c072 100644
+index adc9fd2..5fff592 100644
 --- a/src/cmd/dist/build.go
 +++ b/src/cmd/dist/build.go
-@@ -44,6 +44,7 @@ var (
+@@ -46,6 +46,7 @@ var (
  	goexperiment     string
  	workdir          string
  	tooldir          string
 +	build_tooldir    string
  	oldgoos          string
  	oldgoarch        string
- 	exe              string
-@@ -55,6 +56,7 @@ var (
- 	rebuildall   bool
- 	defaultclang bool
- 	noOpt        bool
-+	crossBuild   bool
+ 	oldgocache       string
+@@ -58,6 +59,7 @@ var (
+ 	rebuildall bool
+ 	noOpt      bool
+ 	isRelease  bool
++	crossBuild bool
  
  	vflag int // verbosity
  )
-@@ -267,6 +269,8 @@ func xinit() {
- 	if tooldir = os.Getenv("GOTOOLDIR"); tooldir == "" {
- 		tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
- 	}
+@@ -265,6 +267,8 @@ func xinit() {
+ 
+ 	goversion := findgoversion()
+ 	isRelease = strings.HasPrefix(goversion, "release.") || strings.HasPrefix(goversion, "go")
 +
 +	build_tooldir = pathf("%s/pkg/tool/native_native", goroot)
  }
  
  // compilerEnv returns a map from "goos/goarch" to the
-@@ -468,8 +472,10 @@ func setup() {
+@@ -499,8 +503,10 @@ func setup() {
  	goosGoarch := pathf("%s/pkg/%s_%s", goroot, gohostos, gohostarch)
  	if rebuildall {
  		xremoveall(goosGoarch)
@@ -83,16 +83,18 @@ index 5d3171856a..d0ba54c072 100644
  	xatexit(func() {
  		if files := xreaddir(goosGoarch); len(files) == 0 {
  			xremove(goosGoarch)
-@@ -1276,17 +1282,35 @@ func cmdbootstrap() {
+@@ -1344,14 +1350,20 @@ func cmdbootstrap() {
+ 	defer timelog("end", "dist bootstrap")
  
- 	var noBanner, noClean bool
- 	var debug bool
+ 	var debug, distpack, force, noBanner, noClean bool
 +	var hostOnly bool
 +	var targetOnly bool
 +	var toBuild = []string{"std", "cmd"}
 +
  	flag.BoolVar(&rebuildall, "a", rebuildall, "rebuild all")
  	flag.BoolVar(&debug, "d", debug, "enable debugging of bootstrap process")
+ 	flag.BoolVar(&distpack, "distpack", distpack, "write distribution files to pkg/distpack")
+ 	flag.BoolVar(&force, "force", force, "build even if the port is marked as broken")
  	flag.BoolVar(&noBanner, "no-banner", noBanner, "do not print banner")
  	flag.BoolVar(&noClean, "no-clean", noClean, "print deprecation warning")
 +	flag.BoolVar(&hostOnly, "host-only", hostOnly, "build only host binaries, not target")
@@ -103,6 +105,8 @@ index 5d3171856a..d0ba54c072 100644
  
  	if noClean {
  		xprintf("warning: --no-clean is deprecated and has no effect; use 'go install std cmd' instead\n")
+@@ -1363,6 +1375,18 @@ func cmdbootstrap() {
+ 			"Use the -force flag to build anyway.\n", goos, goarch)
  	}
  
 +	if hostOnly && targetOnly {
@@ -120,7 +124,7 @@ index 5d3171856a..d0ba54c072 100644
  	// Set GOPATH to an internal directory. We shouldn't actually
  	// need to store files here, since the toolchain won't
  	// depend on modules outside of vendor directories, but if
-@@ -1354,9 +1378,14 @@ func cmdbootstrap() {
+@@ -1440,9 +1464,14 @@ func cmdbootstrap() {
  		xprintf("\n")
  	}
  
@@ -133,30 +137,30 @@ index 5d3171856a..d0ba54c072 100644
  	goldflags = os.Getenv("GO_LDFLAGS") // we were using $BOOT_GO_LDFLAGS until now
 +}
  	goBootstrap := pathf("%s/go_bootstrap", tooldir)
- 	cmdGo := pathf("%s/go", gorootBin)
  	if debug {
-@@ -1385,7 +1414,11 @@ func cmdbootstrap() {
+ 		run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
+@@ -1470,7 +1499,11 @@ func cmdbootstrap() {
  		xprintf("\n")
  	}
  	xprintf("Building Go toolchain2 using go_bootstrap and Go toolchain1.\n")
 +	if !crossBuild {
- 	os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
+ 	os.Setenv("CC", compilerEnvLookup("CC", defaultcc, goos, goarch))
 +} else {
 +		os.Setenv("CC", defaultcc[""])
 +	}
  	// Now that cmd/go is in charge of the build process, enable GOEXPERIMENT.
  	os.Setenv("GOEXPERIMENT", goexperiment)
- 	goInstall(goBootstrap, toolchain...)
-@@ -1421,6 +1454,7 @@ func cmdbootstrap() {
- 		copyfile(pathf("%s/compile3", tooldir), pathf("%s/compile", tooldir), writeExec)
+ 	// No need to enable PGO for toolchain2.
+@@ -1523,6 +1556,7 @@ func cmdbootstrap() {
+ 		os.Setenv("GOCACHE", oldgocache)
  	}
  
 +	if !crossBuild {
  	if goos == oldgoos && goarch == oldgoarch {
  		// Common case - not setting up for cross-compilation.
  		timelog("build", "toolchain")
-@@ -1462,6 +1496,42 @@ func cmdbootstrap() {
- 		checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
+@@ -1566,6 +1600,42 @@ func cmdbootstrap() {
+ 		checkNotStale(toolenv(), goBootstrap, toolchain...)
  		copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir), writeExec)
  	}
 +} else {
@@ -175,8 +179,8 @@ index 5d3171856a..d0ba54c072 100644
 +				xprintf("\n")
 +			}
 +			xprintf("Building %s for host, %s/%s.\n", strings.Join(toBuild, ","), goos, goarch)
-+			goInstall(goBootstrap, toBuild...)
-+			checkNotStale(goBootstrap, toBuild...)
++			goInstall(toolenv(), goBootstrap, toBuild...)
++			checkNotStale(toolenv(), goBootstrap, toBuild...)
 +			// Skip cmdGo staleness checks here, since we can't necessarily run the cmdGo binary
 +
 +			timelog("build", "target toolchain")
@@ -188,17 +192,17 @@ index 5d3171856a..d0ba54c072 100644
 +			goarch = oldgoarch
 +			os.Setenv("GOOS", goos)
 +			os.Setenv("GOARCH", goarch)
-+			os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
++			os.Setenv("CC", compilerEnvLookup("CC", defaultcc, goos, goarch))
 +			xprintf("Building %s for target, %s/%s.\n", strings.Join(toBuild, ","), goos, goarch)
-+			goInstall(goBootstrap, toBuild...)
-+			checkNotStale(goBootstrap, toBuild...)
++			goInstall(toolenv(), goBootstrap, toBuild...)
++			checkNotStale(toolenv(), goBootstrap, toBuild...)
 +			// Skip cmdGo staleness checks here, since we can't run the target's cmdGo binary
 +		}
 +	}
  
  	// Check that there are no new files in $GOROOT/bin other than
  	// go and gofmt and $GOOS_$GOARCH (target bin when cross-compiling).
-@@ -1477,8 +1547,12 @@ func cmdbootstrap() {
+@@ -1585,8 +1655,12 @@ func cmdbootstrap() {
  		}
  	}
  
@@ -206,7 +210,7 @@ index 5d3171856a..d0ba54c072 100644
 +	// keep it.
 +	if !crossBuild {
  	// Remove go_bootstrap now that we're done.
- 	xremove(pathf("%s/go_bootstrap", tooldir))
+ 	xremove(pathf("%s/go_bootstrap"+exe, tooldir))
 +}
  
  	if goos == "android" {
diff --git a/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch b/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
index 520e41da86..d118e726c6 100644
--- a/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
+++ b/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
@@ -1,10 +1,8 @@
-From efab470498bb0a30ee2d00455a0c8c10459f6347 Mon Sep 17 00:00:00 2001
+From aff5a740d6286c04beb0593fc68b0aea5a95ad39 Mon Sep 17 00:00:00 2001
 From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:18:56 +0430
 Subject: [PATCH 6/9] cmd/go: make GOROOT precious by default
 
-Upstream-Status: Inappropriate [OE specific]
-
 The go build tool normally rebuilds whatever it detects is
 stale.  This can be a problem when GOROOT is intended to
 be read-only and the go runtime has been built as a shared
@@ -20,7 +18,10 @@ Adapted to Go 1.13 from patches originally submitted to
 the meta/recipes-devtools/go tree by
 Matt Madison <matt@madison.systems>.
 
+Upstream-Status: Inappropriate [OE specific]
+
 Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
+Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
 ---
  src/cmd/go/internal/work/action.go |  3 +++
  src/cmd/go/internal/work/build.go  |  6 ++++++
@@ -28,10 +29,10 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  3 files changed, 34 insertions(+)
 
 diff --git a/src/cmd/go/internal/work/action.go b/src/cmd/go/internal/work/action.go
-index 8beb134..68a8cfe 100644
+index d4d0a71..42149d2 100644
 --- a/src/cmd/go/internal/work/action.go
 +++ b/src/cmd/go/internal/work/action.go
-@@ -718,6 +718,9 @@ func (b *Builder) addTransitiveLinkDeps(a, a1 *Action, shlib string) {
+@@ -730,6 +730,9 @@ func (b *Builder) addTransitiveLinkDeps(a, a1 *Action, shlib string) {
  			if p1 == nil || p1.Shlib == "" || haveShlib[filepath.Base(p1.Shlib)] {
  				continue
  			}
@@ -42,10 +43,10 @@ index 8beb134..68a8cfe 100644
  			// TODO(rsc): The use of ModeInstall here is suspect, but if we only do ModeBuild,
  			// we'll end up building an overall library or executable that depends at runtime
 diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/work/build.go
-index 2f2860a..8cc6166 100644
+index e2e0e07..1c84137 100644
 --- a/src/cmd/go/internal/work/build.go
 +++ b/src/cmd/go/internal/work/build.go
-@@ -217,6 +217,8 @@ See also: go install, go get, go clean.
+@@ -228,6 +228,8 @@ See also: go install, go get, go clean.
  
  const concurrentGCBackendCompilationEnabledByDefault = true
  
@@ -54,7 +55,7 @@ index 2f2860a..8cc6166 100644
  func init() {
  	// break init cycle
  	CmdBuild.Run = runBuild
-@@ -230,6 +232,10 @@ func init() {
+@@ -241,6 +243,10 @@ func init() {
  		AddCoverFlags(CmdBuild, nil)
  		AddCoverFlags(CmdInstall, nil)
  	}
@@ -66,11 +67,11 @@ index 2f2860a..8cc6166 100644
  
  // Note that flags consulted by other parts of the code
 diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index 62e1774..cde867b 100644
+index e3dd486..0ea5316 100644
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
-@@ -546,6 +546,23 @@ func (b *Builder) build(ctx context.Context, a *Action) (err error) {
- 		return errors.New("cannot compile Go " + p.Module.GoVersion + " code")
+@@ -539,6 +539,23 @@ func (b *Builder) build(ctx context.Context, a *Action) (err error) {
+ 		return err
  	}
  
 +	if goRootPrecious && (a.Package.Standard || a.Package.Goroot) {
@@ -93,7 +94,7 @@ index 62e1774..cde867b 100644
  	if err := b.Mkdir(a.Objdir); err != nil {
  		return err
  	}
-@@ -1643,6 +1660,14 @@ func (b *Builder) linkShared(ctx context.Context, a *Action) (err error) {
+@@ -1722,6 +1739,14 @@ func (b *Builder) linkShared(ctx context.Context, a *Action) (err error) {
  		return err
  	}
  
@@ -109,5 +110,5 @@ index 62e1774..cde867b 100644
  		return err
  	}
 -- 
-2.30.2
+2.43.0
 
diff --git a/meta/recipes-devtools/go/go/0007-exec.go-do-not-write-linker-flags-into-buildids.patch b/meta/recipes-devtools/go/go/0007-exec.go-do-not-write-linker-flags-into-buildids.patch
index 7d9869b536..3e0ba35d81 100644
--- a/meta/recipes-devtools/go/go/0007-exec.go-do-not-write-linker-flags-into-buildids.patch
+++ b/meta/recipes-devtools/go/go/0007-exec.go-do-not-write-linker-flags-into-buildids.patch
@@ -1,4 +1,4 @@
-From 0ba747e6a4b251a0d9eed0cfd8f8c491bb508040 Mon Sep 17 00:00:00 2001
+From 619991feab04f331d081a91243434ccd859f611d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 23 Nov 2020 19:22:04 +0000
 Subject: [PATCH 7/9] exec.go: do not write linker flags into buildids
@@ -9,16 +9,18 @@ To make this acceptable to upstream, we probably need to trim the flags,
 removing those known to be buildhost-specific.
 
 Upstream-Status: Inappropriate [needs upstream discussion]
+
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
 ---
  src/cmd/go/internal/work/exec.go | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index cde867b..5cb1812 100644
+index 0ea5316..d7e2d51 100644
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
-@@ -1331,7 +1331,7 @@ func (b *Builder) linkActionID(a *Action) cache.ActionID {
+@@ -1357,7 +1357,7 @@ func (b *Builder) linkActionID(a *Action) cache.ActionID {
  	}
  
  	// Toolchain-dependent configuration, shared with b.linkSharedActionID.
@@ -27,7 +29,7 @@ index cde867b..5cb1812 100644
  
  	// Input files.
  	for _, a1 := range a.Deps {
-@@ -1626,7 +1626,7 @@ func (b *Builder) linkSharedActionID(a *Action) cache.ActionID {
+@@ -1705,7 +1705,7 @@ func (b *Builder) linkSharedActionID(a *Action) cache.ActionID {
  	fmt.Fprintf(h, "goos %s goarch %s\n", cfg.Goos, cfg.Goarch)
  
  	// Toolchain-dependent configuration, shared with b.linkActionID.
@@ -37,5 +39,5 @@ index cde867b..5cb1812 100644
  	// Input files.
  	for _, a1 := range a.Deps {
 -- 
-2.30.2
+2.43.0
 
diff --git a/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch b/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
index fe830ce35c..58512207a8 100644
--- a/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
+++ b/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
@@ -1,4 +1,4 @@
-From 1cbb416538a9c7c3fbedcb23f4d90d5c48becca8 Mon Sep 17 00:00:00 2001
+From e0999902687e2e394499f7153db8d62440c4dab0 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 16:33:27 +0000
 Subject: [PATCH 8/9] src/cmd/dist/buildgo.go: do not hardcode host compilers
@@ -8,16 +8,18 @@ These come from $CC/$CXX on the build host and are not useful on targets;
 additionally as they contain host specific paths, this helps reproducibility.
 
 Upstream-Status: Inappropriate [needs upstream discussion]
+
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
 ---
  src/cmd/dist/buildgo.go | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/src/cmd/dist/buildgo.go b/src/cmd/dist/buildgo.go
-index 29b0167..63a49f0 100644
+index 884e9d7..2f52eda 100644
 --- a/src/cmd/dist/buildgo.go
 +++ b/src/cmd/dist/buildgo.go
-@@ -33,8 +33,8 @@ func mkzdefaultcc(dir, file string) {
+@@ -51,8 +51,8 @@ func mkzdefaultcc(dir, file string) {
  		fmt.Fprintf(&buf, "package cfg\n")
  		fmt.Fprintln(&buf)
  		fmt.Fprintf(&buf, "const DefaultPkgConfig = `%s`\n", defaultpkgconfig)
@@ -28,7 +30,7 @@ index 29b0167..63a49f0 100644
  		writefile(buf.String(), file, writeSkipSame)
  		return
  	}
-@@ -45,8 +45,8 @@ func mkzdefaultcc(dir, file string) {
+@@ -62,8 +62,8 @@ func mkzdefaultcc(dir, file string) {
  	fmt.Fprintf(&buf, "package main\n")
  	fmt.Fprintln(&buf)
  	fmt.Fprintf(&buf, "const defaultPkgConfig = `%s`\n", defaultpkgconfig)
@@ -40,5 +42,5 @@ index 29b0167..63a49f0 100644
  }
  
 -- 
-2.30.2
+2.43.0
 
diff --git a/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch b/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch
index 49da5f6297..597a4e2104 100644
--- a/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch
+++ b/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch
@@ -1,4 +1,4 @@
-From 18011f72125bbea273d07ee5d792ac0ce6059572 Mon Sep 17 00:00:00 2001
+From 6c2438f187ca912c54a71b4ac65ab98999a019d2 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sat, 2 Jul 2022 23:08:13 +0100
 Subject: [PATCH 9/9] go: Filter build paths on staticly linked arches
@@ -11,17 +11,18 @@ on mips/ppc.
 Upstream-Status: Submitted [https://github.com/golang/go/pull/56410]
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
 ---
  src/cmd/go/internal/load/pkg.go | 15 +++++++++++++--
  1 file changed, 13 insertions(+), 2 deletions(-)
 
 diff --git a/src/cmd/go/internal/load/pkg.go b/src/cmd/go/internal/load/pkg.go
-index f427e29..6d6dc4e 100644
+index c0e6265..b199fee 100644
 --- a/src/cmd/go/internal/load/pkg.go
 +++ b/src/cmd/go/internal/load/pkg.go
-@@ -2270,6 +2270,17 @@ func (p *Package) collectDeps() {
- // to their VCS information (vcsStatusError).
- var vcsStatusCache par.Cache
+@@ -2269,6 +2269,17 @@ func appendBuildSetting(info *debug.BuildInfo, key, value string) {
+ 	info.Settings = append(info.Settings, debug.BuildSetting{Key: key, Value: value})
+ }
  
 +func filterCompilerFlags(flags string) string {
 +	var newflags []string
@@ -34,10 +35,10 @@ index f427e29..6d6dc4e 100644
 +	return strings.Join(newflags, " ")
 +}
 +
- // setBuildInfo gathers build information, formats it as a string to be
- // embedded in the binary, then sets p.Internal.BuildInfo to that string.
- // setBuildInfo should only be called on a main package with no errors.
-@@ -2376,7 +2387,7 @@ func (p *Package) setBuildInfo(autoVCS bool) {
+ // setBuildInfo gathers build information and sets it into
+ // p.Internal.BuildInfo, which will later be formatted as a string and embedded
+ // in the binary. setBuildInfo should only be called on a main package with no
+@@ -2376,7 +2387,7 @@ func (p *Package) setBuildInfo(ctx context.Context, autoVCS bool) {
  	if gcflags := BuildGcflags.String(); gcflags != "" && cfg.BuildContext.Compiler == "gc" {
  		appendSetting("-gcflags", gcflags)
  	}
@@ -46,7 +47,7 @@ index f427e29..6d6dc4e 100644
  		// https://go.dev/issue/52372: only include ldflags if -trimpath is not set,
  		// since it can include system paths through various linker flags (notably
  		// -extar, -extld, and -extldflags).
-@@ -2422,7 +2433,7 @@ func (p *Package) setBuildInfo(autoVCS bool) {
+@@ -2419,7 +2430,7 @@ func (p *Package) setBuildInfo(ctx context.Context, autoVCS bool) {
  	// subset of flags that are known not to be paths?
  	if cfg.BuildContext.CgoEnabled && !cfg.BuildTrimpath {
  		for _, name := range []string{"CGO_CFLAGS", "CGO_CPPFLAGS", "CGO_CXXFLAGS", "CGO_LDFLAGS"} {
@@ -56,5 +57,5 @@ index f427e29..6d6dc4e 100644
  	}
  	appendSetting("GOARCH", cfg.BuildContext.GOARCH)
 -- 
-2.30.2
+2.43.0
 
diff --git a/meta/recipes-devtools/go/go_1.20.14.bb b/meta/recipes-devtools/go/go_1.21.0.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.20.14.bb
rename to meta/recipes-devtools/go/go_1.21.0.bb
-- 
2.44.0


