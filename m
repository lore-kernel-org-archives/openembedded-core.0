Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9092475AF8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 08:55:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5O8tQ9k005615
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 01:55:27 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 24 Jun 2015 01:55:26 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Jun 2015 01:55:19 -0700
Message-ID: <bf978a7894f51c909ede7f64c28b6da5495d981a.1435135356.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1435135356.git.liezhi.yang@windriver.com>
References: <cover.1435135356.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] file: 5.22 -> 5.23
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
X-List-Received-Date: Wed, 24 Jun 2015 08:55:29 -0000
Content-Type: text/plain

Updated 0001-Add-P-prompt-into-Usage-info.patch.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../file/0001-Add-P-prompt-into-Usage-info.patch   |    6 +++---
 .../file/{file_5.22.bb => file_5.23.bb}            |    6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/file/{file_5.22.bb => file_5.23.bb} (81%)

diff --git a/meta/recipes-devtools/file/file/0001-Add-P-prompt-into-Usage-info.patch b/meta/recipes-devtools/file/file/0001-Add-P-prompt-into-Usage-info.patch
index 95e1291..8a16b2c 100644
--- a/meta/recipes-devtools/file/file/0001-Add-P-prompt-into-Usage-info.patch
+++ b/meta/recipes-devtools/file/file/0001-Add-P-prompt-into-Usage-info.patch
@@ -20,16 +20,16 @@ Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/file.c b/src/file.c
-index 546fd8b..beef868 100644
+index 2b15e21..e5a957b 100644
 --- a/src/file.c
 +++ b/src/file.c
 @@ -76,8 +76,8 @@ int getopt_long(int argc, char * const *argv, const char *optstring, const struc
  # define USAGE  \
      "Usage: %s [" FILE_FLAGS \
- 	"] [--apple] [--mime-encoding] [--mime-type]\n" \
+ 	"] [--apple] [--extension] [--mime-encoding] [--mime-type]\n" \
 -    "            [-e testname] [-F separator] [-f namefile] [-m magicfiles] " \
 -    "file ...\n" \
-+    "            [-e testname] [-F separator] [-f namefile] [-m magicfiles]\n" \
++    "            [-e testname] [-F separator] [-f namefile] [-m magicfiles]\n " \
 +    "            [-P parameter=limits] file ...\n" \
      "       %s -C [-m magicfiles]\n" \
      "       %s [--help]\n"
diff --git a/meta/recipes-devtools/file/file_5.22.bb b/meta/recipes-devtools/file/file_5.23.bb
similarity index 81%
rename from meta/recipes-devtools/file/file_5.22.bb
rename to meta/recipes-devtools/file/file_5.23.bb
index e8d4dae..d71f290 100644
--- a/meta/recipes-devtools/file/file_5.22.bb
+++ b/meta/recipes-devtools/file/file_5.23.bb
@@ -11,13 +11,13 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=6a7382872edb68d33e1a9398b6e03
 DEPENDS = "zlib file-native"
 DEPENDS_class-native = "zlib-native"
 
-SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz \
+SRC_URI = "ftp://ftp.astron.com/pub/file/${BP}.tar.gz \
 	   file://debian-742262.patch \
 	   file://0001-Add-P-prompt-into-Usage-info.patch \
           "
 
-SRC_URI[md5sum] = "8fb13e5259fe447e02c4a37bc7225add"
-SRC_URI[sha256sum] = "c4e3a8e44cb888c5e4b476e738503e37fb9de3b25a38c143e214bfc12109fc0b"
+SRC_URI[md5sum] = "61db35209ce71a6d576392ce6e1d2f80"
+SRC_URI[sha256sum] = "2c8ab3ff143e2cdfb5ecee381752f80a79e0b4cfe9ca4cc6e1c3e5ec15e6157c"
 
 inherit autotools
 
-- 
1.7.9.5


