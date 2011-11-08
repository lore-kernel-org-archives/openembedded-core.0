Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RNsSC-0006Vh-0t
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 21:39:32 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Nov 2011 12:33:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="72540283"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by orsmga001.jf.intel.com with ESMTP; 08 Nov 2011 12:33:15 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2011 12:33:14 -0800
Message-Id: <aa34f8427dfee492837c5762ad36fcf58e104ba9.1320784301.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320784301.git.sgw@linux.intel.com>
References: <cover.1320784301.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320784301.git.sgw@linux.intel.com>
References: <cover.1320784301.git.sgw@linux.intel.com>
Subject: [PATCH 1/1] udev: Blacklist /dev/md
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
X-List-Received-Date: Tue, 08 Nov 2011 20:39:32 -0000

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



