Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9BA746D33E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 16:57:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Oct 2013 09:54:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="397432000"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 23 Oct 2013 09:57:33 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Oct 2013 19:59:38 +0300
Message-Id: <df46156c14795aa59603b685865e413d5663e8db.1382547468.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1382547468.git.cristian.iorga@intel.com>
References: <cover.1382547468.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1382547468.git.cristian.iorga@intel.com>
References: <cover.1382547468.git.cristian.iorga@intel.com>
Subject: [PATCH 1/2] glib-2.0: upgrade to 2.38.1
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
X-List-Received-Date: Wed, 23 Oct 2013 16:57:47 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-core/glib-2.0/{glib-2.0_2.38.0.bb => glib-2.0_2.38.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.38.0.bb => glib-2.0_2.38.1.bb} (93%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.38.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.38.1.bb
similarity index 93%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.38.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.38.1.bb
index 5717bd2..3e874d7 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.38.0.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.38.1.bb
@@ -19,8 +19,8 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
 
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
 
-SRC_URI[md5sum] = "c50d2805a76763e9b4cc4385d4ea215d"
-SRC_URI[sha256sum] = "7513a7de5e814ccb48206340a8773ea523d6a7bf04dc74565de69b899bc2ff32"
+SRC_URI[md5sum] = "f3f6789151c1810f2fe23fe9ebb8b828"
+SRC_URI[sha256sum] = "01906c62ac666d2ab3183cc07261b2536fab7b211c6129ab66b119c2af56d159"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
1.8.1.2


