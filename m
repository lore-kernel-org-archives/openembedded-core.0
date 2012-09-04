Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1T8pGN-0002Cl-HV
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 11:17:39 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Sep 2012 02:05:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,366,1344236400"; d="scan'208";a="196411124"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.32])
	by orsmga002.jf.intel.com with ESMTP; 04 Sep 2012 02:05:15 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Sep 2012 12:07:59 +0300
Message-Id: <1346749679-12397-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] busybox: Add sign-off-by and upstream-status
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
X-List-Received-Date: Tue, 04 Sep 2012 09:17:39 -0000

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../busybox-1.20.2/busybox-1.20.2-kernel_ver.patch |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox-1.20.2/busybox-1.20.2-kernel_ver.patch b/meta/recipes-core/busybox/busybox-1.20.2/busybox-1.20.2-kernel_ver.patch
index 456fb08..69bbe73 100644
--- a/meta/recipes-core/busybox/busybox-1.20.2/busybox-1.20.2-kernel_ver.patch
+++ b/meta/recipes-core/busybox/busybox-1.20.2/busybox-1.20.2-kernel_ver.patch
@@ -1,3 +1,6 @@
+Signed-off-by: Radu Moisan <radu.moisan@intel.com>
+Upstream-Status: Pending
+
 --- busybox-1.20.2/libbb/kernel_version.c
 +++ busybox-1.20.2-kernel_ver/libbb/kernel_version.c
 @@ -20,18 +20,15 @@
-- 
1.7.9.5



