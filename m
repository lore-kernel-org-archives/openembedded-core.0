Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6585471CBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 11:18:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 May 2017 04:18:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,344,1491289200"; d="scan'208";a="86877669"
Received: from bkearns-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.10.90])
	by orsmga002.jf.intel.com with ESMTP; 15 May 2017 04:18:49 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 May 2017 14:18:42 +0300
Message-Id: <f0703232966797413ce3382aece3b4d02bc143d4.1494846894.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1494846894.git.markus.lehtonen@linux.intel.com>
References: <cover.1494846894.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1494846894.git.markus.lehtonen@linux.intel.com>
References: <cover.1494846894.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/5] oe-build-perf-report: use correct x-axis max value in html charts
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
X-List-Received-Date: Mon, 15 May 2017 11:18:48 -0000

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/oe-build-perf-report | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index ced5ff2e12..fc32fbe39a 100755
--- a/scripts/oe-build-perf-report
+++ b/scripts/oe-build-perf-report
@@ -370,7 +370,7 @@ def print_html_report(data, id_comp):
 
     # Chart options
     chart_opts = {'haxis': {'min': get_data_item(data[0][0], 'layers.meta.commit_count'),
-                            'max': get_data_item(data[0][0], 'layers.meta.commit_count')}
+                            'max': get_data_item(data[-1][0], 'layers.meta.commit_count')}
                  }
 
     print(html.template.render(metadata=metadata, test_data=tests, chart_opts=chart_opts))
-- 
2.12.0


