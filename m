Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0906777122
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 19:35:09 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id e65so7304130pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 11:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=XfvbIIAPyDqffxhgkpD0WYUUAbn2wOeE35yr88cNMeE=;
	b=xRj+5PkaZHhhthAuKQ7Jt7a1nsMnLYQv7ylYvjUrnVLKPP1S08KYKCBsrw2tx166gO
	P858ssz+PFmAEI1T2mCbfi/0l+2o73F4/kwToWNtk2vQURG72F60J0dPEQ9Ax2cRvvNF
	E7VUF44mdJLIje40scviY3VcZxSS35+U47sOSuKVvHYTv0e82m5YaHg5zpj2sn8j3MuK
	tWdrXKTShRTXqma6OQn4Pqi7LGNR5b4r/dV3m7TCvKCPngTBiCiqTkzt9XLmIKWX8cEr
	qzRy+oTGPU5w3CSGH8zTA4bqBspSGKr8SK982ZK5SMeiLhicimLBWLNQQFKm5NsAuiRT
	plcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=XfvbIIAPyDqffxhgkpD0WYUUAbn2wOeE35yr88cNMeE=;
	b=HBZSjIv8r5bTosLJLLlwimKxleoh2SBTKEppFig8RQU47Ip0bT7dwa7SvWHK1omZHf
	HWz1Nq6Xj36lOMxOlRmJwrSnCujxncdZH7RdKjebSoQmc4uefbJc1W4d/3IeCDbjtXed
	puOVJDhKLftTkEdExw6IadAczd2DYDaGEVu3EKHqdoR2lw1XCbM50xVkX29/sqK9KRMC
	DgBMmEDVlVX8RgZMXe09OSk6Cje2p/cBy6pgDad1BJ2NGJVMr2PHmCdaj5ZyoA19NWys
	znkmSGAd8veXpXsM3LHz0fq8wPgfX3PbKlLFoy6wTZstrJUGovhK4HScZavwhXfUWEXh
	p20A==
X-Gm-Message-State: AG10YOQlbBdLybtYhIvUrYQiL9GgBVljZxqry0zv78KeE+ZT9qHPDhplFKhgfzZzW4aB6g==
X-Received: by 10.98.44.66 with SMTP id s63mr28608942pfs.2.1453750510037;
	Mon, 25 Jan 2016 11:35:10 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	ry1sm30477015pab.30.2016.01.25.11.35.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Jan 2016 11:35:08 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 11:34:52 -0800
Message-Id: <55b6e84f026a72a530c024269ee6d72ac17f1ad0.1453750404.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1453750404.git.akuster808@gmail.com>
References: <cover.1453750404.git.akuster808@gmail.com>
In-Reply-To: <cover.1453750404.git.akuster808@gmail.com>
References: <cover.1453750404.git.akuster808@gmail.com>
Subject: [PATCH 4/4] glibc: CVE_2015-8776
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
X-List-Received-Date: Mon, 25 Jan 2016 19:35:09 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-core/glibc/glibc/CVE-2015-8776.patch | 176 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.21.bb             |   1 +
 2 files changed, 177 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8776.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2015-8776.patch b/meta/recipes-core/glibc/glibc/CVE-2015-8776.patch
new file mode 100644
index 0000000..118958f
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2015-8776.patch
@@ -0,0 +1,176 @@
+From 08564114d5c0150131ce3b29037f0202f2d4002b Mon Sep 17 00:00:00 2001
+From: Armin Kuster <akuster@mvista.com>
+Date: Fri, 22 Jan 2016 20:25:19 -0800
+Subject: [PATCH 4/4] glibc: CVE-2015-8776
+
+it was found that out-of-range time values passed to the strftime function may
+cause it to crash, leading to a denial of service, or potentially disclosure
+information.
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+---
+ meta/recipes-core/glibc/glibc/CVE-2015-8776.patch | 155 ++++++++++++++++++++++
+ meta/recipes-core/glibc/glibc_2.22.bb             |   1 +
+ 2 files changed, 156 insertions(+)
+ create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8776.patch
+
+Index: git/meta/recipes-core/glibc/glibc/CVE-2015-8776.patch
+===================================================================
+--- /dev/null
++++ git/meta/recipes-core/glibc/glibc/CVE-2015-8776.patch
+@@ -0,0 +1,155 @@
++From d36c75fc0d44deec29635dd239b0fbd206ca49b7 Mon Sep 17 00:00:00 2001
++From: Paul Pluzhnikov <ppluzhnikov@google.com>
++Date: Sat, 26 Sep 2015 13:27:48 -0700
++Subject: [PATCH] Fix BZ #18985 -- out of range data to strftime() causes a
++ segfault
++
++Upstream-Status: Backport
++CVE: CVE-2015-8776
++[Yocto # 8980]
++
++https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=d36c75fc0d44deec29635dd239b0fbd206ca49b7
++
++Signed-off-by: Armin Kuster <akuster@mvista.com>
++
++---
++ ChangeLog           |  8 ++++++++
++ NEWS                |  2 +-
++ time/strftime_l.c   | 20 +++++++++++++-------
++ time/tst-strftime.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++++++-
++ 4 files changed, 73 insertions(+), 9 deletions(-)
++
++Index: git/ChangeLog
++===================================================================
++--- git.orig/ChangeLog
+++++ git/ChangeLog
++@@ -1,3 +1,11 @@
+++2015-09-26  Paul Pluzhnikov  <ppluzhnikov@google.com>
+++
+++	[BZ #18985]
+++	* time/strftime_l.c (a_wkday, f_wkday, a_month, f_month): Range check.
+++	(__strftime_internal): Likewise.
+++	* time/tst-strftime.c (do_bz18985): New test.
+++	(do_test): Call it.
+++
++ 2015-12-04  Joseph Myers  <joseph@codesourcery.com>
++
++ 	[BZ #16961]
++Index: git/time/strftime_l.c
++===================================================================
++--- git.orig/time/strftime_l.c
+++++ git/time/strftime_l.c
++@@ -514,13 +514,17 @@ __strftime_internal (s, maxsize, format,
++      only a few elements.  Dereference the pointers only if the format
++      requires this.  Then it is ok to fail if the pointers are invalid.  */
++ # define a_wkday \
++-  ((const CHAR_T *) _NL_CURRENT (LC_TIME, NLW(ABDAY_1) + tp->tm_wday))
+++  ((const CHAR_T *) (tp->tm_wday < 0 || tp->tm_wday > 6			     \
+++		     ? "?" : _NL_CURRENT (LC_TIME, NLW(ABDAY_1) + tp->tm_wday)))
++ # define f_wkday \
++-  ((const CHAR_T *) _NL_CURRENT (LC_TIME, NLW(DAY_1) + tp->tm_wday))
+++  ((const CHAR_T *) (tp->tm_wday < 0 || tp->tm_wday > 6			     \
+++		     ? "?" : _NL_CURRENT (LC_TIME, NLW(DAY_1) + tp->tm_wday)))
++ # define a_month \
++-  ((const CHAR_T *) _NL_CURRENT (LC_TIME, NLW(ABMON_1) + tp->tm_mon))
+++  ((const CHAR_T *) (tp->tm_mon < 0 || tp->tm_mon > 11			     \
+++		     ? "?" : _NL_CURRENT (LC_TIME, NLW(ABMON_1) + tp->tm_mon)))
++ # define f_month \
++-  ((const CHAR_T *) _NL_CURRENT (LC_TIME, NLW(MON_1) + tp->tm_mon))
+++  ((const CHAR_T *) (tp->tm_mon < 0 || tp->tm_mon > 11			     \
+++		     ? "?" : _NL_CURRENT (LC_TIME, NLW(MON_1) + tp->tm_mon)))
++ # define ampm \
++   ((const CHAR_T *) _NL_CURRENT (LC_TIME, tp->tm_hour > 11		      \
++ 				 ? NLW(PM_STR) : NLW(AM_STR)))
++@@ -530,8 +534,10 @@ __strftime_internal (s, maxsize, format,
++ # define ap_len STRLEN (ampm)
++ #else
++ # if !HAVE_STRFTIME
++-#  define f_wkday (weekday_name[tp->tm_wday])
++-#  define f_month (month_name[tp->tm_mon])
+++#  define f_wkday (tp->tm_wday < 0 || tp->tm_wday > 6	\
+++		   ? "?" : weekday_name[tp->tm_wday])
+++#  define f_month (tp->tm_mon < 0 || tp->tm_mon > 11	\
+++		   ? "?" : month_name[tp->tm_mon])
++ #  define a_wkday f_wkday
++ #  define a_month f_month
++ #  define ampm (L_("AMPM") + 2 * (tp->tm_hour > 11))
++@@ -1325,7 +1331,7 @@ __strftime_internal (s, maxsize, format,
++ 		  *tzset_called = true;
++ 		}
++ # endif
++-	      zone = tzname[tp->tm_isdst];
+++	      zone = tp->tm_isdst <= 1 ? tzname[tp->tm_isdst] : "?";
++ 	    }
++ #endif
++ 	  if (! zone)
++Index: git/time/tst-strftime.c
++===================================================================
++--- git.orig/time/tst-strftime.c
+++++ git/time/tst-strftime.c
++@@ -4,6 +4,56 @@
++ #include <time.h>
++
++
+++static int
+++do_bz18985 (void)
+++{
+++  char buf[1000];
+++  struct tm ttm;
+++  int rc, ret = 0;
+++
+++  memset (&ttm, 1, sizeof (ttm));
+++  ttm.tm_zone = NULL;  /* Dereferenced directly if non-NULL.  */
+++  rc = strftime (buf, sizeof (buf), "%a %A %b %B %c %z %Z", &ttm);
+++
+++  if (rc == 66)
+++    {
+++      const char expected[]
+++	= "? ? ? ? ? ? 16843009 16843009:16843009:16843009 16844909 +467836 ?";
+++      if (0 != strcmp (buf, expected))
+++	{
+++	  printf ("expected:\n  %s\ngot:\n  %s\n", expected, buf);
+++	  ret += 1;
+++	}
+++    }
+++  else
+++    {
+++      printf ("expected 66, got %d\n", rc);
+++      ret += 1;
+++    }
+++
+++  /* Check negative values as well.  */
+++  memset (&ttm, 0xFF, sizeof (ttm));
+++  ttm.tm_zone = NULL;  /* Dereferenced directly if non-NULL.  */
+++  rc = strftime (buf, sizeof (buf), "%a %A %b %B %c %z %Z", &ttm);
+++
+++  if (rc == 30)
+++    {
+++      const char expected[] = "? ? ? ? ? ? -1 -1:-1:-1 1899  ";
+++      if (0 != strcmp (buf, expected))
+++	{
+++	  printf ("expected:\n  %s\ngot:\n  %s\n", expected, buf);
+++	  ret += 1;
+++	}
+++    }
+++  else
+++    {
+++      printf ("expected 30, got %d\n", rc);
+++      ret += 1;
+++    }
+++
+++  return ret;
+++}
+++
++ static struct
++ {
++   const char *fmt;
++@@ -104,7 +154,7 @@ do_test (void)
++ 	}
++     }
++
++-  return result;
+++  return result + do_bz18985 ();
++ }
++
++ #define TEST_FUNCTION do_test ()
diff --git a/meta/recipes-core/glibc/glibc_2.21.bb b/meta/recipes-core/glibc/glibc_2.21.bb
index 5d05f0c..1829647 100644
--- a/meta/recipes-core/glibc/glibc_2.21.bb
+++ b/meta/recipes-core/glibc/glibc_2.21.bb
@@ -51,6 +51,7 @@ CVEPATCHES = "\
         file://CVE-2015-8777.patch \
         file://CVE-2015-8779.patch \
         file://CVE-2015-9761.patch \
+        file://CVE-2015-8776.patch \
 "
 
 LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
-- 
2.3.5


