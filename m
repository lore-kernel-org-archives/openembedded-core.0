Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F17CC3DA49
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 13:18:10 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.10477.1721135883699185369
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 06:18:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VrdSuhwZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4266182a9d7so35370455e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 06:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721135882; x=1721740682; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Bc7D/ZEbZ7G/D5PnggGZK7oxn1ulqXhVgNADK4EwgY0=;
        b=VrdSuhwZ42Y9S3zCSTd06zkd6prX4/zjTiWPzuJx2IWH7F7xo6GrT5jnk7q6MEsTIW
         8PtaT0de6hymQoiK+VsExyEfPjFUS9NEuCkaVSal/61i+IJKf5d9U03EJgqyJLyD9Xmm
         AQVxYsUXL9D6RXT1r+/eer8eeydumcnWmLJSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721135882; x=1721740682;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bc7D/ZEbZ7G/D5PnggGZK7oxn1ulqXhVgNADK4EwgY0=;
        b=Erkz4fJ4W1IORU19cTDBRs8POzutBHyaH8bd+Ii8EG8tDk6D6HbiQriDEPb/KzOK/s
         hxEAWpjhaTGSC2AeQTNjHg4NRbDw28Etct52nqRZapRyAuHvTHfEudKt1iCetCspy7+k
         MfjYI80VMwRr1ulWbvZO2PFlReBI+LHoRoWNeScEp7pTc8ZmUIsQ0RhVQGICP1UxPInq
         E+4mESUezYNMoJUhJcbDEMHn4QMNzd+BelFWn2qMWfglQEOeVisfzqdUqBxrg7rZdYJf
         5+2qgF3ZaE5tdfsiJ6CLK9OE4gEqyP9QCsHOVxDqLaReVg0TxX01zCksQ0CkKC+7Gunf
         otUQ==
X-Gm-Message-State: AOJu0YyKjX7FBi8eIuJKn+GD9z6nesR8HR85jdM4T4yH1a4pUWNWR/K+
	m9onkWdHnItI3WETW/Uj5S5UnGOZLnInemm9SXpe/l9hdav1E51uDA+ShJ4kcGI=
X-Google-Smtp-Source: AGHT+IF4gAakHbG5gK3jg4OD0Dw5+FnoWRBIqcjnatVawe0TNF+ChiiMUVbguQEEBNdz9EDtKzvpUw==
X-Received: by 2002:a05:600c:45d3:b0:426:6f48:2dad with SMTP id 5b1f17b1804b1-427ba6fc389mr13780545e9.35.1721135881874;
        Tue, 16 Jul 2024 06:18:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:86a0:3ee3:878:91c7? ([2001:8b0:aba:5f3c:86a0:3ee3:878:91c7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f2d7955sm163571775e9.47.2024.07.16.06.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 06:18:01 -0700 (PDT)
Message-ID: <532dd83f68d908269ade266c450767921733f7ad.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v6 00/12] Add SPDX 3.0 support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jul 2024 14:18:00 +0100
In-Reply-To: <17E2852F1C219F3B.14505@lists.openembedded.org>
References: <20240703140059.4096394-1-JPEWhacker@gmail.com>
	 <20240712160304.3514496-1-JPEWhacker@gmail.com>
	 <54c574fdb35ef25b71baaf1e1adfa8bd909a5f39.camel@linuxfoundation.org>
	 <CAJdd5GaA4tByvK04pNycoApWYHeznYVe=y1ckSWsUVu=jwmjnQ@mail.gmail.com>
	 <330caeaef519ceaf40dceac15ccd00be2ed38d60.camel@linuxfoundation.org>
	 <CAJdd5GZV2Ygb4iAPtRgyHt_40nBAonzfS6=XzmH9KwxOyUfyag@mail.gmail.com>
	 <17E2852F1C219F3B.14505@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 13:18:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202112

On Tue, 2024-07-16 at 00:00 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> On Mon, 2024-07-15 at 15:26 -0600, Joshua Watt wrote:
> > On Mon, Jul 15, 2024 at 3:07=E2=80=AFPM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >=20
> > > On Mon, 2024-07-15 at 14:40 -0600, Joshua Watt wrote:
> > > > On Sat, Jul 13, 2024 at 12:44=E2=80=AFAM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > >=20
> > > > > On Fri, 2024-07-12 at 09:58 -0600, Joshua Watt via
> > > > > lists.openembedded.org wrote:
> > > > > > This patch series add support for SPDX 3.0 and sets it as the
> > > > > > default.
> > > > > > Currently it is not possible to have SPDX 2.2 and SPDX 3.0
> > > > > > enabled at
> > > > > > the same time
> > > > > >=20
> > > > > > v2: Added tests and addressed feedback
> > > > > > v3: Fixed several oe-selftest and build failures
> > > > > > v4: Fixed silly typo mistake in staging.bbclass
> > > > > > v5: Reworked to make SPDX 3 output reproducible by default.
> > > > > > Variables
> > > > > > =C2=A0=C2=A0=C2=A0 that introduce non-reproducible output are d=
ocumented as
> > > > > > such.
> > > > > > v6: Many changes:
> > > > > > =C2=A0 * Fixed bug where building baremetal images would break
> > > > > > SPDX
> > > > > > 2.2
> > > > > > =C2=A0 * Most SPDX code is now in python library files instead =
of
> > > > > > tasks
> > > > > > =C2=A0 * Removed dependency on pacakge_write_* tasks
> > > > > > =C2=A0 * Fixed sstate selftest cases to account for SPDX 3.0 ta=
sk
> > > > > > names
> > > > >=20
> > > > > This had a lot of failures in testing I'm afraid:
> > > > >=20
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds=
/7134
> > > >=20
> > > > This appears to be caused because the SPDX tasks are not running
> > > > for
> > > > some recipes (e.g. automake). It looks like this like:
> > > >=20
> > > > =C2=A0 do_create_rootfs_spdx[recrdeptask] +=3D "do_create_spdx
> > > > do_create_package_spdx"
> > > >=20
> > > > is not actually strong enough to make sure the SPDX tasks for
> > > > automake
> > > > run for e.g. core-image-sato-sdk, but I don't know why. I'll keep
> > > > looking, but if anyone happens to know off the top of their head
> > > > let
> > > > me know
> > >=20
> > > Can you be specific about which tasks you mean when you say "make
> > > sure
> > > the SPDX tasks for automake run"? Do you mean do_create_spdx,
> > > do_create_package_spdx or a different one?
> >=20
> > Specifically, do_create_package_spdx must be run for each package
> > installed in the rootfs before do_create_rootfs_spdx runs. I thought
> > that
> >=20
> > =C2=A0 do_create_rootfs_spdx[recrdeptask] +=3D "do_create_spdx
> > do_create_package_spdx"
> >=20
> > would do this (the do_create_spdx is probably not necessary), since
> > AFIACT, this is also how the packages get generated before being
> > installed in the root file system via manipulation of
> > do_rootfs[recrdeptask], but I think I'm missing something?
>=20
>=20
> In packagegroups.bbclass there is this being added:
>=20
> do_create_package_spdx[deptask] =3D "do_create_spdx"
> do_create_package_spdx[rdeptask] =3D ""
>=20
> and=20
>=20
> bitbake core-image-sato-sdk -g -c create_rootfs_spdx
>=20
> lists
>=20
> "core-image-sato-sdk.do_create_rootfs_spdx" -> "automake.do_create_packag=
e_spdx"
>=20
> in tasks-depends.dot if I disable it.
>=20
> I'm not 100% sure what is going on and should sleep but wanted to share
> that before I did.

I deleted those two lines and ran a build which passed testing.

I don't think we need them with spdx 3 since it doesn't have the "hash
changing" issue that we had that caused us to add that for spdx2?

The commit was:
https://git.yoctoproject.org/poky/commit/meta/classes-recipe/packagegroup.b=
bclass?id=3D06b5f249ced23b6bc442758131832b8640164b44

Cheers,

Richard


