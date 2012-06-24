Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SirKX-0004YM-20
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Jun 2012 20:14:37 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2012 11:03:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="161983148"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.175])
	by orsmga002.jf.intel.com with ESMTP; 24 Jun 2012 11:03:43 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Jun 2012 11:03:33 -0700
Message-Id: <f83dc2411123b6c21d8fe926fe3923198ebc6a1a.1340560914.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340560914.git.sgw@linux.intel.com>
References: <cover.1340560914.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340560914.git.sgw@linux.intel.com>
References: <cover.1340560914.git.sgw@linux.intel.com>
Subject: [PATCH 08/14] cracklib: Upgrade to 2.8.19
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
X-List-Received-Date: Sun, 24 Jun 2012 18:14:37 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{cracklib_2.8.18.bb => cracklib_2.8.19.bb}     |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/cracklib/{cracklib_2.8.18.bb => cracklib_2.8.19.bb} (70%)

diff --git a/meta/recipes-extended/cracklib/cracklib_2.8.18.bb b/meta/recipes-extended/cracklib/cracklib_2.8.19.bb
similarity index 70%
rename from meta/recipes-extended/cracklib/cracklib_2.8.18.bb
rename to meta/recipes-extended/cracklib/cracklib_2.8.19.bb
index ad8fd5b..2951396 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.8.18.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.8.19.bb
@@ -5,13 +5,13 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
 DEPENDS = "zlib"
-PR ="r4"
+PR ="r0"
 
 EXTRA_OECONF = "--without-python"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/cracklib/cracklib-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "79053ad8bc714a44cd660cb12116211b"
-SRC_URI[sha256sum] = "2b072f67f7267358459424c3ed70f7f5b70919118e6504a90d3bce37a67c1454"
+SRC_URI[md5sum] = "ca0ec168d9c6466612204e8dfb2df8a9"
+SRC_URI[sha256sum] = "7086b0ca23f875c9cd9ea2a993c262384b274dba9c4ea1da845ec8ac290748a9"
 
 inherit autotools gettext
-- 
1.7.7.6



