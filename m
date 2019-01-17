Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 19EBC7C03C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 22:07:33 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id s198so5058119pgs.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 14:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uEWifObs1MT/p6LUMSv1MBN7J7nj3Y0IoJ5p2z7d5rs=;
	b=uRZgSCsJCGRAftY90mq7C25KRbAqcZctA5u3YkaDEE3EPnDFqOe7HzSNNJuKd/MrOf
	ylHOYtv5O0/LrSKdScfeRQ8ZAjix4+sQzUXdIEyGbz90kLFG8cQlwVrPyO0SC1WgZyNw
	OirMS67eJFke5eMUuWeXOBqBdNyzhJ2xZoUBoUReZTsGrl7ixoPmM4OIPTEdfdl1uq3m
	uzg/xxCJTK80lSn8s+nk1Z9+PHrvTzR+m1Q3PNjm9ZNKynF1p11VSNQUMcRD43joCbNf
	wrBj5vkwEkQHJmu8pTFDGKiFQB+7sSligJWYBOgH02KPh9xUhkGj48G89yS+AmSlGybe
	iGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uEWifObs1MT/p6LUMSv1MBN7J7nj3Y0IoJ5p2z7d5rs=;
	b=Fi+xjcIJvdcwZfcI4oBfYQy9/Ad2S66OBfp0WsxXwJOA5+kKHm/AoKTyPlRhHlIdhV
	pd/sb/fNaYdh3LUxX8cSq3U0YE/2l3wr5V1+/8MIY4eKRZ1idQ2zcOxZntDr9EMBTGrc
	yWZyQ2nJEMy7pOVWAMxWWF/1QtfXixDdGBaX1n8YstbVggl+mTs5AND0Un4468TtQN78
	5pmMVvDGeSmNc2wZn/c+RM8wOoDBek0fSx5lC8BN22gt/0fhvj/U8Eoa7a7YZo31Ejwo
	g9d8sEof2inGKWPQy+RfTCHSDh1J5iFj796/pVLMMmj4oVQLs1597zgl7ytRAlVx5z89
	IZmA==
X-Gm-Message-State: AJcUukeLKbvQWhTVYAqLqDUf+nTIq9rqLFfrp7DmJgIpjZhOR2oWHRIn
	c1/Ry4lCrzJECtBmQ2hOJDGdKplMEHg=
X-Google-Smtp-Source: ALg8bN5enOao+rVFl9wthJawGGmRL7ooc3KEkr6f1+E6emymTNyQxb1H9iyXIBz3Hr2+ZZFX6svuTg==
X-Received: by 2002:a63:5f50:: with SMTP id t77mr15124535pgb.76.1547762854511; 
	Thu, 17 Jan 2019 14:07:34 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::4107])
	by smtp.gmail.com with ESMTPSA id r4sm6539525pgn.54.2019.01.17.14.07.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 14:07:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 14:07:27 -0800
Message-Id: <20190117220727.29232-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] musl,glibc,newlib: Drop redundant STAGINGCC
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
X-List-Received-Date: Thu, 17 Jan 2019 22:07:34 -0000
Content-Transfer-Encoding: 8bit

We do not have initial phase of bootstrapping toolchains anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/multilib.bbclass       | 2 --
 meta/recipes-core/glibc/glibc.inc   | 4 ----
 meta/recipes-core/musl/musl.inc     | 6 ------
 meta/recipes-core/newlib/newlib.inc | 4 ----
 4 files changed, 16 deletions(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 6c6499a23e..2b761f3551 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -88,8 +88,6 @@ python multilib_virtclass_handler () {
 addhandler multilib_virtclass_handler
 multilib_virtclass_handler[eventmask] = "bb.event.RecipePreFinalise"
 
-STAGINGCC_prepend = "${BBEXTENDVARIANT}-"
-
 python __anonymous () {
     variant = d.getVar("BBEXTENDVARIANT")
 
diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index 6aee89bb53..67af396133 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -2,10 +2,6 @@ require glibc-common.inc
 require glibc-ld.inc
 require glibc-testing.inc
 
-STAGINGCC = "gcc-cross-initial-${TARGET_ARCH}"
-STAGINGCC_class-nativesdk = "gcc-crosssdk-initial-${SDK_SYS}"
-PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
-
 python () {
     opt_effective = "-O"
     for opt in d.getVar('SELECTED_OPTIMIZATION').split():
diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
index 319709b3cb..8408c5da62 100644
--- a/meta/recipes-core/musl/musl.inc
+++ b/meta/recipes-core/musl/musl.inc
@@ -11,14 +11,8 @@ LICENSE = "MIT"
 SECTION = "libs"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=8a4bb28f771c817fe57d3a7c4240e3aa"
 
-PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
-
 INHIBIT_DEFAULT_DEPS = "1"
 
-STAGINGCC = "gcc-cross-initial-${TARGET_ARCH}"
-STAGINGCC_class-nativesdk = "gcc-crosssdk-initial-${SDK_SYS}"
-
-
 FILES_SOLIBSDEV = ""
 FILES_${PN} += "${libdir}/lib*${SOLIBSDEV}"
 INSANE_SKIP_${PN} = "dev-so"
diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newlib/newlib.inc
index c68c163266..f50e5fed81 100644
--- a/meta/recipes-core/newlib/newlib.inc
+++ b/meta/recipes-core/newlib/newlib.inc
@@ -22,10 +22,6 @@ SRC_URI[sha256sum] = "c8566335ee74e5fcaeb8595b4ebd0400c4b043d6acb3263ecb1314f8f5
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = "virtual/${TARGET_PREFIX}gcc"
 
-PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
-STAGINGCC = "gcc-cross-initial-${TARGET_ARCH}"
-STAGINGCC_class-nativesdk = "gcc-crosssdk-initial-${SDK_SYS}"
-
 S = "${WORKDIR}/newlib-${PV}"
 B = "${WORKDIR}/build"
 
-- 
2.20.1


