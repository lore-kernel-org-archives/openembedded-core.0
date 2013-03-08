Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1UDlay-0002nM-Kv
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Mar 2013 01:55:38 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 07 Mar 2013 16:39:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,804,1355126400"; d="scan'208";a="301335950"
Received: from unknown (HELO localhost) ([10.255.13.90])
	by fmsmga002.fm.intel.com with ESMTP; 07 Mar 2013 16:39:02 -0800
From: tom.zanussi@linux.intel.com
To: openembedded-core@lists.openembedded.org, bruce.ashfield@windriver.com,
	dvhart@linux.intel.com
Date: Thu,  7 Mar 2013 18:39:00 -0600
Message-Id: <4293cea264609a122b9cc05831fe598fcb3ff677.1362702690.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <cover.1362702690.git.tom.zanussi@linux.intel.com>
References: <cover.1362702690.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 1/2] perf: rename perf.inc to perf-features.inc
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
X-List-Received-Date: Fri, 08 Mar 2013 00:55:45 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

The contents of perf.inc are really specific to perf features and
shouldn't use the generic perf.inc name, which implies common recipe
code.  It's always confusing to open up this file and find out that's
not what it is.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 meta/recipes-kernel/perf/{perf.inc => perf-features.inc} | 0
 meta/recipes-kernel/perf/perf_3.4.bb                     | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/perf/{perf.inc => perf-features.inc} (100%)

diff --git a/meta/recipes-kernel/perf/perf.inc b/meta/recipes-kernel/perf/perf-features.inc
similarity index 100%
rename from meta/recipes-kernel/perf/perf.inc
rename to meta/recipes-kernel/perf/perf-features.inc
diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
index 22feb46..3c49922 100644
--- a/meta/recipes-kernel/perf/perf_3.4.bb
+++ b/meta/recipes-kernel/perf/perf_3.4.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
 PR = "r8"
 
-require perf.inc
+require perf-features.inc
 
 BUILDPERF_libc-uclibc = "no"
 
-- 
1.7.11.4



