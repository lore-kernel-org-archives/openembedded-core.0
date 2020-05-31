Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.17525.1590940455172032243
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tWdE1kZf;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a2so6834493ejb.10
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dWnceJ0gd6sDK4qMUM1LCtaDtFIQBZKW5B3ZLv0H59M=;
        b=tWdE1kZfxWVTWEwg5cYYEWcxbQIpLxo3bXWPBb4p5jGwfUZ4EdUd2X2Q1AYVvMx+f8
         LtSwLQKhp6EMieHa4rHQr/DmIhM7ziOWQmKxEe7sDDZKt0ZV9++TzF+onnkKaVr7vZjs
         Wuso7q5hNgPwzaSpdwdB9eInWuKBxzgRx7MGlkdGTx9q7LIjYU2u+3aTccqKffF5pPcB
         0H6RAAhzz4zz+MnDNiWglHJ/0QrfZVrAIF/jq+MLSUdQ4My6m4nhz8QIhszf/X4UC1JX
         9HjEsJi9wPIr6yuR8N9fzLzphu9pleMnqv0v0689i/Bx2qxzD6jmUYjt3Z8+Cw+YjUzc
         kDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dWnceJ0gd6sDK4qMUM1LCtaDtFIQBZKW5B3ZLv0H59M=;
        b=BOyWmRKEQz/djKnawKzJuoXV6LqwsGlik7WZJw5ISVNoPZgfAHbgSzsP3Su/7C8dPA
         eQMofLls7EWAZP2EmTdbSLH3JeZnsJMvCUUtygi0wTCHP/YvnlIYrhsn29Sz2sHvSOyz
         g1MaXwJJhNjqPMLOHIaAnYgO53Unioc5Hg/vGh/cQb3KIqAVopxQ1L1BuOY8iKhENPG0
         hUt3rZATXbPsFERewOcfBGUtj6yTyJgdP7wRs5is4XtrWIjujaXap7MJQbjc0O/DYWjV
         +yVIEDZ9rce6Mxz3P56HP/Otj0wMt7PO/FfzoB7NkxnsQagwLdG1xQFusyl52sz6b7SB
         SE9A==
X-Gm-Message-State: AOAM531WjdNQMRIu6pZrx5eBRj+wp3vFdvxtuH2vQpdSTY9/S6/BMYvX
	VaJO/WlH6tEOY/JkbgHsBKTJBzTJ
X-Google-Smtp-Source: ABdhPJxbpBlKuJ15FVDf45MQH7OyPQPm1m7eEWRcImZtJidgujF9SUNYpsdrN6XjLLnNKd99ySvMBQ==
X-Received: by 2002:a17:906:c943:: with SMTP id fw3mr15499994ejb.288.1590940453542;
        Sun, 31 May 2020 08:54:13 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:54:13 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 52/70] automake: 1.16.1 -> 1.16.2
Date: Sun, 31 May 2020 17:52:36 +0200
Message-Id: <20200531155254.10283-52-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-in-shebangs-with-modern-use-warnings.patch | 18 +++++++++---------
 .../{automake_1.16.1.bb => automake_1.16.2.bb} |  4 ++--
 2 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/automake/{automake_1.16.1.bb => automake_1.16.2.bb} (89%)

diff --git a/meta/recipes-devtools/automake/automake/automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch b/meta/recipes-devtools/automake/automake/automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch
index 1592c02cb9..0e84c4bf86 100644
--- a/meta/recipes-devtools/automake/automake/automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch
+++ b/meta/recipes-devtools/automake/automake/automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch
@@ -1,4 +1,4 @@
-From 081385f4d4bba367afad3bff1fa034f5263305e6 Mon Sep 17 00:00:00 2001
+From 857c843d4bcf576467b505eb05a47f3e7d32caaa Mon Sep 17 00:00:00 2001
 From: Serhii Popovych <spopovyc@cisco.com>
 Date: Wed, 10 Feb 2016 17:07:32 +0000
 Subject: [PATCH] perl: Replace -w option in shebangs with modern "use
@@ -23,16 +23,16 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  2 files changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/bin/aclocal.in b/bin/aclocal.in
-index b3715d9..461d453 100644
+index 9a20325..bd185d4 100644
 --- a/bin/aclocal.in
 +++ b/bin/aclocal.in
 @@ -1,4 +1,4 @@
 -#!@PERL@ -w
 +#!@PERL@
- # -*- perl -*-
+ # aclocal - create aclocal.m4 by scanning configure.ac      -*- perl -*-
  # @configure_input@
- 
-@@ -32,6 +32,7 @@ BEGIN
+ # Copyright (C) 1996-2020 Free Software Foundation, Inc.
+@@ -26,6 +26,7 @@ BEGIN
  }
  
  use strict;
@@ -41,16 +41,16 @@ index b3715d9..461d453 100644
  use Automake::Config;
  use Automake::General;
 diff --git a/bin/automake.in b/bin/automake.in
-index 8377d20..3a66965 100644
+index 5ed404a..d387b8e 100644
 --- a/bin/automake.in
 +++ b/bin/automake.in
 @@ -1,4 +1,4 @@
 -#!@PERL@ -w
 +#!@PERL@
- # -*- perl -*-
+ # automake - create Makefile.in from Makefile.am            -*- perl -*-
  # @configure_input@
- 
-@@ -28,6 +28,7 @@ eval 'case $# in 0) exec @PERL@ -S "$0";; *) exec @PERL@ -S "$0" "$@";; esac'
+ # Copyright (C) 1994-2020 Free Software Foundation, Inc.
+@@ -23,6 +23,7 @@
  package Automake;
  
  use strict;
diff --git a/meta/recipes-devtools/automake/automake_1.16.1.bb b/meta/recipes-devtools/automake/automake_1.16.2.bb
similarity index 89%
rename from meta/recipes-devtools/automake/automake_1.16.1.bb
rename to meta/recipes-devtools/automake/automake_1.16.2.bb
index d82eed3c60..fd8ed0ed3b 100644
--- a/meta/recipes-devtools/automake/automake_1.16.1.bb
+++ b/meta/recipes-devtools/automake/automake_1.16.2.bb
@@ -28,8 +28,8 @@ SRC_URI += "file://python-libdir.patch \
             file://0001-build-fix-race-in-parallel-builds.patch \
             "
 
-SRC_URI[md5sum] = "83cc2463a4080efd46a72ba2c9f6b8f5"
-SRC_URI[sha256sum] = "608a97523f97db32f1f5d5615c98ca69326ced2054c9f82e65bade7fc4c9dea8"
+SRC_URI[md5sum] = "f1a14f2ab2b0fb861a011e1d94e589e0"
+SRC_URI[sha256sum] = "b2f361094b410b4acbf4efba7337bdb786335ca09eb2518635a09fb7319ca5c1"
 
 PERL = "${USRBINPATH}/perl"
 PERL_class-native = "${USRBINPATH}/env perl"
-- 
2.26.2

