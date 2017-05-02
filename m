Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4888D71D7E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 May 2017 12:51:58 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 May 2017 05:51:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,405,1488873600"; d="scan'208";a="1163544032"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 02 May 2017 05:51:58 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 May 2017 15:51:49 +0300
Message-Id: <20170502125151.5095-4-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170502125151.5095-1-alexander.kanavin@linux.intel.com>
References: <20170502125151.5095-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 4/6] libpthread-stubs: upgrade to 0.4
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
X-List-Received-Date: Tue, 02 May 2017 12:51:58 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../xorg-lib/{libpthread-stubs_0.3.bb => libpthread-stubs_0.4.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libpthread-stubs_0.3.bb => libpthread-stubs_0.4.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.3.bb b/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-lib/libpthread-stubs_0.3.bb
rename to meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb
index 5514c7f5e84..a6998412550 100644
--- a/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb
@@ -14,8 +14,8 @@ ALLOW_EMPTY_${PN} = "1"
 
 SRC_URI = "http://xcb.freedesktop.org/dist/libpthread-stubs-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "e8fa31b42e13f87e8f5a7a2b731db7ee"
-SRC_URI[sha256sum] = "35b6d54e3cc6f3ba28061da81af64b9a92b7b757319098172488a660e3d87299"
+SRC_URI[md5sum] = "48c1544854a94db0e51499cc3afd797f"
+SRC_URI[sha256sum] = "e4d05911a3165d3b18321cc067fdd2f023f06436e391c6a28dff618a78d2e733"
 
 inherit autotools pkgconfig
 
-- 
2.11.0


