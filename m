Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C96EF745AD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 07:40:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5S7eNN6011184
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 00:40:23 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Thu, 28 Jun 2018 00:40:23 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jun 2018 15:39:46 +0800
Message-ID: <1530171589-21641-2-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1530171589-21641-1-git-send-email-yi.zhao@windriver.com>
References: <1530171589-21641-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [PATCH 1/4] file: update to 5.33
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
X-List-Received-Date: Thu, 28 Jun 2018 07:40:23 -0000
Content-Type: text/plain

Drop 0001-Add-P-prompt-into-Usage-info.patch since it is already fixed
upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../file/0001-Add-P-prompt-into-Usage-info.patch   | 39 ----------------------
 .../file/{file_5.32.bb => file_5.33.bb}            |  3 +-
 2 files changed, 1 insertion(+), 41 deletions(-)
 delete mode 100644 meta/recipes-devtools/file/file/0001-Add-P-prompt-into-Usage-info.patch
 rename meta/recipes-devtools/file/{file_5.32.bb => file_5.33.bb} (92%)

diff --git a/meta/recipes-devtools/file/file/0001-Add-P-prompt-into-Usage-info.patch b/meta/recipes-devtools/file/file/0001-Add-P-prompt-into-Usage-info.patch
deleted file mode 100644
index 8a16b2c..0000000
--- a/meta/recipes-devtools/file/file/0001-Add-P-prompt-into-Usage-info.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 08abf944b2bff27b6dd325dd15b4861cebef113a Mon Sep 17 00:00:00 2001
-From: Junling Zheng <zhengjunling@huawei.com>
-Date: Wed, 8 Apr 2015 03:26:57 +0000
-Subject: [PATCH] Add -P prompt into Usage info
-
-Currently, Usage info doesn't include -P prompt, add it:
-
-root@arma9el:~# file
-Usage: file [-bcEhikLlNnprsvz0] [--apple] [--mime-encoding] [--mime-type]
-            [-e testname] [-F separator] [-f namefile] [-m magicfiles]
-            [-P parameter=limits] file ...
-       file -C [-m magicfiles]
-       file [--help]
-
-Upstream-Status: Submitted
-
-Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
----
- src/file.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/file.c b/src/file.c
-index 2b15e21..e5a957b 100644
---- a/src/file.c
-+++ b/src/file.c
-@@ -76,8 +76,8 @@ int getopt_long(int argc, char * const *argv, const char *optstring, const struc
- # define USAGE  \
-     "Usage: %s [" FILE_FLAGS \
- 	"] [--apple] [--extension] [--mime-encoding] [--mime-type]\n" \
--    "            [-e testname] [-F separator] [-f namefile] [-m magicfiles] " \
--    "file ...\n" \
-+    "            [-e testname] [-F separator] [-f namefile] [-m magicfiles]\n " \
-+    "            [-P parameter=limits] file ...\n" \
-     "       %s -C [-m magicfiles]\n" \
-     "       %s [--help]\n"
- 
--- 
-1.8.3.4
-
diff --git a/meta/recipes-devtools/file/file_5.32.bb b/meta/recipes-devtools/file/file_5.33.bb
similarity index 92%
rename from meta/recipes-devtools/file/file_5.32.bb
rename to meta/recipes-devtools/file/file_5.33.bb
index 5e15925..4126422 100644
--- a/meta/recipes-devtools/file/file_5.32.bb
+++ b/meta/recipes-devtools/file/file_5.33.bb
@@ -16,10 +16,9 @@ UPSTREAM_CHECK_GITTAGREGEX = "FILE(?P<pver>(?!6_23).+)"
 
 SRC_URI = "git://github.com/file/file.git \
         file://debian-742262.patch \
-        file://0001-Add-P-prompt-into-Usage-info.patch \
         "
 
-SRCREV = "d474e35513940dbca039b510b4de705b44f5bd9c"
+SRCREV = "219846094c7593e27453e62855e61181089c48cf"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.7.4


