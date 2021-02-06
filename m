Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web09.10107.1612636121617148110
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Feb 2021 10:28:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=C5u0TDq3;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.196, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f196.google.com with SMTP id f2so11317385ljp.11
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Feb 2021 10:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DQuALiTfpJ5+eJ0rvbjU6VQXLiNzfDqhieICdzKABgY=;
        b=C5u0TDq3MoQyXn9XQj+xqp+L/fOF3dYJdtG9aTpWQ/z3v6fkrR2yy406+GDPhzX9k2
         xV/Wavkc3T/U4gCI1Le3pLUzzF6rmr1JxWgVMFHLUtXw9e25SwN7LNEJ6qW27jGappFN
         mh65PeiAMcEI2ord2wb1zsGpCSMoxQ0oA+I5hENsHs+8l2c7JfVkiuA1hwrjC0MljrJ5
         /4obYOcJbet/iOxwaoTAvGlhge6N370IkWb0JFYF02j2jouBUfOd32CGOE110I6j+OYU
         enX2VcvmxkJPJoGlQ26uSaHzYiT+iTUFDZpqU3HtMEZOboxkpbTbJ8nP+D71LfPHcPop
         Z2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DQuALiTfpJ5+eJ0rvbjU6VQXLiNzfDqhieICdzKABgY=;
        b=lHjfSvGFAXxHWc6+rHuE8smF+w6C7USbKhZ3XzHO8GBjK0IvMlCjQW9m+kiQ+2Oli9
         8aTPtd77fxBhr4RRuPDYfo1l/cbDJfMuGVYlIKm3ckYWzaLwCLdIbJ524pkoD4ZXeeV7
         +VHH8VsU6DA364lFA3lnh+TJ23PE4phegq7ArE7jPnBeu8tC1MromiomPJSB27U6m+Rw
         ekG0zMphveVup6+ihZGqU7vGQfmrIHuVUxWg1dl7F0G8rAx5ioej002Oa79QnRWzGNoB
         6uUJyVmO6VkmK4LxxxJ2IIIJteHZAWY3GH8FkzXCeuJwi51JeL6/XdEEGw0AmB6Ip+TM
         Dfkw==
X-Gm-Message-State: AOAM533tE1MFgn2retUnpAGgEvnCIKETFct/0wYbSb7VwdYZRzYuJRiX
	wtVW8Rih+40pUKVLXvxWptfeQhgyoKvjY9E3
X-Google-Smtp-Source: ABdhPJwCwb8vye0qtEPjwvoWPYyxSxkmo7RAHA7UVVQRjtmrIAEH9pdIMbu82vZkmKuyLhbkpeuz1w==
X-Received: by 2002:a2e:300d:: with SMTP id w13mr6056424ljw.383.1612636119208;
        Sat, 06 Feb 2021 10:28:39 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id s28sm1373661ljo.26.2021.02.06.10.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 10:28:38 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] inetutils: update to 2.0
Date: Sat,  6 Feb 2021 19:28:36 +0100
Message-Id: <20210206182836.3378021-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Removed upstreamed patches and refreshed q few other.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...001-rcp-fix-to-work-with-large-files.patch | 31 -------------------
 .../inetutils/fix-disable-ipv6.patch          | 24 +++++++-------
 ...rse-pull-in-features.h-for-__GLIBC__.patch | 16 +++++-----
 .../inetutils/inetutils-1.8-0003-wchar.patch  | 17 ++++++++--
 .../inetutils-1.9-PATH_PROCNET_DEV.patch      | 21 ++++++++++---
 ...ly-check-pam_appl.h-when-pam-enabled.patch | 17 +++++++---
 .../inetutils/inetutils/version.patch         | 17 ----------
 .../{inetutils_1.9.4.bb => inetutils_2.0.bb}  |  9 ++----
 8 files changed, 65 insertions(+), 87 deletions(-)
 delete mode 100644 meta/recipes-connectivity/inetutils/inetutils/0001-rcp-fix-to-work-with-large-files.patch
 delete mode 100644 meta/recipes-connectivity/inetutils/inetutils/version.patch
 rename meta/recipes-connectivity/inetutils/{inetutils_1.9.4.bb => inetutils_2.0.bb} (95%)

diff --git a/meta/recipes-connectivity/inetutils/inetutils/0001-rcp-fix-to-work-with-large-files.patch b/meta/recipes-connectivity/inetutils/inetutils/0001-rcp-fix-to-work-with-large-files.patch
deleted file mode 100644
index d4764f5867..0000000000
--- a/meta/recipes-connectivity/inetutils/inetutils/0001-rcp-fix-to-work-with-large-files.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Upstream-Status: Pending
-
-Subject: rcp: fix to work with large files
-
-When we copy file by rcp command, if the file > 2GB, it will fail.
-The cause is that it used incorrect data type on file size in sink() of rcp.
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/rcp.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/rcp.c b/src/rcp.c
-index 21f55b6..bafa35f 100644
---- a/src/rcp.c
-+++ b/src/rcp.c
-@@ -876,9 +876,9 @@ sink (int argc, char *argv[])
-   enum
-   { YES, NO, DISPLAYED } wrerr;
-   BUF *bp;
--  off_t i, j;
-+  off_t i, j, size;
-   int amt, count, exists, first, mask, mode, ofd, omode;
--  int setimes, size, targisdir, wrerrno;
-+  int setimes, targisdir, wrerrno;
-   char ch, *cp, *np, *targ, *vect[1], buf[BUFSIZ];
-   const char *why;
- 
--- 
-1.9.1
-
diff --git a/meta/recipes-connectivity/inetutils/inetutils/fix-disable-ipv6.patch b/meta/recipes-connectivity/inetutils/inetutils/fix-disable-ipv6.patch
index 24c134fcac..603d2baf9d 100644
--- a/meta/recipes-connectivity/inetutils/inetutils/fix-disable-ipv6.patch
+++ b/meta/recipes-connectivity/inetutils/inetutils/fix-disable-ipv6.patch
@@ -1,17 +1,22 @@
-Upstream: http://www.mail-archive.com/bug-inetutils@gnu.org/msg02103.html
+From c7c27ba763c613f83c1561e56448b49315c271c5 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Wed, 6 Mar 2019 09:36:11 -0500
+Subject: [PATCH] Upstream:
+ http://www.mail-archive.com/bug-inetutils@gnu.org/msg02103.html
 
 Upstream-Status: Pending
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
 ---
  ping/ping_common.h | 20 ++++++++++++++++++++
  1 file changed, 20 insertions(+)
 
 diff --git a/ping/ping_common.h b/ping/ping_common.h
-index 1dfd1b5..3bfbd12 100644
+index 65e3e60..3e84db0 100644
 --- a/ping/ping_common.h
 +++ b/ping/ping_common.h
-@@ -17,10 +17,14 @@
+@@ -18,10 +18,14 @@
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see `http://www.gnu.org/licenses/'. */
  
@@ -26,7 +31,7 @@ index 1dfd1b5..3bfbd12 100644
  #include <icmp.h>
  #include <error.h>
  #include <progname.h>
-@@ -62,7 +66,12 @@ struct ping_stat
+@@ -63,7 +67,12 @@ struct ping_stat
     want to follow the traditional behaviour of ping.  */
  #define DEFAULT_PING_COUNT 0
  
@@ -39,9 +44,9 @@ index 1dfd1b5..3bfbd12 100644
  #define PING_TIMING(s)  ((s) >= sizeof (struct timeval))
  #define PING_DATALEN    (64 - PING_HEADER_LEN)  /* default data length */
  
-@@ -74,13 +83,20 @@ struct ping_stat
-   (t).tv_usec = ((i)%PING_PRECISION)*(1000000/PING_PRECISION) ;\
- } while (0)
+@@ -78,13 +87,20 @@ struct ping_stat
+ 
+ #define PING_MIN_USER_INTERVAL (200000/PING_PRECISION)
  
 +#ifdef HAVE_IPV6
  /* FIXME: Adjust IPv6 case for options and their consumption.  */
@@ -60,7 +65,7 @@ index 1dfd1b5..3bfbd12 100644
  
  typedef int (*ping_efp) (int code,
  			 void *closure,
-@@ -89,13 +105,17 @@ typedef int (*ping_efp) (int code,
+@@ -93,13 +109,17 @@ typedef int (*ping_efp) (int code,
  			 struct ip * ip, icmphdr_t * icmp, int datalen);
  
  union event {
@@ -78,6 +83,3 @@ index 1dfd1b5..3bfbd12 100644
  };
  
  typedef struct ping_data PING;
--- 
-2.8.3
-
diff --git a/meta/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch b/meta/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
index 3da4e9f55a..2974bd4f94 100644
--- a/meta/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
+++ b/meta/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
@@ -1,20 +1,21 @@
-From 552a7d64ad4a7188a9b7cd89933ae7caf7ebfe90 Mon Sep 17 00:00:00 2001
+From f7f785c21306010b2367572250b2822df5bc7728 Mon Sep 17 00:00:00 2001
 From: Mike Frysinger <vapier at gentoo.org>
 Date: Thu, 18 Nov 2010 16:59:14 -0500
-Subject: [PATCH gnulib] printf-parse: pull in features.h for __GLIBC__
+Subject: [PATCH] printf-parse: pull in features.h for __GLIBC__
 
 Upstream-Status: Pending
 
 Signed-off-by: Mike Frysinger <vapier at gentoo.org>
+
 ---
- lib/printf-parse.h |    3 +++
- 1 files changed, 3 insertions(+), 0 deletions(-)
+ lib/printf-parse.h | 3 +++
+ 1 file changed, 3 insertions(+)
 
 diff --git a/lib/printf-parse.h b/lib/printf-parse.h
-index 67a4a2a..3bd6152 100644
+index e7d0f82..d7b4534 100644
 --- a/lib/printf-parse.h
 +++ b/lib/printf-parse.h
-@@ -25,6 +25,9 @@
+@@ -28,6 +28,9 @@
  
  #include "printf-args.h"
  
@@ -24,6 +25,3 @@ index 67a4a2a..3bd6152 100644
  
  /* Flags */
  #define FLAG_GROUP       1      /* ' flag */
--- 
-1.7.3.2
-
diff --git a/meta/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0003-wchar.patch b/meta/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0003-wchar.patch
index b13bb9229f..1ef7e21073 100644
--- a/meta/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0003-wchar.patch
+++ b/meta/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0003-wchar.patch
@@ -1,8 +1,19 @@
+From 9089c6eafbf5903174dce87b68476e35db80beb9 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Wed, 6 Mar 2019 09:36:11 -0500
+Subject: [PATCH] inetutils: Import version 1.9.4
+
 Upstream-Status: Pending
 
---- inetutils-1.8/lib/wchar.in.h
-+++ inetutils-1.8/lib/wchar.in.h
-@@ -70,6 +70,9 @@
+---
+ lib/wchar.in.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/wchar.in.h b/lib/wchar.in.h
+index cdda680..043866a 100644
+--- a/lib/wchar.in.h
++++ b/lib/wchar.in.h
+@@ -77,6 +77,9 @@
  /* The include_next requires a split double-inclusion guard.  */
  #if @HAVE_WCHAR_H@
  # @INCLUDE_NEXT@ @NEXT_WCHAR_H@
diff --git a/meta/recipes-connectivity/inetutils/inetutils/inetutils-1.9-PATH_PROCNET_DEV.patch b/meta/recipes-connectivity/inetutils/inetutils/inetutils-1.9-PATH_PROCNET_DEV.patch
index 2592989a90..460ddf9830 100644
--- a/meta/recipes-connectivity/inetutils/inetutils/inetutils-1.9-PATH_PROCNET_DEV.patch
+++ b/meta/recipes-connectivity/inetutils/inetutils/inetutils-1.9-PATH_PROCNET_DEV.patch
@@ -1,4 +1,10 @@
-inetutils: define PATH_PROCNET_DEV if not already defined
+From 101130f422dd5c01a1459645d7b2a5b8d19720ab Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Wed, 6 Mar 2019 09:36:11 -0500
+Subject: [PATCH] inetutils: define PATH_PROCNET_DEV if not already defined
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
 this prevents the following compilation error :
 system/linux.c:401:15: error: 'PATH_PROCNET_DEV' undeclared (first use in this function)
@@ -9,11 +15,16 @@ this patch comes from :
 Upstream-Status: Inappropriate [not author]
 
 Signed-of-by: Eric Bénard <eric@eukrea.com>
+
 ---
-diff -Naur inetutils-1.9.orig/ifconfig/system/linux.c inetutils-1.9/ifconfig/system/linux.c
---- inetutils-1.9.orig/ifconfig/system/linux.c	2012-01-04 16:31:36.000000000 -0500
-+++ inetutils-1.9/ifconfig/system/linux.c	2012-01-04 16:40:53.000000000 -0500
-@@ -49,6 +49,10 @@
+ ifconfig/system/linux.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/ifconfig/system/linux.c b/ifconfig/system/linux.c
+index e453b46..4268ca9 100644
+--- a/ifconfig/system/linux.c
++++ b/ifconfig/system/linux.c
+@@ -53,6 +53,10 @@
  #include "../ifconfig.h"
  
  
diff --git a/meta/recipes-connectivity/inetutils/inetutils/inetutils-only-check-pam_appl.h-when-pam-enabled.patch b/meta/recipes-connectivity/inetutils/inetutils/inetutils-only-check-pam_appl.h-when-pam-enabled.patch
index ff3abd86aa..7d5c087c9d 100644
--- a/meta/recipes-connectivity/inetutils/inetutils/inetutils-only-check-pam_appl.h-when-pam-enabled.patch
+++ b/meta/recipes-connectivity/inetutils/inetutils/inetutils-only-check-pam_appl.h-when-pam-enabled.patch
@@ -1,15 +1,24 @@
+From 684e45b34a33186bb17bcee0b01814c549a60bf6 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Wed, 6 Mar 2019 09:36:11 -0500
+Subject: [PATCH] inetutils: Import version 1.9.4
+
 Only check security/pam_appl.h which is provided by package libpam when pam is
 enabled.
 
 Upstream-Status: Pending
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
 ---
+ configure.ac | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
 diff --git a/configure.ac b/configure.ac
-index b35e672..e78a751 100644
+index 86136fb..b220319 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -195,6 +195,19 @@ fi
+@@ -183,6 +183,19 @@ AC_SUBST(LIBUTIL)
  
  # See if we have libpam.a.  Investigate PAM versus Linux-PAM.
  if test "$with_pam" = yes ; then
@@ -29,8 +38,8 @@ index b35e672..e78a751 100644
    AC_CHECK_LIB(dl, dlopen, LIBDL=-ldl)
    AC_CHECK_LIB(pam, pam_authenticate, LIBPAM=-lpam)
    if test "$ac_cv_lib_pam_pam_authenticate" = yes ; then
-@@ -587,7 +600,7 @@ AC_HEADER_DIRENT
- AC_CHECK_HEADERS([arpa/nameser.h errno.h fcntl.h features.h \
+@@ -620,7 +633,7 @@ AC_HEADER_DIRENT
+ AC_CHECK_HEADERS([arpa/nameser.h arpa/tftp.h errno.h fcntl.h features.h \
  		  glob.h memory.h netinet/ether.h netinet/in_systm.h \
  		  netinet/ip.h netinet/ip_icmp.h netinet/ip_var.h \
 -		  security/pam_appl.h shadow.h \
diff --git a/meta/recipes-connectivity/inetutils/inetutils/version.patch b/meta/recipes-connectivity/inetutils/inetutils/version.patch
deleted file mode 100644
index 532a0e5c08..0000000000
--- a/meta/recipes-connectivity/inetutils/inetutils/version.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Pending
-
-remove m4_esyscmd function
-
-Signed-off-by: Chunrong Guo <b40290@freescale.com>
---- inetutils-1.9.1/configure.ac	2012-01-06 22:05:05.000000000 +0800
-+++ inetutils-1.9.1/configure.ac	2012-11-12 14:01:11.732957019 +0800
-@@ -20,8 +20,7 @@
- 
- AC_PREREQ(2.59)
- 
--AC_INIT([GNU inetutils],
-- m4_esyscmd([build-aux/git-version-gen .tarball-version 's/inetutils-/v/;s/_/./g']),
-+AC_INIT([GNU inetutils],[1.9.4],
-  [bug-inetutils@gnu.org])
- 
- AC_CONFIG_SRCDIR([src/inetd.c])
diff --git a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta/recipes-connectivity/inetutils/inetutils_2.0.bb
similarity index 95%
rename from meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
rename to meta/recipes-connectivity/inetutils/inetutils_2.0.bb
index 09a196ad9d..a4d05b0542 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.0.bb
@@ -10,8 +10,7 @@ LICENSE = "GPLv3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7"
 
-SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
-           file://version.patch \
+SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch \
            file://inetutils-1.8-0003-wchar.patch \
            file://rexec.xinetd.inetutils  \
@@ -21,13 +20,9 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
            file://tftpd.xinetd.inetutils \
            file://inetutils-1.9-PATH_PROCNET_DEV.patch \
            file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch \
-           file://0001-rcp-fix-to-work-with-large-files.patch \
-           file://fix-buffer-fortify-tfpt.patch \
-           file://0001-ftpd-telnetd-Fix-multiple-definitions-of-errcatch-an.patch \
 "
 
-SRC_URI[md5sum] = "04852c26c47cc8c6b825f2b74f191f52"
-SRC_URI[sha256sum] = "be8f75eff936b8e41b112462db51adf689715658a1b09e0d6b05d11ec92cc616"
+SRC_URI[md5sum] = "5e1018502cd131ed8e42339f6b5c98aa"
 
 inherit autotools gettext update-alternatives texinfo
 
-- 
2.25.1

