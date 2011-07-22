Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1QkIem-0007jG-95
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 18:32:56 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6MGSkMl010603
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 11:28:46 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 09:28:41 -0700
Message-Id: <516e42bf64159cbea7c5500eb2dbc6452ca3825a.1311352057.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1311352057.git.tom_rini@mentor.com>
References: <cover.1311352057.git.tom_rini@mentor.com>
In-Reply-To: <cover.1311352057.git.tom_rini@mentor.com>
References: <cover.1311352057.git.tom_rini@mentor.com>
Subject: [PATCH 6/8] siteinfo: Move certain db entries to common-linux
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
X-List-Received-Date: Fri, 22 Jul 2011 16:32:56 -0000

Note that we had a number of unused and ignored settings wrt mutex
support.  These have been dropped as they weren't being used and
implied some odd things to boot.  This is also a partial resync with
oe.dev which had some, but not all of these changes.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/site/arm-common          |   12 ------------
 meta/site/common-linux        |   11 +++++++++++
 meta/site/ix86-common         |   12 ------------
 meta/site/mips-linux          |   14 +-------------
 meta/site/mips-linux-uclibc   |   14 +-------------
 meta/site/mipsel-linux        |   14 +-------------
 meta/site/powerpc-common      |   14 +-------------
 meta/site/powerpc32-linux     |   14 +-------------
 meta/site/sh-common           |   14 +-------------
 meta/site/x86_64-linux        |   14 ++------------
 meta/site/x86_64-linux-uclibc |   12 ------------
 11 files changed, 19 insertions(+), 126 deletions(-)

diff --git a/meta/site/arm-common b/meta/site/arm-common
index 2880cfc..2524db4 100644
--- a/meta/site/arm-common
+++ b/meta/site/arm-common
@@ -25,20 +25,8 @@ cvs_cv_func_printf_ptr=${cvs_cv_func_printf_ptr=yes}
 # db (sleepycat)
 db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
 db_cv_sprintf_count=${db_cv_sprintf_count=yes}
-db_cv_path_ar=${db_cv_path_ar=/usr/bin/ar}
-db_cv_path_chmod=${db_cv_path_chmod=/bin/chmod}
-db_cv_path_cp=${db_cv_path_cp=/bin/cp}
-db_cv_path_ln=${db_cv_path_ln=/bin/ln}
-db_cv_path_mkdir=${db_cv_path_mkdir=/bin/mkdir}
-db_cv_path_ranlib=${db_cv_path_ranlib=/usr/bin/ranlib}
-db_cv_path_rm=${db_cv_path_rm=/bin/rm}
-db_cv_path_sh=${db_cv_path_sh=/bin/sh}
-db_cv_path_strip=${db_cv_path_strip=/usr/bin/strip}
 db_cv_align_t=${db_cv_align_t='unsigned long long'}
 db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
-db_cv_mutex=${db_cv_mutex=no}
-db_cv_posixmutexes=${db_cv_posixmutexes=no}
-db_cv_uimutexes=${db_cv_uimutexes=no}
 
 # D-BUS
 ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
diff --git a/meta/site/common-linux b/meta/site/common-linux
index 981100c..1b4d182 100644
--- a/meta/site/common-linux
+++ b/meta/site/common-linux
@@ -4,6 +4,17 @@ samba_cv_HAVE_IFACE_IFCONF=${samba_cv_HAVE_IFACE_IFCONF=yes}
 samba_cv_HAVE_IFACE_IFREQ=${samba_cv_HAVE_IFACE_IFREQ=yes}
 samba_cv_HAVE_IRIX_SPECIFIC_CAPABILITIES=${samba_cv_HAVE_IRIX_SPECIFIC_CAPABILITIES=no}
 
+# db
+db_cv_path_ar=${db_cv_path_ar=/usr/bin/ar}
+db_cv_path_chmod=${db_cv_path_chmod=/bin/chmod}
+db_cv_path_cp=${db_cv_path_cp=/bin/cp}
+db_cv_path_ln=${db_cv_path_ln=/bin/ln}
+db_cv_path_mkdir=${db_cv_path_mkdir=/bin/mkdir}
+db_cv_path_ranlib=${db_cv_path_ranlib=/usr/bin/ranlib}
+db_cv_path_rm=${db_cv_path_rm=/bin/rm}
+db_cv_path_sh=${db_cv_path_sh=/bin/sh}
+db_cv_path_strip=${db_cv_path_strip=/usr/bin/strip}
+
 # bash
 bash_cv_have_mbstate_t=${bash_cv_have_mbstate_t=yes}
 bash_cv_must_reinstall_sighandlers=${bash_cv_must_reinstall_sighandlers=no}
diff --git a/meta/site/ix86-common b/meta/site/ix86-common
index fa32bb2..47f7178 100644
--- a/meta/site/ix86-common
+++ b/meta/site/ix86-common
@@ -72,19 +72,7 @@ cvs_cv_func_printf_ptr=${cvs_cv_func_printf_ptr=yes}
 db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
 db_cv_align_t=${db_cv_align_t='unsigned long long'}
 db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
-db_cv_mutex=${db_cv_mutex=x86/gcc-assembly}
-db_cv_path_ar=${db_cv_path_ar=/usr/bin/ar}
-db_cv_path_chmod=${db_cv_path_chmod=/bin/chmod}
-db_cv_path_cp=${db_cv_path_cp=/bin/cp}
-db_cv_path_ln=${db_cv_path_ln=/bin/ln}
-db_cv_path_mkdir=${db_cv_path_mkdir=/bin/mkdir}
-db_cv_path_ranlib=${db_cv_path_ranlib=/usr/bin/ranlib}
-db_cv_path_rm=${db_cv_path_rm=/bin/rm}
-db_cv_path_sh=${db_cv_path_sh=/bin/sh}
-db_cv_path_strip=${db_cv_path_strip=/usr/bin/strip}
-db_cv_posixmutexes=${db_cv_posixmutexes=no}
 db_cv_sprintf_count=${db_cv_sprintf_count=yes}
-db_cv_uimutexes=${db_cv_uimutexes=no}
 
 # D-BUS
 ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
diff --git a/meta/site/mips-linux b/meta/site/mips-linux
index f6442ce..f81d4fa 100644
--- a/meta/site/mips-linux
+++ b/meta/site/mips-linux
@@ -63,23 +63,11 @@ wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
 wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
 wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
 
-# db3
+# db
 db_cv_align_t=${db_cv_align_t='unsigned long long'}
 db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
-db_cv_mutex=${db_cv_mutex=POSIX/pthreads/library}
-db_cv_posixmutexes=${db_cv_posixmutexes=no}
-db_cv_uimutexes=${db_cv_uimutexes=no}
 db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
 db_cv_sprintf_count=${db_cv_sprintf_count=yes}
-db_cv_path_ar=${db_cv_path_ar=/usr/bin/ar}
-db_cv_path_chmod=${db_cv_path_chmod=/bin/chmod}
-db_cv_path_cp=${db_cv_path_cp=/bin/cp}
-db_cv_path_ln=${db_cv_path_ln=/bin/ln}
-db_cv_path_mkdir=${db_cv_path_mkdir=/bin/mkdir}
-db_cv_path_ranlib=${db_cv_path_ranlib=/usr/bin/ranlib}
-db_cv_path_rm=${db_cv_path_rm=/bin/rm}
-db_cv_path_sh=${db_cv_path_sh=/bin/sh}
-db_cv_path_strip=${db_cv_path_strip=/usr/bin/strip}
 
 # rrdtool
 rd_cv_ieee_works=${rd_cv_ieee_works=yes}
diff --git a/meta/site/mips-linux-uclibc b/meta/site/mips-linux-uclibc
index f6442ce..f81d4fa 100644
--- a/meta/site/mips-linux-uclibc
+++ b/meta/site/mips-linux-uclibc
@@ -63,23 +63,11 @@ wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
 wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
 wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
 
-# db3
+# db
 db_cv_align_t=${db_cv_align_t='unsigned long long'}
 db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
-db_cv_mutex=${db_cv_mutex=POSIX/pthreads/library}
-db_cv_posixmutexes=${db_cv_posixmutexes=no}
-db_cv_uimutexes=${db_cv_uimutexes=no}
 db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
 db_cv_sprintf_count=${db_cv_sprintf_count=yes}
-db_cv_path_ar=${db_cv_path_ar=/usr/bin/ar}
-db_cv_path_chmod=${db_cv_path_chmod=/bin/chmod}
-db_cv_path_cp=${db_cv_path_cp=/bin/cp}
-db_cv_path_ln=${db_cv_path_ln=/bin/ln}
-db_cv_path_mkdir=${db_cv_path_mkdir=/bin/mkdir}
-db_cv_path_ranlib=${db_cv_path_ranlib=/usr/bin/ranlib}
-db_cv_path_rm=${db_cv_path_rm=/bin/rm}
-db_cv_path_sh=${db_cv_path_sh=/bin/sh}
-db_cv_path_strip=${db_cv_path_strip=/usr/bin/strip}
 
 # rrdtool
 rd_cv_ieee_works=${rd_cv_ieee_works=yes}
diff --git a/meta/site/mipsel-linux b/meta/site/mipsel-linux
index 76c0dc0..2805be1 100644
--- a/meta/site/mipsel-linux
+++ b/meta/site/mipsel-linux
@@ -64,23 +64,11 @@ wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
 wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
 wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
 
-# db3
+# db
 db_cv_align_t=${db_cv_align_t='unsigned long long'}
 db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
-db_cv_mutex=${db_cv_mutex=no}
-db_cv_posixmutexes=${db_cv_posixmutexes=no}
-db_cv_uimutexes=${db_cv_uimutexes=no}
 db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
 db_cv_sprintf_count=${db_cv_sprintf_count=yes}
-db_cv_path_ar=${db_cv_path_ar=/usr/bin/ar}
-db_cv_path_chmod=${db_cv_path_chmod=/bin/chmod}
-db_cv_path_cp=${db_cv_path_cp=/bin/cp}
-db_cv_path_ln=${db_cv_path_ln=/bin/ln}
-db_cv_path_mkdir=${db_cv_path_mkdir=/bin/mkdir}
-db_cv_path_ranlib=${db_cv_path_ranlib=/usr/bin/ranlib}
-db_cv_path_rm=${db_cv_path_rm=/bin/rm}
-db_cv_path_sh=${db_cv_path_sh=/bin/sh}
-db_cv_path_strip=${db_cv_path_strip=/usr/bin/strip}
 
 # rrdtool
 rd_cv_ieee_works=${rd_cv_ieee_works=yes}
diff --git a/meta/site/powerpc-common b/meta/site/powerpc-common
index 9784f30..804d33c 100644
--- a/meta/site/powerpc-common
+++ b/meta/site/powerpc-common
@@ -89,23 +89,11 @@ sc_cv_termios_ispeed=${sc_cv_termios_ispeed=yes}
 # links
 ac_cv_lib_png_png_create_info_struct=${ac_cv_lib_png_png_create_info_struct=yes}
 
-# sleepycat db
+# db
 db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
 db_cv_sprintf_count=${db_cv_sprintf_count=yes}
-db_cv_path_ar=${db_cv_path_ar=/usr/bin/ar}
-db_cv_path_chmod=${db_cv_path_chmod=/bin/chmod}
-db_cv_path_cp=${db_cv_path_cp=/bin/cp}
-db_cv_path_ln=${db_cv_path_ln=/bin/ln}
-db_cv_path_mkdir=${db_cv_path_mkdir=/bin/mkdir}
-db_cv_path_ranlib=${db_cv_path_ranlib=/usr/bin/ranlib}
-db_cv_path_rm=${db_cv_path_rm=/bin/rm}
-db_cv_path_sh=${db_cv_path_sh=/bin/sh}
-db_cv_path_strip=${db_cv_path_strip=/usr/bin/strip}
 db_cv_align_t=${db_cv_align_t='unsigned long long'}
 db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
-db_cv_mutex=${db_cv_mutex=no}
-db_cv_posixmutexes=${db_cv_posixmutexes=no}
-db_cv_uimutexes=${db_cv_uimutexes=no}
 
 # php
 ac_cv_pread=${ac_cv_pread=no}
diff --git a/meta/site/powerpc32-linux b/meta/site/powerpc32-linux
index 3a05053..6df66dc 100644
--- a/meta/site/powerpc32-linux
+++ b/meta/site/powerpc32-linux
@@ -93,23 +93,11 @@ sc_cv_termios_ispeed=${sc_cv_termios_ispeed=yes}
 # links
 ac_cv_lib_png_png_create_info_struct=${ac_cv_lib_png_png_create_info_struct=yes}
 
-# sleepycat db
+# db
 db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
 db_cv_sprintf_count=${db_cv_sprintf_count=yes}
-db_cv_path_ar=${db_cv_path_ar=/usr/bin/ar}
-db_cv_path_chmod=${db_cv_path_chmod=/bin/chmod}
-db_cv_path_cp=${db_cv_path_cp=/bin/cp}
-db_cv_path_ln=${db_cv_path_ln=/bin/ln}
-db_cv_path_mkdir=${db_cv_path_mkdir=/bin/mkdir}
-db_cv_path_ranlib=${db_cv_path_ranlib=/usr/bin/ranlib}
-db_cv_path_rm=${db_cv_path_rm=/bin/rm}
-db_cv_path_sh=${db_cv_path_sh=/bin/sh}
-db_cv_path_strip=${db_cv_path_strip=/usr/bin/strip}
 db_cv_align_t=${db_cv_align_t='unsigned long long'}
 db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
-db_cv_mutex=${db_cv_mutex=no}
-db_cv_posixmutexes=${db_cv_posixmutexes=no}
-db_cv_uimutexes=${db_cv_uimutexes=no}
 
 # php
 ac_cv_pread=${ac_cv_pread=no}
diff --git a/meta/site/sh-common b/meta/site/sh-common
index b6b0bf5..12ac3d8 100644
--- a/meta/site/sh-common
+++ b/meta/site/sh-common
@@ -102,23 +102,11 @@ samba_cv_SIZEOF_OFF_T=${samba_cv_SIZEOF_OFF_T=yes}
 samba_cv_SIZEOF_INO_T=${samba_cv_SIZEOF_INO_T=yes}
 samba_cv_HAVE_STRUCT_FLOCK64=${samba_cv_HAVE_STRUCT_FLOCK64=yes}
 
-# sleepycat db
+# db
 db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
 db_cv_sprintf_count=${db_cv_sprintf_count=yes}
-db_cv_path_ar=${db_cv_path_ar=/usr/bin/ar}
-db_cv_path_chmod=${db_cv_path_chmod=/bin/chmod}
-db_cv_path_cp=${db_cv_path_cp=/bin/cp}
-db_cv_path_ln=${db_cv_path_ln=/bin/ln}
-db_cv_path_mkdir=${db_cv_path_mkdir=/bin/mkdir}
-db_cv_path_ranlib=${db_cv_path_ranlib=/usr/bin/ranlib}
-db_cv_path_rm=${db_cv_path_rm=/bin/rm}
-db_cv_path_sh=${db_cv_path_sh=/bin/sh}
-db_cv_path_strip=${db_cv_path_strip=/usr/bin/strip}
 db_cv_align_t=${db_cv_align_t='unsigned long long'}
 db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
-db_cv_mutex=${db_cv_mutex=no}
-db_cv_posixmutexes=${db_cv_posixmutexes=no}
-db_cv_uimutexes=${db_cv_uimutexes=no}
 
 # php
 ac_cv_pread=${ac_cv_pread=no}
diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
index 076e5b6..1b83ce9 100644
--- a/meta/site/x86_64-linux
+++ b/meta/site/x86_64-linux
@@ -35,19 +35,9 @@ ac_cv_strerror_r_SUSv3=${ac_cv_strerror_r_SUSv3=no}
 db_cv_alignp_t=${db_cv_alignp_t='unsigned long long'}
 db_cv_align_t=${db_cv_align_t='unsigned long long'}
 db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
-db_cv_mutex=${db_cv_mutex=POSIX/pthreads/library}
-db_cv_path_ar=${db_cv_path_ar=/usr/bin/ar}
-db_cv_path_chmod=${db_cv_path_chmod=/bin/chmod}
-db_cv_path_cp=${db_cv_path_cp=/bin/cp}
-db_cv_path_ln=${db_cv_path_ln=/bin/ln}
-db_cv_path_mkdir=${db_cv_path_mkdir=/bin/mkdir}
-db_cv_path_ranlib=${db_cv_path_ranlib=/usr/bin/ranlib}
-db_cv_path_rm=${db_cv_path_rm=/bin/rm}
-db_cv_path_sh=${db_cv_path_sh=/bin/sh}
-db_cv_path_strip=${db_cv_path_strip=/usr/bin/strip}
-db_cv_posixmutexes=${db_cv_posixmutexes=no}
 db_cv_sprintf_count=${db_cv_sprintf_count=yes}
-db_cv_uimutexes=${db_cv_uimutexes=no}
+
+# glib
 glib_cv_hasinline=${glib_cv_hasinline=yes}
 glib_cv_has__inline=${glib_cv_has__inline=yes}
 glib_cv_has__inline__=${glib_cv_has__inline__=yes}
diff --git a/meta/site/x86_64-linux-uclibc b/meta/site/x86_64-linux-uclibc
index 771e725..f646c31 100644
--- a/meta/site/x86_64-linux-uclibc
+++ b/meta/site/x86_64-linux-uclibc
@@ -27,19 +27,7 @@ ac_cv_strerror_r_SUSv3=${ac_cv_strerror_r_SUSv3=no}
 db_cv_alignp_t=${db_cv_alignp_t='unsigned long long'}
 db_cv_align_t=${db_cv_align_t='unsigned long long'}
 db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
-db_cv_mutex=${db_cv_mutex=no}
-db_cv_path_ar=${db_cv_path_ar=/usr/bin/ar}
-db_cv_path_chmod=${db_cv_path_chmod=/bin/chmod}
-db_cv_path_cp=${db_cv_path_cp=/bin/cp}
-db_cv_path_ln=${db_cv_path_ln=/bin/ln}
-db_cv_path_mkdir=${db_cv_path_mkdir=/bin/mkdir}
-db_cv_path_ranlib=${db_cv_path_ranlib=/usr/bin/ranlib}
-db_cv_path_rm=${db_cv_path_rm=/bin/rm}
-db_cv_path_sh=${db_cv_path_sh=/bin/sh}
-db_cv_path_strip=${db_cv_path_strip=/usr/bin/strip}
-db_cv_posixmutexes=${db_cv_posixmutexes=no}
 db_cv_sprintf_count=${db_cv_sprintf_count=yes}
-db_cv_uimutexes=${db_cv_uimutexes=no}
 glib_cv_hasinline=${glib_cv_hasinline=yes}
 glib_cv_has__inline=${glib_cv_has__inline=yes}
 glib_cv_has__inline__=${glib_cv_has__inline__=yes}
-- 
1.7.0.4



