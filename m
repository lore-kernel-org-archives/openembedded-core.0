Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 11D3D78293
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 07:51:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.42,382,1500912000"; d="scan'208";a="25828745"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Sep 2017 15:51:07 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id C31E846BA6C8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 15:51:07 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Tue, 12 Sep 2017 15:51:06 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Sep 2017 15:51:12 +0800
Message-ID: <1505202674-30256-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: C31E846BA6C8.A7EDB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] at-spi2-atk: Add HOMEPAGE info into recipe file.
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
X-List-Received-Date: Tue, 12 Sep 2017 07:51:08 -0000
Content-Type: text/plain

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-support/atk/at-spi2-atk_2.24.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/atk/at-spi2-atk_2.24.1.bb b/meta/recipes-support/atk/at-spi2-atk_2.24.1.bb
index ac55081..4a0e411 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.24.1.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.24.1.bb
@@ -1,4 +1,5 @@
 SUMMARY = "AT-SPI 2 Toolkit Bridge"
+HOMEPAGE = "https://wiki.linuxfoundation.org/accessibility/d-bus"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
 
-- 
2.7.4




