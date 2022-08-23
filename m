Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75081C32796
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 22:36:38 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.4541.1661294191256244153
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=KIHwqMTd;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id p13so2707350pld.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=4uJPk3rCwfxTzKUxTnlhtDU34cv+TYNmlkEmpnwo63A=;
        b=KIHwqMTdbB+16tGxskp59h76a7m4Z/hXH/pKnL1UpkdJ03BsV0zDcCygOEx8AG5Fmu
         BotmyLGc49qZ3hvLUy6Q9V506+Jc/hxTgs733m53gkejaeHCs+D5AtodOalEEIyREF7N
         Z3oI+/8JRTlw/VfqHgkF3XJn6wDY4TSFN/t7lhZgAhlfdB3xPIAi8eM0EKKbL9Pj+d0p
         wWQ1mJ/wlR/aDUjVc5fX7izXYuuSnG6YJ1c8qkLb9qhr02kgUSpaEddNdurOZrHOF0J2
         DK2CAdXmz1Qw7cejzPAKq6xZ9eTbQe7clK307rHtX7Amn5LG++yFUzBdfHzU4iig12dd
         8qKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=4uJPk3rCwfxTzKUxTnlhtDU34cv+TYNmlkEmpnwo63A=;
        b=0TlDLFigJRSSrI3HF4+EmoL7k9u0XarzTOnlJBCzE4QIZf8GrV/xkGXsEAusj4rjUL
         7k6cJm1d+qLt+X0ONGepVTjhIDvxnA+3eDiyQgx/pwhSnNzXoWFZgt4V8tywVwND+bOD
         yC4/bZJemryj2l5C5mYHPW8lX5bPhmS4NKcF9raY5IJVLC6X/EF5Pb1wdqsC1SHtn92p
         74bYVmQdiSks/WXT1050zMhMIYLJPfO0KWvSQQyeIEAy7jz5jSheDbn9GGmYmuq1pVrx
         ZWmavPJtt5ificKkz2AEwbymM3KWjr6M7eIQT3mgibEpheaz33yfE2zYujotSw5sYmRB
         AMKw==
X-Gm-Message-State: ACgBeo3NBLSAz1F2JNhZn93W1K9q5vCXKSLXtSv7YtbpINDPgJG+T5cp
	je/FC1SqjnH4OgyBNCIL5zYMgMEcbr37sy0Q
X-Google-Smtp-Source: 
 AA6agR5rB4NFzUuhkLBnw4HyqVwmD+3lpoIr8PW9JwMUlMatDWv0TIipU0yFr7gS5MJmEk7wrUvxiw==
X-Received: by 2002:a17:903:32c3:b0:172:b1ca:7bec with SMTP id
 i3-20020a17090332c300b00172b1ca7becmr25868293plr.41.1661294190207;
        Tue, 23 Aug 2022 15:36:30 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a1709026b8400b001729da53673sm11042141plk.14.2022.08.23.15.36.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 15:36:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/28] cracklib: Drop using register keyword
Date: Tue, 23 Aug 2022 12:35:32 -1000
Message-Id: 
 <123f04be2a6df0d7c388a359174d4c185080bdc8.1661293746.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661293745.git.steve@sakoman.com>
References: <cover.1661293745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 22:36:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169752

From: Khem Raj <raj.khem@gmail.com>

Fixes
incompatible integer to pointer conversion passing

These errors are found with newer compilers e.g. clang-15

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 71eb15c474d891855a5b18e6835993848ffa7c51)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...01-rules-Drop-using-register-keyword.patch | 278 ++++++++++++++++++
 ...rrect-parameter-types-to-Debug-calls.patch |  40 +++
 .../cracklib/cracklib_2.9.7.bb                |   5 +-
 3 files changed, 322 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/cracklib/cracklib/0001-rules-Drop-using-register-keyword.patch
 create mode 100644 meta/recipes-extended/cracklib/cracklib/0002-rules-Correct-parameter-types-to-Debug-calls.patch

diff --git a/meta/recipes-extended/cracklib/cracklib/0001-rules-Drop-using-register-keyword.patch b/meta/recipes-extended/cracklib/cracklib/0001-rules-Drop-using-register-keyword.patch
new file mode 100644
index 0000000000..a8446653eb
--- /dev/null
+++ b/meta/recipes-extended/cracklib/cracklib/0001-rules-Drop-using-register-keyword.patch
@@ -0,0 +1,278 @@
+From fe49471cfa7fe0618615c065f4c0ad04e888bf92 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 7 Aug 2022 12:24:39 -0700
+Subject: [PATCH 1/2] rules: Drop using register keyword
+
+This is a deprecated keyword
+
+Upstream-Status: Submitted [https://github.com/cracklib/cracklib/pull/48]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/lib/rules.c | 94 ++++++++++++++++++++++++-------------------------
+ 1 file changed, 47 insertions(+), 47 deletions(-)
+
+diff --git a/lib/rules.c b/lib/rules.c
+index 3a2aa46..6e7a12a 100644
+--- a/lib/rules.c
++++ b/lib/rules.c
+@@ -67,8 +67,8 @@ Suffix(myword, suffix)
+     char *myword;
+     char *suffix;
+ {
+-    register int i;
+-    register int j;
++    int i;
++    int j;
+     i = strlen(myword);
+     j = strlen(suffix);
+ 
+@@ -83,10 +83,10 @@ Suffix(myword, suffix)
+ 
+ char *
+ Reverse(str)			/* return a pointer to a reversal */
+-    register char *str;
++    char *str;
+ {
+-    register int i;
+-    register int j;
++    int i;
++    int j;
+     static char area[STRINGSIZE];
+     j = i = strlen(str);
+     while (*str)
+@@ -99,9 +99,9 @@ Reverse(str)			/* return a pointer to a reversal */
+ 
+ char *
+ Uppercase(str)			/* return a pointer to an uppercase */
+-    register char *str;
++    char *str;
+ {
+-    register char *ptr;
++    char *ptr;
+     static char area[STRINGSIZE];
+     ptr = area;
+     while (*str)
+@@ -116,9 +116,9 @@ Uppercase(str)			/* return a pointer to an uppercase */
+ 
+ char *
+ Lowercase(str)			/* return a pointer to an lowercase */
+-    register char *str;
++    char *str;
+ {
+-    register char *ptr;
++    char *ptr;
+     static char area[STRINGSIZE];
+     ptr = area;
+     while (*str)
+@@ -133,9 +133,9 @@ Lowercase(str)			/* return a pointer to an lowercase */
+ 
+ char *
+ Capitalise(str)			/* return a pointer to an capitalised */
+-    register char *str;
++    char *str;
+ {
+-    register char *ptr;
++    char *ptr;
+     static char area[STRINGSIZE];
+     ptr = area;
+ 
+@@ -152,9 +152,9 @@ Capitalise(str)			/* return a pointer to an capitalised */
+ 
+ char *
+ Pluralise(string)		/* returns a pointer to a plural */
+-    register char *string;
++    char *string;
+ {
+-    register int length;
++    int length;
+     static char area[STRINGSIZE];
+     length = strlen(string);
+     strcpy(area, string);
+@@ -193,11 +193,11 @@ Pluralise(string)		/* returns a pointer to a plural */
+ 
+ char *
+ Substitute(string, old, new)	/* returns pointer to a swapped about copy */
+-    register char *string;
+-    register char old;
+-    register char new;
++    char *string;
++    char old;
++    char new;
+ {
+-    register char *ptr;
++    char *ptr;
+     static char area[STRINGSIZE];
+     ptr = area;
+     while (*string)
+@@ -211,11 +211,11 @@ Substitute(string, old, new)	/* returns pointer to a swapped about copy */
+ 
+ char *
+ Purge(string, target)		/* returns pointer to a purged copy */
+-    register char *string;
+-    register char target;
++    char *string;
++    char target;
+ {
+-    register char *ptr;
+-    static char area[STRINGSIZE];
++    char *ptr;
++    char area[STRINGSIZE];
+     ptr = area;
+     while (*string)
+     {
+@@ -238,11 +238,11 @@ Purge(string, target)		/* returns pointer to a purged copy */
+ 
+ int
+ MatchClass(class, input)
+-    register char class;
+-    register char input;
++    char class;
++    char input;
+ {
+-    register char c;
+-    register int retval;
++    char c;
++    int retval;
+     retval = 0;
+ 
+     switch (class)
+@@ -357,8 +357,8 @@ MatchClass(class, input)
+ 
+ char *
+ PolyStrchr(string, class)
+-    register char *string;
+-    register char class;
++    char *string;
++    char class;
+ {
+     while (*string)
+     {
+@@ -373,11 +373,11 @@ PolyStrchr(string, class)
+ 
+ char *
+ PolySubst(string, class, new)	/* returns pointer to a swapped about copy */
+-    register char *string;
+-    register char class;
+-    register char new;
++    char *string;
++    char class;
++    char new;
+ {
+-    register char *ptr;
++    char *ptr;
+     static char area[STRINGSIZE];
+     ptr = area;
+     while (*string)
+@@ -391,10 +391,10 @@ PolySubst(string, class, new)	/* returns pointer to a swapped about copy */
+ 
+ char *
+ PolyPurge(string, class)	/* returns pointer to a purged copy */
+-    register char *string;
+-    register char class;
++    char *string;
++    char class;
+ {
+-    register char *ptr;
++    char *ptr;
+     static char area[STRINGSIZE];
+     ptr = area;
+     while (*string)
+@@ -433,7 +433,7 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
+     char *control;
+ {
+     int limit;
+-    register char *ptr;
++    char *ptr;
+     static char area[STRINGSIZE * 2] = {0};
+     char area2[STRINGSIZE * 2] = {0};
+     strcpy(area, input);
+@@ -523,7 +523,7 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
+ 		return NULL;
+ 	    } else
+ 	    {
+-		register char *string;
++		char *string;
+ 		string = area;
+ 		while (*(string++));
+ 		string[-1] = *(++ptr);
+@@ -537,7 +537,7 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
+ 		return NULL;
+ 	    } else
+ 	    {
+-		register int i;
++		int i;
+ 		int start;
+ 		int length;
+ 		start = Char2Int(*(++ptr));
+@@ -563,7 +563,7 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
+ 		return NULL;
+ 	    } else
+ 	    {
+-		register int i;
++		int i;
+ 		i = Char2Int(*(++ptr));
+ 		if (i < 0)
+ 		{
+@@ -587,9 +587,9 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
+ 		return NULL;
+ 	    } else
+ 	    {
+-		register int i;
+-		register char *p1;
+-		register char *p2;
++		int i;
++		char *p1;
++		char *p2;
+ 		i = Char2Int(*(++ptr));
+ 		if (i < 0)
+ 		{
+@@ -696,7 +696,7 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
+ 		return NULL;
+ 	    } else
+ 	    {
+-		register int i;
++		int i;
+ 		if ((i = Char2Int(ptr[1])) < 0)
+ 		{
+ 		    Debug(1, "Mangle: '=' weird argument in '%s'\n", control);
+@@ -723,7 +723,7 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
+ 	case RULE_DFIRST:
+ 	    if (area[0])
+ 	    {
+-		register int i;
++		int i;
+ 		for (i = 1; area[i]; i++)
+ 		{
+ 		    area[i - 1] = area[i];
+@@ -735,7 +735,7 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
+ 	case RULE_DLAST:
+ 	    if (area[0])
+ 	    {
+-		register int i;
++		int i;
+ 		for (i = 1; area[i]; i++);
+ 		area[i - 1] = '\0';
+ 	    }
+@@ -771,7 +771,7 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
+ 		return NULL;
+ 	    } else
+ 	    {
+-		register int i;
++		int i;
+ 
+ 		for (i = 0; area[i]; i++);
+ 
+@@ -815,8 +815,8 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
+ 
+ int
+ PMatch(control, string)
+-register char *control;
+-register char *string;
++char *control;
++char *string;
+ {
+     while (*string && *control)
+     {
+-- 
+2.37.1
+
diff --git a/meta/recipes-extended/cracklib/cracklib/0002-rules-Correct-parameter-types-to-Debug-calls.patch b/meta/recipes-extended/cracklib/cracklib/0002-rules-Correct-parameter-types-to-Debug-calls.patch
new file mode 100644
index 0000000000..a8692b0cca
--- /dev/null
+++ b/meta/recipes-extended/cracklib/cracklib/0002-rules-Correct-parameter-types-to-Debug-calls.patch
@@ -0,0 +1,40 @@
+From 793921a8ee4ae7f20e1fd2bbec5196bc83176b01 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 7 Aug 2022 12:25:24 -0700
+Subject: [PATCH 2/2] rules: Correct parameter types to Debug() calls
+
+Fixes
+src/lib/rules.c:346:45: error: incompatible integer to pointer conversion passing 'char' to parameter of type 'char *'; take the address with & [-Wint-conversion]
+src/lib/rules.c:804:53: error: incompatible integer to pointer conversion passing 'char' to parameter of type 'char *'; remove * [-Wint-conversion]                                           Debug(1, "Mangle: unknown command %c in %s\n", *ptr, control);
+                                                           ^~~~
+Upstream-Status: Submitted [https://github.com/cracklib/cracklib/pull/48]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/lib/rules.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/rules.c b/lib/rules.c
+index 6e7a12a..4a34f91 100644
+--- a/lib/rules.c
++++ b/lib/rules.c
+@@ -343,7 +343,7 @@ MatchClass(class, input)
+ 	break;
+ 
+     default:
+-	Debug(1, "MatchClass: unknown class %c\n", class);
++	Debug(1, "MatchClass: unknown class %c\n", &class);
+ 	return (0);
+ 	break;
+     }
+@@ -801,7 +801,7 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
+ 	    }
+ 
+ 	default:
+-	    Debug(1, "Mangle: unknown command %c in %s\n", *ptr, control);
++	    Debug(1, "Mangle: unknown command %c in %s\n", ptr, control);
+ 	    return NULL;
+ 	    break;
+ 	}
+-- 
+2.37.1
+
diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.7.bb b/meta/recipes-extended/cracklib/cracklib_2.9.7.bb
index 629069e844..ffed88ed01 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.9.7.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.9.7.bb
@@ -11,7 +11,10 @@ EXTRA_OECONF = "--without-python --libdir=${base_libdir}"
 
 SRC_URI = "git://github.com/cracklib/cracklib;protocol=https;branch=master \
            file://0001-packlib.c-support-dictionary-byte-order-dependent.patch \
-           file://0002-craklib-fix-testnum-and-teststr-failed.patch"
+           file://0002-craklib-fix-testnum-and-teststr-failed.patch \
+           file://0001-rules-Drop-using-register-keyword.patch \
+           file://0002-rules-Correct-parameter-types-to-Debug-calls.patch \
+           "
 
 SRCREV = "f83934cf3cced0c9600c7d81332f4169f122a2cf"
 S = "${WORKDIR}/git/src"
-- 
2.25.1


