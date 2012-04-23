Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1SMR4u-0000JZ-Hb
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Apr 2012 23:45:48 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Apr 2012 14:36:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="132996178"
Received: from unknown (HELO shamshir.jf.intel.com) ([10.7.198.56])
	by orsmga001.jf.intel.com with ESMTP; 23 Apr 2012 14:36:12 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Apr 2012 14:36:10 -0700
Message-Id: <56d2d2153b231fe07d0b5ed6f24faa2ab886fce7.1335216873.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1335216873.git.josh@linux.intel.com>
References: <cover.1335216873.git.josh@linux.intel.com>
In-Reply-To: <cover.1335216873.git.josh@linux.intel.com>
References: <cover.1335216873.git.josh@linux.intel.com>
Subject: [PATCH 2/2] scripts/hob: disable sanity checks when launching
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
X-List-Received-Date: Mon, 23 Apr 2012 21:45:48 -0000

This enables us to use the GUI to change any settings which might cause
sanity checks to fail, such as the proxy configuration.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 scripts/hob |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/scripts/hob b/scripts/hob
index ee80cb3..4a821cb 100755
--- a/scripts/hob
+++ b/scripts/hob
@@ -1,5 +1,6 @@
 #!/usr/bin/env bash
-bitbake -u hob
+export BB_ENV_EXTRAWHITE="DISABLE_SANITY_CHECKS $BB_ENV_EXTRAWHITE"
+DISABLE_SANITY_CHECKS=1 bitbake -u hob
 
 ret=$?
 exit $ret
-- 
1.7.7.6



