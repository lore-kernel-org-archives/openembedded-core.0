Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1UAil1-0005OI-6D
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 16:18:15 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Feb 2013 06:59:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,747,1355126400"; d="scan'208";a="291302276"
Received: from unknown (HELO localhost) ([10.255.12.236])
	by orsmga002.jf.intel.com with ESMTP; 27 Feb 2013 07:00:56 -0800
From: tom.zanussi@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2013 09:00:51 -0600
Message-Id: <9f91a3a29701218dd756380ebcd2a1a32ad40615.1361976853.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <4a4c5cf843e4c4ff22843b8e6097786e88a06bd1.1361976853.git.tom.zanussi@linux.intel.com>
References: <4a4c5cf843e4c4ff22843b8e6097786e88a06bd1.1361976853.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1361976853.git.tom.zanussi@linux.intel.com>
References: <cover.1361976853.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 3/3] perf: enable perf-trace feature
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Feb 2013 15:18:17 -0000
X-List-Received-Date: Wed, 27 Feb 2013 15:18:17 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

Add an entry enabling the new perf-trace perf subcommand.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 meta/recipes-kernel/perf/perf.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.inc b/meta/recipes-kernel/perf/perf.inc
index b8859ab..05aadf6 100644
--- a/meta/recipes-kernel/perf/perf.inc
+++ b/meta/recipes-kernel/perf/perf.inc
@@ -1,4 +1,4 @@
-PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui"
+PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui perf-trace"
 
 def perf_feature_enabled(feature, trueval, falseval, d):
     """
@@ -14,6 +14,7 @@ def perf_feature_enabled(feature, trueval, falseval, d):
     Available perf features:
       perf-scripting: enable support for Perl and Python bindings
       perf-tui: enable support for the perf TUI (via libnewt)
+      perf-trace: enable support for 'perf trace'
 
     """
     enabled_features = d.getVar("PERF_FEATURES_ENABLE", True) or ""
-- 
1.7.11.4



