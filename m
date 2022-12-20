Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B9DC3DA6E
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 21:49:18 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.3869.1671572957723097945
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 13:49:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MFY63Tni;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id f18so13128257wrj.5
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 13:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YxzBPfJzK7fetdoFSIc3JWqAjW44CuJQDCvZffUS4lU=;
        b=MFY63Tniu4gl0ZHu5QhLSJ0u5hSB1MHokxS30D7VcM6zBWcPHRFHe5CMCS3kh1wp7g
         BpjXBQ0w0e41UuW6XSZoOIxEfO1OhHfPs8ix8W5VsRWtNbbFRxPxBvDp1MFaxGSnGwXx
         AqrzomqrU0ts59+LnKbVij9NK7d08hCELNkZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YxzBPfJzK7fetdoFSIc3JWqAjW44CuJQDCvZffUS4lU=;
        b=fSu2RbrjpW+ITTtS5o05vIwEHFjzaQu6o9LPPU6LfWGMrJgbmNWsbQNGGfX9S4llRc
         ILDhgLAY8KNsnqbL49CgNgv7Aj4KIvA+5DestV/blYT9W7js3war3BDsDxZe8+m+6Eb8
         V7qKb1VocVB89zc+gOoXP/DK+bvlmoMn1Mut2TJN8Pd5424By3W0o/TfcU74JWPmfnSW
         6AhSkuuG4vOGqCFMwE8BpMRtQ882Myn9ymugX4WHVAGbXLHRRoKcGCyjdWW9wZz3dPjv
         WVhUbgSnUIm/oYFAn8MAfbwC3+9IGsxGAZeUxxfF3f8kfQyFw+PxAzDstFX5iIlqaHKz
         koyA==
X-Gm-Message-State: ANoB5pmym/HMxVA+TpnCT7pBuDWJnKzM/Ias6MxNKxiu1hdU+FmCKnl0
	ngs5EMaQ948H/PaNABBvQJfaIQ==
X-Google-Smtp-Source: AA0mqf45fyweG4y/nRoyjpkjP3u42FU2R9dqliTAyrD7R7plXETM9cQuMTxofmmLMa0AIllEFQoGkw==
X-Received: by 2002:adf:f0ca:0:b0:241:fd48:dccd with SMTP id x10-20020adff0ca000000b00241fd48dccdmr29780105wro.63.1671572955622;
        Tue, 20 Dec 2022 13:49:15 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e749:b020:2cdb:af31? ([2001:8b0:aba:5f3c:e749:b020:2cdb:af31])
        by smtp.gmail.com with ESMTPSA id y1-20020adfd081000000b002421a8f4fa6sm13860129wrh.92.2022.12.20.13.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 13:49:15 -0800 (PST)
Message-ID: <5132a777cff0cefe9ccc04c74ae7272aa3263240.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/4][dunfell] linux-yocto/5.4: update to
 v5.4.228
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Steve Sakoman
 <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 20 Dec 2022 21:49:14 +0000
In-Reply-To: <CADkTA4NvfML8HQ_K03OknW44hi3NG5MW+kHj3wCM_-44dCKxcA@mail.gmail.com>
References: <20221219174146.64696-1-bruce.ashfield@gmail.com>
	 <20221219174146.64696-4-bruce.ashfield@gmail.com>
	 <CAOSpxdbQ9SaCmMJddnFTyX3Z7p+seZO9vtGjYcDNUPSAWQOhzQ@mail.gmail.com>
	 <CADkTA4NFev8Kxy_Eu5rUYt6zMwfb+smyCcH7RzZLC-zAmOA2Tg@mail.gmail.com>
	 <CAOSpxdbjEq0PyuSgu+RrZ7bhb+Pf=oTZv33F_EL+ou11DFk5sA@mail.gmail.com>
	 <CADkTA4NvfML8HQ_K03OknW44hi3NG5MW+kHj3wCM_-44dCKxcA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 21:49:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174885

On Tue, 2022-12-20 at 13:50 -0500, Bruce Ashfield wrote:
> On Tue, Dec 20, 2022 at 1:48 PM Steve Sakoman <steve@sakoman.com> wrote:
> >=20
> > On Tue, Dec 20, 2022 at 4:46 AM Bruce Ashfield <bruce.ashfield@gmail.co=
m> wrote:
> > >=20
> > > On Tue, Dec 20, 2022 at 9:27 AM Steve Sakoman <steve@sakoman.com> wro=
te:
> > > >=20
> > > > On Mon, Dec 19, 2022 at 7:41 AM <bruce.ashfield@gmail.com> wrote:
> > > > >=20
> > > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > >=20
> > > > > Updating  to the latest korg -stable release that comprises
> > > > > the following commits:
> > > > >=20
> > > > > [...]
> > > > > -SRCREV_machine_qemuarm ?=3D "13d88d2fc15f1edfa91378bc3a76aa42749=
69ed8"
> > > > > -SRCREV_machine_qemuarm64 ?=3D "14d0e6d0baf0c7b2308ff1270bd706f92=
7c72df4"
> > > > > -SRCREV_machine_qemumips ?=3D "11472a4308590f1858d1ba7bb03bdc25cd=
2c9b3f"
> > > > > -SRCREV_machine_qemuppc ?=3D "daf1282f1c6fd653fcae25e8d1d49540a93=
2baeb"
> > > > > -SRCREV_machine_qemuriscv64 ?=3D "15231fe2f4542b044e279e53269ee50=
6bced9988"
> > > > > -SRCREV_machine_qemux86 ?=3D "15231fe2f4542b044e279e53269ee506bce=
d9988"
> > > > > -SRCREV_machine_qemux86-64 ?=3D "15231fe2f4542b044e279e53269ee506=
bced9988"
> > > > > -SRCREV_machine_qemumips64 ?=3D "31f08b9f81298e80e00ea37886db6f88=
092a5cf6"
> > > > > -SRCREV_machine ?=3D "15231fe2f4542b044e279e53269ee506bced9988"
> > > > > -SRCREV_meta ?=3D "3e7ca0fe77707fabb1beefd5d3cd322a4db1eb41"
> > > > > +SRCREV_machine_qemuarm ?=3D "32654a547b05ba63c604503fc865d7052ae=
96992"
> > > > > +SRCREV_machine_qemuarm64 ?=3D "2bd8ca7c0973870753b103107513689a5=
98383d7"
> > > > > +SRCREV_machine_qemumips ?=3D "84a8ba0ada556ba3307c33e2b5a0ca8f9e=
3df1dd"
> > > > > +SRCREV_machine_qemuppc ?=3D "20db90d7935c8760bfc68c0de4f7d7085cb=
a7c14"
> > > > > +SRCREV_machine_qemuriscv64 ?=3D "921d9e22542506ba26c2e5e2f25ec00=
ff9bffa63"
> > > > > +SRCREV_machine_qemux86 ?=3D "921d9e22542506ba26c2e5e2f25ec00ff9b=
ffa63"
> > > > > +SRCREV_machine_qemux86-64 ?=3D "921d9e22542506ba26c2e5e2f25ec00f=
f9bffa63"
> > > >=20
> > > > I suspect you forgot to push this final change set to the linux-yoc=
to repo!
> > >=20
> > > Hmm. nope. Everything is pushed, disregard the updates, I'll have
> > > another look at it the second week of January.
> >=20
> > It wasn't there earlier this morning when I sent the email, but now it
> > has magically appeared!
> >=20
> > So nothing for you to do at this point.  I've restarted the build and
> > will let you know if I run into any other issues.
>=20
> odd. I was pushing some 6.1 changes, but git didn't report anything comin=
g
> from the 5.4 branches.
>=20
> Fingers crossed that my script updates to the SRCREVs and what is there
> now are a match!

FWIW it takes time for the revisions to mirror from the push server to
the other public git servers. For the kernel it probably takes longer.

I think these builds with "missing" revisions and the older fetcher in
dunfell caused some kernel mirror tarballs to get deleted and broke the
esdk kernel module tests in my build. That shouldn't happen but somehow
seemed to :/.

Cheers,

Richard

