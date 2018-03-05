Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2642578A76
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 05:51:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="37468334"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Mar 2018 13:51:51 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 417A048AE761
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 13:51:48 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Mon, 5 Mar 2018 13:51:48 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Mar 2018 13:51:36 +0800
Message-ID: <1520229096-9983-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 417A048AE761.A3768
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libmpc:1.0.3 -> 1.1.0
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
X-List-Received-Date: Mon, 05 Mar 2018 05:51:51 -0000
Content-Type: text/plain

Upgrade libmpc from 1.0.3 to 1.1.0

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-support/libmpc/{libmpc_1.0.3.bb => libmpc_1.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libmpc/{libmpc_1.0.3.bb => libmpc_1.1.0.bb} (69%)

diff --git a/meta/recipes-support/libmpc/libmpc_1.0.3.bb b/meta/recipes-support/libmpc/libmpc_1.1.0.bb
similarity index 69%
rename from meta/recipes-support/libmpc/libmpc_1.0.3.bb
rename to meta/recipes-support/libmpc/libmpc_1.1.0.bb
index d37de38..2d25d38 100644
--- a/meta/recipes-support/libmpc/libmpc_1.0.3.bb
+++ b/meta/recipes-support/libmpc/libmpc_1.1.0.bb
@@ -5,8 +5,8 @@ DEPENDS = "gmp mpfr"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"
 SRC_URI = "https://ftp.gnu.org/gnu/mpc/mpc-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "d6a1d5f8ddea3abd2cc3e98f58352d26"
-SRC_URI[sha256sum] = "617decc6ea09889fb08ede330917a00b16809b8db88c29c31bfbb49cbf88ecc3"
+SRC_URI[md5sum] = "4125404e41e482ec68282a2e687f6c73"
+SRC_URI[sha256sum] = "6985c538143c1208dcb1ac42cedad6ff52e267b47e5f970183a3e75125b43c2e"
 
 UPSTREAM_CHECK_URI = "http://www.multiprecision.org/mpc/download.html"
 
-- 
2.7.4




