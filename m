Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 10B15770D8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 13:01:37 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 19 Aug 2016 06:01:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,544,1464678000"; d="scan'208";a="158381017"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga004.fm.intel.com with ESMTP; 19 Aug 2016 06:01:37 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Aug 2016 16:01:34 +0300
Message-Id: <1471611694-31473-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1471611694-31473-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1471611694-31473-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/2] oeqa.buildperf: fix crash when creating globalres.log
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
X-List-Received-Date: Fri, 19 Aug 2016 13:01:37 -0000

Fix a bug that was introduced when converting to unittest framework.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index c1dc86e..30b8e47 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -173,7 +173,7 @@ class BuildPerfTestResult(unittest.TextTestResult):
             git_tag_rev = self.git_revision
 
         values = ['0'] * 12
-        for status, test in self.all_results():
+        for status, (test, msg) in self.all_results():
             if status not in ['SUCCESS', 'FAILURE', 'EXP_SUCCESS']:
                 continue
             (t_ind, t_len), (s_ind, s_len) = gr_map[test.name]
-- 
2.6.6


