Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E632C83F1B
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 17:41:10 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.1197.1752169260233401676
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jul 2025 10:41:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bLPQ/n3J;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-70e77831d68so13737607b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 10:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752169259; x=1752774059; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUoHRsInCsAVszs4itQaSkweJoFx4nJzb6jXiQ+aJxk=;
        b=bLPQ/n3JCEWhg3irZynjkakL1pk2GKUGw5fQp9fQoAt/FiWOD1f8uTxn7wMpoFoJkC
         TAtqdiQm3hFko7iT0nvG6cnzcO5QffdRiI9UM2sln07Ft5q1sWOQxsy2CBCyxeYfDCts
         OMhSQsi6w4tMEswsQh+ZcoHWJ+KeXxqLPoZZTgsnpnNOl9Qbwv7u5HVMbV/UNYhIOX90
         Ja3OuNSWvoBn/pQContOJIvTdZr5Muqnn5QnXRDi8UH91V5uF0FeIA29Qe3CbiKFSQzq
         0/CCmjzB2xqSxdDrLLyTzQgO5Nnlq9XT3Crodj7HYYJPAi7vDKvCHiisgiPfGWXMN7uQ
         GI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169259; x=1752774059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JUoHRsInCsAVszs4itQaSkweJoFx4nJzb6jXiQ+aJxk=;
        b=YMOlpoBiyYI7rGEpN11lIolHpL7gE/uEg8VsJsmvqouTPXGjez/2sij7eIT/CRuabS
         orVTvTKGmk76oLJzugMd8MZFFU7oASWtnMLZRgj9xmQB4RqHoppn9NJspBJ7EBQkeI2I
         ndf00UVXd1NT2AxVQ4rZtPvlZoBu2QTsyLIahmiTv4oAULauI/juF1mTmzWx6heKsi7O
         izJ4GKuZdKrcl2LoH7jkFEF2dG6tk6EFYqzMyCcGFESESEyxdlE5mhXL4SP9pJb1W+PT
         KnXXIgnYJX7q9vTIE6NLGwMeqYrRsue+Qkh/CiOZKCMbrOlUwS13ej0D1ZMv20vvDKvJ
         AK0g==
X-Gm-Message-State: AOJu0YxvQKMKZ/4UlD7MmI4Tdkwkhwme7Cbo6IjmuhaGSi9cD86Sh7ll
	TgdJ76GYTHjQ4d7pfq+kQ5AdJ3GDWD7kiP90fQTOzfjzES3tJpBQvLgSXToVZ3gwxi3r2nJPQYF
	2jh4rSA93937poxncQCGa/j40iKTus8r/74dLnTM=
X-Gm-Gg: ASbGncuzucAbI8SauPiJeZzTco2pZ9boccL8x1T7NBYJQ3roYSVJfHog+OztohF/WKt
	hR5qKH1b3ZXq+oW9NVOV6gM2tZRn4ModzxshcL1mjx8x3pc1tsz0su1/AeXLRYYxex5pBVFGf/F
	TfABzOUUX22ZRvABP72pB7bqcOWg8pYqVCg/dtT8B/v9tVUVDoSxc4YfqqLaB9SVTybVETFkHBg
	e0lBiA=
X-Google-Smtp-Source: AGHT+IH0i/853SgJFKMKahaJ2nZh2pvdZl7kZceQ0Cj84Gme6sR7eQcX/lSPdg/eNFWp0qdNoguvwDosX0rmbEerPNg=
X-Received: by 2002:a05:690c:c9e:b0:70f:83ef:ddff with SMTP id
 00721157ae682-717d5ded60emr7458397b3.30.1752169259225; Thu, 10 Jul 2025
 10:40:59 -0700 (PDT)
MIME-Version: 1.0
References: <DB3PR09MB62022D923A65D95B35ADAF69EA4EA@DB3PR09MB6202.eurprd09.prod.outlook.com>
 <8340.1751980391085408362@lists.openembedded.org> <DB3PR09MB6202D15953E63F9683D3A14EEA48A@DB3PR09MB6202.eurprd09.prod.outlook.com>
In-Reply-To: <DB3PR09MB6202D15953E63F9683D3A14EEA48A@DB3PR09MB6202.eurprd09.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Jul 2025 10:40:31 -0700
X-Gm-Features: Ac12FXyYtY_FxHnUoYTAWiomP9K4K5s64vEMu5cJpFapsKOoVr-U2W-CkAvM8ig
Message-ID: <CAMKF1spsAzE8MKQeemmi2Gs5PTSB4-KfdkRNo8P7KAUhbF1Znw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 0/7] cmake: Major version bump to 4.0.3
To: "Haase Moritz, JD-62" <Moritz.Haase@bmw.de>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"alperyasinak1@gmail.com" <alperyasinak1@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 17:41:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220127

On Wed, Jul 9, 2025 at 11:34=E2=80=AFPM Haase Moritz, JD-62 <Moritz.Haase@b=
mw.de> wrote:
>
> Hi,
>
> > I also considered the idea of temporarily using
> > -DCMAKE_POLICY_VERSION_MINIMUM=3D3.5 to quickly work around the CMake 4=
 issues
> > across multiple recipes. Then, I thought that directly upgrading recipe=
s where
> > the upstream version could be updated was more sustainable solution. I
> > believed this would resolve many compatibility issues by relying on ups=
tream
> > fixes and encourage the community to use the latest versions.
> >
> > [...]
>
> I totally agree. Updating should be the preferred approach, followed by p=
atching
> and the policy workaround.
>
> > Before our conversation I made a few things and sent them to meta-opene=
mbedded
> > and Khem accepted them to master-next, but I still had the feeling that=
 maybe
> > something better could be done.
>
> Awesome, thanks!
>
> > As I said, I have the feeling that it can be done better, so I will wai=
t for
> > your answers before I do anything.
>
> How about splitting the remaining build failures in half (after sorting t=
hem
> alphabetically by recipe name?). Would start working on the *second* half=
 then.
> In case of dependency issues we can sync here.
>
> @Khem: Would you mind sharing a link to the failures of the latest 'maste=
r-next'
> build?
>

Alper has sent a set of fixes which lowered the volume quite a bit,
Thanks a lot Alper !. it's down to 52 now.
here is latest qemuarm run

https://errors.yoctoproject.org/Errors/Build/211141/?limit=3D100


> Moritz
>

