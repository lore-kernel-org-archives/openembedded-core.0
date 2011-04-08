Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q8EcC-0006Bb-0G
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Apr 2011 18:32:56 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Apr 2011 09:30:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,324,1299484800"; d="scan'208";a="730879466"
Received: from unknown (HELO localhost) ([10.255.13.36])
	by orsmga001.jf.intel.com with ESMTP; 08 Apr 2011 09:30:45 -0700
Message-Id: <35df2c71cf3c0114a77750bc248341bf654ba757.1302279301.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302279301.git.sgw@linux.intel.com>
References: <cover.1302279301.git.sgw@linux.intel.com>
Old-Date: Fri, 8 Apr 2011 09:07:54 -0700
Date: Fri, 08 Apr 2011  9:30:45 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 1/2] keymaps: Fix MACHINE -> MACHINE_ARCH
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
X-List-Received-Date: Fri, 08 Apr 2011 16:32:56 -0000

From: Saul Wold <sgw@linux.intel.com>

Fixes [YOCTO #960]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-bsp/keymaps/keymaps_1.0.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/keymaps/keymaps_1.0.bb b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
index 88823ae..7f2211a 100644
--- a/meta/recipes-bsp/keymaps/keymaps_1.0.bb
+++ b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
@@ -4,8 +4,8 @@ SECTION = "base"
 RDEPENDS_${PN} = "initscripts console-tools"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-PACKAGE_ARCH = "${MACHINE}"
-PR = "r17"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+PR = "r18"
 
 inherit update-rc.d
 
-- 
1.7.1



