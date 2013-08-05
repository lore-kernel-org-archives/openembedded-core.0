Return-Path: <cristiana.voicu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 903936B436
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 08:25:30 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Aug 2013 01:25:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,817,1367996400"; d="scan'208";a="376250871"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.72])
	by fmsmga001.fm.intel.com with ESMTP; 05 Aug 2013 01:25:30 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Aug 2013 11:28:11 +0300
Message-Id: <3883def9ef6db74102e58d5338fcaa5423a89938.1375441054.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <002befd249411cf19e27d77a58d7be18e2690807.1375441054.git.cristiana.voicu@intel.com>
References: <002befd249411cf19e27d77a58d7be18e2690807.1375441054.git.cristiana.voicu@intel.com>
In-Reply-To: <cover.1375441054.git.cristiana.voicu@intel.com>
References: <cover.1375441054.git.cristiana.voicu@intel.com>
Subject: [PATCH 2/3] liburcu: upgrade to 0.7.7
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Aug 2013 08:25:30 -0000

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 .../liburcu/{liburcu_0.7.6.bb => liburcu_0.7.7.bb} |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-support/liburcu/{liburcu_0.7.6.bb => liburcu_0.7.7.bb} (80%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.7.6.bb b/meta/recipes-support/liburcu/liburcu_0.7.7.bb
similarity index 80%
rename from meta/recipes-support/liburcu/liburcu_0.7.6.bb
rename to meta/recipes-support/liburcu/liburcu_0.7.7.bb
index 1b57d10..a75e92e 100644
--- a/meta/recipes-support/liburcu/liburcu_0.7.6.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.7.7.bb
@@ -7,12 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0f060c30a27922ce9c0d557a639b4fa3 \
                     file://urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9 \
                     file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42"
 
-PR = "r0"
-
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "4c1ecb4bdcd43e36dfdffdd297023c8b"
-SRC_URI[sha256sum] = "71f2c0b75f3473e4d7aa6ac5111ca4d9cccccd5d131e87b53a07d35bd2c5900a"
+SRC_URI[md5sum] = "d14de3ff32eb1ab9424b258599c8a6f3"
+SRC_URI[sha256sum] = "8ab8a7d8fea47c09ceac24c9277f00da626bbd9426c973eb325b1baf33b4bdfb"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
-- 
1.7.9.5


