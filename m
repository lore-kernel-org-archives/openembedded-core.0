Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D9E9178857
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jan 2018 08:31:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="34927423"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jan 2018 16:31:39 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 28382486A77F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jan 2018 16:31:37 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Sat, 6 Jan 2018 16:31:36 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 6 Jan 2018 16:31:55 +0800
Message-ID: <1515227515-18557-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 28382486A77F.A52BA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [PATCH] bjam-native: 1.65.1 -> 1.66.0
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
X-List-Received-Date: Sat, 06 Jan 2018 08:31:39 -0000
Content-Type: text/plain

1.Upgrade bjam-native form 1.65.1 to 1.66.0
2.Upgrade boost form 1.65.1 to 1.66.0

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../boost/{bjam-native_1.65.1.bb => bjam-native_1.66.0.bb}            | 0
 meta/recipes-support/boost/{boost-1.65.1.inc => boost-1.66.0.inc}     | 4 ++--
 meta/recipes-support/boost/{boost_1.65.1.bb => boost_1.66.0.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/boost/{bjam-native_1.65.1.bb => bjam-native_1.66.0.bb} (100%)
 rename meta/recipes-support/boost/{boost-1.65.1.inc => boost-1.66.0.inc} (85%)
 rename meta/recipes-support/boost/{boost_1.65.1.bb => boost_1.66.0.bb} (100%)

diff --git a/meta/recipes-support/boost/bjam-native_1.65.1.bb b/meta/recipes-support/boost/bjam-native_1.66.0.bb
similarity index 100%
rename from meta/recipes-support/boost/bjam-native_1.65.1.bb
rename to meta/recipes-support/boost/bjam-native_1.66.0.bb
diff --git a/meta/recipes-support/boost/boost-1.65.1.inc b/meta/recipes-support/boost/boost-1.66.0.inc
similarity index 85%
rename from meta/recipes-support/boost/boost-1.65.1.inc
rename to meta/recipes-support/boost/boost-1.66.0.inc
index f0ca88c..fe2b863 100644
--- a/meta/recipes-support/boost/boost-1.65.1.inc
+++ b/meta/recipes-support/boost/boost-1.66.0.inc
@@ -12,8 +12,8 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/boost/boost/${PV}/${BOOST_P}.tar.bz2"
-SRC_URI[md5sum] = "41d7542ce40e171f3f7982aff008ff0d"
-SRC_URI[sha256sum] = "9807a5d16566c57fd74fb522764e0b134a8bbe6b6e8967b83afefd30dcd3be81"
+SRC_URI[md5sum] = "b2dfbd6c717be4a7bb2d88018eaccf75"
+SRC_URI[sha256sum] = "5721818253e6a0989583192f96782c4a98eb6204965316df9f5ad75819225ca9"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "boostorg/release/(?P<pver>.*)/source/"
diff --git a/meta/recipes-support/boost/boost_1.65.1.bb b/meta/recipes-support/boost/boost_1.66.0.bb
similarity index 100%
rename from meta/recipes-support/boost/boost_1.65.1.bb
rename to meta/recipes-support/boost/boost_1.66.0.bb
-- 
2.7.4




