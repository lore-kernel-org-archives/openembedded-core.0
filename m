Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5DC236AFD4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 15:07:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Jul 2013 08:05:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,995,1363158000"; d="scan'208";a="364825407"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 04 Jul 2013 08:07:30 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jul 2013 18:08:56 +0300
Message-Id: <1372950536-10048-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] glib-2.0: upgrade to 2.36.3
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
X-List-Received-Date: Thu, 04 Jul 2013 15:07:32 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../glib-2.0/{glib-2.0_2.36.2.bb => glib-2.0_2.36.3.bb}            |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.36.2.bb => glib-2.0_2.36.3.bb} (92%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.36.3.bb
similarity index 92%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.36.3.bb
index 935a493..463dc0d 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.36.3.bb
@@ -18,8 +18,8 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
 
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
 
-SRC_URI[md5sum] = "d791774ac49eaf8ba59792427bb74af7"
-SRC_URI[sha256sum] = "5ea98451fb57d0ba523a1e836545f0a919b498863056fdd9da69d148c1347f80"
+SRC_URI[md5sum] = "89180c7354b0acd3efb0a36ac05ca39c"
+SRC_URI[sha256sum] = "5ec433bf6ce02e4c436619c3d0b9cecdd1898469398a636bad27c1f5804c761e"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
1.7.10.4


