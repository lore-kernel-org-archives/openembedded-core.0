Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 445F078D40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 15:33:07 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id y2-v6so5681199wma.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 08:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=WIk/egZoDC+iPSzVuun1u08vst1Reetj8ArVLC3d2Ic=;
	b=tPe2Fp8eUdjmYbFRBgl1ADHBwThOtNjRg4yYO4EU/SsdEzkDt0ktfR9OKRM6eucb1Y
	vAlOFOiQuICEolSK4uc9a3YFuPBtr+EWwdySl+q/HyP7IuAMCocSgG2WWQ691IuUBC6x
	wDoY3pa5l/huBQs8c3rmV0KrL2sw6ZzhB23LaMGMxZeybW1StWTD2miFKsHQhIHA6a9c
	JnrwF9ITXIScBYJeHZ5egdwyOYwBSE69Ewxs+quW/2IeqCTXuDlPZ0lEZvVEgW+1WRVY
	I2JSMPFkyYHrE73Vbq9VzpKnwOYHSLY4Ty4+yXjcwuIqZZfXjTrqFX9aPSKcJoAWWLyd
	oi9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=WIk/egZoDC+iPSzVuun1u08vst1Reetj8ArVLC3d2Ic=;
	b=ejxceFTlMbSBIgR4+P+90oH8+Xa0OoLi60koZpWkeFyY9y1ts8EC2eSp9+7XJ6LXVa
	DMajbp3qk43t8x4TY/mzf+W7sFULYkYwA+ao2Rh89oqkc+IPveJFm1lPCqo5mh0tWLyA
	9Me3k+m5Dq1cTv1zQk+mxCxhngwATeVoNc2t+eqvOpaBYMRPMUDmaMkzv92mxvXAmNiP
	T2oY3Tq/ZNi4phxlMcsv21yyW3qs14V43CGevTvyd4QpaKWDp1hW//2l2KBICi3noeH2
	bHpMdFU9YEkJY3vGzbQRUA2PbadqqWll9vqj99ygUIVJcHAa5n50xUSjBlcp1YPdwqaw
	ygQA==
X-Gm-Message-State: AOUpUlGKRJ/iOiNXamtysovOb+BVdawyAbMVOmY9fxbx04mvQDkJzsTF
	yTTZkkoenksmG8Kp0d7zyP6GYU4hS2Q=
X-Google-Smtp-Source: AAOMgpfgBvgt1CU1S0msMnp2ZXHYsU7yi8/dnZdENNdO3iVt0JjsWBLrKFcmqA3p1WIpQS6R1CfUOA==
X-Received: by 2002:a1c:9e89:: with SMTP id
	h131-v6mr4492801wme.13.1532705587718; 
	Fri, 27 Jul 2018 08:33:07 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z62-v6sm3804916wmc.10.2018.07.27.08.33.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 08:33:06 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2018 16:32:46 +0100
Message-Id: <20180727153248.22838-14-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180727153248.22838-1-ross.burton@intel.com>
References: <20180727153248.22838-1-ross.burton@intel.com>
Subject: [PATCH 14/16] icon-naming-utils: remove
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
X-List-Received-Date: Fri, 27 Jul 2018 15:33:07 -0000

The last user of this was the sato theme, removed in 2016.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/maintainers.inc           |  1 -
 .../icon-naming-utils/icon-naming-utils_0.8.90.bb  | 30 ----------------------
 2 files changed, 31 deletions(-)
 delete mode 100644 meta/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index f80627c6710..82c3bc4123a 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -242,7 +242,6 @@ RECIPE_MAINTAINER_pn-hicolor-icon-theme = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-hwlatdetect = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-i2c-tools = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-icecc-create-env = "Joshua Watt <JPEWhacker@gmail.com>"
-RECIPE_MAINTAINER_pn-icon-naming-utils = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-icu = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-ifupdown = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-init-ifupdown = "Maxin B. John <maxin.john@intel.com>"
diff --git a/meta/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb b/meta/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb
deleted file mode 100644
index 6b356b0d44d..00000000000
--- a/meta/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY = "Enables backwards compatibility with current desktop icon themes"
-DESCRIPTION = "A Perl script used for maintaining backwards \
-compatibility with current desktop icon themes, while migrating to the \
-names specified in the Icon Naming Specification. The Icon Naming \
-Utilities map the icon names used by the GNOME and KDE desktops to the \
-icon names proposed in the Icon Naming Specification, and generate the \
-icon files appropriate to the desktop environment you use. The Icon \
-Naming Specification provides a standard list of common icon contexts \
-and names that can be used to make icon themes work in a desktop \
-environment or application that implements the naming specification. "
-LICENSE = "GPLv2"
-DEPENDS = "libxml-simple-perl-native"
-PR = "r5"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-SRC_URI = "http://tango.freedesktop.org/releases/icon-naming-utils-${PV}.tar.gz"
-SRC_URI[md5sum] = "2c5c7a418e5eb3268f65e21993277fba"
-SRC_URI[sha256sum] = "044ab2199ed8c6a55ce36fd4fcd8b8021a5e21f5bab028c0a7cdcf52a5902e1c"
-
-inherit autotools allarch perlnative
-
-do_configure_append() {
-	# Make sure we use our nativeperl wrapper.
-	sed -i -e "1s:#!.*:#!/usr/bin/env nativeperl:" ${S}/icon-name-mapping.pl.in
-}
-
-FILES_${PN} += "${datadir}/dtds"
-
-BBCLASSEXTEND = "native"
-- 
2.11.0


