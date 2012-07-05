Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SmpmF-0002vC-7B
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 19:23:39 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Jul 2012 10:12:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="161778216"
Received: from miles.jf.intel.com (HELO localhost) ([10.7.199.51])
	by orsmga001.jf.intel.com with ESMTP; 05 Jul 2012 10:12:25 -0700
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jul 2012 10:12:21 -0700
Message-Id: <8c678cc7968d430dc7321af761d429f4d6ed4277.1341508255.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1341508255.git.scott.a.garman@intel.com>
References: <cover.1341508255.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1341508255.git.scott.a.garman@intel.com>
References: <cover.1341508255.git.scott.a.garman@intel.com>
Subject: [PATCH 2/2] runqemu: fix usage() help for MACHINE setting
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
X-List-Received-Date: Thu, 05 Jul 2012 17:23:39 -0000

Partial fix for [YOCTO #2611]

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 scripts/runqemu |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 84674e2..8d149a2 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -25,7 +25,7 @@ usage() {
     echo "  QEMUARCH - the qemu machine architecture to use"
     echo "  KERNEL - the kernel image file to use"
     echo "  ROOTFS - the rootfs image file or nfsroot directory to use"
-    echo "  MACHINE=xyz - the machine name (optional, autodetected from KERNEL filename if unspecified)"
+    echo "  MACHINE - the machine name (optional, autodetected from KERNEL filename if unspecified)"
     echo "  Simplified QEMU command-line options can be passed with:"
     echo "    nographic - disables video console"
     echo "    serial - enables a serial console on /dev/ttyS0"
-- 
1.7.9.5



