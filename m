Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 31F6D77138
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Feb 2016 23:15:13 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id sv5so919359pab.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Feb 2016 15:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=23DSSrcVqXCF/z6nlKpdHjcL/7cJ41yvrhLlxivr//Q=;
	b=ykszh90kjtUBTX7/WEP6il4N9i350W+BmvAiXj4fVfeC8l2BAxSI13wmbanBgO6PSP
	amqqUwA25B0/z3xWTYvXR41YA5J6ct2FGVCynKc2wjux95GhGjmLItosh+XD72cmlrqH
	ymYykKYF0CtjeVeFC1jaGiXljRRlQQP/w8NimeojwHNdQ2KrIIpPUeSiL5BNQVWLAcBe
	piIoj17Yy6ZVnQtmRGcTmCEwe9uuzENK2rSAGPimGv25pWmNC668raGfBOeMhzsGj0tT
	EP4fisqP0weRchVygFaSS0sfUd4foRlxUkZLrqQsFCAldlkTnzIPtUCxK9ra/ShDFbkY
	CVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=23DSSrcVqXCF/z6nlKpdHjcL/7cJ41yvrhLlxivr//Q=;
	b=ir9hTG0kWHn3TQJA+73mx42bxerRmPaOQhcKByrLux15MIobEj9iZpOLK8IwrAM6KW
	ixv4TRGF801JM9vp0Dl1vcMssZNVoUAGgVC6jZKZvg0oJStjvKzpdPlHmwSF0smZwzOA
	A9KMxJBfQnkfI/g64qCClDmia5hld3/oRYW41QDyxR/htzCNlFbO8CjYGpRL79TfAU8d
	HuY0qDxCNGogMTKdwk/2aCY6Cu5VnwbQRaxDjJUQcnBWSpTOZ7gpwZR7kGEfriCNN+OL
	dVGttCgek1nQjTnh9ZLmFbybtMHIF8puVS2g2o0xmBYWjYiurvsCRjP5ARmQS6RY0RWU
	9Crw==
X-Gm-Message-State: AG10YORgly0budYEqjAFr771MyfAv2aXl8Xs+ly2quhIeZtEWr7CaekVBCsc9XXwOMzhuA==
X-Received: by 10.66.119.71 with SMTP id ks7mr31199429pab.151.1454800514172;
	Sat, 06 Feb 2016 15:15:14 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id y15sm757050pfi.16.2016.02.06.15.15.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 06 Feb 2016 15:15:12 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org, joshua.g.lock@intel.com,
	akuster808@gmail.com
Date: Sat,  6 Feb 2016 15:14:43 -0800
Message-Id: <25d0d28a6fa7685f5a5640c7c4728d0f5fa7b25f.1454800360.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
Subject: [PATCH 02/21] glibc: CVE-2015-8779
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
X-List-Received-Date: Sat, 06 Feb 2016 23:15:14 -0000

From: Armin Kuster <akuster@mvista.com>

A stack overflow vulnerability in the catopen function was found, causing
applications which pass long strings to the catopen function to crash or,
potentially execute arbitrary code.

(From OE-Core rev: af20e323932caba8883c91dac610e1ba2b3d4ab5)

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-core/glibc/glibc/CVE-2015-8779.patch | 262 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.21.bb             |   1 +
 2 files changed, 263 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8779.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2015-8779.patch b/meta/recipes-core/glibc/glibc/CVE-2015-8779.patch
new file mode 100644
index 0000000..ddc0742
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2015-8779.patch
@@ -0,0 +1,262 @@
+From 0f58539030e436449f79189b6edab17d7479796e Mon Sep 17 00:00:00 2001
+From: Paul Pluzhnikov <ppluzhnikov@google.com>
+Date: Sat, 8 Aug 2015 15:53:03 -0700
+Subject: [PATCH] Fix BZ #17905
+
+Upstream-Status: Backport
+CVE: CVE-2015-8779
+[Yocto # 8980]
+
+https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=0f58539030e436449f79189b6edab17d7479796e
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ ChangeLog              |  8 ++++++++
+ NEWS                   |  2 +-
+ catgets/Makefile       |  9 ++++++++-
+ catgets/catgets.c      | 19 ++++++++++++-------
+ catgets/open_catalog.c | 23 ++++++++++++++---------
+ catgets/tst-catgets.c  | 31 +++++++++++++++++++++++++++++++
+ 6 files changed, 74 insertions(+), 18 deletions(-)
+
+Index: git/catgets/Makefile
+===================================================================
+--- git.orig/catgets/Makefile
++++ git/catgets/Makefile
+@@ -37,6 +37,7 @@ ifeq (y,$(OPTION_EGLIBC_CATGETS))
+ ifeq ($(run-built-tests),yes)
+ tests-special += $(objpfx)de/libc.cat $(objpfx)test1.cat $(objpfx)test2.cat \
+ 		 $(objpfx)sample.SJIS.cat $(objpfx)test-gencat.out
++tests-special += $(objpfx)tst-catgets-mem.out
+ endif
+ endif
+ gencat-modules	= xmalloc
+@@ -53,9 +54,11 @@ catgets-CPPFLAGS := -DNLSPATH='"$(msgcat
+ 
+ generated += de.msg test1.cat test1.h test2.cat test2.h sample.SJIS.cat \
+ 	     test-gencat.h
++generated += tst-catgets.mtrace tst-catgets-mem.out
++
+ generated-dirs += de
+ 
+-tst-catgets-ENV = NLSPATH="$(objpfx)%l/%N.cat" LANG=de
++tst-catgets-ENV = NLSPATH="$(objpfx)%l/%N.cat" LANG=de MALLOC_TRACE=$(objpfx)tst-catgets.mtrace
+ 
+ ifeq ($(run-built-tests),yes)
+ # This test just checks whether the program produces any error or not.
+@@ -89,4 +92,8 @@ $(objpfx)test-gencat.out: test-gencat.sh
+ $(objpfx)sample.SJIS.cat: sample.SJIS $(objpfx)gencat
+ 	$(built-program-cmd) -H $(objpfx)test-gencat.h < $(word 1,$^) > $@; \
+ 	$(evaluate-test)
++
++$(objpfx)tst-catgets-mem.out: $(objpfx)tst-catgets.out
++	$(common-objpfx)malloc/mtrace $(objpfx)tst-catgets.mtrace > $@; \
++	$(evaluate-test)
+ endif
+Index: git/catgets/catgets.c
+===================================================================
+--- git.orig/catgets/catgets.c
++++ git/catgets/catgets.c
+@@ -16,7 +16,6 @@
+    License along with the GNU C Library; if not, see
+    <http://www.gnu.org/licenses/>.  */
+ 
+-#include <alloca.h>
+ #include <errno.h>
+ #include <locale.h>
+ #include <nl_types.h>
+@@ -35,6 +34,7 @@ catopen (const char *cat_name, int flag)
+   __nl_catd result;
+   const char *env_var = NULL;
+   const char *nlspath = NULL;
++  char *tmp = NULL;
+ 
+   if (strchr (cat_name, '/') == NULL)
+     {
+@@ -54,7 +54,10 @@ catopen (const char *cat_name, int flag)
+ 	{
+ 	  /* Append the system dependent directory.  */
+ 	  size_t len = strlen (nlspath) + 1 + sizeof NLSPATH;
+-	  char *tmp = alloca (len);
++	  tmp = malloc (len);
++
++	  if (__glibc_unlikely (tmp == NULL))
++	    return (nl_catd) -1;
+ 
+ 	  __stpcpy (__stpcpy (__stpcpy (tmp, nlspath), ":"), NLSPATH);
+ 	  nlspath = tmp;
+@@ -65,16 +68,18 @@ catopen (const char *cat_name, int flag)
+ 
+   result = (__nl_catd) malloc (sizeof (*result));
+   if (result == NULL)
+-    /* We cannot get enough memory.  */
+-    return (nl_catd) -1;
+-
+-  if (__open_catalog (cat_name, nlspath, env_var, result) != 0)
++    {
++      /* We cannot get enough memory.  */
++      result = (nl_catd) -1;
++    }
++  else if (__open_catalog (cat_name, nlspath, env_var, result) != 0)
+     {
+       /* Couldn't open the file.  */
+       free ((void *) result);
+-      return (nl_catd) -1;
++      result = (nl_catd) -1;
+     }
+ 
++  free (tmp);
+   return (nl_catd) result;
+ }
+ 
+Index: git/catgets/open_catalog.c
+===================================================================
+--- git.orig/catgets/open_catalog.c
++++ git/catgets/open_catalog.c
+@@ -47,6 +47,7 @@ __open_catalog (const char *cat_name, co
+   size_t tab_size;
+   const char *lastp;
+   int result = -1;
++  char *buf = NULL;
+ 
+   if (strchr (cat_name, '/') != NULL || nlspath == NULL)
+     fd = open_not_cancel_2 (cat_name, O_RDONLY);
+@@ -57,23 +58,23 @@ __open_catalog (const char *cat_name, co
+   if (__glibc_unlikely (bufact + (n) >= bufmax))			      \
+     {									      \
+       char *old_buf = buf;						      \
+-      bufmax += 256 + (n);						      \
+-      buf = (char *) alloca (bufmax);					      \
+-      memcpy (buf, old_buf, bufact);					      \
++      bufmax += (bufmax < 256 + (n)) ? 256 + (n) : bufmax;		      \
++      buf = realloc (buf, bufmax);					      \
++      if (__glibc_unlikely (buf == NULL))				      \
++	{								      \
++	  free (old_buf);						      \
++	  return -1;							      \
++	}								      \
+     }
+ 
+       /* The RUN_NLSPATH variable contains a colon separated list of
+ 	 descriptions where we expect to find catalogs.  We have to
+ 	 recognize certain % substitutions and stop when we found the
+ 	 first existing file.  */
+-      char *buf;
+       size_t bufact;
+-      size_t bufmax;
++      size_t bufmax = 0;
+       size_t len;
+ 
+-      buf = NULL;
+-      bufmax = 0;
+-
+       fd = -1;
+       while (*run_nlspath != '\0')
+ 	{
+@@ -188,7 +189,10 @@ __open_catalog (const char *cat_name, co
+ 
+   /* Avoid dealing with directories and block devices */
+   if (__builtin_expect (fd, 0) < 0)
+-    return -1;
++    {
++      free (buf);
++      return -1;
++    }
+ 
+   if (__builtin_expect (__fxstat64 (_STAT_VER, fd, &st), 0) < 0)
+     goto close_unlock_return;
+@@ -325,6 +329,7 @@ __open_catalog (const char *cat_name, co
+   /* Release the lock again.  */
+  close_unlock_return:
+   close_not_cancel_no_status (fd);
++  free (buf);
+ 
+   return result;
+ }
+Index: git/catgets/tst-catgets.c
+===================================================================
+--- git.orig/catgets/tst-catgets.c
++++ git/catgets/tst-catgets.c
+@@ -1,7 +1,10 @@
++#include <assert.h>
+ #include <mcheck.h>
+ #include <nl_types.h>
+ #include <stdio.h>
++#include <stdlib.h>
+ #include <string.h>
++#include <sys/resource.h>
+ 
+ 
+ static const char *msgs[] =
+@@ -12,6 +15,33 @@ static const char *msgs[] =
+ };
+ #define nmsgs (sizeof (msgs) / sizeof (msgs[0]))
+ 
++
++/* Test for unbounded alloca.  */
++static int
++do_bz17905 (void)
++{
++  char *buf;
++  struct rlimit rl;
++  nl_catd result;
++
++  const int sz = 1024 * 1024;
++
++  getrlimit (RLIMIT_STACK, &rl);
++  rl.rlim_cur = sz;
++  setrlimit (RLIMIT_STACK, &rl);
++
++  buf = malloc (sz + 1); 
++  memset (buf, 'A', sz);
++  buf[sz] = '\0';
++  setenv ("NLSPATH", buf, 1);
++
++  result = catopen (buf, NL_CAT_LOCALE);
++  assert (result == (nl_catd) -1);
++
++  free (buf);
++  return 0;
++}
++
+ #define ROUNDS 5
+ 
+ static int
+@@ -62,6 +92,7 @@ do_test (void)
+ 	}
+     }
+ 
++  result += do_bz17905 ();
+   return result;
+ }
+ 
+Index: git/ChangeLog
+===================================================================
+--- git.orig/ChangeLog
++++ git/ChangeLog
+@@ -1,3 +1,11 @@
++2015-08-08  Paul Pluzhnikov  <ppluzhnikov@google.com>
++
++   [BZ #17905]
++   * catgets/Makefile (tst-catgets-mem): New test.
++   * catgets/catgets.c (catopen): Don't use unbounded alloca.
++   * catgets/open_catalog.c (__open_catalog): Likewise.
++   * catgets/tst-catgets.c (do_bz17905): Test unbounded alloca.
++
+ 2015-10-15  Florian Weimer  <fweimer@redhat.com>
+ 
+    [BZ #18928]
+Index: git/NEWS
+===================================================================
+--- git.orig/NEWS
++++ git/NEWS
+@@ -19,7 +19,7 @@ Version 2.21
+   17722, 17723, 17724, 17725, 17732, 17733, 17744, 17745, 17746, 17747,
+   17748, 17775, 17777, 17780, 17781, 17782, 17791, 17793, 17796, 17797,
+   17801, 17803, 17806, 17834, 17844, 17848, 17868, 17869, 17870, 17885,
+-  17892, 18928.
++  17892, 18928, 17905.
+ 
+ * The LD_POINTER_GUARD environment variable can no longer be used to
+   disable the pointer guard feature.  It is always enabled.
diff --git a/meta/recipes-core/glibc/glibc_2.21.bb b/meta/recipes-core/glibc/glibc_2.21.bb
index efbcc9c..afe32d5 100644
--- a/meta/recipes-core/glibc/glibc_2.21.bb
+++ b/meta/recipes-core/glibc/glibc_2.21.bb
@@ -49,6 +49,7 @@ EGLIBCPATCHES = "\
 CVEPATCHES = "\
         file://CVE-2015-1781-resolv-nss_dns-dns-host.c-buffer-overf.patch \
         file://CVE-2015-8777.patch \
+        file://CVE-2015-8779.patch \
 "
 
 LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
-- 
2.3.5


