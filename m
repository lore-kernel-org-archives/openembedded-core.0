Return-Path: <erik.boto@pelagicore.com>
Received: from ORO-EDGE-02.luxoft.com (oro-edge-02.luxoft.com [109.166.244.22])
	by mail.openembedded.org (Postfix) with ESMTP id D2AA1780B7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 14:25:42 +0000 (UTC)
Received: from ORO-HUBT-02.luxoft.com (172.30.115.36) by
	oro-edge-02.luxoft.com (172.30.19.22) with Microsoft SMTP Server (TLS)
	id 14.3.319.2; Fri, 19 May 2017 17:20:16 +0300
Received: from debbie.luxoft.com (172.31.241.79) by ORO-HUBT-02.luxoft.com
	(172.30.115.101) with Microsoft SMTP Server (TLS) id 14.3.319.2;
	Fri, 19 May 2017 17:20:15 +0300
From: =?UTF-8?q?Erik=20Bot=C3=B6?= <erik.boto@pelagicore.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 May 2017 16:20:02 +0200
Message-ID: <20170519142004.32682-2-erik.boto@pelagicore.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170519142004.32682-1-erik.boto@pelagicore.com>
References: <20170519142004.32682-1-erik.boto@pelagicore.com>
MIME-Version: 1.0
X-Originating-IP: [172.31.241.79]
Subject: [PATCH 2/4] masterimage.py: rename parameter "params" in start() to "extra_bootparams"
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
X-List-Received-Date: Fri, 19 May 2017 14:25:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This matches how it is called, and how it is named in qmeu target.

Signed-off-by: Erik Botö <erik.boto@pelagicore.com>
---
 meta/lib/oeqa/controllers/masterimage.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
index 6cdcfa3068..18da2799bb 100644
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
2.11.0


