Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C5EDD7898E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 19:03:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 11:03:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,446,1515484800"; d="scan'208";a="32652045"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2018 11:03:33 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 20:56:07 +0200
Message-Id: <20180309185614.31113-29-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
References: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 29/36] acpica: remove unnecesary no-werror.patch
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
X-List-Received-Date: Fri, 09 Mar 2018 19:03:33 -0000

It became out of date (missing newly added files), and seems no longer necessary for builds.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/acpica/acpica_20170303.bb    |  1 -
 meta/recipes-extended/acpica/files/no-werror.patch | 32 ----------------------
 2 files changed, 33 deletions(-)
 delete mode 100644 meta/recipes-extended/acpica/files/no-werror.patch

diff --git a/meta/recipes-extended/acpica/acpica_20170303.bb b/meta/recipes-extended/acpica/acpica_20170303.bb
index 4c0f366abfc..51ae77b7840 100644
--- a/meta/recipes-extended/acpica/acpica_20170303.bb
+++ b/meta/recipes-extended/acpica/acpica_20170303.bb
@@ -17,7 +17,6 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 DEPENDS = "bison flex"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
-    file://no-werror.patch \
     file://rename-yy_scan_string-manually.patch \
     file://manipulate-fds-instead-of-FILE.patch;striplevel=2 \
     file://0001-Linux-add-support-for-X32-ABI-compilation.patch \
diff --git a/meta/recipes-extended/acpica/files/no-werror.patch b/meta/recipes-extended/acpica/files/no-werror.patch
deleted file mode 100644
index a6e7b540a18..00000000000
--- a/meta/recipes-extended/acpica/files/no-werror.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Description: remove -Werror flag
-Forwarded: not-needed
-Author: Fathi Boudra <fathi.boudra@linaro.org>
-Upstream-Status: Pending
----
- generate/unix/iasl/Makefile |   12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
---- a/generate/unix/iasl/Makefile
-+++ b/generate/unix/iasl/Makefile
-@@ -266,19 +266,19 @@ $(OBJDIR)/prparser.y.h: $(OBJDIR)/prpars
- # by the utilities above and they are not necessarily ANSI C, etc.
- #
- $(OBJDIR)/aslcompilerlex.o :   $(OBJDIR)/aslcompilerlex.c
--	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
-+	$(CC) -c $(CFLAGS) -Wall -o$@ $<
- 
- $(OBJDIR)/aslcompilerparse.o : $(OBJDIR)/aslcompilerparse.c
--	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
-+	$(CC) -c $(CFLAGS) -Wall -o$@ $<
- 
- $(OBJDIR)/dtparserlex.o :      $(OBJDIR)/dtparserlex.c
--	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
-+	$(CC) -c $(CFLAGS) -Wall -o$@ $<
- 
- $(OBJDIR)/dtparserparse.o :    $(OBJDIR)/dtparserparse.c
--	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
-+	$(CC) -c $(CFLAGS) -Wall -o$@ $<
- 
- $(OBJDIR)/prparserlex.o :      $(OBJDIR)/prparserlex.c
--	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
-+	$(CC) -c $(CFLAGS) -Wall -o$@ $<
-- 
2.16.1


