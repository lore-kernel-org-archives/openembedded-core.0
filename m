Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm01.jp.fujitsu.com (mgwkm01.jp.fujitsu.com [202.219.69.168])
	by mail.openembedded.org (Postfix) with ESMTP id E6644601F6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 04:49:59 +0000 (UTC)
Received: from kw-mxoi2.gw.nic.fujitsu.com (unknown [192.168.231.133]) by
	mgwkm01.jp.fujitsu.com with smtp
	id 1f5e_0b17_f995ecc7_bc38_4097_b94f_c62eb3336fc3;
	Mon, 05 Jun 2017 13:49:53 +0900
Received: from g01jpfmpwyt03.exch.g01.fujitsu.local
	(g01jpfmpwyt03.exch.g01.fujitsu.local [10.128.193.57])
	by kw-mxoi2.gw.nic.fujitsu.com (Postfix) with ESMTP id 05589AC0092
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 13:49:53 +0900 (JST)
Received: from G01JPEXCHYT15.g01.fujitsu.local
	(G01JPEXCHYT15.g01.fujitsu.local [10.128.194.54])
	by g01jpfmpwyt03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	D6E5E46E50D for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 13:49:51 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	G01JPEXCHYT15.g01.fujitsu.local (10.128.194.54) with Microsoft SMTP
	Server id 14.3.266.1; Mon, 5 Jun 2017 13:49:50 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Jun 2017 13:51:10 +0900
Message-ID: <1496638270-4482-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] acpica: Upgrade 20150515 -> 20170303
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
X-List-Received-Date: Mon, 05 Jun 2017 04:50:00 -0000
Content-Type: text/plain

1. Upgrade acpica from 20150515 to 20170303

2. Rebase the patch file for 20170303

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 .../{acpica_20150515.bb => acpica_20170303.bb}     |  6 +--
 .../files/manipulate-fds-instead-of-FILE.patch     | 57 +++++++++++-----------
 2 files changed, 32 insertions(+), 31 deletions(-)
 rename meta/recipes-extended/acpica/{acpica_20150515.bb => acpica_20170303.bb} (89%)

diff --git a/meta/recipes-extended/acpica/acpica_20150515.bb b/meta/recipes-extended/acpica/acpica_20170303.bb
similarity index 89%
rename from meta/recipes-extended/acpica/acpica_20150515.bb
rename to meta/recipes-extended/acpica/acpica_20170303.bb
index 1326ebd..12dfc6d 100644
--- a/meta/recipes-extended/acpica/acpica_20150515.bb
+++ b/meta/recipes-extended/acpica/acpica_20170303.bb
@@ -19,10 +19,10 @@ DEPENDS = "bison flex"
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
     file://no-werror.patch \
     file://rename-yy_scan_string-manually.patch \
-    file://manipulate-fds-instead-of-FILE.patch \
+    file://manipulate-fds-instead-of-FILE.patch;striplevel=2 \
     "
-SRC_URI[md5sum] = "2bc4a7ccc82de9df9fa964f784ecb29c"
-SRC_URI[sha256sum] = "61204ec56d71bc9bfa2ee2ade4c66f7e8541772ac72ef8ccc20b3f339cc96374"
+SRC_URI[md5sum] = "48ef4314fb4ffdd0c96f14dcf20544e1"
+SRC_URI[sha256sum] = "b2d81e84107ac9a02be86ea43cbea7afa8fd4b4150270bc88c2d4c9fea0b8aad"
 UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
 
 S = "${WORKDIR}/acpica-unix2-${PV}"
diff --git a/meta/recipes-extended/acpica/files/manipulate-fds-instead-of-FILE.patch b/meta/recipes-extended/acpica/files/manipulate-fds-instead-of-FILE.patch
index 6944bb7..5610ed9 100644
--- a/meta/recipes-extended/acpica/files/manipulate-fds-instead-of-FILE.patch
+++ b/meta/recipes-extended/acpica/files/manipulate-fds-instead-of-FILE.patch
@@ -1,6 +1,6 @@
-From 33a57979738e5ab13950ec1c0e7298e41ef50929 Mon Sep 17 00:00:00 2001
-From: Patrick Ohly <patrick.ohly@intel.com>
-Date: Thu, 23 Feb 2017 18:10:47 +0100
+From 69171c22f3872ecb4c1ab27985e93ca44084595e Mon Sep 17 00:00:00 2001
+From: Fan Xin <fan.xin@jp.fujitsu.com>
+Date: Mon, 5 Jun 2017 13:26:38 +0900
 Subject: [PATCH] aslfiles.c: manipulate fds instead of FILE
 
 Copying what stdout/stderr point to is not portable and fails with
@@ -12,60 +12,61 @@ writes into. This works on the platforms that Yocto targets.
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
+
+Rebase on acpica 20170303
+
+Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
 ---
- source/compiler/aslfiles.c | 20 +++++++++++---------
- 1 file changed, 11 insertions(+), 9 deletions(-)
+ acpica-unix2-20170303/source/compiler/aslfiles.c | 14 +++++++++++---
+ 1 file changed, 11 insertions(+), 3 deletions(-)
 
-diff --git a/source/compiler/aslfiles.c b/source/compiler/aslfiles.c
-index 947e465..7a352b4 100644
---- a/source/compiler/aslfiles.c
-+++ b/source/compiler/aslfiles.c
-@@ -44,6 +44,11 @@
+diff --git a/acpica-unix2-20170303/source/compiler/aslfiles.c b/acpica-unix2-20170303/source/compiler/aslfiles.c
+index 809090c..97898b1 100644
+--- a/acpica-unix2-20170303/source/compiler/aslfiles.c
++++ b/acpica-unix2-20170303/source/compiler/aslfiles.c
+@@ -44,6 +44,10 @@
  #include "aslcompiler.h"
  #include "acapps.h"
- 
+ #include "dtcompiler.h"
 +#include <sys/types.h>
 +#include <sys/stat.h>
 +#include <fcntl.h>
 +#include <unistd.h>
-+
+ 
  #define _COMPONENT          ACPI_COMPILER
          ACPI_MODULE_NAME    ("aslfiles")
- 
-@@ -569,6 +574,8 @@ FlOpenMiscOutputFiles (
+@@ -607,6 +611,8 @@ FlOpenMiscOutputFiles (
  
      if (Gbl_DebugFlag)
      {
-+        int fd;
++	int fd;
 +
          Filename = FlGenerateFilename (FilenamePrefix, FILE_SUFFIX_DEBUG);
          if (!Filename)
          {
-@@ -582,20 +589,15 @@ FlOpenMiscOutputFiles (
-         /* TBD: hide this behind a FlReopenFile function */
+@@ -618,10 +624,10 @@ FlOpenMiscOutputFiles (
+         /* Open the debug file as STDERR, text mode */
  
          Gbl_Files[ASL_FILE_DEBUG_OUTPUT].Filename = Filename;
 -        Gbl_Files[ASL_FILE_DEBUG_OUTPUT].Handle =
 -            freopen (Filename, "w+t", stderr);
--
+ 
 -        if (!Gbl_Files[ASL_FILE_DEBUG_OUTPUT].Handle)
 +        fd = open(Filename, O_CREAT|O_TRUNC, S_IRUSR|S_IWUSR|S_IRGRP|S_IWGRP|S_IROTH|S_IWOTH);
 +        if (fd < 0 ||
 +            dup2(fd, fileno(stderr)))
          {
--            /*
--             * A problem with freopen is that on error,
--             * we no longer have stderr.
--             */
-             Gbl_DebugFlag = FALSE;
--            memcpy (stderr, stdout, sizeof (FILE));
-             FlFileError (ASL_FILE_DEBUG_OUTPUT, ASL_MSG_DEBUG_FILENAME);
-             AslAbort ();
+             /*
+              * A problem with freopen is that on error, we no longer
+@@ -635,6 +641,8 @@ FlOpenMiscOutputFiles (
+             exit (1);
          }
-+        Gbl_Files[ASL_FILE_DEBUG_OUTPUT].Handle = stderr;
  
++        Gbl_Files[ASL_FILE_DEBUG_OUTPUT].Handle = stderr;
++
          AslCompilerSignon (ASL_FILE_DEBUG_OUTPUT);
          AslCompilerFileHeader (ASL_FILE_DEBUG_OUTPUT);
+     }
 -- 
-2.1.4
+1.9.1
 
-- 
1.9.1


