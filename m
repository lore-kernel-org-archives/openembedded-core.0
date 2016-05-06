Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 45C7274197
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 07:12:03 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y7so9961560pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2016 00:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=JD9L2kp/YrivPAL8y3V6Dq9mQxoVMPdetyp9OVioZNk=;
	b=GSzZ9vjAamfecCZiXfr+tuPcAZgVc80V3xqWlxTw4h7GAERMqAxHuKR1/sT3DjyULF
	cQwS1adbwHT9iBmZjYoBpxfop1az+xL9y6HHPQktYygff3zxrshZfw1jecunvI6inByA
	LbBdMvu6jmA/SNUMIuOQiyNfSN8YIMVzlcwNpNlmpudTubPXJpF7eQg7DCn2hvTew7oi
	Y1yM4JDuH62tXi98itVNzKtvKCrlv1oJLbzcBy/5t9negHfM/SbWqakGwE0zD1fJuHLD
	V1TXSICmgH2NZikBYHUlvslO+pzzChslIvwPcFieVsWBymF8VWLPgDv+WdV0C0u1bIhg
	pIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JD9L2kp/YrivPAL8y3V6Dq9mQxoVMPdetyp9OVioZNk=;
	b=i75MiJLm7KrSO+9e95VMJmwqbP7ndtablyOn9cj9g913wMf4nLqbnyyBanMEMhD0to
	XxEcRmh6Sfws0xWsMpsj4r+8WP1omzwzqpPd/qoXw1sNKFcX4q0DjC6CCm3IrCZuCnup
	IosiRz/u2gv0uUt0o9PCEuGfXjTxQ5W7n8gTMuSVKWC05LqPV+u7RLKnN+Nb8wklVBNt
	K4R6rnegt19CO3KmO2/uklBaP1ymTaDir8+LXa3erbzItLev3GFhKQTQuwbcAgdl/XsK
	j+P+bJ6IRvdbVNJcc2oDIptW2vYc1LmrJi/BXDfzQMI1ajF5oUXMnPD5Rmxooag5Y6T5
	0tzA==
X-Gm-Message-State: AOPr4FXm2pCaVdNB2VEE3U/RLl00OzlXZrwS0d9HD/ZrNeHsLcGw/+lPCosCTbnAWs6lrw==
X-Received: by 10.98.10.20 with SMTP id s20mr27022919pfi.109.1462518724632;
	Fri, 06 May 2016 00:12:04 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	q129sm18417191pfb.16.2016.05.06.00.12.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 May 2016 00:12:03 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  6 May 2016 00:11:56 -0700
Message-Id: <1462518717-2629-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1462518717-2629-1-git-send-email-akuster808@gmail.com>
References: <1462518717-2629-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
Subject: [master][krogoth][PATCH 3/4] gcc: Security fix CVE-2016-2226
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
X-List-Received-Date: Fri, 06 May 2016 07:12:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/gcc/gcc-5.3.inc              |   1 +
 .../gcc/gcc-5.3/CVE-2016-2226.patch                | 103 +++++++++++++++++++++
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-2226.patch

diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc b/meta/recipes-devtools/gcc/gcc-5.3.inc
index 692758d..5fede2a 100644
--- a/meta/recipes-devtools/gcc/gcc-5.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
@@ -90,6 +90,7 @@ SRC_URI = "\
            file://0058-fdebug-prefix-map-support-to-remap-relative-path.patch \
            file://CVE-2016-4488.patch \
            file://CVE-2016-4489.patch \
+           file://CVE-2016-2226.patch \
 "
 
 BACKPORTS = ""
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-2226.patch b/meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-2226.patch
new file mode 100644
index 0000000..4decb84
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-2226.patch
@@ -0,0 +1,103 @@
+From b8106f544a7fd485b6959ebd197bdd99a8884416 Mon Sep 17 00:00:00 2001
+From: bernds <bernds@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 8 Apr 2016 12:10:21 +0000
+Subject: [PATCH] =?UTF-8?q?Fix=20memory=20allocation=20size=20overflows=20?=
+ =?UTF-8?q?(PR69687,=20patch=20by=20Marcel=20B=C3=B6hme)?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+	PR c++/69687
+	* cplus-dem.c: Include <limits.h> if available.
+	(INT_MAX): Define if necessary.
+	(remember_type, remember_Ktype, register_Btype, string_need):
+	Abort if we detect cases where we the size of the allocation would
+	overflow.
+
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@234829 138bc75d-0d04-0410-961f-82ee72b054a4
+Upstream-Status: Backport
+CVE: CVE-2016-2226
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ libiberty/ChangeLog   |  7 +++++++
+ libiberty/cplus-dem.c | 15 +++++++++++++++
+ 2 files changed, 22 insertions(+)
+
+diff --git a/libiberty/ChangeLog b/libiberty/ChangeLog
+index 8e82a5f..2a34356 100644
+--- a/libiberty/ChangeLog
++++ b/libiberty/ChangeLog
+@@ -1,5 +1,12 @@
+ 2016-04-08  Marcel Böhme  <boehme.marcel@gmail.com>
+ 
++	PR c++/69687
++	* cplus-dem.c: Include <limits.h> if available.
++	(INT_MAX): Define if necessary.
++	(remember_type, remember_Ktype, register_Btype, string_need):
++	Abort if we detect cases where we the size of the allocation would
++	overflow.
++
+ 	PR c++/70498
+ 	* cplus-dem.c (gnu_special): Handle case where consume_count returns
+ 	-1.
+diff --git a/libiberty/cplus-dem.c b/libiberty/cplus-dem.c
+index abba234..7514e57 100644
+--- a/libiberty/cplus-dem.c
++++ b/libiberty/cplus-dem.c
+@@ -56,6 +56,13 @@ void * malloc ();
+ void * realloc ();
+ #endif
+ 
++#ifdef HAVE_LIMITS_H
++#include <limits.h>
++#endif
++#ifndef INT_MAX
++# define INT_MAX       (int)(((unsigned int) ~0) >> 1)          /* 0x7FFFFFFF */ 
++#endif
++
+ #include <demangle.h>
+ #undef CURRENT_DEMANGLING_STYLE
+ #define CURRENT_DEMANGLING_STYLE work->options
+@@ -4261,6 +4268,8 @@ remember_type (struct work_stuff *work, const char *start, int len)
+ 	}
+       else
+ 	{
++          if (work -> typevec_size > INT_MAX / 2)
++	    xmalloc_failed (INT_MAX);
+ 	  work -> typevec_size *= 2;
+ 	  work -> typevec
+ 	    = XRESIZEVEC (char *, work->typevec, work->typevec_size);
+@@ -4288,6 +4297,8 @@ remember_Ktype (struct work_stuff *work, const char *start, int len)
+ 	}
+       else
+ 	{
++          if (work -> ksize > INT_MAX / 2)
++	    xmalloc_failed (INT_MAX);
+ 	  work -> ksize *= 2;
+ 	  work -> ktypevec
+ 	    = XRESIZEVEC (char *, work->ktypevec, work->ksize);
+@@ -4317,6 +4328,8 @@ register_Btype (struct work_stuff *work)
+ 	}
+       else
+ 	{
++          if (work -> bsize > INT_MAX / 2)
++	    xmalloc_failed (INT_MAX);
+ 	  work -> bsize *= 2;
+ 	  work -> btypevec
+ 	    = XRESIZEVEC (char *, work->btypevec, work->bsize);
+@@ -4771,6 +4784,8 @@ string_need (string *s, int n)
+   else if (s->e - s->p < n)
+     {
+       tem = s->p - s->b;
++      if (n > INT_MAX / 2 - tem)
++        xmalloc_failed (INT_MAX); 
+       n += tem;
+       n *= 2;
+       s->b = XRESIZEVEC (char, s->b, n);
+-- 
+2.3.5
+
-- 
2.3.5


