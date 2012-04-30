Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SOz7N-00084M-Is
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 00:30:53 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Apr 2012 15:21:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="138453912"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.182])
	by orsmga002.jf.intel.com with ESMTP; 30 Apr 2012 15:21:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Apr 2012 15:20:53 -0700
Message-Id: <a0a8d91d660fbb7281f420e46d59b3d8e2db4f51.1335824356.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1335824356.git.sgw@linux.intel.com>
References: <cover.1335824356.git.sgw@linux.intel.com>
In-Reply-To: <cover.1335824356.git.sgw@linux.intel.com>
References: <cover.1335824356.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 09/19] bluez-hcidump: upgrade to version 2.4
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
X-List-Received-Date: Mon, 30 Apr 2012 22:30:54 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../{bluez-hcidump_2.3.bb => bluez-hcidump_2.4.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bluez/{bluez-hcidump_2.3.bb => bluez-hcidump_2.4.bb} (83%)

diff --git a/meta/recipes-connectivity/bluez/bluez-hcidump_2.3.bb b/meta/recipes-connectivity/bluez/bluez-hcidump_2.4.bb
similarity index 83%
rename from meta/recipes-connectivity/bluez/bluez-hcidump_2.3.bb
rename to meta/recipes-connectivity/bluez/bluez-hcidump_2.4.bb
index 3a890df..194c04d 100644
--- a/meta/recipes-connectivity/bluez/bluez-hcidump_2.3.bb
+++ b/meta/recipes-connectivity/bluez/bluez-hcidump_2.4.bb
@@ -11,8 +11,8 @@ PR = "r0"
 
 SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/bluez-hcidump-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "0cc8ff247d05010e87e9125b31d335ff"
-SRC_URI[sha256sum] = "61c7e7dcad6ed8fce5f4bcc4a0f0d9a83c36642da404348388e6411d6f78d227"
+SRC_URI[md5sum] = "d39833de0ed26bddf784e9580b6f33c4"
+SRC_URI[sha256sum] = "bacd155e6420e480d8a30c0b0e6da990031890ee1000a31408e175ab7cf3cbd3"
 S = "${WORKDIR}/bluez-hcidump-${PV}"
 
 EXTRA_OECONF = "--with-bluez-libs=${STAGING_LIBDIR} --with-bluez-includes=${STAGING_INCDIR}"
-- 
1.7.7.6



