Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F60C36010
	for <webhook@archiver.kernel.org>; Sat,  5 Apr 2025 04:56:11 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.1037.1743828968633043811
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 21:56:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EJU8BVeP;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22435603572so26219285ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 21:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743828968; x=1744433768; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6UZIgFXC0blEY0LAWCopHJlkHGlAxPvm5j4Hvo+r71Y=;
        b=EJU8BVePwLgs49mEwaeicUqvVjq/B+vQ8T3uUX/5wZUSVAo9fh6XrPMYo8fIXwb3kj
         x1lle6wDqo2j+kQB0knQIA+aXJAlS0p5gACP3sc2ZdO1wM5O3WHcqKqEIlDCi4T9n0Fr
         BjHf+VV+9ez1cQ865YM/hpUhGWMRtDP/5yj6ZJgFIzIVGA2Yc/X3/y16svRRLANDyazq
         VRjGeCpesGPg+1aN5U/7T9QSa0/zxRfKfyWBI61e2cWMKltUMVcTaUeHz+9qt4iej7EM
         9fholi9zzGqLBl3Pivb0W5/ElUMUUum1H8Li3xYAxSv+DhdxJXlc+7RJeJynfinoPim0
         4iKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743828968; x=1744433768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6UZIgFXC0blEY0LAWCopHJlkHGlAxPvm5j4Hvo+r71Y=;
        b=wJCwpRFkJwaUOSeS2iQAXD84nnge/aqlXsXYnxj+97r6dnvvf7xHtufyengJutRo88
         PRuOdBZUMvHdGYVlA1ImY4bhpmYNKiYSAum16c4pHO6KtptwtinbAWZUNnIGhzHWkAGV
         TGIPabSO01PqffFsRDfGRmyn4lX0UVvIwA9wnj8T6PTYwfm/sLlroQqs2HidbVPW4ZPL
         04tpssSpexYm27tZDzUaO/wiBgOGbrZoDcanEgJeAZnqCXR4Og9adGIdR4yLHHFLFESo
         RNV5FcgeG+wd683Ux+axKYo4g54dKQGoyLsJicJVpQ47nl+02N/vyFFxRhn2BEyyDeWQ
         /Yvg==
X-Forwarded-Encrypted: i=1; AJvYcCXyQ5+e2SDknhNglYwXnzDC1vFfvw5Qs3rWtOP4Wl/44g8KoK1c56TDO473iUsiIau6wlkOjJkpESlAas79g4IM2A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxKUGXI5cT5UYFehvER1FTHctjBgI3DW/YpTGlzZTb4RrGDdFiE
	DVyUcW6KNdF6tDVi91/3FtysXNapz1ir3efS9jG96brU6zjqr1Pi
X-Gm-Gg: ASbGncs5UWPVjF83b77cg3xHk/1b01APVr6989pc3VibizOn6mvbZk7esriPQwJku31
	Xeb295GvtSMQLKZYD3aetqUXWdZh73j8p3DfwWZqcS1q1ar5/u+/Ewtpjalt46Tw/Fd5VzEtN8g
	I1hldpDtf5GrnJ925Ia83uEY5Uz5EHfQF0X7hkmFALLFZZ0fXnQT/NzKrACOpuXo6Om9sD7YoKE
	hynv633bWwVKbuixGGPLlunqd6DHVT76GwsZGIX5vH/tQ5wb90mXrUeAoCXimYq9xnQ0ZyEj7WB
	D5PvTfjkVBLRkjdVge3eY4DwZWsYXMrm2E2enMPFcCKkgcM0E25vLRn3zHuD0o7K80/TyvPD/g6
	B3Yr9TooYOp8jzdbtszrCOwrRns3tIddx
X-Google-Smtp-Source: AGHT+IHQELulE5r7laVngNFRNirOA+jg0TCR9fmAaCfDrAV9ANXzLk8g0+kU5el/A7S778xURE5UmA==
X-Received: by 2002:a17:903:1c2:b0:21a:8300:b9d5 with SMTP id d9443c01a7336-22a8a8721damr60563795ad.23.1743828967834;
        Fri, 04 Apr 2025 21:56:07 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:ec3d:c567:e156:a268? ([2601:646:8201:fd20:ec3d:c567:e156:a268])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229787776f8sm41367555ad.256.2025.04.04.21.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 21:56:07 -0700 (PDT)
Message-ID: <4890d1ff-3bdf-40e3-80d0-834339b2b8b0@gmail.com>
Date: Fri, 4 Apr 2025 21:56:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [poky] systemd-systemctl-native broken after update to walnascar
 #poky #yocto
To: jan.kircher@leica-microsystems.com, poky@lists.yoctoproject.org,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <1HoH.1743770357950104311.rsrM@lists.yoctoproject.org>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1HoH.1743770357950104311.rsrM@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Apr 2025 04:56:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214372

On 4/4/25 5:39 AM, Jan Kircher via lists.yoctoproject.org wrote:
> Hi,
> 
> when we upgrade poky to walnascar, our builds fail due to systemd-systemctl-native (please find the log attached).
> 
> As a workaround we disabled Werror-nonnull with a simple .bbappend:
> BUILD_CFLAGS += "-Wno-error=nonnull"
> 
> We managed to narrow down the issue to our use of DEBUG_BUILD=1 in local.conf. Images can be built again when we remove it. However, we struggle to solve this issue on our own. Is it possible for anyone to reproduce this issue? Adding DEBUG_BUILD=1 to local.conf should be enough, then bitbake systemd-systemctl-native should fail.
> 

I think you have uncovered a systemd bug, I have sent a possible fix 
upstream, please test it in your scenario and see if it work.

https://github.com/systemd/systemd/pull/37017

I observed few things while looking at your build logs. The failing file 
is compiled with -O0 by default but when we do a DEBUG_BUILD = "1" it 
appends -Og -g to compiler flags, -Og != O0 so we are kind of overriding 
upstream's behavior and thusly it may find problems like this, bigger 
issue is it is untested path.

Secondly, you observed this problem when compiling a native package, I 
wonder if there is value in extending DEBUG_BUILD to non-target packages 
at all unless we want to debug native/nativesdk/cross packages which 
often is not the case. So maybe we should limit the scope of DEBUG_BUILD 
to just target packages.

> Greetings,
> Jan
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#13587): https://lists.yoctoproject.org/g/poky/message/13587
> Mute This Topic: https://lists.yoctoproject.org/mt/112083239/1997914
> Mute #poky:https://lists.yoctoproject.org/g/poky/mutehashtag/poky
> Mute #yocto:https://lists.yoctoproject.org/g/poky/mutehashtag/yocto
> Group Owner: poky+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/poky/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
-Khem

