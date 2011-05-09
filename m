Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJKUH-0003hO-Sb
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 09:02:38 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 May 2011 23:59:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,339,1301900400"; d="scan'208";a="744305335"
Received: from unknown (HELO localhost) ([10.255.12.42])
	by orsmga001.jf.intel.com with ESMTP; 08 May 2011 23:59:55 -0700
Message-Id: <897f11e4ecf3acaa9d4695d3be0e9beb38322d9d.1304924223.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304924223.git.sgw@linux.intel.com>
References: <cover.1304924223.git.sgw@linux.intel.com>
Old-Date: Wed, 4 May 2011 15:21:54 -0700
Date: Sun, 08 May 2011 23:59:55 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 18/20] bash.inc: Add bison-native to DEPENDS
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
X-List-Received-Date: Mon, 09 May 2011 07:02:39 -0000

From: Tom Rini <tom_rini@mentor.com>

This is f0652d96ff5c3b08b8e4c4972f7fb0296df6d898 from OE.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/recipes-extended/bash/bash.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index ecbd75d..e218304 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -5,7 +5,7 @@ SECTION = "base/shell"
 # GPLv2+ (< 4.0), GPLv3+ (>= 4.0)
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-DEPENDS = "ncurses"
+DEPENDS = "ncurses bison-native"
 
 inherit autotools gettext
 
-- 
1.7.1.1



