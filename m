Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B94DC3ABBF
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 10:35:12 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.5285.1746614102644478590
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 03:35:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MfySiiTV;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso31285355e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 03:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746614101; x=1747218901; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OlvPGfUF8yrEk2Fv2mjuml+dyETnnCpLKsHirtkhXyo=;
        b=MfySiiTVm/GsYvVclZmODhun5m6Bq016Nxe3fjAUc0QdBhlsq7v1OINpRk2Qu1lxU3
         8vBg1gvytZz16LIQcXQh7wPxuGF3Bvkys2/8X/rDsQD9A6y/qND541fLJ/faM5/+UUlC
         PncxfwbkCaYOdDpn/1zlbeGeEHMtUkrRSBBS/W8AnO52Te9EfDx/KLMieKlckVGkbKMS
         F1rco0Y4TrcIO6rnoOnh1KP2tAGs5I6g5lRHBAjzHzOqkYZz/ezbbjE2L5Qfkp1lBiLd
         DsTz/h2Eyzr5tFOSuRo2gvSHQF/6lqtN6X6PCU5MexidNjSd94kWdB9xVzw2DjsOemea
         FrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746614101; x=1747218901;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OlvPGfUF8yrEk2Fv2mjuml+dyETnnCpLKsHirtkhXyo=;
        b=FwdBKTBprCTUrss9fJGgIC1CdWEj+rha16XKxVvLjWbcqiuRlAuZ0+kly7aWdc+M60
         7GmlRuCMpIiPUTsUwJHtSvutGVvFefik0eFp4G0OSBGn/Z7JTwMBJK/GeMlsI4avBq3i
         FhZrjAP3kjOxj3IWEgD7Q71r2qXAQK61xGrtUu1L7QxhkQSnYlsJXm2QkViwozcQEGAQ
         gnlqMaBVjonntRL2mQ/XK1B/KhX9TF0AAThi96/537Z9o2sbMuPnSHXkSNKVbR/3VJGH
         ox+EI7PFhm2fDjrwfNFrapqIwjeYujRyzAW6sd6PkpluNSjgTo5S01QzJLR9xrijwvmg
         gNmg==
X-Gm-Message-State: AOJu0YwehkxJenCa8Tc6v5HYwjtZK/byRQ4Xjt6DW7DUBr40kpWqCuIo
	OdQrXOuwyrwPbm+Pf8turVQKAGRQER1hFfb65KxC0/ummoHW3BXJ
X-Gm-Gg: ASbGnctpCS7bBcFK8BGrig9FSZ67YBkyV1TTwuuNBDsc4VFMo5egldpsfb4RVZ9+536
	hZydjVzCkcM0ukLbgY7oCGfXMJSjixq8/XBwE8zEhhFKoSr+jZuoisReSmcQWLHqqTLMtWZLwjc
	1EszPMhhLLwLLMCubDKIgKT2FVsPHW6NlSNJWX4a0+7sy80STEoocEkvftwRAyd98ly6/O7lp1y
	juNmAkL/dUC83kKd9jlQI7/kh/g3zmaKKn/94wGQdg5GJIrYgMrBZlyXWyULIOA3tiCFEyz/VZS
	iZEIasin2Tq3E3FsZUqtoYTlsY8myYTP+hqwUz0QJq7LMli7hu1YLZyj5bZHbKRspYhQaZ9axA=
	=
X-Google-Smtp-Source: AGHT+IHyKgeyxz7dYFnYHe37xjkFbqyGnt0Q7joQQZ5L8pnknp6DIq/W7ozG6/HHG8bdMLtj0Mi/Pg==
X-Received: by 2002:a05:600c:3b8e:b0:43c:f8fc:f686 with SMTP id 5b1f17b1804b1-441d44bb4c7mr24487245e9.3.1746614100601;
        Wed, 07 May 2025 03:35:00 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441d43cb5ccsm28362755e9.1.2025.05.07.03.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 03:35:00 -0700 (PDT)
Message-ID: <2fcfa888-1bb5-433c-99c5-cf5d1d590108@gmail.com>
Date: Wed, 7 May 2025 12:34:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] mesa: Allow using semantic version suffix
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250506110344.2129531-1-zboszor@gmail.com>
 <CANNYZj9tUVnuB144GuKWzdLfwB_3eWd0OO=Rkv3+yKb-CSFWYA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj9tUVnuB144GuKWzdLfwB_3eWd0OO=Rkv3+yKb-CSFWYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 10:35:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216105

2025. 05. 06. 16:27 keltezéssel, Alexander Kanavin írta:
> On Tue, 6 May 2025 at 13:04, Zoltan Boszormenyi via
> lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org>
> wrote:
>>    PV = "25.1.0"
>>    SEMVERSFX = "-rc3"
> Why not simply set PV to "25.1.0-rc3"? Nothing in the patch indicates
> that would be a problem.

Because 25.1.0-rc3 > 25.1.0 according to package managers
and that breaks package upgrades.

Locally, I also have a python scriptlet that sets PR to "r0.rc3" or "r1"
depending on whether the semantic version suffix is set, which works.

I know Yocto is not too fond of repositories (e.g. using the short git
commit for GLIBC package versions also breaks upgrades due to
the alphanumeric ordering of gitXXXXXX instead of explicit PR value bumps),
but it's easy for us to test RC versions by having staging and update repos.


