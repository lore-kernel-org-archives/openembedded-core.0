Return-Path: <dmitry.rozhkov@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 229576067D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 08:24:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 27 Jun 2016 01:24:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,536,1459839600"; d="scan'208";a="995665608"
Received: from drozhkov-desk.fi.intel.com ([10.237.72.185])
	by fmsmga001.fm.intel.com with ESMTP; 27 Jun 2016 01:24:29 -0700
From: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jun 2016 11:23:53 +0300
Message-Id: <1467015833-11686-1-git-send-email-dmitry.rozhkov@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [meta-oe][PATCH] libxfce4ui: Use native intltool for building the lib
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
X-List-Received-Date: Mon, 27 Jun 2016 08:24:32 -0000

Otherwise the dependency on intltool-dev is icluded
mistakenly to RRECOMMENDS of the libxfce4ui-dev package.

Signed-off-by: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
---
 meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.12.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.12.1.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.12.1.bb
index 723c20d..a8758e3 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.12.1.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.12.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Xfce4 Widget library and X Window System interaction"
 SECTION = "x11/libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
-DEPENDS = "perl-native glib-2.0 gtk+ gtk+3 intltool libxfce4util xfconf xfce4-dev-tools virtual/libx11 libsm libice"
+DEPENDS = "perl-native glib-2.0 gtk+ gtk+3 intltool-native libxfce4util xfconf xfce4-dev-tools virtual/libx11 libsm libice"
 
 inherit xfce autotools gettext gtk-doc
 
-- 
2.5.5


