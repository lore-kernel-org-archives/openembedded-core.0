Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 69815610F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 16:12:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,440,1574092800"; d="scan'208";a="83307853"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Feb 2020 00:12:19 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id B4D2850A9969
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 00:02:41 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Sat, 15 Feb 2020 00:12:16 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Sat, 15 Feb 2020 00:12:17 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Feb 2020 15:44:29 -0800
Message-ID: <1581723869-21232-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1581723869-21232-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1581723869-21232-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: B4D2850A9969.A1DDD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] python3-pycairo: upgrade 1.18.2 -> 1.19.0
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
X-List-Received-Date: Fri, 14 Feb 2020 16:12:19 -0000
Content-Type: text/plain

-License-Update: "PDX-License-Identifier: LGPL-2.1-only OR MPL-1.1"
is added

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...{python3-pycairo_1.18.2.bb => python3-pycairo_1.19.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-pycairo_1.18.2.bb => python3-pycairo_1.19.0.bb} (77%)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.18.2.bb b/meta/recipes-devtools/python/python3-pycairo_1.19.0.bb
similarity index 77%
rename from meta/recipes-devtools/python/python3-pycairo_1.18.2.bb
rename to meta/recipes-devtools/python/python3-pycairo_1.19.0.bb
index 3aedf3d142..8f60834c17 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.18.2.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.19.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://cairographics.org/pycairo"
 BUGTRACKER = "http://bugs.freedesktop.org"
 SECTION = "python-devel"
 LICENSE = "LGPLv2.1 & MPLv1.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f2e071ab72978431b294a0d696327421 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=f3713ca2c28d9312ad718520b6dc3eee \
                     file://COPYING-LGPL-2.1;md5=fad9b3332be894bab9bc501572864b29 \
                     file://COPYING-MPL-1.1;md5=bfe1f75d606912a4111c90743d6c7325"
 
@@ -13,8 +13,8 @@ DEPENDS = "cairo python3"
 SRC_URI = "https://github.com/pygobject/pycairo/releases/download/v${PV}/pycairo-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "https://github.com/pygobject/pycairo/releases/"
 
-SRC_URI[md5sum] = "be2ba51f234270dec340f28f1695a95e"
-SRC_URI[sha256sum] = "dcb853fd020729516e8828ad364084e752327d4cff8505d20b13504b32b16531"
+SRC_URI[md5sum] = "38b84416021640b01250c8f8ec4c52d4"
+SRC_URI[sha256sum] = "4f5ba9374a46c98729dd3727d993f5e17ed0286fd6738ed464fe4efa0612d19c"
 
 S = "${WORKDIR}/pycairo-${PV}"
 
-- 
2.17.1




