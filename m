Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9BEE37E093
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 07:32:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,270,1569254400"; 
   d="scan'208";a="7696"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Nov 2019 15:32:01 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 4AFDB4CE1A0A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 15:23:58 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 5 Nov 2019 15:32:00 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Nov 2019 15:32:20 +0800
Message-ID: <20191105073220.10577-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 4AFDB4CE1A0A.ABCD0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] python3-pycairo:upgrade 1.18.1 -> 1.18.2
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
X-List-Received-Date: Tue, 05 Nov 2019 07:32:03 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{python3-pycairo_1.18.1.bb => python3-pycairo_1.18.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pycairo_1.18.1.bb => python3-pycairo_1.18.2.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.18.1.bb b/meta/recipes-devtools/python/python3-pycairo_1.18.2.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-pycairo_1.18.1.bb
rename to meta/recipes-devtools/python/python3-pycairo_1.18.2.bb
index 5aaa01a00a..3aedf3d142 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.18.1.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.18.2.bb
@@ -13,8 +13,8 @@ DEPENDS = "cairo python3"
 SRC_URI = "https://github.com/pygobject/pycairo/releases/download/v${PV}/pycairo-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "https://github.com/pygobject/pycairo/releases/"
 
-SRC_URI[md5sum] = "7610da8a40a7bed548991aa3416431d1"
-SRC_URI[sha256sum] = "70172e58b6bad7572a3518c26729b074acdde15e6fee6cbab6d3528ad552b786"
+SRC_URI[md5sum] = "be2ba51f234270dec340f28f1695a95e"
+SRC_URI[sha256sum] = "dcb853fd020729516e8828ad364084e752327d4cff8505d20b13504b32b16531"
 
 S = "${WORKDIR}/pycairo-${PV}"
 
-- 
2.20.1




