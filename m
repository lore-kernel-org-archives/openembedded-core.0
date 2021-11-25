Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C10C433EF
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 17:24:39 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web12.14696.1637861077969154668
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 09:24:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CLOC+vvS;
 spf=pass (domain: gmail.com, ip: 209.85.222.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id b67so12346515qkg.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 09:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1EYOehhvsawXpRm96mHbh2SHa46ar2ZMcai709FNOC0=;
        b=CLOC+vvS82886OZZNBRRSpcgbi6G5Wf5aqkPoHcVYNMp1HUHw8FhIWpEpgGCneb1qp
         /f4FFObnna0Iq4F+hrTqVvUQSsE4gXu1E5h96WFOeC8LWG0MTxGXhdOlblM/Dk+WeVh1
         0tK/oX6IbFAmqs/RKvFkgD5xJzyojSvD7XQU7HyCveo+7hbxX2UTM/Y2bLX/6u8JN5xb
         0dkqLvN2F1vsJZlocJrN64R+2E/TPfMPCGGluhxyE9IVWTtm+hPQgq/lN4gdQLPFuKrl
         +qwWuiEyqj/cTQd5+jovQgqHuuYoxFZZYbeQPYZTB/Y70YJYNHK4GAxCmQxq156Ywj9Y
         W9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1EYOehhvsawXpRm96mHbh2SHa46ar2ZMcai709FNOC0=;
        b=Ag6SfPi4Y+0K6dly+Wj2LvxeRSKbKIy1oTR4y0SKAMg23g1VzHHlHSIyozm3uPGbzC
         mFVyFhO7FrmoFuoZKS/uvwRSKPltkFUPSVHCyBm0DHRMCAkVkWMS28ssOv5ZVJwhIU3s
         zk4xOaVA+n61/AfxaEphdLeZosA/0btQ56U0TCnLG7wQ8ILiy2l6d2IU7avAR5taSeqM
         GyNl/2sqLcYB3BUgjOY0auRZw/Zb1UOuz1Fxz+mcKP7aJrUle0UiAqIIpHXFYcQrhYIa
         uxFuz/302E/MfjxjXGMPLn5toDTRexrk4wQPJ7n1n4eXmqNFkjfqUbY+RYyQSM8X0xA8
         yaAQ==
X-Gm-Message-State: AOAM532I1zNT1aW1iCPdNKWXC20itOvoM+Eq1YO6+tv27I3HFxu1ERgf
	E29/KjItVVsruu9CjQSFvSRkmBah5UI698/3JGo=
X-Google-Smtp-Source: 
 ABdhPJzKMnDqyd1cTl+Dq9J6AaRfEp8XtbC5lM5cGEL24shmPbtiEg/4FRxZk6thTU7NAjbCenlWeCaurSf8R176fEk=
X-Received: by 2002:a05:620a:f94:: with SMTP id
 b20mr16885176qkn.463.1637861076993;
 Thu, 25 Nov 2021 09:24:36 -0800 (PST)
MIME-Version: 1.0
References: <20211124080828.530981-1-alex@linutronix.de>
 <20211124080828.530981-16-alex@linutronix.de>
 <CAMKF1sozMYfMSMS77dnQh8mwNOGP4ybVALBpVgBN82jOZZsh_g@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sozMYfMSMS77dnQh8mwNOGP4ybVALBpVgBN82jOZZsh_g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 25 Nov 2021 09:24:11 -0800
Message-ID: 
 <CAMKF1sqwj0wqJEPu9c2PAn=GgMd+eRi3fPT72yft6Sia6-Ohng@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 16/21] cmake: update 3.21.4 -> 3.22.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Nov 2021 17:24:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158788

On Wed, Nov 24, 2021 at 12:30 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> This is breaking llvm/libcxx
>
> https://errors.yoctoproject.org/Errors/Details/617887/
>

I have made a workaround for meta-clang here [1]
which gets me through but it's perhaps worth noting for rootcausing
with upstream cmake.

[1] https://github.com/kraj/meta-clang/pull/533

> On Wed, Nov 24, 2021 at 12:08 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  .../cmake/{cmake-native_3.21.4.bb => cmake-native_3.22.0.bb}    | 0
> >  meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
> >  .../recipes-devtools/cmake/{cmake_3.21.4.bb => cmake_3.22.0.bb} | 0
> >  3 files changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-devtools/cmake/{cmake-native_3.21.4.bb => cmake-native_3.22.0.bb} (100%)
> >  rename meta/recipes-devtools/cmake/{cmake_3.21.4.bb => cmake_3.22.0.bb} (100%)
> >
> > diff --git a/meta/recipes-devtools/cmake/cmake-native_3.21.4.bb b/meta/recipes-devtools/cmake/cmake-native_3.22.0.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/cmake/cmake-native_3.21.4.bb
> > rename to meta/recipes-devtools/cmake/cmake-native_3.22.0.bb
> > diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
> > index 8b1b0db30d..2cd8193d6f 100644
> > --- a/meta/recipes-devtools/cmake/cmake.inc
> > +++ b/meta/recipes-devtools/cmake/cmake.inc
> > @@ -21,7 +21,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
> >             file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
> >  "
> >
> > -SRC_URI[sha256sum] = "d9570a95c215f4c9886dd0f0564ca4ef8d18c30750f157238ea12669c2985978"
> > +SRC_URI[sha256sum] = "998c7ba34778d2dfdb3df8a695469e24b11e2bfa21fbe41b361a3f45e1c9345e"
> >
> >  UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
> >
> > diff --git a/meta/recipes-devtools/cmake/cmake_3.21.4.bb b/meta/recipes-devtools/cmake/cmake_3.22.0.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/cmake/cmake_3.21.4.bb
> > rename to meta/recipes-devtools/cmake/cmake_3.22.0.bb
> > --
> > 2.20.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#158672): https://lists.openembedded.org/g/openembedded-core/message/158672
> > Mute This Topic: https://lists.openembedded.org/mt/87277248/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

