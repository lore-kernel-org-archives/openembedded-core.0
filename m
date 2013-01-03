Received: from mail-la0-f53.google.com ([209.85.215.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TqrlR-0000dS-Kc
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 21:51:45 +0100
Received: by mail-la0-f53.google.com with SMTP id fn20so8682745lab.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2013 12:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=QeyfUaS4l8t1nrlAwCENLkZ5Jipp+0aOgVN8CuMJZ2A=;
	b=B/cZorR2yUwRGbOPPKdaFzqBHhUCh9DYO4qzdz+/dTRi1EDuYOiMPndJgo3LVBAMlX
	7clo2BGS1pCJbw635B4zJAhkuCbWAbRutgcCkTn9pRCbTVjBa+jyfJ7R9pCiofR17RcQ
	LiwVneaLl900YM8xFoZbkhXAWS6pvlb0utKRfDF+kZFelXK1D34oBDRVsel0ol4Msn3r
	2TAo2BWjTmj6opOAnF6046k//tcPVFpvEe6Oxd+7tQz3KbzupoInMkl0yLH3WhR19b2N
	87a7tsEA/aXNzyv2ik358PGw/lB1sAMUiIxbZSLVEOYWXDjdnDuCgwFrWgZuKVzFLFU1
	HcCw==
X-Received: by 10.112.103.202 with SMTP id fy10mr20180026lbb.13.1357245401532; 
	Thu, 03 Jan 2013 12:36:41 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id if8sm18777008lab.1.2013.01.03.12.36.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 12:36:39 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TqrWl-0002GE-GA; Thu, 03 Jan 2013 22:36:35 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Jan 2013 22:36:29 +0200
Message-Id: <1357245391-11055-14-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357245391-11055-13-git-send-email-cazfi74@gmail.com>
References: <1357245391-11055-1-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-2-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-3-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-4-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-5-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-6-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-7-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-8-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-9-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-10-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-11-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-12-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-13-git-send-email-cazfi74@gmail.com>
Subject: [PATCH 13/15] gnutls: replace obsolete automake macros with working ones
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
X-List-Received-Date: Thu, 03 Jan 2013 20:51:45 -0000

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



