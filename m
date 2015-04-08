Return-Path: <zhengjunling@huawei.com>
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [119.145.14.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4E33B736BA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 07:56:58 +0000 (UTC)
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CJM83016; Wed, 08 Apr 2015 15:56:56 +0800 (CST)
Received: from Patch-Test.huawei (10.107.197.245) by
	szxeml428-hub.china.huawei.com (10.82.67.183) with Microsoft SMTP
	Server id 14.3.158.1; Wed, 8 Apr 2015 15:56:45 +0800
From: Junling Zheng <zhengjunling@huawei.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Apr 2015 07:53:37 +0000
Message-ID: <1428479617-4247-1-git-send-email-zhengjunling@huawei.com>
X-Mailer: git-send-email 1.8.3.4
MIME-Version: 1.0
X-Originating-IP: [10.107.197.245]
X-CFilter-Loop: Reflected
Cc: peifeiyue@huawei.com
Subject: [PATCH] file: add -P prompt into usage info
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
X-List-Received-Date: Wed, 08 Apr 2015 07:57:00 -0000
Content-Type: text/plain

Currently, file's usage info doesn't contain -P prompt. So add it.

Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
---
 .../file/0001-Add-P-prompt-into-Usage-info.patch   | 39 ++++++++++++++++++++++
 meta/recipes-devtools/file/file_5.22.bb            |  3 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/file/file/0001-Add-P-prompt-into-Usage-info.patch

diff --git a/meta/recipes-devtools/file/file/0001-Add-P-prompt-into-Usage-info.patch b/meta/recipes-devtools/file/file/0001-Add-P-prompt-into-Usage-info.patch
new file mode 100644
index 0000000..95e1291
--- /dev/null
+++ b/meta/recipes-devtools/file/file/0001-Add-P-prompt-into-Usage-info.patch
@@ -0,0 +1,39 @@
+From 08abf944b2bff27b6dd325dd15b4861cebef113a Mon Sep 17 00:00:00 2001
+From: Junling Zheng <zhengjunling@huawei.com>
+Date: Wed, 8 Apr 2015 03:26:57 +0000
+Subject: [PATCH] Add -P prompt into Usage info
+
+Currently, Usage info doesn't include -P prompt, add it:
+
+root@arma9el:~# file
+Usage: file [-bcEhikLlNnprsvz0] [--apple] [--mime-encoding] [--mime-type]
+            [-e testname] [-F separator] [-f namefile] [-m magicfiles]
+            [-P parameter=limits] file ...
+       file -C [-m magicfiles]
+       file [--help]
+
+Upstream-Status: Submitted
+
+Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
+---
+ src/file.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/file.c b/src/file.c
+index 546fd8b..beef868 100644
+--- a/src/file.c
++++ b/src/file.c
+@@ -76,8 +76,8 @@ int getopt_long(int argc, char * const *argv, const char *optstring, const struc
+ # define USAGE  \
+     "Usage: %s [" FILE_FLAGS \
+ 	"] [--apple] [--mime-encoding] [--mime-type]\n" \
+-    "            [-e testname] [-F separator] [-f namefile] [-m magicfiles] " \
+-    "file ...\n" \
++    "            [-e testname] [-F separator] [-f namefile] [-m magicfiles]\n" \
++    "            [-P parameter=limits] file ...\n" \
+     "       %s -C [-m magicfiles]\n" \
+     "       %s [--help]\n"
+ 
+-- 
+1.8.3.4
+
diff --git a/meta/recipes-devtools/file/file_5.22.bb b/meta/recipes-devtools/file/file_5.22.bb
index 9c6bb38..e8d4dae 100644
--- a/meta/recipes-devtools/file/file_5.22.bb
+++ b/meta/recipes-devtools/file/file_5.22.bb
@@ -12,7 +12,8 @@ DEPENDS = "zlib file-native"
 DEPENDS_class-native = "zlib-native"
 
 SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz \
-           file://debian-742262.patch \
+	   file://debian-742262.patch \
+	   file://0001-Add-P-prompt-into-Usage-info.patch \
           "
 
 SRC_URI[md5sum] = "8fb13e5259fe447e02c4a37bc7225add"
-- 
1.8.3.4


