Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 14314731BC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 12:55:13 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 May 2016 05:55:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,367,1459839600"; d="scan'208";a="985165499"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 26 May 2016 05:55:05 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2016 15:54:50 +0300
Message-Id: <c0f485d2ef289ee4e63c702336710108b9a003c9.1464266929.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <8b5285972ecb25a04289bc0b050d8f44d18fc048.1464266929.git.jussi.kukkonen@intel.com>
References: <8b5285972ecb25a04289bc0b050d8f44d18fc048.1464266929.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1464266929.git.jussi.kukkonen@intel.com>
References: <cover.1464266929.git.jussi.kukkonen@intel.com>
Subject: [PATCH v2 3/7] gtk+: Upgrade 2.24.29 -> 2.24.30
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
X-List-Received-Date: Thu, 26 May 2016 12:55:14 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-gnome/gtk+/{gtk+_2.24.29.bb => gtk+_2.24.30.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+_2.24.29.bb => gtk+_2.24.30.bb} (91%)

diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.29.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.30.bb
similarity index 91%
rename from meta/recipes-gnome/gtk+/gtk+_2.24.29.bb
rename to meta/recipes-gnome/gtk+/gtk+_2.24.30.bb
index cf55d20..4fe990d 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.29.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.30.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-${PV}.tar.xz \
            file://strict-prototypes.patch \
 	  "
 
-SRC_URI[md5sum] = "1b7a3689f65617387b5b54520f4439e8"
-SRC_URI[sha256sum] = "0741c59600d3d810a223866453dc2bbb18ce4723828681ba24aa6519c37631b8"
+SRC_URI[md5sum] = "04568ba5c58b75e3c7543e45628ad789"
+SRC_URI[sha256sum] = "0d15cec3b6d55c60eac205b1f3ba81a1ed4eadd9d0f8e7c508bc7065d0c4ca50"
 
 EXTRA_OECONF = "--enable-xkb --disable-glibtest --disable-cups --disable-xinerama"
 
-- 
2.1.4


