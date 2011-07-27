Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1QmEkg-0006B6-0n
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 02:47:02 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6RMurMj004891
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 17:56:53 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 15:56:48 -0700
Message-Id: <696c6247a3c87d3a87d5dd685b9b3af80a6c8fe9.1311807353.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1311807353.git.tom_rini@mentor.com>
References: <cover.1311807353.git.tom_rini@mentor.com>
In-Reply-To: <cover.1311807353.git.tom_rini@mentor.com>
References: <cover.1311807353.git.tom_rini@mentor.com>
Subject: [PATCH 4/9] Various siteinfo files: Consolidate ac_cv_func_getaddrinfo
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jul 2011 00:47:02 -0000

This is a libc feature, move there.  Drop the ipsec-tools specific
test as ipsec-tools (a) assumes fine on cross-compile and (b) doesn't
support buggy getaddrinfo now.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/site/arm-common          |    2 --
 meta/site/common-glibc        |    1 +
 meta/site/common-uclibc       |    1 +
 meta/site/ix86-common         |    2 --
 meta/site/mips-linux          |    1 -
 meta/site/mips-linux-uclibc   |    1 -
 meta/site/mipsel-linux        |    1 -
 meta/site/mipsel-linux-uclibc |    1 -
 meta/site/powerpc32-linux     |    1 -
 meta/site/sh-common           |    2 --
 meta/site/x86_64-linux-uclibc |    1 -
 11 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/meta/site/arm-common b/meta/site/arm-common
index 7317a13..65ebd06 100644
--- a/meta/site/arm-common
+++ b/meta/site/arm-common
@@ -87,7 +87,6 @@ ac_cv_strerror_r_SUSv3=${ac_cv_strerror_r_SUSv3=no}
 ac_cv_va_copy=${ac_cv_va_copy=yes}
 ac_cv___va_copy=${ac_cv___va_copy=yes}
 ac_cv_va_val_copy=${ac_cv_va_val_copy=yes}
-racoon_cv_bug_getaddrinfo=${racoon_cv_bug_getaddrinfo=no}
 
 # jikes
 ac_cv_sizeof_wchar_t=4
@@ -137,7 +136,6 @@ ac_cv_alignof_CORBA_pointer=4
 ac_cv_alignof_CORBA_short=2
 ac_cv_alignof_CORBA_struct=1
 ac_cv_alignof_CORBA_wchar=2
-ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
 
 # php
 ac_cv_pread=${ac_cv_pread=no}
diff --git a/meta/site/common-glibc b/meta/site/common-glibc
index 258f9ad..8cb8b8e 100644
--- a/meta/site/common-glibc
+++ b/meta/site/common-glibc
@@ -13,6 +13,7 @@ ac_cv_func_getpwuid_r=${ac_cv_func_getpwuid_r=yes}
 ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
 ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
 ac_cv_type_uid_t={ac_cv_type_uid_t=yes}
+ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
 
 # bash
 bash_cv_under_sys_siglist=${bash_cv_under_sys_siglist=yes}
diff --git a/meta/site/common-uclibc b/meta/site/common-uclibc
index 002a559..d8a66a6 100644
--- a/meta/site/common-uclibc
+++ b/meta/site/common-uclibc
@@ -11,6 +11,7 @@ ac_cv_func_getgrgid_r=${ac_cv_func_getgrgid_r=yes}
 ac_cv_func_getpwuid_r=${ac_cv_func_getpwuid_r=yes}
 ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
 ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
+ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
 
 # glib
 glib_cv_strlcpy=${glib_cv_strlcpy=no}
diff --git a/meta/site/ix86-common b/meta/site/ix86-common
index 141ef3a..c663466 100644
--- a/meta/site/ix86-common
+++ b/meta/site/ix86-common
@@ -117,7 +117,6 @@ ac_cv_func_fnmatch_works=${ac_cv_func_fnmatch_works=yes}
 ac_cv_va_copy=${ac_cv_va_copy=no}
 ac_cv___va_copy=${ac_cv___va_copy=yes}
 ac_cv_va_val_copy=${ac_cv_va_val_copy=yes}
-racoon_cv_bug_getaddrinfo=${racoon_cv_bug_getaddrinfo=no}
 
 # jikes-native
 ac_cv_sizeof_wchar_t=4
@@ -154,7 +153,6 @@ ac_cv_alignof_CORBA_pointer=4
 ac_cv_alignof_CORBA_short=2
 ac_cv_alignof_CORBA_struct=4
 ac_cv_alignof_CORBA_wchar=2
-ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
 
 # php
 ac_cv_pread=${ac_cv_pread=no}
diff --git a/meta/site/mips-linux b/meta/site/mips-linux
index b99633b..e90b983 100644
--- a/meta/site/mips-linux
+++ b/meta/site/mips-linux
@@ -36,7 +36,6 @@ glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
 
 # libpcap
 ac_cv_linux_vers=${ac_cv_linux_vers=2}
-ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
 
 # slrn
 slrn_cv___va_copy=${slrn_cv___va_copy=yes}
diff --git a/meta/site/mips-linux-uclibc b/meta/site/mips-linux-uclibc
index b99633b..e90b983 100644
--- a/meta/site/mips-linux-uclibc
+++ b/meta/site/mips-linux-uclibc
@@ -36,7 +36,6 @@ glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
 
 # libpcap
 ac_cv_linux_vers=${ac_cv_linux_vers=2}
-ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
 
 # slrn
 slrn_cv___va_copy=${slrn_cv___va_copy=yes}
diff --git a/meta/site/mipsel-linux b/meta/site/mipsel-linux
index 3347914..7292f6f 100644
--- a/meta/site/mipsel-linux
+++ b/meta/site/mipsel-linux
@@ -37,7 +37,6 @@ glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
 
 # libpcap
 ac_cv_linux_vers=${ac_cv_linux_vers=2}
-ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
 
 # slrn
 slrn_cv___va_copy=${slrn_cv___va_copy=yes}
diff --git a/meta/site/mipsel-linux-uclibc b/meta/site/mipsel-linux-uclibc
index 3c8f41e..ed426a9 100644
--- a/meta/site/mipsel-linux-uclibc
+++ b/meta/site/mipsel-linux-uclibc
@@ -31,7 +31,6 @@ glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
 
 # libpcap
 ac_cv_linux_vers=${ac_cv_linux_vers=2}
-ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
 
 # slrn
 slrn_cv___va_copy=${slrn_cv___va_copy=yes}
diff --git a/meta/site/powerpc32-linux b/meta/site/powerpc32-linux
index c0e3804..60dad35 100644
--- a/meta/site/powerpc32-linux
+++ b/meta/site/powerpc32-linux
@@ -180,7 +180,6 @@ ac_cv_alignof_CORBA_pointer=4
 ac_cv_alignof_CORBA_short=2
 ac_cv_alignof_CORBA_struct=4
 ac_cv_alignof_CORBA_wchar=2
-ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
 
 # cvs
 cvs_cv_func_printf_ptr=${cvs_cv_func_printf_ptr=yes}
diff --git a/meta/site/sh-common b/meta/site/sh-common
index bbf98a5..6d57a08 100644
--- a/meta/site/sh-common
+++ b/meta/site/sh-common
@@ -192,7 +192,6 @@ ac_cv_alignof_CORBA_pointer=4
 ac_cv_alignof_CORBA_short=2
 ac_cv_alignof_CORBA_struct=4
 ac_cv_alignof_CORBA_wchar=2
-ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
 
 # cvs
 cvs_cv_func_printf_ptr=${cvs_cv_func_printf_ptr=yes}
@@ -232,7 +231,6 @@ rsync_cv_REPLACE_INET_ATON=${rsync_cv_REPLACE_INET_ATON=no}
 ac_cv_va_copy=${ac_cv_va_copy=no}
 ac_cv_va_val_copy=${ac_cv_va_val_copy=yes}
 ac_cv___va_copy=${ac_cv___va_copy=yes}
-racoon_cv_bug_getaddrinfo=${racoon_cv_bug_getaddrinfo=no}
 
 # libxfce4util
 with_broken_putenv=${with_broken_putenv=no}
diff --git a/meta/site/x86_64-linux-uclibc b/meta/site/x86_64-linux-uclibc
index 4699240..6eb5285 100644
--- a/meta/site/x86_64-linux-uclibc
+++ b/meta/site/x86_64-linux-uclibc
@@ -78,7 +78,6 @@ ac_cv_alignof_CORBA_pointer=8
 ac_cv_alignof_CORBA_short=2
 ac_cv_alignof_CORBA_struct=1
 ac_cv_alignof_CORBA_wchar=2
-ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
 
 # startup-notification
 lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
-- 
1.7.0.4



