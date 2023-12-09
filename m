Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68ADFC4167B
	for <webhook@archiver.kernel.org>; Sat,  9 Dec 2023 00:14:37 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.27376.1702080869294432246
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 16:14:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y2GCCwtY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-334b2ffaa3eso2492421f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 16:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702080868; x=1702685668; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=skVidy2QB+GXEE6D7m1AtcUTQrvt1/EbQFMBar9S3Iw=;
        b=Y2GCCwtY38OwPagvdav3ZOWS/pg8KX57RTGNST1OVWPcO9XIixlpi/WQvCquROi5PN
         t5y35DyeOVGak/h41NXDTTJqUYUOjP4sAQeB01BsLL24isodSr+2PY4mD61MawdHe0MD
         sD2mc+MO1hOGlcpvlRzmjqACS9EW7QpO5CVV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702080868; x=1702685668;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=skVidy2QB+GXEE6D7m1AtcUTQrvt1/EbQFMBar9S3Iw=;
        b=mJ8QqUrBFT6lUvllrfYzJ9GAAtFGiqJLCDmEaqCue9nX0nuGYEwHiqigam+i1VNg+m
         OhfuGEdTgkP4bwFUQhcBhgSJJWuhKikKJkvPw6FTB03MSlfPpi3qmIZHHZfTBrcqUvLH
         vyswkzY8f0Ine7rFm4KBWpNIMV6NrVcZBpAJoUng9wd1ZWNOh5eem4lrb5Vn6a5634IO
         WCux3tSKzbToQfD5VrNJSsn/GaOAATmUvoQMTmNRQK3LsWeipfmyHSA00z4F+HyFkV1t
         hqxSfZzi5BAXqkyP6jmIzyXdnV6XsYghqw2e7DvzZANJGXh4pfKrh4ynO22Zjjz62be0
         0IrA==
X-Gm-Message-State: AOJu0Yw9TqmaUzQTnwQimB65nrHTqnvp5npdGDte1uVXWgeqjlSgZv1x
	hRx696Ieub0ffyAYjZpMwrgK2w==
X-Google-Smtp-Source: AGHT+IGCEfXkGV6OJvQXgHZtEf8KlNI+QtqifbPaNqMv/KalZw/JmQ7Po+HM1jy3kl+HLMux6dUtKQ==
X-Received: by 2002:a5d:4108:0:b0:333:3c53:75a4 with SMTP id l8-20020a5d4108000000b003333c5375a4mr413222wrp.142.1702080867685;
        Fri, 08 Dec 2023 16:14:27 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:30e:3cdc:729a:15fb? ([2001:8b0:aba:5f3c:30e:3cdc:729a:15fb])
        by smtp.gmail.com with ESMTPSA id i16-20020adffc10000000b003333fd29854sm3005219wrr.45.2023.12.08.16.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 16:14:27 -0800 (PST)
Message-ID: <7bace5e4225091d8d2296573c66a0e8364ff57ea.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/6] gnu-config: add a do_compile task
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Alexander Kanavin
	 <alex.kanavin@gmail.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Sat, 09 Dec 2023 00:14:26 +0000
In-Reply-To: <DB5PR02MB102138AC5B61021289BA6C5D4EF8AA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20231208101522.198832-1-alex@linutronix.de>
	 <20231208101522.198832-4-alex@linutronix.de>
	 <e66b4cebf577218dfffb4dcfa812b69597c8650c.camel@linuxfoundation.org>
	 <DB5PR02MB102138AC5B61021289BA6C5D4EF8AA@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Dec 2023 00:14:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192090

On Fri, 2023-12-08 at 23:46 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org
> > <openembedded-core@lists.openembedded.org> On Behalf Of Richard
> > Purdie
> > Sent: den 8 december 2023 12:35
> > To: Alexander Kanavin <alex.kanavin@gmail.com>;
> > openembedded-core@lists.openembedded.org
> > Cc: Alexander Kanavin <alex@linutronix.de>
> > Subject: Re: [OE-core] [PATCH 4/6] gnu-config: add a do_compile
> > task
> >=20
> > On Fri, 2023-12-08 at 11:15 +0100, Alexander Kanavin wrote:
> > > noexec flag has an unfortunate side effect of not writing out the
> > > .siginfo
> > > file into sstate (because that is done in sstate bbclass
> > > from a task-completed event handler).
> > >=20
> > > In the absence of the siginfo file, diffsigs code is unable to
> > > trace back
> > > the change in task signatures if the change is really basic and
> > > affects tasks coming ahead of gnu-config-native:do_compile.
> > >=20
> > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > ---
> > > =C2=A0meta/recipes-devtools/gnu-config/gnu-config_git.bb | 3 ++-
> > > =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
> > > b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
> > > index 718f798a00e..c72de159ce2 100644
> > > --- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
> > > +++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
> > > @@ -19,7 +19,8 @@ UPSTREAM_CHECK_COMMITS =3D "1"
> > >=20
> > > =C2=A0CLEANBROKEN =3D "1"
> > >=20
> > > -do_compile[noexec] =3D "1"
> > > +do_compile () {
> > > +}
> > >=20
> > > =C2=A0do_install () {
> > > =C2=A0	install -d ${D}${datadir}/gnu-config \
> > >=20
> >=20
> > You have a good point here but by this logic, we need to remove
> > *all*
> > noexec tasks. We don't really want to do that and I'm not sure we
> > want
> > to set this precedent.
> >=20
> > I wonder if we could just remove the compile task entirely and what
> > that would break...
> >=20
> > Cheers,
> >=20
> > Richard
>=20
> Would it be possible to change the code so that the .siginfo files
> are=20
> still produced for noexec tasks? Otherwise it seems using noexec
> tasks=20
> is a real blocker for being able to trace the signatures for any=20
> subsequent task.

Producing the siginfo files requires a full data store and bitbake
doesn't retain that information for every recipe, just a summary of the
data it needs. It is therefore currently produced in the task execution
context currently. With a noexec task, the win is that we never need
that context.

So this does need some thought.

Cheers,

Richard

