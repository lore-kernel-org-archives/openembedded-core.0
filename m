Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2248.1793955616094431382
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 01:00:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=OKqEXize;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so3162865e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 01:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793955614; x=1794560414; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sYKjyOGHacFhEb6p1ErmsUE/zKaLD9U8MghxeDty6tA=;
        b=OKqEXizexAcmnqkSyOelCHqoUO+lZXLQlo5YudWDss0MsLQOKnT5NYHs9akpWZJfSu
         BiAP/EeMBYdVfCD5YAnF3rg61974DgOIZdCgGuSfqYuh1FT0lbQ5FXsN6rsD8YZRBJ/e
         yIGfZYyjcLJwnmEhHkdLVrNtXjmyPuZ+ldogmFLre33z5y+qgdDBO/NnxTytJ4zW7CSr
         GYsuRrkOQxjyGGcsEg+2AzS8A5MrGXhx0aH6WL9fVINwCKkkdnrCCp9x2VuJJE90frSn
         22CaXZ/c850cSs5+Q2960ym21JZYChv1UyWB5CVIAEAWG4+BnigIsYv9AweVpuRH31ZU
         QZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793955614; x=1794560414;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sYKjyOGHacFhEb6p1ErmsUE/zKaLD9U8MghxeDty6tA=;
        b=kQI2Alz1NShnwv8Sc+nClEXUCMKQEqGSJy059Flp/Q1yIl8c1BwDe4zl8WHQc0TjQk
         j3nPRRbI2fyOrwg4dSzo46aNaUYZAZ7hedqrRdrZP4Cn1qDgrqeMVaVwl29eZW5gqRSa
         WtmmuTlgrbO6ivk7G82JKKwxruMGT+fY35+n5idqT43xDVR3GcpRO28TOEdiQyGiIYC3
         HtSYBMXhJvdkh4KXRvJVmwLplMNMgM5boGiByDqTWljztsx+zCgCTyxpql6Smib3TUOx
         XCqt9ov700ZVnX4S25uA7Wi6U++2HpPrf4xJ4oZopiglXIZ0EQfGMnaOvO8fryBFJa5F
         +Xuw==
X-Forwarded-Encrypted: i=1; AKwUvBzSCSl0AVB3eSkJxwa+LkqEFs64bgiM0e4sJ7R3tr6iyu/KvBUTvZEb0ncleasmomXGFagpUYxrrgGCQGMSDdVGsQ==@lists.openembedded.org
X-Gm-Message-State: APuU4Z8PrxvPTNTkvMXOHfvTZPDGV/5i26IyT2Rm+q2DqPuCJTIs/XVo
	123JOJgf1tecefqvgSFyXF0wrXyyjg8XbJH/JZxi2K0FMejCY7F3DAoHnAgkci9f7r4=
X-Gm-Gg: AYBFou2Hglt+cNt2IAmLmT6LcOqokDXVTWiSywLKOEMM2pGPJnpWk2pUXu6WZ2CJ0XH
	5l0KVKUYsbddNkx+NGBeeWfO830/QO7cvoD4HfUqt/HATHSdLR4Xc6hCb6utRTyi+UeAweMsx7q
	iRbDffkBGLhkRjkg8LiW0vtzOfz/bI9apOR6ynZaB73kpnyMOvsGFBibSisJBPRyzSgziurAj1q
	HnQg2Eewc3j5IGFnht0W4BSiwubVD7bF+PddVwWGnh6sQ/tiVedzF9Ksoq8uBSfkx7QWes0RZfG
	ZEx9ZAclxnfYB3tN52eQV+H5XZj+g78CDdiKGQ1E0YRrvd0ow8R2+RLbfklN3LtCaXXMqvGfH/O
	wMySHbDyeSRDeteuJGD60x3a1OdUi28WBdxqWt6LzvpwB2PeBA4a21gIkr4kyrp44wY118diruk
	H64BYI5YRv0Ka1SvZD41oElpb0weOe//aeW01QW89U7CVMbXzsC8Irgu8aPIOyyq3LJwiQwKz5H
	B755zCGMglb+Vhm8FvIqt+H/EaAnVFnki5i3hewNTBNusw9monq7ZJKofr7GTrKyfb5vft2GuMx
	ZNasManWhjDx9F20zbVq+WSefr98HSh2BTPeV7+C3XQoxH9PHHfRYbmUgSPf3LvSBXjo0FidVZl
	SklKBiyzeljhVMVEA
X-Received: by 2002:a05:600c:3f08:b0:4a1:d97e:cd60 with SMTP id 5b1f17b1804b1-4b6df21303fmr26591065e9.16.1793955614224;
        Fri, 06 Nov 2026 01:00:14 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc5e23sm2600114f8f.45.2026.11.06.01.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 01:00:13 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Nov 2026 10:00:13 +0100
Message-Id: <DMO06VGB8YEA.3A78OO2FNMZWM@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 0/9] curl: Security fixes
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261106071932.490299-1-dkelaiya@cisco.com>
In-Reply-To: <20261106071932.490299-1-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 09:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249622

Hello,

On Fri Nov 6, 2026 at 8:19 AM CET, Darsh Kelaiya -X (dkelaiya - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via openembedded-core wrote:
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>
> Backport nine additional security fixes to curl 8.19.0 on Wrynose.
>
> This series applies on top of my earlier curl CVE series [1],
> from CVE-2026-86414 through CVE-2026-18924.

May I ask that you use unique subjects for the cover letters?
Either put the date or maybe the CVE range if that makes sense.
This will make it easier to track them.

Thanks!
--=20
Yoann Congal
Smile ECS

