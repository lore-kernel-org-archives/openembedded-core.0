Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1TgCar-000641-Hv
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 11:52:45 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Dec 2012 02:37:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,221,1355126400"; d="scan'208";a="259303839"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.166])
	by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2012 02:37:15 -0800
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 12:40:19 +0200
Message-Id: <1354704019-10240-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH] nasm: upgrade to 2.10.05
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
X-List-Received-Date: Wed, 05 Dec 2012 10:52:45 -0000

From: Constantin Musca <constantinx.musca@intel.com>

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-devtools/nasm/{nasm_2.10.01.bb => nasm_2.10.05.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/nasm/{nasm_2.10.01.bb => nasm_2.10.05.bb} (81%)

diff --git a/meta/recipes-devtools/nasm/nasm_2.10.01.bb b/meta/recipes-devtools/nasm/nasm_2.10.05.bb
similarity index 81%
rename from meta/recipes-devtools/nasm/nasm_2.10.01.bb
rename to meta/recipes-devtools/nasm/nasm_2.10.05.bb
index 2864462..d430b1e 100644
--- a/meta/recipes-devtools/nasm/nasm_2.10.01.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.10.05.bb
@@ -7,8 +7,8 @@ COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|freebsd.*)'
 PR = "r0"
 
 SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 "
-SRC_URI[md5sum] = "2e02cb6e90f52950eaaa8cce7a9f2327"
-SRC_URI[sha256sum] = "ac9b37d265c35492ab1bc29dd5a4f3da11b42dd9fea7a31d95f6cb4c812bda84"
+SRC_URI[md5sum] = "d3c50875fd923b782749f883294336ed"
+SRC_URI[sha256sum] = "de5af263ce344d3a89711c61802e3ad8a4e14a61d539f521f7554cdbbe04ed0f"
 
 inherit autotools
 
-- 
1.7.11.7



