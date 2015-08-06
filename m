Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D1A03760E8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 08:40:37 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 06 Aug 2015 01:40:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,622,1432623600"; d="scan'208";a="536995300"
Received: from theory.fi.intel.com ([10.237.72.51])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Aug 2015 01:40:37 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Aug 2015 11:41:58 +0300
Message-Id: <9628276eee12092f072de98b82687a3b05ab604f.1438849692.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <2c93029d78af982ced18f114b4ed6e09ef350b00.1438849692.git.jussi.kukkonen@intel.com>
References: <2c93029d78af982ced18f114b4ed6e09ef350b00.1438849692.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1438849692.git.jussi.kukkonen@intel.com>
References: <cover.1438849692.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/6] gtk-icon-utils-native: Upgrade 3.16.4 -> 3.16.6
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
X-List-Received-Date: Thu, 06 Aug 2015 08:40:38 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...tk-icon-utils-native_3.16.4.bb => gtk-icon-utils-native_3.16.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.16.4.bb => gtk-icon-utils-native_3.16.6.bb} (94%)

diff --git a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.16.4.bb b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.16.6.bb
similarity index 94%
rename from meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.16.4.bb
rename to meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.16.6.bb
index d433b90..cba3815 100644
--- a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.16.4.bb
+++ b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.16.6.bb
@@ -10,8 +10,8 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
           file://Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch"
-SRC_URI[md5sum] = "c7497aaf6730524a127597b768a73bd7"
-SRC_URI[sha256sum] = "1ee5dbd7a4cb81a91eaa1b7ae64ba5a3eab6a3c0a764155583ab96524590fc8e"
+SRC_URI[md5sum] = "fc59e5c8b5a4585b60623dd708df400b"
+SRC_URI[sha256sum] = "4d12726d0856a968b41802ae5c5971d7e9bac532717e309d3f81b9989da5ffbe"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
                     file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737 \
-- 
2.1.4


