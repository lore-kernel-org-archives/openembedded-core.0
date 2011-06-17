Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QXQuX-0000WA-Mu
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2011 06:44:02 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5H4eRcw014825;
	Thu, 16 Jun 2011 21:40:29 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 17 Jun 2011 00:38:38 -0400
Message-Id: <83cba8781d4d76f0321bd4bf7a1d88479b7f003f.1308285199.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1308285199.git.bruce.ashfield@windriver.com>
References: <cover.1308285199.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1308285199.git.bruce.ashfield@windriver.com>
References: <cover.1308285199.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/2] linux-yocto: update SRCREVs for utrace merge
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
X-List-Received-Date: Fri, 17 Jun 2011 04:44:02 -0000

Updating the SRCREVs to account for the merge of utrace to support
systemtap.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_2.6.37.bb |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb b/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
index f6abc9e..2ee801e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
@@ -14,13 +14,13 @@ KMETA = meta
 LINUX_VERSION ?= "2.6.37"
 LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
 
-SRCREV_machine_qemuarm = "2070a54dbde57d2987c832a016b05949f7e6e086"
-SRCREV_machine_qemumips = "bd9eab8e382e11dc08a5de8b010570f03de949e5"
-SRCREV_machine_qemuppc = "704497b3a48c0882078f6167277d65d932292535"
-SRCREV_machine_qemux86 = "c1a74a7872fdd1152265087aa7e59b96a8f2f42a"
-SRCREV_machine_qemux86-64 = "1950ea205407d8950475a37404173572d55fd27f"
-SRCREV_machine = "697d84759be192403a8a87ab269196c67a0c2c88"
-SRCREV_meta = "46a1be20b01e50d5d0646e5622e9dd06433238c2"
+SRCREV_machine_qemuarm = "52424d35025cfa43f0d66cf6fa982a5c289a1ba4"
+SRCREV_machine_qemumips = "9083f18f40fc6a2baf76fa001bc4858e02f40378"
+SRCREV_machine_qemuppc = "9d278962ff228ea9627a85b0d21ed717246ebf1f"
+SRCREV_machine_qemux86 = "57545699dff0b384bb16be74b0358059da5cce6a"
+SRCREV_machine_qemux86-64 = "5d36c23eecdc9663c9c3a2a511d4872d3b3fd669"
+SRCREV_machine = "12646d158aced2ba0122787bd56ff554e371091c"
+SRCREV_meta = "8888d948e0ddbc5f37bd3dc23cc1b398ab230e2e"
 
 PR = "r18"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.0.4



