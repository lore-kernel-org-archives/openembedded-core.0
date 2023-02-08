Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DCC5C64EC7
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:21:54 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.3127.1675840911151617160
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:21:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jWfaxJIx;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id k8-20020a05600c1c8800b003dc57ea0dfeso757640wms.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3c7fggXNIvXj74WMoT2nCmGAvvyR0rZaA/pJJVtNZ6A=;
        b=jWfaxJIxpNW/NAFz24SllFTLt+YK/UYXFCRXjHAdOk1A2+FOL2pSi3x01VXcPGI8Cr
         ysnAxpqmv0wSalFIr6E/rxUc0dUKEampIH2AevaT1KKl/LIOgY6QRc2Szgf7y7nXHdJB
         X64m5WIrGr12MmeY0AsOy3fO3GurWGdK340CVNs1+/gPgdQcXDKmbCv/n9dlrTD5MdQw
         SfpLMx0toNezqDup/89l9fOBpJVUofun5Ut09Zjjf6/gkpIUvsKd8WhO5gzc+8jNcscA
         5IN0f88BtGHwuB6hCAeaxkKkkQoapN/FUH4G8Tq9wrRcuELNLTNt02jhOYe/q8tLqDR/
         Uj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3c7fggXNIvXj74WMoT2nCmGAvvyR0rZaA/pJJVtNZ6A=;
        b=Aswp/N7R+1pUg4Wvxyk0nABEZgsqyQkhIyGmfR+roTeysHN+bEIwPgotjV3RyhYWi3
         tLqTeeh0YQYWbaPCG7nQbdb4/lqHDf8fVcbgRIddZvOjIj/c9wftFC6BYgHXMO3q6QzR
         woTzo9b8I9wqNSVXKE7+YGgOZ4JcrhBVrb8phSDfVckZ7bPQHUAEQPx/6hwJ72Or3zD4
         5J42MNxb3YPHMVCS1qzvrjZ2nqHh3gm/H7ydg5AByxKmSTm/iEyd0cHEGbOuxj5v21Bv
         pxOHwKYRB3ySMc8ui+hqJmKK5Jl1cAu5nQ8seXR8nO3pskjbLvSgyMGh0QzM4DyWcS7A
         4RbA==
X-Gm-Message-State: AO0yUKWeUqNSijhD0pWdL4s/1k58eKi3hC47KDEU1CGZTRC8B+hXKVH8
	vHq9qdxmnVBzD1vOHdM6oRY3+HTNxro=
X-Google-Smtp-Source: AK7set9snx0pKERS8TEtoergNyPFKtizpCLP3+ECO6hIoV4VOQcQPhVyuttfnmW6t/RlCN2gUPL5vw==
X-Received: by 2002:a05:600c:3089:b0:3e0:270f:dc88 with SMTP id g9-20020a05600c308900b003e0270fdc88mr4041585wmn.33.1675840909697;
        Tue, 07 Feb 2023 23:21:49 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:21:49 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/52] mc: update 4.8.28 -> 4.8.29
Date: Wed,  8 Feb 2023 08:20:55 +0100
Message-Id: <20230208072143.2930292-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176844

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-mc-replace-perl-w-with-use-warnings.patch | 18 ++++++++----------
 meta/recipes-extended/mc/files/nomandate.patch |  6 +++---
 .../mc/{mc_4.8.28.bb => mc_4.8.29.bb}          |  2 +-
 3 files changed, 12 insertions(+), 14 deletions(-)
 rename meta/recipes-extended/mc/{mc_4.8.28.bb => mc_4.8.29.bb} (97%)

diff --git a/meta/recipes-extended/mc/files/0001-mc-replace-perl-w-with-use-warnings.patch b/meta/recipes-extended/mc/files/0001-mc-replace-perl-w-with-use-warnings.patch
index 012a499684..5ede82d342 100644
--- a/meta/recipes-extended/mc/files/0001-mc-replace-perl-w-with-use-warnings.patch
+++ b/meta/recipes-extended/mc/files/0001-mc-replace-perl-w-with-use-warnings.patch
@@ -1,4 +1,4 @@
-From cdc7c278212ae836eecb4cc9d42c29443cc128a0 Mon Sep 17 00:00:00 2001
+From 62c86b69106d0d702167ba1b963ea1c201cce5af Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Thu, 6 Apr 2017 02:24:28 -0700
 Subject: [PATCH] mc: replace "perl -w" with "use warnings"
@@ -20,6 +20,7 @@ The man2hlp.in already has "use warnings;", so just remove '-w' is OK.
 Upstream-Status: Submitted [https://github.com/MidnightCommander/mc/pull/174]
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
 ---
  src/man2hlp/man2hlp.in           | 2 +-
  src/vfs/extfs/helpers/a+.in      | 4 +++-
@@ -30,12 +31,12 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  6 files changed, 13 insertions(+), 6 deletions(-)
 
 diff --git a/src/man2hlp/man2hlp.in b/src/man2hlp/man2hlp.in
-index f095830..558a674 100644
+index 08765d8..8aa7131 100644
 --- a/src/man2hlp/man2hlp.in
 +++ b/src/man2hlp/man2hlp.in
 @@ -1,4 +1,4 @@
--#! @PERL@ -w
-+#! @PERL@
+-#! @PERL_FOR_BUILD@ -w
++#! @PERL_FOR_BUILD@
  #
  #  Man page to help file converter
  #  Copyright (C) 1994, 1995, 1998, 2000, 2001, 2002, 2003, 2004, 2005,
@@ -59,7 +60,7 @@ index 579441c..fe446f4 100644
      $_ = shift(@_);
      s/([^\w\/.+-])/\\$1/g;
 diff --git a/src/vfs/extfs/helpers/mailfs.in b/src/vfs/extfs/helpers/mailfs.in
-index e9455be..059f41f 100644
+index 4bdd68b..5bb373b 100644
 --- a/src/vfs/extfs/helpers/mailfs.in
 +++ b/src/vfs/extfs/helpers/mailfs.in
 @@ -1,6 +1,7 @@
@@ -72,7 +73,7 @@ index e9455be..059f41f 100644
  # MC extfs for (possibly compressed) Berkeley style mailbox files
  # Peter Daum <gator@cs.tu-berlin.de> (Jan 1998, mc-4.1.24)
 diff --git a/src/vfs/extfs/helpers/patchfs.in b/src/vfs/extfs/helpers/patchfs.in
-index ef407de..3ad4b53 100644
+index c20cd54..1f1e75b 100644
 --- a/src/vfs/extfs/helpers/patchfs.in
 +++ b/src/vfs/extfs/helpers/patchfs.in
 @@ -1,4 +1,4 @@
@@ -107,7 +108,7 @@ index 418611f..82c7ccf 100644
               'apr' => '04', 'may' => '05', 'jun' => '06',
               'jul' => '07', 'aug' => '08', 'sep' => '09',
 diff --git a/src/vfs/extfs/helpers/uzip.in b/src/vfs/extfs/helpers/uzip.in
-index b1c4f90..c8eb335 100644
+index c468f3a..ceffb53 100644
 --- a/src/vfs/extfs/helpers/uzip.in
 +++ b/src/vfs/extfs/helpers/uzip.in
 @@ -1,4 +1,4 @@
@@ -124,6 +125,3 @@ index b1c4f90..c8eb335 100644
  
  #
  # Configuration options
--- 
-2.10.2
-
diff --git a/meta/recipes-extended/mc/files/nomandate.patch b/meta/recipes-extended/mc/files/nomandate.patch
index c01d065b0e..4ebaaa2fa7 100644
--- a/meta/recipes-extended/mc/files/nomandate.patch
+++ b/meta/recipes-extended/mc/files/nomandate.patch
@@ -1,4 +1,4 @@
-From f02010965af21db018c4e108b2193c872406a314 Mon Sep 17 00:00:00 2001
+From 4482ed0b8bd506cc2590ceacfdada6cc34450796 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 4 Feb 2020 18:12:15 +0000
 Subject: [PATCH] mc: Fix manpage date indeterminism
@@ -21,7 +21,7 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/doc/man/date-of-man-include.am b/doc/man/date-of-man-include.am
-index 3a4e599..f11e9b3 100644
+index c6b1e69..165a796 100644
 --- a/doc/man/date-of-man-include.am
 +++ b/doc/man/date-of-man-include.am
 @@ -1,5 +1,5 @@
@@ -29,5 +29,5 @@ index 3a4e599..f11e9b3 100644
 -	-e "s/%DATE_OF_MAN_PAGE%/$${MAN_DATE}/g" \
 +	-e "s/%DATE_OF_MAN_PAGE%//g" \
  	-e "s/%MAN_VERSION%/@MAN_VERSION@/g" \
- 	-e "s{%prefix%{@prefix@{g" \
  	-e "s{%sysconfdir%{@sysconfdir@{g" \
+ 	-e "s{%libexecdir%{@libexecdir@{g" \
diff --git a/meta/recipes-extended/mc/mc_4.8.28.bb b/meta/recipes-extended/mc/mc_4.8.29.bb
similarity index 97%
rename from meta/recipes-extended/mc/mc_4.8.28.bb
rename to meta/recipes-extended/mc/mc_4.8.29.bb
index 9a950a8cd0..c9db172183 100644
--- a/meta/recipes-extended/mc/mc_4.8.28.bb
+++ b/meta/recipes-extended/mc/mc_4.8.29.bb
@@ -12,7 +12,7 @@ SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://0001-mc-replace-perl-w-with-use-warnings.patch \
            file://nomandate.patch \
            "
-SRC_URI[sha256sum] = "6bb47533d7a55bb21e46292d2f94786c9037bd7a70bf02b6a3c48adb0c9ce20c"
+SRC_URI[sha256sum] = "ba6b2d8752806ac23fe045c1b081eb66dcefa6159205c79f86c005dcaf9941c1"
 
 # remove at next version upgrade or when output changes
 HASHEQUIV_HASH_VERSION .= ".2"
-- 
2.30.2


