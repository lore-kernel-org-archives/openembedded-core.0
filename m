Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QeyPx-0002vn-UT
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 01:55:38 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Jul 2011 16:51:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,496,1304319600"; d="scan'208";a="24685236"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.188])
	by orsmga001.jf.intel.com with ESMTP; 07 Jul 2011 16:51:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jul 2011 00:51:40 +0100
Message-Id: <9cb8d756a7dbd39d6a867ecfa1764c233afac2d2.1310082575.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1310082575.git.paul.eggleton@linux.intel.com>
References: <cover.1310082575.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1310082575.git.paul.eggleton@linux.intel.com>
References: <cover.1310082575.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] bitbake.conf: update OLDEST_KERNEL to 2.6.16
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
X-List-Received-Date: Thu, 07 Jul 2011 23:55:38 -0000

Since we no longer support 2.4, update this setting to 2.6.16, to line up
with the most accepted setting from OE. (This affects eglibc's kernel
support, and 2.6.16 is the minimum version for glibc 2.9 onwards.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/bitbake.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index bdaa35d..463991d 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -349,7 +349,7 @@ SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
 # Kernel info.
 ##################################################################
 
-OLDEST_KERNEL = "2.4.0"
+OLDEST_KERNEL = "2.6.16"
 STAGING_KERNEL_DIR = "${STAGING_DIR_HOST}/kernel"
 
 ##################################################################
-- 
1.7.4.1



