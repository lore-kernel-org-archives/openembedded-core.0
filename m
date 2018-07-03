Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0743371E4C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jul 2018 13:29:48 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id v16-v6so2360093wmv.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2018 06:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=qYAZ88IchAo+sTkcb3HrY4MbIAMbXB8JdB7SkHW74Lk=;
	b=Y6nUleFZbeN31znDP9XKSHYmDCvTsT7YiPEOYCRofVFSg05X3bQcsItq0wSh6+jG9V
	DSuNzx9k+7PgBWH1OlAydp4oH5X+Wu7JUTHVfJ5ife96rzYXtOx/3a6UOaeA4LW6JBYx
	UntNKmTj56DUhNNJMhZda54guxo0TLhpNbUroEQJ8/qAdvtFhsUcB/8Q9f79gdjlHoz+
	it2VFiw0j+dqYbnI08aNo2CAbZgDCFeObSJq5ez4KzeeBoDTJa4K0JTQNiNkhHnpsIlX
	b4hh2G8TKfdt7Kd41SC+fgJLnGWDZZn8WSSsskxU1o+BKzvqiSVkPUITtTaF49pW/QRr
	8APw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=qYAZ88IchAo+sTkcb3HrY4MbIAMbXB8JdB7SkHW74Lk=;
	b=Pmc91hv2hgh5uWpL40Otu8Q5w5H2PqW4r8jkgGib/FnJGhs4lHCT+TNxFS4jF3Rmsi
	HAfMz17Hxt3yV7qTtCx4FgqLcOFZ+H+suFBOlziLGLzAE1aRt9Tutvg4oCkZnP6fLjeq
	RT4s670pwDKJVaHpeuVLVDeX6uqHKSMMY/AB+H+ngFyd0FzTJeJwrz+pm0dB4zmrIcBp
	zaGAoOT4tYZKuP8lSRo4aPVuQ3IQCC/EijvjLaq65A3W9PVvTKxHRHHAQ5B4OrOmYYcG
	5eSn8j7W3gBV+KdJ9XEGnoni1y0vMPKb2KFUcPUBwkHZBYt9dOueybJEP+xn56fr91GN
	/YHA==
X-Gm-Message-State: APt69E3mSava7UtBSa9zri8lmp/jmwAuytRIEABBhsFoUq6pbyWZRZ54
	5V/RaVRe9JKyqpyt18NZ1Aw22BWi
X-Google-Smtp-Source: AAOMgpe/xhBXwXN8p18gY+XsjqG8kj1fjCj+KNHLI4mx9oIAajCM+2JULWyLZRsMA6nMbHih9rf8QQ==
X-Received: by 2002:a1c:b1d7:: with SMTP id
	a206-v6mr11417784wmf.61.1530624589429; 
	Tue, 03 Jul 2018 06:29:49 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	g14-v6sm854851wro.86.2018.07.03.06.29.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Jul 2018 06:29:48 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2018 14:29:47 +0100
Message-Id: <20180703132947.22914-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] fstests: remove
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
X-List-Received-Date: Tue, 03 Jul 2018 13:29:49 -0000

These tests are very old and there are better benchmarking systems available
now.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../conf/distro/include/poky-floating-revisions.inc   |  1 -
 meta/conf/distro/include/distro_alias.inc             |  1 -
 meta/conf/distro/include/maintainers.inc              |  1 -
 .../packagegroups/packagegroup-core-tools-testapps.bb |  1 -
 meta/recipes-graphics/fstests/fstests_git.bb          | 19 -------------------
 5 files changed, 23 deletions(-)
 delete mode 100644 meta/recipes-graphics/fstests/fstests_git.bb

diff --git a/meta-poky/conf/distro/include/poky-floating-revisions.inc b/meta-poky/conf/distro/include/poky-floating-revisions.inc
index a3da043d9d5..e4454db8d38 100644
--- a/meta-poky/conf/distro/include/poky-floating-revisions.inc
+++ b/meta-poky/conf/distro/include/poky-floating-revisions.inc
@@ -26,7 +26,6 @@ SRCREV_pn-sato-icon-theme ?= "${AUTOREV}"
 SRCREV_pn-matchbox-desktop-sato ?= "${AUTOREV}"
 SRCREV_pn-oh-puzzles ?= "${AUTOREV}"
 SRCREV_pn-libowl ?= "${AUTOREV}"
-SRCREV_pn-fstests ?= "${AUTOREV}"
 SRCREV_pn-xvideo-tests ?= "${AUTOREV}"
 SRCREV_pn-clutter ?= "${AUTOREV}"
 SRCREV_pn-clutter-gst ?= "${AUTOREV}"
diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index 68b731ab2b4..58c110dbe42 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -87,7 +87,6 @@ DISTRO_PN_ALIAS_pn-encodings = "Ubuntu=xfonts-encodings Mandriva=x11-font-encodi
 DISTRO_PN_ALIAS_pn-font-alias = "Fedora=xorg-x11-fonts-base Mandriva=x11-font-alias Meego=xorg-x11-fonts"
 DISTRO_PN_ALIAS_pn-font-util = "Meego=xorg-x11-font-utils Fedora=xorg-x11-font-utils Ubuntu=xfonts-utils Mandriva=x11-font-util Debian=xfonts-utils"
 DISTRO_PN_ALIAS_pn-formfactor = "OE-Core"
-DISTRO_PN_ALIAS_pn-fstests = "OpenedHand"
 DISTRO_PN_ALIAS_pn-gcc-cross-initial = "OE-Core"
 DISTRO_PN_ALIAS_pn-gcc-cross-initial-i586 = "OE-Core"
 DISTRO_PN_ALIAS_pn-gcc-crosssdk-initial = "OE-Core"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 0bca773890c..c44f2b804aa 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -163,7 +163,6 @@ RECIPE_MAINTAINER_pn-fontconfig = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-foomatic-filters = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-formfactor = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-freetype = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-fstests = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-fts = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gawk = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-gcc = "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index b8e507073ae..df43068fe56 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -25,7 +25,6 @@ X11GLTOOLS = "\
     "
 
 X11TOOLS = "\
-    fstests \
     gst-examples \
     x11perf \
     xrestop \
diff --git a/meta/recipes-graphics/fstests/fstests_git.bb b/meta/recipes-graphics/fstests/fstests_git.bb
deleted file mode 100644
index 69f217830af..00000000000
--- a/meta/recipes-graphics/fstests/fstests_git.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "Various benchmarning tests for X"
-HOMEPAGE = "http://www.o-hand.com"
-SECTION = "devel"
-LICENSE = "Zlib"
-DEPENDS = "pango libxext libxft virtual/libx11 gtk+"
-
-SRCREV = "e5939ff608b95cdd4d0ab0e1935781ab9a276ac0"
-PV = "0.1+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/${BPN}"
-UPSTREAM_CHECK_COMMITS = "1"
-
-LIC_FILES_CHKSUM = "file://test-pango-gdk.c;endline=24;md5=1ee74ec851ecda57eb7ac6cc180f7655"
-
-S = "${WORKDIR}/git/tests"
-
-inherit autotools pkgconfig distro_features_check
-# depends on virtual/libx11
-REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.11.0


