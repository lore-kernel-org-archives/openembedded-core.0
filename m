Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E8A9D767F2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 15:17:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Aug 2015 08:17:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,653,1432623600"; d="scan'208";a="746454780"
Received: from aakula-mobl2.amr.corp.intel.com (HELO
	alimon-ThinkPad-W540.amr.corp.intel.com) ([10.254.73.1])
	by orsmga001.jf.intel.com with ESMTP; 11 Aug 2015 08:17:13 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Aug 2015 10:17:27 -0500
Message-Id: <1439306247-9456-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCHv3] mc: Fix QA warning depends on util-linux
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
X-List-Received-Date: Tue, 11 Aug 2015 15:17:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

mc depends on util-linux that uses libmount for mount filesystems.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-extended/mc/mc_4.8.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mc/mc_4.8.14.bb b/meta/recipes-extended/mc/mc_4.8.14.bb
index 8fec0b3..3b6c2ff 100644
--- a/meta/recipes-extended/mc/mc_4.8.14.bb
+++ b/meta/recipes-extended/mc/mc_4.8.14.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.midnight-commander.org/"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=270bbafe360e73f9840bd7981621f9c2"
 SECTION = "console/utils"
-DEPENDS = "ncurses glib-2.0"
+DEPENDS = "ncurses glib-2.0 util-linux"
 RDEPENDS_${PN} = "ncurses-terminfo"
 
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
-- 
1.9.1


