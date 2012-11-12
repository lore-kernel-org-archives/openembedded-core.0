Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1TY369-0007cA-2T
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 00:07:21 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Nov 2012 14:52:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,764,1344236400"; d="scan'208";a="240990420"
Received: from jzhang-desktop.jf.intel.com (HELO localhost) ([10.7.201.69])
	by orsmga002.jf.intel.com with ESMTP; 12 Nov 2012 14:53:26 -0800
From: Jessica Zhang <jessica.zhang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Nov 2012 15:04:40 -0800
Message-Id: <65cdcc44ab7a640a227a2605f9a93433745f37eb.1352761226.git.jessica.zhang@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1352761226.git.jessica.zhang@intel.com>
References: <cover.1352761226.git.jessica.zhang@intel.com>
In-Reply-To: <cover.1352761226.git.jessica.zhang@intel.com>
References: <cover.1352761226.git.jessica.zhang@intel.com>
Subject: [PATCH 1/1] Fix the first line typo of adt-installer [YOCTO#3384]
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
X-List-Received-Date: Mon, 12 Nov 2012 23:07:21 -0000

Signed-off-by: Jessica Zhang <jessica.zhang@intel.com>
---
 .../installer/adt-installer/adt_installer          |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer b/meta/recipes-devtools/installer/adt-installer/adt_installer
index 0be5a1d..c012391 100755
--- a/meta/recipes-devtools/installer/adt-installer/adt_installer
+++ b/meta/recipes-devtools/installer/adt-installer/adt_installer
@@ -1,4 +1,4 @@
-#/bin/bash
+#!/bin/bash
 # Yocto ADT Installer
 #
 # Copyright 2010-2011 by Intel Corp.
-- 
1.7.9.5



