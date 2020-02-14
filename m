Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id EEF1D610BC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 16:12:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,440,1574092800"; d="scan'208";a="83307850"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Feb 2020 00:12:13 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 2282F50A9969
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 00:02:39 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Sat, 15 Feb 2020 00:12:13 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Sat, 15 Feb 2020 00:12:15 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Feb 2020 15:44:28 -0800
Message-ID: <1581723869-21232-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1581723869-21232-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1581723869-21232-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 2282F50A9969.A20CF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libgpg-error: upgrade 1.36 -> 1.37
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
X-List-Received-Date: Fri, 14 Feb 2020 16:12:15 -0000
Content-Type: text/plain

libgpg-error-1.36-gawk5-support.patch
Removed since it is included in 1.37.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libgpg-error-1.36-gawk5-support.patch          | 144 ---------------------
 .../{libgpg-error_1.36.bb => libgpg-error_1.37.bb} |   5 +-
 2 files changed, 2 insertions(+), 147 deletions(-)
 delete mode 100644 meta/recipes-support/libgpg-error/libgpg-error/libgpg-error-1.36-gawk5-support.patch
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.36.bb => libgpg-error_1.37.bb} (92%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/libgpg-error-1.36-gawk5-support.patch b/meta/recipes-support/libgpg-error/libgpg-error/libgpg-error-1.36-gawk5-support.patch
deleted file mode 100644
index b936d11..0000000
--- a/meta/recipes-support/libgpg-error/libgpg-error/libgpg-error-1.36-gawk5-support.patch
+++ /dev/null
@@ -1,144 +0,0 @@
-Upstream-Status: Backport [https://dev.gnupg.org/T4459]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-From 7865041c77f4f7005282f10f9b6666b19072fbdf Mon Sep 17 00:00:00 2001
-From: NIIBE Yutaka <gniibe@fsij.org>
-Date: Mon, 15 Apr 2019 15:10:44 +0900
-Subject: [PATCH] awk: Prepare for Gawk 5.0.
-
-* src/Makefile.am: Use pkg_namespace (instead of namespace).
-* src/mkerrnos.awk: Likewise.
-* lang/cl/mkerrcodes.awk: Don't escape # in regexp.
-* src/mkerrcodes.awk, src/mkerrcodes1.awk, src/mkerrcodes2.awk: Ditto.
-
---
-
-In Gawk 5.0, regexp routines are replaced by Gnulib implementation,
-which only allows escaping specific characters.
-
-GnuPG-bug-id: 4459
-Reported-by: Marius Schamschula
-Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
----
- lang/cl/mkerrcodes.awk |  2 +-
- src/Makefile.am        |  2 +-
- src/mkerrcodes.awk     |  2 +-
- src/mkerrcodes1.awk    |  2 +-
- src/mkerrcodes2.awk    |  2 +-
- src/mkerrnos.awk       |  2 +-
- src/mkstrtable.awk     | 10 +++++-----
- 7 files changed, 11 insertions(+), 11 deletions(-)
-
---- a/lang/cl/mkerrcodes.awk
-+++ b/lang/cl/mkerrcodes.awk
-@@ -122,7 +122,7 @@ header {
- }
- 
- !header {
--  sub (/\#.+/, "");
-+  sub (/#.+/, "");
-   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
- 
-   if (/^$/)
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -293,7 +293,7 @@ code-from-errno.h: mkerrcodes$(EXEEXT_FO
- 
- errnos-sym.h: Makefile mkstrtable.awk errnos.in
- 	$(AWK) -f $(srcdir)/mkstrtable.awk -v textidx=2 -v nogettext=1 \
--		-v prefix=GPG_ERR_ -v namespace=errnos_ \
-+		-v prefix=GPG_ERR_ -v pkg_namespace=errnos_ \
- 		$(srcdir)/errnos.in >$@
- 
- 
---- a/src/mkerrcodes.awk
-+++ b/src/mkerrcodes.awk
-@@ -85,7 +85,7 @@ header {
- }
- 
- !header {
--  sub (/\#.+/, "");
-+  sub (/#.+/, "");
-   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
- 
-   if (/^$/)
---- a/src/mkerrcodes1.awk
-+++ b/src/mkerrcodes1.awk
-@@ -81,7 +81,7 @@ header {
- }
- 
- !header {
--  sub (/\#.+/, "");
-+  sub (/#.+/, "");
-   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
- 
-   if (/^$/)
---- a/src/mkerrcodes2.awk
-+++ b/src/mkerrcodes2.awk
-@@ -91,7 +91,7 @@ header {
- }
- 
- !header {
--  sub (/\#.+/, "");
-+  sub (/#.+/, "");
-   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
- 
-   if (/^$/)
---- a/src/mkerrnos.awk
-+++ b/src/mkerrnos.awk
-@@ -83,7 +83,7 @@ header {
- }
- 
- !header {
--  sub (/\#.+/, "");
-+  sub (/#.+/, "");
-   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
- 
-   if (/^$/)
---- a/src/mkstrtable.awk
-+++ b/src/mkstrtable.awk
-@@ -77,7 +77,7 @@
- #
- # The variable prefix can be used to prepend a string to each message.
- #
--# The variable namespace can be used to prepend a string to each
-+# The variable pkg_namespace can be used to prepend a string to each
- # variable and macro name.
- 
- BEGIN {
-@@ -102,7 +102,7 @@ header {
-       print "/* The purpose of this complex string table is to produce";
-       print "   optimal code with a minimum of relocations.  */";
-       print "";
--      print "static const char " namespace "msgstr[] = ";
-+      print "static const char " pkg_namespace "msgstr[] = ";
-       header = 0;
-     }
-   else
-@@ -110,7 +110,7 @@ header {
- }
- 
- !header {
--  sub (/\#.+/, "");
-+  sub (/#.+/, "");
-   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
- 
-   if (/^$/)
-@@ -150,7 +150,7 @@ END {
-   else
-     print "  gettext_noop (\"" last_msgstr "\");";
-   print "";
--  print "static const int " namespace "msgidx[] =";
-+  print "static const int " pkg_namespace "msgidx[] =";
-   print "  {";
-   for (i = 0; i < coded_msgs; i++)
-     print "    " pos[i] ",";
-@@ -158,7 +158,7 @@ END {
-   print "  };";
-   print "";
-   print "static GPG_ERR_INLINE int";
--  print namespace "msgidxof (int code)";
-+  print pkg_namespace "msgidxof (int code)";
-   print "{";
-   print "  return (0 ? 0";
- 
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.36.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.37.bb
similarity index 92%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.36.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.37.bb
index b11ab05..bf1da84 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.36.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.37.bb
@@ -14,11 +14,10 @@ SECTION = "libs"
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch \
-           file://libgpg-error-1.36-gawk5-support.patch \
 	  "
 
-SRC_URI[md5sum] = "eff437f397e858a9127b76c0d87fa5ed"
-SRC_URI[sha256sum] = "babd98437208c163175c29453f8681094bcaf92968a15cafb1a276076b33c97c"
+SRC_URI[md5sum] = "729f22d917494fdc4b54fce5aa6547c7"
+SRC_URI[sha256sum] = "b32d6ff72a73cf79797f7f2d039e95e9c6f92f0c1450215410840ab62aea9763"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.7.4




