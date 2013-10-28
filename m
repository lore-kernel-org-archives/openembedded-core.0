Return-Path: <cristiana.voicu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C118C6D181
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 12:06:50 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Oct 2013 05:06:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="399827996"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.65])
	by orsmga001.jf.intel.com with ESMTP; 28 Oct 2013 05:06:51 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2013 14:11:47 +0200
Message-Id: <1382962307-18361-1-git-send-email-cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] grep: upgrade to 2.15
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
X-List-Received-Date: Mon, 28 Oct 2013 12:06:52 -0000

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 .../grep/{grep_2.14.bb => grep_2.15.bb}            |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/grep/{grep_2.14.bb => grep_2.15.bb} (86%)

diff --git a/meta/recipes-extended/grep/grep_2.14.bb b/meta/recipes-extended/grep/grep_2.15.bb
similarity index 86%
rename from meta/recipes-extended/grep/grep_2.14.bb
rename to meta/recipes-extended/grep/grep_2.15.bb
index 386bbd4..b6aa882 100644
--- a/meta/recipes-extended/grep/grep_2.14.bb
+++ b/meta/recipes-extended/grep/grep_2.15.bb
@@ -6,12 +6,10 @@ SECTION = "console/utils"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8006d9c814277c1bfc4ca22af94b59ee"
 
-PR = "r0"
-
 SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "d4a3f03849d1e17ce56ab76aa5a24cab"
-SRC_URI[sha256sum] = "e70e801d4fbb16e761654a58ae48bf5020621c95c8e35bd864742577685872e1"
+SRC_URI[md5sum] = "8cab8ca52bcae735af40278423c7c942"
+SRC_URI[sha256sum] = "bf5a834e587974c8c64e71b35b9e75cd21c7ff253c0e7fbfb0a78be794965314"
 
 inherit autotools gettext
 
-- 
1.7.9.5


