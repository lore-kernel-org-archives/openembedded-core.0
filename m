Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85125C4167B
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 08:43:28 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web09.6597.1635842607231063337
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fjlffgBE;
 spf=pass (domain: gmail.com, ip: 209.85.128.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id b71so3491009wmd.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9MOe/onvPWVN30oS8BABbTuBGJbQbwBqGYhhpdLRDIs=;
        b=fjlffgBEJuPN3+6NmC/7EyCi0Zion8TY4Q7GEaD9Jifh/FtiM7Y3JlkPGxuxNYL9dq
         2yKidvzZf4DWZ7pJFa2uMFDz34Jh6bHmZLf+YgNYYkxKvosHglStEeGEu1pzmZ/1kRNd
         fidyLFNxSKDpYn/EnKYYcdUzktwnfzjdeeeVcuFuy4jHHFWEapPatMN0tLUzptbWXn0t
         TwOKk1QX83rE+EG7WBtNAuBtPuW+r2ULxM5Kjeskr6wt4GeDQH9GwKHhp/rf6RfjNpBB
         a3tLyiyY4vr75dyf+WDp+oMdu+hrylWE+kS2yaOfOJ7WYrcLf4nln/MVbp+Fr2ZG3AYw
         C90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9MOe/onvPWVN30oS8BABbTuBGJbQbwBqGYhhpdLRDIs=;
        b=FjDA6ULms9ZZvUcjxbmTuLff5F1iLi+Yu9PlDRZLmSQIvwz9hlHjo8YXZFGU2lVITU
         PRYZtqHD1ySQ49ZiGQqdRV644iKYf0t0Yb+gIEXv5VuWi4Zub4OtG/C7uCh6bFmF0iu5
         uTEIR7kvdiLxkjO05riTs0yBOgAjTCLyhIm40n/fmWNRb/g6WvV6T27wIm6ixEYBS1Kv
         FGb5FtgWQ1rbktQGjnIy6t9L93KamDLOmZtHnrWb9ZsfVzxdeaigOe8WUbYOObYgt670
         hFS5nFS6qTrn8AYy5SXJx/AVY77LtbtAVs1JdCCIDovsuyvd1J7dRycLVKzpA4is+cul
         Uo9A==
X-Gm-Message-State: AOAM533Gsg7zQo5ApoDuEZVigNw4SZzyGKN501lQMfAITs2lyquTKtD3
	4sqAZOzpFfdQobtkzjW77Yji9uWB+uo=
X-Google-Smtp-Source: 
 ABdhPJzUOTJOWz5mhRZ+hnt1U29WLyKAf0MenoNJxy2Viai+Wpfo2B5TtGJ8YY8cxVbxz6kCRySXtQ==
X-Received: by 2002:a1c:8:: with SMTP id 8mr5238773wma.106.1635842605901;
        Tue, 02 Nov 2021 01:43:25 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 v191sm1761890wme.36.2021.11.02.01.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 01:43:25 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 32/33] lrzsz: patch is not upstreamable
Date: Tue,  2 Nov 2021 09:43:02 +0100
Message-Id: <20211102084303.2974802-32-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211102084303.2974802-1-alex@linutronix.de>
References: <20211102084303.2974802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 08:43:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157770

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Fix-cross-compilation-using-autoconf-detected-AR.patch | 2 +-
 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/autotools-update.patch     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0001-Fix-cross-compilation-using-autoconf-detected-AR.patch b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0001-Fix-cross-compilation-using-autoconf-detected-AR.patch
index 47c7ec4170..c8f0e2c4fe 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0001-Fix-cross-compilation-using-autoconf-detected-AR.patch
+++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0001-Fix-cross-compilation-using-autoconf-detected-AR.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Fix cross compilation using autoconf detected AR
 currently its using 'ar' program from build host, which is not expected,
 we need to respect AR passed in environment
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [upstream hasn't been active since 1998]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/autotools-update.patch b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/autotools-update.patch
index 33af38b4a8..ebd4a88081 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/autotools-update.patch
+++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/autotools-update.patch
@@ -1,6 +1,6 @@
 Update autotools infrastructure (including gettext) to modern versions.
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [upstream hasn't been active since 1998]
 Signed-off-by: Phil Blundell <pb@pbcl.net>
 
 diff -uprN clean/lrzsz-0.12.20/configure.in lrzsz-0.12.20/configure.in
-- 
2.20.1


