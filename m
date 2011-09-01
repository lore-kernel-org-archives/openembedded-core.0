Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QzFhE-0004tA-78
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Sep 2011 00:25:16 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 01 Sep 2011 15:20:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="44296200"
Received: from vorpal.jf.intel.com ([10.7.199.64])
	by orsmga002.jf.intel.com with ESMTP; 01 Sep 2011 15:20:19 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Sep 2011 15:25:25 -0700
Message-Id: <572ada82123de7827679cc56e0a2dd8ae83abca3.1314915824.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1314915824.git.josh@linux.intel.com>
References: <cover.1314915824.git.josh@linux.intel.com>
Subject: [PATCH 1/1] util-linux: fix packaging of readprofile
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
X-List-Received-Date: Thu, 01 Sep 2011 22:25:16 -0000

We rename readprofile to readprofile.util-linux so we need to use that binary
name in the FILES entry for the readprofile package.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-core/util-linux/util-linux.inc       |    2 +-
 meta/recipes-core/util-linux/util-linux_2.19.1.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index b77266a..1f242b7 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -45,7 +45,7 @@ FILES_util-linux-swaponoff = "${base_sbindir}/swapon.${PN} ${sbindir}/swapoff.${
 FILES_util-linux-losetup = "${base_sbindir}/losetup.${PN}"
 FILES_util-linux-mount = "${base_bindir}/mount.${PN}"
 FILES_util-linux-umount = "${base_bindir}/umount.${PN}"
-FILES_util-linux-readprofile = "${base_sbindir}/readprofile"
+FILES_util-linux-readprofile = "${base_sbindir}/readprofile.${PN}"
 FILES_util-linux-uuidgen = "${bindir}/uuidgen"
 
 FILES_util-linux-libblkid = "${libdir}/libblkid.so.*"
diff --git a/meta/recipes-core/util-linux/util-linux_2.19.1.bb b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
index 2ef95e6..d6d6f9b 100644
--- a/meta/recipes-core/util-linux/util-linux_2.19.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.19"
-PR = "r3"
+PR = "r4"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
-- 
1.7.6



