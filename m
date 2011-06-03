Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QSX8N-0005ax-Ph
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 18:22:04 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p53GIDwZ017405;
	Fri, 3 Jun 2011 09:18:16 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri,  3 Jun 2011 12:17:10 -0400
Message-Id: <b8fc7bf2a884f722ac15d781d5f8f844544f39d1.1307117523.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1307117523.git.bruce.ashfield@windriver.com>
References: <cover.1307117523.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1307117523.git.bruce.ashfield@windriver.com>
References: <cover.1307117523.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 1/1] linux-yocto: update target/meta SRCREVs
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
X-List-Received-Date: Fri, 03 Jun 2011 16:22:04 -0000

This SRCREV update picks up the following changes from the
2.6.37 kernel tree:

  - fishriver: create and use a dedicated BSP branch
  - fishriver: usbnet fixes, but common to all boards
  - standard:  update omap baseline match the 2.6.34
               upstream merge content

Built and boot tested on qemu*

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_git.bb |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_git.bb b/meta/recipes-kernel/linux/linux-yocto_git.bb
index 3aedb7a..b625cf2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_git.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_git.bb
@@ -14,13 +14,13 @@ KMETA = meta
 LINUX_VERSION ?= "2.6.37"
 LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
 
-SRCREV_machine_qemuarm = "8776b242fe2db7b4570e11496e9105b51212a446"
-SRCREV_machine_qemumips = "8f8a5e034d7e98ed871fa7ed487fbf72a79229a5"
-SRCREV_machine_qemuppc = "d9c6b3e576184f0c4223b6251c57b16ac1bac428"
-SRCREV_machine_qemux86 = "b2afed7ecd54918b73db7f30062aaaf02fdaba54"
-SRCREV_machine_qemux86-64 = "86bbbc079652d87392322fbfc14f6bd8792b0f38"
-SRCREV_machine = "0974631b821b70aee3613723ed0d4d6ba8da91c6"
-SRCREV_meta = "06d3793d459048ee1b4db7170f24670c479e8b29"
+SRCREV_machine_qemuarm = "9192bec81b274a6bb71bcddcab9de5475f55ec15"
+SRCREV_machine_qemumips = "3e57c1547b07b30900bb29fdedcc38e99c237446"
+SRCREV_machine_qemuppc = "492cff27ae13c33fdab68f8d971b15dcb719e7bf"
+SRCREV_machine_qemux86 = "ae10acfb83ed405127748393d9b4efb9e95cc78b"
+SRCREV_machine_qemux86-64 = "28a3080512e19612a2e0b65d3077686f614ae556"
+SRCREV_machine = "301ab1710d29a9bb931cb64c747d03da09dfea3f"
+SRCREV_meta = "f1dc3722d45cdcc92c84ebfecf4ce616d2efed26"
 
 PR = "r18"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.0.4



