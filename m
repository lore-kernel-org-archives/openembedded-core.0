Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BCD5C54EAA
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 12:58:00 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.101266.1674824278248233579
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jan 2023 04:57:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Nw7OfOYv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so3420763wmq.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Jan 2023 04:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FJW7lVa7FzvQmNE99/sEzOD16ivHejzvBkuIWsM55+g=;
        b=Nw7OfOYv9ifcNeqchTlsoUknv0/DgbvlYryVSQBjAU83cJIcVGZNqoflWTnSNM/uHd
         fTJVjZOKJe5HQDh5+jCEEbWkAOJzwkjS8EIf+64k3nwi87Jd2GflD1dxFIkFvIYx1WTB
         7RQwmo4fQUcCEkYR0QdudU+oEz1szdD+XucMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FJW7lVa7FzvQmNE99/sEzOD16ivHejzvBkuIWsM55+g=;
        b=52+SwdxAfqdZMUQMCWCDmmbM1ie1C1xQD0wvsA34vmdT6/qMg5Hhxklsder2uxGuFS
         sDUg7xeHt2fbdWJD4kb1BorZdYeBJcYVr90e4TnuIqDcdKCp40yAL2daWs+fuRwEei6e
         ApUHAC7EXDlYum0tpQdP7yYcGN+ef2uL4XV6OmPBbIHqN+gy4z0dX6jDiG+cfwowCiHr
         9rQ8Xz/hwHm0H7ROO2uHBJQhTg5T/ss+b2eTf55rizK606AHw0NswI+ZLFm46QyEFxXO
         yUcSDfMajR7bC5+rX02DrfOWtNjzl9mSRLyn+XMNNd9pnGHpODN6kKkfpPTwLXzmbZKU
         s5hQ==
X-Gm-Message-State: AFqh2kr/PTANhGrE37BJs2vVVJEsjCqyC2+Yb8K2nX0vhdKI3NZk6dKX
	Y6S8FK6L5/OoAnokYkR3kUeXcg==
X-Google-Smtp-Source: AMrXdXtDkZG5XoluamGQL5UycJn/3hN/4/JwmcamRpjPYdt1FMjEJDXZGT9GYLVa60UqWag+hDmQyA==
X-Received: by 2002:a05:600c:1d29:b0:3d9:69fd:7707 with SMTP id l41-20020a05600c1d2900b003d969fd7707mr46783072wms.2.1674824276410;
        Fri, 27 Jan 2023 04:57:56 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:3876:ca46:43a6:4b49? ([2001:8b0:aba:5f3c:3876:ca46:43a6:4b49])
        by smtp.gmail.com with ESMTPSA id x12-20020a05600c2d0c00b003db15b1fb3csm4143292wmf.13.2023.01.27.04.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 04:57:56 -0800 (PST)
Message-ID: <b73312eaff6e6f2e24ee9111bf32ec6a565dd810.camel@linuxfoundation.org>
Subject: Re: [yocto-security] [OE-core] OE-core CVE metrics for master on
 Sun 22 Jan 2023 02:00:01 AM HST
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Quentin Schulz
	 <quentin.schulz@theobroma-systems.com>, Michael Opdenacker
	 <michael.opdenacker@bootlin.com>
Date: Fri, 27 Jan 2023 12:57:54 +0000
In-Reply-To: <2E81B0F3-3747-46CD-85F2-9BBED3F1CF8E@arm.com>
References: <20230122120427.D9CF696035B@nuc.router0800d9.com>
	 <D5C2125C-6245-4E41-9029-6EF99E4AE623@arm.com>
	 <CANNYZj-mtOntD4NcfMKd4j5jqzCN6sP_OFrGdVWWBv8ug93=Yw@mail.gmail.com>
	 <37CCF635-CA4E-4300-A49C-0F31D9472B6A@arm.com>
	 <eac9dcd2a8b0f0916fd373da9f2c3ee198d437ba.camel@linuxfoundation.org>
	 <2E81B0F3-3747-46CD-85F2-9BBED3F1CF8E@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jan 2023 12:58:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176442

On Mon, 2023-01-23 at 13:41 +0000, Ross Burton wrote:
> On 23 Jan 2023, at 13:35, Richard Purdie <richard.purdie@linuxfoundation.=
org> wrote:
> > > I=E2=80=99ve started braindumping into
> > > https://wiki.yoctoproject.org/wiki/CVE_Triage, when it=E2=80=99s expa=
nded and
> > > complete we can link to it. Or maybe we should just start a
> > > Maintainers book in the documentation?
> >=20
> > Lets put it in the manual. The wiki is good to pull together info but
> > I'd like the manual to be definitive. I've thought this about patch
> > submission for a while too, we have too many docs with the useful bits
> > of data spread over two wikis and a few READMEs=E2=80=A6
>=20
> Copying in Michael and Quentin.
>=20
> Taking the JFDI approach, I=E2=80=99ve started (another) wiki page to col=
lect a table of contents at least:
>=20
> https://wiki.yoctoproject.org/wiki/Maintainers_Manual
>=20
> I=E2=80=99m sure there=E2=80=99s plenty I left out, but that=E2=80=99s a =
start!

I did start experimenting with:

https://git.yoctoproject.org/yocto-docs/commit/?h=3Dcontrib/rpurdie-wip&id=
=3Dcdbe7f39681d2228849b58d1de4c861826d50832

It does highlight that we need to be careful on importing some docs as
the wiki info isn't entirely right or well worded in some cases now.

Cheers,

Richard

