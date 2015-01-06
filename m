Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D2221728C3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 15:42:36 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 06 Jan 2015 07:42:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="508183845"
Received: from unknown (HELO localhost.intel.com) ([10.252.252.96])
	by orsmga003.jf.intel.com with ESMTP; 06 Jan 2015 07:36:58 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Jan 2015 07:42:19 -0800
Message-Id: <c8e55835902ead530d0a63a1b42542db2a8d0333.1420558836.git.sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1420558836.git.sgw@linux.intel.com>
References: <cover.1420558836.git.sgw@linux.intel.com>
In-Reply-To: <cover.1420558836.git.sgw@linux.intel.com>
References: <cover.1420558836.git.sgw@linux.intel.com>
Subject: [PATCH 09/12] libassuan: Upgrade to 2.2.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Jan 2015 15:42:38 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../libassuan/{libassuan_2.1.2.bb => libassuan_2.2.0.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libassuan/{libassuan_2.1.2.bb => libassuan_2.2.0.bb} (86%)

diff --git a/meta/recipes-support/libassuan/libassuan_2.1.2.bb b/meta/recipes-support/libassuan/libassuan_2.2.0.bb
similarity index 86%
rename from meta/recipes-support/libassuan/libassuan_2.1.2.bb
rename to meta/recipes-support/libassuan/libassuan_2.2.0.bb
index 97dec6a..5fc8b8c 100644
--- a/meta/recipes-support/libassuan/libassuan_2.1.2.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.2.0.bb
@@ -13,8 +13,8 @@ DEPENDS = "libgpg-error"
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libassuan/libassuan-${PV}.tar.bz2 \
 	   file://libassuan-add-pkgconfig-support.patch"
 
-SRC_URI[md5sum] = "1dc4c3e1dbfb3939bfa2d72db8e136ba"
-SRC_URI[sha256sum] = "39f8a7c9349aaaf7ccd937b90660153ec4d2d4df2465018754e5bcae5b1db77b"
+SRC_URI[md5sum] = "a104faed3e97b9c302c5d67cc22b1d60"
+SRC_URI[sha256sum] = "7df58ed70be4b694f77efd1f3b3f103c6311b6b71e04a370382f9fe8204f6ec6"
 
 BINCONFIG = "${bindir}/libassuan-config"
 
-- 
2.1.0


