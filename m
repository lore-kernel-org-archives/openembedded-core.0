Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QTqLi-0003ik-LC
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 09:05:15 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Jun 2011 00:01:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,331,1304319600"; 
   d="scan'208";a="8299024"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.99])
	by azsmga001.ch.intel.com with ESMTP; 07 Jun 2011 00:01:54 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2011 00:01:45 -0700
Message-Id: <c5dddf2dec0c6aed1db44a7ecf14d13502759d03.1307429530.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307429530.git.sgw@linux.intel.com>
References: <cover.1307429530.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307429530.git.sgw@linux.intel.com>
References: <cover.1307429530.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 09/13] linux-yocto: make e1000e structure common [commit: bec3f1e8c]
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
X-List-Received-Date: Tue, 07 Jun 2011 07:05:15 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

During work on 1.1 BSPs, some driver options changed. The
result was that the upstream fix b1d670f10e8078485884f0cf7e384d890909aeaa
needs to be available for all BSPs.

These SRCREV updates are the result of making that commit common.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_git.bb |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_git.bb b/meta/recipes-kernel/linux/linux-yocto_git.bb
index b625cf2..1d43e1e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_git.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_git.bb
@@ -14,12 +14,12 @@ KMETA = meta
 LINUX_VERSION ?= "2.6.37"
 LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
 
-SRCREV_machine_qemuarm = "9192bec81b274a6bb71bcddcab9de5475f55ec15"
-SRCREV_machine_qemumips = "3e57c1547b07b30900bb29fdedcc38e99c237446"
-SRCREV_machine_qemuppc = "492cff27ae13c33fdab68f8d971b15dcb719e7bf"
-SRCREV_machine_qemux86 = "ae10acfb83ed405127748393d9b4efb9e95cc78b"
-SRCREV_machine_qemux86-64 = "28a3080512e19612a2e0b65d3077686f614ae556"
-SRCREV_machine = "301ab1710d29a9bb931cb64c747d03da09dfea3f"
+SRCREV_machine_qemuarm = "2070a54dbde57d2987c832a016b05949f7e6e086"
+SRCREV_machine_qemumips = "bd9eab8e382e11dc08a5de8b010570f03de949e5"
+SRCREV_machine_qemuppc = "704497b3a48c0882078f6167277d65d932292535"
+SRCREV_machine_qemux86 = "c1a74a7872fdd1152265087aa7e59b96a8f2f42a"
+SRCREV_machine_qemux86-64 = "1950ea205407d8950475a37404173572d55fd27f"
+SRCREV_machine = "697d84759be192403a8a87ab269196c67a0c2c88"
 SRCREV_meta = "f1dc3722d45cdcc92c84ebfecf4ce616d2efed26"
 
 PR = "r18"
-- 
1.7.3.4



