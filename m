Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QCCcu-00005Q-12
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Apr 2011 17:14:14 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Apr 2011 08:11:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,240,1301900400"; d="scan'208";a="735566519"
Received: from unknown (HELO localhost) ([10.255.12.227])
	by orsmga001.jf.intel.com with ESMTP; 19 Apr 2011 08:11:37 -0700
Message-Id: <b39d26a13119d367e5aa5cf744bf1954abbecc82.1303170477.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1303170477.git.dvhart@linux.intel.com>
References: <cover.1303170477.git.dvhart@linux.intel.com>
Old-Date: Mon, 18 Apr 2011 16:33:32 -0700
Date: Tue, 19 Apr 2011  8:11:36 -0700
To: openembedded-core@lists.openembedded.org
From: Darren Hart <dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 2/2] kernel: Remove debug statements
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
X-List-Received-Date: Tue, 19 Apr 2011 15:14:16 -0000

From: Darren Hart <dvhart@linux.intel.com>

A stray echo and du command from my development of the following patch remain in
kernel.bbclass. Remove them.

commit 3b49416fc7a7ee9bfe722f2e6089aa18df41dc58
Author: Darren Hart <dvhart@linux.intel.com>
Date:   Tue Mar 8 17:09:10 2011 -0800
kernel/bbclass: rework kernel and module classes to allow for building
out-of-tree modules

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel.bbclass |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index c443285..fd1c8e3 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -137,8 +137,6 @@ kernel_do_install() {
 		cp -fR ${S}/* $kerneldir
 	fi
 	install -m 0644 ${KERNEL_OUTPUT} $kerneldir/${KERNEL_IMAGETYPE}
-	echo "LINUX BUILD TREE COPIED TO SYSROOTS"
-	du -hs $kerneldir
 
 	#
 	# Clean and remove files not needed for building modules.
-- 
1.7.3.4



