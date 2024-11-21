Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73874D743C9
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 10:29:42 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.7621.1732184976331845720
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 02:29:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VR4oa0rW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-431481433bdso5885815e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 02:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732184975; x=1732789775; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YMeGWNwgNYUX+ylca6rQcF9He639tsTRdYhDEEPYoiE=;
        b=VR4oa0rWQp9Mq5vDh+JmtI6ftxibpasNpoo31VjemW7JvCjhQ9NyzEKAC6E+49Xm4O
         yivk8vi6Xk0WKa0B0DEYK2br8vPOQOaB+/uWRCKatrFr5kpGxRs5CjG8cZovfOnvc6bQ
         Jt3TtkwPki9ame7NOoqoo94a/O3IQobSkyQ/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732184975; x=1732789775;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YMeGWNwgNYUX+ylca6rQcF9He639tsTRdYhDEEPYoiE=;
        b=Kb6wELNiKpAmnpg0xgn/rC9eTXFsqjavq/Mqui+SqhJDoUkoZvdBzRHAf7v/nlvKpm
         Si5Hd9HoIGqHY8RH2L0ydA1CCPEPYbGxzVEiOaksBHp1vfy8Uxkdbd9YgoBcTfXlyl51
         Pb2+NhlBvmMPp17hwGmbaIFhTkdznSKNk4FtfRwpPAsJUGrN/V7h3T3uDgOBB/hDK6Bk
         FtHdyxjonSPpvowHdQFoEvvLXq/ez8JfAOEvFFyDj4t+DqfiXm5YbxCCuHLVlRBgByGj
         d1FJ2aCvcyGTSKSYZSwZTlc2sibulvdLj4oRzOWlvm9q1iHpE/PGFwt5c7vu5EpnuTlC
         yThA==
X-Gm-Message-State: AOJu0YzrbyNfEauXestDd06aIMnhdkqWQM+VqCWdBi6oJit6cAIDXnoA
	W380jnqsNrO+/BRsOBfABivkUJyTcL1jCCU4Gj66iOjaDpmagj/vDqyNhIceJ9c=
X-Google-Smtp-Source: AGHT+IHjtD1H53rhamq0Ud+VT8ru4jkPEyuOyrnk1Jiy1h2tPkfEDLYI6mw+/+ior5VcM07YzJbIaQ==
X-Received: by 2002:a05:600c:3c97:b0:432:d797:4071 with SMTP id 5b1f17b1804b1-4334f026fe4mr48792675e9.32.1732184974600;
        Thu, 21 Nov 2024 02:29:34 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:67b8:af30:418e:1d3e? ([2001:8b0:aba:5f3c:67b8:af30:418e:1d3e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b46189besm49264715e9.26.2024.11.21.02.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 02:29:33 -0800 (PST)
Message-ID: <9733ac215423b7161005b10918239e8a0964d067.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] qemu/testimage: Ensure GNU tar is in test
 images
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2024 10:29:33 +0000
In-Reply-To: <CAMKF1soj2TtPX5KTrO2Hk5YUySYZ9-mDzK6=SbJtej=uYFnDNw@mail.gmail.com>
References: <20241120213329.2482150-1-richard.purdie@linuxfoundation.org>
	 <CAMKF1soj2TtPX5KTrO2Hk5YUySYZ9-mDzK6=SbJtej=uYFnDNw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 10:29:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207520

On Wed, 2024-11-20 at 19:08 -0800, Khem Raj wrote:
> On Wed, Nov 20, 2024 at 1:33=E2=80=AFPM Richard Purdie via
> lists.openembedded.org
> <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> >=20
> > We've seen cases where a ptest (strace) has a 43GB sparse file in the t=
est
> > directory. busybox tar doesn't work well with this. The resulting 1.4GB=
 archive
> > takes hours to extract too.
> >=20
> > Ensure tar is added to our full images and use the sparse option to col=
lect
> > files for debugging. This stops crazy build hangs.
> >=20
> > Since tar is GPLv3, we have to exclude it from that test code. We don't=
 boot
> > any of those images so the debug collection code is safe there, at leas=
t for now.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > =C2=A0meta/conf/distro/include/no-gplv3.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
> > =C2=A0meta/conf/machine/include/qemu.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 +++
> > =C2=A0meta/lib/oeqa/selftest/cases/incompatible_lic.py | 1 +
> > =C2=A0meta/lib/oeqa/utils/postactions.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 ++-
> > =C2=A04 files changed, 8 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/meta/conf/distro/include/no-gplv3.inc b/meta/conf/distro/i=
nclude/no-gplv3.inc
> > index b3eb936d94f..705e05319af 100644
> > --- a/meta/conf/distro/include/no-gplv3.inc
> > +++ b/meta/conf/distro/include/no-gplv3.inc
> > @@ -28,3 +28,5 @@ CORE_IMAGE_BASE_INSTALL:remove:pn-core-image-weston =
=3D "matchbox-terminal"
> > =C2=A0# Some python-tests use bash outside of ptest
> > =C2=A0RDEPENDS:${PN}-tests:remove:class-target:pn-python3 =3D "${MLPREF=
IX}bash"
> > =C2=A0INSANE_SKIP:${PN}-tests:pn-python3 =3D "file-rdeps"
> > +
> > +MACHINE_ESSENTIAL_EXTRA_RDEPENDS:remove =3D "tar"
> > diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/inc=
lude/qemu.inc
> > index bb7aec76750..d7392d47623 100644
> > --- a/meta/conf/machine/include/qemu.inc
> > +++ b/meta/conf/machine/include/qemu.inc
> > @@ -28,3 +28,6 @@ KERNEL_FEATURES:append:pn-linux-yocto =3D " features/=
nfsd/nfsd-enable.scc"
> > =C2=A0KERNEL_FEATURES:append:pn-linux-yocto-rt =3D " features/nfsd/nfsd=
-enable.scc"
> >=20
> > =C2=A0IMAGE_CLASSES +=3D "qemuboot"
> > +
> > +# Use gnu tar so we can handle sparse files in testimage debug archive=
s
> > +MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "tar"
>=20
> I would suggest adding it where it makes a difference intead of adding
> it to all qemu images.

Which images are going to have the testimage code run against them? It
can be any of them.

I initially added this in the image class code but made it conditional
upon qemu. Putting this into the qemu machine code itself seemed more
appropriate after looking at it like that.

So I'm open to better ideas but I need a specific suggesting of where
you think is better.

> many real world images may not want/have gtar in image and they do use
> qemu for testing images

How many use the debug collection mechanism in oeqa though?

> doing this means they will be testing something else on qemu as
> compared to real target.

This isn't doing it for anything other than qemu. Thankfully tar has
minimal dependencies so whilst it does change the testing, the impact
is relatively isolated and mainly means we don't expose busybox tar to
as much automated testing.

As I said, I'm open to there specific proposals but this was the best I
could come up with. We have a serious issue with the sparse files and
doing nothing is not an option.

Cheers,

Richard


