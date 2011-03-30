Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Q4yhr-0007B5-CO
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Mar 2011 18:57:19 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p2UGsiPU024272;
	Wed, 30 Mar 2011 09:54:49 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 30 Mar 2011 12:55:15 -0400
Message-Id: <8f6af7f2edf75967b5b6f43942e9d7f7d69c7fba.1301503818.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1301503818.git.bruce.ashfield@windriver.com>
References: <cover.1301503818.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1301503818.git.bruce.ashfield@windriver.com>
References: <cover.1301503818.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, poky@yoctoproject.org,
	openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-yocto: update base to 2.6.37.6
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
X-List-Received-Date: Wed, 30 Mar 2011 16:57:19 -0000

The kernel.org stable 2.6.37.6 was released, so we make it
the base of our SRCREVs.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../conf/distro/include/poky-default-revisions.inc |   26 ++++++++++----------
 1 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/conf/distro/include/poky-default-revisions.inc b/meta/conf/distro/include/poky-default-revisions.inc
index d195a9d..98db029 100644
--- a/meta/conf/distro/include/poky-default-revisions.inc
+++ b/meta/conf/distro/include/poky-default-revisions.inc
@@ -98,19 +98,19 @@ SRCREV_machine_pn-linux-yocto-stable_beagleboard ?= "ef7f944e773950d4016b7643f9e
 SRCREV_machine_pn-linux-yocto-stable ?= "72ca49ab08b8eb475cec82a10049503602325791"
 SRCREV_meta_pn-linux-yocto-stable ?= "e1f85a470934a0cf6abde5d95533e74501822c6b"
 # development SRCREVs
-SRCREV_machine_pn-linux-yocto_qemuarm ?= "e39da830a965c6b855f566932bf90b0a8f6ebbb6"
-SRCREV_machine_pn-linux-yocto_qemumips ?= "b133a26933b243326ca48003220c5f9800c6bd23"
-SRCREV_machine_pn-linux-yocto_qemuppc ?= "e4308dcc0c5ad9743e310e0ec955cc796fd7d999"
-SRCREV_machine_pn-linux-yocto_qemux86 ?= "18798c0927143f2b2d03c5e56def8f9a5afc61b8"
-SRCREV_machine_pn-linux-yocto_qemux86-64 ?= "17e49db8624324d090dd5aaa18ef977bb2dd5f6d"
-SRCREV_machine_pn-linux-yocto_emenlow ?= "3e63916230461b59750188ce5efbc76e609e9ccb"
-SRCREV_machine_pn-linux-yocto_atom-pc ?= "17e49db8624324d090dd5aaa18ef977bb2dd5f6d"
-SRCREV_machine_pn-linux-yocto_routerstationpro ?= "78214d7ac1c3103840fe69d3bbbf8a82e83ef6b2"
-SRCREV_machine_pn-linux-yocto_mpc8315e-rdb ?= "f700964852b98d6e5c7f5da24ade0256f97cd8cb"
-SRCREV_machine_pn-linux-yocto_beagleboard ?= "17e49db8624324d090dd5aaa18ef977bb2dd5f6d"
-SRCREV_machine_pn-linux-yocto ?= "2b2ef940457f0bb40e0fb76937c921c2962364ca"
-SRCREV_meta_pn-linux-yocto ?= "212cae404e57ff9dc58c808035770d51325c3512"
-SRCREV_pn-linux-libc-headers-yocto ??= "17e49db8624324d090dd5aaa18ef977bb2dd5f6d"
+SRCREV_machine_pn-linux-yocto_qemuarm ?= "e5ca41def834db9d18b28393a45d53a8d18f3d05"
+SRCREV_machine_pn-linux-yocto_qemumips ?= "9bbc8e3432406429923fab0de038af5d3e647901"
+SRCREV_machine_pn-linux-yocto_qemuppc ?= "f0ff494e62bfaa921e844c1ec7fe6cf4a977980a"
+SRCREV_machine_pn-linux-yocto_qemux86 ?= "cb0537a40dadea20f12bc10e0986fd2a70290b42"
+SRCREV_machine_pn-linux-yocto_qemux86-64 ?= "69cfbdf9f1ff461a75e5b77d6d7ba35e97db4cc3"
+SRCREV_machine_pn-linux-yocto_emenlow ?= "2215a346eb4f9e09053d00bdf61ed999ff80e029"
+SRCREV_machine_pn-linux-yocto_atom-pc ?= "69cfbdf9f1ff461a75e5b77d6d7ba35e97db4cc3"
+SRCREV_machine_pn-linux-yocto_routerstationpro ?= "8db69980d76e1f863af409e70175963f23de83ab"
+SRCREV_machine_pn-linux-yocto_mpc8315e-rdb ?= "6861d8a4d58f8aa75997f7678cc454791544507a"
+SRCREV_machine_pn-linux-yocto_beagleboard ?= "69cfbdf9f1ff461a75e5b77d6d7ba35e97db4cc3"
+SRCREV_machine_pn-linux-yocto ?= "69cfbdf9f1ff461a75e5b77d6d7ba35e97db4cc3"
+SRCREV_meta_pn-linux-yocto ?= "16cabf8ce412b5f8599f92a9e11dfd0ee6e0ad12"
+SRCREV_pn-linux-libc-headers-yocto ??= "69cfbdf9f1ff461a75e5b77d6d7ba35e97db4cc3"
 SRCREV_pn-matchbox-config-gtk ??= "3ed74dfb7c57be088a5ab36e446c0ccde9fa1028"
 SRCREV_pn-matchbox-desktop-sato ??= "76"
 SRCREV_pn-matchbox-desktop ??= "af7ed6775487380be73160aa0298bf6019765fad"
-- 
1.7.0.4



