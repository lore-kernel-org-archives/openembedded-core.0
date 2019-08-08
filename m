Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 80EC27ED57
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 01:48:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,358,1559491200"; d="scan'208";a="73180059"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Aug 2019 09:48:05 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 4EC7D4CDFCEE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 09:48:05 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 8 Aug 2019 09:48:12 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Aug 2019 18:47:46 +0800
Message-ID: <1565261266-51936-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 4EC7D4CDFCEE.AD02F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] python3-mako: 1.0.14 -> 1.1.0
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
X-List-Received-Date: Thu, 08 Aug 2019 01:48:19 -0000
Content-Type: text/plain

Upgrade python3-mako from 1.0.14 to 1.1.0.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/{python3-mako_1.0.14.bb => python3-mako_1.1.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-mako_1.0.14.bb => python3-mako_1.1.0.bb} (75%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.0.14.bb b/meta/recipes-devtools/python/python3-mako_1.1.0.bb
similarity index 75%
rename from meta/recipes-devtools/python/python3-mako_1.0.14.bb
rename to meta/recipes-devtools/python/python3-mako_1.1.0.bb
index d2f5188cc4..b139e5ab00 100644
--- a/meta/recipes-devtools/python/python3-mako_1.0.14.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.1.0.bb
@@ -8,8 +8,8 @@ PYPI_PACKAGE = "Mako"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "e162578170331f0cc6a4adb063c7c0f6"
-SRC_URI[sha256sum] = "f5a642d8c5699269ab62a68b296ff990767eb120f51e2e8f3d6afb16bdb57f4b"
+SRC_URI[md5sum] = "6c3f2da0b74af529a4c4a537d0848bf2"
+SRC_URI[sha256sum] = "a36919599a9b7dc5d86a7a8988f23a9a3a3d083070023bab23d64f7f1d1e0a4b"
 
 RDEPENDS_${PN} = "${PYTHON_PN}-html \
                   ${PYTHON_PN}-netclient \
-- 
2.17.1




