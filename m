Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7E2FE7D9CD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 10:55:17 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id w1so21332530wrp.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 03:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bguxw/lw7z+NQwO4+AFC85eTsgdCbMpBp7l0LqOCcIQ=;
	b=nRE8yHuLWNr8pPD7Apadqrt2bfoOb3Bb9ibAN4Gg0udAhBJaXfpWWoiKD3TjWHtd9A
	jHyDadjFBBJBQkWA36ZZXzPpQxnwCCF6rYA2bYup+O6vUnxX10CjaOTLh/NU5Wa0VNZ3
	NMUQgxn0PGSSvNE0BEsBrqOAhgl+kGGZ+Gi4BCj/j3tbCHHD5sdWNiGn9QXFptbbeQjD
	13fHtvp6Or0P9mcBvoHVpDM4M6WUJnNCOpK6PMAsmNzwrUfIi11732kj21v0Qa3lRwuB
	m0JNVRXMhqMoOtAS7d34/YC1T3a4X/eqZg4KoLaSQnmL1CibBl9m0rWnBJhSqkDr2wDV
	VT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bguxw/lw7z+NQwO4+AFC85eTsgdCbMpBp7l0LqOCcIQ=;
	b=CVV3nFGeWISB8eCGp7GsO18BqThq+3rhq7kcuUflvmodbj5v3bN4J5io4sStsIvlSi
	QJ0hZBIufhYOBuJEAs40aLYaB59v6Ole2I6LKjjQkD6k6aJseXLE7352MjQfC9ZOezrn
	GuqUa61nhU8aiRgn8fctStXVtdhCTyddQ8roRn7OkzoTSstEhU5kVEHXmOJKI2JL+sob
	CADrUYmOm1g9zKT9N8I0o1zU/OU5UHqE34XFhkOCH4r0UMYFLhMH9rxZbyzhS7sdWuge
	hwJ2AyX4YQgIZiJK/swD3FAytIDihDO0W7VINht58CxInM61Ro4kxX/6c5UeW0V9lIcb
	AFSg==
X-Gm-Message-State: APjAAAXe7dGLjkXzvKki58X7aYaeQEiTunB707Myq9FDcp1n4IFrMNCx
	VnI/Q2w1cXy7w0VxKtS61HrrhujYfgM=
X-Google-Smtp-Source: APXvYqyRj59CV8ss3h8uN1qEsRPRz/Sn5zXnLBYJrUsKmrY4Y39letJoEBwT4JRwf6Mp9D1u/wCheQ==
X-Received: by 2002:adf:ea45:: with SMTP id j5mr38081233wrn.89.1555325717833; 
	Mon, 15 Apr 2019 03:55:17 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	o10sm75468400wru.54.2019.04.15.03.55.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Apr 2019 03:55:17 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2019 12:54:53 +0200
Message-Id: <20190415105457.57067-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190415105457.57067-1-alex.kanavin@gmail.com>
References: <20190415105457.57067-1-alex.kanavin@gmail.com>
Subject: [PATCH 15/19] icu: update to 64.1
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
X-List-Received-Date: Mon, 15 Apr 2019 10:55:17 -0000

License-update: copyright years changed.

Drop upstreamed/backported patches.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../icu/icu/0002-Add-ARC-support.patch        | 27 --------
 .../icu/icu/CVE-2018-18928.patch              | 63 -------------------
 .../icu/{icu_63.1.bb => icu_64.1.bb}          |  8 +--
 3 files changed, 3 insertions(+), 95 deletions(-)
 delete mode 100644 meta/recipes-support/icu/icu/0002-Add-ARC-support.patch
 delete mode 100644 meta/recipes-support/icu/icu/CVE-2018-18928.patch
 rename meta/recipes-support/icu/{icu_63.1.bb => icu_64.1.bb} (70%)

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
index 961f022ad7a..e624b775a7e 100644
--- a/meta/recipes-support/icu/icu_63.1.bb
+++ b/meta/recipes-support/icu/icu_64.1.bb
@@ -1,6 +1,6 @@
 require icu.inc
 
-LIC_FILES_CHKSUM = "file://../LICENSE;md5=63752c57bd0b365c9af9f427ef79c819"
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=8bc5d32052a96f214cbdd1e53dfc935d"
 
 def icu_download_version(d):
     pvsplit = d.getVar('PV').split('.')
@@ -16,15 +16,13 @@ BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/${PV}/icu4c-${ICU_PV
 SRC_URI = "${BASE_SRC_URI} \
            file://icu-pkgdata-large-cmd.patch \
            file://fix-install-manx.patch \
-           file://0002-Add-ARC-support.patch \
-           file://CVE-2018-18928.patch \
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


