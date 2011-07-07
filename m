Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QeoWN-0007Xt-6z
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 15:21:38 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jul 2011 06:11:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,493,1304319600"; d="scan'208";a="24912437"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.202])
	by fmsmga002.fm.intel.com with ESMTP; 07 Jul 2011 06:11:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2011 14:11:33 +0100
Message-Id: <b53c3209e62b53c744afeed13e1563932770cf1f.1310044227.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1310044227.git.paul.eggleton@linux.intel.com>
References: <cover.1310044227.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1310044227.git.paul.eggleton@linux.intel.com>
References: <cover.1310044227.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] bitbake.conf: update OLDEST_KERNEL to 2.6.0
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
X-List-Received-Date: Thu, 07 Jul 2011 13:21:39 -0000

Since we no longer support 2.4, update this setting to 2.6.0. (This affects
eglibc's kernel support).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/bitbake.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index bdaa35d..56a867b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -349,7 +349,7 @@ SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
 # Kernel info.
 ##################################################################
 
-OLDEST_KERNEL = "2.4.0"
+OLDEST_KERNEL = "2.6.0"
 STAGING_KERNEL_DIR = "${STAGING_DIR_HOST}/kernel"
 
 ##################################################################
-- 
1.7.4.1



