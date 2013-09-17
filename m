Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 63E6760F86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 09:28:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8H9S8hR021958
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 02:28:08 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 17 Sep 2013 02:28:07 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Sep 2013 17:28:04 +0800
Message-ID: <28f8d32e214e7cf1ab24c24ab4a68f780a75667a.1379410020.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1379410020.git.jackie.huang@windriver.com>
References: <cover.1379410020.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] findutils_4.2.31: backport fixes for doc build errors
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
X-List-Received-Date: Tue, 17 Sep 2013 09:28:09 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

[YOCTO #5212]

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../findutils-fix-doc-build-error.patch            |   53 ++++++++++++++++++++
 .../recipes-extended/findutils/findutils_4.2.31.bb |    1 +
 2 files changed, 54 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/findutils/findutils-4.2.31/findutils-fix-doc-build-error.patch

diff --git a/meta/recipes-extended/findutils/findutils-4.2.31/findutils-fix-doc-build-error.patch b/meta/recipes-extended/findutils/findutils-4.2.31/findutils-fix-doc-build-error.patch
new file mode 100644
index 0000000..2076e44
--- /dev/null
+++ b/meta/recipes-extended/findutils/findutils-4.2.31/findutils-fix-doc-build-error.patch
@@ -0,0 +1,53 @@
+From 33cba24cba7b0973a702e9627bd5b93962948ae4 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Tue, 17 Sep 2013 16:11:16 +0800
+Subject: [PATCH] findutils: fix doc build error
+
+Upstream-Status: Backport
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ doc/find.texi |    6 +++---
+ 1 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/doc/find.texi b/doc/find.texi
+index 5b5f0cf..b3d9c6b 100644
+--- a/doc/find.texi
++++ b/doc/find.texi
+@@ -63,7 +63,7 @@ translation approved by the Foundation.
+
+ @page
+ @vskip 0pt plus 1filll
+-@insertcopying{}
++@insertcopying
+ @end titlepage
+
+ @contents
+@@ -1466,6 +1466,7 @@ no output is ever sent to it.
+ * Escapes::
+ * Format Directives::
+ * Time Formats::
++* Formatting Flags::
+ @end menu
+
+ @node Escapes
+@@ -1534,7 +1535,6 @@ from the novel you are reading.
+ * Size Directives::
+ * Location Directives::
+ * Time Directives::
+-* Formatting Flags::
+ @end menu
+
+ @node Name Directives
+@@ -1780,7 +1780,7 @@ setting the TZ environment variable).  This is a GNU extension.
+ @end table
+
+ @node Formatting Flags
+-@subsubsection Formatting Flags
++@subsection Formatting Flags
+
+ The @samp{%m} and @samp{%d} directives support the @samp{#}, @samp{0}
+ and @samp{+} flags, but the other directives do not, even if they
+--
+1.7.4.1
+
diff --git a/meta/recipes-extended/findutils/findutils_4.2.31.bb b/meta/recipes-extended/findutils/findutils_4.2.31.bb
index 00c3f77..72b657a 100644
--- a/meta/recipes-extended/findutils/findutils_4.2.31.bb
+++ b/meta/recipes-extended/findutils/findutils_4.2.31.bb
@@ -6,6 +6,7 @@ require findutils.inc
 
 SRC_URI += "file://gnulib-extension.patch \
             file://findutils_fix_for_automake-1.12.patch \
+            file://findutils-fix-doc-build-error.patch \
            "
 
 SRC_URI[md5sum] = "a0e31a0f18a49709bf5a449867c8049a"
-- 
1.7.4.1


