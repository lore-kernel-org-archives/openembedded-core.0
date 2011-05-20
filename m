Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QNJqs-00084W-TY
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 09:10:27 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 May 2011 00:07:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,241,1304319600"; d="scan'208";a="439578086"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.39])
	by azsmga001.ch.intel.com with ESMTP; 20 May 2011 00:07:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 May 2011 00:07:02 -0700
Message-Id: <bb2fc5b338d60ad92e70354cfc2e3654bbb2a90b.1305874831.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1305874831.git.sgw@linux.intel.com>
References: <cover.1305874831.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305874831.git.sgw@linux.intel.com>
References: <cover.1305874831.git.sgw@linux.intel.com>
Subject: [PATCH 12/12] u-boot: fix LIC_FILE_CHKSUM
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
X-List-Received-Date: Fri, 20 May 2011 07:10:27 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-bsp/uboot/u-boot_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-bsp/uboot/u-boot_git.bb b/meta/recipes-bsp/uboot/u-boot_git.bb
index 4c8f5df..bd619ed 100644
--- a/meta/recipes-bsp/uboot/u-boot_git.bb
+++ b/meta/recipes-bsp/uboot/u-boot_git.bb
@@ -1,7 +1,7 @@
 require u-boot.inc
 
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
+LIC_FILES_CHKSUM = "file://COPYING;md5=4c6cde5df68eff615d36789dc18edd3b \
                     file://README;beginline=1;endline=22;md5=3a00ef51d3fc96e9d6c1bc4708ccd3b5"
 
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/u-boot-git/${MACHINE}"
-- 
1.7.3.4



