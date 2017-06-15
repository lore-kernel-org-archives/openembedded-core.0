Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 4046F783BC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 22:09:52 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 15 Jun 2017 15:09:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,345,1493708400"; d="scan'208";a="1141724375"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.121])
	by orsmga001.jf.intel.com with ESMTP; 15 Jun 2017 15:09:51 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jun 2017 17:09:48 -0500
Message-Id: <1497564590-18707-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH 1/3] oeqa/core/threaded: Don't assume that results exists on logDetails
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
X-List-Received-Date: Thu, 15 Jun 2017 22:09:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/core/threaded.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/core/threaded.py b/meta/lib/oeqa/core/threaded.py
index c6058a3..2cafe03 100644
--- a/meta/lib/oeqa/core/threaded.py
+++ b/meta/lib/oeqa/core/threaded.py
@@ -185,9 +185,10 @@ class OETestResultThreaded(object):
         self.tc.logger.info(msg)
 
     def logDetails(self):
-        tid = list(self._results)[0]
-        result = self._results[tid]['result']
-        result.logDetails()
+        if list(self._results):
+            tid = list(self._results)[0]
+            result = self._results[tid]['result']
+            result.logDetails()
 
 class _Worker(threading.Thread):
     """Thread executing tasks from a given tasks queue"""
-- 
2.1.4


