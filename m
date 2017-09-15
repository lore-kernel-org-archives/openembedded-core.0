Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 22A207867F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 12:55:01 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 15 Sep 2017 05:55:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,396,1500966000"; d="scan'208";a="1014792772"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga003.jf.intel.com with ESMTP; 15 Sep 2017 05:55:01 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Sep 2017 15:54:53 +0300
Message-Id: <67d248706089e7d3cb04fafe1efbfcbdc928088f.1505479710.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <cover.1505479710.git.markus.lehtonen@linux.intel.com>
References: <cover.1505479710.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1505479710.git.markus.lehtonen@linux.intel.com>
References: <cover.1505479710.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH 5/7] scripts/oe-build-perf-report: remove dead code
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
X-List-Received-Date: Fri, 15 Sep 2017 12:55:01 -0000

Some leftover from an early prototype.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/oe-build-perf-report | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index 89d9d6f6b5..4e067caba0 100755
--- a/scripts/oe-build-perf-report
+++ b/scripts/oe-build-perf-report
@@ -336,10 +336,6 @@ def print_diff_report(metadata_l, data_l, metadata_r, data_r):
 def print_html_report(data, id_comp):
     """Print report in html format"""
     # Handle metadata
-    metadata = {'branch': {'title': 'Branch', 'value': 'master'},
-                'hostname': {'title': 'Hostname', 'value': 'foobar'},
-                'commit': {'title': 'Commit', 'value': '1234'}
-               }
     metadata = metadata_diff(data[id_comp].metadata, data[-1].metadata)
 
 
-- 
2.12.3


