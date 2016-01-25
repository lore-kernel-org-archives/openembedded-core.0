Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id BA9F477133
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 19:25:22 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id a20so6933374pag.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 11:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=emxJOYTggt79L7dHYzMy3cITpFZ7feYiI2OYcVtWHJ4=;
	b=B167rccuNzJkX4hxYVcSHPK4gPqgJ6xaJwGr8PSH0+X20SQ9d5ad9vIpy9frGgH8B0
	3/I/LDJ6M2aOYA3aeTIuWNC6U4wY5s4+CqQzz/kXQfQmUfsgq4zfdiaSycnw1qnL5Sdk
	ynxMDCUxhrXtHcvFxwKzDG1dSpFMRkzK8lg/OE9koirRnzFy0oSKw5YOwysMuE9aDDiW
	aoNJweoVPH6QTfRE/Al4t1JnvBhG+P5Wt5O4iU/QdyCHl8A4hOMEzQYVMeF3cDj0yIEW
	baj6IW3pLkejRv3rZrbvUzGgFEDkv9ahPZ8viR/bR+IayR2lyhcWfwmsuSSLwEvbSHaa
	3MnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=emxJOYTggt79L7dHYzMy3cITpFZ7feYiI2OYcVtWHJ4=;
	b=jHKceawXi3yLStrltxJkxwmFOSAFAjAioXulyTpzN/tnKy2AKmP1uCZmcyIJZ9G0Vp
	rNn8eMZlTugS9OKvjoR3lWxoHoVJTw7udpytMfy0c2rdVQ+8mhCRjnvQ4bEoHpWxJPeo
	tPp7F+PDKJV97tnYGZfOZ6/zGLnBmWojp6st2viMZGnErc6vj1xHrLPCtL0utWuyRZGG
	S9m54qGad0L85ODxV+rOkCR6PTMslvdlSv0CJkQI1YryZb5GcqwHk1+dpKS4OYJwtzLP
	ADeBy53Yl3pmCg7KG4oLZ9C8b8fH3WxP2d53PrumDC36mZ/yYXm7IJoLQJvZACoebVzQ
	leSQ==
X-Gm-Message-State: AG10YORkZuWHDuf+HzSaqmo4pRDMnIq3zMSI4Z7Za9coqoSh4O4H0rvSlXCxBqeSj2Sz/w==
X-Received: by 10.66.253.137 with SMTP id aa9mr1274833pad.139.1453749923520;
	Mon, 25 Jan 2016 11:25:23 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	b84sm30482439pfj.25.2016.01.25.11.25.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Jan 2016 11:25:22 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 11:25:07 -0800
Message-Id: <08564114d5c0150131ce3b29037f0202f2d4002b.1453749700.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1453749700.git.akuster808@gmail.com>
References: <cover.1453749700.git.akuster808@gmail.com>
In-Reply-To: <cover.1453749700.git.akuster808@gmail.com>
References: <cover.1453749700.git.akuster808@gmail.com>
Subject: [PATCH 4/4] glibc: CVE-2015-8776
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
X-List-Received-Date: Mon, 25 Jan 2016 19:25:23 -0000

From: Armin Kuster <akuster@mvista.com>

it was found that out-of-range time values passed to the strftime function may
cause it to crash, leading to a denial of service, or potentially disclosure
information.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-core/glibc/glibc/CVE-2015-8776.patch | 155 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.22.bb             |   1 +
 2 files changed, 156 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8776.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2015-8776.patch b/meta/recipes-core/glibc/glibc/CVE-2015-8776.patch
new file mode 100644
index 0000000..684f344
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2015-8776.patch
@@ -0,0 +1,155 @@
+From d36c75fc0d44deec29635dd239b0fbd206ca49b7 Mon Sep 17 00:00:00 2001
+From: Paul Pluzhnikov <ppluzhnikov@google.com>
+Date: Sat, 26 Sep 2015 13:27:48 -0700
+Subject: [PATCH] Fix BZ #18985 -- out of range data to strftime() causes a
+ segfault
+
+Upstream-Status: Backport
+CVE: CVE-2015-8776
+[Yocto # 8980]
+
+https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=d36c75fc0d44deec29635dd239b0fbd206ca49b7
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ ChangeLog           |  8 ++++++++
+ NEWS                |  2 +-
+ time/strftime_l.c   | 20 +++++++++++++-------
+ time/tst-strftime.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++++++-
+ 4 files changed, 73 insertions(+), 9 deletions(-)
+
+Index: git/ChangeLog
+===================================================================
+--- git.orig/ChangeLog
++++ git/ChangeLog
+@@ -1,3 +1,11 @@
++2015-09-26  Paul Pluzhnikov  <ppluzhnikov@google.com>
++
++	[BZ #18985]
++	* time/strftime_l.c (a_wkday, f_wkday, a_month, f_month): Range check.
++	(__strftime_internal): Likewise.
++	* time/tst-strftime.c (do_bz18985): New test.
++	(do_test): Call it.
++
+ 2015-12-04  Joseph Myers  <joseph@codesourcery.com>
+ 
+ 	[BZ #16961]
+Index: git/time/strftime_l.c
+===================================================================
+--- git.orig/time/strftime_l.c
++++ git/time/strftime_l.c
+@@ -514,13 +514,17 @@ __strftime_internal (s, maxsize, format,
+      only a few elements.  Dereference the pointers only if the format
+      requires this.  Then it is ok to fail if the pointers are invalid.  */
+ # define a_wkday \
+-  ((const CHAR_T *) _NL_CURRENT (LC_TIME, NLW(ABDAY_1) + tp->tm_wday))
++  ((const CHAR_T *) (tp->tm_wday < 0 || tp->tm_wday > 6			     \
++		     ? "?" : _NL_CURRENT (LC_TIME, NLW(ABDAY_1) + tp->tm_wday)))
+ # define f_wkday \
+-  ((const CHAR_T *) _NL_CURRENT (LC_TIME, NLW(DAY_1) + tp->tm_wday))
++  ((const CHAR_T *) (tp->tm_wday < 0 || tp->tm_wday > 6			     \
++		     ? "?" : _NL_CURRENT (LC_TIME, NLW(DAY_1) + tp->tm_wday)))
+ # define a_month \
+-  ((const CHAR_T *) _NL_CURRENT (LC_TIME, NLW(ABMON_1) + tp->tm_mon))
++  ((const CHAR_T *) (tp->tm_mon < 0 || tp->tm_mon > 11			     \
++		     ? "?" : _NL_CURRENT (LC_TIME, NLW(ABMON_1) + tp->tm_mon)))
+ # define f_month \
+-  ((const CHAR_T *) _NL_CURRENT (LC_TIME, NLW(MON_1) + tp->tm_mon))
++  ((const CHAR_T *) (tp->tm_mon < 0 || tp->tm_mon > 11			     \
++		     ? "?" : _NL_CURRENT (LC_TIME, NLW(MON_1) + tp->tm_mon)))
+ # define ampm \
+   ((const CHAR_T *) _NL_CURRENT (LC_TIME, tp->tm_hour > 11		      \
+ 				 ? NLW(PM_STR) : NLW(AM_STR)))
+@@ -530,8 +534,10 @@ __strftime_internal (s, maxsize, format,
+ # define ap_len STRLEN (ampm)
+ #else
+ # if !HAVE_STRFTIME
+-#  define f_wkday (weekday_name[tp->tm_wday])
+-#  define f_month (month_name[tp->tm_mon])
++#  define f_wkday (tp->tm_wday < 0 || tp->tm_wday > 6	\
++		   ? "?" : weekday_name[tp->tm_wday])
++#  define f_month (tp->tm_mon < 0 || tp->tm_mon > 11	\
++		   ? "?" : month_name[tp->tm_mon])
+ #  define a_wkday f_wkday
+ #  define a_month f_month
+ #  define ampm (L_("AMPM") + 2 * (tp->tm_hour > 11))
+@@ -1325,7 +1331,7 @@ __strftime_internal (s, maxsize, format,
+ 		  *tzset_called = true;
+ 		}
+ # endif
+-	      zone = tzname[tp->tm_isdst];
++	      zone = tp->tm_isdst <= 1 ? tzname[tp->tm_isdst] : "?";
+ 	    }
+ #endif
+ 	  if (! zone)
+Index: git/time/tst-strftime.c
+===================================================================
+--- git.orig/time/tst-strftime.c
++++ git/time/tst-strftime.c
+@@ -4,6 +4,56 @@
+ #include <time.h>
+ 
+ 
++static int
++do_bz18985 (void)
++{
++  char buf[1000];
++  struct tm ttm;
++  int rc, ret = 0;
++
++  memset (&ttm, 1, sizeof (ttm));
++  ttm.tm_zone = NULL;  /* Dereferenced directly if non-NULL.  */
++  rc = strftime (buf, sizeof (buf), "%a %A %b %B %c %z %Z", &ttm);
++
++  if (rc == 66)
++    {
++      const char expected[]
++	= "? ? ? ? ? ? 16843009 16843009:16843009:16843009 16844909 +467836 ?";
++      if (0 != strcmp (buf, expected))
++	{
++	  printf ("expected:\n  %s\ngot:\n  %s\n", expected, buf);
++	  ret += 1;
++	}
++    }
++  else
++    {
++      printf ("expected 66, got %d\n", rc);
++      ret += 1;
++    }
++
++  /* Check negative values as well.  */
++  memset (&ttm, 0xFF, sizeof (ttm));
++  ttm.tm_zone = NULL;  /* Dereferenced directly if non-NULL.  */
++  rc = strftime (buf, sizeof (buf), "%a %A %b %B %c %z %Z", &ttm);
++
++  if (rc == 30)
++    {
++      const char expected[] = "? ? ? ? ? ? -1 -1:-1:-1 1899  ";
++      if (0 != strcmp (buf, expected))
++	{
++	  printf ("expected:\n  %s\ngot:\n  %s\n", expected, buf);
++	  ret += 1;
++	}
++    }
++  else
++    {
++      printf ("expected 30, got %d\n", rc);
++      ret += 1;
++    }
++
++  return ret;
++}
++
+ static struct
+ {
+   const char *fmt;
+@@ -104,7 +154,7 @@ do_test (void)
+ 	}
+     }
+ 
+-  return result;
++  return result + do_bz18985 ();
+ }
+ 
+ #define TEST_FUNCTION do_test ()
diff --git a/meta/recipes-core/glibc/glibc_2.22.bb b/meta/recipes-core/glibc/glibc_2.22.bb
index 9205066..e512672 100644
--- a/meta/recipes-core/glibc/glibc_2.22.bb
+++ b/meta/recipes-core/glibc/glibc_2.22.bb
@@ -45,6 +45,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://CVE-2015-8779.patch \
            file://CVE-2015-9761_1.patch \
            file://CVE-2015-9761_2.patch \
+           file://CVE-2015-8776.patch \
 "
 
 SRC_URI += "\
-- 
2.3.5


