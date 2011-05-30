Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QR6XG-0005NC-U9
	for openembedded-core@lists.openembedded.org;
	Mon, 30 May 2011 19:45:51 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p4UHg8W3022792;
	Mon, 30 May 2011 10:42:09 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 30 May 2011 13:41:18 -0400
Message-Id: <10551f906f430cf3500b7bd04727537304b39d36.1306777062.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1306777062.git.bruce.ashfield@windriver.com>
References: <cover.1306777062.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1306777062.git.bruce.ashfield@windriver.com>
References: <cover.1306777062.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/1] linux-yocto: update meta SRCREV
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
X-List-Received-Date: Mon, 30 May 2011 17:45:51 -0000

Fixes [YOCTO: 1111]

and updates the meta branch with some cleanups and feature
groupings.

From the meta branch itself:

   06d3793 meta: add romley features
   f101ab9 meta: remove 'not set' lines from netfilter.cfg
   d0599f8 meta: add dca feature
   0cd5ef1 meta: replace open-coded E1XXXX options with intel-e1xxxx feature
   3f88c17 meta: add intel-e1xxxx feature
   f7537af meta: replace open-coded igb options with igb feature
   f72e046 meta: add igb feature
   989cd7d meta: add ixgbe feature
   8543f7d meta: replace open-coded dma engine options with dmaengine feature
   8fc67cd meta: add dmaengine feature
   610e419 meta: add hugetlb feature
   ac22176 meta: add uio feature
   ce14a0d meta: replace open-coded hpet options with hpet feature
   6a30aaa meta: add hpet feature
   0ae7362 routerstationpro: watchdog config

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_git.bb b/meta/recipes-kernel/linux/linux-yocto_git.bb
index 5c3c448..3aedb7a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_git.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_git.bb
@@ -20,7 +20,7 @@ SRCREV_machine_qemuppc = "d9c6b3e576184f0c4223b6251c57b16ac1bac428"
 SRCREV_machine_qemux86 = "b2afed7ecd54918b73db7f30062aaaf02fdaba54"
 SRCREV_machine_qemux86-64 = "86bbbc079652d87392322fbfc14f6bd8792b0f38"
 SRCREV_machine = "0974631b821b70aee3613723ed0d4d6ba8da91c6"
-SRCREV_meta = "79669230fd82a3e7e254cf8b596a2388a4333e62"
+SRCREV_meta = "06d3793d459048ee1b4db7170f24670c479e8b29"
 
 PR = "r18"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.0.4



