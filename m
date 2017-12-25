Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5097E7857D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Dec 2017 18:05:33 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id i40so43215627qti.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Dec 2017 10:05:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=57JZJbdMMHrVSb4kpOjrJPSjvVJBMK5YFvKxL2yYz1U=;
	b=f28JujzmM/HO13r8MDvcI8I9I+WHvXhL686+XQ3P6Tn79sYo+vFJbnwv4lhyiGzM9c
	J2PzSqGtMRlYFZdni/jYJTl5IfizhkPR5ZbHQR0//Tt4YOttT3cGJbdJbuZ1wPR6W+Dm
	lQB7viS+Oo99E7BE1ctvAVatIx+cAqfEyys7ehxvNlNJyliPtDFjy5kO7sG4RoOsupqi
	apPBzXKjpYu76RJlwWsDXS+1p0L4Y8ueS5RRqsLZDkoiL2+mQ5D3oyVMnRJS6xHBe7+t
	7MjpN7l4L3yTurhk76INHPnl2MjraYvhOdTvV7kAkvNCJZX2dY0sbUSO8bXRqpDnx4jL
	GD7w==
X-Gm-Message-State: AKGB3mKiCFbfsdgVsEP5Yuc/AsgN9IR48jTSdreMjsHrTnokYFzLKVzi
	itX3oZzyr/b2Etyxp25QN7ObNhoz
X-Google-Smtp-Source: ACJfBovdc4DIHpq0RQV0Ifdf5TowG3E84lpPWZ5QirSbdRm8kxxlC6/C1H4b+zscgIN9lrwrPlXq3g==
X-Received: by 10.200.27.129 with SMTP id z1mr32509089qtj.259.1514225135010;
	Mon, 25 Dec 2017 10:05:35 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id c2sm1407359qkf.39.2017.12.25.10.05.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Dec 2017 10:05:34 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Dec 2017 13:05:23 -0500
Message-Id: <1514225123-17800-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Cc: Derek Straka <derek@asterius.io>
Subject: [PATCH] python*-setuptools: update to 38.2.5
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
X-List-Received-Date: Mon, 25 Dec 2017 18:05:34 -0000

Update the python{3}-setuptools to the latest stable version

Tested on the qemu with core-image-minimal

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta/recipes-devtools/python/python-setuptools.inc                    | 4 ++--
 .../{python-setuptools_38.2.4.bb => python-setuptools_38.2.5.bb}      | 0
 .../{python3-setuptools_38.2.4.bb => python3-setuptools_38.2.5.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-setuptools_38.2.4.bb => python-setuptools_38.2.5.bb} (100%)
 rename meta/recipes-devtools/python/{python3-setuptools_38.2.4.bb => python3-setuptools_38.2.5.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index d28a60c..d6eeeba 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -9,8 +9,8 @@ PYPI_PACKAGE_EXT = "zip"
 
 inherit pypi
 
-SRC_URI[md5sum] = "e8e05d4f8162c9341e1089c80f742f64"
-SRC_URI[sha256sum] = "9c671a6291a5b1171fb9da81665eb4f9625c7dbddc613d82abdc6002a4bce896"
+SRC_URI[md5sum] = "abfd02fba07b381c3a9682a32d765cc6"
+SRC_URI[sha256sum] = "b080f276cc868670540b2c03cee06cc14d2faf9da7bec0f15058d1b402c94507"
 
 DEPENDS += "${PYTHON_PN}"
 DEPENDS_class-native += "${PYTHON_PN}-native"
diff --git a/meta/recipes-devtools/python/python-setuptools_38.2.4.bb b/meta/recipes-devtools/python/python-setuptools_38.2.5.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-setuptools_38.2.4.bb
rename to meta/recipes-devtools/python/python-setuptools_38.2.5.bb
diff --git a/meta/recipes-devtools/python/python3-setuptools_38.2.4.bb b/meta/recipes-devtools/python/python3-setuptools_38.2.5.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_38.2.4.bb
rename to meta/recipes-devtools/python/python3-setuptools_38.2.5.bb
-- 
2.7.4


