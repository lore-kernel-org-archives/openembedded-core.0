Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 02F7375E80
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Oct 2015 08:51:05 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Oct 2015 01:51:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,217,1444719600"; d="scan'208";a="838691995"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 30 Oct 2015 01:50:53 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Oct 2015 10:53:49 +0200
Message-Id: <1446195229-12338-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH][jethro][master] gcr: Require x11 DISTRO_FEATURE
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
X-List-Received-Date: Fri, 30 Oct 2015 08:51:06 -0000

This enables a world build without x11. GTK3DISTROFEATURES is not used
because gtk+-x11.pc is still required.

[YOCTO #8611]

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

The bug is currently targeted for 2.0.1


 meta/recipes-gnome/gcr/gcr_3.16.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gcr/gcr_3.16.0.bb b/meta/recipes-gnome/gcr/gcr_3.16.0.bb
index 4c9fe2e..f3bbaee 100644
--- a/meta/recipes-gnome/gcr/gcr_3.16.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.16.0.bb
@@ -7,7 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
 DEPENDS = "gtk+3 p11-kit glib-2.0 libgcrypt vala"
 
-inherit autotools gnomebase gtk-icon-cache gtk-doc
+inherit autotools gnomebase gtk-icon-cache gtk-doc distro_features_check
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI[archive.md5sum] = "d5835680be0b6a838e02a528d5378d9c"
 SRC_URI[archive.sha256sum] = "ecfe8df41cc88158364bb15addc670b11e539fe844742983629ba2323888d075"
-- 
2.1.4


