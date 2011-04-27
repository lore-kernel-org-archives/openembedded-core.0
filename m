Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzE8-0005K8-UA
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:01 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Apr 2011 00:29:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="426203220"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by azsmga001.ch.intel.com with ESMTP; 27 Apr 2011 00:29:31 -0700
Message-Id: <b026b60dcbdf5fa4613ecdc54753166be2e0870a.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Tue, 19 Apr 2011 15:57:41 +0800
Date: Wed, 27 Apr 2011  0:29:31 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 11/52] bluez-hcidump: upgrade to version 2.0
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
X-List-Received-Date: Wed, 27 Apr 2011 07:32:01 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 ...{bluez-hcidump_1.42.bb => bluez-hcidump_2.0.bb} |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/bluez/{bluez-hcidump_1.42.bb => bluez-hcidump_2.0.bb} (69%)

diff --git a/meta/recipes-connectivity/bluez/bluez-hcidump_1.42.bb b/meta/recipes-connectivity/bluez/bluez-hcidump_2.0.bb
similarity index 69%
rename from meta/recipes-connectivity/bluez/bluez-hcidump_1.42.bb
rename to meta/recipes-connectivity/bluez/bluez-hcidump_2.0.bb
index 7291548..67dd2c6 100644
--- a/meta/recipes-connectivity/bluez/bluez-hcidump_1.42.bb
+++ b/meta/recipes-connectivity/bluez/bluez-hcidump_2.0.bb
@@ -7,13 +7,13 @@ PRIORITY = "optional"
 DEPENDS = "bluez4"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
-                    file://src/hcidump.c;beginline=1;endline=23;md5=22f51010959a0cd483c4d7f0bd77aaa3"
+                    file://src/hcidump.c;beginline=1;endline=23;md5=3bee3a162dff43a5be7470710b99fbcf"
 PR = "r0"
 
-SRC_URI = "http://bluez.sourceforge.net/download/bluez-hcidump-${PV}.tar.gz"
+SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/bluez-hcidump-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "5704737aaf72104eeaf77335218a1827"
-SRC_URI[sha256sum] = "689e39f9432ab90af5f390d86cb46e06c35693d01ea29aec4e41c4f9e315f49f"
+SRC_URI[md5sum] = "5c2e3ef0a68b2845047867ba51ff8ac9"
+SRC_URI[sha256sum] = "b3b64fd0b18301df07d3aaf34c037c1e4808b4aaf702294822d62b5424f617fd"
 S = "${WORKDIR}/bluez-hcidump-${PV}"
 
 EXTRA_OECONF = "--with-bluez-libs=${STAGING_LIBDIR} --with-bluez-includes=${STAGING_INCDIR}"
-- 
1.7.1.1



