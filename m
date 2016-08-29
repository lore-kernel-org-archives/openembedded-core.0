Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BEA6D60797
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 19:48:42 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 29 Aug 2016 12:48:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,252,1470726000"; d="scan'208";a="872304240"
Received: from dthoumin-mobl2.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.6.138])
	by orsmga003.jf.intel.com with ESMTP; 29 Aug 2016 12:48:40 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 22:48:20 +0300
Message-Id: <1472500111-12358-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1472500111-12358-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1472500111-12358-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 01/12] oeqa.buildperf: add 'product' to test result data
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
X-List-Received-Date: Mon, 29 Aug 2016 19:48:42 -0000

This defaults to 'oe-core' but can be defined using the
OE_BUILDPERF_PRODUCT environment variable.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index dbc534e..ed8ff4a 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -97,6 +97,7 @@ class BuildPerfTestResult(unittest.TextTestResult):
         self.git_commit, self.git_commit_count, self.git_branch = \
                 self.get_git_revision()
         self.hostname = socket.gethostname()
+        self.product = os.getenv('OE_BUILDPERFTEST_PRODUCT', 'oe-core')
         self.start_time = self.elapsed_time = None
         self.successes = []
         log.info("Using Git branch:commit %s:%s (%s)", self.git_branch,
-- 
2.6.6


