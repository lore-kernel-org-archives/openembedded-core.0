Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5A3C478215
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 17:03:17 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id f4so7342097wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 10:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=52DPKQLBwRJiXmH7LvTc3QxeWSAuSoLbSZ1pbiSkHRc=;
	b=nEvZaU/54o8p9wxkS/HErkWltuE306fsN3l919X7gM/gZJTzaU3SUZPBru9tdwLX9r
	pOF2MvFwLzNdAqxTOlpUmCBhc+n0wkUWQVj4wRZPa8M+thQpYuLI7jrjIzySdxf46Xi/
	knrrH7VgNJvVpyz20Lgd0AIWiPtHy9oupRzH0y1IM2MEyTfyNYr5fRtPexQls3AC8YUs
	niKBeX0zaJxuTUaAEqQK3ossr2cEEfQ9BLQ8uAzm/S7OFeSassIJcEVH3cP76B2UDV6m
	QDAcrj52AVXxslGOX2eo9rNsibonimv4f8f6PsIO5veO7ZN164COWkvBjmBOEtK3eA0U
	7+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=52DPKQLBwRJiXmH7LvTc3QxeWSAuSoLbSZ1pbiSkHRc=;
	b=UPqXKNKbW581R/5KtgrFlBcQ6qC2YmdWOGkNN3tHDcFaipVNxuvrTmsI2Ybf1wa0Vg
	r9EECa+AyYVfZ8bXX5ySEau/AK7ZlhGT/c735ljsjl5dZnFoMXD/6MBervHbY8vnscE5
	VvB9sNHJk+zGmYpXAakT/7/6GrQHFlAHZWUFVR/DuImRaShFaSJdsz1btOgn/91tQxeG
	CyBndj5+q4NfNxsKBznwqevpyqd6HWmU0fNzEdKq3jixiKhIhX/8db73fHvdTNBV97Xi
	ZRJbemX6ZrdmlTVBOaGy/SYDaInEX2FmZX/4ER01tfOHQ2eVmNOX/tAetYmg46PiAvzz
	ajyw==
X-Gm-Message-State: AHPjjUjIEAornw0A7xyp7w7jTHpLwH2BtVSXEgxT56gyw5NwefdIl4vp
	f18zeMOFEMbZojSi
X-Google-Smtp-Source: AOwi7QAm6A+Sxch9Chl/fZ1ApQCtAjLVeG2Q8a97dRKKArGU+n0jbJuZ5vn8Bosnfxfmnt7fXHen7g==
X-Received: by 10.28.46.210 with SMTP id u201mr8650438wmu.64.1505149398668;
	Mon, 11 Sep 2017 10:03:18 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	193sm16910180wmh.47.2017.09.11.10.03.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Sep 2017 10:03:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Sep 2017 19:05:33 +0200
Message-Id: <20170911170533.24155-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH] glibc-locale: add runtime dependency on glibc
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
X-List-Received-Date: Mon, 11 Sep 2017 17:03:18 -0000

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

* easily reproducible with empty TMPDIR and:
  bitbake -c cleansstate glibc-locale && bitbake -c package_qa glibc-locale

* reproducible with Yocto 2.2 Morty as well, with slightly different
  error message:
  ERROR: glibc-locale-2.24-r0 do_package_qa: QA Issue: /usr/bin/localedef contained in package localedef requires libc.so.6(GLIBC_2.4), but no providers found in RDEPENDS_localedef? [file-rdeps]

* with Yocto 2.3 Pyro it's not reproducible by default, because rpmdeps
  aren't enabled to populate FILERDEPENDS, but once you add:
  ENABLE_RPM_FILEDEPS_FOR_PYRO = "1"
  similar QA issue is shown as well:
  ERROR: glibc-locale-2.25-r0 do_package_qa: QA Issue: /usr/bin/localedef contained in package localedef requires libc.so.6(GLIBC_2.15), but no providers found in RDEPENDS_localedef? [file-rdeps]
  ERROR: glibc-locale-2.25-r0 do_package_qa: QA Issue: /usr/bin/localedef contained in package localedef requires libc.so.6(GLIBC_2.4), but no providers found in RDEPENDS_localedef? [file-rdeps]
  ERROR: glibc-locale-2.25-r0 do_package_qa: QA Issue: /usr/bin/localedef contained in package localedef requires libc.so.6, but no providers found in RDEPENDS_localedef? [file-rdeps]

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


