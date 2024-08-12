Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57D75C52D7C
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 09:47:43 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.42679.1723456051634185635
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 02:47:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MEL/Y8GU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.178, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ef2c56da6cso45057511fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 02:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1723456050; x=1724060850; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mre6JDj2yfRrLkkMjLXVDcTBB30ifQl9vwRBAlKJ0y4=;
        b=MEL/Y8GUiZV+ZVYNUMcNaV+3IyQvIje5ll9MUZbJTD+Ao4OHxAA0Ls4nZjjVIPu5gm
         lsAG1utfuKBJAgbh2q5L3Rg+Fs0wdvUb/RobgUhVpgNWbCCkQccNfdbsKZauLCtDXsXt
         6cCzHs51FY36fSrbJ2z1+NDqNxysUMlKT9UTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723456050; x=1724060850;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mre6JDj2yfRrLkkMjLXVDcTBB30ifQl9vwRBAlKJ0y4=;
        b=S9f4u7jJmk2opX0qJzs3nLtGh09GkOuzSoRdnu/ma/MlapF0mTGJYl9IIu958jY5ye
         9KjneNbFvDrXsGau6SO5+W9qLIybODt+2wDCNCVhLcR2djTshZo6sh5Anb9/SMM6defh
         F3uyIS6EO4ocpwRmFBMbHxIipCaVsVEJP1qz9Ps1A3RieoMmkvCyTZd5c8iWodVdR1te
         w6x6dz8uegMEeBT+ThVM55kS35ieu6cYquLOkutlxqOVRIC5YCogViTqNiAKpnk+fixy
         VbA3J82b+Sn3Mwm2MxI/Y4wnGbjs8fWIE5+yJwjZJfLeW5UMkx2r4p1wpELoMDe7KmHg
         j4OA==
X-Gm-Message-State: AOJu0YxwKl5keripnijcaFg++faK6w2/ANvU6obIj6QBIl8tVQqKfArH
	ie9I6o5s/GKGnrPInJDBBDvKBMj3OaxiQaAM/6kThAHkfeHp/cigNfYVxoNzJNiJxWkpIyuNHQ/
	SUoc=
X-Google-Smtp-Source: AGHT+IFxbKK5Lw8pts/qp31jWcwxZNRAJHdTwBUQPHtvHaoVEBBSGjT1UF0l14kpZIAw2BDrZ8HAeA==
X-Received: by 2002:a2e:be87:0:b0:2ef:2e6b:410e with SMTP id 38308e7fff4ca-2f1a6c4bfc4mr72185881fa.4.1723456049411;
        Mon, 12 Aug 2024 02:47:29 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:99e7:4d1b:f9f0:80f4? ([2001:8b0:aba:5f3c:99e7:4d1b:f9f0:80f4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4c937b6esm7019542f8f.32.2024.08.12.02.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 02:47:28 -0700 (PDT)
Message-ID: <ec8e2073832a257923c07970bc250d8a354d4203.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/5] linux-yocto: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 12 Aug 2024 10:47:28 +0100
In-Reply-To: <cover.1723399246.git.bruce.ashfield@gmail.com>
References: <cover.1723399246.git.bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 09:47:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203214

Hi Bruce,

On Sun, 2024-08-11 at 14:04 -0400, bruce.ashfield@gmail.com wrote:
> This is mainly a v3 of the 6.10 introduction series, but I've
> also included a 6.6 version bump and 6.11 for -dev.
>=20
> This should fix the:
>=20
> =C2=A0 - trap seen on multiple machines with 6.10.3, I've disabled a
> =C2=A0=C2=A0=C2=A0 NFS option that was introduced in .3 (and shoulldn't h=
ave
> =C2=A0=C2=A0=C2=A0 been)
> =C2=A0 - I've updated -rt to fix the build issue

Thanks, those are indeed fixed :)

> As I mentioned in another reply, the config warning that showed
> up on meta-virt shouldn't have happened, since the Kconfig option
> in question was removed from the kernel-cache about three weeks
> ago. If that warning comes back, I'll want to have a look at the
> SRCREVs being built to see what is going on!

The meta-virt warnings are still there:

https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/3487/ste=
ps/13/logs/stdio

(for qemuarm, qemux86-64, qemuarm64)

There are a couple of genericarm64 warnings:

https://autobuilder.yoctoproject.org/typhoon/#/builders/166/builds/727
https://autobuilder.yoctoproject.org/typhoon/#/builders/165/builds/723

The meta-aws and meta-arm issues are fixed.

We're probably at the point this should merge and the remaining bits
get fixed as we sort them out as we're down to warnings?

Cheers,

Richard


