Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D5E1A77DCD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 02:00:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="36992078"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Feb 2018 10:00:32 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 94B8448AE761
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 10:00:29 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Mon, 12 Feb 2018 10:00:30 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Feb 2018 10:00:32 +0800
Message-ID: <1518400832-17853-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 94B8448AE761.A49E4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] strace: 4.19 -> 4.20
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
X-List-Received-Date: Mon, 12 Feb 2018 02:00:33 -0000
Content-Type: text/plain

Upgrade strace from 4.19 to 4.20.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/strace/{strace_4.19.bb => strace_4.20.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/strace/{strace_4.19.bb => strace_4.20.bb} (93%)

diff --git a/meta/recipes-devtools/strace/strace_4.19.bb b/meta/recipes-devtools/strace/strace_4.20.bb
similarity index 93%
rename from meta/recipes-devtools/strace/strace_4.19.bb
rename to meta/recipes-devtools/strace/strace_4.20.bb
index deccf3d..d5df25e 100644
--- a/meta/recipes-devtools/strace/strace_4.19.bb
+++ b/meta/recipes-devtools/strace/strace_4.20.bb
@@ -16,8 +16,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
            file://0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch \
            "
 
-SRC_URI[md5sum] = "846a9a26e74e797f42d77a0348104072"
-SRC_URI[sha256sum] = "7c93ebc6c29280f47c24a0eb86873a99ccb2cac6512c60a60ba4ef99ab807281"
+SRC_URI[md5sum] = "f2271ab0fac49ebee9cbd7f3469227cb"
+SRC_URI[sha256sum] = "5bf3148dd17306a42566f7da17368fdd781afa147db05ea63a4ca2b50f58c523"
 
 inherit autotools ptest bluetooth
 
-- 
2.7.4




