Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXKY0-0004SO-3M
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 01:00:52 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 23 May 2012 15:50:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="103525798"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by AZSMGA002.ch.intel.com with ESMTP; 23 May 2012 15:50:37 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 15:46:14 -0700
Message-Id: <0d668482e909fcaa44d08ec9fcee59c5f219af5f.1337805812.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337805812.git.sgw@linux.intel.com>
References: <cover.1337805812.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337805812.git.sgw@linux.intel.com>
References: <cover.1337805812.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 3/5] qemu.inc: Remove mesa-xlib as PREFERRED_PROVIDER
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
X-List-Received-Date: Wed, 23 May 2012 23:00:52 -0000

The xserver-xorg uses and depends on mesa-dri, so we should
use the default PREFERRED_PROVIDER of libgl as mesa-dri.

This resolves the following:
ERROR: Multiple .bb files are due to be built which each provide virtual/libgl (/intel/poky/distro/meta/recipes-graphics/mesa/mesa-dri_7.11.bb /intel/poky/distro/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb).
 This usually means one provides something the other doesn't and should.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/machine/include/qemu.inc |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index e384879..5d59a7f 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -1,6 +1,5 @@
 PCMCIA_MANAGER = "pcmciautils"
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
-PREFERRED_PROVIDER_virtual/libgl ?= "mesa-xlib"
 
 XSERVER ?= "xserver-xorg \
             mesa-dri-driver-swrast \
-- 
1.7.7.6



