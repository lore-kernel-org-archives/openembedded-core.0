Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QNJqn-00083M-EY
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 09:10:21 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 May 2011 00:07:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,241,1304319600"; d="scan'208";a="439578050"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.39])
	by azsmga001.ch.intel.com with ESMTP; 20 May 2011 00:07:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 May 2011 00:06:52 -0700
Message-Id: <9bcffc24a9dbb615c59af223deb295a0dd8579e4.1305874831.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1305874831.git.sgw@linux.intel.com>
References: <cover.1305874831.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305874831.git.sgw@linux.intel.com>
References: <cover.1305874831.git.sgw@linux.intel.com>
Subject: [PATCH 02/12] modutils-cross: fix install issue
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
X-List-Received-Date: Fri, 20 May 2011 07:10:21 -0000

[YOCTO #1055]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../modutils/modutils-cross_2.4.27.bb              |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/modutils/modutils-cross_2.4.27.bb b/meta/recipes-kernel/modutils/modutils-cross_2.4.27.bb
index d772516..f7c68bb 100644
--- a/meta/recipes-kernel/modutils/modutils-cross_2.4.27.bb
+++ b/meta/recipes-kernel/modutils/modutils-cross_2.4.27.bb
@@ -1,5 +1,5 @@
 require modutils_${PV}.bb
-PR = "r9"
+PR = "r10"
 inherit cross
 DEPENDS = ""
 PACKAGES = ""
@@ -16,5 +16,5 @@ CFLAGS_prepend_mipsel = "-D__MIPSEL__"
 CFLAGS_prepend_mipseb = "-D__MIPSEB__"
 
 do_install_append () {
-        mv ${D}${bindir}/${TARGET_PREFIX}depmod ${D}${bindir}/${TARGET_PREFIX}depmod-2.4
+        mv ${D}${sbindir}/${TARGET_PREFIX}depmod ${D}${sbindir}/${TARGET_PREFIX}depmod-2.4
 }
-- 
1.7.3.4



