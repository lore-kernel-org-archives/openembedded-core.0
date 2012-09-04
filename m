Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1T8oCc-0000Td-Vr
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 10:09:43 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 04 Sep 2012 00:57:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,365,1344236400"; d="scan'208";a="217480346"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.32])
	by fmsmga002.fm.intel.com with ESMTP; 04 Sep 2012 00:57:19 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Sep 2012 11:00:04 +0300
Message-Id: <1346745604-11650-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] grub: added upstream-status
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
X-List-Received-Date: Tue, 04 Sep 2012 08:09:43 -0000

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../grub/files/grub-no-unused-result.patch         |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/grub/files/grub-no-unused-result.patch b/meta/recipes-bsp/grub/files/grub-no-unused-result.patch
index ecd7f36..4cbd083 100644
--- a/meta/recipes-bsp/grub/files/grub-no-unused-result.patch
+++ b/meta/recipes-bsp/grub/files/grub-no-unused-result.patch
@@ -1,4 +1,5 @@
 Signed-off-by: Radu Moisan <radu.moisan@intel.com>
+Upstream-Status: Pending
 
 I had an error because of an unused return value for read().
 I added -Wno-unused-result.
-- 
1.7.9.5



