Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1SDT8a-0006yp-PJ
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 06:08:32 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Mar 2012 20:58:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="147718324"
Received: from gzhai-xps.sh.intel.com ([10.239.36.76])
	by fmsmga002.fm.intel.com with ESMTP; 29 Mar 2012 20:58:23 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Mar 2012 11:43:10 +0800
Message-Id: <3539627b3b570087dbe19bda38ffe4e0c209b65d.1333078789.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1333078789.git.edwin.zhai@intel.com>
References: <cover.1333078789.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1333078789.git.edwin.zhai@intel.com>
References: <cover.1333078789.git.edwin.zhai@intel.com>
Subject: [PATCH 1/1] virtual/libgl: use mesa-xlib for qemuarm/qemumips/qemuppc
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
X-List-Received-Date: Fri, 30 Mar 2012 04:08:33 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Still need mesa-xlib for emulation of GLX interface on qemuarm/mips/ppc, where
mesa-dri doesn't work for pure qemu emulator.

[YOCTO #2066] fixed.

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/conf/machine/include/qemu.inc |    1 +
 meta/conf/machine/qemux86-64.conf  |    1 +
 meta/conf/machine/qemux86.conf     |    1 +
 3 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 10ab76e..4ca4753 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -1,5 +1,6 @@
 PCMCIA_MANAGER = "pcmciautils"
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-kdrive"
+PREFERRED_PROVIDER_virtual/libgl ?= "mesa-xlib"
 
 MACHINE_FEATURES = "apm alsa pcmcia bluetooth irda usbgadget screen"
 
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 73a4043..129fe9f 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -3,6 +3,7 @@
 #@DESCRIPTION: Machine configuration for running a common x86
 
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
+PREFERRED_PROVIDER_virtual/libgl ?= "mesa-dri"
 
 require conf/machine/include/tune-x86_64.inc
 require conf/machine/include/qemu.inc
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 3edfe29..246d5a0 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -3,6 +3,7 @@
 #@DESCRIPTION: Machine configuration for running a common x86
 
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
+PREFERRED_PROVIDER_virtual/libgl ?= "mesa-dri"
 
 require conf/machine/include/tune-i586.inc
 require conf/machine/include/qemu.inc
-- 
1.7.5.4



