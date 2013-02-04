Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U2TiK-0001PK-7R
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 22:36:34 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Feb 2013 13:20:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,602,1355126400"; d="scan'208";a="257604525"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.90])
	by orsmga001.jf.intel.com with ESMTP; 04 Feb 2013 13:20:35 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2013 13:20:27 -0800
Message-Id: <1360012827-12608-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH] v86d: Use BP instead of P
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Feb 2013 21:36:34 -0000

P is expanded to it's multi and other prefix / suffix name,
so use BP instead which is the BaseName and Version.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-bsp/v86d/v86d_0.1.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/v86d/v86d_0.1.10.bb b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
index 3c77f25..51829a3 100644
--- a/meta/recipes-bsp/v86d/v86d_0.1.10.bb
+++ b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
@@ -9,7 +9,7 @@ DEPENDS = "virtual/kernel"
 RRECOMMENDS_${PN} = "kernel-module-uvesafb"
 PR = "r1"
 
-SRC_URI = "http://distfiles.gentoo.org/distfiles/${P}.tar.bz2 \
+SRC_URI = "http://distfiles.gentoo.org/distfiles/${BP}.tar.bz2 \
            file://fbsetup \
            file://ar-from-env.patch"
 
-- 
1.8.0.2



