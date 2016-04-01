Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 9E59C731FA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 12:46:05 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 01 Apr 2016 05:46:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,427,1455004800"; d="scan'208";a="946030151"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 01 Apr 2016 05:46:05 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Apr 2016 15:45:45 +0300
Message-Id: <1459514745-22503-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] epiphany: Depend on intltool-native for configure
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
X-List-Received-Date: Fri, 01 Apr 2016 12:46:05 -0000

Fixes [YOCTO #9374].

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-gnome/epiphany/epiphany_3.18.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.18.4.bb b/meta/recipes-gnome/epiphany/epiphany_3.18.4.bb
index 12d3b07..869569c 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.18.4.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.18.4.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes ca-certificates avahi libnotify gcr libwnck3 \
-	   gsettings-desktop-schemas gnome-desktop3 libxml2-native"
+	   gsettings-desktop-schemas gnome-desktop3 libxml2-native intltool-native"
 
 inherit gnomebase gsettings distro_features_check upstream-version-is-even
 # libwnck3 is x11 only
-- 
2.1.4


