Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 54EAF78693
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 15:46:55 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 187so957098wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 08:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=qM42ITDAIdopQ3oQvfeHGfh2D4LBrR3dzlE908KhZuA=;
	b=CN2EkOhnqwMiV8RxQpy7K3bzaaPcj/W3ApwiGa4mLZTwsBtoRsAex9hCTbmKGfKVLz
	3t8PAX0BH0Ilf/WpvG8FQHqjrWIFWC2rWfk5nWTJngb/Hj5gatpspQ2dul8io3xm4cbr
	sxlzDKoXDbq0XuVz/9hKZjItKdiCCifcomLrjUlac5e2aYR5rvOpYszRG1QgL+5Ef2xp
	0zly1JRw6YG65gyShikptdq1tSrXHc0tyF11SZ1dJFIyCfN9SjgCimr30ZZxjLJ2PZEn
	Is4yP8DEPSzyMog7hF0ew+lz0G3VUbF8BgOuLAIRMy3s5GCJ7PtdOn/yZLwtKmreDkz9
	AJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=qM42ITDAIdopQ3oQvfeHGfh2D4LBrR3dzlE908KhZuA=;
	b=qFqJsI0fk2cMmqlsO27V28XNIRNSmpQZZAnOOKuwL1x9nq08HsDfHdm7yBFpHc8/T7
	fKTH547zaTs2gNx2Q1a9Bh9wEo5stjPyvo2hIF8I2+UuktOHkvT4WMBs9K1CnHBWWVFz
	/XRTzpxl4Hsxv6DLL1+yMH+CX8e+ZuY0L3uVdvnCYQJcK9M0csv0C7Dt8cPzpStEC4HE
	LMhwhDkZuOgVc5WhaZRyfoFgyUXMpTnr+PyC9uv4ZsWQk5zFFcuxTfewq7hoS1TSZ6BP
	x5ZSwDVmTeo1GiPtIas/XzHMbLsK17efLMbqtN84zUppTONtW6JNNuWaFQSFCLOatjVL
	J/Ug==
X-Gm-Message-State: AHPjjUjfCpx06ZpZaKhDdLJChYt2Y6pHUBrhbwRhrYGf39SkYjdSaM0q
	4pKgEbw4vrt49vxDnvOChSo=
X-Google-Smtp-Source: AOwi7QBqTtMXglDJTpZGsN9VUNCrNIFT7BuAPk+cHNuoN2Gf1h77gn2o5kP58wZtNOvGz4fv4Fr5CQ==
X-Received: by 10.28.102.213 with SMTP id a204mr2598522wmc.151.1505317616189; 
	Wed, 13 Sep 2017 08:46:56 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	l91sm18817400wrc.16.2017.09.13.08.46.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Sep 2017 08:46:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 13 Sep 2017 17:49:10 +0200
Message-Id: <16f0bd722b2cc52b0fd2fd045dff3cb078d86572.1505317670.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1505317670.git.Martin.Jansa@gmail.com>
References: <cover.1505317670.git.Martin.Jansa@gmail.com>
Subject: [pyro][PATCH 1/2] glibc-locale: add runtime dependency on glibc
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
X-List-Received-Date: Wed, 13 Sep 2017 15:46:55 -0000

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
index 70e2b3a16b..75ababea68 100644
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


