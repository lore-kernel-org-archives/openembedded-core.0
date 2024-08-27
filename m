Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C36C5473F
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:24:09 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.71667.1724736243916037892
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:24:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f3PKYGYO;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a86acbaddb4so415433166b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736242; x=1725341042; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N07CiBOvy9O9QNtcbPVYCWAY1Fde6KjeItGP5LRMpes=;
        b=f3PKYGYORo0kvltjlIcVzcxTMNw281H59CfOQ+EWfnT2POu9dXCfy+/z/zqwVx2+PV
         BQOXVNC4okWVuVZ4ebr8k2F6xaIQ25a436O2u1lHQ4TYOiqvGpwTl/UpoTaGDqmNDNzn
         FCdAk7oegvCx1PGJHVYpNKra3tIZAIrW1X59iWTmL90L2LEVjnhD1wJm14qZ40pYurGP
         dYuBpI3R0bnIpDu+dJftAaEkalLfsTZf4C9S7Mv0V3qZ7JPcCf9y+ycF4fJlZwxbsGD4
         5dnbKwAaztDdR8VNu3HDnskPaN5lLbho08xqmtTSyHx6xfuSx8yC3uJCRmcFlqtUv3FU
         qBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736242; x=1725341042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N07CiBOvy9O9QNtcbPVYCWAY1Fde6KjeItGP5LRMpes=;
        b=NlLTFpz5PD8p1ZDP4Tdca/j/tyQ5C5nwy9/6Xt5fwES6Ozo0EFxp9wmUGUW0KyNzjq
         BMd0xWSWGm9q45b/HjsokLyNtIsQDZsIK6KFGvjJ4DpV4fSBQOJ84/AL3RiIrzJElNo8
         YcFMrcFEnIoyLlZQfLnvvQ0nb34nqWRMe3XV+/HShhCx/MxvuSxnXltlPqKwORXg7Tq+
         DUqBnccrLWHI8kkMyqbOQcWirQ8IWdjO4czHpVAiomAD0YjgZIXlC/yEcwVgANeeuz4b
         q8dJJsfsgREY8sRh2wmyxxI+gFC17KgAK/nnp4lX+vP/p+LF4dnPYWIID9qXYh12FuMI
         YlhQ==
X-Gm-Message-State: AOJu0YybYQB+SM3yQul8Q9YwjbNGhqN+MrJAP7X+UPTRJLJ9MELikvDc
	VWgnGDWjTLmjOSb6nYnJKEJiUXNp/TdHh3NVo2EaZI1O4sj9SJQgwkBNsg==
X-Google-Smtp-Source: AGHT+IFcAh/xAu6M09n3Y1S7IRnyNvBpDOvaswX8x4/faTk+e2l2CqzRseoS0gP4ffsAw23h6U99fQ==
X-Received: by 2002:a17:907:2da3:b0:a86:80ed:f2d8 with SMTP id a640c23a62f3a-a86e3be3c06mr117151566b.45.1724736242008;
        Mon, 26 Aug 2024 22:24:02 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e675aa07sm57704166b.17.2024.08.26.22.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:24:01 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/34] git: 2.45.2 -> 2.46.0
Date: Tue, 27 Aug 2024 07:23:28 +0200
Message-Id: <20240827052354.1319810-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827052354.1319810-1-alex.kanavin@gmail.com>
References: <20240827052354.1319810-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203784

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-do-not-force-RHEL-7-specific-build-.patch |  7 +++---
 meta/recipes-devtools/git/git/fixsort.patch   | 22 ++++++++++++-------
 .../git/{git_2.45.2.bb => git_2.46.0.bb}      |  2 +-
 3 files changed, 18 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/git/{git_2.45.2.bb => git_2.46.0.bb} (98%)

diff --git a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
index fc803c73c78..3f0bc4aaa1b 100644
--- a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
+++ b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
@@ -1,4 +1,4 @@
-From c0c5241abdc113acbe6bcd960686cea414bce357 Mon Sep 17 00:00:00 2001
+From be83596773e42b88ba1104f044a139f35d90a7f5 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 7 Feb 2022 10:13:15 +0100
 Subject: [PATCH] config.mak.uname: do not force RHEL-7 specific build settings
@@ -12,13 +12,12 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
 Rebased for 2.45.1.
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
 ---
  config.mak.uname | 4 ----
  1 file changed, 4 deletions(-)
 
 diff --git a/config.mak.uname b/config.mak.uname
-index a7607a5..251057e 100644
+index 85d6382..bdf06ca 100644
 --- a/config.mak.uname
 +++ b/config.mak.uname
 @@ -64,10 +64,6 @@ ifeq ($(uname_S),Linux)
@@ -29,6 +28,6 @@ index a7607a5..251057e 100644
 -        ifneq ($(findstring .el7.,$(uname_R)),)
 -		BASIC_CFLAGS += -std=c99
 -        endif
+ 	LINK_FUZZ_PROGRAMS = YesPlease
  endif
  ifeq ($(uname_S),GNU/kFreeBSD)
- 	HAVE_ALLOCA_H = YesPlease
diff --git a/meta/recipes-devtools/git/git/fixsort.patch b/meta/recipes-devtools/git/git/fixsort.patch
index 07a487e8ca6..d9a3672f1d6 100644
--- a/meta/recipes-devtools/git/git/fixsort.patch
+++ b/meta/recipes-devtools/git/git/fixsort.patch
@@ -1,13 +1,16 @@
-[PATCH] generate-configlist.sh: Fix determinism issue
+From 83ae059943d3efd824978a759bcfd894ce5085d4 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Wed, 17 Feb 2021 17:57:13 +0000
+Subject: [PATCH] [PATCH] generate-configlist.sh: Fix determinism issue
 
-Currently git binaries are not entirely reproducible, at least partly 
+Currently git binaries are not entirely reproducible, at least partly
 due to config-list.h differing in order depending on the system's
 locale settings. Under different locales, the entries:
 
 "sendemail.identity",
 "sendemail.<identity>.*",
 
-would differ in order for example and this leads to differences in 
+would differ in order for example and this leads to differences in
 the debug symbols for the binaries.
 
 This can be fixed by specifying the C locale for the sort in the
@@ -15,12 +18,15 @@ shell script generating the header.
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Upstream-Status: Submitted [https://public-inbox.org/git/f029a942dd3d50d85e60bd37d8e454524987842f.camel@linuxfoundation.org/T/#u]
+---
+ generate-configlist.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: git-2.30.0/generate-configlist.sh
-===================================================================
---- git-2.30.0.orig/generate-configlist.sh
-+++ git-2.30.0/generate-configlist.sh
-@@ -9,7 +9,7 @@ static const char *config_name_list[] =
+diff --git a/generate-configlist.sh b/generate-configlist.sh
+index 8692fe5..e67ccac 100755
+--- a/generate-configlist.sh
++++ b/generate-configlist.sh
+@@ -9,7 +9,7 @@ static const char *config_name_list[] = {
  EOF
  	grep -h '^[a-zA-Z].*\..*::$' Documentation/*config.txt Documentation/config/*.txt |
  	sed '/deprecated/d; s/::$//; s/,  */\n/g' |
diff --git a/meta/recipes-devtools/git/git_2.45.2.bb b/meta/recipes-devtools/git/git_2.46.0.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.45.2.bb
rename to meta/recipes-devtools/git/git_2.46.0.bb
index 6393c976e6a..7c6beb5b5cc 100644
--- a/meta/recipes-devtools/git/git_2.45.2.bb
+++ b/meta/recipes-devtools/git/git_2.46.0.bb
@@ -164,4 +164,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "98b26090ed667099a3691b93698d1e213e1ded73d36a2fde7e9125fce28ba234"
+SRC_URI[tarball.sha256sum] = "b138811e16838f669a2516e40f09d50500e1c7fc541b5ab50ce84b98585e5230"
-- 
2.39.2


