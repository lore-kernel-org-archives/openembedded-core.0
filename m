Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 9695D77C85
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 15:58:42 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 03 Apr 2017 08:58:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,271,1486454400"; d="scan'208";a="841292448"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 03 Apr 2017 08:58:43 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Apr 2017 18:58:35 +0300
Message-Id: <20170403155839.14067-4-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170403155839.14067-1-markus.lehtonen@linux.intel.com>
References: <20170403155839.14067-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH 3/7] scripts/oe-build-perf-report: fix typo
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
X-List-Received-Date: Mon, 03 Apr 2017 15:58:42 -0000

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/oe-build-perf-report | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index ca9cf1d..6f2db49 100755
--- a/scripts/oe-build-perf-report
+++ b/scripts/oe-build-perf-report
@@ -234,7 +234,7 @@ def print_diff_report(metadata_l, data_l, metadata_r, data_r):
     meta_diff = metadata_diff(metadata_l, metadata_r)
     rows = []
     row_fmt = ['{:{wid}} ', '{:<{wid}}   ', '{:<{wid}}']
-    rows = [['', 'CURRENT COMMIT', 'OOMPARING WITH']]
+    rows = [['', 'CURRENT COMMIT', 'COMPARING WITH']]
     for key, val in meta_diff.items():
         # Shorten commit hashes
         if key == 'commit':
-- 
2.10.2


