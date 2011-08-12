Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Qrut1-0000Kt-1O
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 18:47:07 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Aug 2011 09:42:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="37936629"
Received: from unknown (HELO localhost) ([10.255.14.228])
	by orsmga001.jf.intel.com with ESMTP; 12 Aug 2011 09:42:28 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2011 09:42:27 -0700
Message-Id: <ffa3108cb68e977a91414eeff183275c92800461.1313167004.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313167004.git.dvhart@linux.intel.com>
References: <cover.1313167004.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1313167004.git.dvhart@linux.intel.com>
References: <cover.1313167004.git.dvhart@linux.intel.com>
Subject: [PATCH 1/1] rt-tests: use an explicit commit ID
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Aug 2011 16:47:07 -0000

Using a tag, like v0.73, forces network access to resolve a
commit ID. Use the corresponding commit ID in the recipe.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/recipes-rt/rt-tests/rt-tests_0.73.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.73.bb b/meta/recipes-rt/rt-tests/rt-tests_0.73.bb
index 6334bcd..a2cf6be 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_0.73.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_0.73.bb
@@ -6,7 +6,8 @@ LICENSE = "GPLv2 & GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://src/cyclictest/cyclictest.c;beginline=7;endline=9;md5=ce162fe491d19d2ec67dff6dbc938d50 \
                     file://src/pi_tests/pi_stress.c;beginline=6;endline=19;md5=bd426a634a43ec612e9fbf125dfcc949"
-SRCREV = v0.73
+# Version v0.73
+SRCREV = "81da016fb0f6ab0511fbec81fc8ba1a50398a20d"
 PV = "git${SRCPV}"
 PR = "r0"
 
-- 
1.7.6



