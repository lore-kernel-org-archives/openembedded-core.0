Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1ToERX-0001tz-Fw
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Dec 2012 15:28:20 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Dec 2012 06:13:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,362,1355126400"; d="scan'208";a="239466224"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga001.jf.intel.com with ESMTP; 27 Dec 2012 06:13:23 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Dec 2012 16:13:55 +0200
Message-Id: <ff6c2bd2ae0c7a176cb13a5766d36bc38f87da8d.1356617488.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1356617488.git.constantinx.musca@intel.com>
References: <cover.1356617488.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1356617488.git.constantinx.musca@intel.com>
References: <cover.1356617488.git.constantinx.musca@intel.com>
Subject: [PATCH 4/6] eglibc-locale: enable multilib
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
X-List-Received-Date: Thu, 27 Dec 2012 14:28:20 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-core/eglibc/eglibc-locale.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc b/meta/recipes-core/eglibc/eglibc-locale.inc
index 0381e26..d2b23de 100644
--- a/meta/recipes-core/eglibc/eglibc-locale.inc
+++ b/meta/recipes-core/eglibc/eglibc-locale.inc
@@ -1,7 +1,7 @@
 include eglibc-collateral.inc
 
 BPN = "eglibc"
-LOCALEBASEPN = "eglibc"
+LOCALEBASEPN = "${MLPREFIX}eglibc"
 
 # Binary locales are generated at build time if ENABLE_BINARY_LOCALE_GENERATION
 # is set. The idea is to avoid running localedef on the target (at first boot)
@@ -20,7 +20,7 @@ BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64 powerpc mips mips64"
 # set "0" for qemu emulation of native localedef for locale generation
 LOCALE_GENERATION_WITH_CROSS-LOCALEDEF = "1"
 
-PR = "r22"
+PR = "r23"
 
 PROVIDES = "virtual/libc-locale"
 
-- 
1.7.11.7



