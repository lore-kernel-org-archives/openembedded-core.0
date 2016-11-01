Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8A31071A23
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 15:27:58 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 01 Nov 2016 08:28:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,580,1473145200"; d="scan'208";a="780876245"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Nov 2016 08:28:00 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2016 17:25:17 +0200
Message-Id: <f66ff7e584c07a3821433bb003641a1d1bac410e.1478013702.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
References: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
References: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/13] libarchive: update to 3.2.2
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
X-List-Received-Date: Tue, 01 Nov 2016 15:27:58 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../libarchive/{libarchive_3.2.1.bb => libarchive_3.2.2.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.2.1.bb => libarchive_3.2.2.bb} (94%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.2.1.bb b/meta/recipes-extended/libarchive/libarchive_3.2.2.bb
similarity index 94%
rename from meta/recipes-extended/libarchive/libarchive_3.2.1.bb
rename to meta/recipes-extended/libarchive/libarchive_3.2.2.bb
index b65b5df..cf66e9d 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.2.1.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.2.2.bb
@@ -34,8 +34,8 @@ PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4,"
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            "
 
-SRC_URI[md5sum] = "afa257047d1941a565216edbf0171e72"
-SRC_URI[sha256sum] = "72ee1a4e3fd534525f13a0ba1aa7b05b203d186e0c6072a8a4738649d0b3cfd2"
+SRC_URI[md5sum] = "1ec00b7dcaf969dd2a5712f85f23c764"
+SRC_URI[sha256sum] = "691c194ee132d1f0f7a42541f091db811bc2e56f7107e9121be2bc8c04f1060f"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.10.1


