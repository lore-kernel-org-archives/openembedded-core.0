Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RlTHT-0005hh-7d
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 23:37:59 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Jan 2012 14:30:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="97808825"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by orsmga002.jf.intel.com with ESMTP; 12 Jan 2012 14:30:25 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jan 2012 14:30:19 -0800
Message-Id: <67854c1a0c5e3ccd8f4c98e22fa5d9c847eff8b6.1326406744.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <e7790b276b6dfce808bb6b70fe2847af657cd7b5.1326406744.git.nitin.a.kamble@intel.com>
References: <e7790b276b6dfce808bb6b70fe2847af657cd7b5.1326406744.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1326406744.git.nitin.a.kamble@intel.com>
References: <cover.1326406744.git.nitin.a.kamble@intel.com>
Subject: [PATCH 5/7] btrfs-tools: upgrade to newer git commit
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
X-List-Received-Date: Thu, 12 Jan 2012 22:37:59 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../btrfs-tools/btrfs-tools_git.bb                 |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
index 58049e5..c2ae298 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
@@ -12,11 +12,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
 SECTION = "base"
 DEPENDS = "util-linux attr"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/mason/btrfs-progs.git;protocol=git;tag=13eced9a0c2b6bd6bc38e6f0f46a1977b1167e67;branch=master"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/mason/btrfs-progs.git;protocol=git;tag=fdb6c0402337d9607c7a39155088eaf033742752;branch=master"
 
 S = "${WORKDIR}/git"
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI += " file://fix_use_of_gcc.patch \
 	 file://weak-defaults.patch \
-- 
1.7.6.4



