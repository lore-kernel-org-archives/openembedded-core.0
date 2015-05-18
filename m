Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 55159601E0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 16:49:53 +0000 (UTC)
Received: by wizk4 with SMTP id k4so86837884wiz.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 09:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=WzOV8k5jGpz/HgPItfs0zcezDE/au4UFcuWLDraS6cs=;
	b=mK16Jk69FtVKiaW5y8qQIhh/Dv7PIzShviWYuFCktfW5PL1BxnPueydsMzDELTPsHP
	ffFx6OF4J7cOs58Rm510NjB20Q9S/qCK+PKgG1Peh4di2cZKl0P+B6NFN1SHNrK25RZ2
	DnVLnuCrAG/g3qPAwD9/wLDifmJ26iaAo75rBgHVDMe9PzqkMgHiCnDCwZ6yd4w8hTGK
	LtsRTOf42J9BaDEt/ulbxYIPxoueQ/ZwBxBARZldzhR+WZGzoVoGtrsqhXsU4TR9jZiP
	fbmc7/x0rMKNEKwwemjNSmgiHlxeoxIYLnRxsP980SkAjP2zKOb+yI3RiWxokWM47Irm
	TTLg==
X-Gm-Message-State: ALoCoQloaliiKkPUUZOcqK7opD/Uje4U9Sx0w2PxNz/T5ZhBoedxArjPJuR//pPtoV3k9sGSaMrH
X-Received: by 10.194.174.68 with SMTP id bq4mr30040850wjc.4.1431967794831;
	Mon, 18 May 2015 09:49:54 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id y7sm17725705wjw.16.2015.05.18.09.49.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 May 2015 09:49:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2015 17:45:19 +0100
Message-Id: <1431967531-25163-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 01/13] font-util: upgrade to 1.3.1
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
X-List-Received-Date: Mon, 18 May 2015 16:49:56 -0000

License checksums updated as the Unicode license was modified (wording only).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-font/{font-util_1.3.0.bb => font-util_1.3.1.bb}          | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/xorg-font/{font-util_1.3.0.bb => font-util_1.3.1.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb b/meta/recipes-graphics/xorg-font/font-util_1.3.1.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-font/font-util_1.3.0.bb
rename to meta/recipes-graphics/xorg-font/font-util_1.3.1.bb
index 03f70bf..2285124 100644
--- a/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb
+++ b/meta/recipes-graphics/xorg-font/font-util_1.3.1.bb
@@ -4,7 +4,7 @@ require xorg-font-common.inc
 
 #Unicode is MIT
 LICENSE = "BSD & MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c0067273d90f6336008cb2504e14bd32 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=5df208ec65eb84ce5bb8d82d8f3b9675 \
                     file://ucs2any.c;endline=28;md5=8357dc567fc628bd12696f15b2a33bcb \
                     file://bdftruncate.c;endline=26;md5=4f82ffc101a1b165eae9c6998abff937 \
                     file://map-ISO8859-1;beginline=9;endline=23;md5=1cecb984063248f29ffe5c46f5c04f34"
@@ -14,12 +14,10 @@ DEPENDS_class-native = "util-macros-native"
 RDEPENDS_${PN} = "mkfontdir mkfontscale encodings"
 RDEPENDS_${PN}_class-native = "mkfontdir-native mkfontscale-native"
 
-PR = "${INC_PR}.0"
-
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "ddfc8a89d597651408369d940d03d06b"
-SRC_URI[sha256sum] = "dfa9e55625a4e0250f32fabab1fd5c8ffcd2d1ff2720d6fcf0f74bc8a5929195"
+SRC_URI[md5sum] = "23756dab809f9ec5011bb27fb2c3c7d6"
+SRC_URI[sha256sum] = "aa7ebdb0715106dd255082f2310dbaa2cd7e225957c2a77d719720c7cc92b921"
 
 SYSROOT_PREPROCESS_FUNCS += "fontutil_sysroot_preprocess"
 fontutil_sysroot_preprocess () {
-- 
2.1.4


