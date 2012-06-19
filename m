Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sh11V-00028Y-RW
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 18:11:22 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jun 2012 09:00:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="155520401"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.123])
	by orsmga001.jf.intel.com with ESMTP; 19 Jun 2012 09:00:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2012 08:59:52 -0700
Message-Id: <624828dbcc42559c273e1fb0abbbbd2856a3676c.1340121099.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
Subject: [PATCH 34/39] hdparam: Clean up FILES_* after PACKAGES reoder
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
X-List-Received-Date: Tue, 19 Jun 2012 16:11:24 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/hdparm/hdparm_9.39.bb |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/hdparm/hdparm_9.39.bb b/meta/recipes-extended/hdparm/hdparm_9.39.bb
index 42867a9..40ebd35 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.39.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.39.bb
@@ -13,7 +13,6 @@ PR = "r2"
 PACKAGES += "wiper"
 
 FILES_wiper = "${bindir}/wiper.sh"
-FILES_${PN} = "${base_sbindir} ${mandir}"
 
 RDEPENDS_wiper = "bash gawk stat"
 
-- 
1.7.7.6



