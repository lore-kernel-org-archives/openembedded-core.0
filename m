Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D3DC433EF
	for <webhook@archiver.kernel.org>; Fri, 24 Sep 2021 17:05:30 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web12.8.1632503120812644649
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 10:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Emio4xXj;
 spf=pass (domain: gmail.com, ip: 209.85.222.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id q125so14182466qkd.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 10:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XM9caZHzBZK+BZL499crkyBNwbPfK7ETE/W3Gdc5mfo=;
        b=Emio4xXjP59o9KRF6oYTMK5bBAjjZyX2YNUXRIQnB3UeNqvV4P+4O6rMG1xZxohas2
         WqC73H1IFDye7HNlKAQLLbshDT4lFOP4rYk3nZusFo0dXcuZNR53u6dg6QFYtkLYvWoe
         bKXzqcPDxZET/jpMkmTQB+2hHIctV3UwgdxmiimfzQkL6uomlzLejc6OD/WQVQsIvwLk
         6JZADDmzke3oQWy7UgfPUyjADDKWWEV/fPFWLU5zm5W/w/EGpRcHwq7YUaN1BbncnHVE
         YAuTfcaVHHLJJkC3c2+n6NkkYfFXQhN04I0gj7myZ3JPXeLoBKTHgP0EUmaANzQ4PdXG
         arNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XM9caZHzBZK+BZL499crkyBNwbPfK7ETE/W3Gdc5mfo=;
        b=z9Mq9sLWvQRlgyY8rPlCb4yT9PBpuldGmDz9NH5k3L/Bt+jHe0DpfEZLKPPItSACFb
         l19+CnaTjLzznMufjdMikdd/31XJ6vAvUlMCcQgcF9xgRos+LUhOdPUxspYIuKN76QTx
         352YEWkqYNk24IZJHAt1/qjfqhY5OpEXD3h7nLCo/y4EEjTRiDcI0M5avG9gnUFR5/wE
         xDrh8IjfW+apkOq9z09oZDaJWp/hApT42gece6qGcvEKLBaL4ZY2KldWbIo0S9bMksYO
         7zVYwKCrp1wBj8YwqZGnlxzDEbfMNSX4JicCls6W+0fA4v/vc9Uu1uZBBj9qwg9y+n3e
         cglg==
X-Gm-Message-State: AOAM530A+4Ek6X8wSDqTyfeVXmWZGOZdgFy67mk0b5T08J2n87XRrMRb
	b/zevqpDzRMGiLF12n3XaZ5N+rM9RRGc9XongIi6aS3nekQ=
X-Google-Smtp-Source: 
 ABdhPJxMyPNmx5LayLODKm2Rry0KWFKXaKsAblRqLkuTKyEJ0YT94zsD4napoMJAo8jRyPnayCFE7lqntsISQEyGqGU=
X-Received: by 2002:a37:618c:: with SMTP id
 v134mr11645862qkb.231.1632503119730;
 Fri, 24 Sep 2021 10:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <dc967621-9759-1ab4-e526-36f9010ae3c0@pr.hu>
 <a8c110ca-bc07-dfe7-329e-5a1a8247ef8b@gmail.com>
 <3017c5e9-04a7-aad5-5ca1-f57fffb5b60b@pr.hu>
In-Reply-To: <3017c5e9-04a7-aad5-5ca1-f57fffb5b60b@pr.hu>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Sep 2021 10:04:53 -0700
Message-ID: 
 <CAMKF1souaOC2oyPLrt=t+BcH2kupotD0Uhq2A2XTLHfD-fL+NA@mail.gmail.com>
Subject: Re: [OE-core] user/group XXX does not exist, using root with RPM/DNF
 packaging in Hardknott and Honister
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 17:05:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156336

On Fri, Sep 24, 2021 at 9:36 AM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbo=
szor@pr.hu> wrote:
>
> On 2021. 09. 24. 18:22, Khem Raj wrote:
> >
> >
> > On 9/24/21 7:02 AM, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n wrote:
> >> Hi,
> >>
> >> I have a special package that creates users and groups
> >> via inherit useradd. This package doesn't depend on any
> >> others but it is depended on, both via DEPENDS and RDEPENDS
> >> by packages using those users/groups in their do_install
> >> scripts.
> >>
> >> This works for packaging becase these ownerships
> >> are encoded in the packages, confirmed by rpm -qp --dump ...
> >>
> >> However, during do_rootfs, a couple of
> >> "user/group XXX does not exist, using root"
> >> messages appear for the packages depending on others
> >> creating these users/groups.
> >>
> >> log.do_rootfs shows that the package installation ordering
> >> does not follow RDEPENDS. Instead, it's practically an
> >> alphabetical order when running dnf.
> >>
> >> This doesn't just involve my custom packages, but also clamav
> >> plus another one in which I ship a small limited set of
> >> virus signatures, also chown'd to clamav and with RDEPENDS
> >> on clamav.
> >>
> >> What is the correct solution to this?
> >
> > You can define it via conf metadata e.g.
> >
> > INHERIT +=3D "extrausers"
> >
> >
> > EXTRA_USERS_PARAMS +=3D "\
> >      useradd foo; \
> >      usermod -p 'XXXX' foo; \
> >      usermod -a -G adm foo; \
> >      usermod -a -G video foo; \
> >      usermod -a -G audio foo; \
> >      usermod -a -G systemd-journal foo; \
> > "
>
> Thanks, I will try it.
> You mean local.conf or layer.conf?

local.conf or site.conf or your distro conf anyone is ok
>
> >
> >
> >>
> >> Thanks in advance,
> >> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#156334): https://lists.openembedded.org/g/openembed=
ded-core/message/156334
> > Mute This Topic: https://lists.openembedded.org/mt/85839631/3617728
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
zboszor@pr.hu]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

