Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78414C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 02:57:57 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web08.3109.1665457067782355898
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 19:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hPm43cdW;
 spf=pass (domain: gmail.com, ip: 209.85.167.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id w74so6370509oie.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 19:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vWWGUHhUBbx+tnP0VaSqWDuxdExt0dGI8+EG9YhRF9o=;
        b=hPm43cdW72+hpDIuHk8jT4+mK8u3nW8yKDsYvVKMEHSN4XAIWZ1BOA0pW3k+guSv2m
         JN67UEomZiggkko8hAC5IiIVDcjizU68ORN21iZAer9t53bwuBD1rk1AFyA1E7nOSCgY
         6lIIDhFEQTupBFAOf/dKLX5LpMmYEkrTNG1OgBNRAznDIWCFUzcuQ8ddvG2XFwjRA2K9
         jevW5I3WHydwwH0CJ5psIyVZvq+QIu0hmtccZgQn8ObOozr7Yfp7WkjsMMT3TGgGFbpA
         JbOutu5arIrfXuP9z5d5C/td6yN8ojuuB5yeaqbqnJ+vVQFkTfBxblB4nPa8RoL/Ww1h
         UoDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vWWGUHhUBbx+tnP0VaSqWDuxdExt0dGI8+EG9YhRF9o=;
        b=3TxtjcttI0Y0AEczGZ/rpIYfarF2fDCYFsVKbWfsMZOUmQ7E1/TH154oXevqOUIRPb
         I00Rdi6hVUKvZxzTC8XbVHu8Qluu2uS9NtvRArVyC559G5DYuLXQV4y8DZPdKELM+aQK
         ZJW2wsqfCkl4YouWc3zc9ONbeUXBROHa8/eRif6AKcgX5avsNB8xkCsXThpF8+FU0A7C
         PtZOw9UtSpACyZoBLtjzWkTvQ9WXdQkUtlhvhC5qCM9seIBl0u2+cvSQbzmPs69pzuzW
         ZhFXa9MjAQnRjiPDD4QD8Sn1cALR2xLarXdpLOun1FLMRN27H2cZYxtpTt/mpl0bIkif
         vVHQ==
X-Gm-Message-State: ACrzQf1paVgqJTQspjYQ9/GOsQudAPtA1oOva6NuaudT5ouuy4uYM1Xu
	MWXojy88oScGdu1E2sTXEbTO2m5fowtlxU01Q/I=
X-Google-Smtp-Source: 
 AMsMyM5vADL+l7gpU4sZDkXBbj7jpugV3enD5YEIhMdNJrUOrfCb7HZi9Jj26Txk1DZLABR3u/jMaRUWyGaOtOlXN28=
X-Received: by 2002:a05:6808:1910:b0:354:c2b:67e4 with SMTP id
 bf16-20020a056808191000b003540c2b67e4mr13323139oib.55.1665457066890; Mon, 10
 Oct 2022 19:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1664904217.git.bruce.ashfield@gmail.com>
 <ce66ad3692d01831e5f41f27702c01744a8708c5.1664904217.git.bruce.ashfield@gmail.com>
 <8757104C-1103-45EA-8CEF-43EEE0CF18F8@arm.com>
 <CADkTA4OKoeVa0VgJjEKbsoATtmQ03L28p1QVUdn0ibJ=jcoEwA@mail.gmail.com>
 <401F2D51-AB9E-4D52-84D4-E15C18D6A88A@arm.com>
 <CADkTA4MXezS7rJBJmHsMDX2EEN4nu4HCwsGc=cEDgkLhz1PZuA@mail.gmail.com>
 <402BFFEF-566A-4A10-B374-E3C3BCFFEC72@arm.com>
 <CADkTA4NsnL2CJ_wRVcwrOwSfWjuWD3gQ4esxrYaieOv1h_Bzrg@mail.gmail.com>
 <cdcb6e0a62ca48dab8e2b288f542d956@axis.com>
In-Reply-To: <cdcb6e0a62ca48dab8e2b288f542d956@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Oct 2022 19:57:20 -0700
Message-ID: 
 <CAMKF1sp29wFTm1b76xE09826nZHoBUgvDobYH9BgziHwm21Mew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] perf: make scripting depend on setuptools3
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Ross Burton <Ross.Burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 02:57:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171590

On Fri, Oct 7, 2022 at 8:00 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Bruce Ashfield
> > Sent: den 6 oktober 2022 16:02
> > To: Ross Burton <Ross.Burton@arm.com>
> > Cc: Richard Purdie <richard.purdie@linuxfoundation.org>; openembedded-
> > core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH 2/3] perf: make scripting depend on
> > setuptools3
> >
> > On Thu, Oct 6, 2022 at 9:43 AM Ross Burton <Ross.Burton@arm.com> wrote:
> > >
> > > On 6 Oct 2022, at 14:29, Bruce Ashfield <bruce.ashfield@gmail.com> wr=
ote:
> > > > I'm not particularly concerned if the extra RDEPENDS arrives with
> > > > this, since if it is acceptable for other packages inheriting the
> > > > setuptools (I thought it was build support only!), it really should=
 be
> > > > ok for perf as well. In particular since perf is debug/optional. Or=
 am
> > > > I missing something there ?
> > >
> > > With this change the base perf package will always runtime-depend on
> > > python3, even if perf-python isn=E2=80=99t installed.  That sounds su=
boptimal.
> > >
> >
> > But is triggered on the 'scripting' packageconfig, which does mean we
> > want the support, so it is at least somewhat conditional .. but yes, I
> > agree that once we've built and packaged, it does make sense to keep
> > the python dependencies in the dedicated package.
> >
> > Let me re-work this and do the remove of the RDEPENDS and send a v2.
> >
> > Bruce
> >
> > > Ross
>
> To me it sounds as what setuptools3-base.bbclass really should to is
> something like:
>
> FOOBAR ??=3D "${PN}"
> RDEPENDS:${FOOBAR}:append:class-target =3D " ${PYTHON_PN}-core"
> ...
> FILES:${FOOBAR} +=3D "${libdir}/* ${libdir}/${PYTHON_DIR}/*"
>
> so that the typical Python only recipes continue to just inherit
> setuptools3, but recipes that produce other packages than the
> Python package can do something like:
>
> FOOBAR =3D "${PYTHON_PN}-${PN}"
>
> Unfortunately this does not work as it results in a gazillion
> warnings like:
>
> WARNING: .../meta-oe/recipes-support/libiio/libiio_git.bb: Variable key F=
ILES:${PN}-${PYTHON_PN} (${PYTHON_SITEPACKAGES_DIR}) replaces original key =
FILES:libiio-python3 ( ${libdir}/* ${libdir}/${PYTHON_DIR}/*).
> WARNING: .../meta-oe/recipes-support/libiio/libiio_git.bb: Variable key R=
DEPENDS:${PN}-${PYTHON_PN} (${PN} ${PYTHON_PN}-ctypes ${PYTHON_PN}-stringol=
d ${PYTHON_PN}-core) replaces original key RDEPENDS:libiio-python3 ( ${PYTH=
ON_PN}-core).
>
> (I chose libiio as it is an example of another recipes that currently
> does RDEPENDS:${PN}:remove =3D "${PYTHON_PN}-core" to counteract what
> setuptools3-base.bbclass does).
>

Ran into this today too. I think you dont need all the bells and
whistles of setuptools3 class. Adding

DEPENDS +=3D "python3-setuptools-native"

should get the job done.

> :(
>
> //Peter
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171527): https://lists.openembedded.org/g/openembedde=
d-core/message/171527
> Mute This Topic: https://lists.openembedded.org/mt/94118767/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

