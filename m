Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B5F7C433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 21:17:27 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.81.1657747043720391832
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 14:17:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Jb67x3Pk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id
 y22-20020a7bcd96000000b003a2e2725e89so83046wmj.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 14:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=Ygg9DFo0tDULnG08OLP7bK900Svtu+9Fxuiep0eouts=;
        b=Jb67x3PkjUYjAoRqa0qSWC3naruZp/bAu8hJNNnBMI85L8jdcnKGYRv+z1inEy7YEk
         jyZ3vm0W9D1o7u1MoLRAw7dokvUJoJ00tk57qoorEVvxFBu9gVff2rfpNbj+o4CaQjiU
         bLCUj4sKwXb/Ma8PZETXyceB6zz9kEqoF5ixk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=Ygg9DFo0tDULnG08OLP7bK900Svtu+9Fxuiep0eouts=;
        b=P77rmSKNdvs8Sy/oVRDDaCh6QP60d1IoB25N/iR32ip1wPKP8WWQJtI13uLacbZxmt
         f+AiiOJ6nBk9iSJbcijxAsagYOoQeGPdNofzg+0CBlIr4U073VaH7/hLuKIcReSuCxqr
         Fpe9vFOuO3NB7ZvDqwSS1CuyabG98M3sbNjuU0rrg6sQIoAsnAX4VETVMThb2sI7idYh
         HFgbZBdW2n8JXwb7PnU+51vz/noSqiRF1io4W5Fn9F5wRC2oLerNZg5PM6tWjzuEs19d
         TUsL7PBxJ0djhfNwZNplSnXUemtof8Q+AgpV2xykSNaEhpqpjK2lTMqx6UYxCUkUwpaw
         F1fw==
X-Gm-Message-State: AJIora8ThyiSBw2v9d4J3TG1LWN/gVxeSTntjY224ETG1NfY9kD0qZDV
	+2dOm1ks12Qa2afCC8YguMrQbA==
X-Google-Smtp-Source: 
 AGRyM1vg2+YtFsOYX+2YjKYjX7pVToK5VwBNi3X8jaXjBNKqkfuBXHFaqtMQQNR5Xy9W5bLELKIvyQ==
X-Received: by 2002:a05:600c:1c98:b0:3a2:ec7e:fbf5 with SMTP id
 k24-20020a05600c1c9800b003a2ec7efbf5mr5740130wms.40.1657747042000;
        Wed, 13 Jul 2022 14:17:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c037:3be3:5ea0:9a64?
 ([2001:8b0:aba:5f3c:c037:3be3:5ea0:9a64])
        by smtp.gmail.com with ESMTPSA id
 z11-20020a5d4d0b000000b0021b9f126fd3sm11791238wrt.14.2022.07.13.14.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 14:17:21 -0700 (PDT)
Message-ID: 
 <bab4356b6c9c62c60318060a89d4d1ef0e5a97c6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 1/2] poky-altcfg: enable usrmerge
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Luca Boccassi <luca.boccassi@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Jul 2022 22:17:20 +0100
In-Reply-To: 
 <CAMw=ZnQGseWOkhmpVdMMLSeq2+-9AND=FbO5k2FHgCkgo5Lnaw@mail.gmail.com>
References: <20220711202929.3839971-1-luca.boccassi@gmail.com>
	 <20220713165533.125600-1-luca.boccassi@gmail.com>
	 <8189a37bf619f781f8e9437fd5a4b2c7c06c7457.camel@linuxfoundation.org>
	 <CAMw=ZnQCPQ4zm0+YDjLq4+k17kYyjBTtAz2VsDFZDsUYp1jCXg@mail.gmail.com>
	 <3f2f03085301d22854e5429019fb010f27d98bc7.camel@linuxfoundation.org>
	 <CAMw=ZnQGseWOkhmpVdMMLSeq2+-9AND=FbO5k2FHgCkgo5Lnaw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 21:17:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167992

On Wed, 2022-07-13 at 20:02 +0100, Luca Boccassi wrote:
> On Wed, 13 Jul 2022 at 19:36, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Wed, 2022-07-13 at 19:09 +0100, Luca Boccassi wrote:
> > > On Wed, 13 Jul 2022 at 18:53, Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >=20
> > > > On Wed, 2022-07-13 at 17:55 +0100, Luca Bocassi wrote:
> > > > > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > > > >=20
> > > > > Ensure it gets tested by the CI
> > > > >=20
> > > > > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > > > > ---
> > > > >  meta-poky/conf/distro/poky-altcfg.conf | 2 ++
> > > > >  1 file changed, 2 insertions(+)
> > > > >=20
> > > > > diff --git a/meta-poky/conf/distro/poky-altcfg.conf b/meta-poky/c=
onf/distro/poky-altcfg.conf
> > > > > index f03306e798..57a76e8bb9 100644
> > > > > --- a/meta-poky/conf/distro/poky-altcfg.conf
> > > > > +++ b/meta-poky/conf/distro/poky-altcfg.conf
> > > > > @@ -9,6 +9,8 @@ DISTROOVERRIDES =3D "poky:poky-altcfg"
> > > > >  #DISTROOVERRIDES =3D "poky:linuxstdbase"
> > > > >=20
> > > > >  INIT_MANAGER:poky-altcfg =3D "systemd"
> > > > > +# systemd will soon require usrmerge
> > > > > +DISTRO_FEATURES:poky-altcfg +=3D "usrmerge"
> > > > >  # systemd isn't suitable with musl
> > > > >  INIT_MANAGER:poky-altcfg:libc-musl =3D "sysvinit"
> > > > >=20
> > > >=20
> > > > This blew up builds since it clears everything else out of
> > > > DISTRO_FEATURES which isn't what was intended. I've tweaked the pat=
ch
> > > > and re-queued.
> > >=20
> > > Sorry, did I get something wrong? The diff between my local branch an=
d
> > > the master-next branch is empty, can't quite see it:
> > >=20
> > > $ git diff upstream/master-next meta-poky/conf/distro/poky-altcfg.con=
f
> > > $
> >=20
> > My fault, I'm trying to restart the build from a different environment
> > to usual and I messed up the change. It should be there now (and build
> > restarted).
>=20
> No worries - I see, in this case the append was the right thing. One
> day I'll get these right on the first try. One day! Thanks for the
> fix.

It really depends how complex the variable is and how you're making the
assignment. In this case you're using an override to make the
assignment and you want to add to the existing values so append is the
only way.

Cheers,

Richard

