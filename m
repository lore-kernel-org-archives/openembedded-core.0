Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QpabQ-0000Nc-U0
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Aug 2011 08:43:21 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Aug 2011 23:38:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,327,1309762800"; d="scan'208";a="35941165"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.173])
	by orsmga001.jf.intel.com with ESMTP; 05 Aug 2011 23:38:48 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 23:38:43 -0700
Message-Id: <c20e69225510f70553c330c25944d8aee8ae5208.1312612601.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312612601.git.sgw@linux.intel.com>
References: <cover.1312612601.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312612601.git.sgw@linux.intel.com>
References: <cover.1312612601.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 7/9] liburcu: Update to 0.6.4
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
X-List-Received-Date: Sat, 06 Aug 2011 06:43:21 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../liburcu/{liburcu_0.5.4.bb => liburcu_0.6.4.bb} |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)
 rename meta/recipes-support/liburcu/{liburcu_0.5.4.bb => liburcu_0.6.4.bb} (72%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.5.4.bb b/meta/recipes-support/liburcu/liburcu_0.6.4.bb
similarity index 72%
rename from meta/recipes-support/liburcu/liburcu_0.5.4.bb
rename to meta/recipes-support/liburcu/liburcu_0.6.4.bb
index b83d708..4247240 100644
--- a/meta/recipes-support/liburcu/liburcu_0.5.4.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.6.4.bb
@@ -5,15 +5,12 @@ BUGTRACKER = "n/a"
 LICENSE = "LGPLv2.1+ & MIT-style"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b472dc110d38774921e1d5ccb0065fff \
                     file://urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9 \
-                    file://urcu/uatomic_arch_x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42"
+                    file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42"
 
 PR = "r0"
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "04147d24749be75200173859839207f7"
-SRC_URI[sha256sum] = "02aedbb16c16bd034e246d5c9637a9232be559c66fc2fe4eb28948e234bd89f1"
-
 S = "${WORKDIR}/userspace-rcu-${PV}"
 CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
 inherit autotools
-- 
1.7.3.4



