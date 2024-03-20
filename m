Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99023C54E58
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 18:23:04 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.53256.1710958977862965481
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 11:22:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QV1FLUTt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a46a7208eedso20382466b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 11:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1710958976; x=1711563776; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1B8QuzMnJT6qxtJ1HtXtvE6BC/X0ooUeeJwX4x50O1U=;
        b=QV1FLUTtL86FxXBI6rwXtkLfCFFoyxxSrsK1mCFsGcjXW5JpCCcIJB36i+Yf05IDL9
         9TvH5wXsfsv0EYGbX5wrOW5iEXE5FM/RpQ0/PkPEo2W3esHLLYzdoXzLbDZSkYCsMVLv
         oNlJgOMCb4FXs7AzmAabxtomWL3HnDZkoTy5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710958976; x=1711563776;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1B8QuzMnJT6qxtJ1HtXtvE6BC/X0ooUeeJwX4x50O1U=;
        b=iuKRzAfEcIAEUQuNZuWzXs1XEcuasbj9/kQg8mqcsATIyNwLX+fiEDapHxHMrOS8AE
         yYFitQpp5W3eSbfV2T6JeoaYVLP9sgyuqaIo2Ik/5FCBNSkLIh7QSDo2+ikoe1GkUyfC
         lcIBYQ1382FW5PgFYkUXriccSL4oRTPTQtFtypM6SJSiF5HjhIPNwMtpr5K03LqI/qSk
         UCvHhCPrzwmxpy6CdEgcUu2OgXIINveJLcKwPLABcB7g16YQ43A6fWZ6CMEfpj8EAqVB
         lhMY0pbZd0YlM4LpDQkG99WLDk/YqeNNJ/Ewvf0CLqCysgCoEhlhmNlPcPt6j7IEaIDH
         jUtQ==
X-Gm-Message-State: AOJu0Yy3HmoQRnDYt0gggehzMbp+zb91YXSM9xr+qb+WzcmUWnXXYX6F
	tM3I0NpR2tOeX8ohoYjQVThbrj5NO0BeLJm5Fo880rdr6CuPFVkpPGTVespICt0=
X-Google-Smtp-Source: AGHT+IGHL8IoCKIA0g4HskU0ngtYGEtHCCR78Tx829RVXoE0nTZdarczk6DyGQvK/M4WMy745Jbiug==
X-Received: by 2002:a17:907:5cb:b0:a46:c56f:fe39 with SMTP id wg11-20020a17090705cb00b00a46c56ffe39mr6942556ejb.39.1710958976204;
        Wed, 20 Mar 2024 11:22:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f87e:2489:3571:2337? ([2001:8b0:aba:5f3c:f87e:2489:3571:2337])
        by smtp.gmail.com with ESMTPSA id g14-20020a170906198e00b00a46d049ff63sm2943213ejd.21.2024.03.20.11.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 11:22:55 -0700 (PDT)
Message-ID: <0dbe20315e91bf2ad153feda429ca598830f7282.camel@linuxfoundation.org>
Subject: Re: [PATCH 4/9] yocto-bsps: update to v6.6.21
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 20 Mar 2024 18:22:54 +0000
In-Reply-To: <CADkTA4ME7+mH--7MYAwupupLCQ2UU+xLidYCSv_EAH4M4_xuwQ@mail.gmail.com>
References: <cover.1710888915.git.bruce.ashfield@gmail.com>
	 <4079b14e4fccdf64f52b60c878fb22def0eae836.1710888915.git.bruce.ashfield@gmail.com>
	 <55784b1eb754e24a4da4b628cf087590af9a4859.camel@linuxfoundation.org>
	 <CADkTA4ME7+mH--7MYAwupupLCQ2UU+xLidYCSv_EAH4M4_xuwQ@mail.gmail.com>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 18:23:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197401

On Wed, 2024-03-20 at 08:29 -0400, Bruce Ashfield wrote:
> On Wed, Mar 20, 2024 at 6:47=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Tue, 2024-03-19 at 19:01 -0400, bruce.ashfield@gmail.com=C2=A0wrote:
> > >=20
> > > diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-
> > > yocto_6.6.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-
> > > yocto_6.6.bbappend
> > > index ca7b2b09df..bf88a57770 100644
> > > --- a/meta-yocto-bsp/recipes-kernel/linux/linux-
> > > yocto_6.6.bbappend
> > > +++ b/meta-yocto-bsp/recipes-kernel/linux/linux-
> > > yocto_6.6.bbappend
> > > @@ -9,16 +9,16 @@ KMACHINE:genericx86-64 ?=3D "common-pc-64"
> > > =C2=A0KMACHINE:beaglebone-yocto ?=3D "beaglebone"
> > >=20
> > > =C2=A0SRCREV_machine:genericarm64 ?=3D
> > > "e064a7d658a30b027b999183e21cd37305caff2a"
> > > -SRCREV_machine:genericx86 ?=3D
> > > "332d4668fcc32826907d4f3c4938845206006089"
> > > -SRCREV_machine:genericx86-64 ?=3D
> > > "332d4668fcc32826907d4f3c4938845206006089"
> > > -SRCREV_machine:beaglebone-yocto ?=3D
> > > "332d4668fcc32826907d4f3c4938845206006089"
> > > +SRCREV_machine:genericx86 ?=3D
> > > "06644f0d7193d7ec39d7fe41939a21953e7a0c65"
> > > +SRCREV_machine:genericx86-64 ?=3D
> > > "06644f0d7193d7ec39d7fe41939a21953e7a0c65"
> > > +SRCREV_machine:beaglebone-yocto ?=3D
> > > "06644f0d7193d7ec39d7fe41939a21953e7a0c65"
> > >=20
> > > =C2=A0COMPATIBLE_MACHINE:genericarm64 =3D "genericarm64"
> > > =C2=A0COMPATIBLE_MACHINE:genericx86 =3D "genericx86"
> > > =C2=A0COMPATIBLE_MACHINE:genericx86-64 =3D "genericx86-64"
> > > =C2=A0COMPATIBLE_MACHINE:beaglebone-yocto =3D "beaglebone-yocto"
> > >=20
> > > -LINUX_VERSION:genericarm64 =3D "6.6.18"
> > > -LINUX_VERSION:genericx86 =3D "6.6.15"
> > > -LINUX_VERSION:genericx86-64 =3D "6.6.15"
> > > -LINUX_VERSION:beaglebone-yocto =3D "6.6.15"
> > > +LINUX_VERSION:genericarm64 =3D "6.6.21-116-g06644f0d7193"
> > > +LINUX_VERSION:genericx86 =3D "6.6.21-116-g06644f0d7193"
> > > +LINUX_VERSION:genericx86-64 =3D "6.6.21-116-g06644f0d7193"
> > > +LINUX_VERSION:beaglebone-yocto =3D "6.6.21-116-g06644f0d7193"
> >=20
> > I think this one came through a little corrupted as it it doesn't
> > rebase on top of the change Ross sent and even then, the
> > LINUX_VERSION
> > looks odd compared to the one set in the main recipe for that
> > revision.
> >=20
> > I've tweaked it to look "right", we'll see how that build goes!
> >=20
>=20
> I was experimenting with my update script to pickup Kevin's commit shortl=
og
> and I noticed after that it was messing up the version string.
>=20
> I thought I rebased on top of the latest master (but that's probably the =
issue,
> I should have done master-next), so yes, it won't take into account us
> dropping genericarm64, etc.
>=20
> I've fixed my script now, so if you want a resend, I can easily do that.

Sorry, I'd not realised there were patches in master-next for meta-
yocto, I thought I'd merged them. I've done that now and as the tweaked
patch tested successfully, I've merged that too so we're all good.

Thanks,

Richard

