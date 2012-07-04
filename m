Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SmHSh-00011A-6z
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 06:45:11 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Jul 2012 21:34:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="166675775"
Received: from fear.jf.intel.com (HELO rage.local) ([10.7.201.160])
	by orsmga002.jf.intel.com with ESMTP; 03 Jul 2012 21:34:05 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>, Tom Zanussi <tom.zanussi@intel.com>,
	Kishore Bodke <kishore.k.bodke@intel.com>, Saul Wold <sgw@linux.intel.com>
Date: Tue,  3 Jul 2012 21:33:59 -0700
Message-Id: <001a612211a7947cc74d134c70053b9415921392.1341376182.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1341376182.git.dvhart@linux.intel.com>
References: <cover.1341376182.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1341376182.git.dvhart@linux.intel.com>
References: <cover.1341376182.git.dvhart@linux.intel.com>
Subject: [PATCH 2/5] init-install: Correct ext2->ext3 typo in logging
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
X-List-Received-Date: Wed, 04 Jul 2012 04:45:11 -0000

We create both the boot and root partitions as ext3 now, update the
logging accordingly.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 .../initrdscripts/files/init-install.sh            |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index 3005f20..8d21dd1 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -123,7 +123,7 @@ parted /dev/${device} mkpart primary $swap_start $disk_size
 
 parted /dev/${device} print
 
-echo "Formatting $bootfs to ext2..."
+echo "Formatting $bootfs to ext3..."
 mkfs.ext3 $bootfs
 
 echo "Formatting $rootfs to ext3..."
-- 
1.7.5.4



