Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E7E286BE2A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 05:09:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,299,1569254400"; d="scan'208";a="78394226"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Nov 2019 13:09:10 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 7F3864CE14FE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 13:01:00 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 13 Nov 2019 13:09:09 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Nov 2019 13:09:43 +0800
Message-ID: <20191113050943.25907-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 7F3864CE14FE.A81B0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] python3-six:upgrade 1.12.0 -> 1.13.0
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
X-List-Received-Date: Wed, 13 Nov 2019 05:09:10 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-License-Update: Copyright year updated to 2019.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/python/python-six.inc                 | 6 +++---
 .../python/{python3-six_1.12.0.bb => python3-six_1.13.0.bb} | 0
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-six_1.12.0.bb => python3-six_1.13.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-six.inc b/meta/recipes-devtools/python/python-six.inc
index c706dcaf25..c386090b4b 100644
--- a/meta/recipes-devtools/python/python-six.inc
+++ b/meta/recipes-devtools/python/python-six.inc
@@ -2,10 +2,10 @@ SUMMARY = "Python 2 and 3 compatibility library"
 HOMEPAGE = "https://pypi.python.org/pypi/six/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=83e0f622bd5ac7d575dbd83d094d69b5"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f82eb3a1a7fade60bda5980935084b62"
 
-SRC_URI[md5sum] = "9ae5d1feed8c0215f4ae4adcd9207fcb"
-SRC_URI[sha256sum] = "d16a0141ec1a18405cd4ce8b4613101da75da0e9a7aec5bdd4fa804d0e0eba73"
+SRC_URI[md5sum] = "e92c23c882c7d5564ce5773fe31b2771"
+SRC_URI[sha256sum] = "30f610279e8b2578cab6db20741130331735c781b56053c59c4076da27f06b66"
 
 inherit pypi
 
diff --git a/meta/recipes-devtools/python/python3-six_1.12.0.bb b/meta/recipes-devtools/python/python3-six_1.13.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-six_1.12.0.bb
rename to meta/recipes-devtools/python/python3-six_1.13.0.bb
-- 
2.20.1




