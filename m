Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id F18026FF73
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 02:42:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="42039468"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Jul 2018 10:42:43 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id CBC784B5CBF0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 10:42:42 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Tue, 10 Jul 2018 10:42:42 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jul 2018 10:42:02 +0800
Message-ID: <20180710024207.6296-2-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180710024207.6296-1-hongl.fnst@cn.fujitsu.com>
References: <20180710024207.6296-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: CBC784B5CBF0.A0E61
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [PATCH] file:5.32 -> 5.33
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
X-List-Received-Date: Tue, 10 Jul 2018 02:42:45 -0000
Content-Type: text/plain

Upgrade file from 5.32 to 5.33

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../file/file/0001-Add-P-prompt-into-Usage-info.patch      | 14 ++++++++------
 meta/recipes-devtools/file/{file_5.32.bb => file_5.33.bb}  |  2 +-
 2 files changed, 9 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/file/{file_5.32.bb => file_5.33.bb} (96%)

diff --git a/meta/recipes-devtools/file/file/0001-Add-P-prompt-into-Usage-info.patch b/meta/recipes-devtools/file/file/0001-Add-P-prompt-into-Usage-info.patch
index 8a16b2c..0d12d86 100644
--- a/meta/recipes-devtools/file/file/0001-Add-P-prompt-into-Usage-info.patch
+++ b/meta/recipes-devtools/file/file/0001-Add-P-prompt-into-Usage-info.patch
@@ -23,16 +23,18 @@ diff --git a/src/file.c b/src/file.c
 index 2b15e21..e5a957b 100644
 --- a/src/file.c
 +++ b/src/file.c
-@@ -76,8 +76,8 @@ int getopt_long(int argc, char * const *argv, const char *optstring, const struc
+@@ -87,9 +87,8 @@ int getopt_long(int, char * const *, const char *,
+
  # define USAGE  \
-     "Usage: %s [" FILE_FLAGS \
- 	"] [--apple] [--extension] [--mime-encoding] [--mime-type]\n" \
--    "            [-e testname] [-F separator] [-f namefile] [-m magicfiles] " \
--    "file ...\n" \
+     "Usage: %s [-" FILE_FLAGS "] [--apple] [--extension] [--mime-encoding]\n" \
+-    "            [--mime-type] [-e <testname>] [-F <separator>] " \
+-    " [-f <namefile>]\n" \
+-    "            [-m <magicfiles>] [-P <parameter=value>] <file> ...\n" \
 +    "            [-e testname] [-F separator] [-f namefile] [-m magicfiles]\n " \
 +    "            [-P parameter=limits] file ...\n" \
-     "       %s -C [-m magicfiles]\n" \
+     "       %s -C [-m <magicfiles>]\n" \
      "       %s [--help]\n"
+
  
 -- 
 1.8.3.4
diff --git a/meta/recipes-devtools/file/file_5.32.bb b/meta/recipes-devtools/file/file_5.33.bb
similarity index 96%
rename from meta/recipes-devtools/file/file_5.32.bb
rename to meta/recipes-devtools/file/file_5.33.bb
index 5e15925..c1688ff 100644
--- a/meta/recipes-devtools/file/file_5.32.bb
+++ b/meta/recipes-devtools/file/file_5.33.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://github.com/file/file.git \
         file://0001-Add-P-prompt-into-Usage-info.patch \
         "
 
-SRCREV = "d474e35513940dbca039b510b4de705b44f5bd9c"
+SRCREV = "d14511987263ae3c6f5ad28ed7b81c26afdb422c"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.7.4




