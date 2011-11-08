Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RNsuA-0008AD-Rm
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 22:08:27 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 Nov 2011 13:02:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="72442035"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by orsmga002.jf.intel.com with ESMTP; 08 Nov 2011 13:02:08 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2011 13:02:08 -0800
Message-Id: <1320786128-14804-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH] udev: blacklist /dev/md
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
X-List-Received-Date: Tue, 08 Nov 2011 21:08:27 -0000

Do not mount /dev/md by default via udev, this resolved a problem
with the sanity test failing due to seeing the error while attempting
to mount /dev/md0

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/udev/files/mount.blacklist |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/udev/files/mount.blacklist b/meta/recipes-core/udev/files/mount.blacklist
index d3ebb17..7c7d938 100644
--- a/meta/recipes-core/udev/files/mount.blacklist
+++ b/meta/recipes-core/udev/files/mount.blacklist
@@ -1,3 +1,4 @@
 /dev/loop
 /dev/ram
 /dev/mtdblock
+/dev/md
-- 
1.7.6.4



