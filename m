Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 8002D79D4A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2019 16:30:09 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id f3so3199165wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Mar 2019 08:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=fKD0wsXIyyG7h6OcAuY5I5MDRXCPqOd6HpwgUygawVs=;
	b=sP910Eq7ObryQR+qqy0HpET05MgOQkg41ds2iFtPqiVNe+3ySsympvk7xvDOFbaeHW
	Pf3eVtMCPuWUhuEmzhSMdiz2vl+kO/YkmD8SDlTTRJl5AqjWtYu0/ks/E2y27EGqiKlR
	1iB/EW9D0PEnZueNVEfMttrX6tajBQ8srs9VYzROIKQmxv7mPtwt1/8kSML4owwXZkFP
	Ou/iBtGGur031bC4Z7bfcjQtILXBYcwD/k3N22mK8JYQoJ/Lq0+btU5b4JlchW3x/xZz
	IOMIeMui3nZ51jBmMEPJUpVXDhvzR0wV4cpUUC4kq2zxV117ZXW/sk6QgJteANgvm+5u
	5yoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=fKD0wsXIyyG7h6OcAuY5I5MDRXCPqOd6HpwgUygawVs=;
	b=qE/ItOf8zrZn9Jl5Hhhp3rRpXk/u/P6ulimYdvZ6F8HDKL7VosQIqUiQDoWAtQahgG
	b0N+5SLpMGYVzVNXFbBbSmLREyQnrk+Rt5W2Bz2lvtfgMBin6zUG46uYgzAyd8bZiBVh
	iZBqY6elqw2onSOnx+rMCFBvdVGyXDrD6jkyLd09x2UmBilMUZEzuN7fChzvU8fIuRjp
	GZJPBesrBXKhDgGAoEu20DmYpbxg9ff4GZ+OXo3JMwsJOOy/kVOYtMEXsQ+AfcMbINoT
	+gTSAZcNNtvZE923n5RGRZ62I8aZxOP8HHdD+yZEjcTkXtsWzJREsIqTQrTNVrpXtwQ1
	BrbQ==
X-Gm-Message-State: APjAAAV6lUdU0GOGFO7JCboszpkWJBa2kjMXQsR+42DR++gQc2a2oRdY
	xp7y1qtWqtzrnJyQ8PyXBJD4HKMDx+s=
X-Google-Smtp-Source: APXvYqxBqsHEFdrpSqEAPQbjJxU7fbdTUbqeVD9ZmWjkDefo3DrQQjhK/QiO45KRzxZXGBoEXzgiEA==
X-Received: by 2002:a7b:c7da:: with SMTP id z26mr3329899wmk.151.1551803409758; 
	Tue, 05 Mar 2019 08:30:09 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e6sm10511265wrt.14.2019.03.05.08.30.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Mar 2019 08:30:09 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Mar 2019 16:30:00 +0000
Message-Id: <20190305163003.16745-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190305163003.16745-1-ross.burton@intel.com>
References: <20190305163003.16745-1-ross.burton@intel.com>
Subject: [PATCH 2/5] icu: fix CVE-2018-18928
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
X-List-Received-Date: Tue, 05 Mar 2019 16:30:09 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/icu/icu/CVE-2018-18928.patch | 63 +++++++++++++++++++++++
 meta/recipes-support/icu/icu_63.1.bb              |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-support/icu/icu/CVE-2018-18928.patch

diff --git a/meta/recipes-support/icu/icu/CVE-2018-18928.patch b/meta/recipes-support/icu/icu/CVE-2018-18928.patch
new file mode 100644
index 00000000000..19c50e4e76a
--- /dev/null
+++ b/meta/recipes-support/icu/icu/CVE-2018-18928.patch
@@ -0,0 +1,63 @@
+CVE: CVE-2018-18928
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 53d8c8f3d181d87a6aa925b449b51c4a2c922a51 Mon Sep 17 00:00:00 2001
+From: Shane Carr <shane@unicode.org>
+Date: Mon, 29 Oct 2018 23:52:44 -0700
+Subject: [PATCH] ICU-20246 Fixing another integer overflow in number parsing.
+
+---
+ i18n/fmtable.cpp                          |  2 +-
+ i18n/number_decimalquantity.cpp           |  5 ++++-
+ test/intltest/numfmtst.cpp                |  8 ++++++++
+ 6 files changed, 31 insertions(+), 4 deletions(-)
+
+diff --git a/i18n/fmtable.cpp b/i18n/fmtable.cpp
+index 45c7024fc29..8601d95f4a6 100644
+--- a/i18n/fmtable.cpp
++++ b/i18n/fmtable.cpp
+@@ -734,7 +734,7 @@ CharString *Formattable::internalGetCharString(UErrorCode &status) {
+       // not print scientific notation for magnitudes greater than -5 and smaller than some amount (+5?).
+       if (fDecimalQuantity->isZero()) {
+         fDecimalStr->append("0", -1, status);
+-      } else if (std::abs(fDecimalQuantity->getMagnitude()) < 5) {
++      } else if (fDecimalQuantity->getMagnitude() != INT32_MIN && std::abs(fDecimalQuantity->getMagnitude()) < 5) {
+         fDecimalStr->appendInvariantChars(fDecimalQuantity->toPlainString(), status);
+       } else {
+         fDecimalStr->appendInvariantChars(fDecimalQuantity->toScientificString(), status);
+diff --git a/i18n/number_decimalquantity.cpp b/i18n/number_decimalquantity.cpp
+index 47b930a564b..d5dd7ae694c 100644
+--- a/i18n/number_decimalquantity.cpp
++++ b/i18n/number_decimalquantity.cpp
+@@ -898,7 +898,10 @@ UnicodeString DecimalQuantity::toScientificString() const {
+     }
+     result.append(u'E');
+     int32_t _scale = upperPos + scale;
+-    if (_scale < 0) {
++    if (_scale == INT32_MIN) {
++        result.append({u"-2147483648", -1});
++        return result;
++    } else if (_scale < 0) {
+         _scale *= -1;
+         result.append(u'-');
+     } else {
+diff --git a/test/intltest/numfmtst.cpp b/test/intltest/numfmtst.cpp
+index 34355939113..8d52dc122bf 100644
+--- a/test/intltest/numfmtst.cpp
++++ b/test/intltest/numfmtst.cpp
+@@ -9226,6 +9226,14 @@ void NumberFormatTest::Test20037_ScientificIntegerOverflow() {
+     assertEquals(u"Should not overflow and should parse only the first exponent",
+                  u"1E-2147483647",
+                  {sp.data(), sp.length(), US_INV});
++
++    // Test edge case overflow of exponent
++    result = Formattable();
++    nf->parse(u".0003e-2147483644", result, status);
++    sp = result.getDecimalNumber(status);
++    assertEquals(u"Should not overflow",
++                 u"3E-2147483648",
++                 {sp.data(), sp.length(), US_INV});
+ }
+ 
+ void NumberFormatTest::Test13840_ParseLongStringCrash() {
diff --git a/meta/recipes-support/icu/icu_63.1.bb b/meta/recipes-support/icu/icu_63.1.bb
index e593dc1bdbd..961f022ad7a 100644
--- a/meta/recipes-support/icu/icu_63.1.bb
+++ b/meta/recipes-support/icu/icu_63.1.bb
@@ -17,6 +17,7 @@ SRC_URI = "${BASE_SRC_URI} \
            file://icu-pkgdata-large-cmd.patch \
            file://fix-install-manx.patch \
            file://0002-Add-ARC-support.patch \
+           file://CVE-2018-18928.patch \
            "
 
 SRC_URI_append_class-target = "\
-- 
2.11.0


