Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Q2pMl-0008Mj-Ra
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Mar 2011 19:34:40 +0100
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p2OIWi3O016762;
	Thu, 24 Mar 2011 11:32:45 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: rpurdie@linux.intel.com
Date: Thu, 24 Mar 2011 14:37:59 -0400
Message-Id: <e12d3fb1977655683d926e49332f52cdbd33217f.1300991725.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1300991725.git.bruce.ashfield@windriver.com>
References: <cover.1300991725.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1300991725.git.bruce.ashfield@windriver.com>
References: <cover.1300991725.git.bruce.ashfield@windriver.com>
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] linux-yocto: update to 2.6.37.5
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
X-List-Received-Date: Thu, 24 Mar 2011 18:34:40 -0000

The 2.6.37.5 -stable update is available, so it now becomes
the new base for linux-yocto.

All qemu targets have been built and booted.

Changelog is available via:

   git log --pretty=oneline --abbrev-commit v2.6.37.3..v2.6.37.5

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../conf/distro/include/poky-default-revisions.inc |   24 ++++++++++----------
 1 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/conf/distro/include/poky-default-revisions.inc b/meta/conf/distro/include/poky-default-revisions.inc
index 707e725..6ec74ba 100644
--- a/meta/conf/distro/include/poky-default-revisions.inc
+++ b/meta/conf/distro/include/poky-default-revisions.inc
@@ -98,19 +98,19 @@ SRCREV_machine_pn-linux-yocto-stable_beagleboard ?= "ef7f944e773950d4016b7643f9e
 SRCREV_machine_pn-linux-yocto-stable ?= "72ca49ab08b8eb475cec82a10049503602325791"
 SRCREV_meta_pn-linux-yocto-stable ?= "e1f85a470934a0cf6abde5d95533e74501822c6b"
 # development SRCREVs
-SRCREV_machine_pn-linux-yocto_qemuarm ?= "233213a1e09eae3de7047ff406b156608788ec17"
-SRCREV_machine_pn-linux-yocto_qemumips ?= "54bb956f70349923af29f28a4f9471f5658e1787"
-SRCREV_machine_pn-linux-yocto_qemuppc ?= "6f21e2e83dc93e108183256f3efebb63a6a11b6d"
-SRCREV_machine_pn-linux-yocto_qemux86 ?= "c75cbd202d8abb0b5f316f934f5d33c17ff6d3c3"
-SRCREV_machine_pn-linux-yocto_qemux86-64 ?= "2b2ef940457f0bb40e0fb76937c921c2962364ca"
-SRCREV_machine_pn-linux-yocto_emenlow ?= "f296e59556bdd738eaea8e34606f068dddb8610f"
-SRCREV_machine_pn-linux-yocto_atom-pc ?= "2b2ef940457f0bb40e0fb76937c921c2962364ca"
-SRCREV_machine_pn-linux-yocto_routerstationpro ?= "530ca3030e15a5d829e804a58e4e449db82f9b4a"
-SRCREV_machine_pn-linux-yocto_mpc8315e-rdb ?= "e14870b99caa29b6e9d98a3e7d5337b0c63cc264"
-SRCREV_machine_pn-linux-yocto_beagleboard ?= "2b2ef940457f0bb40e0fb76937c921c2962364ca"
+SRCREV_machine_pn-linux-yocto_qemuarm ?= "e39da830a965c6b855f566932bf90b0a8f6ebbb6"
+SRCREV_machine_pn-linux-yocto_qemumips ?= "b133a26933b243326ca48003220c5f9800c6bd23"
+SRCREV_machine_pn-linux-yocto_qemuppc ?= "e4308dcc0c5ad9743e310e0ec955cc796fd7d999"
+SRCREV_machine_pn-linux-yocto_qemux86 ?= "18798c0927143f2b2d03c5e56def8f9a5afc61b8"
+SRCREV_machine_pn-linux-yocto_qemux86-64 ?= "17e49db8624324d090dd5aaa18ef977bb2dd5f6d"
+SRCREV_machine_pn-linux-yocto_emenlow ?= "3e63916230461b59750188ce5efbc76e609e9ccb"
+SRCREV_machine_pn-linux-yocto_atom-pc ?= "17e49db8624324d090dd5aaa18ef977bb2dd5f6d"
+SRCREV_machine_pn-linux-yocto_routerstationpro ?= "78214d7ac1c3103840fe69d3bbbf8a82e83ef6b2"
+SRCREV_machine_pn-linux-yocto_mpc8315e-rdb ?= "f700964852b98d6e5c7f5da24ade0256f97cd8cb"
+SRCREV_machine_pn-linux-yocto_beagleboard ?= "17e49db8624324d090dd5aaa18ef977bb2dd5f6d"
 SRCREV_machine_pn-linux-yocto ?= "2b2ef940457f0bb40e0fb76937c921c2962364ca"
-SRCREV_meta_pn-linux-yocto ?= "212cae404e57ff9dc58c808035770d51325c3512"
-SRCREV_pn-linux-libc-headers-yocto ??= "2b2ef940457f0bb40e0fb76937c921c2962364ca"
+SRCREV_meta_pn-linux-yocto ?= "17e49db8624324d090dd5aaa18ef977bb2dd5f6d"
+SRCREV_pn-linux-libc-headers-yocto ??= "17e49db8624324d090dd5aaa18ef977bb2dd5f6d"
 SRCREV_pn-matchbox-config-gtk ??= "3ed74dfb7c57be088a5ab36e446c0ccde9fa1028"
 SRCREV_pn-matchbox-desktop-sato ??= "76"
 SRCREV_pn-matchbox-desktop ??= "af7ed6775487380be73160aa0298bf6019765fad"
-- 
1.7.0.4



