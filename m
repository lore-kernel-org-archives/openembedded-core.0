Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id E754B71A74
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 16:58:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP; 09 Nov 2017 08:58:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,370,1505804400"; 
   d="scan'208";a="3077231"
Received: from scetola-mac01.jf.intel.com ([10.54.74.124])
	by orsmga001.jf.intel.com with ESMTP; 09 Nov 2017 08:58:47 -0800
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Nov 2017 08:58:28 -0800
Message-Id: <20171109165829.41508-4-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171109165829.41508-1-stephano.cetola@linux.intel.com>
References: <20171109165829.41508-1-stephano.cetola@linux.intel.com>
MIME-Version: 1.0
Subject: [rocko][PATCH 3/4] masterimage.py: rename parameter "params" in start() to "extra_bootparams"
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
X-List-Received-Date: Thu, 09 Nov 2017 16:58:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Erik Botö <erik.boto@pelagicore.com>

This matches how it is called, and how it is named in qmeu target.

[YOCTO #11524]

Signed-off-by: Erik Botö <erik.boto@pelagicore.com>
Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
---
 meta/lib/oeqa/controllers/masterimage.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
index e2ff3f12c2..a2912fc568 100644
--- a/meta/lib/oeqa/controllers/masterimage.py
+++ b/meta/lib/oeqa/controllers/masterimage.py
@@ -143,7 +143,7 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
     def _deploy(self):
         pass
 
-    def start(self, params=None):
+    def start(self, extra_bootparams=None):
         bb.plain("%s - boot test image on target" % self.pn)
         self._start()
         # set the ssh object for the target/test image
-- 
2.14.2


