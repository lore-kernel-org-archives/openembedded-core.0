Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3EC307634C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 02:12:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6S2Cac2028031
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 19:12:36 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 27 Jul 2015 19:12:21 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Jul 2015 19:12:32 -0700
Message-ID: <f19dce0f56ff0b30a3b576429af3931ee5855ec8.1438049511.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1438049511.git.liezhi.yang@windriver.com>
References: <cover.1438049511.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 9/9] pax-utils: 1.0.3 -> 1.0.5
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
X-List-Received-Date: Tue, 28 Jul 2015 02:12:36 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../{pax-utils_1.0.3.bb => pax-utils_1.0.5.bb}     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/pax-utils/{pax-utils_1.0.3.bb => pax-utils_1.0.5.bb} (83%)

diff --git a/meta/recipes-devtools/pax-utils/pax-utils_1.0.3.bb b/meta/recipes-devtools/pax-utils/pax-utils_1.0.5.bb
similarity index 83%
rename from meta/recipes-devtools/pax-utils/pax-utils_1.0.3.bb
rename to meta/recipes-devtools/pax-utils/pax-utils_1.0.5.bb
index b063f20..0716a08 100644
--- a/meta/recipes-devtools/pax-utils/pax-utils_1.0.3.bb
+++ b/meta/recipes-devtools/pax-utils/pax-utils_1.0.5.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
 SRC_URI = "http://gentoo.osuosl.org/distfiles/pax-utils-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "e1c9f808a661204fbdca5e3b17da791e"
-SRC_URI[sha256sum] = "8535a94e1f77841da92d5526d2935abb786437fdf11be9ed077a78ab5e6b5670"
+SRC_URI[md5sum] = "d731f5385682a7a62ee2e7b7dacc13a7"
+SRC_URI[sha256sum] = "f69a9938e4af7912d26d585094bc0203e43571a990fdd048319088a8b8ad906f"
 
 RDEPENDS_${PN} += "bash python"
 
-- 
1.7.9.5


