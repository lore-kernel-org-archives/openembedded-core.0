Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.35667.1607958568966997921
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 07:09:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O8x8aMA9;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id u21so12005238qtw.11
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 07:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=piWuYR7Qbnpbxry7By1oxP2ICmYwo4sYuEOY5elmfzg=;
        b=O8x8aMA9BzkuwKTVF9rdtVHLgrCHPa/ePvf7NDn5MYC5sXuCvqRMebvOvpwQETjgoR
         i5HhkfsEwxqw7s2geqje2zNzMUyY1BOAz/qvtAWc4YHccLU/IHYglvQD4R/+DnN9Ns1n
         BZQmPN6/srRHgg8La+uDoURJqYCiFYkcGDd0Sg80x485MTkwUGAnPGmuVCXyoRDPXYp2
         Knw/ptkPnK+Ldm3iZJ8gl6un+7I1WMZGT98DZsZOixptU5pcEIKXB3Fc3pqT4jnMzeh1
         CzvxHyp9NNwq3KnGd1DTcKgq9kFbb2nkcHesfafe2SduhfgSdkX0spWPGmjDQPoo2WEH
         mbyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=piWuYR7Qbnpbxry7By1oxP2ICmYwo4sYuEOY5elmfzg=;
        b=qBLLAwWQTQNVIxCUPkx3kuOD41ipoZx1bhJyv6UqkXPLtjOyYFRm/63ciuYlfMB2pt
         Jh8BI860IkCWt772gSQWJO7EUsEHzcPwV3Z5munlR6oF9S8j9fPWx4/l9iqJxVanJQmY
         Hl4c2XEHhFgEGXfMW3VJAuVUQiCgb35jJYdld4Wxnq0u5WFIqDRJqWEQVl2eSz5pOi0r
         MMrSZyVA1COTGdQ8esyg9ZTw04P0ld923nRF6FutMr5krnQ0VY9hONb1wMDESf3emYqr
         i2X/q0uiegmzYLemxd1jRL+tkT06WN/MpyEquIRl407MAe3SD7CNT4QFnuXiJuaPy1nV
         6lXQ==
X-Gm-Message-State: AOAM532LYIM4MtHMiPgpnz0H5r7siv82O5I/5pIZ5DW59/VSLdLDPPRz
	o9R2eEpFxtYk/qLHW0+YiFU=
X-Google-Smtp-Source: ABdhPJw0rPqvMZyr6vfiUoeHYgqjUw2miBC9GyntpVNhZ52la9W4c+wFdMyVkXdsPCxHktNPyFTIMQ==
X-Received: by 2002:ac8:7654:: with SMTP id i20mr29705102qtr.291.1607958568142;
        Mon, 14 Dec 2020 07:09:28 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id a194sm13565070qkc.70.2020.12.14.07.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 07:09:27 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] linux-yocto-rt/5.4: update to -rt44
Date: Mon, 14 Dec 2020 10:09:17 -0500
Message-Id: <9965299ccb54e019a6af41d7528f6e084959affe.1607958349.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1607958349.git.bruce.ashfield@gmail.com>
References: <cover.1607958349.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s):

    375e7ee20260 Linux 5.4.78-rt44
    c948a34d2755 Linux 5.4.77-rt43
    8189406f8f2b Linux 5.4.74-rt42
    0856261877e2 timers: Don't block on ->expiry_lock for TIMER_IRQSAFE
    416edb155e5d ptrace: fix ptrace_unfreeze_traced() race with rt-lock
    6bd85935ab11 mm/memcontrol: Disable preemption in __mod_memcg_lruvec_state()
    57ada856a2a8 net: Properly annotate the try-lock for the seqlock
    1c80ecf69d2d Linux 5.4.74-rt41
    d4318c110dc6 Linux 5.4.70-rt40
    bdfc6168388d Linux 5.4.69-rt39
    b6e0ef250594 Linux 5.4.66-rt38
    151876f794fc Linux 5.4.61-rt37
    4bdac3f47b53 Linux 5.4.59-rt36
    cf9b41798238 Linux 5.4.58-rt35
    631b98ae597b Linux 5.4.55-rt34
    77d701a69ebb Linux 5.4.54-rt33
    130cf1b82691 rwsem: Provide down_read_non_owner() and up_read_non_owner() for -RT
    6ab4141069fc net: phy: fixed_phy: Remove unused seqcount
    291d163db65a Bluetooth: Acquire sk_lock.slock without disabling interrupts
    4c9f5d78fed4 workqueue: Sync with upstream

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 104ada2db5..893388ac6b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "97576fb7447efba82eb025bde3ae9ceb29939d5e"
+SRCREV_machine ?= "375e7ee20260d4448761605ae55b5cc50e38d516"
 SRCREV_meta ?= "d626f9108d590d41e82b97cbffc380aa699e86e1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-- 
2.19.1

