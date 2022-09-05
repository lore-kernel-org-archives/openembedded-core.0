Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F377C6FA86
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 09:03:52 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.22588.1662368622160644440
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 02:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=a41eID88;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662368620; i=@fujitsu.com;
	bh=lOLlbHOjchyc09YPBIv7MHWPHQJbI4c6c/BdGz2Vbzs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=a41eID88Q0g9qTMPxv6wma5o6mJzy0qSOl6wpZr9vgnptLPAz/hOArwR672biRcEL
	 Iv8nIR67a9LzlsZhYpoiXxxA+UgfSy7ISLpOBGVjFJbNII7cQSGLVE36BHoHoVjIKo
	 HRe82Ex5OcAcGDMBMSh0rv9175qGMDQ5b/hdbmDkM37lnX/a7qQcuNrIu3wLQVED6X
	 RtR+bdhK9mbs8YyPLchDolvTteUSj8V5gopxoO4CRcO0KFFhDpetJ+n0Z42rtrpat5
	 3JXkQRmzfVxqRXAhe1cFF0JjanepnHRO+Gk9KFbQE1Ktf5AqzH8s8JbFsJOIGRV562
	 tb7Br77HyzbwQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORqJu9WzT
  Z4NIOFYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePF/slMBX/CKtZdZm9gfOHSxcjFISTwmFHi
  9e6zzBDONSaJRRub2CCc3YwSs6csBnI4OdgE1CSm37rB2sXIwSEioCdx9Z8oSJhZQEXixe8ed
  hBbWMBaYtWvZ4wgNgtQvHHuVCYQm1fASWLR3zdgYyQEFCSmPHzPDBEXlDg58wkLxBwJiYMvXj
  BD1ChKzL7czAJhV0g0Tj/EBGGrSVw9t4l5AiP/LCTts5C0L2BkWsVok1SUmZ5RkpuYmaNraGC
  ga2hoqmtppmtobKiXWKWbqJdaqpuXX1SSoQvklxfrpRYX6xVX5ibnpOjlpZZsYgSGZUpxQvMO
  xnv7fukdYpTkYFIS5X0/RzRZiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTvyh1AOcGi1PTUirTMH
  GCMwKQlOHiURHj91wGleYsLEnOLM9MhUqcY7Tmmzv63n5ljOZic+bXtADPHpn1dB5iFWPLy81
  KlxHk3gUwVAGnLKM2DGwqL6UuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHm5QKbwZOaVwO1
  +BXQWE9BZdn3CIGeVJCKkpBqY2HWbXH69ap3vOjPxgbiI5TfOK8xLQ3wvOhiKv+X3/BQUU2/2
  SyaRRaHnbujnKVP+dpx+PKHD0X3HuyXrhSe/c+64+o2/89Kr2W/S1b9Ozzy/nNHAqGThH4+46
  1e+ngtODSvlPHj6nuryyoMBGxqfLaq9/pJhm71g26OGohx766sSD68vfaxjlL/Z1yBtWpryX9
  YlBxV9t+pey1mm/fBluu0r0+fP9h1ZVPjWpzmH9fs5+9RbkVk+G5c7FKt+WtfqzMwnullL+9W
  z/vjwqCh+3os71nJNW2kueuBuap5Rh0nstAheFtVG+VrmhUfb/sjuM7o+M4fdraYvuenCKfUD
  S7Yn1H51PSF+RqmRKfWJEktxRqKhFnNRcSIAGkk7dmQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-728.messagelabs.com!1662368619!113092!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28148 invoked from network); 5 Sep 2022 09:03:39 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Sep 2022 09:03:39 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E0D2A1001A0
	for <openembedded-core@lists.openembedded.org>;
 Mon,  5 Sep 2022 10:03:38 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D475F10019F
	for <openembedded-core@lists.openembedded.org>;
 Mon,  5 Sep 2022 10:03:38 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 5 Sep 2022 10:03:36 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] cracklib: upgrade 2.9.7 -> 2.9.8
Date: Mon, 5 Sep 2022 17:03:17 +0800
Message-ID: <1662368601-32265-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Sep 2022 09:03:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170300

0001-rules-Drop-using-register-keyword.patch
0002-rules-Correct-parameter-types-to-Debug-calls.patch
removed since they're included in 2.9.8

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...01-rules-Drop-using-register-keyword.patch | 278 ------------------
 ...rrect-parameter-types-to-Debug-calls.patch |  40 ---
 .../{cracklib_2.9.7.bb => cracklib_2.9.8.bb}  |   4 +-
 3 files changed, 1 insertion(+), 321 deletions(-)
 delete mode 100644 meta/recipes-extended/cracklib/cracklib/0001-rules-Drop-using-register-keyword.patch
 delete mode 100644 meta/recipes-extended/cracklib/cracklib/0002-rules-Correct-parameter-types-to-Debug-calls.patch
 rename meta/recipes-extended/cracklib/{cracklib_2.9.7.bb => cracklib_2.9.8.bb} (83%)

diff --git a/meta/recipes-extended/cracklib/cracklib/0001-rules-Drop-using-register-keyword.patch b/meta/recipes-extended/cracklib/cracklib/0001-rules-Drop-using-register-keyword.patch
deleted file mode 100644
index a8446653eb..0000000000
--- a/meta/recipes-extended/cracklib/cracklib/0001-rules-Drop-using-register-keyword.patch
+++ /dev/null
@@ -1,278 +0,0 @@
-From fe49471cfa7fe0618615c065f4c0ad04e888bf92 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 7 Aug 2022 12:24:39 -0700
-Subject: [PATCH 1/2] rules: Drop using register keyword
-
-This is a deprecated keyword
-
-Upstream-Status: Submitted [https://github.com/cracklib/cracklib/pull/48]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/lib/rules.c | 94 ++++++++++++++++++++++++-------------------------
- 1 file changed, 47 insertions(+), 47 deletions(-)
-
-diff --git a/lib/rules.c b/lib/rules.c
-index 3a2aa46..6e7a12a 100644
---- a/lib/rules.c
-+++ b/lib/rules.c
-@@ -67,8 +67,8 @@ Suffix(myword, suffix)
-     char *myword;
-     char *suffix;
- {
--    register int i;
--    register int j;
-+    int i;
-+    int j;
-     i = strlen(myword);
-     j = strlen(suffix);
- 
-@@ -83,10 +83,10 @@ Suffix(myword, suffix)
- 
- char *
- Reverse(str)			/* return a pointer to a reversal */
--    register char *str;
-+    char *str;
- {
--    register int i;
--    register int j;
-+    int i;
-+    int j;
-     static char area[STRINGSIZE];
-     j = i = strlen(str);
-     while (*str)
-@@ -99,9 +99,9 @@ Reverse(str)			/* return a pointer to a reversal */
- 
- char *
- Uppercase(str)			/* return a pointer to an uppercase */
--    register char *str;
-+    char *str;
- {
--    register char *ptr;
-+    char *ptr;
-     static char area[STRINGSIZE];
-     ptr = area;
-     while (*str)
-@@ -116,9 +116,9 @@ Uppercase(str)			/* return a pointer to an uppercase */
- 
- char *
- Lowercase(str)			/* return a pointer to an lowercase */
--    register char *str;
-+    char *str;
- {
--    register char *ptr;
-+    char *ptr;
-     static char area[STRINGSIZE];
-     ptr = area;
-     while (*str)
-@@ -133,9 +133,9 @@ Lowercase(str)			/* return a pointer to an lowercase */
- 
- char *
- Capitalise(str)			/* return a pointer to an capitalised */
--    register char *str;
-+    char *str;
- {
--    register char *ptr;
-+    char *ptr;
-     static char area[STRINGSIZE];
-     ptr = area;
- 
-@@ -152,9 +152,9 @@ Capitalise(str)			/* return a pointer to an capitalised */
- 
- char *
- Pluralise(string)		/* returns a pointer to a plural */
--    register char *string;
-+    char *string;
- {
--    register int length;
-+    int length;
-     static char area[STRINGSIZE];
-     length = strlen(string);
-     strcpy(area, string);
-@@ -193,11 +193,11 @@ Pluralise(string)		/* returns a pointer to a plural */
- 
- char *
- Substitute(string, old, new)	/* returns pointer to a swapped about copy */
--    register char *string;
--    register char old;
--    register char new;
-+    char *string;
-+    char old;
-+    char new;
- {
--    register char *ptr;
-+    char *ptr;
-     static char area[STRINGSIZE];
-     ptr = area;
-     while (*string)
-@@ -211,11 +211,11 @@ Substitute(string, old, new)	/* returns pointer to a swapped about copy */
- 
- char *
- Purge(string, target)		/* returns pointer to a purged copy */
--    register char *string;
--    register char target;
-+    char *string;
-+    char target;
- {
--    register char *ptr;
--    static char area[STRINGSIZE];
-+    char *ptr;
-+    char area[STRINGSIZE];
-     ptr = area;
-     while (*string)
-     {
-@@ -238,11 +238,11 @@ Purge(string, target)		/* returns pointer to a purged copy */
- 
- int
- MatchClass(class, input)
--    register char class;
--    register char input;
-+    char class;
-+    char input;
- {
--    register char c;
--    register int retval;
-+    char c;
-+    int retval;
-     retval = 0;
- 
-     switch (class)
-@@ -357,8 +357,8 @@ MatchClass(class, input)
- 
- char *
- PolyStrchr(string, class)
--    register char *string;
--    register char class;
-+    char *string;
-+    char class;
- {
-     while (*string)
-     {
-@@ -373,11 +373,11 @@ PolyStrchr(string, class)
- 
- char *
- PolySubst(string, class, new)	/* returns pointer to a swapped about copy */
--    register char *string;
--    register char class;
--    register char new;
-+    char *string;
-+    char class;
-+    char new;
- {
--    register char *ptr;
-+    char *ptr;
-     static char area[STRINGSIZE];
-     ptr = area;
-     while (*string)
-@@ -391,10 +391,10 @@ PolySubst(string, class, new)	/* returns pointer to a swapped about copy */
- 
- char *
- PolyPurge(string, class)	/* returns pointer to a purged copy */
--    register char *string;
--    register char class;
-+    char *string;
-+    char class;
- {
--    register char *ptr;
-+    char *ptr;
-     static char area[STRINGSIZE];
-     ptr = area;
-     while (*string)
-@@ -433,7 +433,7 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
-     char *control;
- {
-     int limit;
--    register char *ptr;
-+    char *ptr;
-     static char area[STRINGSIZE * 2] = {0};
-     char area2[STRINGSIZE * 2] = {0};
-     strcpy(area, input);
-@@ -523,7 +523,7 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
- 		return NULL;
- 	    } else
- 	    {
--		register char *string;
-+		char *string;
- 		string = area;
- 		while (*(string++));
- 		string[-1] = *(++ptr);
-@@ -537,7 +537,7 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
- 		return NULL;
- 	    } else
- 	    {
--		register int i;
-+		int i;
- 		int start;
- 		int length;
- 		start = Char2Int(*(++ptr));
-@@ -563,7 +563,7 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
- 		return NULL;
- 	    } else
- 	    {
--		register int i;
-+		int i;
- 		i = Char2Int(*(++ptr));
- 		if (i < 0)
- 		{
-@@ -587,9 +587,9 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
- 		return NULL;
- 	    } else
- 	    {
--		register int i;
--		register char *p1;
--		register char *p2;
-+		int i;
-+		char *p1;
-+		char *p2;
- 		i = Char2Int(*(++ptr));
- 		if (i < 0)
- 		{
-@@ -696,7 +696,7 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
- 		return NULL;
- 	    } else
- 	    {
--		register int i;
-+		int i;
- 		if ((i = Char2Int(ptr[1])) < 0)
- 		{
- 		    Debug(1, "Mangle: '=' weird argument in '%s'\n", control);
-@@ -723,7 +723,7 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
- 	case RULE_DFIRST:
- 	    if (area[0])
- 	    {
--		register int i;
-+		int i;
- 		for (i = 1; area[i]; i++)
- 		{
- 		    area[i - 1] = area[i];
-@@ -735,7 +735,7 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
- 	case RULE_DLAST:
- 	    if (area[0])
- 	    {
--		register int i;
-+		int i;
- 		for (i = 1; area[i]; i++);
- 		area[i - 1] = '\0';
- 	    }
-@@ -771,7 +771,7 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
- 		return NULL;
- 	    } else
- 	    {
--		register int i;
-+		int i;
- 
- 		for (i = 0; area[i]; i++);
- 
-@@ -815,8 +815,8 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
- 
- int
- PMatch(control, string)
--register char *control;
--register char *string;
-+char *control;
-+char *string;
- {
-     while (*string && *control)
-     {
--- 
-2.37.1
-
diff --git a/meta/recipes-extended/cracklib/cracklib/0002-rules-Correct-parameter-types-to-Debug-calls.patch b/meta/recipes-extended/cracklib/cracklib/0002-rules-Correct-parameter-types-to-Debug-calls.patch
deleted file mode 100644
index a8692b0cca..0000000000
--- a/meta/recipes-extended/cracklib/cracklib/0002-rules-Correct-parameter-types-to-Debug-calls.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 793921a8ee4ae7f20e1fd2bbec5196bc83176b01 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 7 Aug 2022 12:25:24 -0700
-Subject: [PATCH 2/2] rules: Correct parameter types to Debug() calls
-
-Fixes
-src/lib/rules.c:346:45: error: incompatible integer to pointer conversion passing 'char' to parameter of type 'char *'; take the address with & [-Wint-conversion]
-src/lib/rules.c:804:53: error: incompatible integer to pointer conversion passing 'char' to parameter of type 'char *'; remove * [-Wint-conversion]                                           Debug(1, "Mangle: unknown command %c in %s\n", *ptr, control);
-                                                           ^~~~
-Upstream-Status: Submitted [https://github.com/cracklib/cracklib/pull/48]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/lib/rules.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lib/rules.c b/lib/rules.c
-index 6e7a12a..4a34f91 100644
---- a/lib/rules.c
-+++ b/lib/rules.c
-@@ -343,7 +343,7 @@ MatchClass(class, input)
- 	break;
- 
-     default:
--	Debug(1, "MatchClass: unknown class %c\n", class);
-+	Debug(1, "MatchClass: unknown class %c\n", &class);
- 	return (0);
- 	break;
-     }
-@@ -801,7 +801,7 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
- 	    }
- 
- 	default:
--	    Debug(1, "Mangle: unknown command %c in %s\n", *ptr, control);
-+	    Debug(1, "Mangle: unknown command %c in %s\n", ptr, control);
- 	    return NULL;
- 	    break;
- 	}
--- 
-2.37.1
-
diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.7.bb b/meta/recipes-extended/cracklib/cracklib_2.9.8.bb
similarity index 83%
rename from meta/recipes-extended/cracklib/cracklib_2.9.7.bb
rename to meta/recipes-extended/cracklib/cracklib_2.9.8.bb
index ffed88ed01..786940a7e0 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.9.7.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.9.8.bb
@@ -12,11 +12,9 @@ EXTRA_OECONF = "--without-python --libdir=${base_libdir}"
 SRC_URI = "git://github.com/cracklib/cracklib;protocol=https;branch=master \
            file://0001-packlib.c-support-dictionary-byte-order-dependent.patch \
            file://0002-craklib-fix-testnum-and-teststr-failed.patch \
-           file://0001-rules-Drop-using-register-keyword.patch \
-           file://0002-rules-Correct-parameter-types-to-Debug-calls.patch \
            "
 
-SRCREV = "f83934cf3cced0c9600c7d81332f4169f122a2cf"
+SRCREV = "d9e8f9f47718539aeba80f90f4e072549926dc9c"
 S = "${WORKDIR}/git/src"
 
 inherit autotools gettext
-- 
2.25.1


