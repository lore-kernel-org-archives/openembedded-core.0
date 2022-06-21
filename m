Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A17C43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 20:16:56 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.47955.1655842615109594643
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 13:16:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DDpDlONy;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id cf14so11142499edb.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 13:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=33cRbX2zRd5kroHA/p0Kqw+1wNgoEwkPhHzPA8Skh20=;
        b=DDpDlONyrcEyuiIAXe3kKDeRccLzcT0cO12qN1fApQ3LW26UAD71yDVvH7GBMhjk3B
         w/ig3cusjDuEvhSEIVCWEUYOO9kZW9+HUWe30v9hkhdorJ8Zpblnw85kPgZWX+rYl5eP
         LOKEldsfm8HJWocucvj22N8GF4cj0oXkMA1amnBlp9x42AHs+LIi72V8WlsQFhORoszo
         3tDlT9055HA+Gtg2U3oaXKqUBeOBXGRBnvQN/al7+bAP+lIQsvVWi5+NB8PRbk/KyoFv
         i5rTkF0Ut6A0p9LOlFvVcYngAPSkIf9Hl4uOUipgPW/PEWKBFLyH4pWF4ZeCEwI54yjS
         NMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=33cRbX2zRd5kroHA/p0Kqw+1wNgoEwkPhHzPA8Skh20=;
        b=uDtArQbumHM5bFB4zqRBaU3hOSjXJCMZ3WABegkY2Ne/V3IEdcWHTGptAcIb1wtxo3
         r30QrBTJh6azkq6rhNrqtT91Ej0E/osQ0A0XiiBG+CdIODP3DjtC3GntroXU+ONp213a
         AaYm37GpoiM0leynITj75z2kYwuA80g3R9lJx56MN3VEPoNKTM4eV0Ln/XpEAu20kPJk
         AoirI0KaFeNeP3eMsbyp2iuUMHpcBFjJpRs2N5WMxMLvy2aSkYJtva62oYEWpbBVkp2h
         75jGtrQpQReAAlbhqLCwKFdcqmNVn08nQo/FZImy+IXidK1TQ2NLFKoHh3eN1KXPRecm
         GNoA==
X-Gm-Message-State: AJIora8B5Rms2BHoI7si9JS1P5TjW/OiPOLFao3ROo8qGWla6gQX7k9y
	nFQSWnQ3paRK77nTQH3m9kqGtIw6db3HbQ==
X-Google-Smtp-Source: 
 AGRyM1uc048fCxyPXuNNnd42E61HomoshqjQw6NXmggix16MBsUuL4m7N62eMpizu55V/mfumfXbpA==
X-Received: by 2002:a50:fa99:0:b0:435:90d5:4e05 with SMTP id
 w25-20020a50fa99000000b0043590d54e05mr8627002edr.295.1655842613662;
        Tue, 21 Jun 2022 13:16:53 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 j8-20020a056402238800b0043590660f16sm3420890eda.35.2022.06.21.13.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 13:16:53 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/18] go: update 1.18.2 -> 1.18.3
Date: Tue, 21 Jun 2022 22:16:27 +0200
Message-Id: <20220621201637.1378306-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220621201637.1378306-1-alex@linutronix.de>
References: <20220621201637.1378306-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 20:16:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167176

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/go/{go-1.18.2.inc => go-1.18.3.inc}     | 2 +-
 ...{go-binary-native_1.18.2.bb => go-binary-native_1.18.3.bb} | 4 ++--
 ...o-cross-canadian_1.18.2.bb => go-cross-canadian_1.18.3.bb} | 0
 .../go/{go-cross_1.18.2.bb => go-cross_1.18.3.bb}             | 0
 .../go/{go-crosssdk_1.18.2.bb => go-crosssdk_1.18.3.bb}       | 0
 .../go/{go-native_1.18.2.bb => go-native_1.18.3.bb}           | 0
 .../go/{go-runtime_1.18.2.bb => go-runtime_1.18.3.bb}         | 0
 meta/recipes-devtools/go/{go_1.18.2.bb => go_1.18.3.bb}       | 0
 8 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/go/{go-1.18.2.inc => go-1.18.3.inc} (88%)
 rename meta/recipes-devtools/go/{go-binary-native_1.18.2.bb => go-binary-native_1.18.3.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.18.2.bb => go-cross-canadian_1.18.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.18.2.bb => go-cross_1.18.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.18.2.bb => go-crosssdk_1.18.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.18.2.bb => go-native_1.18.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.18.2.bb => go-runtime_1.18.3.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.18.2.bb => go_1.18.3.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.18.2.inc b/meta/recipes-devtools/go/go-1.18.3.inc
similarity index 88%
rename from meta/recipes-devtools/go/go-1.18.2.inc
rename to meta/recipes-devtools/go/go-1.18.3.inc
index 8f4f47db9e..68062952ca 100644
--- a/meta/recipes-devtools/go/go-1.18.2.inc
+++ b/meta/recipes-devtools/go/go-1.18.3.inc
@@ -14,4 +14,4 @@ SRC_URI += "\
     file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch \
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
 "
-SRC_URI[main.sha256sum] = "2c44d03ea2c34092137ab919ba602f2c261a038d08eb468528a3f3a28e5667e2"
+SRC_URI[main.sha256sum] = "0012386ddcbb5f3350e407c679923811dbd283fcdc421724931614a842ecbc2d"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.18.2.bb b/meta/recipes-devtools/go/go-binary-native_1.18.3.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.18.2.bb
rename to meta/recipes-devtools/go/go-binary-native_1.18.3.bb
index c5514c5fdf..f207a47e90 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.18.2.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.18.3.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "e54bec97a1a5d230fc2f9ad0880fcbabb5888f30ed9666eca4a91c5a32e86cbc"
-SRC_URI[go_linux_arm64.sha256sum] = "fc4ad28d0501eaa9c9d6190de3888c9d44d8b5fb02183ce4ae93713f67b8a35b"
+SRC_URI[go_linux_amd64.sha256sum] = "956f8507b302ab0bb747613695cdae10af99bbd39a90cae522b7c0302cc27245"
+SRC_URI[go_linux_arm64.sha256sum] = "beacbe1441bee4d7978b900136d1d6a71d150f0a9bb77e9d50c822065623a35a"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.18.2.bb b/meta/recipes-devtools/go/go-cross-canadian_1.18.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.18.2.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.18.3.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.18.2.bb b/meta/recipes-devtools/go/go-cross_1.18.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.18.2.bb
rename to meta/recipes-devtools/go/go-cross_1.18.3.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.18.2.bb b/meta/recipes-devtools/go/go-crosssdk_1.18.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.18.2.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.18.3.bb
diff --git a/meta/recipes-devtools/go/go-native_1.18.2.bb b/meta/recipes-devtools/go/go-native_1.18.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.18.2.bb
rename to meta/recipes-devtools/go/go-native_1.18.3.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.18.2.bb b/meta/recipes-devtools/go/go-runtime_1.18.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.18.2.bb
rename to meta/recipes-devtools/go/go-runtime_1.18.3.bb
diff --git a/meta/recipes-devtools/go/go_1.18.2.bb b/meta/recipes-devtools/go/go_1.18.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.18.2.bb
rename to meta/recipes-devtools/go/go_1.18.3.bb
-- 
2.30.2


