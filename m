Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 70BE37F847
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 05:55:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,272,1569254400"; d="scan'208";a="77936358"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Nov 2019 13:55:03 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 590D94CE1A0E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 13:46:58 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 6 Nov 2019 13:55:01 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Nov 2019 13:55:21 +0800
Message-ID: <20191106055521.24238-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 590D94CE1A0E.A8C2E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] ethtool:upgrade 5.2 -> 5.3
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
X-List-Received-Date: Wed, 06 Nov 2019 05:55:07 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Refresh the following patch:
 ethtool/avoid_parallel_tests.patch

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../ethtool/ethtool/avoid_parallel_tests.patch                | 2 +-
 .../ethtool/{ethtool_5.2.bb => ethtool_5.3.bb}                | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_5.2.bb => ethtool_5.3.bb} (88%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 7c5d4f956b..153ea55060 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -19,7 +19,7 @@ index 2127fdb..4910e6f 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 5.2, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 5.3, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu])
diff --git a/meta/recipes-extended/ethtool/ethtool_5.2.bb b/meta/recipes-extended/ethtool/ethtool_5.3.bb
similarity index 88%
rename from meta/recipes-extended/ethtool/ethtool_5.2.bb
rename to meta/recipes-extended/ethtool/ethtool_5.3.bb
index 67e7fadee0..401331be39 100644
--- a/meta/recipes-extended/ethtool/ethtool_5.2.bb
+++ b/meta/recipes-extended/ethtool/ethtool_5.3.bb
@@ -11,8 +11,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[md5sum] = "79cff0d4af62b030ad28be90414b5c4a"
-SRC_URI[sha256sum] = "8ad6cb30f6e1767d9d23a5cb5f606f3b51f83e85ebf0153c1506194f6709e90b"
+SRC_URI[md5sum] = "63d1c835b861912ea0dfd52cf66a2da4"
+SRC_URI[sha256sum] = "cd2d8ea360431a2ea35ff61c276bcf2afee1ad901668a0b50ae9f1c5814756bd"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.20.1




