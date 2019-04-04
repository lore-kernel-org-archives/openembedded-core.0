Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3702B7D4E6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 22:17:01 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a184so4722432wma.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2019 15:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=sL6cMEfgrpsGxEat61D3vOZQf/dnKU7lz4SXULQ2o0Q=;
	b=WG8sOw7Hmsd1f/s5gbTP3Lxdrk8S3wZbanpIvr9BFXmj3kfPZXb0EbXxOueK4EZQeh
	TEnFYXK6Y7aWd3Q2kMT2uAQ1wkw8iSeGGE2wMFHN0lggR2HaP9AxEsALX0h+uCuHoAWs
	nfKlnDEVpPKfK8hv7qHPWm6vNGrIT5M9KT+9fFf/URKC8TWdxl5n7M9tKNVgcAy+rMRZ
	JOYwmgVzQRmDsvkZ4WBt19dYkWFqRhFUVlCqOaj6IcWjZb3bxODPr5/ybpCQWhohqMUL
	pkfJCEruyfXHDcbUjrUVWTNslVohDBE9O7t568R4U9lnDfTN4XDQaoo+OGhjJ2Qrs4Zm
	3biQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=sL6cMEfgrpsGxEat61D3vOZQf/dnKU7lz4SXULQ2o0Q=;
	b=lzG2fV5WDVG+oo5X/YF9nSIvaQIgMeqRh5rb08H4sfDR9txsiY7wMrTKFHNm1nTKZx
	GgZTprymsAygCJ10cKlRliy48ITb5dkcaJhSymNG8Vx7AK4KXHyTW9Fje6XFmifzbU1K
	g7d3ek7bfIxBrtl2uR5AKrGo99NK2b9x4DwNwPS9JO1S6/3Fojil2xa1tKbfxPl7LOCB
	2EEcb1bWBVoq/RLXFLjf36uSbrYdtxjZTQN+AcUAy4iA9rwbc97D2hb7O50n+znau/dk
	a+mBEBeP2oatJ9gsOblRShWEuKDnx/G4A8zDlOV5N9kmEqqiR+8isFkwuIsIy9SWyQgR
	K30Q==
X-Gm-Message-State: APjAAAVnFOnwr661mSmEDoIan1RxrAyEqUK5uat5L0+Kv/Vbof2s3m1Q
	yGi1Lq1tFWaORSMc25H3Lnf0K1RFrM0=
X-Google-Smtp-Source: APXvYqwlO+V77xq6Lmim38eyLI47QOQBO+O7H+lhgFZBLiiC0xXlAAWDm0U7tEOpgJkjye/dAFPaYw==
X-Received: by 2002:a1c:5588:: with SMTP id j130mr5581927wmb.72.1554416221870; 
	Thu, 04 Apr 2019 15:17:01 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d3sm305565wmf.46.2019.04.04.15.17.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Apr 2019 15:17:01 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2019 23:16:44 +0100
Message-Id: <20190404221644.20496-9-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190404221644.20496-1-ross.burton@intel.com>
References: <20190404221644.20496-1-ross.burton@intel.com>
Subject: [PATCH v2 9/9] gtk+: update for new catalog path
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
X-List-Received-Date: Thu, 04 Apr 2019 22:17:01 -0000

The XML catalogue is now at the canonical path, ${sysconfdir}/xml/catalog.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
index 14ed8d812ca..d6d14a79d5a 100644
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ b/meta/recipes-gnome/gtk+/gtk+.inc
@@ -26,7 +26,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'directfb x11', d)}"
 PACKAGECONFIG[x11] = "--with-x=yes --with-gdktarget=x11,--with-x=no,${X11DEPENDS}"
 # without --with-gdktarget=directfb it will check for cairo-xlib which isn't available without X11 DISTRO_FEATURE
 PACKAGECONFIG[directfb] = "--with-gdktarget=directfb,,directfb"
-PACKAGECONFIG[manpages] = "--enable-man --with-xml-catalog=${STAGING_ETCDIR_NATIVE}/xml/catalog.xml, --disable-man, libxslt-native xmlto-native"
+PACKAGECONFIG[manpages] = "--enable-man --with-xml-catalog=${STAGING_ETCDIR_NATIVE}/xml/catalog, --disable-man, libxslt-native xmlto-native"
 
 inherit autotools gtk-doc pkgconfig update-alternatives gtk-immodules-cache gobject-introspection manpages
 
-- 
2.11.0


