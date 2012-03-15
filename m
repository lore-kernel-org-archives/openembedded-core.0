Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S8BkI-0005uO-Gn
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 15:33:38 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 15 Mar 2012 07:24:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="77933630"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.170])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Mar 2012 07:24:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2012 14:24:43 +0000
Message-Id: <d819a95a1d3678ebfc5cd1fbf9dc60ad1a1e8351.1331821447.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331821447.git.paul.eggleton@linux.intel.com>
References: <cover.1331821447.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1331821447.git.paul.eggleton@linux.intel.com>
References: <cover.1331821447.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] util-linux: restore zlib and ncurses dependencies for native
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
X-List-Received-Date: Thu, 15 Mar 2012 14:33:38 -0000

OE-Core commit 4a158b6ef125b555225472eefbe1ea226dc47c2c unintentionally
removed the dependencies for util-linux-native on zlib-native and
ncurses-native by getting append and virtclass-native overrides swapped
around; later this was tidied up to remove the append (which did not change
anything functionally). These libraries are required, so add them back in.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/util-linux/util-linux.inc     |    2 +-
 meta/recipes-core/util-linux/util-linux_2.21.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index e2d354f..024b55c 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=9c920d811858a74b67a36ba23cbaa95f
 
 inherit autotools gettext pkgconfig
 DEPENDS = "zlib ncurses"
-DEPENDS_virtclass-native = " lzo-native"
+DEPENDS_append_virtclass-native = " lzo-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-linux-${PV}.tar.bz2 \
            file://MCONFIG \
diff --git a/meta/recipes-core/util-linux/util-linux_2.21.bb b/meta/recipes-core/util-linux/util-linux_2.21.bb
index d899dd3..ab26fcd 100644
--- a/meta/recipes-core/util-linux/util-linux_2.21.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.21.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.21"
-PR = "r4"
+PR = "r5"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
-- 
1.7.5.4



