Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 236627873C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 03:01:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="35796242"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Jan 2018 11:01:29 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id F185748AEA1B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 11:01:29 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 24 Jan 2018 11:01:28 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Jan 2018 11:01:37 +0800
Message-ID: <1516762897-11869-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1516762897-11869-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1516762897-11869-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: F185748AEA1B.A8E22
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] e2fsprogs: 1.43.7 -> 1.43.8
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
X-List-Received-Date: Wed, 24 Jan 2018 03:01:30 -0000
Content-Type: text/plain

Upgrade e2fsprogs from 1.43.7 to 1.43.8.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../e2fsprogs/{e2fsprogs_1.43.7.bb => e2fsprogs_1.43.8.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.43.7.bb => e2fsprogs_1.43.8.bb} (98%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.7.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb
similarity index 98%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.7.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb
index 168eecf..c42260c 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.7.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb
@@ -11,7 +11,7 @@ SRC_URI += "file://remove.ldconfig.call.patch \
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch"
 
-SRCREV = "4c5e6cd6defb83f1b35a5ef6fccd68c86874ee06"
+SRCREV = "af2eac481cf426c05ae12b946396980e16c8ab19"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
-- 
2.7.4




