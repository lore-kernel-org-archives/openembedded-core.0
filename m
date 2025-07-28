Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE17AC83F17
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 17:18:58 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.86914.1753723136003612562
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jul 2025 10:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V+RU0cTL;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-71a34087749so1974737b3.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 10:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753723135; x=1754327935; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8kMdLqzs24kdqeM770CAwDY5em5EopBzkFKMVJgjwc=;
        b=V+RU0cTLdmxq2p5+pkw4WaESENrlIYkMntY2fRK2w5/SHeabEIZbg7CrudZR6AwYZp
         lh41ZWKL0CGzdSZQO8yUVMDpSzh6zGDHvf1M7z8BmjWGCWDLDwaEgraE1NCtfGoKY0Dw
         eBKwqpvHHMW0QaWHogNcprJATLCtMYXSZR5cE7hE5r+IwnZMCvscaRWTMF+h5w9cGZVr
         HRRCpqiu1AQZHNvUFDZqYnTU3ZNKoGPvUZKL0wIIeXiSpUdXukdr1dta10PsMCYeMS13
         oCVFfUms0YnP6dspfcKZYr66trLNd3l0R7z9XzBjg5FwChwnUTlS8SSiq2cJ546Jpe43
         DKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753723135; x=1754327935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8kMdLqzs24kdqeM770CAwDY5em5EopBzkFKMVJgjwc=;
        b=vcgQAW0sWZfAQZn512nNh+cPcnf78kTy3CFmfs7WBq/nVq/a4qrgnsqxm94PG/93uM
         3jD4j7+Cm1JVW5WlZVOt9cvlTP+Yzj+JlDfU3d6BqXKrK/RXLPhDu+NeyzwNTZVkdtgX
         To2NQCBosTstPHQ2cLEcDiibTGbsMsNoydEXM2qPRoVhHS2GCVNNmubAzqwsMzChNgOD
         SzdQ94u+5Bxh0ht2J8QH7nk2D+xFwTB8IWrjMlftNQkohYA2os5HDQuVLhcH2o9DHBPc
         9bCAgFOtkUkRvyhIJu8cm39ggsvDhbrVd4Ilpu37GlU5E+5jX/1v0W9cU9Wh+gNk6/tL
         DSyA==
X-Forwarded-Encrypted: i=1; AJvYcCXsklj9px5zFEwPiTYAmLZtDYAGJ1CmiHaiN5bWKNmmK0m4kMPemEit+j9j/WW3UxCEmuMhPHnYygVHfvxHf6QoKQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywf5XjYGzjGR8U5XOimevRqrDlf/9w4FEeFUUaRe/HT8IxHa2H7
	SDtGKJY1ueqGFp3w1Q0oQe9hw+AZpfO77UvoI9dY2Bl5HYH8Z6JJ+6geEFpxxhpYngrVgzG5GRw
	HPKMNSCMoR4DdYX7FDEk126pmkkz0tCA=
X-Gm-Gg: ASbGncteeN+kb8tssnN3ghRETqlMCV0zR/r9vH6UxpTxFJr6kjtZLGXfnny685nSapp
	Ye+antq1aSyXbUZxjq0eoj7tfEbOnsZqMKbMy0JuPibo8D57/7an9luCRqlFxYIsO9j59ZJtzWm
	qcfOt4HeqPO70arcUIkf5qvsXH39wW+ZqWttDqeDVQKj3iUn9rgc6ZyvGuy8biAlkyV4izhJKrW
	an3kqtnmtiQUwmLi74KSTODFlbNq7cl8kg=
X-Google-Smtp-Source: AGHT+IFOr/RXQaDa9iZarOzL+Z7W8LXQp98j0nsZRF86EwcoSkv1L0E1267DZS71XyBnFDmBLM/ycL/zDe7ROu//oYQ=
X-Received: by 2002:a05:690c:6102:b0:71a:1607:e487 with SMTP id
 00721157ae682-71a1607e9d5mr64827427b3.25.1753723134888; Mon, 28 Jul 2025
 10:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250728032045.2783514-1-raj.khem@gmail.com> <20250728032045.2783514-3-raj.khem@gmail.com>
 <efc50221-0504-48ab-abf9-0a76e5f076e1@gmail.com> <CANNYZj_aVTnQ6bK-0pf_=M-G6mn-JWQGSqnOjwzowcJA5JYP4g@mail.gmail.com>
In-Reply-To: <CANNYZj_aVTnQ6bK-0pf_=M-G6mn-JWQGSqnOjwzowcJA5JYP4g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Jul 2025 10:18:28 -0700
X-Gm-Features: Ac12FXyJUBHweyPh9v8Egtahuu7e8HzOwu9_ZUzyZ2XkodFRcR20D6seANtrcNE
Message-ID: <CAMKF1sqqSnvH_jR+qiPDqiHWSfbd7Cz_7ziDusN3h1_Ar7UK6Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/5] spirv-headers,spirv-tools: Update to tip of trunk
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: skandigraun@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 17:18:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221019

On Mon, Jul 28, 2025 at 2:04=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Also, I'd prefer a backport of the needed fixes, as this would
> mis-match with other vulkan items, potentially breaking them.

There are many that its not worth it, since I am expecting spirv-tools
to do a release for llvm-21
question is how long that happens after/before llvm-21 release

>
> Alex
>
> On Mon, 28 Jul 2025 at 08:58, Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > On 7/28/25 05:20, Khem Raj via lists.openembedded.org wrote:
> > > This is needed for compiling SPIRV llvm-translator from llvm 21.1.0 r=
c1
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb | 3 ++-
> > >  meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb   | 3 ++-
> > >  2 files changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb b/=
meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
> > > index 1da2e74f93b..b1cec77080a 100644
> > > --- a/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
> > > +++ b/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
> > > @@ -4,7 +4,8 @@ HOMEPAGE =3D "https://www.khronos.org/registry/spir-v=
"
> > >  LICENSE =3D "MIT"
> > >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da0dcaa512cc2dee95fe0fd791=
ee83a18"
> > >
> > > -SRCREV =3D "2a611a970fdbc41ac2e3e328802aed9985352dca"
> > > +PV .=3D "+git"
> > > +SRCREV =3D "de1807b7cfa8e722979d5ab7b7445b258dbc1836"
> > >  SRC_URI =3D "git://github.com/KhronosGroup/SPIRV-Headers;protocol=3D=
https;branch=3Dmain"
> > >  PE =3D "1"
> > >  # These recipes need to be updated in lockstep with each other:
> > > diff --git a/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb b/me=
ta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
> > > index 319b25b7f43..f66b25c60db 100644
> > > --- a/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
> > > +++ b/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
> > > @@ -7,7 +7,8 @@ SECTION =3D "graphics"
> > >  LICENSE  =3D "Apache-2.0"
> > >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc=
3c6bd57"
> > >
> > > -SRCREV =3D "33e02568181e3312f49a3cf33df470bf96ef293a"
> > > +Pv .=3D "+git"
> >
> > There is a typo in PV
> >
> > > +SRCREV =3D "a983ab19d6f91a07a8272767427b6c5208576d08"
> > >  SRC_URI =3D "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=3D=
main;protocol=3Dhttps \
> > >             "
> > >  PE =3D "1"
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#220992): https://lists.openembedded.org/g/openembed=
ded-core/message/220992
> > Mute This Topic: https://lists.openembedded.org/mt/114408566/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

