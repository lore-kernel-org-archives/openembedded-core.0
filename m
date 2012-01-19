Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rnsdo-00051o-3C
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 15:07:00 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Jan 2012 05:59:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="100399938"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.198])
	by orsmga002.jf.intel.com with ESMTP; 19 Jan 2012 05:59:19 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 13:59:16 +0000
Message-Id: <3956c397e272a7744010dd71119e48679bbff2fc.1326981479.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1326981478.git.paul.eggleton@linux.intel.com>
References: <cover.1326981478.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1326981478.git.paul.eggleton@linux.intel.com>
References: <cover.1326981478.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] hdparm: remove PRIORITY
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
X-List-Received-Date: Thu, 19 Jan 2012 14:07:00 -0000

PRIORITY is no longer set in recipes in OE-Core, so remove it. (Since
"optional" is the default value from bitbake.conf, no PR bump is
necessary.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-extended/hdparm/hdparm_9.37.bb |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/hdparm/hdparm_9.37.bb b/meta/recipes-extended/hdparm/hdparm_9.37.bb
index bfc64e7..8ea6f13 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.37.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.37.bb
@@ -1,7 +1,6 @@
 DESCRIPTION = "hdparm is a Linux shell utility for viewing \
 and manipulating various IDE drive and driver parameters."
 SECTION = "console/utils"
-PRIORITY = "optional"
 LICENSE = "BSD"
 LICENSE_wiper = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=910a8a42c962d238619c75fdb78bdb24 \
-- 
1.7.5.4



