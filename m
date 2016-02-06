Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 66C8D7722B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Feb 2016 23:15:17 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id sv5so919404pab.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Feb 2016 15:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=foWm6mfZ0aSk1aUCfNNI3I14ev1P0V6LmtrClDy6pRU=;
	b=BE+265+L5Dfuipq8eEtSkRae3hHWWnRuU9iX/jq2SVrytksWqnX3m1jWosJJdJwllP
	QplidTkGS5RBxK4IDyX7jryy9gizLmHg+naws8x7jjt8PrGT0PJjniEf1Cr3bX4bXdEX
	L9l+n9JtRj8ACNydrtnznGkuXc35UxB8K+9VCIkewyXG9Lgg4Axzc6aHDZ77YQlHqpjA
	Xxd/q/UdeCN9MfyANJF1k0SRTXsYsS3fCDF8llZCctHSCxWhQuOHPLFtyFZ1ZgJK22UU
	zDRVg6ir+GIzEhMQNcTUDOjLqZUPfw1z+qQG0d5oRe7jYrjjjvcd/oUy57bCl2wTSSbD
	oHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=foWm6mfZ0aSk1aUCfNNI3I14ev1P0V6LmtrClDy6pRU=;
	b=N+aY/0BclSZnMmh/Oo65RHjoJeIyf/0FhDXOZkE8y9bKLhO1l8eGtUH2WkWR+3tudD
	NnJNGhqBhZSNMjIg9LYtnoNRXf6GiRqLHPHlpGH2iKv18+CFk1FTEe/WcmQh4Uchcc3W
	yd3+lJPWZtVeyrUy3U12IvlxSfpnqnmGgmirM88YDB1PongUAtPDVqatbvVk/HrzA9FL
	1ESSU8Cz2KRcu6Mem2K4FKnkijke14Keg8Waf86UYGpS0hm+aSKL+O13aw6CeMsd1k2b
	qt6Bn1sSEhtfhkG42tQ73yOgO/jH7NixOneRy4asrkQq/2xONZ0rRNIg7HYvcS+f6+RM
	Il2g==
X-Gm-Message-State: AG10YOSdMWB2TiQJnlbfgMMRxXLAEHU/7arJsyWBfs12Az/slFSouhNKuYziR+kldZmEqA==
X-Received: by 10.66.145.162 with SMTP id sv2mr30904587pab.152.1454800518397; 
	Sat, 06 Feb 2016 15:15:18 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id y15sm757050pfi.16.2016.02.06.15.15.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 06 Feb 2016 15:15:16 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org, joshua.g.lock@intel.com,
	akuster808@gmail.com
Date: Sat,  6 Feb 2016 15:14:45 -0800
Message-Id: <7cfd99371dcdc05d258941c0023ba380bd41b86b.1454800360.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
Subject: [PATCH 04/21] glibc: CVE-2015-8776
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
X-List-Received-Date: Sat, 06 Feb 2016 23:15:17 -0000

From: Armin Kuster <akuster@mvista.com>

it was found that out-of-range time values passed to the strftime function may
cause it to crash, leading to a denial of service, or potentially disclosure
information.

(From OE-Core rev: b9bc001ee834e4f8f756a2eaf2671aac3324b0ee)

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-core/glibc/glibc/CVE-2015-8776.patch | 155 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.21.bb             |   1 +
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
diff --git a/meta/recipes-core/glibc/glibc_2.21.bb b/meta/recipes-core/glibc/glibc_2.21.bb
index f712f18..5cec4af 100644
--- a/meta/recipes-core/glibc/glibc_2.21.bb
+++ b/meta/recipes-core/glibc/glibc_2.21.bb
@@ -52,6 +52,7 @@ CVEPATCHES = "\
         file://CVE-2015-8779.patch \
         file://CVE-2015-9761_1.patch \
         file://CVE-2015-9761_2.patch \
+        file://CVE-2015-8776.patch \
 "
 
 LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
-- 
2.3.5


