Return-Path: <bianyq@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5682A77EF7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 06:49:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="21435635"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Jul 2017 14:48:56 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 31EF24D14A77
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 14:48:53 +0800 (CST)
Received: from localhost.localdomain (10.167.226.29) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 18 Jul 2017 14:48:52 +0800
From: Bian Yaqin <bianyq@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Jul 2017 08:48:28 -0700
Message-ID: <1500392908-2775-1-git-send-email-bianyq@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.29]
X-yoursite-MailScanner-ID: 31EF24D14A77.A3F74
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: bianyq@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH v2] screen: 4.5.1 -> 4.6.0
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
X-List-Received-Date: Tue, 18 Jul 2017 06:49:03 -0000
Content-Type: text/plain

Update screen from 4.5.1 to 4.6.0

Signed-off-by: Bian Yaqin <bianyq@cn.fujitsu.com>
---
 meta/recipes-extended/screen/{screen_4.5.1.bb => screen_4.6.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/screen/{screen_4.5.1.bb => screen_4.6.0.bb} (93%)

diff --git a/meta/recipes-extended/screen/screen_4.5.1.bb b/meta/recipes-extended/screen/screen_4.6.0.bb
similarity index 93%
rename from meta/recipes-extended/screen/screen_4.5.1.bb
rename to meta/recipes-extended/screen/screen_4.6.0.bb
index 32c1a5a..a41efe9 100644
--- a/meta/recipes-extended/screen/screen_4.5.1.bb
+++ b/meta/recipes-extended/screen/screen_4.6.0.bb
@@ -26,8 +26,8 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://0001-fix-for-multijob-build.patch \
           "
 
-SRC_URI[md5sum] = "a8c5da2f42f8a18fa4dada2419d1549b"
-SRC_URI[sha256sum] = "97db2114dd963b016cd4ded34831955dcbe3251e5eee45ac2606e67e9f097b2d"
+SRC_URI[md5sum] = "af60f716c4ec134712b923ef6cd93848"
+SRC_URI[sha256sum] = "9433706b653e941cc4c745f28e252e57be2a141eded923e61cc2c4a09768fed4"
 
 inherit autotools texinfo
 
-- 
2.7.4




