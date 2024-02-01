Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE553C4828C
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 13:31:41 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.15262.1706794292783135637
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 05:31:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PzNWLAuq;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-55a5e7fa471so1188757a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 05:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706794291; x=1707399091; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UvYdgRVyYAxaFCDQcO3MH7oXSF58uuRK/BXUr5EnBJU=;
        b=PzNWLAuqTvbDQ9mJLtQm+EjuZs/R+cup+8Mpq/UiWX8gd4g5q47Cnd9Y9d2xTSQ5bi
         1p+kks3vCZsH5zGqw9h8seedCRFqF0jQQbzM/f25Mqdfcg8Wi32PAWYVyMa9+MtH1onK
         OtEsZmFFtNbd5KLe98rqwqA1ry4Lx/l3ae7EYptZGVtURpqLpLlZjRh53T1mPwNQSnsk
         Em2g699DYfzGLQQcpOr0O8RE0Xgvnqwdv1geljGuJeTVdtFmqfXMEm1JN8gpDubFvHzr
         gXff7rfyxbkP95L5dr2Uf53kbai1usCjyCcALTsqPlgowIZt2dXB5ZCs50/THuA+WXCK
         aayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706794291; x=1707399091;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UvYdgRVyYAxaFCDQcO3MH7oXSF58uuRK/BXUr5EnBJU=;
        b=VwGELsdtBzEPgLOsLI4W40U8C7+Md86mvKsuYCLC1mqcXyFzbdMlWXVjR570Cl5akO
         wjdugyXx4vfPMYl+lx8UkaGdVicDB8cHaxxnMHUEFfe5mfLOxpx5JYx9F7KlciFgG2gK
         918AB2DbrAzEUfrYD/LXq48F8mD5NzYUNHb9l07zePMV4wr9Xih2Mc3OHnVkNG4Zuiyp
         j1Btt58q/Q5phvCKGSsiIf+1AvtCHY90UZF+w3k1n2F+JfCoDAeGJadRlyiFSDzSijGg
         MPNI7PBVty4vDk9LbOJ1A2PbNsUkk6ZVD80SfKGCI5GlQ7imvLtKxnxRI8P41HZTAMS1
         z0OQ==
X-Gm-Message-State: AOJu0YwUoVlNs7DObyqoCiK8VQOk5rGSb38/jYmNUB9Fg6rBer1YKF4t
	68SjZOvCnn/PpV//fkOhhwG8+WKsHZ6EaCBZB5IpvIAQU9zMoxfr
X-Google-Smtp-Source: AGHT+IHfiSid2/nKADpegRnCiKPQ8CvXTbuwwQ16ndYBh4BujRCF5RpMzfIqI2Dsxl+Sp3f3alFB/A==
X-Received: by 2002:a17:906:388:b0:a36:c478:32c9 with SMTP id b8-20020a170906038800b00a36c47832c9mr990311eja.1.1706794290858;
        Thu, 01 Feb 2024 05:31:30 -0800 (PST)
Received: from [192.168.101.51] ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id hw18-20020a170907a0d200b00a3600d7c2fbsm3314832ejc.176.2024.02.01.05.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 05:31:30 -0800 (PST)
Message-ID: <b594d06bbba5dd65e8f1f9a7cc865a7e5aaaff66.camel@gmail.com>
Subject: Re: [OE-core] [master][PATCH] kernel-devsrc: fix missing RDEPENDS
 gawk and make
From: claus.stovgaard@gmail.com
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 01 Feb 2024 14:31:29 +0100
In-Reply-To: <CADkTA4NBTEH9js2E+KBGx3_LeLzd0RDCVY9gw2gHp-qP5ooO_Q@mail.gmail.com>
References: <20240201115326.506503-1-claus.stovgaard@gmail.com>
	 <CADkTA4NBTEH9js2E+KBGx3_LeLzd0RDCVY9gw2gHp-qP5ooO_Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 13:31:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194587


Thanks for your quick reply Bruce

On Thu, 2024-02-01 at 07:45 -0500, Bruce Ashfield wrote:
> On Thu, Feb 1, 2024 at 6:54=E2=80=AFAM Claus Stovgaard
> <claus.stovgaard@gmail.com> wrote:
> >=20
> > gawk is also needed for x86-64. See scripts/check-sysctl-docs
> > Since version 6.6 the package rules has been split up into a rules
> > file
> > resulting in the need for make. See scripts/package/debian/rules
>=20
> When I looked, the rules aren't actually used when we are building an
> out
> of tree module (and via make scripts prepare) indirectly.
>=20
> In a situation like this the approach I've taken to exclude the
> source from
> devsrc to keep it minimal.

Okay. I will patch the do_install instead and remove the debian rules
file. I don't see the usage either so it is fine with me.

>=20
> If you are seeing gawk required as part of building a module or make
> scripts prepare, then we definitely do need to add the dependency.
>=20

I can see we are including the scripts/check-sysctl-docs and objdump-
func needing gawk - no matter the architecture.

Alternative we should properly remove those also.

Will split it up in two commits, and start with the "make" fix

/Claus


> >=20
> > For reproducing the issue on a normal qemux86-64 machine, change to
> > the
> > linux-yocto-dev kernel, add the kernel-devsrc to the toolchain
> > target
> > task and disable ptest in distro features. (Notice ptest pulls gawk
> > and
> > make in as RDEPENDS for other packages hiding the issue)
> >=20
> > when populating sdk you will see dnf failing.
> >=20
> > =C2=A0Problem: conflicting requests
> > =C2=A0 - nothing provides /usr/bin/gawk needed by kernel-devsrc-1.0-
> > r0.qemux86_64 from oe-repo
> > =C2=A0 - nothing provides /usr/bin/make needed by kernel-devsrc-1.0-
> > r0.qemux86_64 from oe-repo
> >=20
> > Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
> > ---
> > =C2=A0meta/recipes-kernel/linux/kernel-devsrc.bb | 6 ++++--
> > =C2=A01 file changed, 4 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb
> > b/meta/recipes-kernel/linux/kernel-devsrc.bb
> > index ce5777fbe9..222f6cf8e1 100644
> > --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> > +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> > @@ -395,7 +395,9 @@ RDEPENDS:${PN} +=3D "${@bb.utils.contains('ARCH',
> > 'x86', 'elfutils-dev', '', d)}"
> > =C2=A0RDEPENDS:${PN} +=3D "${@bb.utils.contains('ARCH', 'powerpc',
> > 'elfutils-dev', '', d)}"
> > =C2=A0# 5.8+ needs gcc-plugins libmpc-dev
> > =C2=A0RDEPENDS:${PN} +=3D "gcc-plugins libmpc-dev"
> > -# 5.13+ needs awk for arm64
> > -RDEPENDS:${PN}:append:aarch64 =3D " gawk"
> > +# 5.13+ needs awk
> > +RDEPENDS:${PN} +=3D "gawk"
>=20
> The commit message should really say "all architectures require
> gawk", if this
> is the change we are making to the actual RDEPENDS itself.
>=20
> > =C2=A0# 5.13+ needs grep for powerpc
> > =C2=A0RDEPENDS:${PN}:append:powerpc =3D " grep"
> > +# 6.6+ needs make for debian package rules
> > +RDEPENDS:${PN} +=3D "make"
>=20
> Similarly, we should just be removing the rules from devsrc if they
> aren't required
> and we can avoid this dependency.
>=20
> Bruce
>=20
> > --
> > 2.43.0
> >=20
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#194584):
> > https://lists.openembedded.org/g/openembedded-core/message/194584
> > Mute This Topic:
> > https://lists.openembedded.org/mt/104095126/1050810
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> > bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20
>=20
>=20
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II


