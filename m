Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8BDAD7D263
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2019 15:59:24 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id f14so3010130wrj.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2019 08:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=dwkm4jhhxxffu1LQOmkDVZFpwURVu+dBiLCYt6YGRKE=;
	b=Ka1BVnuE7lem7Jj1rTg/b4r9L3ZzzDylHAJJ/HnwYH7wv1tc4G6r4H9UaaOqp/XeSQ
	cfD7LQFAlOzLTRxiq+lEu2fgIzReyG1I9slr6yr44bFsL+8Lh8UB4Vp4QhCFpGwlCEUr
	5xAsuE2pBvUx91puugtUrb2uoEz0N+hchK31JSmGx3OXE57N48bvEOa4rjsFOCvcGYLm
	482FFf4z1SolOyFTUs9RUKs5q2hvHT69retubwnZafk/7l8UIV4wRZ/l64PfC4Skr46u
	KOd3K3Ssnv449kqoZSZ3nIm+F1fLQPu1874AYdF82YJbCn26591Aoj+tD0Si9KmZ2e7p
	VYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dwkm4jhhxxffu1LQOmkDVZFpwURVu+dBiLCYt6YGRKE=;
	b=o4/2x9A0OZVTW35ZeBMnU/vaCIlkW5iAgid+K+RADRA6nfJ7QIboCKhWm2QMuxEN7T
	IyROhcTmfKverYrlk3BJmNWAFedJO0Ut0DUp3LoSw0WgOoq1CrEOpne32ch+Yrb8S8Z1
	cbEiDKVJbGz6rrr4+KsufOmGHhxQNn6AVNbHmgvfWdbXN3ieJ7j+zMJ86B5vqJM2MVoL
	USBeGTionuGB9u6AdkOFHKaR7Do8bznCURTxouS6vOppB4VqGcUE3OCO9ZJzNkE7FHKN
	sT4e3nwdkNLGTHztOI58dmktTsOrsbfBtfWaKQ6jc93SLcpkvy+5Ywi/DHtJqg3bxtmO
	7dUg==
X-Gm-Message-State: APjAAAVSQP99lH8036/cEyhuK7taxEsaNDfHRrQ6UDjtu3anhap1SDOg
	SQTXiyn8w9lyXBmJ3o/qS8wztFa8q7g=
X-Google-Smtp-Source: APXvYqyA1wl0P7sRAYe0jTBCZ4HqnJkkuoWbCQny9LS0CYvG3aOKH7ae20M8OmOP4AllB+C570zbCA==
X-Received: by 2002:adf:e591:: with SMTP id l17mr14595461wrm.238.1555603163910;
	Thu, 18 Apr 2019 08:59:23 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	r196sm1761006wmf.22.2019.04.18.08.59.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Apr 2019 08:59:22 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Apr 2019 17:59:14 +0200
Message-Id: <20190418155918.40653-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/5] icu: update to 64.1
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
X-List-Received-Date: Thu, 18 Apr 2019 15:59:24 -0000

License-update: copyright years changed.

Drop upstreamed/backported patches.

Add a patch to fix big endian build failure.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../icu/icu/0001-Fix-big-endian-build.patch   | 28 +++++++++
 .../icu/icu/0002-Add-ARC-support.patch        | 27 --------
 .../icu/icu/CVE-2018-18928.patch              | 63 -------------------
 .../icu/{icu_63.1.bb => icu_64.1.bb}          |  9 ++-
 4 files changed, 32 insertions(+), 95 deletions(-)
 create mode 100644 meta/recipes-support/icu/icu/0001-Fix-big-endian-build.patch
 delete mode 100644 meta/recipes-support/icu/icu/0002-Add-ARC-support.patch
 delete mode 100644 meta/recipes-support/icu/icu/CVE-2018-18928.patch
 rename meta/recipes-support/icu/{icu_63.1.bb => icu_64.1.bb} (70%)

diff --git a/meta/recipes-support/icu/icu/0001-Fix-big-endian-build.patch b/meta/recipes-support/icu/icu/0001-Fix-big-endian-build.patch
new file mode 100644
index 00000000000..efb27ae4e31
--- /dev/null
+++ b/meta/recipes-support/icu/icu/0001-Fix-big-endian-build.patch
@@ -0,0 +1,28 @@
+From 9be0b489a94b57419202c552022f25cb95bfac51 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 17 Apr 2019 16:41:58 +0200
+Subject: [PATCH] Fix big-endian build
+
+Bug-report: https://unicode-org.atlassian.net/browse/ICU-20533
+Patch taken from: https://bugs.gentoo.org/682170
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ data/Makefile.in | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/source/data/Makefile.in b/source/data/Makefile.in
+index 778b6c7..67203e7 100644
+--- a/data/Makefile.in
++++ b/data/Makefile.in
+@@ -148,7 +148,8 @@ ICUDATA_ARCHIVE = $(firstword $(wildcard $(srcdir)/in/$(ICUDATA_BASENAME_VERSION
+ # and convert it to the current type.
+ ifneq ($(ICUDATA_ARCHIVE),)
+ ICUDATA_SOURCE_ARCHIVE = $(OUTDIR)/$(ICUDATA_PLATFORM_NAME).dat
+-$(ICUDATA_SOURCE_ARCHIVE): $(ICUDATA_ARCHIVE) $(OUTDIR)
++$(ICUDATA_SOURCE_ARCHIVE): $(ICUDATA_ARCHIVE)
++	$(MKINSTALLDIRS) $(OUTDIR)
+ 	$(INVOKE) $(TOOLBINDIR)/icupkg -t$(ICUDATA_CHAR) $(ICUDATA_ARCHIVE) $(ICUDATA_SOURCE_ARCHIVE)
+ endif
+ else
diff --git a/meta/recipes-support/icu/icu/0002-Add-ARC-support.patch b/meta/recipes-support/icu/icu/0002-Add-ARC-support.patch
deleted file mode 100644
index 20e3d8356c4..00000000000
--- a/meta/recipes-support/icu/icu/0002-Add-ARC-support.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From fcfd57105b4bdb30d906df152ef01748fa95daff Mon Sep 17 00:00:00 2001
-From: Alexey Brodkin <abrodkin@synopsys.com>
-Date: Thu, 13 Sep 2018 17:13:20 +0300
-Subject: [PATCH] icu: Add ARC support
-
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
-
-Upstream-Status: Submitted [ https://github.com/unicode-org/icu/pull/149 ]
----
- i18n/double-conversion-utils.h                 | 2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/i18n/double-conversion-utils.h b/i18n/double-conversion-utils.h
-index 57fc49b231a3..0bd3e8340673 100644
---- a/i18n/double-conversion-utils.h
-+++ b/i18n/double-conversion-utils.h
-@@ -86,7 +86,7 @@ inline void abort_noreturn() { abort(); }
-     defined(__SH4__) || defined(__alpha__) || \
-     defined(_MIPS_ARCH_MIPS32R2) || \
-     defined(__AARCH64EL__) || defined(__aarch64__) || \
--    defined(__riscv)
-+    defined(__riscv) || defined(__arc__)
- #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
- #elif defined(__mc68000__)
- #undef DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS
-2.17.1
-
diff --git a/meta/recipes-support/icu/icu/CVE-2018-18928.patch b/meta/recipes-support/icu/icu/CVE-2018-18928.patch
deleted file mode 100644
index 19c50e4e76a..00000000000
--- a/meta/recipes-support/icu/icu/CVE-2018-18928.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-CVE: CVE-2018-18928
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 53d8c8f3d181d87a6aa925b449b51c4a2c922a51 Mon Sep 17 00:00:00 2001
-From: Shane Carr <shane@unicode.org>
-Date: Mon, 29 Oct 2018 23:52:44 -0700
-Subject: [PATCH] ICU-20246 Fixing another integer overflow in number parsing.
-
----
- i18n/fmtable.cpp                          |  2 +-
- i18n/number_decimalquantity.cpp           |  5 ++++-
- test/intltest/numfmtst.cpp                |  8 ++++++++
- 6 files changed, 31 insertions(+), 4 deletions(-)
-
-diff --git a/i18n/fmtable.cpp b/i18n/fmtable.cpp
-index 45c7024fc29..8601d95f4a6 100644
---- a/i18n/fmtable.cpp
-+++ b/i18n/fmtable.cpp
-@@ -734,7 +734,7 @@ CharString *Formattable::internalGetCharString(UErrorCode &status) {
-       // not print scientific notation for magnitudes greater than -5 and smaller than some amount (+5?).
-       if (fDecimalQuantity->isZero()) {
-         fDecimalStr->append("0", -1, status);
--      } else if (std::abs(fDecimalQuantity->getMagnitude()) < 5) {
-+      } else if (fDecimalQuantity->getMagnitude() != INT32_MIN && std::abs(fDecimalQuantity->getMagnitude()) < 5) {
-         fDecimalStr->appendInvariantChars(fDecimalQuantity->toPlainString(), status);
-       } else {
-         fDecimalStr->appendInvariantChars(fDecimalQuantity->toScientificString(), status);
-diff --git a/i18n/number_decimalquantity.cpp b/i18n/number_decimalquantity.cpp
-index 47b930a564b..d5dd7ae694c 100644
---- a/i18n/number_decimalquantity.cpp
-+++ b/i18n/number_decimalquantity.cpp
-@@ -898,7 +898,10 @@ UnicodeString DecimalQuantity::toScientificString() const {
-     }
-     result.append(u'E');
-     int32_t _scale = upperPos + scale;
--    if (_scale < 0) {
-+    if (_scale == INT32_MIN) {
-+        result.append({u"-2147483648", -1});
-+        return result;
-+    } else if (_scale < 0) {
-         _scale *= -1;
-         result.append(u'-');
-     } else {
-diff --git a/test/intltest/numfmtst.cpp b/test/intltest/numfmtst.cpp
-index 34355939113..8d52dc122bf 100644
---- a/test/intltest/numfmtst.cpp
-+++ b/test/intltest/numfmtst.cpp
-@@ -9226,6 +9226,14 @@ void NumberFormatTest::Test20037_ScientificIntegerOverflow() {
-     assertEquals(u"Should not overflow and should parse only the first exponent",
-                  u"1E-2147483647",
-                  {sp.data(), sp.length(), US_INV});
-+
-+    // Test edge case overflow of exponent
-+    result = Formattable();
-+    nf->parse(u".0003e-2147483644", result, status);
-+    sp = result.getDecimalNumber(status);
-+    assertEquals(u"Should not overflow",
-+                 u"3E-2147483648",
-+                 {sp.data(), sp.length(), US_INV});
- }
- 
- void NumberFormatTest::Test13840_ParseLongStringCrash() {
diff --git a/meta/recipes-support/icu/icu_63.1.bb b/meta/recipes-support/icu/icu_64.1.bb
similarity index 70%
rename from meta/recipes-support/icu/icu_63.1.bb
rename to meta/recipes-support/icu/icu_64.1.bb
index 961f022ad7a..9a5f8a3b09a 100644
--- a/meta/recipes-support/icu/icu_63.1.bb
+++ b/meta/recipes-support/icu/icu_64.1.bb
@@ -1,6 +1,6 @@
 require icu.inc
 
-LIC_FILES_CHKSUM = "file://../LICENSE;md5=63752c57bd0b365c9af9f427ef79c819"
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=8bc5d32052a96f214cbdd1e53dfc935d"
 
 def icu_download_version(d):
     pvsplit = d.getVar('PV').split('.')
@@ -16,15 +16,14 @@ BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/${PV}/icu4c-${ICU_PV
 SRC_URI = "${BASE_SRC_URI} \
            file://icu-pkgdata-large-cmd.patch \
            file://fix-install-manx.patch \
-           file://0002-Add-ARC-support.patch \
-           file://CVE-2018-18928.patch \
+           file://0001-Fix-big-endian-build.patch \
            "
 
 SRC_URI_append_class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[md5sum] = "9e40f6055294284df958200e308bce50"
-SRC_URI[sha256sum] = "05c490b69454fce5860b7e8e2821231674af0a11d7ef2febea9a32512998cb9d"
+SRC_URI[md5sum] = "f150be2231c13bb45206d79e0242372b"
+SRC_URI[sha256sum] = "92f1b7b9d51b396679c17f35a2112423361b8da3c1b9de00aa94fd768ae296e6"
 
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
 UPSTREAM_CHECK_URI = "http://download.icu-project.org/files/icu4c/"
-- 
2.17.1


