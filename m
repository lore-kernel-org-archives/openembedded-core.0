Return-Path: <juro.bystricky@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id C92E960119
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Dec 2016 17:16:02 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 10 Dec 2016 09:16:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,328,1477983600"; d="scan'208";a="16376368"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga002.jf.intel.com with ESMTP; 10 Dec 2016 09:16:04 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 10 Dec 2016 09:13:38 -0800
Message-Id: <1481390018-16488-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: richard.purdie@intel.com
Subject: [PATCH] edgerouter.py: avoid python3 exception
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
X-List-Received-Date: Sat, 10 Dec 2016 17:16:04 -0000

This fixes an error such as:

Exception: File "/master/poky/meta-yocto-bsp/lib/oeqa/controllers/edgeroutertarget.py", line 47
    self.image_fstype = self.get_image_fstype(d)
TabError: inconsistent use of tabs and spaces in indentation

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta-yocto-bsp/lib/oeqa/controllers/edgeroutertarget.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-yocto-bsp/lib/oeqa/controllers/edgeroutertarget.py b/meta-yocto-bsp/lib/oeqa/controllers/edgeroutertarget.py
index b3338ca..9c47b5b 100644
--- a/meta-yocto-bsp/lib/oeqa/controllers/edgeroutertarget.py
+++ b/meta-yocto-bsp/lib/oeqa/controllers/edgeroutertarget.py
@@ -44,7 +44,7 @@ class EdgeRouterTarget(MasterImageHardwareTarget):
     def __init__(self, d):
         super(EdgeRouterTarget, self).__init__(d)
 
-	self.image_fstype = self.get_image_fstype(d)
+        self.image_fstype = self.get_image_fstype(d)
         self.deploy_cmds = [
                 'mount -L boot /boot',
                 'mkdir -p /mnt/testrootfs',
-- 
2.7.4


