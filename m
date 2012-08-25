Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1T5PU9-00031B-77
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Aug 2012 01:09:47 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Aug 2012 15:57:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,313,1344236400"; d="scan'208";a="213973574"
Received: from unknown (HELO localhost) ([10.255.13.23])
	by fmsmga002.fm.intel.com with ESMTP; 25 Aug 2012 15:57:26 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Sat, 25 Aug 2012 17:57:22 -0500
Message-Id: <dc1953f169a835ec6b1dd04c78d61900f0fb53d5.1345935181.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1345935181.git.tom.zanussi@intel.com>
References: <cover.1345935181.git.tom.zanussi@intel.com>
Subject: [PATCH 1/1] perf: add bison and flex to DEPENDS
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
X-List-Received-Date: Sat, 25 Aug 2012 23:09:47 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

perf depends on bison and flex for event parsing - add them as
dependencies.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-kernel/perf/perf_3.4.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
index 5fb38e6..decc911 100644
--- a/meta/recipes-kernel/perf/perf_3.4.bb
+++ b/meta/recipes-kernel/perf/perf_3.4.bb
@@ -9,7 +9,7 @@ as well."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
-PR = "r4"
+PR = "r5"
 
 require perf.inc
 
@@ -24,6 +24,7 @@ DEPENDS = "virtual/kernel \
            ${MLPREFIX}binutils \
            ${TUI_DEPENDS} \
            ${SCRIPTING_DEPENDS} \
+           bison flex \
           "
 
 SCRIPTING_RDEPENDS = "${@perf_feature_enabled('perf-scripting', 'perl perl-modules python', '',d)}"
-- 
1.7.4.1



