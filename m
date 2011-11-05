Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RMk3f-00065L-V2
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Nov 2011 18:29:33 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Nov 2011 10:23:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,461,1315206000"; d="scan'208";a="33625140"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.12])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Nov 2011 10:23:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Nov 2011 10:22:55 -0700
Message-Id: <b035537d38893dbcc8104fc440d191069d8872a1.1320513631.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320513631.git.sgw@linux.intel.com>
References: <cover.1320513631.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320513631.git.sgw@linux.intel.com>
References: <cover.1320513631.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 25/28] allarch.bbclass: disable shlib and debug symbol processing
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
X-List-Received-Date: Sat, 05 Nov 2011 17:29:34 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

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
1.7.6.4



