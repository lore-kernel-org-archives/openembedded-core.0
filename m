Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PxrzE-0006tP-6R
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Mar 2011 03:21:52 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 10 Mar 2011 18:20:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,300,1297065600"; d="scan'208";a="896098859"
Received: from unknown (HELO localhost) ([10.255.17.57])
	by fmsmga001.fm.intel.com with ESMTP; 10 Mar 2011 18:20:07 -0800
Message-Id: <3845eb8285d6b57fe2b824ce482cbeaba561eef5.1299809859.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299809859.git.sgw@linux.intel.com>
References: <cover.1299809859.git.sgw@linux.intel.com>
Old-Date: Thu, 10 Mar 2011 00:29:34 -0500
Date: Thu, 10 Mar 2011 18:20:06 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 02/12] linux-yocto: update to 2.6.37.3
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
X-List-Received-Date: Fri, 11 Mar 2011 02:21:52 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

The 2.6.37.3 -stable update is available and can safely be merged
into the linux-yocto BSPs. This updated the SRCREVs of the BSP
branches to their new values.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../conf/distro/include/poky-default-revisions.inc |   24 ++++++++++----------
 1 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/conf/distro/include/poky-default-revisions.inc b/meta/conf/distro/include/poky-default-revisions.inc
index aee1749..c08545c 100644
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
1.7.1.1



