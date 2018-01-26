Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C2F3771B9E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 08:59:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="36021523"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Jan 2018 16:59:55 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 2B37F49F19B7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 16:59:57 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Fri, 26 Jan 2018 16:59:56 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Jan 2018 17:00:08 +0800
Message-ID: <1516957210-15531-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1516957210-15531-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1516957210-15531-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 2B37F49F19B7.A8EAA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] linux-libc-headers: 4.12 -> 4.14.13
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
X-List-Received-Date: Fri, 26 Jan 2018 08:59:57 -0000
Content-Type: text/plain

Upgrade linux-libc-headers from 4.12 to 4.14.13.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../{linux-libc-headers_4.12.bb => linux-libc-headers_4.14.13.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_4.12.bb => linux-libc-headers_4.14.13.bb} (71%)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.12.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.14.13.bb
similarity index 71%
rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.12.bb
rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.14.13.bb
index f0d0abf..455ad4b 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.12.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.14.13.bb
@@ -7,5 +7,5 @@ SRC_URI_append_libc-musl = "\
     file://0001-libc-compat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch \
    "
 
-SRC_URI[md5sum] = "fc454157e2d024d401a60905d6481c6b"
-SRC_URI[sha256sum] = "a45c3becd4d08ce411c14628a949d08e2433d8cdeca92036c7013980e93858ab"
+SRC_URI[md5sum] = "4e8bb562f8fd33d5ef1feb0435ed2b02"
+SRC_URI[sha256sum] = "4ab46d1b5a0f8ef83b80760f89ae4f5c88431b19b3cf79ffa0c66d6b33e45772"
-- 
2.7.4




