Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6764360939
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 20:02:01 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id z6-v6so2872863wma.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 13:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=9mVzs5TbaHXWkKs+XjYlW+8t5t5lQxJfTcoVMLSkIYs=;
	b=tewIQNcN1UveVtq3QwDN3Om3LF6oLq2ay6bFE81cLrGiNrN7iWYvYB4ivnvaf2SXMZ
	t8Gnj1KBi5ZrXr/1NO3VgCxzd7ISm4u+vuHAEHZdzFkAv5K33aKpovrZJlJeTfJj8nmM
	G7E90ImXcFZTUxtRiIALmnqiWW5zp+2OHrO3B3cN1viEHMNP6+OKMv1v4zU6t5tl7SUU
	OLtR4wV2MWd0bZJxi9unStzAjr5XaBCU6XfS1y0i6mCJaJ1C2ubt0kJbkH0BlY3hRBvD
	G+A98stvDk/PEznYUlWEphSiU9cwPkTPvB7cj7l7QMK7gpKpgyB5LMFM8H7IhbjQjtoM
	f0+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=9mVzs5TbaHXWkKs+XjYlW+8t5t5lQxJfTcoVMLSkIYs=;
	b=W+l5JhieWdIAtchFwTiUHXRkIxr8Lc2+oFptEMcVM1ZvHtzR0Eivtl+eEEgFM46r8R
	Ptn+Etc6710paYTj6qz48Hez/YSWpIJVQPN2jPytDxJR6s6oHgnkRFgbdgHjjA4C3Akh
	Ag+hf/WyJQcfkjnHgR4bKYSkj15KkcUNorOR3MeNFVfGUN7KaCyCxsB3yRaxtyQJxiPA
	rFNtY5DG/4YWcsLWeO68xnMeqoUyLd16Y4qRp4K4UNJ/y6VrMJ3Z/Z+Loy9EO2DvIBMe
	uOXrmfA/q6tYXDvxJGbilkJMSBSxk5ero5G3N37Re3/eRI5N1rQmiNHxyUDYVOP+TUyK
	hK5Q==
X-Gm-Message-State: AOUpUlErBbCjLiSjpf8s0LxIBMyP0pVoC/i0g+oIO06GrQ3l4BWuLKTh
	uXMKfTMuc4mnGwE63eg9A+nhZ346
X-Google-Smtp-Source: AAOMgpeXqOGTcQDFDDykEifnBwH1VxIzNC5ZEWVtMD1MFdoDuQ6otD/ZURd48RZ1RFEJi5xOe/4wvg==
X-Received: by 2002:a1c:6709:: with SMTP id b9-v6mr2246444wmc.68.1531425721536;
	Thu, 12 Jul 2018 13:02:01 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h12-v6sm3031274wmb.3.2018.07.12.13.02.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Jul 2018 13:02:00 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jul 2018 21:01:58 +0100
Message-Id: <20180712200158.10313-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] python-setuptools: rationalise dependencies
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
X-List-Received-Date: Thu, 12 Jul 2018 20:02:01 -0000

There's no need to do native- and nativesdk-specific DEPENDS as the
BBCLASSEXTENDs handles those renames for us.

There's no need to have a subset of RDEPENDS for class-native as all with the
new manifest the python-native PROVIDES are complete.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python-setuptools.inc | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index b121b2ab3c8..ab1c013ef1f 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -12,8 +12,6 @@ SRC_URI[md5sum] = "260630ae1a64bafa39dcc53404d63829"
 SRC_URI[sha256sum] = "012adb8e25fbfd64c652e99e7bab58799a3aaf05d39ab38561f69190a909015f"
 
 DEPENDS += "${PYTHON_PN}"
-DEPENDS_class-native = "${PYTHON_PN}-native"
-DEPENDS_class-nativesdk = "nativesdk-${PYTHON_PN}"
 
 DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${PYTHON_SITEPACKAGES_DIR} \
                            --script-dir=${bindir}"
@@ -35,12 +33,6 @@ RDEPENDS_${PN} = "\
   ${PYTHON_PN}-unittest \
   ${PYTHON_PN}-xml \
 "
-
-RDEPENDS_${PN}_class-native = "\
-  ${PYTHON_PN}-compression \
-  ${PYTHON_PN}-distutils \
-"
-
 do_install_prepend() {
     install -d ${D}${PYTHON_SITEPACKAGES_DIR}
 }
-- 
2.11.0


