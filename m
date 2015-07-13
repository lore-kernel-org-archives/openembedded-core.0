Return-Path: <amarnath.valluri@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B1A04607BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 11:48:28 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Jul 2015 04:48:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,462,1432623600"; d="scan'208";a="763414139"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga002.jf.intel.com with ESMTP; 13 Jul 2015 04:48:26 -0700
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jul 2015 14:49:15 +0300
Message-Id: <1436788155-24435-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH v2] mc: Upgrade to release 4.8.14
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
X-List-Received-Date: Mon, 13 Jul 2015 11:48:28 -0000

Not using mc-CTRL.patch, as it was merged to upstream.
Upstream commit-id: e78b636eba9d23e9f5f066b022bd5640c85409be.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta/recipes-extended/mc/{mc_4.8.13.bb => mc_4.8.14.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/mc/{mc_4.8.13.bb => mc_4.8.14.bb} (92%)

diff --git a/meta/recipes-extended/mc/mc_4.8.13.bb b/meta/recipes-extended/mc/mc_4.8.14.bb
similarity index 92%
rename from meta/recipes-extended/mc/mc_4.8.13.bb
rename to meta/recipes-extended/mc/mc_4.8.14.bb
index ef5b1a2..8fec0b3 100644
--- a/meta/recipes-extended/mc/mc_4.8.13.bb
+++ b/meta/recipes-extended/mc/mc_4.8.14.bb
@@ -7,11 +7,10 @@ DEPENDS = "ncurses glib-2.0"
 RDEPENDS_${PN} = "ncurses-terminfo"
 
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
-           file://mc-CTRL.patch \
            "
 
-SRC_URI[md5sum] = "12a521a50da6a86852177591b9623d5e"
-SRC_URI[sha256sum] = "22e1b809edba957eb9a392138bf87fea3877f7ca0b7463b7cc2eb94afa6f3e49"
+SRC_URI[md5sum] = "fe1cb75643c2bd4df64bbcf2dab76905"
+SRC_URI[sha256sum] = "61fd0fd2280c3d09d7e0aec8ab001fc89dad8e4fd9941f386414667b55152ec5"
 
 inherit autotools gettext pkgconfig
 
-- 
2.1.4

---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki 
Business Identity Code: 0357606 - 4 
Domiciled in Helsinki 

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


