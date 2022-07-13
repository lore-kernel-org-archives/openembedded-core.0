Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D319EC43334
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 18:37:03 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.712.1657737420632322682
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 11:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MyvXjRMY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id
 8-20020a05600c024800b003a2fe343db1so927498wmj.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 11:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=UUoLXjRb+G50115YLFui2nzWe2YOKLLLTV+rrtLOPKk=;
        b=MyvXjRMYuFopyw76zRnC9ozrUVwi1p1wkkuU9QDOGaKRzCP3Rx49quGV0nMV44yfWz
         DHyzVoZNYjzkzXK7mFfvR1UXlQtr3iKl1AUuvTJzkGTmRYhevp9GSvmxSxhw6Wze5Do7
         rJxIQGDY0YJQp/s3lpGTJXq+8e4XnvLpe9bVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=UUoLXjRb+G50115YLFui2nzWe2YOKLLLTV+rrtLOPKk=;
        b=6SPo43bYxF7zkOlXseTCO+D9boPyDVSNeZfBxvK7SW7JMTRF4bZYpbKSY/NImzqxbp
         EE4swAWsKptFLaLpgoLP2qiVIS5HxHJ9tRt85w/GMghHD3bQkYV0Xz8nFxdGDDiphl/5
         WJMYtZeoup1mCJgZK5n5DVx4OyWSiu/Rf5th5AG6Hy4oSvS9shaT51cIp099qaCdT513
         1tj/NF3v99B8pwPsYb6dpzaA8dojV0ahCs/GTfqxqaDwnT7h4kx+dG198leDjQ8sxhr7
         glhcXdiuE8tu/RxcDP9kxngWoDR9XmEANMcGZZBgNmiCtfIGOetVb/4ge0YKwS3tBojs
         k8ww==
X-Gm-Message-State: AJIora/3SBM+K251Z1q6RoQfzWXlT5hjBZyh0MY9XpeR3AzSRjjKZaYK
	KSA6JllNuKLNbIrDg+Gm1UPxKw==
X-Google-Smtp-Source: 
 AGRyM1uFHpr6+VrKJm8wawBu2376ewEN2cTHlSLJ+cDeIKrbdp9X/+01CRtUA5vh3Pfor+59W5zwRA==
X-Received: by 2002:a7b:c354:0:b0:39c:6753:21f8 with SMTP id
 l20-20020a7bc354000000b0039c675321f8mr5088101wmj.113.1657737418762;
        Wed, 13 Jul 2022 11:36:58 -0700 (PDT)
Received: from max.broadband ([90.254.144.239])
        by smtp.gmail.com with ESMTPSA id
 j27-20020a05600c1c1b00b0039c4ba160absm9298339wms.2.2022.07.13.11.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 11:36:58 -0700 (PDT)
Message-ID: 
 <3f2f03085301d22854e5429019fb010f27d98bc7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 1/2] poky-altcfg: enable usrmerge
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Luca Boccassi <luca.boccassi@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Jul 2022 19:36:55 +0100
In-Reply-To: 
 <CAMw=ZnQCPQ4zm0+YDjLq4+k17kYyjBTtAz2VsDFZDsUYp1jCXg@mail.gmail.com>
References: <20220711202929.3839971-1-luca.boccassi@gmail.com>
	 <20220713165533.125600-1-luca.boccassi@gmail.com>
	 <8189a37bf619f781f8e9437fd5a4b2c7c06c7457.camel@linuxfoundation.org>
	 <CAMw=ZnQCPQ4zm0+YDjLq4+k17kYyjBTtAz2VsDFZDsUYp1jCXg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 18:37:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167983

On Wed, 2022-07-13 at 19:09 +0100, Luca Boccassi wrote:
> On Wed, 13 Jul 2022 at 18:53, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Wed, 2022-07-13 at 17:55 +0100, Luca Bocassi wrote:
> > > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > >=20
> > > Ensure it gets tested by the CI
> > >=20
> > > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > > ---
> > >  meta-poky/conf/distro/poky-altcfg.conf | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >=20
> > > diff --git a/meta-poky/conf/distro/poky-altcfg.conf b/meta-poky/conf/=
distro/poky-altcfg.conf
> > > index f03306e798..57a76e8bb9 100644
> > > --- a/meta-poky/conf/distro/poky-altcfg.conf
> > > +++ b/meta-poky/conf/distro/poky-altcfg.conf
> > > @@ -9,6 +9,8 @@ DISTROOVERRIDES =3D "poky:poky-altcfg"
> > >  #DISTROOVERRIDES =3D "poky:linuxstdbase"
> > >=20
> > >  INIT_MANAGER:poky-altcfg =3D "systemd"
> > > +# systemd will soon require usrmerge
> > > +DISTRO_FEATURES:poky-altcfg +=3D "usrmerge"
> > >  # systemd isn't suitable with musl
> > >  INIT_MANAGER:poky-altcfg:libc-musl =3D "sysvinit"
> > >=20
> >=20
> > This blew up builds since it clears everything else out of
> > DISTRO_FEATURES which isn't what was intended. I've tweaked the patch
> > and re-queued.
>=20
> Sorry, did I get something wrong? The diff between my local branch and
> the master-next branch is empty, can't quite see it:
>=20
> $ git diff upstream/master-next meta-poky/conf/distro/poky-altcfg.conf
> $

My fault, I'm trying to restart the build from a different environment
to usual and I messed up the change. It should be there now (and build
restarted).

Cheers,

Richard

