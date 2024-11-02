Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC1CE677F6
	for <webhook@archiver.kernel.org>; Sat,  2 Nov 2024 09:23:18 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.13923.1730539389066545926
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Nov 2024 02:23:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VcHw7p+V;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4314fa33a35so20613995e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Nov 2024 02:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730539387; x=1731144187; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Go5clIDu3Y2xdzdX0wkvXsO3a9ht/P/tb7qtCHNGw2s=;
        b=VcHw7p+VF7RfzHF6BxlE4+p6zHtOVwJ9LmGqIVK9u0kJD+6vWUS3J5FgpJGghAbBKI
         mnk1X5ArDq9rpsYmFdYVtqgH6IybYkhB92+S/ST2DQ6so4+OVNt9V3X7dffkdKXh7RRk
         JkeLAxmJBWylpLrbJ7odWvUg0datN+KELQah4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730539387; x=1731144187;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Go5clIDu3Y2xdzdX0wkvXsO3a9ht/P/tb7qtCHNGw2s=;
        b=N1K4oZXboYtPT+j+mvGigJgeq1PI6O4RA13+nEDyWNj7QshGu4V6i9Fy/IX36+f1s5
         m+URHxlyr6Eknm81NH1IGdd4hgnI1HeY+NYSCg6Yi4w/f84DM6OeUzSvGpnFo6OcM2fc
         MHb+QOEcS0gug9NpGMdfBBILkkXcjb+wxLG8WVxjnEoitr+CG6oHsUMotG5hz9/PjVhT
         qR5V288eKLOpIpCPQ5sLWHRx1YiOrVh4hWuVg1AEXlmsC3ev4N2aWMTD6ZlHdne4Zf3Y
         e4elXzsc2ogXUhtpiIXhvXywWF6vqZrYpin6gbarVtvchNy7k+MqdK/F2DEEY97FPNK6
         FCuw==
X-Gm-Message-State: AOJu0YzjSWwsQ06XPIQdnRToYJ8q9FkE88Tu9Eii/COAuUuOl4gZo1aI
	KJBduqK8F41rlLHqOO1qm1Xh/0ak83xp6Jx+lmqG2qb+XdHfj3zULCg2Mwc55rI=
X-Google-Smtp-Source: AGHT+IGVzuTIjTCaU9pk4B7dv0eRuOlxvPyH78QjvubG93NJvVhXza+55SdIt8jyc2KySDJrsJ+MlA==
X-Received: by 2002:a05:600c:3547:b0:42c:b16e:7a22 with SMTP id 5b1f17b1804b1-431bb9855c0mr122433665e9.12.1730539387262;
        Sat, 02 Nov 2024 02:23:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fdce:c4d:9295:5245? ([2001:8b0:aba:5f3c:fdce:c4d:9295:5245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d698055sm88562295e9.40.2024.11.02.02.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 02:23:06 -0700 (PDT)
Message-ID: <1a87ce686c05f97ab77fe19c658a6882a8dbd48c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] devtool: modify: add DEVTOOL_PREFER_BRANCH
 support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, "chris.laplante@agilent.com"
	 <chris.laplante@agilent.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Sat, 02 Nov 2024 09:23:06 +0000
In-Reply-To: <CANNYZj8rn3ocAAbCRYF-YKea8=DtVjcUv3vU+wbpCskzQ3JC=Q@mail.gmail.com>
References: <20241101193811.2068211-1-chris.laplante@agilent.com>
	 <CANNYZj-_8+EH51Nk2tj+o7a2PpscSO2bi8e-ak8g5fnUhADULg@mail.gmail.com>
	 <DM8PR12MB5430BF49467783C0051229C68B562@DM8PR12MB5430.namprd12.prod.outlook.com>
	 <DM8PR12MB54306736B03571231E94A9498B562@DM8PR12MB5430.namprd12.prod.outlook.com>
	 <CANNYZj8rn3ocAAbCRYF-YKea8=DtVjcUv3vU+wbpCskzQ3JC=Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Nov 2024 09:23:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206651

On Sat, 2024-11-02 at 10:14 +0100, Alexander Kanavin via
lists.openembedded.org wrote:
> On Sat, 2 Nov 2024 at 00:15, chris.laplante@agilent.com
> <chris.laplante@agilent.com> wrote:
>=20
> > > I just tested 'devtool finish' and 'devtool update-recipe', and
> > > both are broken
> > > (not by this patch) for recipes with SRCREV =3D "${AUTOREV}" in
> > > general. So I
> > > wonder if devtool needs to be taught to handle recipes using
> > > AUTOREV. In
> > > which case, perhaps it should just automatically do the
> > > "DEVTOOL_PREFER_BRANCH" behavior...
> >=20
> > Thinking a little bit more about this, I think I just want 'finish'
> > and 'update-recipe' to be mostly no-op in this case. When I'm
> > developing a recipe under devtool that uses DEVTOOL_PREFER_BRANCH
> > and SRCREV =3D "${AUTOREV}", I'm just using it for the edit-compile-
> > test cycle using 'devtool build' and 'devtool deploy-target'. The
> > only helpful thing I could foresee 'finish' or 'update-recipe'
> > doing is maybe slap my hand if I have commits that I forgot to
> > push. Otherwise, those subcommands are not useful here.
> >=20
> > Even if we take DEVTOOL_PREFER_BRANCH out of the equation, I think
> > that's also true for a recipe that just uses SRCREV =3D "${AUTOREV}".
>=20
> I was also wondering if this new variable is really needed. Perhaps
> devtool should just do the logical thing automatically when it sees
> AUTOREV.

I'd note that you can use AUTOREV and have local patches or local files
so I think we do need to support that use case.

We probably need two things, firstly to make AUTOREV work properly with
devtool and secondly a way to disable the branch changes. That would
presumably error if SRC_URI wasn't just a single SCM url.

Our devtool testsuite is quite comprehensive so I'd ask that any
changes do have appropriate test cases (oe-selftest -r devtool).

Cheers,

Richard


