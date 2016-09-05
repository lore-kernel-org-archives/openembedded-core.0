Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 7C175773C0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 18:33:58 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 05 Sep 2016 11:33:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,287,1470726000"; d="scan'208";a="1035731648"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 05 Sep 2016 11:33:57 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Sep 2016 21:33:56 +0300
Message-Id: <1473100436-6439-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH] oeqa.buildperf: correct globalres time format
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
X-List-Received-Date: Mon, 05 Sep 2016 18:34:01 -0000

Always use two digits for (integer part of) seconds, i.e. show '1:02.34'
instead of '1:2.34'.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index be3a946..2325cd1 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -404,7 +404,7 @@ class BuildPerfTestCase(unittest.TestCase):
 
         # Append to 'times' array for globalres log
         e_sec = etime.total_seconds()
-        self.times.append('{:d}:{:02d}:{:.2f}'.format(int(e_sec / 3600),
+        self.times.append('{:d}:{:02d}:{:05.2f}'.format(int(e_sec / 3600),
                                                       int((e_sec % 3600) / 60),
                                                        e_sec % 60))
 
-- 
2.6.6


