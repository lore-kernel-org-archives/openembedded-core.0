Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROmhP-0000N8-LH
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 09:42:59 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Nov 2011 00:36:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,494,1315206000"; d="scan'208";a="89010339"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.157])
	by fmsmga002.fm.intel.com with ESMTP; 11 Nov 2011 00:36:36 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Nov 2011 00:36:29 -0800
Message-Id: <a7e70227bac72c4f7d3419f94f6915da4c7e3f43.1321000451.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1321000451.git.sgw@linux.intel.com>
References: <cover.1321000451.git.sgw@linux.intel.com>
In-Reply-To: <cover.1321000451.git.sgw@linux.intel.com>
References: <cover.1321000451.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 3/9] rootfs_rpm.bbclass: Turn off script debugging
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
X-List-Received-Date: Fri, 11 Nov 2011 08:43:00 -0000

From: Mark Hatle <mark.hatle@windriver.com>

Disable script debugging, as the log files become huge and take a
long time to process during the log check step.  This results in a
performance improvement.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/rootfs_rpm.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index b3875a4..6973008 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -44,7 +44,7 @@ RPM="rpm ${RPMOPTS}"
 do_rootfs[lockfiles] += "${DEPLOY_DIR_RPM}/rpm.lock"
 
 fakeroot rootfs_rpm_do_rootfs () {
-	#set +x
+	set +x
 
 	${RPM_PREPROCESS_COMMANDS}
 
-- 
1.7.6.4



