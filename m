Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SjvaL-0000tL-Ol
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 18:59:22 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 27 Jun 2012 09:48:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="170714132"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.182])
	by fmsmga001.fm.intel.com with ESMTP; 27 Jun 2012 09:48:11 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jun 2012 09:48:11 -0700
Message-Id: <1340815691-12117-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] lsbinitiscripts: Add glib-2.0 to DEPENDS list
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
X-List-Received-Date: Wed, 27 Jun 2012 16:59:22 -0000

ppp-watch requires it.

x86_64-poky-linux-gcc    -m64 --sysroot=/intel/poky2/builds/fetch/tmp/sysroots/qemux86-64 -O2 -pipe -g -feliminate-unused-debug-types  -Wall -D_GNU_SOURCE `pkg-config glib-2.0 --cflags` -c ppp-watch.c -o ppp-watch.o
Package glib-2.0 was not found in the pkg-config search path.
Perhaps you should add the directory containing `glib-2.0.pc'
to the PKG_CONFIG_PATH environment variable
No package 'glib-2.0' found
ppp-watch.c:78:18: fatal error: glib.h: No such file or directory
compilation terminated.
make[1]: *** [ppp-watch.o] Error 1
make[1]: Leaving directory `/intel/poky2/builds/fetch/tmp/work/x86_64-poky-linux/lsbinitscripts-9.03-r0/initscripts-9.03/src'

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/lsb/lsbinitscripts_9.03.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
index dd92a92..ff11c53 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
+++ b/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "SysV init scripts which only is used in an LSB image"
 SECTION = "base"
 LICENSE = "GPLv2"
-DEPENDS = "popt"
+DEPENDS = "popt glib-2.0"
 PR = "r0"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebf4e8b49780ab187d51bd26aaa022c6"
-- 
1.7.7.6



