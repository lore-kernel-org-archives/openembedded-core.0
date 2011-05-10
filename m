Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJfVF-0001SF-CX
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 07:29:01 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 May 2011 22:26:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,345,1301900400"; d="scan'208";a="640479295"
Received: from unknown (HELO localhost) ([10.255.12.75])
	by orsmga002.jf.intel.com with ESMTP; 09 May 2011 22:26:16 -0700
Message-Id: <8cf7cd9514a3c73ed2c60a3f18a82f46bf8614cb.1305004776.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305004776.git.sgw@linux.intel.com>
References: <cover.1305004776.git.sgw@linux.intel.com>
Old-Date: Thu, 5 May 2011 22:24:40 -0700
Date: Mon, 09 May 2011 22:26:16 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 05/30] liburcu_0.5.4.bb: Let it build on uclibc targets
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
X-List-Received-Date: Tue, 10 May 2011 05:29:01 -0000

From: Khem Raj <raj.khem@gmail.com>

uclibc requires -D_GNU_SOURCE to be defined for it
to enable GNU extensions which CPU_SET/CPU_ZERO are
used by this package. So we add -D_GNU_SOURCE to
CFLAGS when compiling for uclibc.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/liburcu/liburcu_0.5.4.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/liburcu/liburcu_0.5.4.bb b/meta/recipes-support/liburcu/liburcu_0.5.4.bb
index 8e17e5d..b83d708 100644
--- a/meta/recipes-support/liburcu/liburcu_0.5.4.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.5.4.bb
@@ -15,7 +15,7 @@ SRC_URI[md5sum] = "04147d24749be75200173859839207f7"
 SRC_URI[sha256sum] = "02aedbb16c16bd034e246d5c9637a9232be559c66fc2fe4eb28948e234bd89f1"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
-
+CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
 inherit autotools
 
 # liburcu, which is only used by lttng-ust, may not build on other
-- 
1.7.1.1



