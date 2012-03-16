Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LET-000168-Pi
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:41:25 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 15 Mar 2012 17:32:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="139657367"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by fmsmga002.fm.intel.com with ESMTP; 15 Mar 2012 17:32:34 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:11 +0800
Message-Id: <a7470d36bc5eb0624537190d526941aa077b7652.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 14/60] bluez-hcidump: upgrade to 2.3
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
X-List-Received-Date: Fri, 16 Mar 2012 00:41:26 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../{bluez-hcidump_2.2.bb => bluez-hcidump_2.3.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bluez/{bluez-hcidump_2.2.bb => bluez-hcidump_2.3.bb} (83%)

diff --git a/meta/recipes-connectivity/bluez/bluez-hcidump_2.2.bb b/meta/recipes-connectivity/bluez/bluez-hcidump_2.3.bb
similarity index 83%
rename from meta/recipes-connectivity/bluez/bluez-hcidump_2.2.bb
rename to meta/recipes-connectivity/bluez/bluez-hcidump_2.3.bb
index ba2d7de..3a890df 100644
--- a/meta/recipes-connectivity/bluez/bluez-hcidump_2.2.bb
+++ b/meta/recipes-connectivity/bluez/bluez-hcidump_2.3.bb
@@ -11,8 +11,8 @@ PR = "r0"
 
 SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/bluez-hcidump-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "3c298a8be67099fe227f3e4d9de539d5"
-SRC_URI[sha256sum] = "073066d3ec1f7d1c52bb0fe27cde84ea273e1ab3097b27fa1fd45a5992e1a441"
+SRC_URI[md5sum] = "0cc8ff247d05010e87e9125b31d335ff"
+SRC_URI[sha256sum] = "61c7e7dcad6ed8fce5f4bcc4a0f0d9a83c36642da404348388e6411d6f78d227"
 S = "${WORKDIR}/bluez-hcidump-${PV}"
 
 EXTRA_OECONF = "--with-bluez-libs=${STAGING_LIBDIR} --with-bluez-includes=${STAGING_INCDIR}"
-- 
1.7.6



