Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A844C3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 06:43:08 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.69143.1744094573427818550
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 23:42:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=AbQuO6rf;
 spf=pass (domain: linaro.org, ip: 209.85.208.171, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30c0517142bso48610061fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 23:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744094571; x=1744699371; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=01+pY6aiUvO+IVL3vaQ1Jb6R7wacM9yTGCIec0AHmxw=;
        b=AbQuO6rfL4ttfDFc/k2zDykO3aNaKmDBKmdnH+g4zx4yb3aKsidy3OKf1syU1GLF3s
         Kdzznd+RCUU8B8gjr+/DwQG52HcKNOn0nkrMdAzXItQQij+0kTd1Q8yHObyvPY2HLh0x
         eHRUci1TQtiWXEgLyXxxJrLQ96sXB6i2hTpT5Y+nijZ7e4d67C7gUxYbIMkvIlSddENZ
         kAJQxnj7iIlKgTWcz3W5SGxV/Tbvy0Zy7Ty8t3aQQdMzcd1s/e2acUd7Bja0XVsGTWq/
         zDp+xqmljAiVjrOOKV9HSpv4282iBXlklrqct5mKHUDuOEZyVxMO0VhGF7K0FdDKXsac
         m5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744094571; x=1744699371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01+pY6aiUvO+IVL3vaQ1Jb6R7wacM9yTGCIec0AHmxw=;
        b=EZGmnDEXgjj9f4EMxFhaVY7vpnXIx0wzUvj2i2le5cRlMTP2RVfEL7vE4gnSqagslI
         cM58cbPkySqyA8tEarTC3u+RkYbmccoz+DNh0xy5/GXPWTtCeDAe5iUZujT4TRcemZM6
         oSyNh4LnqGuHi1wt7wDpS/qXRLvZqZmOQbWQSFfiIuZByzCxpGW1FW6tI0eGe5ULwgtG
         4eiwWdbgGqt8MxqNMXvh6G/tiCxecrvK6E/03Nwq4azrJmlPaq/X3aiI1zY/1swibrXU
         51NxHEIycvXJCiVEijL+K5TqEPI/i199UenMWC0lmj0Wby4w8O7410TWBPk1dPv978eP
         C7Rw==
X-Gm-Message-State: AOJu0YxpTiw243d7MwbPFbolF9pb1CeF8JcjBruKvFuPVSKMadFN/G49
	OOha6JvvYx4VGh5JfRWjiLs/gyQ9WMsaabAnPgRDSw8Ku0rby2zC4+EPNG71iB8=
X-Gm-Gg: ASbGnctssIaG0TDdKVfn/Zc0ylibcKNUHltL36ZyoWUG7jM2CzoHjOfoWHcHl3Sa6T8
	TdJC5svj1v8P73tknTKVyPg/lLbKgYFBKkQvwTRFctSNaYTllATksb3q4125SK4+uzD+jRHWT+X
	wKeWRrP8vo1kXMQ57S0ThxQjehkrXn2022lSVPrnF40vUfhHfIIVdMFaiHaXgCgUTcANq0EUDLe
	TMe8SMDGynK3Klrv9GgZ+8gxumNBXVRH6hSFZX16DnfxnQXrPea/sKsHtzZh8X3bQFB+OVPEYyv
	1269uAwO26t4r5ZwIyBo1YJtc1fAi8qFy7l+tF6LMymdDM2KmuAWvXtyp3TWc+ZrECUBzRr8a5U
	eGA==
X-Google-Smtp-Source: AGHT+IEHz33618qBx8YiEvFVPcFtQ93OK7hBw81m6D8gPHYH3vZ7flDBqqAb3o+4pRVnVBEOc/n6QQ==
X-Received: by 2002:a05:651c:515:b0:30b:c6fe:4529 with SMTP id 38308e7fff4ca-30f0a0ee889mr54503091fa.8.1744094571296;
        Mon, 07 Apr 2025 23:42:51 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f0312454csm18397151fa.14.2025.04.07.23.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 23:42:51 -0700 (PDT)
Date: Tue, 8 Apr 2025 09:42:49 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] u-boot: set git repo branch with SRCBRANCH
Message-ID: <Z_TFaQPpXL2Al4Zf@nuoska>
References: <20250404075136.385270-1-mikko.rapeli@linaro.org>
 <CANNYZj8jN5yBoHpYsAPbdMw+vM0CR9Fh9t-6Ddcqr8npDw7_dA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj8jN5yBoHpYsAPbdMw+vM0CR9Fh9t-6Ddcqr8npDw7_dA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 06:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214510

Hi,

On Mon, Apr 07, 2025 at 07:05:54PM +0200, Alexander Kanavin wrote:
> On Fri, 4 Apr 2025 at 09:51, Mikko Rapeli via lists.openembedded.org
> <mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
> >
> > Enables changing branch from "master" to "next"
> > when building bleeding edge upstream versions for
> > testing purposes. Now local.conf setup to
> > build latest "next" version becomes:
> >
> > INHERIT += "poky-bleeding"
> > POKY_AUTOREV_RECIPES += "u-boot"
> > SRCBRANCH:pn-u-boot = "next"
> 
> But 'next' is not a bleeding edge branch. It's a fluid, and probably
> forced-pushed-to testing branch which is not even on top of master,
> but rather master has commits that next does not:
> 
> https://source.denx.de/u-boot/u-boot/-/branches
> 
> Is there a use case for using it in yocto builds?

Yes, testing features which are queued to merging but this process is taking
quite some time. If "yocto builds" is your oe-core/poky CI builds then I
think it's a no, no uses. But for me, I care about u-boot, tf-a, optee etc
and want to build their 'next' and master branches from time to time
to test features which are being merged. For example optee support for some new
HW or u-boot pmem support to boot memory based OS images.

FWIW, upstream optee developers use buildroot integration setup for similar
things and I have a need to use yocto based one.

> Another problem is that this sets a precedent we'd rather not set. If
> you want to tweak bits of SRC_URI, it's better to just reset the whole
> thing.

SRC_URI contains more than just SCM URIs and I don't want to overwrite
them. For example all the config snippets and patches. I'm also interested
if patches no longer apply and/or break builds. So I really just want to change
the upstream SCMs to different branch.

A lot of recipes do this already in oe-core so I though it would not be
a big deal for you.

Cheers,

-Mikko

