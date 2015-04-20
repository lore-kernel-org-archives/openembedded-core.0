Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 36E7B73D0F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 08:09:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3K89Pon014564
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 01:09:25 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 20 Apr 2015 01:09:25 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Apr 2015 01:09:22 -0700
Message-ID: <9208b7d265966c745fd799793a4553752c79ce97.1429517334.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1429517334.git.liezhi.yang@windriver.com>
References: <cover.1429517334.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/8] pax-utils: 0.9.2 -> 1.0.3
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
X-List-Received-Date: Mon, 20 Apr 2015 08:09:24 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../{pax-utils_0.9.2.bb => pax-utils_1.0.3.bb}     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/pax-utils/{pax-utils_0.9.2.bb => pax-utils_1.0.3.bb} (83%)

diff --git a/meta/recipes-devtools/pax-utils/pax-utils_0.9.2.bb b/meta/recipes-devtools/pax-utils/pax-utils_1.0.3.bb
similarity index 83%
rename from meta/recipes-devtools/pax-utils/pax-utils_0.9.2.bb
rename to meta/recipes-devtools/pax-utils/pax-utils_1.0.3.bb
index ea3d78e..b063f20 100644
--- a/meta/recipes-devtools/pax-utils/pax-utils_0.9.2.bb
+++ b/meta/recipes-devtools/pax-utils/pax-utils_1.0.3.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
 SRC_URI = "http://gentoo.osuosl.org/distfiles/pax-utils-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "34c41888cec67759c21333bef13e950c"
-SRC_URI[sha256sum] = "578801df0661b1b7b8fed0ce4a9859239f919fd37529907681e51091a1bcb4de"
+SRC_URI[md5sum] = "e1c9f808a661204fbdca5e3b17da791e"
+SRC_URI[sha256sum] = "8535a94e1f77841da92d5526d2935abb786437fdf11be9ed077a78ab5e6b5670"
 
 RDEPENDS_${PN} += "bash python"
 
-- 
1.7.9.5


