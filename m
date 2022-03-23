Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6743AC433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 09:02:08 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web09.6922.1648026127725985414
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 02:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n7pBQpFM;
 spf=pass (domain: gmail.com, ip: 209.85.222.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f45.google.com with SMTP id 63so407358uaw.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 02:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=5fsESNKLTYj0YSXwrZ0xWM3n9RklFVSGM8Ue2mIWRmM=;
        b=n7pBQpFMq6Kxb4mtoM/C1lmMlqOgDi6p52daR0pHDNXuUxWCrsMZLJSEClBGWwBH+n
         6axl0I/PaGu/DZTVgUwF1G5a8pJuIA1rpDGHmuvwXkiyMOImBw+A90ex+vXHvrAFg5Y5
         2MAd58gh48w5eCG3EmpySWO2a+me5K1TRYCBX/cyWk57OMLDPDzD0j9LEt7vUm5ES3Av
         oxk6AjtquGs7ZmxkbimZXCuo2dkqlG2AnYYXUC9tHWhincgoHWkpaQO7SnFc7jyBFK5+
         +vKNTzvfGCoSkNXe2ZF0imAftndZ2n4F8Vq+IJcfZiyrNzZn+En3xFQJXnsIIEB7fhMI
         7zPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=5fsESNKLTYj0YSXwrZ0xWM3n9RklFVSGM8Ue2mIWRmM=;
        b=A4uqHQDy+o3+bIUnuOUadqs9R8vXrTx8kpc76lrc46V7xo3nZPsd3kTyf7iLQruBzV
         hY9p/8oVrTnMPEvKz0d3SKSzV+6khbdZP++p5BeyqQp1oBXmXPxDSn1MoVYL8R94Dd9O
         StnnhM1FcVyUtp0gPEgs6ebE2+zhjVNZFcqevGv4rL2ZCpHw6LiAUzyVI3R2tHQ7I3g0
         7BJVshCj2Rs2ueu+M6G76e7ZRnsAH4Omt6PfehlFEAPZI9xsC9et69bLhpkGR0S7Qulr
         rG/0C16cBrA+de0Og509kYWloD8dyXZV4EM/Gy3iokUUU6Ltiu++MVIuO+L5y/ATLP9Z
         Xr+Q==
X-Gm-Message-State: AOAM533sVCxb8anRTCtEks9GTXvNPNahypt2JHqWCpOp5mZoxA3Wfm4E
	t5FUwbDp8K2Y0xjHDnE8YS77xQoJn7YYtJwGfjc=
X-Google-Smtp-Source: 
 ABdhPJzDmnSGs4sXdBghjhk6nycN4ND2jmY4OV8luKM1CAmfGCENd5y4udNmz4zMNgIR/kdf7nAzIqt2o+p9Grzhm64=
X-Received: by 2002:a9f:3589:0:b0:342:4791:1b86 with SMTP id
 t9-20020a9f3589000000b0034247911b86mr10611000uad.82.1648026126730; Wed, 23
 Mar 2022 02:02:06 -0700 (PDT)
MIME-Version: 1.0
References: <1648022502-11770-1-git-send-email-wangmy@fujitsu.com>
 <CANNYZj_hFxsyawFnsU+wb_Kh=uDp2oD3suN+iHUzuHRgG_fs=w@mail.gmail.com>
 <OSBPR01MB1845F67F2E4385E4EBFB4F38DC189@OSBPR01MB1845.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OSBPR01MB1845F67F2E4385E4EBFB4F38DC189@OSBPR01MB1845.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 23 Mar 2022 10:01:55 +0100
Message-ID: 
 <CANNYZj8FG3wacP9e7jq=u-HeAhr01XBtwqMjG6YkamHsDGrTEw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rng-tools: enable macro
 JENT_CONF_ENABLE_INTERNAL_TIMER
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>,
 OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Mar 2022 09:02:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163582

Please keep the replies on the mailing list. This patch should
probably be merged with the libjitterentropy update?

Alex


On Wed, 23 Mar 2022 at 09:55, wangmy@fujitsu.com <wangmy@fujitsu.com> wrote=
:
>
> After libjitterentropy is updated to 3.4, a macro JENT_CONF_ENABLE_INTERN=
AL_TIMER is added to jitterentropy.h used to control struct jent_notime_ct.
> rng-tools needs this struct, so it's need to make this macro enable.
>
>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> Development Dept.I
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 Wenzhu Road, N=
anjing, 210012, China
> TEL: +86+25-86630566-8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
> http://www.fujitsu.com/cn/fnst/
>
> > -----Original Message-----
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > Sent: Wednesday, March 23, 2022 4:40 PM
> > To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>
> > Cc: OE-core <openembedded-core@lists.openembedded.org>
> > Subject: Re: [OE-core] [PATCH] rng-tools: enable macro
> > JENT_CONF_ENABLE_INTERNAL_TIMER
> >
> > This error is not seen on the autobuilder, can you please check why it
> > occurs only in your local setup? The macro probably needs to be enabled
> > in a more targeted way.
> >
> > Alex
> >
> > On Wed, 23 Mar 2022 at 09:02, wangmy <wangmy@fujitsu.com> wrote:
> > >
> > > do_compile error :
> > > | ../git/rngd_jitter.c: In function 'rngd_notime_start':
> > > | ../git/rngd_jitter.c:56:45: error: invalid use of undefined type 's=
truct
> > jent_notime_ctx'
> > > |    56 |         ret =3D
> > -pthread_attr_init(&thread_ctx->notime_pthread_attr);
> > >
> > > enable macro JENT_CONF_ENABLE_INTERNAL_TIMER to use struct
> > > jent_notime_ctx
> > >
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > ---
> > >  meta/recipes-support/rng-tools/rng-tools_6.15.bb | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> > > b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> > > index ae974f9f6f..0696351903 100644
> > > --- a/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> > > +++ b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> > > @@ -34,6 +34,8 @@ INITSCRIPT_PARAMS =3D "start 03 2 3 4 5 . stop 30 0=
 6
> > 1 ."
> > >
> > >  SYSTEMD_SERVICE:${PN} =3D "rngd.service"
> > >
> > > +CFLAGS +=3D " -DJENT_CONF_ENABLE_INTERNAL_TIMER "
> > > +
> > >  # Refer autogen.sh in rng-tools
> > >  do_configure:prepend() {
> > >      cp ${S}/README.md ${S}/README
> > > --
> > > 2.25.1
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#163579):
> > >
> > https://lists.openembedded.org/g/openembedded-core/message/163579
> > > Mute This Topic: https://lists.openembedded.org/mt/89971134/1686489
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-core/unsub
> > > [alex.kanavin@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

