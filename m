Received: from mail-la0-f51.google.com ([209.85.215.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Ts0DH-0006nT-RU
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 01:05:12 +0100
Received: by mail-la0-f51.google.com with SMTP id fj20so13645971lab.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Jan 2013 15:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=QeyfUaS4l8t1nrlAwCENLkZ5Jipp+0aOgVN8CuMJZ2A=;
	b=Zgia/aKM3uGsFXz0NpRvVIQaV/ZyK00gXi1GUjGJpbKmRh/U2ubYGlKATouGo0ACIS
	WSoIWVLInVLOHAaXe0QnZx6QT/CXeENI6Lq8IGQqU00nLhuXdiIt+Ccbhoy/THGt6AxN
	kz3nzXcBgHwO1kwQlaZrS9nmNyrxkEe+6uSpzBuSe3pr0/mCLL187V0Y4lBl/DxNZoQd
	Ut0QZ8LmTgoV96eKwM+a4bwLEilLAHQt8XV9WNKKk+NOjsWRsH3mSToDNqzl46VaD0+w
	KlLlDn+P7A9M72XnU9xfC6le/Oc9IdloUAGzT9I1BdjsCg6e6xKhUUe5PJ/K/TMwlBIu
	DzXQ==
X-Received: by 10.152.114.65 with SMTP id je1mr57034878lab.33.1357516203455;
	Sun, 06 Jan 2013 15:50:03 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id fb1sm20239977lbb.15.2013.01.06.15.49.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 15:50:01 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TrzyW-0001QD-HU; Mon, 07 Jan 2013 01:49:56 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 01:49:39 +0200
Message-Id: <1357516181-5358-14-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357516181-5358-13-git-send-email-cazfi74@gmail.com>
References: <1357516181-5358-1-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-2-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-3-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-4-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-5-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-6-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-7-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-8-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-9-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-10-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-11-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-12-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-13-git-send-email-cazfi74@gmail.com>
Subject: [PATCH v2 13/15] gnutls: replace obsolete automake macros with working ones
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2013 00:05:12 -0000

Add obsolete-automake-macros.patch that replaces automake macros
no longer supported by automake-1.13 with modern constructs.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../gnutls/gnutls/obsolete_automake_macros.patch   |   39 ++++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_2.12.21.bb      |    3 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/gnutls/gnutls/obsolete_automake_macros.patch

diff --git a/meta/recipes-support/gnutls/gnutls/obsolete_automake_macros.patch b/meta/recipes-support/gnutls/gnutls/obsolete_automake_macros.patch
new file mode 100644
index 0000000..be01303
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/obsolete_automake_macros.patch
@@ -0,0 +1,39 @@
+Upstream-Status: Submitted (https://savannah.gnu.org/support/index.php?108219)
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd gnutls-2.12.21/configure.ac gnutls-2.12.21/configure.ac
+--- gnutls-2.12.21/configure.ac	2013-01-03 07:52:42.182740682 +0200
++++ gnutls-2.12.21/configure.ac	2013-01-03 07:53:41.662739378 +0200
+@@ -29,7 +29,7 @@
+ AM_INIT_AUTOMAKE([1.10 no-dist-gzip dist-bzip2 -Wall -Wno-override])
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+ m4_ifdef([AM_PROG_AR], [AM_PROG_AR]) # required by automake 1.12
+-AM_CONFIG_HEADER(config.h)
++AC_CONFIG_HEADERS(config.h)
+
+ AC_MSG_RESULT([***
+ *** Checking for compilation programs...
+diff -Nurd gnutls-2.12.21/lib/configure.ac gnutls-2.12.21/lib/configure.ac
+--- gnutls-2.12.21/lib/configure.ac	2013-01-03 07:52:42.182740682 +0200
++++ gnutls-2.12.21/lib/configure.ac	2013-01-03 08:07:38.150721027 +0200
+@@ -29,7 +29,7 @@
+ AM_INIT_AUTOMAKE([1.10 -Wall -Wno-override])
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+ m4_ifdef([AM_PROG_AR], [AM_PROG_AR]) # required by automake 1.12
+-AM_CONFIG_HEADER(config.h)
++AC_CONFIG_HEADERS(config.h)
+
+ AC_PROG_CC
+ lgl_EARLY
+diff -Nurd gnutls-2.12.21/libextra/configure.ac gnutls-2.12.21/libextra/configure.ac
+--- gnutls-2.12.21/libextra/configure.ac	2013-01-03 07:52:42.182740682 +0200
++++ gnutls-2.12.21/libextra/configure.ac	2013-01-03 08:10:56.654716669 +0200
+@@ -29,7 +29,7 @@
+ AM_INIT_AUTOMAKE([1.10 -Wall -Wno-override])
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+ m4_ifdef([AM_PROG_AR], [AM_PROG_AR]) # required by automake 1.12
+-AM_CONFIG_HEADER(config.h)
++AC_CONFIG_HEADERS(config.h)
+
+ AC_PROG_CC
+ xgl_EARLY
diff --git a/meta/recipes-support/gnutls/gnutls_2.12.21.bb b/meta/recipes-support/gnutls/gnutls_2.12.21.bb
index 6b2ef3a..7b4426b 100644
--- a/meta/recipes-support/gnutls/gnutls_2.12.21.bb
+++ b/meta/recipes-support/gnutls/gnutls_2.12.21.bb
@@ -1,12 +1,13 @@
 require gnutls.inc
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 SRC_URI += "file://gnutls-openssl.patch \
             file://correct_rpl_gettimeofday_signature.patch \
             file://configure-fix.patch \
             file://gnutls_fix_for_automake_1.12.1.patch \
             file://avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch \
+            file://obsolete_automake_macros.patch \
             ${@['', 'file://fix-gettext-version.patch'][bb.data.inherits_class('native', d) or (not ((d.getVar("INCOMPATIBLE_LICENSE", True) or "").find("GPLv3") != -1))]} \
             file://remove-gets.patch \
            "
-- 
1.7.10.4



