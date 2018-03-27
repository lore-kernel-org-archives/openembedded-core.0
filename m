Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 43F5662134
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 14:23:04 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id i194so4399517pgd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 07:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=6duXAcYih597QQpakho6wmkbYlUtrLdhvZdBm8PVzOQ=;
	b=kSsmepPwHquVsU1r9HMQH+Sh+aDFxsvtpeKLToGajgLng1Ho2sSHhwnlpeWOw1xVoC
	9/TiPZNoCbH4SMM8isAElGPzZ0EPa0yWQNaKx4MkRZXrnXC8m3KD2Oh9GOOWFwDD42mq
	/2m/FLRYZWByJtUKNAuXkd+cP04HYay3pi6KnW3Pg/pnqfRPCjoRXzZkt57ixnlSvQVc
	M2k9aoyV/blmPbD6EjQlTYg6kHWrBykKkAf8PncVcfMsme+SEkhQ/SfTk8wVus0/Hej/
	UjOhfJsKppYipCj87cHFhpzpgz4BwRL538kpTTgfuKLuRVail8hzkOYVAFc4N6bucM7R
	AYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=6duXAcYih597QQpakho6wmkbYlUtrLdhvZdBm8PVzOQ=;
	b=LHsvxbSFYfppxVszhZ4GYdWKl1OhfEEJAUZEqIEI1IMTLA2oWSUkjxjvEUgBEc5Rw1
	SdxXxvW5cKcOMfgIW59B2ySCQew/z4YG74PzH4M24SBrvXDkiioOtu3x8aXJ+qI/PR+U
	O4LlFjrioTjJWExeWx9Tq8SPxfgxaXAClAMrwSiZsyHOugb39rhbo/OdOpaWdj5Q3vba
	AfcUi1wTLz0+4wW0QxzFwtVLzdTFM/OJ+UBhk/R4oXxe4S2+zsRLDUmKouoS3PT1zPWb
	rqWQSg1UHEY9V/hs9LO8+iNyfc8k/XJyMg0YnD79s4ZFt5qx5uUO+2ZCXTZPbTvnds6S
	8fwQ==
X-Gm-Message-State: AElRT7GG6U8jdBj4vYoIR3FNiYWqpALN4L2GrZksIl8AopmS5yTNkcCa
	c2pnqBS3a+Ov3eZqqA89Ja9evA==
X-Google-Smtp-Source: AG47ELsoQoM4vO1fjr3VH2HOKvLB/sdrdSt+WOUJgzbvSn3N7YtlSIQI7B3srgmbLGJJ80QP4KUzhA==
X-Received: by 10.98.15.92 with SMTP id x89mr30392042pfi.7.1522160586176;
	Tue, 27 Mar 2018 07:23:06 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:9901:2a59:c9ba:abba])
	by smtp.gmail.com with ESMTPSA id
	d199sm3568388pfd.95.2018.03.27.07.23.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 27 Mar 2018 07:23:05 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster@mvista.com
Date: Tue, 27 Mar 2018 07:23:04 -0700
Message-Id: <1522160584-22425-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [V4][PATCH] libshmfence: update to 1.3
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
X-List-Received-Date: Tue, 27 Mar 2018 14:23:05 -0000

From: Armin Kuster <akuster@mvista.com>

refreshed patch

[v2]
Remove dangling space in patch

[v3]
remove patch as changes on in update

[v4]
Remove SRC_URI

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../xorg-lib/libxshmfence/extensions.patch              | 17 -----------------
 .../{libxshmfence_1.2.bb => libxshmfence_1.3.bb}        |  6 ++----
 2 files changed, 2 insertions(+), 21 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch
 rename meta/recipes-graphics/xorg-lib/{libxshmfence_1.2.bb => libxshmfence_1.3.bb} (71%)

diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch b/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch
deleted file mode 100644
index 4cc9e05..0000000
--- a/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-With glibc 2.27 memfd_create is behind a _GNU_SOURCE guard, so call
-AC_USE_SYSTEM_EXTENSIONS to get that defined.
-
-Upstream-Status: Submitted
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/configure.ac b/configure.ac
-index 0c98875..ebf4dee 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -29,4 +29,6 @@ AC_CONFIG_SRCDIR([Makefile.am])
- AC_CONFIG_HEADERS([config.h])
- 
-+AC_USE_SYSTEM_EXTENSIONS
-+
- # Initialize Automake
- AM_INIT_AUTOMAKE([foreign dist-bzip2])
diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence_1.2.bb b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
similarity index 71%
rename from meta/recipes-graphics/xorg-lib/libxshmfence_1.2.bb
rename to meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
index 1df068d..85a48e4 100644
--- a/meta/recipes-graphics/xorg-lib/libxshmfence_1.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
@@ -13,7 +13,5 @@ DEPENDS += "virtual/libx11"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI += "file://extensions.patch"
-
-SRC_URI[md5sum] = "66662e76899112c0f99e22f2fc775a7e"
-SRC_URI[sha256sum] = "d21b2d1fd78c1efbe1f2c16dae1cb23f8fd231dcf891465b8debe636a9054b0c"
+SRC_URI[md5sum] = "42dda8016943dc12aff2c03a036e0937"
+SRC_URI[sha256sum] = "b884300d26a14961a076fbebc762a39831cb75f92bed5ccf9836345b459220c7"
-- 
2.7.4


