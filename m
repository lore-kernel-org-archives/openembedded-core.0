Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8C371757DD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 10:44:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 04 Jun 2015 03:44:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,552,1427785200"; d="scan'208";a="720634402"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga001.fm.intel.com with ESMTP; 04 Jun 2015 03:44:07 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jun 2015 13:44:22 +0300
Message-Id: <ea12736d4ebc76fffcef6cf77d4b5bdc5dee3cdc.1433414236.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <4168ccc0ec9736fcb82ae9273e46e38df46b778e.1433414236.git.jussi.kukkonen@intel.com>
References: <4168ccc0ec9736fcb82ae9273e46e38df46b778e.1433414236.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1433414236.git.jussi.kukkonen@intel.com>
References: <cover.1433414236.git.jussi.kukkonen@intel.com>
Subject: [PATCH 6/6] xkeyboard-config: Upgrade 2.14 -> 2.15
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
X-List-Received-Date: Thu, 04 Jun 2015 10:44:21 -0000

Drop what remains of the patch the removed some GPLv3 content: both
eu and ph layout licenses have been corrected.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../0001-Remove-GPLv3-content.patch                | 51 ----------------------
 ...ard-config_2.14.bb => xkeyboard-config_2.15.bb} |  8 ++--
 2 files changed, 3 insertions(+), 56 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/xkeyboard-config/0001-Remove-GPLv3-content.patch
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.14.bb => xkeyboard-config_2.15.bb} (82%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config/0001-Remove-GPLv3-content.patch b/meta/recipes-graphics/xorg-lib/xkeyboard-config/0001-Remove-GPLv3-content.patch
deleted file mode 100644
index 596dc7b..0000000
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config/0001-Remove-GPLv3-content.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-Remove GPLv3 content so the package remains MIT licensed.
-
-symbols/eu has been relicensed upstream.
-Remove symbols/ph until that is relicensed upstream.
-
-Upstream-Status; Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From b3a21c1137c011d9220775fd8b2e704ff75c088c Mon Sep 17 00:00:00 2001
-From: Sergey Udaltsov <sergey.udaltsov@gmail.com>
-Date: Tue, 26 May 2015 20:57:46 +0100
-Subject: Removed GPLv3 line
-
-https://bugs.freedesktop.org/show_bug.cgi?id=31073
-
-diff --git a/symbols/ph b/symbols/ph
-index 6b3defa..a5fe5dc 100644
---- a/symbols/ph
-+++ b/symbols/ph
-@@ -2,8 +2,6 @@
- // Philippines National Keyboard Layout v1.0.0 (2010-10-23)                   //
- // http://laibcoms.com/sandbox/the-philippines-national-keyboard-layout       //
- //                                                                            //
--// License: GNU/GPLv3                                                         //
--//                                                                            //
- // Loosely based on ISO/IEC 9995-3:2009                                       //
- //	* glyphs that are not used in Philippine Languages and                //
- //		Philippine English were not included                          //
--- 
-cgit v0.10.2
-
-From 5da6d510b460cad1b31288618cc364e586576826 Mon Sep 17 00:00:00 2001
-From: Sergey Udaltsov <sergey.udaltsov@gmail.com>
-Date: Sat, 9 May 2015 00:35:25 +0100
-Subject: fixed the license (removed GPL)
-
-https://bugs.freedesktop.org/show_bug.cgi?id=31658
-
-diff --git a/symbols/eu b/symbols/eu
-index 0a4d31a..5b767f1 100644
---- a/symbols/eu
-+++ b/symbols/eu
-@@ -1,6 +1,5 @@
- // Based on <http://eurkey.steffen.bruentjen.eu/>
- // Copyright: Copyright 2012 Steffen Bruentjen (eurkey (at) steffen dot bruentjen dot de)
--// License: GPLv3 <http://www.gnu.org/licenses/gpl-3.0.html>
- // modified by Christoph Roeper <spam (at) roeper dot biz> (use firstName to mail)
- 
- default  partial alphanumeric_keys modifier_keys 
--- 
-cgit v0.10.2
diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.14.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.15.bb
similarity index 82%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.14.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.15.bb
index a960744..f416990 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.14.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.15.bb
@@ -12,11 +12,9 @@ BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=xkeyboard-confi
 LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
-SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2 \
-           file://0001-Remove-GPLv3-content.patch \
-           "
-SRC_URI[md5sum] = "2869c03d85b606f929aab054ef6e1b60"
-SRC_URI[sha256sum] = "dc91458a214c56a35727f9e523fc647615de64137057ca6ee4d4d4474a4bb2ae"
+SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "4af1deeb7c5f4cad62e65957d98d6758"
+SRC_URI[sha256sum] = "0e443cf7ca2f0b40846472c029647a05933fc705d611e1478c4db8a48a6f38bf"
 
 SECTION = "x11/libs"
 DEPENDS = "intltool-native virtual/gettext util-macros libxslt-native"
-- 
2.1.4


