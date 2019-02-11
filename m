Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7223D6B463
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 11:04:30 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id j125so1569347wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 03:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=RtErrHgEhsYHiO816WcI891WBBrHqbea1IAw9XnP86w=;
	b=B8o+pFw9LmZCLuJouTuBlTzAMqLZORsRIhd2736m4FxYIhlW+PGyoDF2/GrLU6deZh
	wJ+MG+wifVk14r9/IrtnxSrHpQde5pqbaBuy51riScCGuYMUep2sGbmM/rs2g8KpRPcQ
	7/ZM/Q7X4Jxp6yAmy6DfQsIpCVOT/paEs5PVxwEMFmgwbIml1VkJ/dFcywwN0kYFRysw
	nnzLZxEceV+wh3q4bL93a0JKgjjtaKpI5OJ9aTuJftrX4914+KmOor03BRPVglWLsAXy
	+gjPENr2arnT2Ta8bQ465VxyHKjqZ8hStNozrjB5YJPmjG5ByYI+fGBpcn8WyLzl1E7Z
	5/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=RtErrHgEhsYHiO816WcI891WBBrHqbea1IAw9XnP86w=;
	b=GLUQYVTqcaYu+i6LH9uNCoRcm69oiNNlnvR7Hm+lcMZkKIDbk5qKcbPRtDYvKEw8L+
	QN97Y3lePmcmIT02OKHWMq8zIrC1W979N0pl0dIVWPc9XsBzEfhUfZPJXfek058+t0yp
	1kwgYI23ifpyjZC8AUcvDJiiwqwOeO7JrF8LL/Kxak4gwpHjQkEFawwvO/sUfHJY0ilz
	4JbUx/Hva1AB00LCCPIPnitg3GhHMdhDmxwQUR5z66e+NaXgqgReIxHpUZA8PQajzFIL
	NRNbg2oR+bByp5gukOVKXBBVnAfzhQialJ/rjrWml617hUGixM2aAJ6pWkiJeTC2WX2r
	Taiw==
X-Gm-Message-State: AHQUAuaPlZ9aCDgGaURohOM3K4+aaiAAxnAlA3w+lXx18375TZI2Q4vJ
	tqmkspJ4Zd9r5rnhvzDr/jjWqixDMYY=
X-Google-Smtp-Source: AHgI3IbuZu65ra8wTDQmmZeYJtpah22lPIMVuBc2Ll+D3uFMKV0Uw08wdTimtcW6OXqRbN0tPgpH3w==
X-Received: by 2002:adf:b3c3:: with SMTP id x3mr26571026wrd.294.1549883070748; 
	Mon, 11 Feb 2019 03:04:30 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	j33sm18215321wre.91.2019.02.11.03.04.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Feb 2019 03:04:30 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Feb 2019 11:04:23 +0000
Message-Id: <20190211110425.11105-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190211110425.11105-1-ross.burton@intel.com>
References: <20190211110425.11105-1-ross.burton@intel.com>
Subject: [PATCH 2/4] xvideo-tests: remove
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
X-List-Received-Date: Mon, 11 Feb 2019 11:04:30 -0000

These tests are very old, unmaintained, and there are far better tools to
exercise video codepaths now.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/distro_alias.inc              |  1 -
 meta/conf/distro/include/maintainers.inc               |  1 -
 .../packagegroups/packagegroup-core-tools-testapps.bb  |  1 -
 meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb | 18 ------------------
 4 files changed, 21 deletions(-)
 delete mode 100644 meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index f23db1e8a47..d2ccb1ee452 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -410,6 +410,5 @@ DISTRO_PN_ALIAS_pn-xserver-xf86-lite = "Fedora=xorg-x11-server Ubuntu=xserver-xo
 DISTRO_PN_ALIAS_pn-xserver-xorg = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
 DISTRO_PN_ALIAS_pn-xset = "Fedora=xorg-x11-server-utils Ubuntu=x11-xserver-utils Debian=x11-xserver-utils Opensuse=xorg-x11"
 DISTRO_PN_ALIAS_pn-xuser-account = "OE-Core"
-DISTRO_PN_ALIAS_pn-xvideo-tests = "OpenedHand"
 DISTRO_PN_ALIAS_pn-xvinfo = "Fedora=xorg-x11-utils Ubuntu=x11-utils"
 DISTRO_PN_ALIAS_pn-xwininfo = "Fedora=xorg-x11-utils Ubuntu=x11-utils"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index f7d43d20b7f..f5e6343904b 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -763,7 +763,6 @@ RECIPE_MAINTAINER_pn-xserver-xorg = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-xset = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-xtrans = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-xuser-account = "Armin Kuster <akuster808@gmail.com>"
-RECIPE_MAINTAINER_pn-xvideo-tests = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-xvinfo = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-xwininfo = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-xz = "Denys Dmytriyenko <denys@ti.com>"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index 643219852dd..2b7e78911b3 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -34,7 +34,6 @@ X11TOOLS = "\
     xrestop \
     xwininfo \
     xprop \
-    xvideo-tests \
     "
 
 RDEPENDS_${PN} = "\
diff --git a/meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb b/meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb
deleted file mode 100644
index 1d275a0042c..00000000000
--- a/meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Simple XVideo test application"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
-                    file://src/test-xvideo.c;beginline=1;endline=20;md5=6ae3b4c3c2ff9e51dbbc35bb237afa00"
-DEPENDS = "libxv"
-
-SRCREV = "7d38b881e99eb74169d292b40f7164e461a65092"
-PV = "0.1+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/test-xvideo"
-UPSTREAM_CHECK_COMMITS = "1"
-
-S = "${WORKDIR}/git"
-
-inherit autotools distro_features_check
-
-# The libxv requires x11 in DISTRO_FEATURES
-REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.11.0


