Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A3889780A1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 23:11:42 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jun 2017 16:11:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,366,1493708400"; d="scan'208";a="1184998611"
Received: from unknown (HELO localhost.localdomain) ([10.252.131.195])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jun 2017 16:11:33 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Jun 2017 16:10:28 -0700
Message-Id: <20170620231029.90760-4-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <20170620231029.90760-1-stephano.cetola@linux.intel.com>
References: <20170620231029.90760-1-stephano.cetola@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH v4 3/4] masterimage.py: rename parameter "params" in start() to "extra_bootparams"
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
X-List-Received-Date: Tue, 20 Jun 2017 23:11:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Erik Botö <erik.boto@pelagicore.com>

This matches how it is called, and how it is named in qmeu target.

[YOCTO #11524]

Signed-off-by: Erik Botö <erik.boto@pelagicore.com>
---
 meta/lib/oeqa/controllers/masterimage.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
index 6aa7fba6eb..e43e4d8889 100644
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
2.13.1


