Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E0E1C54F53
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 08:30:22 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7148.1785054620921831331
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 01:30:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EwYccXCc;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so18641335e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 01:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785054619; x=1785659419; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G7GJ9ADxTDfoJ5/8ZDYdpwGhPf+espZn+LgTLPzPG2s=;
        b=EwYccXCcYrsw8g0sf3A3Uv+fF2ei40y/Zfs7RvVXPMUHUzo/H5wWT2/zxZaERnbNWq
         EbbqWqoneaq8MDHxowKIuaRlFQe0tXMy4bH/hKdWvAGy1U7ueUFgMhoc9QVo3CpjtQpf
         8Kq3B+qRJDDgbscjO5CFeLUYaQU6h2aqamv88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785054619; x=1785659419;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G7GJ9ADxTDfoJ5/8ZDYdpwGhPf+espZn+LgTLPzPG2s=;
        b=NsQyjPIsqdBE1HvNAiCVYJbN2nI1Sj3xxfEnzOFM8u+ZmkSBY2cPf1uDWkZqdPYkP/
         zfhIbfb+LkTGgp1aQYRKd1W0/8sMNCWKa5fY3kEFrIu6Y4JXk3Su+LmKGfSo2kQjD/Il
         neD1Qq41BSw/eyY1pmriroszP7xEmn76X76X7mx/bRjq1/QHbHN4uRiDAFl/pN7PiJfh
         Az6TJDvEYCC2blJnzHZiaR2JYYNN1ppElukl1Of6ufE46QvKm8Hhj+jfJ1mASdAmFVub
         EXzDBCaQoCD/8jTwgqt+6iYlibiOEIZ0wgRBTJQRxhumlJSZGgxCfJ6YXxJfF0I0QQMr
         Vk7g==
X-Gm-Message-State: AOJu0YzEsGBRjZ77xXqYsVRVBZ7hSb0yKJf967x7YPhbu92n+Fxkd1th
	AuuNgqe4Wnx84aCxlJ0S4QMqMQj9K5kqLSSGQuZZzSHchLi6Sn9RvDv4oCQ6otxGEe7V515jG8n
	1N1bqWl8=
X-Gm-Gg: AR+sD12Ha59iMy6CFBO6OlhoWMO2r0INzIxbz1qJlMUj+ucgIAJJVv4y8eObiWOsKh9
	p9GtamG5W6BtwsNOd54nwAgvpoVq4pkCgyBQihhriaeYW/Up4ytxJuMhkYUfbBZGkVXl1HSpjbi
	J3tv1O3WyMog1p/9Yf77EZS6oIKO8In1zOtRvPoL57mFrO9fxPqKNiPkWIextVVU/u4OkXH5nLW
	1ECTyGIftOr1xn3uKBND1XkVrwreOTUFef2wXklMxsLCTyqTPwfRMj1scjB13ahaiANUdltlRcK
	qSH7q8CoJV7Meb35H5i9HjRoF1GXLJIJ4+z8kiyR678tCZ7sX8UsCvT9nKdR39iehWbi2xBAn4z
	KCJ3OUijI8WY5TLMoRzP4sVXFtZd9a0L6gRKUc6xrdfr7MaKhoqr2L/T4F0rEnj41ZuwF3UVcpK
	KmKJTamGd/PceI+Y+lgn/utEZXCFp0vRpQQIwFxBiP4q53+rFJX83XQgoyOXZLBL/kXUnietNs/
	e5cIQ==
X-Received: by 2002:a05:600c:8b08:b0:495:4df2:b8c1 with SMTP id 5b1f17b1804b1-496b5709b9amr57833345e9.35.1785054619122;
        Sun, 26 Jul 2026 01:30:19 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm142482505e9.11.2026.07.26.01.30.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 01:30:18 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/31] cups: fix CVE-2026-34980
Date: Sun, 26 Jul 2026 10:29:40 +0200
Message-ID: <a64f1bfff50bb9e507705ff671391ec2cafdc692.1785054430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785054429.git.yoann.congal@smile.fr>
References: <cover.1785054429.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 08:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241998

From: Deepak Rathore <deeratho@cisco.com>

Pick the upstream fix [1] for CVE-2026-34980 as mentioned in [2], where
the scheduler did not filter control characters from option values.

Also include the upstream regression fixes that followed the CVE fix:

- CVE-2026-34980-regression_p1.patch [3] fixes filter PPD keyword
  processing. The CVE fix parsed PPD keywords into a temporary array,
  but the loop did not advance the keyword pointer. This regression was
  reported in OpenPrinting/cups Issue [4].
- CVE-2026-34980-regression_p2.patch [5] fixes a get_options() regression
  where the option-value parser did not advance the input pointer for
  whitespace/control-character paths.

[1] https://github.com/OpenPrinting/cups/commit/8d0f51cac24cb5bf949c5b6a221e51a150d982e3
[2] https://security-tracker.debian.org/tracker/CVE-2026-34980
[3] https://github.com/OpenPrinting/cups/commit/3f2bdc293243bca938c6de23ba50e6d783189629
[4] https://github.com/OpenPrinting/cups/issues/1562
[5] https://github.com/OpenPrinting/cups/commit/da0ff58c041f7ee129c3c2c72fb14df1f1e4069a

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/cups/cups.inc           |  3 +
 .../cups/CVE-2026-34980-regression_p1.patch   | 31 +++++++
 .../cups/CVE-2026-34980-regression_p2.patch   | 75 ++++++++++++++++
 .../cups/cups/CVE-2026-34980.patch            | 85 +++++++++++++++++++
 4 files changed, 194 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p1.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p2.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34980.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 5e272dbcf6b..7a8b845953c 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -25,6 +25,9 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-27447-regression_p2.patch \
            file://CVE-2026-41079.patch \
            file://CVE-2026-34978.patch \
+           file://CVE-2026-34980.patch \
+           file://CVE-2026-34980-regression_p1.patch \
+           file://CVE-2026-34980-regression_p2.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p1.patch b/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p1.patch
new file mode 100644
index 00000000000..483d695a93a
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p1.patch
@@ -0,0 +1,31 @@
+From 3f2bdc293243bca938c6de23ba50e6d783189629 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Tue, 28 Apr 2026 17:42:41 -0400
+Subject: [PATCH] Fix filter PPD keyword processing (Issue #1562)
+
+CVE: CVE-2026-34980
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/3f2bdc293243bca938c6de23ba50e6d783189629]
+
+(cherry picked from commit 3f2bdc293243bca938c6de23ba50e6d783189629)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ scheduler/job.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scheduler/job.c b/scheduler/job.c
+index 895b2d9..915ba94 100644
+--- a/scheduler/job.c
++++ b/scheduler/job.c
+@@ -5419,7 +5419,7 @@ update_job(cupsd_job_t *job)		/* I - Job to check */
+       keywords     = NULL;
+       num_keywords = cupsParseOptions(message, 0, &keywords);
+ 
+-      for (i = 0, keyword = keywords; i < num_keywords; i ++)
++      for (i = 0, keyword = keywords; i < num_keywords; i ++, keyword ++)
+       {
+        /*
+         * Filter out "special" PPD keywords...
+-- 
+2.43.7
+
+
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p2.patch b/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p2.patch
new file mode 100644
index 00000000000..739938c9a59
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p2.patch
@@ -0,0 +1,75 @@
+From da0ff58c041f7ee129c3c2c72fb14df1f1e4069a Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Wed, 8 Apr 2026 16:42:48 -0400
+Subject: [PATCH] Fix get_options regression (Issue #1532)
+
+CVE: CVE-2026-34980
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/da0ff58c041f7ee129c3c2c72fb14df1f1e4069a]
+
+(cherry picked from commit da0ff58c041f7ee129c3c2c72fb14df1f1e4069a)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ scheduler/job.c |  4 ++--
+ test/5.5-lp.sh  | 10 +++++-----
+ 2 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/scheduler/job.c b/scheduler/job.c
+index 6b9d366..cf019e1 100644
+--- a/scheduler/job.c
++++ b/scheduler/job.c
+@@ -4144,7 +4144,7 @@ get_options(cupsd_job_t *job,		/* I - Job */
+ 	  case IPP_TAG_CHARSET :
+ 	  case IPP_TAG_LANGUAGE :
+ 	  case IPP_TAG_URI :
+-	      for (valptr = attr->values[i].string.text; *valptr;)
++	      for (valptr = attr->values[i].string.text; *valptr; valptr ++)
+ 	      {
+ 	       /*
+ 	        * Convert tabs and newlines to spaces, filter out control chars,
+@@ -4159,7 +4159,7 @@ get_options(cupsd_job_t *job,		/* I - Job */
+ 	        {
+ 	          if (strchr("\\\'\"", *valptr))
+ 		    *optptr++ = '\\';
+-		  *optptr++ = *valptr++;
++		  *optptr++ = *valptr;
+ 		}
+ 	      }
+ 
+diff --git a/test/5.5-lp.sh b/test/5.5-lp.sh
+index 25e9d65..fe60890 100644
+--- a/test/5.5-lp.sh
++++ b/test/5.5-lp.sh
+@@ -2,7 +2,7 @@
+ #
+ # Test the lp command.
+ #
+-# Copyright © 2020-2024 by OpenPrinting.
++# Copyright © 2020-2026 by OpenPrinting.
+ # Copyright © 2007-2019 by Apple Inc.
+ # Copyright © 1997-2005 by Easy Software Products, all rights reserved.
+ #
+@@ -72,8 +72,8 @@ echo ""
+ 
+ echo "LP Flood Test ($1 times in parallel)"
+ echo ""
+-echo "    lp -d Test1 testfile.jpg"
+-echo "    lp -d Test2 testfile.jpg"
++echo "    lp -d Test1 -t 'Flood Test N' testfile.jpg"
++echo "    lp -d Test2 -t 'Flood Test N' testfile.jpg"
+ i=0
+ pids=""
+ while test $i -lt $1; do
+@@ -83,9 +83,9 @@ while test $i -lt $1; do
+ 		j=`expr $j + 1`
+ 	done
+ 
+-	$runcups $VALGRIND ../systemv/lp -d Test1 ../examples/testfile.jpg 2>&1 &
++	$runcups $VALGRIND ../systemv/lp -d Test1 -t "Flood Test $j" ../examples/testfile.jpg 2>&1 &
+ 	pids="$pids $!"
+-	$runcups $VALGRIND ../systemv/lp -d Test2 ../examples/testfile.jpg 2>&1 &
++	$runcups $VALGRIND ../systemv/lp -d Test2 -t "Flood Test $j" ../examples/testfile.jpg 2>&1 &
+ 	pids="$pids $!"
+ 
+ 	i=`expr $i + 1`
+-- 
+2.43.7
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34980.patch b/meta/recipes-extended/cups/cups/CVE-2026-34980.patch
new file mode 100644
index 00000000000..c38cc2c9e38
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-34980.patch
@@ -0,0 +1,85 @@
+From e206c7643a7574cab2e9457eac4c9f755dbf44ff Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Tue, 31 Mar 2026 14:45:13 -0400
+Subject: [PATCH] Filter out control characters from option values.
+
+CVE: CVE-2026-34980
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/8d0f51cac24cb5bf949c5b6a221e51a150d982e3]
+
+Backport Changes:
+- Rebase scheduler/job.c option-handling context to the CUPS 2.4.11
+  source carried by this recipe.
+- Omit the upstream CHANGES.md release-note hunk because Yocto patch metadata
+  carries the CVE details and the target source release-note sections differ.
+
+(cherry picked from commit 8d0f51cac24cb5bf949c5b6a221e51a150d982e3)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ scheduler/job.c |   41 +++++++++++++++++++++++++++++++++++------
+ 1 file changed, 35 insertions(+), 6 deletions(-)
+
+diff --git a/scheduler/job.c b/scheduler/job.c
+index 822a247..895b2d9 100644
+--- a/scheduler/job.c
++++ b/scheduler/job.c
+@@ -4121,9 +4121,21 @@ get_options(cupsd_job_t *job,		/* I - Job */
+ 	  case IPP_TAG_URI :
+ 	      for (valptr = attr->values[i].string.text; *valptr;)
+ 	      {
+-	        if (strchr(" \t\n\\\'\"", *valptr))
+-		  *optptr++ = '\\';
+-		*optptr++ = *valptr++;
++	       /*
++	        * Convert tabs and newlines to spaces, filter out control chars,
++	        * and escape \, ', and ".
++	        */
++
++	        if (isspace(*valptr & 255))
++	        {
++	          *optptr++ = ' ';
++	        }
++	        else if ((*valptr & 255) >= ' ' && *valptr != 0x7f)
++	        {
++	          if (strchr("\\\'\"", *valptr))
++		    *optptr++ = '\\';
++		  *optptr++ = *valptr++;
++		}
+ 	      }
+ 
+ 	      *optptr = '\0';
+@@ -5394,13 +5409,30 @@ update_job(cupsd_job_t *job)		/* I - Job to check */
+     else if (loglevel == CUPSD_LOG_PPD)
+     {
+      /*
+-      * Set attribute(s)...
++      * Set PPD keyword(s)/value(s)...
+       */
+ 
++      int		i,		/* Looping var */
++			num_keywords;	/* Number of keywords */
++      cups_option_t	*keywords,	/* Keywords */
++			*keyword;	/* Current keyword */
++
+       cupsdLogJob(job, CUPSD_LOG_DEBUG, "PPD: %s", message);
+ 
+-      job->num_keywords = cupsParseOptions(message, job->num_keywords,
+-                                           &job->keywords);
++      keywords     = NULL;
++      num_keywords = cupsParseOptions(message, 0, &keywords);
++
++      for (i = 0, keyword = keywords; i < num_keywords; i ++)
++      {
++       /*
++        * Filter out "special" PPD keywords...
++        */
++
++        if (strcmp(keyword->name, "cupsFilter") && strcmp(keyword->name, "cupsFilter2") && strcmp(keyword->name, "cupsFinishingTemplate") && strcmp(keyword->name, "cupsIPPFinishings") && strcmp(keyword->name, "cupsIPPReason") && strcmp(keyword->name, "cupsMarkerName") && strcmp(keyword->name, "cupsMaxSize") && strncmp(keyword->name, "cupsMediaQualifier", 18) && strcmp(keyword->name, "cupsMinSize") && strcmp(keyword->name, "cupsPageSizeCategory") && strcmp(keyword->name, "cupsPortMonitor") && strcmp(keyword->name, "cupsPreFilter") && strcmp(keyword->name, "cupsPrintQuality") && strcmp(keyword->name, "APPrinterPreset"))
++          job->num_keywords = cupsAddOption(keyword->name, keyword->value, job->num_keywords, &job->keywords);
++      }
++
++      cupsFreeOptions(num_keywords, keywords);
+     }
+     else
+     {
+-- 
+2.43.7

