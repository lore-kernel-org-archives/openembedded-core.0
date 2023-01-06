Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2519C3DA7A
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 11:10:59 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.11246.1673003458564333652
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 03:10:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WSrCCB/P;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id z16so982123wrw.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 03:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CTJD5vrWKOBBHlb5YUzrgYMAT2w1I8xDHPr1swwzEAY=;
        b=WSrCCB/P78b1uF7xls8HA7ol5cnTKWr8Jua1A/RntvK0uwafjxtNIpnjBk2UA0HWvA
         TH6E7ZBaBOyQCdoY+OsuP2C5vvwS7sAiQNlp26//zXMSlCUEDfUiuxdybyyno9GnNqR+
         XL8uRGosmh4jEBGsF3l9gqdlk+uhQZ8Fc8Lkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CTJD5vrWKOBBHlb5YUzrgYMAT2w1I8xDHPr1swwzEAY=;
        b=m4X5/cnznsYk07Z2LJ1/Y0CyOw65vu6EkQXgnj5jJv3AVi5KEy14JWNY+K2ga3Xa9E
         RVkOMPOmepuyoj6kslw4zGmlbabNlWsVWCvzupM2SSJN0TRW9GBwesRXyUMBeXb39hwj
         7JcunGqqlL0ZGEYypqpmfe7frzkklAlCYP+hEaFFeFlm/Kr0GrTe9xNENmPDF5vuf9zT
         4x/LM3IjdPrBF/vy77sZFmJHRn5ml1bLc0e+IUCVVyZ5DNkjl1OYvUUQ81KHFr5uK5rs
         cZjFUyWEzaGuqC/VDTwZqnYPtScw07QrHzb67I6ucC2ZHJtZEUKKeccG70/l7fjhZjAY
         k4fg==
X-Gm-Message-State: AFqh2kqVUI1oRS8qjb/eVH9jJJJ5IUrRnxlzg+qiK58MC96W9+PHJghB
	7j2KFCDuFmNPYay+zkqwv2VHTw==
X-Google-Smtp-Source: AMrXdXsxo08l8LvjwKdXRHF9sJnvmoKnCFW00uQHGHck/9EqhJdWGaWf3tgF0PcnRV40LZU6UyzhEw==
X-Received: by 2002:adf:ef85:0:b0:2ba:1fdb:6135 with SMTP id d5-20020adfef85000000b002ba1fdb6135mr1472005wro.4.1673003456914;
        Fri, 06 Jan 2023 03:10:56 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:49cf:c46d:e32d:e951? ([2001:8b0:aba:5f3c:49cf:c46d:e32d:e951])
        by smtp.gmail.com with ESMTPSA id t19-20020a0560001a5300b002362f6fcaf5sm866040wry.48.2023.01.06.03.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 03:10:56 -0800 (PST)
Message-ID: <2d7e595d1edaf0a2ba3028b706354477c5e61c6c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcr: add opengl to REQUIRED_DISTRO_FEATURES
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Martin Jansa
	 <martin.jansa@gmail.com>
Cc: "Yu, Mingli" <Mingli.Yu@windriver.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 06 Jan 2023 11:10:55 +0000
In-Reply-To: <CANNYZj8Tq60ynB-xVZEnN60NDW+MmDk3fPR5HaC4VLGNgU=yow@mail.gmail.com>
References: <20221223093229.823322-1-mingli.yu@eng.windriver.com>
	 <CANNYZj-iY82hN76qV6DZSfMHobF30hM7rKRXkVwFUYGDV1AkJw@mail.gmail.com>
	 <CO1PR11MB50090C2DFF0949D0B90ED483F1FA9@CO1PR11MB5009.namprd11.prod.outlook.com>
	 <CANNYZj9GAPNapBr3PyxAmj-JaiGRV=EnR1YqZnPXA5Yuf+_02A@mail.gmail.com>
	 <CO1PR11MB5009A23CA03A78D7FB67DA2EF1FB9@CO1PR11MB5009.namprd11.prod.outlook.com>
	 <CANNYZj-BCH5XkMMcYMQSAdKSk-YGYLf5xk-pBbt6ekC6qPaa3Q@mail.gmail.com>
	 <de6ea321f2dbd0eb5b7d1fd867af7327f0bdb1a2.camel@linuxfoundation.org>
	 <CA+chaQdcQvYMVd3f5TSGprmGNMZdTRFRnk1QchaFnVpbCJZjmA@mail.gmail.com>
	 <CANNYZj8Tq60ynB-xVZEnN60NDW+MmDk3fPR5HaC4VLGNgU=yow@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 11:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175576

On Fri, 2023-01-06 at 11:58 +0100, Alexander Kanavin wrote:
> On Fri, 6 Jan 2023 at 11:47, Martin Jansa <martin.jansa@gmail.com> wrote:
> > > For example, imagine the dependency is "virtual/libc" and somehow you
> > > break the providers of it, i.e. break the glibc recipe. All of a sudd=
en
> > > "bitbake world" would return success even though it built nothing sin=
ce
> > > anything depending on virtual/libc was magically removed (which is
> > > nearly everything at some point).
> > >=20
> > > The conclusion I came too last time I thought about this was they we
> > > really did want to mark up the cases where things have a specific
> > > requirement, even if at times that is painful.
> >=20
> >=20
> > FWIW: here is the earlier (2014) discussion about this:
> > https://lore.kernel.org/all/1414675717.7649.56.camel@ted/
>=20
> Then there's a more specific question: should we treat opengl as an
> optional distro feature at all?
>=20
> We don't treat 'posix api' as a distro feature, even though
> theoretically we could, and in 2023 opengl is pretty much on the same
> level. What is being gained by ability to block it out on the distro
> level?

Most hardware is capable of running posix apis however there is a large
subset of hardware without displays that doesn't care about opengl.
There is also hardware with simple graphics that doesn't support GL, or
doesn't support it without horrible binary only stuff.

We there aren't going to make opengl mandatory any time soon.

Cheers,

Richard

