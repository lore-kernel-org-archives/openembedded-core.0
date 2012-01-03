Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrM-0004iK-MV
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:33 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 22:21:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752232"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:03 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:19:50 -0800
Message-Id: <2ac97f25f72d951a330a55725bb20aefc439fc07.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 064/113] libiconv: Update to 1.14
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:33 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../autoconf.patch                                 |    0
 .../{libiconv_1.13.1.bb => libiconv_1.14.bb}       |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libiconv/{libiconv-1.13.1 => libiconv-1.14}/autoconf.patch (100%)
 rename meta/recipes-support/libiconv/{libiconv_1.13.1.bb => libiconv_1.14.bb} (88%)

diff --git a/meta/recipes-support/libiconv/libiconv-1.13.1/autoconf.patch b/meta/recipes-support/libiconv/libiconv-1.14/autoconf.patch
similarity index 100%
rename from meta/recipes-support/libiconv/libiconv-1.13.1/autoconf.patch
rename to meta/recipes-support/libiconv/libiconv-1.14/autoconf.patch
diff --git a/meta/recipes-support/libiconv/libiconv_1.13.1.bb b/meta/recipes-support/libiconv/libiconv_1.14.bb
similarity index 88%
rename from meta/recipes-support/libiconv/libiconv_1.13.1.bb
rename to meta/recipes-support/libiconv/libiconv_1.14.bb
index 6471e32..5eea823 100644
--- a/meta/recipes-support/libiconv/libiconv_1.13.1.bb
+++ b/meta/recipes-support/libiconv/libiconv_1.14.bb
@@ -13,8 +13,8 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://autoconf.patch \
           "
 
-SRC_URI[md5sum] = "7ab33ebd26687c744a37264a330bbe9a"
-SRC_URI[sha256sum] = "55a36168306089009d054ccdd9d013041bfc3ab26be7033d107821f1c4949a49"
+SRC_URI[md5sum] = "e34509b1623cec449dfeb73d7ce9c6c6"
+SRC_URI[sha256sum] = "72b24ded17d687193c3366d0ebe7cde1e6b18f0df8c55438ac95be39e8a30613"
 
 S = "${WORKDIR}/libiconv-${PV}"
 
-- 
1.7.6.4



