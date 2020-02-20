Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 33CE5615D3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 02:29:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,462,1574092800"; d="scan'208";a="83594363"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Feb 2020 10:29:08 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 8A37750A996A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 10:19:25 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 20 Feb 2020 10:29:04 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 20 Feb 2020 10:29:11 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Feb 2020 01:41:00 -0800
Message-ID: <1582191660-130760-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1582191660-130760-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1582191660-130760-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 8A37750A996A.A115D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libxkbcommon: upgrade 0.9.1 -> 0.10.0
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
X-List-Received-Date: Thu, 20 Feb 2020 02:29:07 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{libxkbcommon_0.9.1.bb => libxkbcommon_0.10.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_0.9.1.bb => libxkbcommon_0.10.0.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.9.1.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_0.9.1.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb
index c147428a14..16d9c36eae 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.9.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb
@@ -9,8 +9,8 @@ DEPENDS = "util-macros flex-native bison-native"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "4662756fd73ab0ac9e32efdad8f807f6"
-SRC_URI[sha256sum] = "d4c6aabf0a5c1fc616f8a6a65c8a818c03773b9a87da9fbc434da5acd1199be0"
+SRC_URI[md5sum] = "2d9ad3a46b317138b5e72a91cf105451"
+SRC_URI[sha256sum] = "57c3630cdc38fb4734cd57fa349e92244f5ae3862813e533cedbd86721a0b6f2"
 
 UPSTREAM_CHECK_URI = "http://xkbcommon.org/"
 
-- 
2.17.1




