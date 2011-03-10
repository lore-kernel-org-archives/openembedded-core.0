Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1PxkFS-0002K5-Id
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Mar 2011 19:06:07 +0100
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p2AHJB5k011728;
	Thu, 10 Mar 2011 09:19:13 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: rpurdie@linux.intel.com
Date: Thu, 10 Mar 2011 12:20:43 -0500
Message-Id: <d4c0401dde8ef4868fb605096aa2f8f121dc9165.1299776754.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1299776753.git.bruce.ashfield@windriver.com>
References: <cover.1299776753.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1299776753.git.bruce.ashfield@windriver.com>
References: <cover.1299776753.git.bruce.ashfield@windriver.com>
X-Mailman-Approved-At: Thu, 10 Mar 2011 19:06:11 +0100
Cc: openembedded-core@lists.openembedded.org, poky@yoctoproject.org,
	saul.wold@intel.com
Subject: [PATCH 1/1] linux-yocto: update to 2.6.37.3
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
X-List-Received-Date: Thu, 10 Mar 2011 18:06:07 -0000

The 2.6.37.3 -stable update is available and can safely be merged
into the linux-yocto BSPs. This updated the SRCREVs of the BSP
branches to their new values.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../conf/distro/include/poky-default-revisions.inc |   24 ++++++++++----------
 1 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/conf/distro/include/poky-default-revisions.inc b/meta/conf/distro/include/poky-default-revisions.inc
index 36202a1..a1b0b77 100644
--- a/meta/conf/distro/include/poky-default-revisions.inc
+++ b/meta/conf/distro/include/poky-default-revisions.inc
@@ -98,19 +98,19 @@ SRCREV_machine_pn-linux-yocto-stable_beagleboard ?= "ef7f944e773950d4016b7643f9e
 SRCREV_machine_pn-linux-yocto-stable ?= "72ca49ab08b8eb475cec82a10049503602325791"
 SRCREV_meta_pn-linux-yocto-stable ?= "e1f85a470934a0cf6abde5d95533e74501822c6b"
 # development SRCREVs
-SRCREV_machine_pn-linux-yocto_qemuarm ?= "dd15f43fe3d4820ce112501c1a790c9bc12cfd0b"
-SRCREV_machine_pn-linux-yocto_qemumips ?= "76f30ca447fd0f06e76d0cb4935b016a1440e23e"
-SRCREV_machine_pn-linux-yocto_qemuppc ?= "b318cc6df4a439dc2b547f8eb841ff1ede69419b"
-SRCREV_machine_pn-linux-yocto_qemux86 ?= "37e8651b5df243aca2388867212c06338159df4e"
-SRCREV_machine_pn-linux-yocto_qemux86-64 ?= "2b412826bbeb4a16abe2ea74f2456ab880c6e3c1"
-SRCREV_machine_pn-linux-yocto_emenlow ?= "db6fc8c0d3d7f3e474e6c6b95138123911311942"
-SRCREV_machine_pn-linux-yocto_atom-pc ?= "2b412826bbeb4a16abe2ea74f2456ab880c6e3c1"
-SRCREV_machine_pn-linux-yocto_routerstationpro ?= "17dedeb17887eb398743b04615302b61bd95ffdd"
-SRCREV_machine_pn-linux-yocto_mpc8315e-rdb ?= "6117f19403ccd5c288ce553def432925296a28b7"
-SRCREV_machine_pn-linux-yocto_beagleboard ?= "2b412826bbeb4a16abe2ea74f2456ab880c6e3c1"
-SRCREV_machine_pn-linux-yocto ?= "2b412826bbeb4a16abe2ea74f2456ab880c6e3c1"
+SRCREV_machine_pn-linux-yocto_qemuarm ?= "233213a1e09eae3de7047ff406b156608788ec17"
+SRCREV_machine_pn-linux-yocto_qemumips ?= "54bb956f70349923af29f28a4f9471f5658e1787"
+SRCREV_machine_pn-linux-yocto_qemuppc ?= "6f21e2e83dc93e108183256f3efebb63a6a11b6d"
+SRCREV_machine_pn-linux-yocto_qemux86 ?= "c75cbd202d8abb0b5f316f934f5d33c17ff6d3c3"
+SRCREV_machine_pn-linux-yocto_qemux86-64 ?= "2b2ef940457f0bb40e0fb76937c921c2962364ca"
+SRCREV_machine_pn-linux-yocto_emenlow ?= "f296e59556bdd738eaea8e34606f068dddb8610f"
+SRCREV_machine_pn-linux-yocto_atom-pc ?= "2b2ef940457f0bb40e0fb76937c921c2962364ca"
+SRCREV_machine_pn-linux-yocto_routerstationpro ?= "530ca3030e15a5d829e804a58e4e449db82f9b4a"
+SRCREV_machine_pn-linux-yocto_mpc8315e-rdb ?= "e14870b99caa29b6e9d98a3e7d5337b0c63cc264"
+SRCREV_machine_pn-linux-yocto_beagleboard ?= "2b2ef940457f0bb40e0fb76937c921c2962364ca"
+SRCREV_machine_pn-linux-yocto ?= "2b2ef940457f0bb40e0fb76937c921c2962364ca"
 SRCREV_meta_pn-linux-yocto ?= "212cae404e57ff9dc58c808035770d51325c3512"
-SRCREV_pn-linux-libc-headers-yocto ??= "2b412826bbeb4a16abe2ea74f2456ab880c6e3c1"
+SRCREV_pn-linux-libc-headers-yocto ??= "2b2ef940457f0bb40e0fb76937c921c2962364ca"
 SRCREV_pn-matchbox-config-gtk ??= "3ed74dfb7c57be088a5ab36e446c0ccde9fa1028"
 SRCREV_pn-matchbox-desktop-sato ??= "76"
 SRCREV_pn-matchbox-desktop ??= "af7ed6775487380be73160aa0298bf6019765fad"
-- 
1.7.0.4



