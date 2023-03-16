Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B9B9C6FD1F
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 08:31:06 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.7524.1678955456794283479
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 01:30:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FuaGsTej;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id l12so712847wrm.10
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 01:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678955455;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNy4DSBB9mnRK41MN/9mSKnxVEC7mIV2D0wPcL6Bug0=;
        b=FuaGsTej6aOtCUiIKUpNwvWZvkJX1CppMKcOCLgSIOAUJoiq6k5naceByJHZHcECUP
         gPuxmFCbzc5pzkTXVChxS4u1mAqqMatj9eKL6DlcjnUfw4MO0HbUdkFSc/cAWrxHX99s
         1kKxD7S5CSr5wrSYOYBlXdt+xRM0q+K56Tjd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678955455;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RNy4DSBB9mnRK41MN/9mSKnxVEC7mIV2D0wPcL6Bug0=;
        b=TnG6QZxUXBzOO/B3/vpCZA/b/S9vodNU+7Av4QPnVJ8a5IdX7l4t0vBDlmi4I7nOP7
         6o6dJZuMza72/RLiSDtJ/vlpToRHcnhbXxDmAVxIu+TPhhdv9cVFo5VHwZNCJjyNVmhV
         iHi7yjW5P9X7p2X/Pp2W/IJdZk/TylUCEsLzbiXGYEabHtY/ZqxNumRRikihEVZiW+kb
         IoYhk69MIvHtzAZjdb0rICXQlua9uP491QDOP8X4Gb3S0Ff2YNOrI7pDPl5IrkSApX1B
         kxyoFi4w2OkESaGoVcL1Z4Bvtl4XOgjC1S7CVyWRMyY5gANaHjB9PW59o7ck3fzSGPVe
         XOKg==
X-Gm-Message-State: AO0yUKUUu3D0ZvmqA5S+K1wVDxP3YsvWrpCkDrLQRMdce7/kNr5BNoir
	ZbSIoZ6YYAO/2lA1yKdtiHjTnUhyFHephw5pxa0=
X-Google-Smtp-Source: AK7set8sK49xdwpZRRIxTB4OoM+Ew1/esFwJC/H9nZZ0Axo+ptByZckO72JxPUOb8TpwqIIGsfk7pA==
X-Received: by 2002:adf:fa0a:0:b0:2cf:f486:5c31 with SMTP id m10-20020adffa0a000000b002cff4865c31mr4150318wrr.24.1678955455160;
        Thu, 16 Mar 2023 01:30:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4181:67:6e43:6a9? ([2001:8b0:aba:5f3c:4181:67:6e43:6a9])
        by smtp.gmail.com with ESMTPSA id e18-20020a056000121200b002cf1c435afcsm6589497wrx.11.2023.03.16.01.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 01:30:54 -0700 (PDT)
Message-ID: <d9ffb011df0e8d018e10adb6c5f46183632d98bf.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] openssl: update from 3.0.8 to 3.1.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 16 Mar 2023 08:30:54 +0000
In-Reply-To: <7b2609b8-5834-1639-3885-388e3f9c3cc2@windriver.com>
References: <174C7E5950269FC6.10695@lists.openembedded.org>
	 <174C7EF34675A6EF.8829@lists.openembedded.org>
	 <174C9C60B65DBC68.8829@lists.openembedded.org>
	 <7b2609b8-5834-1639-3885-388e3f9c3cc2@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 08:31:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178681

On Wed, 2023-03-15 at 20:02 -0400, Randy MacLeod wrote:
> On 2023-03-15 09:58, Randy MacLeod via lists.openembedded.org wrote:
> =C2=A0
> > The ptests all passed or were skipped as you'd hope and expect from
> > openssl.=20
> > =C2=A0Results below.
>=20
> The autobuilder shows that the updated openssl isn't reproducible:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2552/s=
teps/12/logs/stdio
> I have something more urgent to deal with next so if anyone wants to
> pick this up,
> =C2=A0just say so, so that we don't duplicate effort.

I'm not saying I'll fix this but I did take a look just to get an idea
of what is wrong.

The diffoscope output is here:

http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230315-7znox1m=
p/packages/diff-html/

and we see an assembler file has random strings in it.

In the openssl source this is generated by a perl script,
rypto/modes/asm/aes-gcm-avx512.pl

Wearing suitable safety equipment to stop it burning, inside the perl
script you can see references like:

my $rndsuffix =3D &random_string();

I think this is done to avoid symbol clashes but I couldn't see
anything that would actually clash so more understanding of that this
is doing is needed. I wondered if we could set some kind of perl
seeding to make it deterministic.

I'll reply again if I learn anything more.

Cheers,

Richard

