Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C0518784DC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 09:20:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.41,377,1498492800"; d="scan'208";a="23592227"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Aug 2017 17:20:02 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 8E69E472438E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 17:20:00 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 15 Aug 2017 17:19:59 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Aug 2017 17:19:43 +0800
Message-ID: <1502788783-997-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: 8E69E472438E.A56F7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] nspr: 4.14 -> 4.16
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
X-List-Received-Date: Tue, 15 Aug 2017 09:20:03 -0000
Content-Type: text/plain

Upgrade nspr from 4.14 to 4.16

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-support/nspr/{nspr_4.14.bb => nspr_4.16.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/nspr/{nspr_4.14.bb => nspr_4.16.bb} (96%)

diff --git a/meta/recipes-support/nspr/nspr_4.14.bb b/meta/recipes-support/nspr/nspr_4.16.bb
similarity index 96%
rename from meta/recipes-support/nspr/nspr_4.14.bb
rename to meta/recipes-support/nspr/nspr_4.16.bb
index b0892a1..a634afb 100644
--- a/meta/recipes-support/nspr/nspr_4.14.bb
+++ b/meta/recipes-support/nspr/nspr_4.16.bb
@@ -22,8 +22,8 @@ CACHED_CONFIGUREVARS_append_libc-musl = " CFLAGS='${CFLAGS} -D_PR_POLL_AVAILABLE
 UPSTREAM_CHECK_URI = "http://ftp.mozilla.org/pub/nspr/releases/"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+)/"
 
-SRC_URI[md5sum] = "743f6b7888a614da9927400874054d8c"
-SRC_URI[sha256sum] = "64fc18826257403a9132240aa3c45193d577a84b08e96f7e7770a97c074d17d5"
+SRC_URI[md5sum] = "42fd8963a4b394f62d43ba604f03fab7"
+SRC_URI[sha256sum] = "9b3102d97665504aeee73363c11a21c062ad67a2522242368b7f019f96a53cd1"
 
 CVE_PRODUCT = "netscape_portable_runtime"
 
-- 
2.7.4




