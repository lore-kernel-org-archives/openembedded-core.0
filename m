Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web12.25234.1591602530734509843
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PQIvdfS0;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id g1so12578610edv.6
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PaNiwWXySfzjhozrh5jqqvSgomS3XWUShs7PA/Fl6UA=;
        b=PQIvdfS0rKkLYalCszGlPC3VLB2Zc7uA7VPU6RXtOUjhR9h69esulr6lEn38YXx5XT
         GXR2Uvub7hSzQH096JP7WyY4YRtEpWNBtbATzrMpBlEPmtfJiekUF+7edDtWeSNK1e7b
         xHCvGAh1Q377fnHq9yrEGnB/ohCasGX6dgXEUm1zykcO5ZZ2QKZtZNXVBF/3dNTlsOXG
         ExarOEhvFslw734/fdUZoGmja1df6r/YZX1qudMPi8lZPbBag6IYlpVLkfGdFpBOsO+/
         JxlEq8W0zxqtTztpnPlPgkcdpn6o9fUYo1fLd3o0siyOYYfQS1lf6wTG/I6XWEzpQamm
         2GiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PaNiwWXySfzjhozrh5jqqvSgomS3XWUShs7PA/Fl6UA=;
        b=GCZ1nBlIA5xTpUhd4pyqOw5vZ0BpSgr5mFQgg6VfWrjzaogxRLWLBZ2FR4R8E4dX0t
         vhvo9G57HucM/KEkwgFZk4NHO25yMwss2goP1hb6cbJyCNipAX5pa+zquPlXKEa1kQiO
         Hpx5qv2FvGWbxQ5lJ6357kmUzhIizHWJi1pMI+fmVPBk94M+BrabuJmS6fHdj534j4+D
         wqF1+daTZ6/gy+R3slgK5H03UX5CiK94ggVWYlUpdBnsyP8UkzOqrAy5GxOV/655XaEQ
         +3wjxBQLGrteAdhLixHzpkhHTTYW35cxD5tH109uu94HrvCSbc7WBZNDtaoZonIDqZUz
         CRiA==
X-Gm-Message-State: AOAM533E7BmDYVDWbi0kJPTD+zXdcfYZZ2M7tYo1nUE8lyb2UF8/jNb3
	Mm547NtK9Nin5rpiqRUfpZsp+C1SfC8=
X-Google-Smtp-Source: ABdhPJytvu4N9ZRjTLzDmJu+3maDKrx/xMXknHhVcyuLjfLKyQ7agAx0As6Ua9Cf1wGVVGesQ1Cy6A==
X-Received: by 2002:a50:a418:: with SMTP id u24mr21696013edb.141.1591602528228;
        Mon, 08 Jun 2020 00:48:48 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:47 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 39/42] xinetd: 2.3.15 -> 2.3.15.4
Date: Mon,  8 Jun 2020 09:46:56 +0200
Message-Id: <20200608074659.7051-39-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is updating from an old version from abandoned upstream repo to
an actively maintained opensuse fork, hence all the changes and cleanups.

License-Update: added suse copyrights
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...VE_SYS_RESOURCE_H-to-guard-sys-resou.patch | 100 ----------------
 ...-from-inetd.conf-if-a-service-with-t.patch |  86 --------------
 ...s-fixes-from-the-previous-maintainer.patch |  79 ------------
 .../xinetd/xinetd/xinetd-CVE-2013-4342.patch  |  34 ------
 ...e-able-to-listen-on-IPv6-even-in-ine.patch | 112 ------------------
 .../xinetd/xinetd/xinetd.conf                 |  11 --
 .../xinetd/xinetd_2.3.15.4.bb                 |  47 ++++++++
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb |  75 ------------
 8 files changed, 47 insertions(+), 497 deletions(-)
 delete mode 100644 meta/recipes-extended/xinetd/xinetd/0001-configure-Use-HAVE_SYS_RESOURCE_H-to-guard-sys-resou.patch
 delete mode 100644 meta/recipes-extended/xinetd/xinetd/Disable-services-from-inetd.conf-if-a-service-with-t.patch
 delete mode 100644 meta/recipes-extended/xinetd/xinetd/Various-fixes-from-the-previous-maintainer.patch
 delete mode 100644 meta/recipes-extended/xinetd/xinetd/xinetd-CVE-2013-4342.patch
 delete mode 100644 meta/recipes-extended/xinetd/xinetd/xinetd-should-be-able-to-listen-on-IPv6-even-in-ine.patch
 delete mode 100644 meta/recipes-extended/xinetd/xinetd/xinetd.conf
 create mode 100644 meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
 delete mode 100644 meta/recipes-extended/xinetd/xinetd_2.3.15.bb

diff --git a/meta/recipes-extended/xinetd/xinetd/0001-configure-Use-HAVE_SYS_RESOURCE_H-to-guard-sys-resou.patch b/meta/recipes-extended/xinetd/xinetd/0001-configure-Use-HAVE_SYS_RESOURCE_H-to-guard-sys-resou.patch
deleted file mode 100644
index 3c1b2f6f0e..0000000000
--- a/meta/recipes-extended/xinetd/xinetd/0001-configure-Use-HAVE_SYS_RESOURCE_H-to-guard-sys-resou.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From e8b0ffc7ea04cc71dba97a38e1a134aaf2285c2d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 30 Dec 2015 07:14:50 +0000
-Subject: [PATCH] configure: Use HAVE_SYS_RESOURCE_H to guard sys/resource.h
- inclusion
-
-HAVE_RLIM_T check will not let sys/resource.h to be checked and
-rlim_t is defined in sys/resource.h so the check would fail.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- aclocal.m4 |  2 +-
- configure  | 14 +++++++-------
- 2 files changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/aclocal.m4 b/aclocal.m4
-index 6e6f32c..70e7076 100644
---- a/aclocal.m4
-+++ b/aclocal.m4
-@@ -11,7 +11,7 @@ AC_CACHE_VAL(xinetd_cv_type_$1,
- #if HAVE_NETDB_H
- #include <netdb.h>
- #endif
--#if HAVE_RLIM_T
-+#if HAVE_SYS_RESOURCE_H
- #include <sys/resource.h>
- #endif
- #if HAVE_STDINT_H
-diff --git a/configure b/configure
-index b507d38..bec56ea 100755
---- a/configure
-+++ b/configure
-@@ -7640,7 +7640,7 @@ cat >>conftest.$ac_ext <<_ACEOF
- #if HAVE_NETDB_H
- #include <netdb.h>
- #endif
--#if HAVE_RLIM_T
-+#if HAVE_SYS_RESOURCE_H
- #include <sys/resource.h>
- #endif
- #if HAVE_STDINT_H
-@@ -7686,7 +7686,7 @@ cat >>conftest.$ac_ext <<_ACEOF
- #if HAVE_NETDB_H
- #include <netdb.h>
- #endif
--#if HAVE_RLIM_T
-+#if HAVE_SYS_RESOURCE_H
- #include <sys/resource.h>
- #endif
- #if HAVE_STDINT_H
-@@ -7732,7 +7732,7 @@ cat >>conftest.$ac_ext <<_ACEOF
- #if HAVE_NETDB_H
- #include <netdb.h>
- #endif
--#if HAVE_RLIM_T
-+#if HAVE_SYS_RESOURCE_H
- #include <sys/resource.h>
- #endif
- #if HAVE_STDINT_H
-@@ -7778,7 +7778,7 @@ cat >>conftest.$ac_ext <<_ACEOF
- #if HAVE_NETDB_H
- #include <netdb.h>
- #endif
--#if HAVE_RLIM_T
-+#if HAVE_SYS_RESOURCE_H
- #include <sys/resource.h>
- #endif
- #if HAVE_STDINT_H
-@@ -7824,7 +7824,7 @@ cat >>conftest.$ac_ext <<_ACEOF
- #if HAVE_NETDB_H
- #include <netdb.h>
- #endif
--#if HAVE_RLIM_T
-+#if HAVE_SYS_RESOURCE_H
- #include <sys/resource.h>
- #endif
- #if HAVE_STDINT_H
-@@ -7870,7 +7870,7 @@ cat >>conftest.$ac_ext <<_ACEOF
- #if HAVE_NETDB_H
- #include <netdb.h>
- #endif
--#if HAVE_RLIM_T
-+#if HAVE_SYS_RESOURCE_H
- #include <sys/resource.h>
- #endif
- #if HAVE_STDINT_H
-@@ -7916,7 +7916,7 @@ cat >>conftest.$ac_ext <<_ACEOF
- #if HAVE_NETDB_H
- #include <netdb.h>
- #endif
--#if HAVE_RLIM_T
-+#if HAVE_SYS_RESOURCE_H
- #include <sys/resource.h>
- #endif
- #if HAVE_STDINT_H
--- 
-2.6.4
-
diff --git a/meta/recipes-extended/xinetd/xinetd/Disable-services-from-inetd.conf-if-a-service-with-t.patch b/meta/recipes-extended/xinetd/xinetd/Disable-services-from-inetd.conf-if-a-service-with-t.patch
deleted file mode 100644
index cd6e6c1078..0000000000
--- a/meta/recipes-extended/xinetd/xinetd/Disable-services-from-inetd.conf-if-a-service-with-t.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-Upstream-Status: Pending [from other distro Debian]
-
-From d588b6530e1382a624898b3f4307f636c72c80a9 Mon Sep 17 00:00:00 2001
-From: Pierre Habouzit <madcoder@debian.org>
-Date: Wed, 28 Nov 2007 10:13:08 +0100
-Subject: [PATCH] Disable services from inetd.conf if a service with the same id exists.
-
-  This way, if a service is enabled in /etc/xinetd* _and_ in
-/etc/inetd.conf, the one (even if disabled) from /etc/xinetd* takes
-precedence.
-
-Signed-off-by: Pierre Habouzit <madcoder@debian.org>
----
- xinetd/inet.c |   22 +++++++++++++++++++---
- 1 files changed, 19 insertions(+), 3 deletions(-)
-
-diff --git a/xinetd/inet.c b/xinetd/inet.c
-index 1cb2ba2..8caab45 100644
---- a/xinetd/inet.c
-+++ b/xinetd/inet.c
-@@ -23,6 +23,8 @@
- #include "parsesup.h"
- #include "nvlists.h"
- 
-+static psi_h iter ;
-+
- static int get_next_inet_entry( int fd, pset_h sconfs, 
-                           struct service_config *defaults);
- 
-@@ -32,12 +34,15 @@ void parse_inet_conf_file( int fd, struct configuration *confp )
-    struct service_config *default_config = CNF_DEFAULTS( confp );
-    
-    line_count = 0;
-+   iter = psi_create (sconfs);
- 
-    for( ;; )
-    {   
-       if (get_next_inet_entry(fd, sconfs, default_config) == -2)
-          break;
-    }
-+
-+   psi_destroy(iter);
- }
- 
- static int get_next_inet_entry( int fd, pset_h sconfs, 
-@@ -46,7 +51,7 @@ static int get_next_inet_entry( int fd, pset_h sconfs,
-    char *p;
-    str_h strp;
-    char *line = next_line(fd);
--   struct service_config *scp;
-+   struct service_config *scp, *tmp;
-    unsigned u, i;
-    const char *func = "get_next_inet_entry";
-    char *name = NULL, *rpcvers = NULL, *rpcproto = NULL;
-@@ -405,7 +410,16 @@ static int get_next_inet_entry( int fd, pset_h sconfs,
-    SC_SPECIFY( scp, A_SOCKET_TYPE );
-    SC_SPECIFY( scp, A_WAIT );
- 
--   if( ! pset_add(sconfs, scp) )
-+   for ( tmp = SCP( psi_start( iter ) ) ; tmp ; tmp = SCP( psi_next(iter)) ){
-+      if (EQ(SC_ID(scp), SC_ID(tmp))) {
-+         parsemsg(LOG_DEBUG, func, "removing duplicate service %s", SC_NAME(scp));
-+         sc_free(scp);
-+         scp = NULL;
-+         break;
-+      }
-+   }
-+
-+   if( scp && ! pset_add(sconfs, scp) )
-    {
-       out_of_memory( func );
-       pset_destroy(args);
-@@ -414,7 +428,9 @@ static int get_next_inet_entry( int fd, pset_h sconfs,
-    }
- 
-    pset_destroy(args);
--   parsemsg( LOG_DEBUG, func, "added service %s", SC_NAME(scp));
-+   if (scp) {
-+      parsemsg( LOG_DEBUG, func, "added service %s", SC_NAME(scp));
-+   }
-    return 0;
- }
- 
--- 
-1.5.3.6.2040.g15e6
-
diff --git a/meta/recipes-extended/xinetd/xinetd/Various-fixes-from-the-previous-maintainer.patch b/meta/recipes-extended/xinetd/xinetd/Various-fixes-from-the-previous-maintainer.patch
deleted file mode 100644
index 8e59cdcaae..0000000000
--- a/meta/recipes-extended/xinetd/xinetd/Various-fixes-from-the-previous-maintainer.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-Upstream-Status: Pending [from other distro Debian]
-
-From a3410b0bc81ab03a889d9ffc14e351badf8372f1 Mon Sep 17 00:00:00 2001
-From: Pierre Habouzit <madcoder@debian.org>
-Date: Mon, 26 Nov 2007 16:02:04 +0100
-Subject: [PATCH] Various fixes from the previous maintainer.
-
----
- xinetd/child.c   |   20 +++++++++++++++++---
- xinetd/service.c |    8 ++++----
- 2 files changed, 21 insertions(+), 7 deletions(-)
-
-diff --git a/xinetd/child.c b/xinetd/child.c
-index 89ee54c..48e9615 100644
---- a/xinetd/child.c
-+++ b/xinetd/child.c
-@@ -284,6 +284,7 @@ void child_process( struct server *serp )
-    connection_s            *cp  = SERVER_CONNECTION( serp ) ;
-    struct service_config   *scp = SVC_CONF( sp ) ;
-    const char              *func = "child_process" ;
-+   int                     fd, null_fd;
- 
-    signal_default_state();
- 
-@@ -296,9 +297,22 @@ void child_process( struct server *serp )
-    signals_pending[0] = -1;
-    signals_pending[1] = -1;
- 
--   Sclose(0);
--   Sclose(1);
--   Sclose(2);
-+   if ( ( null_fd = open( "/dev/null", O_RDONLY ) ) == -1 )
-+   {
-+      msg( LOG_ERR, func, "open('/dev/null') failed: %m") ;
-+      _exit( 1 ) ;
-+   }
-+
-+   for ( fd = 0 ; fd <= MAX_PASS_FD ; fd++ )
-+   {
-+      if ( fd != null_fd && dup2( null_fd, fd ) == -1 )
-+      {
-+         msg( LOG_ERR, func, "dup2(%d, %d) failed: %m") ;
-+         _exit( 1 ) ;
-+      }
-+   }
-+   if ( null_fd > MAX_PASS_FD )
-+      (void) Sclose( null_fd ) ;
- 
- 
- #ifdef DEBUG_SERVER
-diff --git a/xinetd/service.c b/xinetd/service.c
-index 3d68d78..0132d6c 100644
---- a/xinetd/service.c
-+++ b/xinetd/service.c
-@@ -745,8 +745,8 @@ static status_e failed_service(struct service *sp,
-                return FAILED;
- 
-             if ( last == NULL ) {
--               last = SAIN( calloc( 1, sizeof(union xsockaddr) ) );
--	       SVC_LAST_DGRAM_ADDR(sp) = (union xsockaddr *)last;
-+	    SVC_LAST_DGRAM_ADDR(sp) =  SAIN( calloc( 1, sizeof(union xsockaddr) ) );
-+	    last = SAIN( SVC_LAST_DGRAM_ADDR(sp) );
-             }
- 
-             (void) time( &current_time ) ;
-@@ -772,8 +772,8 @@ static status_e failed_service(struct service *sp,
-                return FAILED;
- 
- 	    if( last == NULL ) {
--               last = SAIN6(calloc( 1, sizeof(union xsockaddr) ) );
--	       SVC_LAST_DGRAM_ADDR( sp ) = (union xsockaddr *)last;
-+	    SVC_LAST_DGRAM_ADDR(sp) = SAIN6(calloc( 1, sizeof(union xsockaddr) ) );
-+            last = SAIN6(SVC_LAST_DGRAM_ADDR(sp));
-             }
- 
-             (void) time( &current_time ) ;
--- 
-1.5.3.6.2040.g15e6
-
diff --git a/meta/recipes-extended/xinetd/xinetd/xinetd-CVE-2013-4342.patch b/meta/recipes-extended/xinetd/xinetd/xinetd-CVE-2013-4342.patch
deleted file mode 100644
index 852a43f2de..0000000000
--- a/meta/recipes-extended/xinetd/xinetd/xinetd-CVE-2013-4342.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-xinetd: CVE-2013-4342
-
-xinetd does not enforce the user and group configuration directives
-for TCPMUX services, which causes these services to be run as root
-and makes it easier for remote attackers to gain privileges by
-leveraging another vulnerability in a service.
-http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4342
-
-the patch come from:
-https://bugzilla.redhat.com/attachment.cgi?id=799732&action=diff
-
-CVE: CVE-2013-4342
-Signed-off-by: Li Wang <li.wang@windriver.com>
-Upstream-Status: Backport
----
- xinetd/builtins.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/xinetd/builtins.c b/xinetd/builtins.c
-index 3b85579..34a5bac 100644
---- a/xinetd/builtins.c
-+++ b/xinetd/builtins.c
-@@ -617,7 +617,7 @@ static void tcpmux_handler( const struct server *serp )
-    if( SC_IS_INTERNAL( scp ) ) {
-       SC_INTERNAL(scp, nserp);
-    } else {
--      exec_server(nserp);
-+      child_process(nserp);
-    }
- }
- 
--- 
-1.7.9.5
-
diff --git a/meta/recipes-extended/xinetd/xinetd/xinetd-should-be-able-to-listen-on-IPv6-even-in-ine.patch b/meta/recipes-extended/xinetd/xinetd/xinetd-should-be-able-to-listen-on-IPv6-even-in-ine.patch
deleted file mode 100644
index 2365ca123b..0000000000
--- a/meta/recipes-extended/xinetd/xinetd/xinetd-should-be-able-to-listen-on-IPv6-even-in-ine.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-Upstream-Status: Pending [from other distro Debian]
-
-From f44b218ccc779ab3f4aed072390ccf129d94b58d Mon Sep 17 00:00:00 2001
-From: David Madore <david@pleiades.stars>
-Date: Mon, 24 Mar 2008 12:45:36 +0100
-Subject: [PATCH] xinetd should be able to listen on IPv6 even in -inetd_compat mode
-
-xinetd does not bind to IPv6 addresses (and does not seem to have an
-option to do so) when used in -inetd_compat mode.  As current inetd's
-are IPv6-aware, this is a problem: this means xinetd cannot be used as
-a drop-in inetd replacement.
-
-The attached patch is a suggestion: it adds a -inetd_ipv6 global
-option that, if used, causes inetd-compatibility lines to have an
-implicit "IPv6" option.  Perhaps this is not the best solution, but
-there should definitely be a way to get inetd.conf to be read in
-IPv6-aware mode.
----
- xinetd/confparse.c |    1 +
- xinetd/inet.c      |   17 +++++++++++++++++
- xinetd/options.c   |    3 +++
- xinetd/xinetd.man  |    6 ++++++
- 4 files changed, 27 insertions(+), 0 deletions(-)
-
-diff --git a/xinetd/confparse.c b/xinetd/confparse.c
-index db9f431..d7b0bcc 100644
---- a/xinetd/confparse.c
-+++ b/xinetd/confparse.c
-@@ -40,6 +40,7 @@
- #include "inet.h"
- #include "main.h"
- 
-+extern int inetd_ipv6;
- extern int inetd_compat;
- 
- /*
-diff --git a/xinetd/inet.c b/xinetd/inet.c
-index 8caab45..2e617ae 100644
---- a/xinetd/inet.c
-+++ b/xinetd/inet.c
-@@ -25,6 +25,8 @@
- 
- static psi_h iter ;
- 
-+extern int inetd_ipv6;
-+
- static int get_next_inet_entry( int fd, pset_h sconfs, 
-                           struct service_config *defaults);
- 
-@@ -360,6 +362,21 @@ static int get_next_inet_entry( int fd, pset_h sconfs,
-          }
-          SC_SERVER_ARGV(scp)[u] = p;
-       }
-+
-+      /* Set the IPv6 flag if we were passed the -inetd_ipv6 option */
-+      if ( inetd_ipv6 )
-+      {
-+         nvp = nv_find_value( service_flags, "IPv6" );
-+         if ( nvp == NULL )
-+         {
-+            parsemsg( LOG_WARNING, func, "inetd.conf - Bad foo %s", name ) ;
-+            pset_destroy(args);
-+            sc_free(scp);
-+            return -1;
-+         }
-+         M_SET(SC_XFLAGS(scp), nvp->value);
-+      }
-+
-       /* Set the reuse flag, as this is the default for inetd */
-       nvp = nv_find_value( service_flags, "REUSE" );
-       if ( nvp == NULL )
-diff --git a/xinetd/options.c b/xinetd/options.c
-index b058b6a..dc2f3a0 100644
---- a/xinetd/options.c
-+++ b/xinetd/options.c
-@@ -30,6 +30,7 @@ int logprocs_option ;
- unsigned logprocs_option_arg ;
- int stayalive_option=0;
- char *program_name ;
-+int inetd_ipv6 = 0 ;
- int inetd_compat = 0 ;
- int dont_fork = 0;
- 
-@@ -128,6 +129,8 @@ int opt_recognize( int argc, char *argv[] )
-             fprintf(stderr, "\n");
-             exit(0);
-          }
-+         else if ( strcmp ( &argv[ arg ][ 1 ], "inetd_ipv6" ) == 0 )
-+            inetd_ipv6 = 1;
-          else if ( strcmp ( &argv[ arg ][ 1 ], "inetd_compat" ) == 0 )
-             inetd_compat = 1;
-       }
-diff --git a/xinetd/xinetd.man b/xinetd/xinetd.man
-index c76c3c6..c9dd803 100644
---- a/xinetd/xinetd.man
-+++ b/xinetd/xinetd.man
-@@ -106,6 +106,12 @@ This option causes xinetd to read /etc/inetd.conf in addition to the
- standard xinetd config files.  /etc/inetd.conf is read after the
- standard xinetd config files.
- .TP
-+.BI \-inetd_ipv6
-+This option causes xinetd to bind to IPv6 (AF_INET6) addresses for
-+inetd compatibility lines (see previous option).  This only affects
-+how /etc/inetd.conf is interpreted and thus only has any effect if
-+the \-inetd_compat option is also used.
-+.TP
- .BI \-cc " interval"
- This option instructs
- .B xinetd
--- 
-1.5.5.rc0.127.gb4337
-
diff --git a/meta/recipes-extended/xinetd/xinetd/xinetd.conf b/meta/recipes-extended/xinetd/xinetd/xinetd.conf
deleted file mode 100644
index 9e6ea2577e..0000000000
--- a/meta/recipes-extended/xinetd/xinetd/xinetd.conf
+++ /dev/null
@@ -1,11 +0,0 @@
-# Simple configuration file for xinetd
-#
-# Some defaults, and include /etc/xinetd.d/
-
-defaults
-{
-
-
-}
-
-includedir /etc/xinetd.d
diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
new file mode 100644
index 0000000000..4f0f9531a1
--- /dev/null
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
@@ -0,0 +1,47 @@
+SUMMARY = "Socket-based service activation daemon"
+HOMEPAGE = "https://github.com/xinetd-org/xinetd"
+
+# xinetd is a BSD-like license
+# Apple and Gentoo say BSD here.
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=55c5fdf02cfcca3fc9621b6f2ceae10f"
+
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
+
+SRC_URI = "git://github.com/openSUSE/xinetd.git;protocol=https \
+           file://xinetd.init \
+           file://xinetd.default \
+           file://xinetd.service \
+           "
+
+SRCREV = "6a4af7786630ce48747d9687e2f18f45ea6684c4"
+
+S = "${WORKDIR}/git"
+
+inherit autotools update-rc.d systemd pkgconfig
+
+SYSTEMD_SERVICE_${PN} = "xinetd.service"
+
+INITSCRIPT_NAME = "xinetd"
+INITSCRIPT_PARAMS = "defaults"
+
+PACKAGECONFIG ??= "tcp-wrappers"
+PACKAGECONFIG[tcp-wrappers] = "--with-libwrap,,tcp-wrappers"
+
+CONFFILES_${PN} = "${sysconfdir}/xinetd.conf"
+
+do_install_append() {
+       install -d "${D}${sysconfdir}/init.d"
+       install -d "${D}${sysconfdir}/default"
+       install -m 755 "${WORKDIR}/xinetd.init" "${D}${sysconfdir}/init.d/xinetd"
+       install -m 644 "${WORKDIR}/xinetd.default" "${D}${sysconfdir}/default/xinetd"
+
+       # Install systemd unit files
+       install -d ${D}${systemd_unitdir}/system
+       install -m 0644 ${WORKDIR}/xinetd.service ${D}${systemd_unitdir}/system
+       sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
+              -e 's,@SBINDIR@,${sbindir},g' \
+              ${D}${systemd_unitdir}/system/xinetd.service
+}
+
+RDEPENDS_${PN} += "perl"
diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
deleted file mode 100644
index 8f8f846bfb..0000000000
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
+++ /dev/null
@@ -1,75 +0,0 @@
-SUMMARY = "Socket-based service activation daemon"
-HOMEPAGE = "https://github.com/xinetd-org/xinetd"
-
-# xinetd is a BSD-like license
-# Apple and Gentoo say BSD here.
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=8ad8615198542444f84d28a6cf226dd8"
-
-DEPENDS += "libtirpc"
-PR = "r2"
-
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
-
-SRC_URI = "git://github.com/openSUSE/xinetd.git;protocol=https \
-      file://xinetd.init \
-      file://xinetd.conf \
-      file://xinetd.default \
-      file://Various-fixes-from-the-previous-maintainer.patch \
-      file://Disable-services-from-inetd.conf-if-a-service-with-t.patch \
-      file://xinetd-should-be-able-to-listen-on-IPv6-even-in-ine.patch \
-      file://xinetd-CVE-2013-4342.patch \
-      file://0001-configure-Use-HAVE_SYS_RESOURCE_H-to-guard-sys-resou.patch \
-      file://xinetd.service \
-      "
-
-SRCREV = "68bb9ab9e9f214ad8a2322f28ac1d6733e70bc24"
-
-S = "${WORKDIR}/git"
-
-inherit autotools update-rc.d systemd
-
-SYSTEMD_SERVICE_${PN} = "xinetd.service"
-
-INITSCRIPT_NAME = "xinetd"
-INITSCRIPT_PARAMS = "defaults"
-
-EXTRA_OECONF="--disable-nls"
-
-PACKAGECONFIG ??= "tcp-wrappers"
-PACKAGECONFIG[tcp-wrappers] = "--with-libwrap,,tcp-wrappers"
-
-CFLAGS += "-I${STAGING_INCDIR}/tirpc"
-LDFLAGS += "-ltirpc"
-
-do_configure() {
-	# Looks like configure.in is broken, so we are skipping
-	# rebuilding configure and are just using the shipped one
-	( cd ${S}; gnu-configize --force )
-	oe_runconf
-}
-
-do_install() {
-	# Same here, the Makefile does some really stupid things,
-	# but since we only want two files why not override
-	# do_install from autotools and doing it ourselfs?
-	install -d "${D}${sbindir}"
-	install -d "${D}${sysconfdir}/init.d"
-	install -d "${D}${sysconfdir}/xinetd.d"
-	install -d "${D}${sysconfdir}/default"
-	install -m 644 "${WORKDIR}/xinetd.conf" "${D}${sysconfdir}"
-	install -m 755 "${WORKDIR}/xinetd.init" "${D}${sysconfdir}/init.d/xinetd"
-	install -m 644 "${WORKDIR}/xinetd.default" "${D}${sysconfdir}/default/xinetd"
-	install -m 755 "${B}/xinetd/xinetd" "${D}${sbindir}"
-	install -m 755 "${B}/xinetd/itox" "${D}${sbindir}"
-	install -m 664 ${S}/contrib/xinetd.d/* ${D}${sysconfdir}/xinetd.d
-
-	# Install systemd unit files
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/xinetd.service ${D}${systemd_unitdir}/system
-	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
-	       -e 's,@SBINDIR@,${sbindir},g' \
-	       ${D}${systemd_unitdir}/system/xinetd.service
-}
-
-CONFFILES_${PN} = "${sysconfdir}/xinetd.conf"
-- 
2.26.2

