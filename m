Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68AA8C54E58
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 12:29:52 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.43030.1710937788415683239
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 05:29:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c2B3Idw3;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-29df3333d30so4281367a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 05:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710937788; x=1711542588; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ffukqqUbFJXjCgjIqRsm6l9lxxzG+YtJHtoI2pHeT0k=;
        b=c2B3Idw3U2ndokf1RsOlYB+p6wK94UWg8qq0B1lqJ9LgsxU0z4h7Mb9/3UBmtP38QV
         I+C3ESejgZYLGrL6B5yZJi6UbsLGDRWLiRDiBnKLcDytMkLZW2xsjeEgDaIRIsDt+7mV
         jHIKbhFyW9inftFqP1UJ97bKu/wk3gh1KeRUtjbzWjz+JBl8ALvFLJrNZG3bQR3MAqaj
         YiT6vgFQoUuALEUpf3ipz0crWfCtIYUnpWfLWmTlLM36XnawfupZpkgrdUdUmes/ZrmM
         9JAQXurph0CHvHyO32Yvczg3UfQyHivkhNl9DsGCRK0d1QjtbxMKuEW9uOLdO534WAUv
         lTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710937788; x=1711542588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ffukqqUbFJXjCgjIqRsm6l9lxxzG+YtJHtoI2pHeT0k=;
        b=WuUp3/KilBMwSsAhZIBslNSM47uSBqp18txnLGilfjh87d3nRbwt4mhpk/cQdn28hV
         kuQmbRaRma7VW4O6JNRY6oDBEBcGk6RQHMGq77gGMn/ZsZxbFylctVe/4o+lM03qRf8v
         FsCyJhtNQLzW8psgscyGWRG0wYBvIoN6EA/g3+y0TLTBLEpiAjIuUewC/0u4gfhdPXX0
         1zH8kWld5ef9uc8Pxh74o59xLU+y/IC/BK13sSpajzO5p93gmnJJINTpLLq6P3NIU+eM
         6pknwtRJbwzAxgGokDz02za6ilcv9k2iO/cbG/FF+3MZsM4T5lpzbYFL31URfN5ngIfG
         P8zA==
X-Gm-Message-State: AOJu0Ywuoj3aqEnb6zsdvo42oo8StElx1+5mIa+Gtkx2tkyQJw8oTs+s
	E85g/yIhxd4yk9xIEXdfu7H1Def+yD5MzqM4ZF+JyMoPqxUMG6zCPMn1hZP7hZa7at3PnbmzpaN
	CJbZkJGZQoQXxe2xGuN0Cb9RU6A8=
X-Google-Smtp-Source: AGHT+IG/Jlve5Ih2ZmveWq+N5KGEUiGbQSqn4TfnnAFIKkJ7q3z1V1b/3KW1FD16b0VIyC3V+1y62AGnATP9jWxUGJg=
X-Received: by 2002:a17:90a:1fc4:b0:29b:c17c:5fa6 with SMTP id
 z4-20020a17090a1fc400b0029bc17c5fa6mr12574584pjz.33.1710937787685; Wed, 20
 Mar 2024 05:29:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1710888915.git.bruce.ashfield@gmail.com>
 <4079b14e4fccdf64f52b60c878fb22def0eae836.1710888915.git.bruce.ashfield@gmail.com>
 <55784b1eb754e24a4da4b628cf087590af9a4859.camel@linuxfoundation.org>
In-Reply-To: <55784b1eb754e24a4da4b628cf087590af9a4859.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 20 Mar 2024 08:29:36 -0400
Message-ID: <CADkTA4ME7+mH--7MYAwupupLCQ2UU+xLidYCSv_EAH4M4_xuwQ@mail.gmail.com>
Subject: Re: [PATCH 4/9] yocto-bsps: update to v6.6.21
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 12:29:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197360

On Wed, Mar 20, 2024 at 6:47=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2024-03-19 at 19:01 -0400, bruce.ashfield@gmail.com wrote:
> >
> > diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappe=
nd b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend
> > index ca7b2b09df..bf88a57770 100644
> > --- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend
> > +++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend
> > @@ -9,16 +9,16 @@ KMACHINE:genericx86-64 ?=3D "common-pc-64"
> >  KMACHINE:beaglebone-yocto ?=3D "beaglebone"
> >
> >  SRCREV_machine:genericarm64 ?=3D "e064a7d658a30b027b999183e21cd37305ca=
ff2a"
> > -SRCREV_machine:genericx86 ?=3D "332d4668fcc32826907d4f3c49388452060060=
89"
> > -SRCREV_machine:genericx86-64 ?=3D "332d4668fcc32826907d4f3c49388452060=
06089"
> > -SRCREV_machine:beaglebone-yocto ?=3D "332d4668fcc32826907d4f3c49388452=
06006089"
> > +SRCREV_machine:genericx86 ?=3D "06644f0d7193d7ec39d7fe41939a21953e7a0c=
65"
> > +SRCREV_machine:genericx86-64 ?=3D "06644f0d7193d7ec39d7fe41939a21953e7=
a0c65"
> > +SRCREV_machine:beaglebone-yocto ?=3D "06644f0d7193d7ec39d7fe41939a2195=
3e7a0c65"
> >
> >  COMPATIBLE_MACHINE:genericarm64 =3D "genericarm64"
> >  COMPATIBLE_MACHINE:genericx86 =3D "genericx86"
> >  COMPATIBLE_MACHINE:genericx86-64 =3D "genericx86-64"
> >  COMPATIBLE_MACHINE:beaglebone-yocto =3D "beaglebone-yocto"
> >
> > -LINUX_VERSION:genericarm64 =3D "6.6.18"
> > -LINUX_VERSION:genericx86 =3D "6.6.15"
> > -LINUX_VERSION:genericx86-64 =3D "6.6.15"
> > -LINUX_VERSION:beaglebone-yocto =3D "6.6.15"
> > +LINUX_VERSION:genericarm64 =3D "6.6.21-116-g06644f0d7193"
> > +LINUX_VERSION:genericx86 =3D "6.6.21-116-g06644f0d7193"
> > +LINUX_VERSION:genericx86-64 =3D "6.6.21-116-g06644f0d7193"
> > +LINUX_VERSION:beaglebone-yocto =3D "6.6.21-116-g06644f0d7193"
>
> I think this one came through a little corrupted as it it doesn't
> rebase on top of the change Ross sent and even then, the LINUX_VERSION
> looks odd compared to the one set in the main recipe for that revision.
>
> I've tweaked it to look "right", we'll see how that build goes!
>

I was experimenting with my update script to pickup Kevin's commit shortlog
and I noticed after that it was messing up the version string.

I thought I rebased on top of the latest master (but that's probably the is=
sue,
I should have done master-next), so yes, it won't take into account us
dropping genericarm64, etc.

I've fixed my script now, so if you want a resend, I can easily do that.

Bruce

> Cheers,
>
> Richard



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

