Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 62E9B6FF97
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 14:32:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 29 Aug 2016 07:32:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,596,1464678000"; d="scan'208";a="1048688708"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by fmsmga002.fm.intel.com with ESMTP; 29 Aug 2016 07:32:03 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 17:30:14 +0300
Message-Id: <0ee8062cc4e08f23f01de10f3911a65c9931941d.1472480768.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
References: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
References: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 07/15] gobject-introspection: odd versions are development snapshots
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
X-List-Received-Date: Mon, 29 Aug 2016 14:32:07 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb
index eca6ce0..b41a317 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb
@@ -18,7 +18,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/1.48/${BPN}-${PV}.tar.xz \
 SRC_URI[md5sum] = "01301fa9019667d48e927353e08bc218"
 SRC_URI[sha256sum] = "fa275aaccdbfc91ec0bc9a6fd0562051acdba731e7d584b64a277fec60e75877"
 
-inherit autotools pkgconfig gtk-doc python3native qemu gobject-introspection-data
+inherit autotools pkgconfig gtk-doc python3native qemu gobject-introspection-data upstream-version-is-even
 BBCLASSEXTEND = "native"
 
 # needed for writing out the qemu wrapper script
-- 
2.9.3


