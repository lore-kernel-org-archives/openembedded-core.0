Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RutvI-0004HG-Hu
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 23:54:04 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Feb 2012 14:45:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122206368"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.116])
	by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2012 14:45:58 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2012 14:45:24 -0800
Message-Id: <50641a59bf10485f62d6d3669a2c1ded95cc48ed.1328654424.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 04/35] gnupg-1.4.7: Update Patch Info
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
X-List-Received-Date: Tue, 07 Feb 2012 22:54:04 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../gnupg/gnupg-1.4.7/long-long-thumb.patch        |    7 +++++++
 .../gnupg/gnupg-1.4.7/mips_gcc4.4.patch            |    8 ++++++++
 2 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-support/gnupg/gnupg-1.4.7/long-long-thumb.patch b/meta/recipes-support/gnupg/gnupg-1.4.7/long-long-thumb.patch
index dd4ec73..2855cab 100644
--- a/meta/recipes-support/gnupg/gnupg-1.4.7/long-long-thumb.patch
+++ b/meta/recipes-support/gnupg/gnupg-1.4.7/long-long-thumb.patch
@@ -1,3 +1,10 @@
+Orignal Patch came from OpenWrt via OE-Classic
+https://dev.openwrt.org/browser/packages/utils/gnupg/patches/001-mips_gcc4.4
+which is no longer a valid revision!
+
+Upstream-Status: Inappropriate [configuration]
+
+
 --- gnupg/mpi/longlong.h~      2006-02-14 10:09:55.000000000 +0000
 +++ gnupg/mpi/longlong.h       2008-10-27 13:11:09.000000000 +0000
 @@ -181,7 +181,7 @@
diff --git a/meta/recipes-support/gnupg/gnupg-1.4.7/mips_gcc4.4.patch b/meta/recipes-support/gnupg/gnupg-1.4.7/mips_gcc4.4.patch
index b101a5b..9a03b2b 100644
--- a/meta/recipes-support/gnupg/gnupg-1.4.7/mips_gcc4.4.patch
+++ b/meta/recipes-support/gnupg/gnupg-1.4.7/mips_gcc4.4.patch
@@ -1,3 +1,11 @@
+
+From Openembedded-Classic
+
+    gnupg-1.4.10: Readd the ARM Thumb patch as debian has no thumb support
+
+
+Upstream-Status: Inappropriate [embedded-specific]
+
 Index: gnupg-1.4.10/mpi/longlong.h
 ===================================================================
 --- gnupg-1.4.10.orig/mpi/longlong.h	2008-12-11 17:39:43.000000000 +0100
-- 
1.7.6.5



