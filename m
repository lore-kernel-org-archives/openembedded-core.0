Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tfoss-0007zw-P7
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 10:33:48 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Dec 2012 01:18:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,214,1355126400"; d="scan'208";a="228661848"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga001.jf.intel.com with ESMTP; 04 Dec 2012 01:18:21 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Dec 2012 11:19:03 +0200
Message-Id: <be5d06a9ed199aad63e2749dda3c44e3c5f4ba9d.1354611254.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1354611254.git.constantinx.musca@intel.com>
References: <cover.1354611254.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1354611254.git.constantinx.musca@intel.com>
References: <cover.1354611254.git.constantinx.musca@intel.com>
Subject: [PATCH 3/5] libxslt: upgrade to 1.1.28
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
X-List-Received-Date: Tue, 04 Dec 2012 09:33:48 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-support/libxslt/{libxslt_1.1.27.bb => libxslt_1.1.28.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libxslt/{libxslt_1.1.27.bb => libxslt_1.1.28.bb} (87%)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.27.bb b/meta/recipes-support/libxslt/libxslt_1.1.28.bb
similarity index 87%
rename from meta/recipes-support/libxslt/libxslt_1.1.27.bb
rename to meta/recipes-support/libxslt/libxslt_1.1.28.bb
index 925c860..3f89e78 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.27.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.28.bb
@@ -12,8 +12,8 @@ PR = "r0"
 SRC_URI = "ftp://xmlsoft.org/libxslt//libxslt-${PV}.tar.gz \
            file://pkgconfig_fix.patch"
 
-SRC_URI[md5sum] = "4d01ff464b9ea7236925a1adf147c7f8"
-SRC_URI[sha256sum] = "b6a8d9a421f2630999ca91d9f8c091ee8ea2d580e6be84c1d21b2a45e11e7e26"
+SRC_URI[md5sum] = "9667bf6f9310b957254fdcf6596600b7"
+SRC_URI[sha256sum] = "5fc7151a57b89c03d7b825df5a0fae0a8d5f05674c0e7cf2937ecec4d54a028c"
 S = "${WORKDIR}/libxslt-${PV}"
 
 inherit autotools pkgconfig binconfig lib_package
-- 
1.7.11.7



