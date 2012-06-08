Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1Scvfq-0004D9-Pl
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 11:40:06 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 08 Jun 2012 02:28:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="109487663"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.104.85])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Jun 2012 02:28:30 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jun 2012 12:30:25 +0300
Message-Id: <1339147825-24242-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] nasm: updated to 2.10.01
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
X-List-Received-Date: Fri, 08 Jun 2012 09:40:07 -0000

Tested by compiling syslinux

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../nasm/{nasm_2.07.bb => nasm_2.10.01.bb}         |   11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/nasm/{nasm_2.07.bb => nasm_2.10.01.bb} (58%)

diff --git a/meta/recipes-devtools/nasm/nasm_2.07.bb b/meta/recipes-devtools/nasm/nasm_2.10.01.bb
similarity index 58%
rename from meta/recipes-devtools/nasm/nasm_2.07.bb
rename to meta/recipes-devtools/nasm/nasm_2.10.01.bb
index fc2d531..8feaad4 100644
--- a/meta/recipes-devtools/nasm/nasm_2.07.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.10.01.bb
@@ -1,15 +1,14 @@
 DESCRIPTION = "General-purpose x86 assembler"
 SECTION = "devel"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d89d124974e487e5d64da6f1cd8acfbb"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
 COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|freebsd.*)'
 
-PR = "r1"
+PR = "r0"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/nasm/nasm-${PV}.tar.bz2 "
-
-SRC_URI[md5sum] = "d8934231e81874c29374ddef1fbdb1ed"
-SRC_URI[sha256sum] = "ac70ee451c73d742c9ff830502e5f8b1f648b2abffa8fd00944243283ba8e87c"
+SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 "
+SRC_URI[md5sum] = "2e02cb6e90f52950eaaa8cce7a9f2327"
+SRC_URI[sha256sum] = "ac9b37d265c35492ab1bc29dd5a4f3da11b42dd9fea7a31d95f6cb4c812bda84"
 
 inherit autotools
 
-- 
1.7.9.5



