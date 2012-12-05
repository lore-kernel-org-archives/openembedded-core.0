Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TgEgd-000103-8Z
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 14:06:51 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Dec 2012 04:52:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,221,1355126400"; d="scan'208";a="229266797"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.59])
	by orsmga001.jf.intel.com with ESMTP; 05 Dec 2012 04:52:26 -0800
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 14:57:36 +0200
Message-Id: <0cc3e1bbc87d615c7f9d35c248454594a5f98572.1354711738.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1354711738.git.radu.moisan@intel.com>
References: <cover.1354711738.git.radu.moisan@intel.com>
In-Reply-To: <cover.1354711738.git.radu.moisan@intel.com>
References: <cover.1354711738.git.radu.moisan@intel.com>
Subject: [PATCH 2/4] liburcu: upgrade to 0.7.4
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
X-List-Received-Date: Wed, 05 Dec 2012 13:06:51 -0000

From: Constantin Musca <constantinx.musca@intel.com>

License checksum change due to diff:
3c3
< May 10, 2009
> May 15, 2012
59a60,65
>
> * GPLv3 (or later)
>
> The following build-related macro is under GPLv3 (or later):
>
> m4/ax_tls.m4

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../liburcu/{liburcu_0.6.7.bb => liburcu_0.7.4.bb} |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/liburcu/{liburcu_0.6.7.bb => liburcu_0.7.4.bb} (76%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.6.7.bb b/meta/recipes-support/liburcu/liburcu_0.7.4.bb
similarity index 76%
rename from meta/recipes-support/liburcu/liburcu_0.6.7.bb
rename to meta/recipes-support/liburcu/liburcu_0.7.4.bb
index 361780c..a6a5bfc 100644
--- a/meta/recipes-support/liburcu/liburcu_0.6.7.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.7.4.bb
@@ -3,16 +3,16 @@ HOMEPAGE = "http://lttng.org/urcu"
 BUGTRACKER = "http://lttng.org/project/issues"
 
 LICENSE = "LGPLv2.1+ & MIT-style"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b472dc110d38774921e1d5ccb0065fff \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=95dfea59eeaa41a4057faa07a58f5f89 \
                     file://urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9 \
                     file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42"
 
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "2705dadd65beda8e8960472c082e44b3"
-SRC_URI[sha256sum] = "b0b09aead6fbcb4d5efb4270e12f84ffd115b99b55b2c745e052b2d87a47e75f"
+SRC_URI[md5sum] = "7defbc16443e680ce4aad90cf49537a9"
+SRC_URI[sha256sum] = "2294ec969308fc9115b43eb7ed5392a63a7e671f44316446a1149a39db54d51f"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
-- 
1.7.9.5



