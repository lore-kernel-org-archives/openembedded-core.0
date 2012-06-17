Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sg8Nx-0008Qo-2M
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Jun 2012 07:50:53 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jun 2012 22:40:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="181103286"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.105])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2012 22:40:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Jun 2012 22:39:48 -0700
Message-Id: <a9b1aa7c624e4b155a569454f099867fc23ab62d.1339911478.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 04/23] uclibc_0.9.33.bb: Upgrade to latest git
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
X-List-Received-Date: Sun, 17 Jun 2012 05:50:53 -0000

From: Khem Raj <raj.khem@gmail.com>

This is needed otherwise glib-2.0 wont run
correctly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc_0.9.33.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc_0.9.33.bb b/meta/recipes-core/uclibc/uclibc_0.9.33.bb
index 43c8f74..b72f9dd 100644
--- a/meta/recipes-core/uclibc/uclibc_0.9.33.bb
+++ b/meta/recipes-core/uclibc/uclibc_0.9.33.bb
@@ -1,8 +1,8 @@
-SRCREV="f7c18471f1ff8f3e54e462df0e96e19739869c78"
+SRCREV="7810e4f8027b5c4c8ceec6fefec4eb779362ebb5"
 
 require uclibc.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
 
 SRC_URI = "git://uclibc.org/uClibc.git;branch=${PV};protocol=git \
-- 
1.7.7.6



