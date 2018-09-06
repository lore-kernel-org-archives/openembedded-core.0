Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5453C7952D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 08:03:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8683F11021095
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Sep 2018 01:03:15 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 6 Sep 2018 01:03:14 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Sep 2018 01:03:14 -0700
Message-ID: <20180906080314.61128-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] libxkbcommon: Upgrade to 0.8.2
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
X-List-Received-Date: Thu, 06 Sep 2018 08:03:14 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../xorg-lib/{libxkbcommon_0.8.0.bb => libxkbcommon_0.8.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_0.8.0.bb => libxkbcommon_0.8.2.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.0.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.2.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.0.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.2.bb
index 050d0b740b..8cf508b0bf 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.2.bb
@@ -9,8 +9,8 @@ DEPENDS = "util-macros flex-native bison-native"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "7d0e4c4a137d0ac45bf6b328c84c3a81"
-SRC_URI[sha256sum] = "e829265db04e0aebfb0591b6dc3377b64599558167846c3f5ee5c5e53641fe6d"
+SRC_URI[md5sum] = "5f7f8533f907ebcfb1cf8dceb9501264"
+SRC_URI[sha256sum] = "7ab8c4b3403d89d01898066b72cb6069bddeb5af94905a65368f671a026ed58c"
 
 UPSTREAM_CHECK_URI = "http://xkbcommon.org/"
 
-- 
2.17.1


