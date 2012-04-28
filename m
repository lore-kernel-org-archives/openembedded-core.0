Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1SO2yG-0005Lj-NF
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Apr 2012 10:25:36 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Apr 2012 01:15:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="94114508"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.11])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Apr 2012 01:15:55 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Apr 2012 16:12:28 +0800
Message-Id: <90310701bf3e2120addd31bd40016ee9aa1203e6.1335600691.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1335600691.git.dongxiao.xu@intel.com>
References: <cover.1335600691.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1335600691.git.dongxiao.xu@intel.com>
References: <cover.1335600691.git.dongxiao.xu@intel.com>
Subject: [PATCH 4/8] bluez-hcidump: upgrade to version 2.4
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
X-List-Received-Date: Sat, 28 Apr 2012 08:25:37 -0000

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
1.7.4.1



