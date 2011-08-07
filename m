Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QpvYl-0008Um-Oe
	for openembedded-core@lists.openembedded.org;
	Sun, 07 Aug 2011 07:05:59 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Aug 2011 22:01:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,331,1309762800"; d="scan'208";a="36580341"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.173])
	by fmsmga002.fm.intel.com with ESMTP; 06 Aug 2011 22:01:20 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  6 Aug 2011 22:01:13 -0700
Message-Id: <348d2fd0e13acdd914c5685b3e99794abbe16373.1312692935.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312692935.git.sgw@linux.intel.com>
References: <cover.1312692935.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312692935.git.sgw@linux.intel.com>
References: <cover.1312692935.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL (Updated) 11/15] linux-yocto: pass KMACHINE to updateme, not MACHINE
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
X-List-Received-Date: Sun, 07 Aug 2011 05:06:00 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

To support the mapping of any oe/yocto MACHINE to a kernel
branch that may not share that naming structure we have
KMACHINE and KBRANCH. To allow the mapping to work, we
actually have to pass KMACHINE into updateme and not MACHINE.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index a374df1..5e7003b 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -28,7 +28,7 @@ do_patch() {
 			addon_features="$addon_features --feature $feat"
 		done
 	fi
-	updateme --branch ${kbranch} ${addon_features} ${ARCH} ${MACHINE} ${WORKDIR}
+	updateme --branch ${kbranch} ${addon_features} ${ARCH} ${KMACHINE} ${WORKDIR}
 	if [ $? -ne 0 ]; then
 		echo "ERROR. Could not update ${kbranch}"
 		exit 1
-- 
1.7.3.4



