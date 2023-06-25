Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D7EC00528
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 21:22:57 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.20344.1687728170823153697
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jun 2023 14:22:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=dC3r7OWt;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-31114b46d62so3209924f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 14:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687728169; x=1690320169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MguguT3XA05K7vBNi/uBTv7XqLGUY1TQvFijwo70q5U=;
        b=dC3r7OWtmJOYmjqXosdqdmz2dcHiomS4ifM7db62MRMD6Kr3j0zBV4TJnz9d9JUrel
         yztgN6PoDlLowpBi2Xnu70op/fmGpE6LmTRDXEUczAi+ZztQ+xfP///qWxSzvsXCiTsG
         0uW6YAUL/nzS3hg901R/H/FKa3j3mMRvgP1UFd1sP5eO0gsMgh/LfaE/Z8NLsLqiusM9
         6o6ENofz8A4IbeqABohMqORBxqZklFDXHF2tnsIpRmnSnwTfacKDPPJayf4G7XebAtNx
         dokFI3rWaeFtqPYKtWG2RKQQI4ccws6E/bepxzqpcKGaOST12/ttdIMAtm0Zq6rcPLcl
         HIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687728169; x=1690320169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MguguT3XA05K7vBNi/uBTv7XqLGUY1TQvFijwo70q5U=;
        b=foNKvO7ebmpo9iyY7oHJrC71O++kHBhzL9fMC3UV9lpZjv4WWgMHJkFSVP63XYMiSP
         Jg8rmbGtmsWXx7TaGkBEF0Fc7gawDJBlPIFDpB9rVU+NRojHU/YU+l2/O4MPIYbZBjTj
         Jj4dQEnCytMQqiIPa7sq5jg7+2aOcrcNwSBpzI537EB/8vdbFwlpmnnb1E+1YQFLfN9C
         C42Idhu75ksORjoFY28VyXnO6yji9oS2s1N2jVsXjE9wXnYnhoiQcapDfR+IVzcSpLea
         WC+GezYbdbgjfnSeZbl7BRYuP9jJf5XVrZy0wLOZBj9JZd1+xzUvEO3qOjQPv6tROaht
         nHHg==
X-Gm-Message-State: AC+VfDz0ZUUNW3GLmw4ba+kyjBCqkrmvajitWkWuBGS4ypm+2uR2ISmc
	WhaeXDHANOI4u+2yN6NEq0TcU7tkUHdVoQ==
X-Google-Smtp-Source: ACHHUZ5JbslaYfb65scFCp0x9Y42jksNydLFqPHk8hqa55aTUCM0LZ7dG+uzUifgMpAw4MMjGi2D+A==
X-Received: by 2002:adf:e7d0:0:b0:30a:ec6c:913 with SMTP id e16-20020adfe7d0000000b0030aec6c0913mr26378615wrn.10.1687728169165;
        Sun, 25 Jun 2023 14:22:49 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id q9-20020a056000136900b0030f9c3219aasm5426736wrz.47.2023.06.25.14.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 14:22:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/21] python3: update 3.11.3 -> 3.11.4
Date: Sun, 25 Jun 2023 23:22:29 +0200
Message-Id: <20230625212241.915739-9-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230625212241.915739-1-alex@linutronix.de>
References: <20230625212241.915739-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 21:22:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183384

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
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
index c9253832cfb..222a567dd56 100644
--- a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
+++ b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
@@ -1,4 +1,4 @@
-From 6cb667f37beacd832cb409e5244b3c90dfad32f7 Mon Sep 17 00:00:00 2001
+From aa8f1709c54557d2b51a9a37d15ccc3de62e90cb Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 4 Mar 2020 00:06:42 +0000
 Subject: [PATCH] Don't search system for headers/libraries
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
index df5179e8770..07c6aef9b97 100644
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
index d5b7ce2b95b..a0f3d729924 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -1,4 +1,4 @@
-From 4ed481f4928c361970e78f27c4d9be8700af176b Mon Sep 17 00:00:00 2001
+From 512c617bd00b74b30a80dd56a12391de46e2b6cf Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 10 Sep 2021 12:28:31 +0200
 Subject: [PATCH] Lib/sysconfig.py: use prefix value from build configuration
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
index 5ee4e4f126f..bbdd8b586e9 100644
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
@@ -1,4 +1,4 @@
-From 4c39252c71d8bca81fdc43753c83a59f8668c619 Mon Sep 17 00:00:00 2001
+From 843574d5a5b0818e83e20f8c0389d567bd4733fb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 14 May 2013 15:00:26 -0700
 Subject: [PATCH] python3: Add target and native recipes
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
index 979fc9dc364..c71c1e15dec 100644
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
index c7974849b60..6b074c48cf2 100644
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
2.30.2


