Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 94A11771F0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 18:53:49 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id yy13so7389704pab.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 10:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ABByJz1fXVmRrt1WxkL5HVFHAzjufc1ntNPBPU3H0aM=;
	b=hNOBoKO+u96UzSoe3mn2/Ru7i32j5hT+gsyP9R9H3e/5WOUSGQXK1t1kgFfUjgdiy1
	JS1rvACcBzf0SQuOXP7/Cv0alVSAe7hiRWRl30UAGSbvi5Fuo4Vc3mGsoRCAIbAw4Zob
	yYPd4RZ03nQouh7mQxy76qq+RnRDiPPZMJYthnCDARfOquk8eEoPueuEIKzDvPSO9ynN
	CPchx4kKtk8Q0iLcUHC9X7cA+/aTli84RnaYRq9Xqqy/zvXu2+mYXDChrOdHDEU2wfd6
	BMS6NbDHbKFU9E44skZSrd6rdG1QLfem5vDxHEuQ4Yx94sUwbCCUeP7KHjxBwWQeGX7x
	+0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ABByJz1fXVmRrt1WxkL5HVFHAzjufc1ntNPBPU3H0aM=;
	b=jg9n4w2VovBSoUJ1utJhyWR0hkZEgqytHf94mV25Iv9GCy7k4r8XIJ9Q6pIfQkz+wa
	ha4Nl6lGLoQizBIgK/+azSDBF2u1YOj9SppgAzsepVDM2UxK8WvIYfllT3zhUL1h841R
	swoat8JNPhytBmC59pJKZ+lqyLjoOAn2j7mUEbGeBFXx0ciWF1TwMAyLLzlq0EJxyIpA
	ZuEHhhWQx8+7OjR5PAnAU7GLAW6E6U0JgubSpIe0WfBdabSIa1rF9pBlbWqYGAlN6mGk
	fiPPCUXdd83BRlPxE90DGzEUV5iHoLI7AkItahnaTtH8zq49RrSIOuj1U9vQlWVDCra5
	N+Jg==
X-Gm-Message-State: AD7BkJL5bFImiRolliIxFkx9YhzxxSfa3cz4sJocNYujF7RTrxrNzDBUWvY+QHgbUSI8Mg==
X-Received: by 10.66.193.161 with SMTP id hp1mr17191326pac.9.1456685630270;
	Sun, 28 Feb 2016 10:53:50 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id r6sm8071829pfi.9.2016.02.28.10.53.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 28 Feb 2016 10:53:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 28 Feb 2016 10:53:35 -0800
Message-Id: <1456685615-901-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1456685615-901-1-git-send-email-akuster808@gmail.com>
References: <1456685615-901-1-git-send-email-akuster808@gmail.com>
Subject: [dizzy][PATCH 4/4] glibc: CVE-2015-8776
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
X-List-Received-Date: Sun, 28 Feb 2016 18:53:49 -0000

From: Armin Kuster <akuster@mvista.com>

it was found that out-of-range time values passed to the strftime function may
cause it to crash, leading to a denial of service, or potentially disclosure
information.

(From OE-Core rev: b9bc001ee834e4f8f756a2eaf2671aac3324b0ee)

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/glibc/glibc/CVE-2015-8776.patch | 155 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.20.bb             |   1 +
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
diff --git a/meta/recipes-core/glibc/glibc_2.20.bb b/meta/recipes-core/glibc/glibc_2.20.bb
index d099d5d..8aaf94e 100644
--- a/meta/recipes-core/glibc/glibc_2.20.bb
+++ b/meta/recipes-core/glibc/glibc_2.20.bb
@@ -52,6 +52,7 @@ CVEPATCHES = "\
         file://CVE-2015-8779.patch \
         file://CVE-2015-9761_1.patch \
         file://CVE-2015-9761_2.patch \
+        file://CVE-2015-8776.patch \
 "
 
 LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
-- 
2.3.5


