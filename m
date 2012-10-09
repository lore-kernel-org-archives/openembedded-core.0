Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei.adrianx.dinu@intel.com>) id 1TLZyO-0002AL-5U
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Oct 2012 15:35:48 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Oct 2012 06:22:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,560,1344236400"; d="scan'208";a="232480494"
Received: from adinu-vostro-460 (HELO localhost.localdomain) ([10.237.105.39])
	by fmsmga002.fm.intel.com with ESMTP; 09 Oct 2012 06:22:38 -0700
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Oct 2012 16:23:26 +0300
Message-Id: <1349789006-9356-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] hob-toolchain: task-core-standalone-sdk-target renamed
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
X-List-Received-Date: Tue, 09 Oct 2012 13:35:48 -0000

into packagegroup-core-standalone-sdk-target.

this chagnges applies also to task-core-standalone-sdk-target-dbg.

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 bitbake/lib/bb/ui/crumbs/hoblistmodel.py |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/ui/crumbs/hoblistmodel.py b/bitbake/lib/bb/ui/crumbs/hoblistmodel.py
index 3885319..f4ccbc3 100644
--- a/bitbake/lib/bb/ui/crumbs/hoblistmodel.py
+++ b/bitbake/lib/bb/ui/crumbs/hoblistmodel.py
@@ -42,7 +42,7 @@ class PackageListModel(gtk.TreeStore):
                                 ()),
     }
 
-    __toolchain_required_packages__ = ["task-core-standalone-sdk-target", "task-core-standalone-sdk-target-dbg"]
+    __toolchain_required_packages__ = ["packagegroup-core-standalone-sdk-target", "packagegroup-core-standalone-sdk-target-dbg"]
 
     def __init__(self):
 
-- 
1.7.9.5



