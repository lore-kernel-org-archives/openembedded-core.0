Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 5042D77725
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 07:28:53 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 07 Sep 2016 00:28:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,295,1470726000"; d="scan'208";a="757913280"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Sep 2016 00:28:49 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2016 10:28:46 +0300
Message-Id: <1473233326-16830-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1473233326-16830-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1473233326-16830-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/2] oeqa.buildperf: be sure to use the latest buildstats
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
X-List-Received-Date: Wed, 07 Sep 2016 07:28:54 -0000

Be sure to take the latest buildstats if multiple buildstats are found.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 7dfb2bf..9700c05 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -466,7 +466,7 @@ class BuildPerfTestCase(unittest.TestCase):
             return bs_json
 
         log.info('Saving buildstats in JSON format')
-        bs_dirs = os.listdir(self.bb_vars['BUILDSTATS_BASE'])
+        bs_dirs = sorted(os.listdir(self.bb_vars['BUILDSTATS_BASE']))
         if len(bs_dirs) > 1:
             log.warning("Multiple buildstats found for test %s, only "
                         "archiving the last one", self.name)
-- 
2.6.6


