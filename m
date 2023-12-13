Return-Path: <jonathan@joggee.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C13C4167D
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 15:05:53 +0000 (UTC)
Received: from 2.mo560.mail-out.ovh.net (2.mo560.mail-out.ovh.net [188.165.53.149])
 by mx.groups.io with SMTP id smtpd.web10.38383.1702479948275393477
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 07:05:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: joggee.fr, ip: 188.165.53.149, mailfrom: jonathan@joggee.fr)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.148.126])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id D1A5E2BDF9
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 15:05:45 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-n64sf (unknown [10.110.96.89])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 4A3E71FD69
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 15:05:45 +0000 (UTC)
Received: from joggee.fr ([37.59.142.105])
	by ghost-submission-6684bf9d7b-n64sf with ESMTPSA
	id HuC9AknIeWX1+AAABCTI8w
	(envelope-from <jonathan@joggee.fr>)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 15:05:45 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-105G006f686e161-2ca8-4b09-ae35-ac5e44d9dbbf,
                    8AE51020AAF3E055EAEAC9529530B6D231DC969C) smtp.auth=jonathan@joggee.fr
X-OVh-ClientIp: 209.85.160.51
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-20335dcec64so140877fac.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 07:05:44 -0800 (PST)
X-Gm-Message-State: AOJu0Yyb5sdZUp3PjFs4ofBVAAC6H8G29Vzg/g1f4r6/vEriMDbb4P20
	sUCipW5aetnZOmE5nlYNFJYu58gC9V1twDx6584=
X-Google-Smtp-Source: AGHT+IHtTMk1LJeKGvXII7fsI5DCRnAS9X8aV16jxYHQmuHjxN0ZYBI2NTJwcioU5qVGvX9KFz9ZyGw6owJeLf6Ur0U=
X-Received: by 2002:a05:6870:b69d:b0:1fb:75a:6d47 with SMTP id
 cy29-20020a056870b69d00b001fb075a6d47mr9760822oab.110.1702479941654; Wed, 13
 Dec 2023 07:05:41 -0800 (PST)
MIME-Version: 1.0
References: <CXN9OZ7FYB2C.Q33EONS2A1HX@joggee.fr> <06b5a060-5097-4e2d-afca-13af1c849e72@smile.fr>
In-Reply-To: <06b5a060-5097-4e2d-afca-13af1c849e72@smile.fr>
From: Jonathan GUILLOT <jonathan@joggee.fr>
Date: Wed, 13 Dec 2023 16:05:12 +0100
X-Gmail-Original-Message-ID: <CAA_hxbRmmVvHXgVSfF9PbGahYtM0ReTzHyC6i8Rc14fMzxTUoQ@mail.gmail.com>
Message-ID: <CAA_hxbRmmVvHXgVSfF9PbGahYtM0ReTzHyC6i8Rc14fMzxTUoQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/3] Hi,
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 14432066483135450235
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudeljedguddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepgghfjgfhfffkuffvvegtgfesthhqredttddtjeenucfhrhhomheplfhonhgrthhhrghnucfifgfknffnqffvuceojhhonhgrthhhrghnsehjohhgghgvvgdrfhhrqeenucggtffrrghtthgvrhhnpefgueektdevhfefgeehieekieeufefhudejhfetudeltedugffftdejgfeuvdelffenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdhophgvnhgvmhgsvgguuggvugdrohhrghenucfkphepuddvjedrtddrtddruddpvddtledrkeehrdduiedtrdehuddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhnrghthhgrnhesjhhoghhgvggvrdhfrheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehiedtpdhmohguvgepshhmthhpohhuth
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 15:05:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192298

Thanks Yoann,
I will resubmit these patches with your suggestions.

Le mer. 13 d=C3=A9c. 2023 =C3=A0 15:47, Yoann Congal <yoann.congal@smile.fr=
> a =C3=A9crit :
>
> Hi Jonathan,
>
> Le 13/12/2023 =C3=A0 15:15, Jonathan GUILLOT a =C3=A9crit :
> > Just playing with cups and observe the main packages includes localized=
 HTML templates in /usr/share/cups/templates. Locale packages were only loo=
king for files in /usr/locale. This serie of patches allows to add extra di=
rectories to be scanned.
> > For a next patch, I would also like possible FILES:${PN}-locale-* varia=
bles defined in recipe not to be overriden by the split_locales() function.
> >
> > It is my first patch proposal on this project. Thanks in advance for yo=
ur feedbacks.
>
> First, welcome! (If I'm not mistaken, we did work together some time ago =
:) )
>
> Rapidly glancing at your patches, I noticed they miss the "Signed-off-by:=
" tag.
> Try to follow instructions at https://docs.yoctoproject.org/dev/contribut=
or-guide/submit-changes.html#implement-and-commit-changes.
> Basically, you'll need to rebase your commits and using "git commit --ame=
nd -s".
>
> Another thing, the subject of your coverletter mail is "Hi," (you may wan=
t to use a subject that provide some info on the content of your series)
>
> Regards,
>
> > Regards,
> > Jonathan GUILLOT
> >
> > Jonathan GUILLOT (3):
> >   lib/oe/package: replace in place PN-locale-* packages in PACKAGES
> >   lib/oe/package: add LOCALEEXTRADIRS to define extra locations for
> >     locales
> >   cups: use LOCALEEXTRADIRS to split localized HTML templates
> >
> >  meta/lib/oe/package.py              | 33 ++++++++++++++++++++++-------
> >  meta/recipes-extended/cups/cups.inc |  2 ++
> >  2 files changed, 27 insertions(+), 8 deletions(-)
> >
> >
> > base-commit: 564339afb73fc52a66c1a08437587cad1c4d46e7
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#192292): https://lists.openembedded.org/g/openembed=
ded-core/message/192292
> > Mute This Topic: https://lists.openembedded.org/mt/103149509/4316185
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
yoann.congal@smile.fr]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
> --
> Yoann Congal
> Smile ECS - Tech Expert

