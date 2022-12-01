Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D01C4708C
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 12:46:11 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.41976.1669898769540656065
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 04:46:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a5iOndLw;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id b9so1747265ljr.5
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 04:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wifbh7GC8f61B0iXOE2nGDaNRqv2B+5aYpr8hLgknMc=;
        b=a5iOndLwXwWv7YkoByV5ubmxX0w6wkjPMIE9gQJ1ba3keG/BP8Zvw+Qd8oajU+y/sH
         5E9/t1STREX+Pfnk5D7VS56e9xaar3Iud4FI9Y57WtBL+l6aL7xMjncbyycFDbhpKqj8
         nP986zxyoP15fhv5j3t/RI7HY04hbSEcvWlttfVmunLQ13KDYhwDIRmOKS7vI0sM3VRO
         mk9Dj/mSN+JK1tBjSt6btBGFtq99JSKsTvUmtqptg7JgRL9Io1wcXNZ9+mNiFLhADJcY
         QGPERb4REJsdYcFMwTghTY9en3CqJFBCzbdj1fHjV/uJFVnU7DBQa/TtyEDEEdZHbZGq
         D0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wifbh7GC8f61B0iXOE2nGDaNRqv2B+5aYpr8hLgknMc=;
        b=swR9Glwca03CcgyBMWNcac/Nl2uDvPtPUc/dnRP3ZUgSHflwi9iDm5Dne8AhrqZN6Q
         qWMyLRPOvTE01cngtuamcNnsWCN647QfiiyA8ExiPHPAsyJL0ypjOj1D9DTPU2OErNQd
         06ty6bxNgRutQxh1D7QCLd+EnlUeFgo/wRjogAYzFE2GDTpIMHv/Gx98NGTgVPR1Ykbk
         hSgeUfgrAHuUls2fOotaxPjbHSlf6zTYPsvQjq3El3xmOCcxj+cErHhG+mEPohxevD+h
         JlUlijCmfJLqLCzMW6vJE/EzKYlXJxuPC8hWv4KZ5hFA2VL1TTGvAEL+MdSRgC3RQ3j5
         A2AA==
X-Gm-Message-State: ANoB5pnZKG5Dxyiq1LE7/OxL+BcGhxzOd9QXTwQ/vINUwigzTjetD2rQ
	dXqyfr3jp2whcOQ0dsyzPh7rocKXb6QHt6tAEzY=
X-Google-Smtp-Source: AA0mqf5oFOFAay2zFauCgcCxe/XuI2b8m8lXYag/14oC3q1f4h92bfe6qQB0g4SmRCcrG7eJkjUItFmA1fGoNpt3cFA=
X-Received: by 2002:a05:651c:1145:b0:277:8759:bf65 with SMTP id
 h5-20020a05651c114500b002778759bf65mr19977413ljo.108.1669898767594; Thu, 01
 Dec 2022 04:46:07 -0800 (PST)
MIME-Version: 1.0
References: <20221201075324.353632-1-f_l_k@t-online.de> <0496E9D1-8A87-4F2C-9C6E-43CA4929D17E@arm.com>
In-Reply-To: <0496E9D1-8A87-4F2C-9C6E-43CA4929D17E@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 1 Dec 2022 13:45:56 +0100
Message-ID: <CANNYZj9TwYeQ_UfD-oi8Md+cH-6Tx8s+jvM9EmrMC4LVBK7J8Q@mail.gmail.com>
Subject: Re: [oe-core][PATCHv9 1/4] graphene: import from meta-oe
To: Ross Burton <ross.burton@arm.com>
Cc: "f_l_k@t-online.de" <f_l_k@t-online.de>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 12:46:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174055

How much longer before webkit, too, drops gtk3 support, or gtk3 itself
starts to bitrot in significant ways? If we want webkit in core, then
we better figure out how to build (and test) it with gtk4, and rather
now, than later.

I also don't like the idea that core should be using less-than-latest
options when latest options are 'complicated'.

Alex

On Thu, 1 Dec 2022 at 13:34, Ross Burton <ross.burton@arm.com> wrote:
>
> I=E2=80=99m a big GNOME fan[1] but I wonder if moving pieces of the GTK4/=
GNOME4 stack into oe-core because we want to upgrade epiphany is the right =
thing to do.
>
> It=E2=80=99s not the full GNOME stack as we=E2=80=99re just picking the b=
uild dependencies for Epiphany, so anyone who wants to use the GNOME stack =
will need meta-gnome. It=E2=80=99s not really a proper test of GTK4 because=
 epiphany isn=E2=80=99t in any images, so will only get built in the few wo=
rld builds on the autobuilder.  Because it is in no images there is no runt=
ime QA for it, we could carry a GTK4 in oe-core that crashes on startup for=
 a long time before anyone noticed.
>
> WebKit supports both GTK3 and GTK4[2], so it=E2=80=99s easy enough for oe=
-core to either have one recipe with  PACKAGECONFIGs, or a well written fle=
xible recipe that has a GTK3 variation in core and a GTK4 variation in meta=
-gnome.  I believe webkitgtk also ships a dumb-browser application that wou=
ld be enough to verify that webkitgtk actually works, because in production=
 use the choice of browser will be based on more than just what is in core:=
 maybe a custom shell using webkit, maybe chromium, maybe something else en=
tirely.
>
> I=E2=80=99d even go as far as saying that maybe the meta-gnome maintainer=
s should talk to the autobuilder maintainers and get meta-gnome added to th=
e autobuilder test matrix.  GNOME has strong support for installed tests so=
 we can execute the ptests on the autobuilder, and have some basic runtime =
tests to verify that GNOME starts.
>
> Ross
>
> [1] ex-gnome-games maintainer, wrote and maintained sound-juicer, attende=
d several GUADECs, was active in the GNOME Mobile working group. Yes, this =
is historic, but working on GNOME 3 is what took me from proprietary softwa=
re to working on open source full-time.
>
> [2] https://github.com/WebKit/WebKit/blob/ab46c3ebb92d1134614f4f98918927d=
338062d74/Source/cmake/OptionsGTK.cmake#L184
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174054): https://lists.openembedded.org/g/openembedde=
d-core/message/174054
> Mute This Topic: https://lists.openembedded.org/mt/95377611/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

