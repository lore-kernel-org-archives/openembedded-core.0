Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tzl4U-0003nR-Qg
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 10:32:25 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Jan 2013 01:16:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,550,1355126400"; d="scan'208";a="195769988"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.19])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Jan 2013 01:16:04 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2013 01:15:54 -0800
Message-Id: <42da080f613a4c57c42d8ce8578c22832d2f7f61.1359364462.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1359364462.git.sgw@linux.intel.com>
References: <cover.1359364462.git.sgw@linux.intel.com>
In-Reply-To: <cover.1359364462.git.sgw@linux.intel.com>
References: <cover.1359364462.git.sgw@linux.intel.com>
Subject: [PATCH 07/13] cracklib: Update to 2.8.22
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
X-List-Received-Date: Mon, 28 Jan 2013 09:32:40 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../cracklib/{cracklib_2.8.19.bb => cracklib_2.8.22.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/cracklib/{cracklib_2.8.19.bb => cracklib_2.8.22.bb} (72%)

diff --git a/meta/recipes-extended/cracklib/cracklib_2.8.19.bb b/meta/recipes-extended/cracklib/cracklib_2.8.22.bb
similarity index 72%
rename from meta/recipes-extended/cracklib/cracklib_2.8.19.bb
rename to meta/recipes-extended/cracklib/cracklib_2.8.22.bb
index 2951396..1ae1aca 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.8.19.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.8.22.bb
@@ -11,7 +11,7 @@ EXTRA_OECONF = "--without-python"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/cracklib/cracklib-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "ca0ec168d9c6466612204e8dfb2df8a9"
-SRC_URI[sha256sum] = "7086b0ca23f875c9cd9ea2a993c262384b274dba9c4ea1da845ec8ac290748a9"
+SRC_URI[md5sum] = "463177b5c29c7a598c991e12a4898e06"
+SRC_URI[sha256sum] = "feaff49bfb513ec10b2618c00d2f7f60776ba93fcc5fa22dd3479dd9cad9f770"
 
 inherit autotools gettext
-- 
1.8.0.2



