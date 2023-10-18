Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E620ECDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 19:08:54 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web11.5883.1697656134208027974
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 12:08:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OypT4XGY;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-77acb04309dso289481839f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 12:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697656124; x=1698260924; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utCfG+P7jPa3lyoY+WcQSMLX74gYuZ5ALCKIEMbx7rY=;
        b=OypT4XGYI/lnQ+DfM0UafW2L0wjMGRBB5MyMaadpgtYAxkQ7+DEnAIV/9pMbuHJYxw
         gn3ZRG4hKAHFOFfwrQvW4rbrwGLrRaa16dwKyn+MRBGjaUq2G3FPkOf0mWWEl/+qqEHo
         WVwZvCYEDytJR2U3Pu5VK2QRi7It48xpZe+Ib/PLZ9Uixlv7td+74edwLpHD59/rCbfb
         qjHdXyAZ2TyXvpZ6qMDMu12WPELQLy0OQzMCuqMsKlh1+bjUjwMsC32swe18vjt98Eq+
         DMZvJ49qa+85bjI8nLYlpfkhZON0pi/UwUTQ2i4WqSOkRu5DcEqy9FJMoZPvH/rbOzn1
         mXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697656124; x=1698260924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=utCfG+P7jPa3lyoY+WcQSMLX74gYuZ5ALCKIEMbx7rY=;
        b=A6OkDND9OVRjrCdqwGvi9iEnqCGkaKJEnQRihDME7J27FvE6HN9Ussez3YZJ2fe/Vt
         wiV/d6e6Fs5MsoejMuHno0YCvC/tfcwWnQlA+6AivY1TrPHW4ihZ3QwtQ+GjTpmCBmHH
         ChH/FzBUXOpwSpoQD2VJm6LHgA0tsFts0LhGV+2LXvTniU0qLcxo40MvC6P+Xc3Z9txR
         dQrUUYb/U/1ETykPv++I7JS3EY62976blyIX4P4A+3yCtopPifnlsRaRv/tAyRlgHVwu
         sIWNrxrMnuUv0zecCVWZ/gWonTqhoD/gAeApGuKv7etzq9raDVXxMLswzDTqb5Inmwva
         luGQ==
X-Gm-Message-State: AOJu0Yxi8iWpSaSrYPygloxrxVUIHjF266YYhK1/mXokDjGeF6UgQPaO
	bJktYXVKCYsMaOvEG7BJ7CMAnW0Uz17pSX9e+Fw=
X-Google-Smtp-Source: AGHT+IH1c9Bu/1m2UyjM4j6UK7sN0HtXSxnwOJrxMPrHfPc73UvDiAoPZZz7f4f5XXG+TISXiG9LyP4ZeA743p8Pjrc=
X-Received: by 2002:a5d:9d98:0:b0:7a2:a8d5:e146 with SMTP id
 ay24-20020a5d9d98000000b007a2a8d5e146mr195080iob.15.1697656124179; Wed, 18
 Oct 2023 12:08:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230824143018.3098875-1-Yash.Shinde@windriver.com>
 <20230825152007.50079565@booty> <SJ1PR11MB6129DF74BFD2DF3574E4144FEBE3A@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <5de3537a-90a6-b813-57b2-b745b6349baf@windriver.com>
In-Reply-To: <5de3537a-90a6-b813-57b2-b745b6349baf@windriver.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 18 Oct 2023 20:08:32 +0100
Message-ID: <CAO5Uq5R-xvytNWqtfwRk7F3BEVMNWkwQwyybHsQjrd86ZMkSKw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] rust: Upgrade 1.70.0 -> 1.71.0
To: randy.macleod@windriver.com
Cc: "Shinde, Yash" <Yash.Shinde@windriver.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Kallapa, Umesh" <Umesh.Kallapa@windriver.com>, "Gowda, Naveen" <Naveen.Gowda@windriver.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, 
	"Moodalappa, Shivaprasad" <Shivaprasad.Moodalappa@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 19:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189420

On Sat, Aug 26, 2023 at 12:17=E2=80=AFAM Randy MacLeod via
lists.openembedded.org
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
> On 2023-08-25 11:30, Shinde, Yash wrote:
>
> Hi Luca,
>
> The current version of Rust Oe-selftest is based on Rust 1.70 and works w=
ell there. It is yet to be updated for Rust 1.71 (eventually 1.72 which is =
latest). With every new Rust version there are newly test cases added from =
which some might fail leading to failure of Rust Oe-selftest.
>
> The patch sent here is only for Rust version update and not for Rust Oe-s=
elftest. The Rust Oe-selftest would be updated to recent versions after the=
 Rust update is done.
>
> We need to do both steps in on patch series.
>
>
>
> The Rust Oe-selftest fails since it is still on Rust 1.70 and the Rust ve=
rsion is updated to 1.71 here. Parallelly will start to rebase Rust Oe-self=
test on the latest versions.
>

Is anyone working on the oe-selftest updates at this point? It's
looking likely I'll have a bit of time available in a week or so, so I
could look at it, if no one else is?


> Thanks.
>
> Send the 1.70 -> 1.71 update along with the Rust Oe-selftest using 1.71 a=
s one series of commits.
>
> ../Randy
>
>
>
> Regards,
> Yash
>
>
>
> From: Luca Ceresoli
> Sent: 25 August 2023 18:50
> To: Shinde, Yash via lists.openembedded.org
> Cc: Shinde, Yash; openembedded-core@lists.openembedded.org; MacLeod, Rand=
y; Kallapa, Umesh; Gowda, Naveen; Kokkonda, Sundeep; Moodalappa, Shivaprasa=
d
> Subject: Re: [OE-core] [PATCH v3] rust: Upgrade 1.70.0 -> 1.71.0
>
>
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> Hello Yash,
>
> On Thu, 24 Aug 2023 07:30:18 -0700
> "Shinde, Yash via lists.openembedded.org"
> <Yash.Shinde=3Dwindriver.com@lists.openembedded.org> wrote:
>
> > Switch libstd-rs to use the dummy `sysroot` crate which represents the
> > standard library crates. Target getrandom-open64.patch at 0.2.8 (merged
> > for 0.2.9).
> >
> > Drop bootstrap_fail.patch as it is merged in upstream rust.
> >
> > Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
>
> The rust.RustSelfTestSystemEmulated.test_rust test is failing on the
> ABs with this patch applied:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/146/builds/408/st=
eps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/154/builds/407/st=
eps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/147/builds/407/st=
eps/12/logs/stdio
>
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186741): https://lists.openembedded.org/g/openembedde=
d-core/message/186741
> Mute This Topic: https://lists.openembedded.org/mt/100936266/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kiernan@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
Alex Kiernan

