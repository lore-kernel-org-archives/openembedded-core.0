Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVWm0-0001Ov-28
	for openembedded-core@openembedded.org; Wed, 30 Nov 2011 00:07:36 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Nov 2011 15:00:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,594,1315206000"; d="scan'208";a="96720811"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 15:00:32 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 15:00:20 -0800
Message-Id: <63a8312e843e78942030e19786cc34ee752c851c.1322607016.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
Subject: [PATCH 20/26] libiconv: Update to 1.14
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
X-List-Received-Date: Tue, 29 Nov 2011 23:07:36 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{libiconv_1.13.1.bb => libiconv_1.14.bb}       |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libiconv/{libiconv_1.13.1.bb => libiconv_1.14.bb} (88%)

diff --git a/meta/recipes-support/libiconv/libiconv_1.13.1.bb b/meta/recipes-support/libiconv/libiconv_1.14.bb
similarity index 88%
rename from meta/recipes-support/libiconv/libiconv_1.13.1.bb
rename to meta/recipes-support/libiconv/libiconv_1.14.bb
index 6471e32..3b0196d 100644
--- a/meta/recipes-support/libiconv/libiconv_1.13.1.bb
+++ b/meta/recipes-support/libiconv/libiconv_1.14.bb
@@ -13,9 +13,6 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://autoconf.patch \
           "
 
-SRC_URI[md5sum] = "7ab33ebd26687c744a37264a330bbe9a"
-SRC_URI[sha256sum] = "55a36168306089009d054ccdd9d013041bfc3ab26be7033d107821f1c4949a49"
-
 S = "${WORKDIR}/libiconv-${PV}"
 
 inherit autotools pkgconfig gettext
-- 
1.7.6.4



