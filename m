Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id CBC206FF73
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 02:42:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="42039467"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Jul 2018 10:42:43 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id E0C4E4B5CBE8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 10:42:41 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Tue, 10 Jul 2018 10:42:41 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jul 2018 10:42:01 +0800
Message-ID: <20180710024207.6296-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: E0C4E4B5CBE8.AEA78
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [PATCH] ethtool:4.16 -> 4.17
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
X-List-Received-Date: Tue, 10 Jul 2018 02:42:46 -0000
Content-Type: text/plain

Upgrade ethtool from 4.16 to 4.17

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/ethtool/{ethtool_4.16.bb => ethtool_4.17.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_4.16.bb => ethtool_4.17.bb} (88%)

diff --git a/meta/recipes-extended/ethtool/ethtool_4.16.bb b/meta/recipes-extended/ethtool/ethtool_4.17.bb
similarity index 88%
rename from meta/recipes-extended/ethtool/ethtool_4.16.bb
rename to meta/recipes-extended/ethtool/ethtool_4.17.bb
index 5ccb162..844a958 100644
--- a/meta/recipes-extended/ethtool/ethtool_4.16.bb
+++ b/meta/recipes-extended/ethtool/ethtool_4.17.bb
@@ -11,8 +11,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[md5sum] = "2b50adf06fc1b033951edef5987c32f3"
-SRC_URI[sha256sum] = "25f8fc3a4b2cb2cbfe8741148d8e743127dd7c951df96d8d6dccb88741f8a27d"
+SRC_URI[md5sum] = "4dba0345a4ab9f51b4a4a9739284238d"
+SRC_URI[sha256sum] = "4130142a15f7409d18de3667998f3c99fba52fd7c8d94be7ecdabf8dcab3d6c1"
 
 inherit autotools ptest
 RDEPENDS_${PN}-ptest += "make"
-- 
2.7.4




