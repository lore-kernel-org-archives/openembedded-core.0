Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1QmD6C-0004F4-U7
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 01:01:09 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6RMurMi004891
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 17:56:53 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 15:56:47 -0700
Message-Id: <d395c1bac934913af1ed7c8fc3a09601c823339b.1311807353.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1311807353.git.tom_rini@mentor.com>
References: <cover.1311807353.git.tom_rini@mentor.com>
In-Reply-To: <cover.1311807353.git.tom_rini@mentor.com>
References: <cover.1311807353.git.tom_rini@mentor.com>
Subject: [PATCH 3/9] Various site files: Drop monotone
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
X-List-Received-Date: Wed, 27 Jul 2011 23:01:09 -0000

Not in oe-core nor meta-oe and based on oe.dev, possibly incomplete.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/site/arm-common        |    3 ---
 meta/site/arm-linux         |    3 ---
 meta/site/common-glibc      |    3 ---
 meta/site/ix86-common       |    3 ---
 meta/site/mips-linux        |    5 -----
 meta/site/mips-linux-uclibc |    5 -----
 meta/site/mipsel-linux      |    5 -----
 meta/site/powerpc32-linux   |    4 ----
 meta/site/sh-common         |    3 ---
 9 files changed, 0 insertions(+), 34 deletions(-)

diff --git a/meta/site/arm-common b/meta/site/arm-common
index 2129298..7317a13 100644
--- a/meta/site/arm-common
+++ b/meta/site/arm-common
@@ -116,9 +116,6 @@ with_broken_putenv=${with_broken_putenv=no}
 # links
 ac_cv_lib_png_png_create_info_struct=${ac_cv_lib_png_png_create_info_struct=yes}
 
-# mono
-cv_mono_sizeof_sunpath=108
-
 # mysql
 mysql_cv_func_atomic_sub=${mysql_cv_func_atomic_sub=no}
 mysql_cv_func_atomic_add=${mysql_cv_func_atomic_add=no}
diff --git a/meta/site/arm-linux b/meta/site/arm-linux
index 22b455a..87b45eb 100644
--- a/meta/site/arm-linux
+++ b/meta/site/arm-linux
@@ -154,9 +154,6 @@ ac_cv_have_abstract_sockets=${ac_cv_have_abstract_sockets=yes}
 # lftp
 ac_cv_file___dev_ptc_=yes
 
-#mono
-mono_cv_uscore=${mono_cv_uscore=no}
-
 # guile
 ac_cv_func_pthread_attr_getstack=${ac_cv_func_pthread_attr_getstack=yes}
 
diff --git a/meta/site/common-glibc b/meta/site/common-glibc
index baca5f8..258f9ad 100644
--- a/meta/site/common-glibc
+++ b/meta/site/common-glibc
@@ -38,9 +38,6 @@ ac_cv_have_abstract_sockets=${ac_cv_have_abstract_sockets=yes}
 # gnucash
 am_cv_scanf_lld=${am_cv_scanf_lld=yes}
 
-# mono
-mono_cv_uscore=${mono_cv_uscore=no}
-
 # guile
 ac_cv_func_pthread_attr_getstack=${ac_cv_func_pthread_attr_getstack=yes}
 
diff --git a/meta/site/ix86-common b/meta/site/ix86-common
index 122eb14..141ef3a 100644
--- a/meta/site/ix86-common
+++ b/meta/site/ix86-common
@@ -137,9 +137,6 @@ ac_libnet_have_packet_socket=${ac_libnet_have_packet_socket=yes}
 # libxfce4util
 with_broken_putenv=${with_broken_putenv=no}
 
-# mono
-cv_mono_sizeof_sunpath=108
-
 # mysql
 mysql_cv_func_atomic_sub=${mysql_cv_func_atomic_sub=yes}
 mysql_cv_func_atomic_add=${mysql_cv_func_atomic_add=yes}
diff --git a/meta/site/mips-linux b/meta/site/mips-linux
index 212c3ad..b99633b 100644
--- a/meta/site/mips-linux
+++ b/meta/site/mips-linux
@@ -85,11 +85,6 @@ ac_cv_uint=${ac_cv_unit=yes}
 # D-BUS
 ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
 
-# mono
-cv_mono_sizeof_sunpath=108
-mono_cv_sizeof_sunpath=108
-mono_cv_uscore=${mono_cv_uscore=no}
-
 # popt
 ac_cv_va_copy=${ac_cv_va_copy=yes}
 ac_cv___va_copy=${ac_cv___va_copy=yes}
diff --git a/meta/site/mips-linux-uclibc b/meta/site/mips-linux-uclibc
index 212c3ad..b99633b 100644
--- a/meta/site/mips-linux-uclibc
+++ b/meta/site/mips-linux-uclibc
@@ -85,11 +85,6 @@ ac_cv_uint=${ac_cv_unit=yes}
 # D-BUS
 ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
 
-# mono
-cv_mono_sizeof_sunpath=108
-mono_cv_sizeof_sunpath=108
-mono_cv_uscore=${mono_cv_uscore=no}
-
 # popt
 ac_cv_va_copy=${ac_cv_va_copy=yes}
 ac_cv___va_copy=${ac_cv___va_copy=yes}
diff --git a/meta/site/mipsel-linux b/meta/site/mipsel-linux
index a9032ac..3347914 100644
--- a/meta/site/mipsel-linux
+++ b/meta/site/mipsel-linux
@@ -85,11 +85,6 @@ ac_cv_uint=${ac_cv_unit=yes}
 
 # D-BUS
 ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
-
-#mono
-cv_mono_sizeof_sunpath=108
-mono_cv_uscore=${mono_cv_uscore=no}
-
 # popt
 ac_cv_va_copy=${ac_cv_va_copy=yes}
 ac_cv___va_copy=${ac_cv___va_copy=yes}
diff --git a/meta/site/powerpc32-linux b/meta/site/powerpc32-linux
index 8a10111..c0e3804 100644
--- a/meta/site/powerpc32-linux
+++ b/meta/site/powerpc32-linux
@@ -272,10 +272,6 @@ samba_cv_have_longlong=${samba_cv_have_longlong=yes}
 samba_cv_have_setresgid=${samba_cv_have_setresgid=yes}
 samba_cv_have_setresuid=${samba_cv_have_setresuid=yes}
 
-#monotone
-ac_cv_sync_with_stdio=${ac_cv_sync_with_stdio=yes} 
-ac_cv_sync_with_stdio_2=${ac_cv_sync_with_stdio_2=yes}
-
 # mysql
 mysql_cv_func_atomic_sub=${mysql_cv_func_atomic_sub=no}
 mysql_cv_func_atomic_add=${mysql_cv_func_atomic_add=no}
diff --git a/meta/site/sh-common b/meta/site/sh-common
index 63abe57..bbf98a5 100644
--- a/meta/site/sh-common
+++ b/meta/site/sh-common
@@ -201,9 +201,6 @@ cvs_cv_func_printf_ptr=${cvs_cv_func_printf_ptr=yes}
 ac_cv_c_long_double=${ac_cv_c_long_double=yes}
 bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=missing}
 
-# mono
-cv_mono_sizeof_sunpath=108
-
 # mysql
 mysql_cv_func_atomic_sub=${mysql_cv_func_atomic_sub=no}
 mysql_cv_func_atomic_add=${mysql_cv_func_atomic_add=no}
-- 
1.7.0.4



