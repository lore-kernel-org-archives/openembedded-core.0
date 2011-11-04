Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RMO2N-0000OA-NW
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 18:58:43 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Nov 2011 10:52:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="71264381"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.98])
	by orsmga001.jf.intel.com with ESMTP; 04 Nov 2011 10:52:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Nov 2011 17:52:26 +0000
Message-Id: <43d56781e425a37a373f3285a330fccf0c35153a.1320429060.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1320429060.git.paul.eggleton@linux.intel.com>
References: <cover.1320429060.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1320429060.git.paul.eggleton@linux.intel.com>
References: <cover.1320429060.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] allarch.bbclass: disable shlib and debug symbol processing
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
X-List-Received-Date: Fri, 04 Nov 2011 17:58:43 -0000

all-arch packages should not contain any binaries that need processing,
so disable the shared library dependency processing and debug symbol
splitting/stripping to save some time during packaging.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/allarch.bbclass |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index a2f8179..18c9ae2 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -15,3 +15,8 @@ TARGET_CC_ARCH = "none"
 TARGET_LD_ARCH = "none"
 TARGET_AS_ARCH = "none"
 PACKAGE_EXTRA_ARCHS = ""
+
+# No need to do shared library processing or debug symbol handling
+EXCLUDE_FROM_SHLIBS = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+INHIBIT_PACKAGE_STRIP = "1"
-- 
1.7.5.4



