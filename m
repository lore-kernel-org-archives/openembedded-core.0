Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24317C32771
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 12:21:57 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.27954.1664194914835366681
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 05:21:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ush57iVz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id
 i203-20020a1c3bd4000000b003b3df9a5ecbso7391339wma.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 05:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date;
        bh=EfnKtoq/8XPwI8UmC92S/6CzYpQP7JIypaWF2w5G8Tc=;
        b=Ush57iVz6jxSNj5HoTPM6vZrpcTSUyScqLJyisleqU2xrVyAY0ChkBUsvOaKkQcc+u
         xNN7UFLjOtBX0/Mit6rpnMrDseQWgN9WDEj3UK4s8Ld9jLMnGmj5sTiOAZV2OvCpFJzp
         SlKQHq+8XzQik9Y1qcjL8bNZIQzgwitQQ5tt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date;
        bh=EfnKtoq/8XPwI8UmC92S/6CzYpQP7JIypaWF2w5G8Tc=;
        b=loaBSnvTzWy1+x148oV9e5P4kiq68twXq3IfGFFCTIYvK93tTeFoHB7yVl39tZDWpD
         N2bqrlicI9QoZFVh2ZXlE182UdeG6V6H1HMmJ1VatngL7GcPp/9datngf54uDlghtrW9
         PnMLMhCTekEQHw7zazuaGaoD3hCwJgzKgYmGnGknNd7eaeU3Zjdoa95WCaZ4b5Xh3DEs
         CnjThW7m4tMhsiUVauLV34AsG/iLg9WLkmfmjW6SlkQV7Ta16Wc26wX0lBXn0+N6W6MT
         CBZnYd7o4xjwdLguVy4U/lU1orSLwIThTtZVKgvQhClCFVC6JLvZm46Qu1X7D9S893m3
         HrsA==
X-Gm-Message-State: ACrzQf0mxRT2nbD09FcecsXIc4CRrcVasNVtpTLvuezD9CZEcrUG+IIe
	JHWz+JBYTtObftTzdqDyD2BCaA==
X-Google-Smtp-Source: 
 AMsMyM66hAe8l1uxMwb8b7Pa5LFTSKkwtUYoXCnt3trrkZssYtOAi/iLJb5L0uwDuLRK4hLBNaiauA==
X-Received: by 2002:a7b:c404:0:b0:3b4:faca:cf50 with SMTP id
 k4-20020a7bc404000000b003b4facacf50mr17638385wmi.67.1664194912871;
        Mon, 26 Sep 2022 05:21:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:684e:1a2d:5b94:2c12?
 ([2001:8b0:aba:5f3c:684e:1a2d:5b94:2c12])
        by smtp.gmail.com with ESMTPSA id
 bj4-20020a0560001e0400b0022a403954c3sm14912565wrb.42.2022.09.26.05.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 05:21:52 -0700 (PDT)
Message-ID: 
 <d2e8e257c5e15ee3e91017a425a09f730c66f326.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] classes/patch: move QUILT_PC for patching
 consistency
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andriy Danylovskyy <andriy.danylovskyy@streamunlimited.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 26 Sep 2022 13:21:51 +0100
In-Reply-To: <15447.1664192803295005631@lists.openembedded.org>
References: 
	<bb6a6b015fa7e01e51b85096c10bf02859edc96e.camel@linuxfoundation.org>
	 <15447.1664192803295005631@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Sep 2022 12:21:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171063

On Mon, 2022-09-26 at 04:46 -0700, Andriy Danylovskyy wrote:
> On 26/09/2022 12:23, Richard Purdie wrote:
> > On Mon, 2022-09-26 at 11:06 +0200, Andriy Danylovskyy wrote:
> > > This will move the quilt cache from the default location '$S/.pc'
> > > to
> > > '$S/patches/.pc', to ensure source invalidation always wipes it
> > > out,
> > > together with all patches.
> > >=20
> > > Recipes which set $S to $WORKDIR are susceptible to a weird
> > > issue:
> > There are a number of problems with recipes which use S =3D WORKDIR
> > unfortunately. Another is that rerunning fetch/unpack doesn't clean
> > up
> > files properly and can lead to build corruption.
> >=20
> > I'm leaning towards making S =3D=3D WORKDIR a warning and migrating
> > recipes
> > to always use a subdir. That isn't entirely straight forward but
> > probably the only way to solve all the issues.
> Anything that doesn't let it "pass" silently would be already a big
> improvement. Although deprecation with a warning sounds like a few
> more years to go into all affected projects.

It wouldn't be a quick fix for the stable releases certainly but it
would hopefully fairly quickly filter down through from master if we
did start showing warnings.

I have the warnings patch running locally and have had for a while.
Converting recipes isn't as easy as you'd think though so I'm try
trying to work out a better way to handle that.

We may also have to go a step further and fetch into a subdir in order
to address all the issues so I haven't really found a good answer to
all the problems that I'm happy to promote and suggest we change to.

>=20
>=20
> > =C2=A0
> > > =C2=A0if
> > > a source file is patched by quilt (a .bbappend adds a patch),
> > > updates
> > > to it are ignored by incremental builds, the first obsolete
> > > version is
> > > picked again and again. This is because quilt keeps its own cache
> > > in
> > > '$S/.pc', and this one survives source invalidation on do_unpack.
> > >=20
> > > This is a follow-up for a56fb90dc380 and 42a513489dc6
> > >=20
> > > Signed-off-by: Andriy Danylovskyy
> > > <andriy.danylovskyy@streamunlimited.com>
> > > ---
> > > =C2=A0meta/classes-global/patch.bbclass | 3 +++
> > > =C2=A01 file changed, 3 insertions(+)
> > >=20
> > > diff --git a/meta/classes-global/patch.bbclass b/meta/classes-
> > > global/patch.bbclass
> > > index e3157c7b18..6fcac18d9c 100644
> > > --- a/meta/classes-global/patch.bbclass
> > > +++ b/meta/classes-global/patch.bbclass
> > > @@ -5,6 +5,9 @@
> > > =C2=A0# Point to an empty file so any user's custom settings don't
> > > break things
> > > =C2=A0QUILTRCFILE ?=3D "${STAGING_ETCDIR_NATIVE}/quiltrc"
> > > =C2=A0
> > > +# Move quilt's cache to ensure it always gets removed together
> > > with "patches"
> > > +export QUILT_PC =3D "${S}/patches/.pc"
> > > +
> > This would break all other commandline use of quilt without the
> > right
> > environment. Sadly that is a usecase I personally use quite heavily
> > too
> > :/.
> >=20
> > Cheers,
> >=20
> > Richard
> I can't think of any patching in a recipe workdir, outside of
> do_patch and the devtool, so this wasn't taken into account. But what
> do I know about other people's workflows...=C2=A0

I'm old school and have used quilt for patching kernels for a couple of
decades and have used it before devtool (or even git) existed! There
are probably better ways now but quilt is muscle memory.

>  =C2=A0Then another (dirtier?) option would be to patch quilt-native
> itself, setting QUILT_PC to the relative ./patches/.pc

Sadly it doesn't help my use case as I'm used to changing to some
random WORKDIR and using the host's copy of quilt to save messing with
PATH :/.

Cheers,

Richard





