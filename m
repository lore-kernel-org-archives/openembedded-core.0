Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web09.4109.1609193771916193480
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 14:16:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=lkppSj1J;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id h10so6007384pfo.9
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 14:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Cn1GpzWsv0hQ4mglfBwwcKbtbkYPfEbA0kagoZgVAvs=;
        b=lkppSj1JlaT1KQh3DCww2Neq3MC+pUsQjsX7tnzQbzG2vTXXh7cH2KuWVS7sgoo3RQ
         qT/62yvElR8Kfn+IQiYljW9vhtAHr9i723/mnNtBE3gFO6GyM/2c5kcyd+GMt0bu86WO
         Mymv85g+8sABaej4Ju2u5VRaA1SS2Qy8z58vvFBfhuLYTkVPbATlgJtXb9iG2NeyqTEb
         oBEM4t6NozId3eicZ5CzjunX3yAPWr3Q/euHFf2BCV/ZB2SpNgHS9FNmLnsfJezZTMwA
         yrLrC1UKQk70ayGF3S0+obUaBv6yIsNy0o2W1pGKDggkSNuvbev73m0dWX0EfiCzA8sk
         U5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Cn1GpzWsv0hQ4mglfBwwcKbtbkYPfEbA0kagoZgVAvs=;
        b=c2NsfV42lC3Zqh0zJrzflx/lkDslYEboGTbpwCP0dcA6Q4bzpGOPHaHH3xrBeg37+9
         kqV/rBWWZNJ/ADVpM+vahKp+08hAkv2LohGDV7B0LKDUaH5R046Ik+qFX8KrzGjXKC1y
         HIrTVBq3f7sHzmNlgfb/MIHVL5Abi2Ss5z42pLkgo8OEOik3uuyi7dhSNOCaCNqDnXRW
         T8/03gU45f/H1/MdiVOzbREfh3XTJ6ObX7jvsJTNL+vGrTo2oaFqPYFAzrVqdeBUKEmo
         x16gHbzxSQ3Rrem+htgfwUyVosbGvb5S0evBY2AMHt4Wl0HC2QGE4Wjqn/8A8G5RE15O
         q+lQ==
X-Gm-Message-State: AOAM531b9HM+9NzIGneXqAxsdNALAZZpKX+gk0CB38EuoK2C86UE3Jxo
	jRIHjfCtQVyhDc6cRoPitwYJootErKSbTb75HYo=
X-Google-Smtp-Source: ABdhPJwO4mIe2XpVuPD9q67DNciGG7fVshTt+LCIllBGuoDqcqPwQd8almL8m2zaQacm4e/LT5xhlw==
X-Received: by 2002:a62:7651:0:b029:1a5:929b:1681 with SMTP id r78-20020a6276510000b02901a5929b1681mr41823624pfc.27.1609193770826;
        Mon, 28 Dec 2020 14:16:10 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o32sm41425455pgm.10.2020.12.28.14.16.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 14:16:09 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/17] linux-yocto-rt/5.4: update to -rt44
Date: Mon, 28 Dec 2020 12:15:38 -1000
Message-Id: <b6496ceb0adf771a0101b30a432193e09d93ca5d.1609193554.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609193554.git.steve@sakoman.com>
References: <cover.1609193554.git.steve@sakoman.com>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dfae903dd2538d57cc75e3b8b731515deb7f5526)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 42e864611f..d726603caf 100644
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
2.17.1

