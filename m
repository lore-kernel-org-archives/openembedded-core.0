Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SWxfc-0000yI-OY
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 00:35:13 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 May 2012 15:25:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="147151458"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by orsmga002.jf.intel.com with ESMTP; 22 May 2012 15:25:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2012 15:25:01 -0700
Message-Id: <1337725501-18003-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] qemu: disable vnc-jpeg compression
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
X-List-Received-Date: Tue, 22 May 2012 22:35:13 -0000

This is disabled by default to ensure a deterministic build, qemu
configure would sometimes detect the libjpeg and then enable this.
Since mostly qemu is used locally disable by default.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/qemu/qemu_0.15.1.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu_0.15.1.bb b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
index bdffcf4..986fa19 100644
--- a/meta/recipes-devtools/qemu/qemu_0.15.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
@@ -3,7 +3,7 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-PR = "r6"
+PR = "r7"
 
 FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
 FILESDIR = "${WORKDIR}"
-- 
1.7.7.6



