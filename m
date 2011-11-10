Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROPOJ-0005br-AP
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 08:49:43 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2011 23:43:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,488,1315206000"; d="scan'208";a="83351217"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2011 23:43:20 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 23:42:59 -0800
Message-Id: <a00f9acd76d2967443cb579bb6a934ddbc4d3b65.1320910946.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL (v2) 17/33] linux-yocto: config cleanups + romely rt support
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
X-List-Received-Date: Thu, 10 Nov 2011 07:49:44 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

Updating the meta branch SRCREV to pickup a series of BSP
cleanups and add -rt support to the romely.

  ae3e64c meta/romley: Add rt support Add rt support to the meta branch for romley.
  6c78969 meta/fishriver: enable hpet
  bc4452a meta/jasperforest: use power/intel feature
  6e9634e meta/fri2: use power/intel feature
  ec949f5 meta/fishriver: use power/intel feature

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
Signed-off-by: Kishore Bodke <kishore.k.bodke@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.0.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index 688999f..ed93fbe 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -18,7 +18,7 @@ SRCREV_machine_qemuppc ?= "16eb6506148ff163cfc4f4516110275726831014"
 SRCREV_machine_qemux86 ?= "fea3842615c13a54180b6600783b222f499002ef"
 SRCREV_machine_qemux86-64 ?= "5f86f8f0a3102e1c7d0164abefcd50d825aa468f"
 SRCREV_machine ?= "a811486d28dd9b0e1af0672a65ad9fa97873b82a"
-SRCREV_meta ?= "4095bb597a7bcd647856aa35b5fb8637ed7ff975"
+SRCREV_meta ?= "ae3e64c077972fe87f09946bd215620df68ca327"
 
 PR = "r2"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.6.4



