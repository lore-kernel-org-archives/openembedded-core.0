Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4574FC6FA8A
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 14:18:20 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.5123.1663078692097271625
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 07:18:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=CktspqrT;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id
 i15-20020a17090a4b8f00b0020073b4ac27so11492094pjh.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 07:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=03h+yj3EdUMa3ldbuaB6ohdTzpaQp46lRrfv1t95tWs=;
        b=CktspqrT9GLQbjzq9ag0QRsRldTB0NfzztlA1FB2L5nOZjT9uGn71/1RMC00TNmWaf
         6leOKkvhpxdegQt9wn3DkwaHMuBXHM9Oe6B9MSv5oIrrCfe2yAjVO+BqWfpa9DtuurzO
         HKAf0ekbLnUCL3VHA0VVBQGMSDqpx416MtvzU7oJEpa67wRar68fKTlkGGPmQ502//HI
         frcMr98dlVBqQEX3mLWayK53bcxAPdi2vq28Lv5OyuUVJxxez03qMcb4CygoqRS4HqUw
         w0jdswDhXjBVvb3oalMm7+FP/Zt6d64Hb8M/1UmBXzhehqTqm7QSIlRHTsIEqwNjyvM7
         nlPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=03h+yj3EdUMa3ldbuaB6ohdTzpaQp46lRrfv1t95tWs=;
        b=qnmp1CcukgLJRYVOdz/hpu1jnHXObUTsJ0b4/uEvNsnB+g7jCaAlylEQ9BsiUWmTK7
         OQ+v3jFzICG9nXVzzLEXvdjuah3Cb5apsXpYADeb7I3/s6EjFJdUPVXdA+v6ZZBi8E1f
         BcKN089TmBQPtmY05bp9X3Z6fR1MP51gNB9LhpLlcNVsjVo7Oaeem8rEArNRy3REgUEf
         G4P8CaUozOZrNQsp8AhGKYnrqZiTbQUCn7jkkKOj8BoC3qiYZq/FQrqLAKzfo67hgX9z
         ItsSa4PI19YA0JVeGw5fI5Ts+aG01I7IhKoOXa6wHu1x1WrIT2QQhnpe7kShOvQy1TNL
         EEww==
X-Gm-Message-State: ACgBeo0KvYcYuiHnWlOJYWyqy0FmGHvGxGUoe38sLbiZnXpZq7jGMqLE
	LWi/9VWmmiUYJw4PHfsV6GjZHXL83D3ewVAG
X-Google-Smtp-Source: 
 AA6agR4h59YN3p1KM72Amwu+tkbonW5UAkmyL6GDZu9c71hY1Jtn1runkqtjY3/y1t8MIDr7V7IkOg==
X-Received: by 2002:a17:902:d2c2:b0:177:ed66:798 with SMTP id
 n2-20020a170902d2c200b00177ed660798mr28083232plc.76.1663078695093;
        Tue, 13 Sep 2022 07:18:15 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g11-20020aa796ab000000b0053bf1f90188sm8086424pfk.176.2022.09.13.07.18.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 07:18:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/16] cracklib: upgrade 2.9.7 -> 2.9.8
Date: Tue, 13 Sep 2022 04:17:42 -1000
Message-Id: 
 <db2c661fa421ce18d78b022c63be99de493184ee.1663078051.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663078051.git.steve@sakoman.com>
References: <cover.1663078051.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 14:18:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170580

From: wangmy <wangmy@fujitsu.com>

v2.9.8 Correct parameter types to Debug() calls
       rules: Drop using register keyword
       remove needless use of %defattr per fedora project
       add exec perms
       translation updates
       Use what's in the build environment and use a current autoconf
       util/Makefile.am: fix link with lintl
       Force grep to treat the input as text when formatting word files

0001-rules-Drop-using-register-keyword.patch
0002-rules-Correct-parameter-types-to-Debug-calls.patch
removed since they're included in 2.9.8

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7477178a4c60c02c2d1638746148dd3d2941dc28)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


