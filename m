Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7ACC778643
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 15:46:50 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id o42so1443086wrb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 08:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Nvm71Rd2EAQqvSNkTjTE1v1pOjrBUp3lvr2kAK0pg5k=;
	b=N7PzVROCQjojnOrbUjz6gMLyyTGWPE0r8m0fT8JWEu5FW9pPAE7QuRB8NGmoNIuiGn
	ASATVUxMz5pu8C6JGoIZ6OFMaA/lTkm33vwhGv643dFgMF5H9CoHiG3zirTbXhz83JY9
	Kt+80X/21o4CA+gsuGnw9hkAEitsKxZCL4f48l8d26LIVGtDq61jsSA2FltBTuvoHkmE
	N/CXsYhiKYEwQ4RybUabYSWl+Yz808e1d9tUTOi+FVo2pVTNMvdJZgZ5FW5LeTIXBlKV
	KkZMxmhNNOBz6H2eHzEnLq+4FlD3zOS3fKIEYd3TWpxNa2XnufBjDTBhL++MkhSmGXvx
	DhRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Nvm71Rd2EAQqvSNkTjTE1v1pOjrBUp3lvr2kAK0pg5k=;
	b=RZ/UxqzQzUZXUZEaqZMvbLXjne8mgbIJLiZyw+ii8VZs4T/H+WDvG/u1Bnw3XKW4ts
	IdAsGK1eVzhJJgi86RB7d/RfsIEnQuu/1i7yI2nV7zDRlrYUwDeUcSHiccPLvEleydfG
	ZJbpNLAksfxhJnfttJTqsui1epUxIBA1zFW81u/0DIxEV7VLFc5d8GHuyExljnKDl0Yr
	5SsGBowVwtMbQj27NWSIdwYuYw5eeswhbDZZI7x260bleKvteAoy3FES8sPR9lzVRWlt
	PG3gTaXYWEVq9x2nnwplnEgo/luj3IYGO5Rr0y/PdadS/f6BAq9zJmAqToin/mdRMpfs
	OxlQ==
X-Gm-Message-State: AHPjjUj9boelSlXDzj3qGSfR1wnmbXa6K41BSAhHuAvronYQrOH9ODo5
	4++D54Ih6DD7Xw==
X-Google-Smtp-Source: ADKCNb7s2+3wCMZIpKlq3OGZOeUbUeAe+K5Eys1RssZC+3p+hKdVeriev77HGmYYzyfpPZ/59xjmNA==
X-Received: by 10.223.159.77 with SMTP id f13mr15776692wrg.154.1505317611268; 
	Wed, 13 Sep 2017 08:46:51 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	61sm10631065wre.44.2017.09.13.08.46.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Sep 2017 08:46:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 13 Sep 2017 17:49:02 +0200
Message-Id: <fe7ed67963989549148e97f484053c862b5173ab.1505317669.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1505317669.git.Martin.Jansa@gmail.com>
References: <cover.1505317669.git.Martin.Jansa@gmail.com>
Subject: [morty][PATCH 1/1] glibc-locale: add runtime dependency on glibc
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
X-List-Received-Date: Wed, 13 Sep 2017 15:46:50 -0000

* the libc.so.6 dependency is detected always:
  $ grep FILERDEPENDS BUILD-*/pkgdata/qemux86/runtime/localedef
  BUILD-bad/pkgdata/qemux86/runtime/localedef:FILERDEPENDSFLIST_localedef: /usr/bin/localedef
  BUILD-bad/pkgdata/qemux86/runtime/localedef:FILERDEPENDS_/usr/bin/localedef_localedef: libc.so.6(GLIBC_2.15) libc.so.6(GLIBC_2.3) libc.so.6(GLIBC_2.2) libc.so.6(GLIBC_2.1) libc.so.6(GLIBC_2.0) libc.so.6
  BUILD-ok/pkgdata/qemux86/runtime/localedef:FILERDEPENDSFLIST_localedef: /usr/bin/localedef
  BUILD-ok/pkgdata/qemux86/runtime/localedef:FILERDEPENDS_/usr/bin/localedef_localedef: libc.so.6(GLIBC_2.15) libc.so.6(GLIBC_2.3) libc.so.6(GLIBC_2.2) libc.so.6(GLIBC_2.1) libc.so.6(GLIBC_2.0) libc.so.6

* but in some builds the glibc dependency isn't built soon enough:
  $ diff -uNr BUILD-*/pkgdata/qemux86/runtime/localedef
  --- BUILD-bad/pkgdata/qemux86/runtime/localedef 2017-09-02 21:17:50.000000000 +0000
  +++ BUILD-ok/pkgdata/qemux86/runtime/localedef  2017-09-11 10:15:49.954381592 +0000
  @@ -6,6 +6,7 @@
   LICENSE: GPLv2 & LGPLv2.1
   DESCRIPTION_localedef: glibc: compile locale definition files
   SUMMARY: Locale data from glibc
  +RDEPENDS_localedef: glibc (>= 2.26)
   SECTION: base
   PKG_localedef: localedef
   FILES_localedef: /usr/bin/localedef
  and the build fails with QA issues:
  http://errors.yoctoproject.org/Errors/Details/155529/

  ERROR: QA Issue: /usr/bin/localedef contained in package localedef requires libc.so.6(GLIBC_2.0), but no providers found in RDEPENDS_localedef? [file-rdeps]
  ERROR: QA Issue: /usr/bin/localedef contained in package localedef requires libc.so.6(GLIBC_2.15), but no providers found in RDEPENDS_localedef? [file-rdeps]
  ERROR: QA Issue: /usr/bin/localedef contained in package localedef requires libc.so.6(GLIBC_2.3), but no providers found in RDEPENDS_localedef? [file-rdeps]
  ERROR: QA Issue: /usr/bin/localedef contained in package localedef requires libc.so.6(GLIBC_2.2), but no providers found in RDEPENDS_localedef? [file-rdeps]
  ERROR: QA Issue: /usr/bin/localedef contained in package localedef requires libc.so.6(GLIBC_2.1), but no providers found in RDEPENDS_localedef? [file-rdeps]
  ERROR: QA Issue: /usr/bin/localedef contained in package localedef requires libc.so.6, but no providers found in RDEPENDS_localedef? [file-rdeps]
  ERROR: QA run found fatal errors. Please consider fixing them.

* reproducible with Yocto 2.2 Morty as well, with slightly different
  error message:
  ERROR: glibc-locale-2.24-r0 do_package_qa: QA Issue: /usr/bin/localedef contained in package localedef requires libc.so.6(GLIBC_2.4), but no providers found in RDEPENDS_localedef? [file-rdeps]

* cherry-picked from master 2d2b4d7383c93174fe8eeb72440e81345df71295

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/glibc/glibc-locale.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index 0a7adfcc83..3fecdf996c 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -12,6 +12,10 @@ BINUTILSDEP = "virtual/${MLPREFIX}${TARGET_PREFIX}binutils:do_populate_sysroot"
 BINUTILSDEP_class-nativesdk = "virtual/${TARGET_PREFIX}binutils-crosssdk:do_populate_sysroot"
 do_package[depends] += "${BINUTILSDEP}"
 
+# localedef links with libc.so and glibc-collateral.incinhibits all default deps
+# cannot add virtual/libc to DEPENDS, because it would conflict with libc-initial in RSS
+RDEPENDS_localedef += "glibc"
+
 # Binary locales are generated at build time if ENABLE_BINARY_LOCALE_GENERATION
 # is set. The idea is to avoid running localedef on the target (at first boot)
 # to decrease initial boot time and avoid localedef being killed by the OOM
-- 
2.14.1


