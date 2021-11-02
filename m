Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82628C4167E
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 08:43:27 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.6553.1635842606063188870
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LhdpsrSv;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id d5so16721288wrc.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=32CnIos/PuTdduAWY6PFReM4v5sGOWLFLCsg089vEvw=;
        b=LhdpsrSvsTh03vnOHn37Jr1qVJFta5g3o6zEV58ZorKXJLEh18aDFxfrG9AbYaE/NM
         jPPeMleyGcxuqhoMBjRSYc3xva1yzvmMPWteeA0oIO0Z/z3aMC9G6pAAtteToSgOKWde
         xoMDktMn7GWfzHsAmxpJFZGC6XNBOEIoQJAjnMoYM3OSe8p7IV1jx7WWZFpBciIRdID9
         tLzOfCWvCRHMzHdwbWk+A8NxwA19kMUuNNb6ktB16PDH3vSRxoW0JsJbM+HlLuifRv7R
         BaikxuCXB3/KfJhrXFJht0VQP6+u034Nr6Jt7LMhJCVXtR+Kp4NsXjtKiGCMhptVly5l
         cAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=32CnIos/PuTdduAWY6PFReM4v5sGOWLFLCsg089vEvw=;
        b=hfGHhpjB7xvbcgNDL4hdBtEvAc/MmcBL81S0EtsPw5TP1/bIT6jfoPsqcRCLnDzXL6
         P08PHTNgOpIT5TOmfWKdKP4BEW0ptRK24r/9q1uHFFLb5AcmXjJpB6KQSaS9+amcqc5W
         LJU6re5jrKfOz6m7sw9H46LqBGa+muiYv07gulmdaysJ5MCrN5GBk3qXtBpJWPcx7alW
         7S/DK6u0TPgwUD7HqCClPgk26W/2h7BwUsCXlbSNi4Rl+AWTfauuxxLQVytS7VW5As+K
         lILW6PXXLJcxxkWBU4hN651mUpPZBT0icJVIq3Qg0QaJ6oyLdusKXuTJhBsQj28et6MD
         YEHA==
X-Gm-Message-State: AOAM531OA3KK6+YOtcnUNjr2W7KZDWMxMKvPhq5bBeNL+9Bzzh1tuFvE
	4EoTwYNwJQdO+kKD4Vv3j81597EuDBw=
X-Google-Smtp-Source: 
 ABdhPJxcMnTGg4MY+eLCPdmiXPUvwOxTR4Jh3ZRetvBvAe9Mp8Yn7Ns17eH7t8S2LyAk6mf9qSXmPA==
X-Received: by 2002:a05:6000:1449:: with SMTP id
 v9mr45982534wrx.137.1635842604704;
        Tue, 02 Nov 2021 01:43:24 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 v191sm1761890wme.36.2021.11.02.01.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 01:43:24 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 30/33] cracklib: patches submitted upstream
Date: Tue,  2 Nov 2021 09:43:00 +0100
Message-Id: <20211102084303.2974802-30-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211102084303.2974802-1-alex@linutronix.de>
References: <20211102084303.2974802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 08:43:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157768

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...0001-packlib.c-support-dictionary-byte-order-dependent.patch | 2 +-
 .../cracklib/0002-craklib-fix-testnum-and-teststr-failed.patch  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch b/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
index 082933e471..8fb512a224 100644
--- a/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
+++ b/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
@@ -9,7 +9,7 @@ Create the dict files in big endian, and convert to host endian while
 load them. This could fix the endian issue on multiple platform.
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/cracklib/cracklib/pull/41]
 
 We can't use the endian.h, htobe* and be*toh functions because they are
 not available on older versions of glibc, such as that found in RHEL
diff --git a/meta/recipes-extended/cracklib/cracklib/0002-craklib-fix-testnum-and-teststr-failed.patch b/meta/recipes-extended/cracklib/cracklib/0002-craklib-fix-testnum-and-teststr-failed.patch
index 27a4fcbec2..1ee97357d0 100644
--- a/meta/recipes-extended/cracklib/cracklib/0002-craklib-fix-testnum-and-teststr-failed.patch
+++ b/meta/recipes-extended/cracklib/cracklib/0002-craklib-fix-testnum-and-teststr-failed.patch
@@ -16,7 +16,7 @@ PWOpen: No such file or directory
 Set DEFAULT_CRACKLIB_DICT as the path of  PWOpen
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/cracklib/cracklib/pull/42]
 ---
  util/testnum.c | 2 +-
  util/teststr.c | 2 +-
-- 
2.20.1


