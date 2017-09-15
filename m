Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 3DAC97863F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 12:55:02 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 15 Sep 2017 05:55:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,396,1500966000"; d="scan'208";a="1014792784"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga003.jf.intel.com with ESMTP; 15 Sep 2017 05:55:03 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Sep 2017 15:54:54 +0300
Message-Id: <25f03a3c3fd3352c4b91a6bc5d7f61b94e6f83d3.1505479710.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <cover.1505479710.git.markus.lehtonen@linux.intel.com>
References: <cover.1505479710.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1505479710.git.markus.lehtonen@linux.intel.com>
References: <cover.1505479710.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH 6/7] scripts/oe-build-perf-report: provide valid title in the html report
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
X-List-Received-Date: Fri, 15 Sep 2017 12:55:02 -0000

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/oe-build-perf-report | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index 4e067caba0..8d730cd20a 100755
--- a/scripts/oe-build-perf-report
+++ b/scripts/oe-build-perf-report
@@ -396,7 +396,9 @@ def print_html_report(data, id_comp):
                             'max': get_data_item(data[-1][0], 'layers.meta.commit_count')}
                  }
 
-    print(html.template.render(metadata=metadata, test_data=tests, chart_opts=chart_opts))
+    print(html.template.render(title="Build Perf Test Report",
+                               metadata=metadata, test_data=tests,
+                               chart_opts=chart_opts))
 
 
 def dump_buildstats(repo, outdir, notes_ref, revs):
-- 
2.12.3


