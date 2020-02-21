Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5F60261604
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 03:01:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,466,1574092800"; d="scan'208";a="83668231"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Feb 2020 11:01:35 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 1B5EA49DF126
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 10:51:52 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 21 Feb 2020 11:01:32 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 21 Feb 2020 11:01:33 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Feb 2020 02:09:39 -0800
Message-ID: <1582279780-21243-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 1B5EA49DF126.A0BE5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] nspr: upgrade 4.24 -> 4.25
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
X-List-Received-Date: Fri, 21 Feb 2020 03:01:34 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-support/nspr/{nspr_4.24.bb => nspr_4.25.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/nspr/{nspr_4.24.bb => nspr_4.25.bb} (97%)

diff --git a/meta/recipes-support/nspr/nspr_4.24.bb b/meta/recipes-support/nspr/nspr_4.25.bb
similarity index 97%
rename from meta/recipes-support/nspr/nspr_4.24.bb
rename to meta/recipes-support/nspr/nspr_4.25.bb
index e98fe83ed3..1de26e1eed 100644
--- a/meta/recipes-support/nspr/nspr_4.24.bb
+++ b/meta/recipes-support/nspr/nspr_4.25.bb
@@ -23,8 +23,8 @@ CACHED_CONFIGUREVARS_append_libc-musl = " CFLAGS='${CFLAGS} -D_PR_POLL_AVAILABLE
 UPSTREAM_CHECK_URI = "http://ftp.mozilla.org/pub/nspr/releases/"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+)/"
 
-SRC_URI[md5sum] = "d630c2111e1db6d2ec2069aad22b4121"
-SRC_URI[sha256sum] = "90a59a0df6a11528749647fe18401cc7e03881e3e63c309f8c520ce06dd413d0"
+SRC_URI[md5sum] = "4ca4d75a424f30fcdc766296bb103d17"
+SRC_URI[sha256sum] = "0bc309be21f91da4474c56df90415101c7f0c7c7cab2943cd943cd7896985256"
 
 CVE_PRODUCT = "netscape_portable_runtime"
 
-- 
2.17.1




