Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8E3AC5320E
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 10:57:52 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.10783.1724324267919852526
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 03:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TwP7ml/o;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4281d812d3eso6027545e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 03:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724324266; x=1724929066; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wh0d3VTdE1Vf3BeTm7wLLVFxdTSaM9c8Mcs/eoTLFaY=;
        b=TwP7ml/oprhMmmSV0Snd9bUDDxfgOlpdrDOiLLy1KS0lkEKQ4CnmQOoLkBFZmybiGW
         7MqMxJhYuS6t5R0WDwFZxK958xQlmgXc7G37UfW3Ljw8BOWiykK3PRI9jqiut3vlXYBR
         BL/0+imRWW6NbaBpK05MSmOJhXzOuC75Yu+dI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724324266; x=1724929066;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wh0d3VTdE1Vf3BeTm7wLLVFxdTSaM9c8Mcs/eoTLFaY=;
        b=BvSHbDlW4UTvWt424+oqX/AZXJNKSC4m3k1UcYNmu/AO7G4VB3xYZvb0BJxvVXxtt1
         KlnuXhx3Qzif8RUEYt+rSEmo6tL5FQL/u/JSnCU7Qm13I0wh0uM1M7XKFWk2lhs21kSh
         iofrQoSb7BXfpaaNHfvupmKSFCCfAmhct6zx/3DxzOL6jPFBrR2OR+Iwt/cLn48z6BtR
         qNIxy8KaIyXCbmUJSflw3JQD4ar68q9i9wmnKwdaAchSGV4f7/oKBzyXSztHr1Y+xLKj
         c4kXPafgTM4boATFQ9mbDSdrUuo4pJebAMu/BvUjtAdk8hl/lJ5cf2Ju3lM7nmQsoajo
         cwUA==
X-Forwarded-Encrypted: i=1; AJvYcCXfrL2pXQnsmzW1gGK1I8Q0/fIdQK76g4EkhqC7ukTQV5k44fwIHI8ryngAfiTTbzI0D2UoAnA3YiLKLjWa51P5lg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyHqiKjmaLz+oLsL/ucDnRGk/WEyFAGyoNcltbcBWizTTL3rocu
	nknNsS517opP6OyShwq7XOX8AeFOFEpJhlpCLFv1S0Zs/Pp9IBNg3yo/14lL2z4=
X-Google-Smtp-Source: AGHT+IGqyemEmLsyYXgCi4n5q3raitXMImLyjcxuhZj2xs3b5W7xyiScSK7pd4nYoTtqu1FJhfdYOg==
X-Received: by 2002:a05:600c:4e51:b0:425:81bd:e5ee with SMTP id 5b1f17b1804b1-42ac55cc3cemr12092735e9.16.1724324266007;
        Thu, 22 Aug 2024 03:57:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:71f4:5834:b5b2:ea3a? ([2001:8b0:aba:5f3c:71f4:5834:b5b2:ea3a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac514de6fsm21152165e9.9.2024.08.22.03.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 03:57:45 -0700 (PDT)
Message-ID: <bdef4ce4ae46ecd5028cbef7ba41d39869ffa017.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v3] piglit: upgrade 22eaf6a91c -> c11c9374c1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: tgamblin@baylibre.com, openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2024 11:57:44 +0100
In-Reply-To: <17EE04E63BCCE948.9439@lists.openembedded.org>
References: <17EDD5FCB55B6698.29323@lists.openembedded.org>
	 <3e53c001-7c60-427d-be5a-ae01bdc4a7ba@baylibre.com>
	 <17EE04E63BCCE948.9439@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 10:57:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203651

On Thu, 2024-08-22 at 11:04 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> On Wed, 2024-08-21 at 15:46 -0400, Trevor Gamblin via
> lists.openembedded.org wrote:
> >=20
> > On 2024-08-21 3:45 p.m., Trevor Gamblin via lists.openembedded.org
> > wrote:
> > > Commit 766669895d fixes builds with numpy 2.x.
> > >=20
> > > Patch '0001-utils-Include-libgen.h-on-musl-linux-systems.patch'
> > > dropped
> > > because it is now upstream in commit 9c941dfc36.
> > >=20
> > > Add wayland and wayland-protocols to DEPENDS to avoid errors during
> > > build.
> > >=20
> > > Adjust the x11 PACKAGECONFIG flags so that piglit builds without
> > > x11
> > > available.
> >=20
> > FYI, I've tried the reproducible tests on piglit with and without=20
> > TCLIBC=3Dmusl, and also with and without the numpy 2.0.1 upgrade, and I
> > can't reproduce them. Hopefully this works on the AB now.
>=20
> Unfortunately it didn't :(.
>=20
> reproducible:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/5220
> world docs build:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/6306
> world build:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/6306
> musl:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/9404/st=
eps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/9416/st=
eps/11/logs/stdio
> no-x11:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/9390/st=
eps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/9390/st=
eps/15/logs/stdio
>=20
> It is hard to see which are warnings and which are errors in the logs.
> I did wonder if the issue was python version specific. Are there any
> related commits upstream looking to fix anything like this?

I have a lead, I think it is using a hardcoded path=C2=A0into the host syst=
em for wayland-scanner:

/bin/sh: 1: /usr/bin/wayland-scanner: not found

We're trying builds on systems with wayland installed, the autobuilders don=
't have that!

So have a look for a hardcoded path to that...

Cheers,

Richard

