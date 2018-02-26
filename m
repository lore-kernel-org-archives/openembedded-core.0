Return-Path: <matt@madison.systems>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 979BF786D7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 19:34:11 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id w17so6564941pgv.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 11:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UQekFTkRHcViFhzsa0Amr8SerIKBpC3rWX9ECnpB+UY=;
	b=eBPewyK1jZM7N2gKSW40j3X28h/yNThAzihhk4kADIa/+CsFhEDqUoKc6ZuzJ0569M
	sCHMl2SK3JqnVbSGyKPWmHeQgxa3tSCWJl+DY/kXCLQhY1+gFnpX7zWsPKIim+UnvvBy
	P0qA6XMj+sBq67xtjW4CAzoc2mvjM2dpXcqraY4PWJ2vzdxsduefE9HsdxeCNR4wItYY
	ELLRs4hgoc0c6jZPN0wofBkkE5PzbXqr3EBKiRcZ8lzggP3YLLBuCFG+ECgyHVFSypEq
	3dEEzVBbsD+m3V4ZauSiP02a5O918n3dPHltI6ra4sRXuSL6PDQ70DZb1ft30Kb3Xr48
	2aJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UQekFTkRHcViFhzsa0Amr8SerIKBpC3rWX9ECnpB+UY=;
	b=Igoj50pzaRBZ81O9xaZhgCQDFCJfmA55k6jf6w2g1/oSRF0YGe0/9Z3WOdq7n39QMF
	IFrp7LEBd+gBzXjF8IbuUTGBYbr0PWtcXGg6jBJfIGagzod+Gbv+XXRtL54istJZBBva
	RDPovNJk+gVRJoUW9soz7G3Vj74uVNIaF7woA9h3QvgPT+zAvn5IJ0MuWvel0ZANr6Og
	rjdZ4s2CIOsfZYN3duT1DfHg6c9+RPrYtSb9ccbZsW2bGSUpVZ3OTcWvisyRZZRaGihG
	lgtSamuu9rnU8qb/L44Z3lSfwH8yRAiY5gjWNkGsWGLFm610obB6IyoWbL0GgDNloCor
	YNTQ==
X-Gm-Message-State: APf1xPCdsEI1sG1AlsgSnyrcIjhFXABYSJTLRBfHDe9uQb/DxDlhX6Z4
	rFPVenySuW1K+agpY2WnNgoz9KPX
X-Google-Smtp-Source: AH8x225flhkarU+43FeiL5Gvr8K6/KCTLDognSDhE1q3U7ru8/2rFuBUCIZe3DX6W55OfFj8DovnlA==
X-Received: by 10.101.82.195 with SMTP id z3mr9408282pgp.308.1519673652535;
	Mon, 26 Feb 2018 11:34:12 -0800 (PST)
Received: from ip-172-31-34-104.us-west-2.compute.internal
	(ec2-34-218-58-157.us-west-2.compute.amazonaws.com. [34.218.58.157])
	by smtp.gmail.com with ESMTPSA id 84sm8542736pge.23.2018.02.26.11.34.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Feb 2018 11:34:11 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Feb 2018 19:33:16 +0000
Message-Id: <1519673596-4750-9-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519673596-4750-1-git-send-email-matt@madison.systems>
References: <1519673596-4750-1-git-send-email-matt@madison.systems>
Subject: [PATCH 8/8] go: move common settings to go-common.inc
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
X-List-Received-Date: Mon, 26 Feb 2018 19:34:11 -0000

Eliminate some redundancy in the recipes by moving
some commonly-used variable settings to the common
include file.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/recipes-devtools/go/go-common.inc         | 4 ++++
 meta/recipes-devtools/go/go-cross-canadian.inc | 5 -----
 meta/recipes-devtools/go/go-cross.inc          | 3 ---
 meta/recipes-devtools/go/go-crosssdk.inc       | 4 ----
 meta/recipes-devtools/go/go-native.inc         | 4 ----
 meta/recipes-devtools/go/go-runtime.inc        | 5 +----
 meta/recipes-devtools/go/go-target.inc         | 4 ----
 7 files changed, 5 insertions(+), 24 deletions(-)

diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index 611775b..11d55c4 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -23,6 +23,10 @@ INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 SSTATE_SCAN_CMD = "true"
 
 export GOROOT_OVERRIDE = "1"
+export GOTMPDIR ?= "${WORKDIR}/go-tmp"
+GOTMPDIR[vardepvalue] = ""
+export GOCACHE = "off"
+export CGO_ENABLED = "1"
 
 do_compile_prepend() {
 	BUILD_CC=${BUILD_CC}
diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc b/meta/recipes-devtools/go/go-cross-canadian.inc
index 3b98ea4..7a39e45 100644
--- a/meta/recipes-devtools/go/go-cross-canadian.inc
+++ b/meta/recipes-devtools/go/go-cross-canadian.inc
@@ -10,11 +10,6 @@ export GOHOSTARCH = "${BUILD_GOARCH}"
 export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
 export GOTOOLDIR_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/${HOST_SYS}/go/pkg/tool/${BUILD_GOTUPLE}"
 export GOROOT_FINAL = "${libdir}/go"
-export CGO_ENABLED = "1"
-export GOCACHE = "off"
-export GOTMPDIR ?= "${WORKDIR}/go-tmp"
-GOTMPDIR[vardepvalue] = ""
-#CC = "${HOST_PREFIX}gcc"
 export CGO_CFLAGS = "${CFLAGS}"
 export CGO_LDFLAGS = "${LDFLAGS}"
 export GO_LDFLAGS = '-v -linkmode external -extld ${HOST_PREFIX}gcc -extldflags "--sysroot=${STAGING_DIR_HOST} ${HOST_CC_ARCH} ${LDFLAGS}"'
diff --git a/meta/recipes-devtools/go/go-cross.inc b/meta/recipes-devtools/go/go-cross.inc
index 289ae77..44f230b 100644
--- a/meta/recipes-devtools/go/go-cross.inc
+++ b/meta/recipes-devtools/go/go-cross.inc
@@ -15,9 +15,6 @@ export GOMIPS = "${TARGET_GOMIPS}"
 export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
 export GOROOT_FINAL = "${libdir}/go"
 export GOCACHE = "off"
-export GOTMPDIR ?= "${WORKDIR}/go-tmp"
-GOTMPDIR[vardepvalue] = ""
-export CGO_ENABLED = "1"
 CC = "${@d.getVar('BUILD_CC').strip()}"
 
 do_configure[noexec] = "1"
diff --git a/meta/recipes-devtools/go/go-crosssdk.inc b/meta/recipes-devtools/go/go-crosssdk.inc
index 05ca62e..4391b32 100644
--- a/meta/recipes-devtools/go/go-crosssdk.inc
+++ b/meta/recipes-devtools/go/go-crosssdk.inc
@@ -10,10 +10,6 @@ export GOOS = "${TARGET_GOOS}"
 export GOARCH = "${TARGET_GOARCH}"
 export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
 export GOROOT_FINAL = "${libdir}/go"
-export CGO_ENABLED = "1"
-export GOCACHE = "off"
-export GOTMPDIR ?= "${WORKDIR}/go-tmp"
-GOTMPDIR[vardepvalue] = ""
 
 do_configure[noexec] = "1"
 
diff --git a/meta/recipes-devtools/go/go-native.inc b/meta/recipes-devtools/go/go-native.inc
index 31e899d..5fbb72b 100644
--- a/meta/recipes-devtools/go/go-native.inc
+++ b/meta/recipes-devtools/go/go-native.inc
@@ -10,12 +10,8 @@ SRC_URI[bootstrap.sha256sum] = "f4ff5b5eb3a3cae1c993723f3eab519c5bae18866b5e5f96
 
 export GOOS = "${BUILD_GOOS}"
 export GOARCH = "${BUILD_GOARCH}"
-export GOTMPDIR ?= "${WORKDIR}/go-tmp"
-GOTMPDIR[vardepvalue] = ""
 CC = "${@d.getVar('BUILD_CC').strip()}"
 
-export CGO_ENABLED = "1"
-
 do_configure() {
 	cd ${WORKDIR}/go1.4/go/src
 	CGO_ENABLED=0 GOROOT=${WORKDIR}/go1.4/go ./make.bash
diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devtools/go/go-runtime.inc
index 0fe4566..a79295d 100644
--- a/meta/recipes-devtools/go/go-runtime.inc
+++ b/meta/recipes-devtools/go/go-runtime.inc
@@ -11,14 +11,11 @@ export GO386 = "${TARGET_GO386}"
 export GOMIPS = "${TARGET_GOMIPS}"
 export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
 export GOROOT_FINAL = "${libdir}/go"
-export CGO_ENABLED = "1"
 export CGO_CFLAGS = "${CFLAGS}"
 export CGO_CPPFLAGS = "${CPPFLAGS}"
 export CGO_CXXFLAGS = "${CXXFLAGS}"
 export CGO_LDFLAGS = "${LDFLAGS}"
-export GOCACHE = "off"
-export GOTMPDIR ?= "${WORKDIR}/go-tmp"
-GOTMPDIR[vardepvalue] = ""
+
 GO_EXTLDFLAGS ?= "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${LDFLAGS}"
 GO_LINKMODE ?= ""
 GO_LINKMODE_class-nativesdk = "--linkmode=external"
diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/recipes-devtools/go/go-target.inc
index 141a456..aa15079 100644
--- a/meta/recipes-devtools/go/go-target.inc
+++ b/meta/recipes-devtools/go/go-target.inc
@@ -11,10 +11,6 @@ export GO386 = "${TARGET_GO386}"
 export GOMIPS = "${TARGET_GOMIPS}"
 export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
 export GOROOT_FINAL = "${libdir}/go"
-export CGO_ENABLED = "1"
-export GOCACHE = "off"
-export GOTMPDIR ?= "${WORKDIR}/go-tmp"
-GOTMPDIR[vardepvalue] = ""
 GO_LDFLAGS = ""
 GO_LDFLAGS_class-nativesdk = "-linkmode external"
 export GO_LDFLAGS
-- 
2.7.4


