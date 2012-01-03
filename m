Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrW-0004Y7-TY
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:45 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 22:21:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752297"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:14 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:20:21 -0800
Message-Id: <199c64582f73be3706afc26cde6e5c8b879833cb.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 095/113] liburcu: upgrade from 0.6.4 to the latest 0.6.7
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
X-List-Received-Date: Tue, 03 Jan 2012 06:29:37 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../liburcu/{liburcu_0.6.4.bb => liburcu_0.6.7.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/liburcu/{liburcu_0.6.4.bb => liburcu_0.6.7.bb} (80%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.6.4.bb b/meta/recipes-support/liburcu/liburcu_0.6.7.bb
similarity index 80%
rename from meta/recipes-support/liburcu/liburcu_0.6.4.bb
rename to meta/recipes-support/liburcu/liburcu_0.6.7.bb
index 3f0596e..be73856 100644
--- a/meta/recipes-support/liburcu/liburcu_0.6.4.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.6.7.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "The userspace read-copy update library by Mathieu Desnoyers"
 HOMEPAGE = "http://lttng.org/urcu"
-BUGTRACKER = "n/a"
+BUGTRACKER = "http://lttng.org/project/issues"
 
 LICENSE = "LGPLv2.1+ & MIT-style"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b472dc110d38774921e1d5ccb0065fff \
@@ -11,8 +11,8 @@ PR = "r0"
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "39ec317ef5af3ea167429f3eb2a93081"
-SRC_URI[sha256sum] = "2914637c60027ea52974aa7fa8ee7f2a3a0067502bbaebe01de14d6988aa8882"
+SRC_URI[md5sum] = "2705dadd65beda8e8960472c082e44b3"
+SRC_URI[sha256sum] = "b0b09aead6fbcb4d5efb4270e12f84ffd115b99b55b2c745e052b2d87a47e75f"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
-- 
1.7.6.4



