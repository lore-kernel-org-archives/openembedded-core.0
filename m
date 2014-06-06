Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 337406FCAE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 16:02:31 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 06 Jun 2014 09:02:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="351728751"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Jun 2014 08:58:35 -0700
Received: from localhost.localdomain (unknown [10.237.112.162])
	by linux.intel.com (Postfix) with ESMTP id B459D6A4087;
	Fri,  6 Jun 2014 09:01:43 -0700 (PDT)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jun 2014 21:06:18 +0300
Message-Id: <1402077980-9548-5-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1402077980-9548-1-git-send-email-corneliux.stoicescu@intel.com>
References: <1402077980-9548-1-git-send-email-corneliux.stoicescu@intel.com>
Subject: [PATCH 4/6] targetcontrol.py: Add a classmethod to get extra files needed by the target controllers
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
X-List-Received-Date: Fri, 06 Jun 2014 16:02:32 -0000

YB: #6254

Add a new classmethod that can be used by outside scripts to get the extra files needed by the target controllers.
An outside script can predict rootfs, manifest and kernel files needed by a target controller, but sometimes there are other files needed.

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 meta/lib/oeqa/targetcontrol.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index d4aaf3c..bdfcd18 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -73,6 +73,10 @@ class BaseTarget(object):
         pass
 
     @classmethod
+    def get_extra_files(self):
+        return None
+
+    @classmethod
     def get_image_fstype(self, d, image_fstypes=None):
 	if not image_fstypes:
 	    image_fstypes = d.getVar('IMAGE_FSTYPES', True).split(' ')
-- 
1.8.3.2


