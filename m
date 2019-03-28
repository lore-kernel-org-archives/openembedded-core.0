Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 522B560079
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 01:25:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,278,1549900800"; d="scan'208";a="57875335"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Mar 2019 09:25:32 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 0A1E14CD5D22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 09:25:30 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 28 Mar 2019 09:25:30 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Mar 2019 09:26:06 +0800
Message-ID: <20190328012606.18550-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 0A1E14CD5D22.A9FEE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] ethtool:upgrade 4.19 -> 5.0
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
X-List-Received-Date: Thu, 28 Mar 2019 01:25:33 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Upgrade from ethtool_4.19.bb to ethtool_5.0.bb

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../ethtool/{ethtool_4.19.bb => ethtool_5.0.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_4.19.bb => ethtool_5.0.bb} (88%)

diff --git a/meta/recipes-extended/ethtool/ethtool_4.19.bb b/meta/recipes-extended/ethtool/ethtool_5.0.bb
similarity index 88%
rename from meta/recipes-extended/ethtool/ethtool_4.19.bb
rename to meta/recipes-extended/ethtool/ethtool_5.0.bb
index 74e255c24b..76cdf9c4e7 100644
--- a/meta/recipes-extended/ethtool/ethtool_4.19.bb
+++ b/meta/recipes-extended/ethtool/ethtool_5.0.bb
@@ -11,8 +11,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[md5sum] = "a533db1d202724822c4ef297643fac12"
-SRC_URI[sha256sum] = "e8e88f5a79c78e542cd84fee60b67dbf29cee63e4760e8d61544fea74c761ad1"
+SRC_URI[md5sum] = "8998c9eb7e491b0aec420a807ce52ba6"
+SRC_URI[sha256sum] = "cc53a6d4d5643f8993ef20d6b638f88d9035529a9e777e222073c3a5b9237178"
 
 inherit autotools ptest
 RDEPENDS_${PN}-ptest += "make"
-- 
2.20.1




