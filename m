Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0C9EB71979
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Aug 2017 09:11:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.41,320,1498492800"; d="scan'208";a="22219144"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Aug 2017 17:11:48 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 676D74722780
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Aug 2017 17:11:47 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Fri, 4 Aug 2017 17:11:46 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 4 Aug 2017 17:11:29 +0800
Message-ID: <1501837889-5749-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: 676D74722780.A37DA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH v3] openssl: cryptodev enable method modified
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
X-List-Received-Date: Fri, 04 Aug 2017 09:11:53 -0000
Content-Type: text/plain

Use PACKAGECONFIG to enable cryptodev.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-connectivity/openssl/openssl_1.0.2l.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
index 7c8f18b..0535c85 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
@@ -2,6 +2,7 @@ require openssl.inc
 
 # For target side versions of openssl enable support for OCF Linux driver
 # if they are available.
+PACKAGECONFIG ?= "cryptodev-linux"
 PACKAGECONFIG[cryptodev-linux] = "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS,,cryptodev-linux"
 CFLAG += "${PACKAGECONFIG_CONFARGS}"
 
-- 
2.7.4




