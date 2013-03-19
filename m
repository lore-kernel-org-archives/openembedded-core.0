Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UI552-0003A7-P3
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 23:32:30 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Mar 2013 15:15:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,874,1355126400"; d="scan'208";a="304767349"
Received: from envy.jf.intel.com (HELO localhost) ([10.7.199.65])
	by orsmga002.jf.intel.com with ESMTP; 19 Mar 2013 15:15:22 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Mar 2013 15:15:01 -0700
Message-Id: <df7479e0193880e0e7b406844890f627d217011d.1363731212.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1363731212.git.dvhart@linux.intel.com>
References: <cover.1363731212.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1363731212.git.dvhart@linux.intel.com>
References: <cover.1363731212.git.dvhart@linux.intel.com>
Subject: [PATCH 1/6] mkefidisk: Cleanup comment length
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
X-List-Received-Date: Tue, 19 Mar 2013 22:32:33 -0000

Keep comments under 80 characters in length.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
---
 scripts/contrib/mkefidisk.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index b7db0a9..701a4d0 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -166,8 +166,8 @@ parted $DEVICE mklabel gpt
 echo "Creating boot partition on $BOOTFS"
 parted $DEVICE mkpart primary 0% $BOOT_SIZE
 
-# GPT doesn't have a real boot flag, parted will change the GUID to EFI System Partition, 
-# which is what we want
+# GPT doesn't have a real boot flag, parted will change the GUID to EFI System
+# Partition, which is what we want
 echo "Enabling boot flag on $BOOTFS"
 parted $DEVICE set 1 boot on
 
-- 
1.8.1.2



