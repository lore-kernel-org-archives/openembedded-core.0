Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1053A73180
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 15:11:29 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Dec 2015 07:11:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,441,1444719600"; d="scan'208";a="875739941"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 17 Dec 2015 07:11:28 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Dec 2015 17:08:46 +0200
Message-Id: <e8a4619a9aa371a5c9866a7844f3126f0232d6fe.1450364672.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
References: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
References: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 09/17] libassuan: update to 2.4.2
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
X-List-Received-Date: Thu, 17 Dec 2015 15:11:29 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../libassuan/{libassuan_2.2.1.bb => libassuan_2.4.2.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libassuan/{libassuan_2.2.1.bb => libassuan_2.4.2.bb} (86%)

diff --git a/meta/recipes-support/libassuan/libassuan_2.2.1.bb b/meta/recipes-support/libassuan/libassuan_2.4.2.bb
similarity index 86%
rename from meta/recipes-support/libassuan/libassuan_2.2.1.bb
rename to meta/recipes-support/libassuan/libassuan_2.4.2.bb
index 75ae43f..57eab38 100644
--- a/meta/recipes-support/libassuan/libassuan_2.2.1.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.4.2.bb
@@ -13,8 +13,8 @@ DEPENDS = "libgpg-error"
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libassuan/libassuan-${PV}.tar.bz2 \
 	   file://libassuan-add-pkgconfig-support.patch"
 
-SRC_URI[md5sum] = "6290e750ee87be3bfd9579fc44c6a186"
-SRC_URI[sha256sum] = "949285bb79345362cb72a40c798defefc007031c60f2f10251720bf60a9de2de"
+SRC_URI[md5sum] = "70151995c2330ae1261c0a7ca34cf478"
+SRC_URI[sha256sum] = "bb06dc81380b74bf1b64d5849be5c0409a336f3b4c45f20ac688e86d1b5bcb20"
 
 BINCONFIG = "${bindir}/libassuan-config"
 
-- 
2.6.2


