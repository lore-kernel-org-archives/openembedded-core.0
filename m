Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62C3C54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 18:57:53 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.35584.1748285866463774407
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 May 2025 11:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mvPcJBG5;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6021e3daeabso1062994eaf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 11:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748285865; x=1748890665; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBCV9ZZeIlQdzDApeAdM0MTzT/pj+6luaWW2fZK/+kE=;
        b=mvPcJBG5DxykkPLtsYDo23OXOWEX1mQpaL48kS9Cgq+gC9WOODRCagDr0WsrsnlQEF
         WUiNu9oPLYO00z39pNKc8MtRqdDavXMKbzemhmFr/0E7JuGMRj04FEpI+uMB4eO1mA6G
         UiDhErFkMsFsleypBKcJq7YX6wolqR1QbxGJnGOkASoHqly+ntxvawnuKbW2VhopeS/m
         eyFA0VHvMcynsZcJNvJfEiDS9v03mNSq/RDaipVXkG3fuUif+V8SM8+EDyLsCXfApojv
         3gjG1U7pxuoIQbtsCVJRsbKm+cbg6pqsqKOzFDH6kuRdrNCEXVe2VwIgSyLsXxjImlYy
         GEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748285865; x=1748890665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBCV9ZZeIlQdzDApeAdM0MTzT/pj+6luaWW2fZK/+kE=;
        b=A7lle/gU9WZxOCf5xO8q0AzwsB+cbn1qqH2HOuQNA4V+6vwTbOtX/3S49vt3wN+oS1
         zXfiATXg/cC8Rd8zP0DMEaYDXYt16DOKMd7/Iw369SosK8jxtSK4bEc2l0d65hkQWlxD
         KQkUHnamVrfy/AmGlmZ3i7dHXqvUkN+eyeiA6To4HcqIUDYmvmAu0wEk99uEuzWr0xTX
         mE+pirXSBcYJJRw8I6IIFua/TIWgEHHX5+YBSatrlBIoyrRWUKG50HGaTwnGuVGJFT6U
         Y7LerVVrGt6irpk8xBQdlRMi5L/PWyrbpwUemtoHAco2jdt3Pw4nU1gVe6l+kF3H6D7A
         DD3w==
X-Forwarded-Encrypted: i=1; AJvYcCWfgrECsm8JT1+c9tXXzMsu0ZxHNEIgtgArQPK7f5lEwqJeGLiS91dwYmGiJDRqmm4zHdab1FTpdubiiwYpXVkL1Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwCwqGn12+Y+VY3O1fuwuu5z+JJ+CwWL5weItdxHbmYkLQRDbfM
	KujDcSZulWgkda3QhIZHiPxls1HKorDOd3pYbUugGyEvWNefY/ehaN/5Xu0HBCHm2/AP8jBP4W+
	9aXi7znhyeCXNtWbJs/OEZa4o9AseclI=
X-Gm-Gg: ASbGncv5zdOlSGUIfeYsnOHYSfwvEDhUvytkr/Kx2g597PvyjlaNV9QZptNwEEyAdJ1
	UrB+6PDWc5tZiScLyqaulHURV4kdwy99fV7W//uOKfIU0Lw2E3xFhFNg7Il430MbP4WQtnoISpF
	OpfB7k5xwtZD+H/YAOxT+ivPU6sFqlldPa
X-Google-Smtp-Source: AGHT+IEKkk4GIsomramNSCW8xdZfYC/4jAj3MIj+fifFtCHuzhnZ84fxHSMtGf8RFNgrEk15ato4q3RKlGC1YLrVoPM=
X-Received: by 2002:a05:6870:1e88:b0:29e:4340:b1b with SMTP id
 586e51a60fabf-2e861f78c74mr5125999fac.9.1748285865577; Mon, 26 May 2025
 11:57:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250521080925.815334-1-hongxu.jia@windriver.com>
 <DA2H7Z2IQH15.8AQHUB50F8SB@bootlin.com> <AS1PR10MB5697E603603C2156BCF1DE5CFD99A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <DA2KDA7L7YRZ.2I1CKTLPP29LZ@bootlin.com> <AS1PR10MB5697DC8D007471A68D8709ECFD99A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <DA2ORDMJAWTX.2XH4RND735F7C@bootlin.com> <CAMKF1spdgbveyFvNWoouh9XEdU+RAOX9pNoUgFGe4N2=XcpUEg@mail.gmail.com>
 <AS1PR10MB56977F36FC787279594F0831FD65A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56977F36FC787279594F0831FD65A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 May 2025 11:57:19 -0700
X-Gm-Features: AX0GCFvdyK6QkjzO4cuoh5mg6bI_PlnNoX6rE2QpVxCkuzOtNugp0v6J2hvJO5s
Message-ID: <CAMKF1srrVUB7Y-AtkBcMnHMzw=195=SLonLdaxnjkBT+MrMXNQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] libxml2: upgrade 2.13.8 -> 2.14.3
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>, 
	Hongxu Jia <hongxu.jia@windriver.com>, 
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 18:57:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217273

On Mon, May 26, 2025 at 10:48=E2=80=AFAM Marko, Peter <Peter.Marko@siemens.=
com> wrote:
>
> I have checked the problem and cmake file generated by libxml2 points to =
/usr/include now.
> Build succeeds when I revert following libxml2 commit:
> https://gitlab.gnome.org/GNOME/libxml2/-/commit/75dde50b20215a2a3a445b62f=
36a67c8ed337cab
> This clearly breaks cross-compilation scenario which always has a prefix =
which is usually calculated from cmake file location.
>
> Since this is included only in 2.14.3, we could for now take 2.14.2 which=
 I submitted before.
> Or take 2.14.3 plus add a patch to revert this commit.

a revert of the troubling patch on top of 2.14.3 is fine. OE is not
affected by the
the case this patch is trying to fix anyway

> But ultimately, we need to discuss this with upstream.
>
> Peter
>
> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: Monday, May 26, 2025 3:55
> > To: mathieu.dubois-briand@bootlin.com
> > Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>; Hongxu Ji=
a
> > <hongxu.jia@windriver.com>; alex.kanavin@gmail.com; openembedded-
> > core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH 1/5] libxml2: upgrade 2.13.8 -> 2.14.3
> >
> > libxml2 upgrade will need some package adjustments in other recipes
> > depending on it. e.g. libiio from meta-oe see
> >
> > https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2490442/raw_i=
nline
> >
> > On Thu, May 22, 2025 at 5:25=E2=80=AFAM Mathieu Dubois-Briand via
> > lists.openembedded.org
> > <mathieu.dubois-briand=3Dbootlin.com@lists.openembedded.org> wrote:
> > >
> > > On Thu May 22, 2025 at 2:14 PM CEST, Peter Marko wrote:
> > > >
> > > > OK, I have updated my patch to .3 and sent to mailing list.
> > > > Don't forget to pick the lttng-tools patch again with it...
> > > >
> > > > Peter
> > > >
> > >
> > > Thanks, I will take both patches for my next build.
> > >
> > > --
> > > Mathieu Dubois-Briand, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#217094): https://lists.openembedded.org/g/openemb=
edded-
> > core/message/217094
> > > Mute This Topic: https://lists.openembedded.org/mt/113225735/1997914
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> > [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

