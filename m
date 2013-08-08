Return-Path: <cristiana.voicu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 45BB5608BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 13:43:41 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 08 Aug 2013 06:43:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,839,1367996400"; d="scan'208";a="279405180"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.72])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Aug 2013 06:43:21 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2013 16:46:09 +0300
Message-Id: <640f6c9fa2af863b50ed3a89207e718e99078473.1375969277.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1375969277.git.cristiana.voicu@intel.com>
References: <cover.1375969277.git.cristiana.voicu@intel.com>
Subject: [PATCH 1/5] ed: upgrade to 1.9
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
X-List-Received-Date: Thu, 08 Aug 2013 13:43:41 -0000

LIC_FILES_CHKSUM changed because some lines were
in addition in main.c file. Those lines are related to exit
status.

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 meta/recipes-extended/ed/{ed_1.8.bb => ed_1.9.bb} |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ed/{ed_1.8.bb => ed_1.9.bb} (68%)

diff --git a/meta/recipes-extended/ed/ed_1.8.bb b/meta/recipes-extended/ed/ed_1.9.bb
similarity index 68%
rename from meta/recipes-extended/ed/ed_1.8.bb
rename to meta/recipes-extended/ed/ed_1.9.bb
index c6b5075..bd00c52 100644
--- a/meta/recipes-extended/ed/ed_1.8.bb
+++ b/meta/recipes-extended/ed/ed_1.9.bb
@@ -5,18 +5,17 @@ BUGTRACKER = ""
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
                     file://ed.h;endline=20;md5=375a20cc2545ac1115eeb7b323c60ae3 \
-                    file://main.c;endline=24;md5=1b31246da5e3864d7b30094ff76bf7ed"
+                    file://main.c;endline=17;md5=14dbb325c1f2d4daf50e0aa5c5038e96"
 
 SECTION = "base"
-PR = "r0"
 
 # LSB states that ed should be in /bin/
 bindir = "${base_bindir}"
 
 SRC_URI = "${GNU_MIRROR}/ed/ed-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "2268d2344b3c52d23730acb2e3c942fe"
-SRC_URI[sha256sum] = "64c138d33b1ea4b9daa88e045da0619e2a43cb99a9d378417d20163f410a7273"
+SRC_URI[md5sum] = "565b6d1d5a9a8816b9b304fc4ed9405d"
+SRC_URI[sha256sum] = "d5b372cfadf073001823772272fceac2cfa87552c5cd5a8efc1c8aae61f45a88"
 
 do_configure() {
 	${S}/configure
-- 
1.7.9.5


