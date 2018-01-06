Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C8CA5600B3
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jan 2018 08:31:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="34927422"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jan 2018 16:31:27 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 5B489486A77F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jan 2018 16:31:24 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Sat, 6 Jan 2018 16:31:23 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 6 Jan 2018 16:31:41 +0800
Message-ID: <1515227501-18514-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 5B489486A77F.A6C6F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] blktrace: 1.1.0+gitX -> 1.2.0+gitX
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
X-List-Received-Date: Sat, 06 Jan 2018 08:31:28 -0000
Content-Type: text/plain

1.Upgrade blktrace form 1.1.0+gitX to 1.2.0+gitX
2.Delete 0001-include-sys-types.h-for-dev_t-definition.patch, since it is integrated upstream.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 ...-include-sys-types.h-for-dev_t-definition.patch | 30 ----------------------
 meta/recipes-kernel/blktrace/blktrace_git.bb       |  3 +--
 2 files changed, 1 insertion(+), 32 deletions(-)
 delete mode 100644 meta/recipes-kernel/blktrace/blktrace/0001-include-sys-types.h-for-dev_t-definition.patch

diff --git a/meta/recipes-kernel/blktrace/blktrace/0001-include-sys-types.h-for-dev_t-definition.patch b/meta/recipes-kernel/blktrace/blktrace/0001-include-sys-types.h-for-dev_t-definition.patch
deleted file mode 100644
index a4b7157..0000000
--- a/meta/recipes-kernel/blktrace/blktrace/0001-include-sys-types.h-for-dev_t-definition.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 6b5bbdfaac7f216fe8a02c4cf29e5eb2aee5a409 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 15 Sep 2015 00:01:00 +0000
-Subject: [PATCH] include sys/types.h for dev_t definition
-
-Avoids the build failures when sys/types.h does not get included
-indirectly through other headers.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- blktrace.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/blktrace.h b/blktrace.h
-index 380aec7..944fc08 100644
---- a/blktrace.h
-+++ b/blktrace.h
-@@ -5,6 +5,7 @@
- #include <limits.h>
- #include <byteswap.h>
- #include <endian.h>
-+#include <sys/types.h>
- 
- #include "blktrace_api.h"
- #include "rbtree.h"
--- 
-2.5.2
-
diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
index 770575f..814cb6c 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -7,11 +7,10 @@ DEPENDS = "libaio"
 
 SRCREV = "43fc870ce04e963def45dfc0d1ed4ea21ef10d4b"
 
-PV = "1.1.0+git${SRCPV}"
+PV = "1.2.0+git${SRCPV}"
 
 SRC_URI = "git://git.kernel.dk/blktrace.git \
            file://ldflags.patch \
-           file://0001-include-sys-types.h-for-dev_t-definition.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.7.4




