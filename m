Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88B72C5478C
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 11:40:06 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.8699.1708688401766222307
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 03:40:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZbXg7uA1;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-412895f726dso1677955e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 03:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708688400; x=1709293200; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B0GnOpjBYdm+VPgMRlK4REFeW1WscmNGZra/xJLa0rw=;
        b=ZbXg7uA1tAEOtRYdUuZ8BBkCy69sjeQ8nkNl3/oRBJjrFz+9M9Wx+vhUnVznMxYfwC
         Fi6o/lW71h0vg5g0iS4XC/sXXlyt+NtMJpGbOdO3A4JVqKNecsy00jMOQtJvZGvZUVDk
         l0gWn8Qlg/NHZQZj0UCSz901wxwZBVsshgCSUhcHnTvN1U0ulyaMTpoPFxcetK+g0UBC
         p6ZHS4qXoiTKxTHLq5cCc1B1RWSbwoEbe5kNvNJzowQb/zpDEnqbXbG/qbDw4kjtqrYK
         X2fmv52Y1LgwlkZGMIIg5kyr1U+c/raZ3zOyxm1cQU/sstWKJinIufoiGv/z6HcSzomC
         B00A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708688400; x=1709293200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B0GnOpjBYdm+VPgMRlK4REFeW1WscmNGZra/xJLa0rw=;
        b=YKpUdTNsA6xQxP4lXMEOEsdHkwnyx1kD0aQ2gULK28ThFiGpc1+cQq74aq5odtj5V+
         hbR2+SRs/ZFl1XGKGaCSc/oNlFaXCzArt2qGoNDu1hboHFJpC8FsFM9Ncp468EdEz6Yb
         YVHw1HMcceBwlczhrxvOWnu6BHjViSK4rCbPjll0/NmRFoFnX28gFOW9hhXW5UAHmZa5
         EqdKEvnPHZxzj3lhJIYjC2ZIa1SM9LAHJcsji2pluhiwtyXxEVYjajCl0M6CzWszRc4G
         xAJ4b2UkuP5Wq7/fiYuU3umxY4ykTcGZOgshH3NOibBOUBionReP8TtaVhryTPrmQ8VP
         AaAQ==
X-Gm-Message-State: AOJu0YzBa/dXU3dsLwCp5Kbk3vzue3rJtXHCPLsreJNKtAZC8ReW5UP7
	KmiOIIw/bzGtvvW0PZVzq+wnRSf2etyw/uZlUnuCpxjiU8ND1iTQmEq6U7DN
X-Google-Smtp-Source: AGHT+IGdO3y+0LzXpamYnDSwqAc2IpZy3btddT58yRB5qiAf92FWMgGCfW17QDhanxbTQG+8GNMSgQ==
X-Received: by 2002:a05:600c:c15:b0:412:817c:364e with SMTP id fm21-20020a05600c0c1500b00412817c364emr910786wmb.36.1708688399585;
        Fri, 23 Feb 2024 03:39:59 -0800 (PST)
Received: from toster.lan (bl23-106-114.dsl.telepac.pt. [144.64.106.114])
        by smtp.gmail.com with ESMTPSA id 1-20020a5d47a1000000b0033b1b1da2adsm2608340wrb.99.2024.02.23.03.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 03:39:59 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] go: update 1.20.13 -> 1.20.14
Date: Fri, 23 Feb 2024 11:39:43 +0000
Message-ID: <20240223113943.70385-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 11:40:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196060

Upgrade to latest 1.20.x release [1]:

$ git log --oneline go1.20.13..go1.20.14
90a870f1dc (tag: go1.20.14, origin/release-branch.go1.20) [release-branch.go1.20] go1.20.14
a2f4a5a6e7 [release-branch.go1.20] Revert "crypto/internal/boring: upgrade module to fips-20220613" +1
746a072791 [release-branch.go1.20] crypto/x509: properly gate test on macos version
d7df7f4fa0 [release-branch.go1.20] runtime: properly model rwmutex in lock ranking

$ git log --oneline go1.20.13..go1.20.14

[1] https://github.com/golang/go/compare/go1.20.13...go1.20.14

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../go/{go-1.20.13.inc => go-1.20.14.inc}                 | 2 +-
 ...nary-native_1.20.13.bb => go-binary-native_1.20.14.bb} | 6 +++---
 ...s-canadian_1.20.13.bb => go-cross-canadian_1.20.14.bb} | 0
 .../go/{go-cross_1.20.13.bb => go-cross_1.20.14.bb}       | 0
 .../go/{go-crosssdk_1.20.13.bb => go-crosssdk_1.20.14.bb} | 0
 .../go/{go-native_1.20.13.bb => go-native_1.20.14.bb}     | 0
 .../go/{go-runtime_1.20.13.bb => go-runtime_1.20.14.bb}   | 0
 .../go/go/0003-ld-add-soname-to-shareable-objects.patch   | 8 ++++----
 meta/recipes-devtools/go/{go_1.20.13.bb => go_1.20.14.bb} | 0
 9 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/go/{go-1.20.13.inc => go-1.20.14.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.20.13.bb => go-binary-native_1.20.14.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.20.13.bb => go-cross-canadian_1.20.14.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.20.13.bb => go-cross_1.20.14.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.20.13.bb => go-crosssdk_1.20.14.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.20.13.bb => go-native_1.20.14.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.20.13.bb => go-runtime_1.20.14.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.20.13.bb => go_1.20.14.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.20.13.inc b/meta/recipes-devtools/go/go-1.20.14.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.20.13.inc
rename to meta/recipes-devtools/go/go-1.20.14.inc
index b6eeb651c9..7e425effe5 100644
--- a/meta/recipes-devtools/go/go-1.20.13.inc
+++ b/meta/recipes-devtools/go/go-1.20.14.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "0fe745c530f2f1d67193af3c5ea25246be077989ec5178df266e975f3532449e"
+SRC_URI[main.sha256sum] = "1aef321a0e3e38b7e91d2d7eb64040666cabdcc77d383de3c9522d0d69b67f4e"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.20.13.bb b/meta/recipes-devtools/go/go-binary-native_1.20.14.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.20.13.bb
rename to meta/recipes-devtools/go/go-binary-native_1.20.14.bb
index d99bab71e1..95211e6696 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.20.13.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.20.14.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "9a9d3dcae2b6a638b1f2e9bd4db08ffb39c10e55d9696914002742d90f0047b5"
-SRC_URI[go_linux_arm64.sha256sum] = "a2d811cef3c4fc77c01195622e637af0c2cf8b3814a95a0920cf2f83b6061d38"
-SRC_URI[go_linux_ppc64le.sha256sum] = "5f632b83323e16f8c6ceb676cd570b3f13f1826e06a81d92985d1301b643a7d3"
+SRC_URI[go_linux_amd64.sha256sum] = "ff445e48af27f93f66bd949ae060d97991c83e11289009d311f25426258f9c44"
+SRC_URI[go_linux_arm64.sha256sum] = "2096507509a98782850d1f0669786c09727053e9fe3c92b03c0d96f48700282b"
+SRC_URI[go_linux_ppc64le.sha256sum] = "237b1da9b65629a9b0fcf1f3ca75b4c84ef55fca1fc3eadf1681da7bbcb2e9cd"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.20.13.bb b/meta/recipes-devtools/go/go-cross-canadian_1.20.14.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.20.13.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.20.14.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.20.13.bb b/meta/recipes-devtools/go/go-cross_1.20.14.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.20.13.bb
rename to meta/recipes-devtools/go/go-cross_1.20.14.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.20.13.bb b/meta/recipes-devtools/go/go-crosssdk_1.20.14.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.20.13.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.20.14.bb
diff --git a/meta/recipes-devtools/go/go-native_1.20.13.bb b/meta/recipes-devtools/go/go-native_1.20.14.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.20.13.bb
rename to meta/recipes-devtools/go/go-native_1.20.14.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.20.13.bb b/meta/recipes-devtools/go/go-runtime_1.20.14.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.20.13.bb
rename to meta/recipes-devtools/go/go-runtime_1.20.14.bb
diff --git a/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch b/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
index ced0be1998..8f5ad04e5c 100644
--- a/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
+++ b/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
@@ -18,10 +18,10 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/ld/lib.go
-index 03b9f11..e91c92f 100644
+index 6eae900..0462ee8 100644
 --- a/src/cmd/link/internal/ld/lib.go
 +++ b/src/cmd/link/internal/ld/lib.go
-@@ -1504,6 +1504,7 @@ func (ctxt *Link) hostlink() {
+@@ -1508,6 +1508,7 @@ func (ctxt *Link) hostlink() {
  				argv = append(argv, "-Wl,-z,relro")
  			}
  			argv = append(argv, "-shared")
@@ -29,7 +29,7 @@ index 03b9f11..e91c92f 100644
  			if ctxt.HeadType == objabi.Hwindows {
  				argv = addASLRargs(argv, *flagAslr)
  			} else {
-@@ -1519,6 +1520,7 @@ func (ctxt *Link) hostlink() {
+@@ -1523,6 +1524,7 @@ func (ctxt *Link) hostlink() {
  			argv = append(argv, "-Wl,-z,relro")
  		}
  		argv = append(argv, "-shared")
@@ -37,7 +37,7 @@ index 03b9f11..e91c92f 100644
  	case BuildModePlugin:
  		if ctxt.HeadType == objabi.Hdarwin {
  			argv = append(argv, "-dynamiclib")
-@@ -1527,6 +1529,7 @@ func (ctxt *Link) hostlink() {
+@@ -1531,6 +1533,7 @@ func (ctxt *Link) hostlink() {
  				argv = append(argv, "-Wl,-z,relro")
  			}
  			argv = append(argv, "-shared")
diff --git a/meta/recipes-devtools/go/go_1.20.13.bb b/meta/recipes-devtools/go/go_1.20.14.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.20.13.bb
rename to meta/recipes-devtools/go/go_1.20.14.bb
-- 
2.43.2


