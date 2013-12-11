Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 62AD96A59E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 17:21:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Dec 2013 09:21:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,872,1378882800"; d="scan'208";a="450651282"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 11 Dec 2013 09:21:44 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Dec 2013 19:24:03 +0200
Message-Id: <03ca600b8ff2f0d9ff8b30c53679c0205e4f52b3.1386782484.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1386782484.git.cristian.iorga@intel.com>
References: <cover.1386782484.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1386782484.git.cristian.iorga@intel.com>
References: <cover.1386782484.git.cristian.iorga@intel.com>
Subject: [PATCH 3/3] glib-2.0: upgrade to 2.38.2
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
X-List-Received-Date: Wed, 11 Dec 2013 17:21:45 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-core/glib-2.0/{glib-2.0_2.38.1.bb => glib-2.0_2.38.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.38.1.bb => glib-2.0_2.38.2.bb} (79%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.38.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb
similarity index 79%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.38.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb
index a5db302..02730f1 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.38.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb
@@ -15,5 +15,5 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
 
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
 
-SRC_URI[md5sum] = "f3f6789151c1810f2fe23fe9ebb8b828"
-SRC_URI[sha256sum] = "01906c62ac666d2ab3183cc07261b2536fab7b211c6129ab66b119c2af56d159"
+SRC_URI[md5sum] = "26d1d08e478fc48c181ca8be44f5b69f"
+SRC_URI[sha256sum] = "056a9854c0966a0945e16146b3345b7a82562a5ba4d5516fd10398732aea5734"
-- 
1.8.3.2


