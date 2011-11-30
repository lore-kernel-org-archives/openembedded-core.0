Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RVs8g-0007gX-Nz
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 22:56:27 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 30 Nov 2011 13:49:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,272,1320652800"; d="scan'208";a="42665461"
Received: from unknown (HELO localhost) ([10.255.12.165])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Nov 2011 13:49:44 -0800
From: Darren Hart <darren@dvhart.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 13:49:46 -0800
Message-Id: <a2ffca40657e91657d148ae7d4496f3c94056a83.1322689519.git.darren@dvhart.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <e7ca852c4e673a6b32be203109a704202aeace3a.1322689519.git.darren@dvhart.com>
References: <e7ca852c4e673a6b32be203109a704202aeace3a.1322689519.git.darren@dvhart.com>
In-Reply-To: <cover.1322689519.git.darren@dvhart.com>
References: <cover.1322689519.git.darren@dvhart.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 4/4] grub: Drop "apply=yes" from patch
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
X-List-Received-Date: Wed, 30 Nov 2011 21:56:27 -0000

From: Darren Hart <dvhart@linux.intel.com>

The "apply=yes" doesn't appear to be necessary, drop it in favor of
a simpler SRC_URI specification.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
CC: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-bsp/grub/grub_1.99.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub_1.99.bb b/meta/recipes-bsp/grub/grub_1.99.bb
index 66ad669..49c26f6 100644
--- a/meta/recipes-bsp/grub/grub_1.99.bb
+++ b/meta/recipes-bsp/grub/grub_1.99.bb
@@ -16,7 +16,7 @@ RDEPENDS_${PN} = "diffutils freetype"
 PR = "r2"
 
 SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
-          file://grub-install.in.patch;apply=yes \
+          file://grub-install.in.patch \
           file://40_custom"
 
 SRC_URI[md5sum] = "ca9f2a2d571b57fc5c53212d1d22e2b5"
-- 
1.7.6.4



