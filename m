Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 56FE1755C7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 15:26:58 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 22 May 2015 08:26:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,476,1427785200"; d="scan'208";a="575483086"
Received: from ihoshino-mobl.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.255.86.199])
	by orsmga003.jf.intel.com with ESMTP; 22 May 2015 08:26:52 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2015 08:26:47 -0700
Message-Id: <cdf919ea92594c34f66d6d3073aba80db5be7299.1432308259.git.sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <282662bc963d23782bb7c09425fec988fd4b6a69.1432308259.git.sgw@linux.intel.com>
References: <282662bc963d23782bb7c09425fec988fd4b6a69.1432308259.git.sgw@linux.intel.com>
In-Reply-To: <cover.1432308259.git.sgw@linux.intel.com>
References: <cover.1432308259.git.sgw@linux.intel.com>
Subject: [PATCH 2/3] libassuan: Upgrade to 2.2.1
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
X-List-Received-Date: Fri, 22 May 2015 15:26:58 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../libassuan/{libassuan_2.2.0.bb => libassuan_2.2.1.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libassuan/{libassuan_2.2.0.bb => libassuan_2.2.1.bb} (86%)

diff --git a/meta/recipes-support/libassuan/libassuan_2.2.0.bb b/meta/recipes-support/libassuan/libassuan_2.2.1.bb
similarity index 86%
rename from meta/recipes-support/libassuan/libassuan_2.2.0.bb
rename to meta/recipes-support/libassuan/libassuan_2.2.1.bb
index d3a61cc..75ae43f 100644
--- a/meta/recipes-support/libassuan/libassuan_2.2.0.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.2.1.bb
@@ -13,8 +13,8 @@ DEPENDS = "libgpg-error"
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libassuan/libassuan-${PV}.tar.bz2 \
 	   file://libassuan-add-pkgconfig-support.patch"
 
-SRC_URI[md5sum] = "a104faed3e97b9c302c5d67cc22b1d60"
-SRC_URI[sha256sum] = "7df58ed70be4b694f77efd1f3b3f103c6311b6b71e04a370382f9fe8204f6ec6"
+SRC_URI[md5sum] = "6290e750ee87be3bfd9579fc44c6a186"
+SRC_URI[sha256sum] = "949285bb79345362cb72a40c798defefc007031c60f2f10251720bf60a9de2de"
 
 BINCONFIG = "${bindir}/libassuan-config"
 
-- 
2.1.0


