Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PzRGi-0005Z3-Pd
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Mar 2011 11:14:24 +0100
Received: by mail-bw0-f47.google.com with SMTP id 10so363080bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2011 03:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=p133kod8SM5a3JyGu5iqx6WnalTkuskbPuRqJO4oCBI=;
	b=S9I88KppCh6PZulthsE0Mo6g20VeeQNKL9iaI9brYOZpBu0/V7x7/LJVnzl8wh3xlj
	Zct8Bon3PrmIRVskmlFG2BHOUYtxOiZl0MtFsDpK0n7ZjO0HJUwAUsY4KpOgCN/Nf+St
	+/zWLOlvBWkItVHvMpzqPw40H5RDGlXz76uh4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=eCe7wz0ofOT82KarJjmSyLafj4ytz8HJCkQdnjgpGsc+iY2Xsz6fURiQO+SDk9tqoT
	J9GRquaoZi2C05sZJoykTy+1U3DR6Lq0URpNjDTlrD2k8HXdmo/QQILL90uv3r+rQLqx
	yi21ABt+aZ11goc6qR2dnDo/q754/GA6Ip2i8=
Received: by 10.204.25.20 with SMTP id x20mr4252412bkb.112.1300183965287;
	Tue, 15 Mar 2011 03:12:45 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id w3sm5841813bkt.5.2011.03.15.03.12.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Mar 2011 03:12:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Mar 2011 11:12:38 +0100
Message-Id: <374ceeabee70751c5219f1f7fecca0118e7613c4.1300183818.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1300183818.git.Martin.Jansa@gmail.com>
References: <cover.1300183818.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/3] util-linux: remove unused files from util-linux-2.17.2 directory
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
X-List-Received-Date: Tue, 15 Mar 2011 10:14:24 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../util-linux/util-linux-2.17.2/tls.patch         |   70 --------------------
 1 files changed, 0 insertions(+), 70 deletions(-)
 delete mode 100644 meta/recipes-core/util-linux/util-linux-2.17.2/tls.patch

diff --git a/meta/recipes-core/util-linux/util-linux-2.17.2/tls.patch b/meta/recipes-core/util-linux/util-linux-2.17.2/tls.patch
deleted file mode 100644
index bdb29ca..0000000
--- a/meta/recipes-core/util-linux/util-linux-2.17.2/tls.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-Index: util-linux-ng-2.16/m4/tls.m4
-===================================================================
---- util-linux-ng-2.16.orig/m4/tls.m4	2009-07-04 01:20:03.000000000 +0200
-+++ util-linux-ng-2.16/m4/tls.m4	2009-07-30 01:57:30.151697033 +0200
-@@ -18,31 +18,26 @@
- # version as well.
- #
- AC_DEFUN([AX_TLS], [
--  AC_MSG_CHECKING(for thread local storage (TLS) class)
--  AC_CACHE_VAL(ac_cv_tls, [
--    ax_tls_keywords="__thread __declspec(thread) none"
--    for ax_tls_keyword in $ax_tls_keywords; do
--       case $ax_tls_keyword in
--          none) ac_cv_tls=none ; break ;;
--          *)
--             AC_TRY_COMPILE(
--                [#include <stdlib.h>
--                 static void
--                 foo(void) {
--                 static ] $ax_tls_keyword [ int bar;
--                 exit(1);
--                 }],
--                 [],
--                 [ac_cv_tls=$ax_tls_keyword ; break],
--                 ac_cv_tls=none
--             )
--          esac
--    done
--])
-+  AC_CACHE_CHECK([for thread local storage (TLS) class],
-+    ac_cv_tls,
-+    [AC_LINK_IFELSE([__thread int a; int b; int main() { return a = b; }],
-+	 [chktls_save_LDFLAGS="$LDFLAGS"
-+	  LDFLAGS="-shared -Wl,--no-undefined $LDFLAGS"
-+	  chktls_save_CFLAGS="$CFLAGS"
-+	  CFLAGS="-fPIC $CFLAGS"
-+	  dnl If -shared works, test if TLS works in a shared library.
-+	  AC_LINK_IFELSE([int f() { return 0; }],
-+	    AC_LINK_IFELSE([__thread int a; int b; int f() { return a = b; }],
-+	      [ac_cv_tls=yes],
-+	      [ac_cv_tls=no]),
-+	    [ac_cv_tls=yes])
-+	  CFLAGS="$chktls_save_CFLAGS"
-+	  LDFLAGS="$chktls_save_LDFLAGS"], [ac_cv_tls=no])
-+    ])
- 
--  if test "$ac_cv_tls" != "none"; then
--    dnl AC_DEFINE([TLS], [], [If the compiler supports a TLS storage class define it to that here])
--    AC_DEFINE_UNQUOTED([TLS], $ac_cv_tls, [If the compiler supports a TLS storage class define it to that here])
--  fi
--  AC_MSG_RESULT($ac_cv_tls)
-+  AS_IF([test "x$ac_cv_tls" = "xyes"],
-+    [AC_DEFINE([TLS], 1,
-+     [Define this if the compiler supports __thread for Thread-Local Storage])
-+     $1],
-+    [$2])
- ])
-Index: util-linux-ng-2.16/shlibs/uuid/src/gen_uuid.c
-===================================================================
---- util-linux-ng-2.16.orig/shlibs/uuid/src/gen_uuid.c	2009-07-30 02:31:48.518159459 +0200
-+++ util-linux-ng-2.16/shlibs/uuid/src/gen_uuid.c	2009-07-30 02:32:04.867871183 +0200
-@@ -99,7 +99,7 @@
- #endif
- 
- #ifdef TLS
--#define THREAD_LOCAL static TLS
-+#define THREAD_LOCAL static __thread
- #else
- #define THREAD_LOCAL static
- #endif
-- 
1.7.4.1



