Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28D2DC54E58
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 18:18:20 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.14654.1711217893715438895
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Mar 2024 11:18:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lEu7eygq;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-21e45ece781so1954536fac.0
        for <openembedded-core@lists.openembedded.org>; Sat, 23 Mar 2024 11:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711217893; x=1711822693; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yhiLvLdKmhH67IPDvUsNnlF20SQULzJtlGMNyLBYrk=;
        b=lEu7eygqtSa7tDHZZCsZlPbUEPMU5wl2utduke5YETdXOvpVaH0XUYleBMlXJjo2NR
         ZQOD9MQ9NrUpXoc5VhO0E6e1UqWOciMH/5FSXyOzQjMo4GCWklVu8kZMikNQ593b1SY7
         7z9zJVJWdVr31cNkwjZ2kFYOOdO6O7DTNfZforRzqLDnmxy2NBjor5jHY3xz0KcQc3dp
         l7OxUa+FtznxNIlF5pILqEyQYyE2kgUFYx0d+NMM83vtn2w9rKQ34ui2O9Bsty08fJ3N
         s20lNOQt1lmbuBuStYB53Yr00p2m4CGJLGvfgTcTCPDHfGWchXaYGBPNkC+/Qv7Kmwsu
         b1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711217893; x=1711822693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9yhiLvLdKmhH67IPDvUsNnlF20SQULzJtlGMNyLBYrk=;
        b=Lu+7S5Z5zkR7rAWLxhYqPt/i/g20MtsER9jeqmBV618dBwsAelnMLz1pb1+34IkXlv
         OfULSdo5KGFMFbfmwsney/6hjNVpculGbx1AigPZW8nS3OuTPy4BAV/OD37zZS2Kq9wc
         rZLlfBs+LqE/kwfF8j7Qzqql0loKif7RLKEPuBk+RLVbHrNIhLCTpUoimLGMD7za0SSn
         uu/QuDNeX2u45mtVxZrwLRuHzl9xKopbpALk+TMfM/QQVAyn1Yilp1qxFNKDexxCBsFX
         C130AH26JNupyreMaAvODf9VAluawgMXgZgY9/VntMYZYiuan+CK2d4h9BvG7tPqCAyL
         MXMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAYdRFAPzelNCFAfkzqpcoiWPiji+NrVXljw/vPeQ1/0L9ado9uxu+KfNXXlfuJ2ejxQm/mSANrgGrh0iAnHmK2LrBL182LgYDcMu1EQAh9TeTTss8mPy7
X-Gm-Message-State: AOJu0Yxyt4y1bgZ6Rowp9j90RS9lYWJU05Pu3sHGfBxGEzddIUeLP1iI
	Ne8HH/Wf/LRg2/5zTRbZ6ZRvVQJ9Rxk5CKxC2DvB1HpaYnZJGlfjDUUcszWa+N9w9WoFfpzmDoG
	bObOUMC3q6f7dTnJL135ofInFUS0=
X-Google-Smtp-Source: AGHT+IE0ua8e/ksbnaHPOaHOIRt4g080AaN9zriI/B2YCW5ZwnHI3AJuu2DNM7wtiAsLSQuEZwXFbwxwct55isj6QT4=
X-Received: by 2002:a05:6871:c80f:b0:220:6edc:1fd7 with SMTP id
 dd15-20020a056871c80f00b002206edc1fd7mr2443948oac.1.1711217892966; Sat, 23
 Mar 2024 11:18:12 -0700 (PDT)
MIME-Version: 1.0
References: <28d65e80-cba-d930-736a-c55c3b9dc8d@crashcourse.ca>
 <CANNYZj_U7AXtWd88nqvzr9ABvw2qZWZ5sL1ypXkCA+2faG1RQg@mail.gmail.com> <f4bd7649-611-7223-6e38-1a251691e241@crashcourse.ca>
In-Reply-To: <f4bd7649-611-7223-6e38-1a251691e241@crashcourse.ca>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 23 Mar 2024 11:17:46 -0700
Message-ID: <CAMKF1sq9fzQxBjvUtoT0b=ANe9zvO=-xS_=DZQo03fiFGdx4aw@mail.gmail.com>
Subject: Re: [OE-core] is there any reason to use .ipk packaging if devs are
 using ubuntu?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Mar 2024 18:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197465

On Sat, Mar 23, 2024 at 10:34=E2=80=AFAM Robert P. J. Day <rpjday@crashcour=
se.ca> wrote:
>
> On Sat, 23 Mar 2024, Alexander Kanavin wrote:
>
> > Packaging format of the host distribution and packaging format used
> > by yocto have no relation even if there is package management on
> > real targets. Why is there an assumption that matching them is going
> > to help something?
> >
> > If anything, making them match might prompt misguided attempts to
> > install Ubuntu packages in yocto systems and frustration at not
> > being able to make it work.
>
>   all of this being accurate, the one advantage i can see is that, if
> developers are familiar with deb package management on their ubuntu
> dev systems, then they would be familiar with having package
> management on their target systems (provided, as you say, they
> understand that they should work only with YP-generated packages).
>

while ipk/deb/rpm are well supported in OE, rpm is defaults for poky refere=
nce
distribution and ipk is default for nodistro if you were to use just oe-cor=
e, on
yocto autobuilders, defaults poky configurations are tested extensively, so=
 you
might find a bit of better help if something goes wrong with rpm and
its reproducible
on AB or indirectly you may build upon the testing that's happening on AB i=
f you
used rpm, having said that YP AB is also starting to test ipk backend and w=
e
did figure out a nasty lock/race condition in opkg, which has always been t=
here
so such issues would be less although not down to zero for you if you used =
more
tested profiles.

downside is as Alex mentioned, construing yocto rpms/debs to be valid
for other hosts
using same packaging backends, that's going to be a constant battle to
keep your team
to be taught as new folks come on board etc.

If your workflows do involve package managers, then opkg is definitely
lightweight and
easier setup for dev work.

> rday
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197461): https://lists.openembedded.org/g/openembedde=
d-core/message/197461
> Mute This Topic: https://lists.openembedded.org/mt/105106419/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

