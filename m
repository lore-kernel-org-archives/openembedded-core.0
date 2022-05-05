Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D92C4321E
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:33 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.7357.1651727160845892830
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lGWXBnoU;
 spf=pass (domain: gmail.com, ip: 209.85.218.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id j6so6517393ejc.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zAoQjec6qruG1p2Vk7NkBhJD3DoLlG5fIamSNnEx8HQ=;
        b=lGWXBnoUmKKRUrg8oV0lcOaczUM4phvhn6a732oWqrvcHSgAum1OykkJe1nETtF/6V
         MWZv6rDXBQttsgK4iBXXxIIEJrlQ40e1huP4BNjlBUOetClqntYSjmoyy9N50D22Cw/3
         vHm25U8lbxx1dkbDAJB7cRgu6nw6JgUrsS4HFUgtdYdII3juRZExjDbOLh2SZFWJHF3q
         AVKQVi2sO0yrbkcyooEhQrF9bzNCS9J9jS+JzaX30NLr7XZL3f2rQ5HX08IHRVGzBRVD
         qDZJooLOefE27E/lwB06c7gILVclH6pJ9MOsCYp7zkqVoD4xzHS/WOyb7/834wGXj9mE
         //Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zAoQjec6qruG1p2Vk7NkBhJD3DoLlG5fIamSNnEx8HQ=;
        b=IrihhRY16Egm2136JmAvUYGPsAWHFJSm/vwujtZHlhsRbMW2bootFCblSYpWZqi83n
         Vph9URjOdnFJVou8+ppph0663vXBzMexl8EMNocSrRyMyDELQX207x68Q/JECNVFb/RF
         jvI/tSQVPE9ts3j5zIRUwe7m5EhRUzpmw/aeKiNrO7BDWAsfOngqiHrHFqukzxLPd5l1
         d//GT2r1tRKZtJPzPpXdc76QC5v5/Sdt133GcXZk7UetfYXk4EjNteKLtkZtMHnBOW6G
         SllwIE4m3rgPjGsQJrArjFR9ZPGXoQGizWVtfSDBUuM1eSLHyCgaGIKxCZYcwJGCy+vB
         8chw==
X-Gm-Message-State: AOAM5308KaWnp2bu6OgOKU6IeaCE37iewlL1xGuqL9z8jpy+pq6alc2n
	4Yixs6uSrpAa4so7UWAwgJycQ070tm0=
X-Google-Smtp-Source: 
 ABdhPJxRGmEnwcqkflxqnS18rnjq+oebggPG5OSUIxPTq61do1Q/PHzA8aJXfPZ0uTaC85IfeToJVw==
X-Received: by 2002:a17:906:c14c:b0:6f4:fdf3:4a3a with SMTP id
 dp12-20020a170906c14c00b006f4fdf34a3amr20073ejc.525.1651727188998;
        Wed, 04 May 2022 22:06:28 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:28 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 52/61] git: update 2.35.3 -> 2.36.0
Date: Thu,  5 May 2022 07:05:35 +0200
Message-Id: <20220505050544.651895-52-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165281

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...k.uname-do-not-force-RHEL-7-specific-build-.patch | 12 ++++++------
 .../git/{git_2.35.3.bb => git_2.36.0.bb}             |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/git/{git_2.35.3.bb => git_2.36.0.bb} (98%)

diff --git a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
index e0f702f327..d80d082ba3 100644
--- a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
+++ b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
@@ -1,4 +1,4 @@
-From 3b2505435bc6f982226eff84bad6bf9a36381573 Mon Sep 17 00:00:00 2001
+From c0c5241abdc113acbe6bcd960686cea414bce357 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 7 Feb 2022 10:13:15 +0100
 Subject: [PATCH] config.mak.uname: do not force RHEL-7 specific build settings
@@ -8,22 +8,22 @@ different flags than git builds on other host distros.
 
 Upstream-Status: Inappropriate [upstream needs to check compiler and component versions properly]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
 ---
- config.mak.uname | 5 -----
- 1 file changed, 5 deletions(-)
+ config.mak.uname | 4 ----
+ 1 file changed, 4 deletions(-)
 
 diff --git a/config.mak.uname b/config.mak.uname
-index c48db45..9b3e9bf 100644
+index 259d151..136ae3b 100644
 --- a/config.mak.uname
 +++ b/config.mak.uname
-@@ -63,11 +63,6 @@ ifeq ($(uname_S),Linux)
+@@ -64,10 +64,6 @@ ifeq ($(uname_S),Linux)
  	PROCFS_EXECUTABLE_PATH = /proc/self/exe
  	HAVE_PLATFORM_PROCINFO = YesPlease
  	COMPAT_OBJS += compat/linux/procinfo.o
 -	# centos7/rhel7 provides gcc 4.8.5 and zlib 1.2.7.
 -	ifneq ($(findstring .el7.,$(uname_R)),)
 -		BASIC_CFLAGS += -std=c99
--		NO_UNCOMPRESS2 = YesPlease
 -	endif
  endif
  ifeq ($(uname_S),GNU/kFreeBSD)
diff --git a/meta/recipes-devtools/git/git_2.35.3.bb b/meta/recipes-devtools/git/git_2.36.0.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.35.3.bb
rename to meta/recipes-devtools/git/git_2.36.0.bb
index 68981d4fde..0d7d56303c 100644
--- a/meta/recipes-devtools/git/git_2.35.3.bb
+++ b/meta/recipes-devtools/git/git_2.36.0.bb
@@ -165,4 +165,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "cad708072d5c0b390c71651f5edb44143f00b357766973470bf9adebc0944c03"
+SRC_URI[tarball.sha256sum] = "9785f8c99daea037b8443d2f7397ac6aafbf8d5ff21fbfe2e5c0d443d126e211"
-- 
2.30.2


