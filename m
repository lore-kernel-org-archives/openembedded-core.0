Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9040EE8001
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 13:47:27 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.39468.1694180840706839379
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Sep 2023 06:47:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1/gyCMJy;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-68bedc0c268so1973389b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 06:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694180840; x=1694785640; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bnDWgI7Xikb1OjFoW4gwzOdYBMcl7K3u4Am80DUL5/M=;
        b=1/gyCMJy4FHhtBMt4VIrvIQq65i3u89nZwXmNDg9RLdFsbXMw7ylv0ajFYK6YBhC28
         OnswQBaGk/6NT3C696qVxKtNwMx3949Jfr/84+BQF5NW/bqjo43dGA3cUQJnnYa8j+MA
         oe3D5W8dLGulkd6A41kCMZJHSOG7yRkRyzTmB/2qym4x5hcnnxOFPdv9yhQuJ0+xQrdu
         ytQPNmKWdb9rh/eKa1/vxBEuwWR5FcYR4d1krJMVj5WnJfS1rtwN1pfOz42YmakwzPc7
         F1iO/0Ae5atKqYfZZXvrncl3n3Kdsfqv8zxna/bTWifXesvR+Hk2j/vPcO5Xuw/CMqbL
         BCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694180840; x=1694785640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bnDWgI7Xikb1OjFoW4gwzOdYBMcl7K3u4Am80DUL5/M=;
        b=MG5hoiet1mObuWIy4qQBBw8CVKgXaMICIZm4/vOm2fRBBySGC3Iv1fcN38T1VIZ46P
         ReSjNfwcWAvZTd38od5wX0YGR9ZQ6ybjW8qW/Y72rrJpBz2TqGLSP3IKCJhFQ9D9BLj6
         HKjZdeKuUwBuSig1vk6yN+Ee7SU6IUpjsJJxUNUEiF6NWFP3J/J8yVnZgv6GMrSpcwcs
         DJYBDQ/QHckrAdyz2VUSXz8Eb1OmvW4DfMChP9t1+m5vicMoggVuk5VOTW2HlBhhNNWb
         /HILeSkEMjjpc0e1pwG3gU75Jq2MKY64oWBlcgOw7ddtBK/7qLprq9JZX5+i3xHxpLmL
         eiRA==
X-Gm-Message-State: AOJu0YzaG2oQU95wg1Re8smOc3PUk0EhfgWeLnB8UL09jDJ4Wm/C76Yj
	fXuK+AInyF6/dygmhVmjgVZqkTbRJKrukOfDdbY=
X-Google-Smtp-Source: AGHT+IGzJRt/iXeXgZ+T/MGIiuIgznakKUB0D5sJ5dKUi1x50HA9zeMnug9UXa+DLZ8+MfiYx8vcEQ==
X-Received: by 2002:a05:6a21:798a:b0:14c:d105:2d16 with SMTP id bh10-20020a056a21798a00b0014cd1052d16mr2585432pzc.32.1694180839712;
        Fri, 08 Sep 2023 06:47:19 -0700 (PDT)
Received: from xps13.. ([65.154.164.134])
        by smtp.gmail.com with ESMTPSA id x18-20020a056a00271200b00653fe2d527esm1344828pfv.32.2023.09.08.06.47.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 06:47:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 6/9] python3: update 3.11.3 -> 3.11.4
Date: Fri,  8 Sep 2023 03:46:57 -1000
Message-Id: <8687de9f20bde7aba118a50342848031adfb7641.1694179812.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694179812.git.steve@sakoman.com>
References: <cover.1694179812.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 13:47:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187428

From: Alexander Kanavin <alex.kanavin@gmail.com>

upgrade include fix for CVE-2023-24329

(cherry picked from commit f7f163ebe8c53de4314d04595c1fbcc7af2deccc )

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...1-Don-t-search-system-for-headers-libraries.patch |  2 +-
 ...y-handle-stdin-I-O-errors-same-way-as-maste.patch | 12 ++++++------
 ...nfig.py-use-prefix-value-from-build-configu.patch |  2 +-
 .../12-distutils-prefix-is-inside-staging-area.patch |  2 +-
 meta/recipes-devtools/python/python3/makerace.patch  |  8 ++++----
 .../python/{python3_3.11.3.bb => python3_3.11.4.bb}  |  2 +-
 6 files changed, 14 insertions(+), 14 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.11.3.bb => python3_3.11.4.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
index c9253832cf..222a567dd5 100644
--- a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
+++ b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
@@ -1,4 +1,4 @@
-From 6cb667f37beacd832cb409e5244b3c90dfad32f7 Mon Sep 17 00:00:00 2001
+From aa8f1709c54557d2b51a9a37d15ccc3de62e90cb Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 4 Mar 2020 00:06:42 +0000
 Subject: [PATCH] Don't search system for headers/libraries
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
index df5179e877..07c6aef9b9 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
@@ -1,4 +1,4 @@
-From 86061629f4a179e740a17e53dd2c98ab47af2fe2 Mon Sep 17 00:00:00 2001
+From 7b0a14e7320078ac891d415cab9b7568e3f52ad8 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 16 Sep 2021 16:35:37 +0200
 Subject: [PATCH] Lib/pty.py: handle stdin I/O errors same way as master I/O
@@ -30,18 +30,18 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/Lib/pty.py b/Lib/pty.py
-index 8d8ce40..35439c6 100644
+index fefb63a..4cef056 100644
 --- a/Lib/pty.py
 +++ b/Lib/pty.py
-@@ -154,7 +154,10 @@ def _copy(master_fd, master_read=_read, stdin_read=_read):
-                 os.write(STDOUT_FILENO, data)
+@@ -184,7 +184,10 @@ def _copy(master_fd, master_read=_read, stdin_read=_read):
+             i_buf = i_buf[n:]
  
-         if STDIN_FILENO in rfds:
+         if stdin_avail and STDIN_FILENO in rfds:
 -            data = stdin_read(STDIN_FILENO)
 +            try:
 +                data = stdin_read(STDIN_FILENO)
 +            except OSError:
 +                data = b""
              if not data:
-                 fds.remove(STDIN_FILENO)
+                 stdin_avail = False
              else:
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index d5b7ce2b95..a0f3d72992 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -1,4 +1,4 @@
-From 4ed481f4928c361970e78f27c4d9be8700af176b Mon Sep 17 00:00:00 2001
+From 512c617bd00b74b30a80dd56a12391de46e2b6cf Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 10 Sep 2021 12:28:31 +0200
 Subject: [PATCH] Lib/sysconfig.py: use prefix value from build configuration
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
index 5ee4e4f126..bbdd8b586e 100644
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
@@ -1,4 +1,4 @@
-From 4c39252c71d8bca81fdc43753c83a59f8668c619 Mon Sep 17 00:00:00 2001
+From 843574d5a5b0818e83e20f8c0389d567bd4733fb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 14 May 2013 15:00:26 -0700
 Subject: [PATCH] python3: Add target and native recipes
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
index 979fc9dc36..c71c1e15de 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -1,4 +1,4 @@
-From 4f52aaf2a548b3356c6f1369c62b11335dc27464 Mon Sep 17 00:00:00 2001
+From dde5cb74f55b6dd39d25cff639d16940d9dad505 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 13 Jul 2021 23:19:29 +0100
 Subject: [PATCH] python3: Fix make race
@@ -18,11 +18,11 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 7558f0c..8cec819 100644
+index c6d7e85..205af6c 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2005,7 +2005,7 @@ TESTSUBDIRS=	ctypes/test \
- 		unittest/test unittest/test/testmock
+@@ -2045,7 +2045,7 @@ TESTSUBDIRS=	ctypes/test \
+ 		unittest/test/testmock
  
  TEST_MODULES=@TEST_MODULES@
 -libinstall:	all $(srcdir)/Modules/xxmodule.c
diff --git a/meta/recipes-devtools/python/python3_3.11.3.bb b/meta/recipes-devtools/python/python3_3.11.4.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.11.3.bb
rename to meta/recipes-devtools/python/python3_3.11.4.bb
index 0563a0ab9b..41b27094c7 100644
--- a/meta/recipes-devtools/python/python3_3.11.3.bb
+++ b/meta/recipes-devtools/python/python3_3.11.4.bb
@@ -39,7 +39,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "8a5db99c961a7ecf27c75956189c9602c968751f11dbeae2b900dbff1c085b5e"
+SRC_URI[sha256sum] = "2f0e409df2ab57aa9fc4cbddfb976af44e4e55bf6f619eee6bc5c2297264a7f6"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.34.1


