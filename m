Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RQ1m4-0005Ho-V9
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 20:00:57 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Nov 2011 10:54:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="75377428"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.185])
	by orsmga001.jf.intel.com with ESMTP; 14 Nov 2011 10:54:30 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Nov 2011 18:54:20 +0000
Message-Id: <29992929dae092a6c5e6b3346344d5ea6ee613ba.1321296476.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1321296476.git.paul.eggleton@linux.intel.com>
References: <cover.1321296476.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1321296476.git.paul.eggleton@linux.intel.com>
References: <cover.1321296476.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/4] qemu-config: update DESCRIPTION and LICENSE
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
X-List-Received-Date: Mon, 14 Nov 2011 19:00:57 -0000

* Make the DESCRIPTION more accurate
* LICENSE is actually GPLv2 according to the COPYING.GPL file

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-bsp/qemu-config/qemu-config.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/qemu-config/qemu-config.bb b/meta/recipes-bsp/qemu-config/qemu-config.bb
index 4baf175..2fd9667 100644
--- a/meta/recipes-bsp/qemu-config/qemu-config.bb
+++ b/meta/recipes-bsp/qemu-config/qemu-config.bb
@@ -1,6 +1,6 @@
-DESCRIPTION = "Adds scripts to use distcc on the host system under qemu"
+DESCRIPTION = "Adds scripts and configuration for development on qemu images"
 
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
 
 COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemumips|qemuppc)"
-- 
1.7.5.4



