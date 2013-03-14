Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1UGCdn-0003Yd-Lg
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Mar 2013 19:12:37 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Mar 2013 10:55:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,845,1355126400"; d="scan'208";a="214773906"
Received: from unknown (HELO dell-desktop.rb.intel.com) ([10.237.105.59])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Mar 2013 10:55:43 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Mar 2013 19:55:12 +0200
Message-Id: <22a28920a09d6e2d44bae1fb11d0f43eb83afee3.1363283478.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1363283478.git.radu.moisan@intel.com>
References: <cover.1363283478.git.radu.moisan@intel.com>
In-Reply-To: <cover.1363283478.git.radu.moisan@intel.com>
References: <cover.1363283478.git.radu.moisan@intel.com>
Subject: [PATCH 13/17] liburcu: Upgrade to v0.7.6
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Mar 2013 18:12:38 -0000

License file changed but still compliant with LGPLv2.1

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../liburcu/{liburcu_0.7.4.bb => liburcu_0.7.6.bb} |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/liburcu/{liburcu_0.7.4.bb => liburcu_0.7.6.bb} (77%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.7.4.bb b/meta/recipes-support/liburcu/liburcu_0.7.6.bb
similarity index 77%
rename from meta/recipes-support/liburcu/liburcu_0.7.4.bb
rename to meta/recipes-support/liburcu/liburcu_0.7.6.bb
index a6a5bfc..6e3ab22 100644
--- a/meta/recipes-support/liburcu/liburcu_0.7.4.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.7.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://lttng.org/urcu"
 BUGTRACKER = "http://lttng.org/project/issues"
 
 LICENSE = "LGPLv2.1+ & MIT-style"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=95dfea59eeaa41a4057faa07a58f5f89 \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0f060c30a27922ce9c0d557a639b4fa3 \
                     file://urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9 \
                     file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42"
 
@@ -11,8 +11,8 @@ PR = "r0"
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "7defbc16443e680ce4aad90cf49537a9"
-SRC_URI[sha256sum] = "2294ec969308fc9115b43eb7ed5392a63a7e671f44316446a1149a39db54d51f"
+SRC_URI[md5sum] = "4c1ecb4bdcd43e36dfdffdd297023c8b"
+SRC_URI[sha256sum] = "71f2c0b75f3473e4d7aa6ac5111ca4d9cccccd5d131e87b53a07d35bd2c5900a"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
-- 
1.7.9.5



