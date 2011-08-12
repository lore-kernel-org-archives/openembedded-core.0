Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qrma6-0004dh-0O
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 09:55:02 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Aug 2011 00:50:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="37809731"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.248])
	by orsmga001.jf.intel.com with ESMTP; 12 Aug 2011 00:50:22 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2011 00:50:06 -0700
Message-Id: <37738c9649d8a17c9f99713d9cbc4a93c803f977.1313134270.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1313134270.git.sgw@linux.intel.com>
References: <cover.1313134270.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313134270.git.sgw@linux.intel.com>
References: <cover.1313134270.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 17/25] meta-rt: rt-tests v0.73 instead of AUTOREV
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
X-List-Received-Date: Fri, 12 Aug 2011 07:55:02 -0000

From: Darren Hart <dvhart@linux.intel.com>

AUTOREV is handy is a development aid, but it really shouldn't be used as a
default as it breaks the consistency and repeatability of a build. It also
causes additional fetches which may not be desired or expected.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 .../{rt-tests_git.bb => rt-tests_0.73.bb}          |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
 rename meta-rt/recipes-tests/{rt-tests_git.bb => rt-tests_0.73.bb} (97%)

diff --git a/meta-rt/recipes-tests/rt-tests_git.bb b/meta-rt/recipes-tests/rt-tests_0.73.bb
similarity index 97%
rename from meta-rt/recipes-tests/rt-tests_git.bb
rename to meta-rt/recipes-tests/rt-tests_0.73.bb
index 35af022..6334bcd 100644
--- a/meta-rt/recipes-tests/rt-tests_git.bb
+++ b/meta-rt/recipes-tests/rt-tests_0.73.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2 & GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://src/cyclictest/cyclictest.c;beginline=7;endline=9;md5=ce162fe491d19d2ec67dff6dbc938d50 \
                     file://src/pi_tests/pi_stress.c;beginline=6;endline=19;md5=bd426a634a43ec612e9fbf125dfcc949"
-SRCREV = ${AUTOREV}
+SRCREV = v0.73
 PV = "git${SRCPV}"
 PR = "r0"
 
-- 
1.7.3.4



