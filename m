Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1DFB97F938
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 22:43:52 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id 107so465116uau.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 15:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=o3y/NqSLicPLz3QBUfNdY2nrcWoLVT7kdQnvU7CdBtQ=;
	b=t5/LKmg2ZTOTWhygJvyogvNvHFzXcvPf+q8gGonjG87lh9gUpArEBQLN1q2JiW+okT
	KhIMWzyj2/4kTPB/W/S6haW2N7upS5AKL60I4NJLA2Rej5VeyzLDylmNSk74hif/aSvA
	oPFGoBavagZmUTN7vkrcdbcTdmAp0tR/XRo8vyT49x9+a0VQalsrhJSA586ADCnpEqzi
	uB84lgqrZkyDdPTLdO8Wj6/yHvA8dSLUHWMwJgIdUiPEGBvsg+YZemjPj3KTsU2U1Nax
	QrjEyX8wPAd3gpH/aljdl+Eoawv+gY6MmCD8ZFlqhC12y26UKI/yAza8Sknjg1zCmpxm
	0MkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=o3y/NqSLicPLz3QBUfNdY2nrcWoLVT7kdQnvU7CdBtQ=;
	b=XX6FF2+HRoIwd+sJYMg0J58yDoqmks8nLFlopH2DcMSaM/wZEhOlkwYJ7ktK6wv3hG
	vMScpdVs7lt+SORgVPnurj+qBo9Sm6C+x7XgRwNUeql52iDHd4Ng5BfUHmMkOV6e17qG
	aCNxyFjhxOCiUrdVSQVIrZ+egcoJXKEnQoU+QWUEVNf9F/24c6v506usxmD9PNZIUdAb
	7VwMurp1tD58w3y/phwhWQo7Ej2CafjnNRZROqK1kI8bnvDY8eGpDZ/q9rBDtp8QEGQv
	PkqGuBQyIYFITm+JDTZXCJnpSUY4HzsOw2T0+uieDptY1+eKTwqBnoRVeIggEl82o8/W
	DlzA==
X-Gm-Message-State: APjAAAUKxWz+kqmoJuyS3CC0ARvg3+uDJ0+BUUwTcpQmfOgubbErXr7U
	ikmIoFDHWhdANL9H1K3VkI17UA6SfEVLqXifucc=
X-Google-Smtp-Source: APXvYqyWH8lJsNNVd7LjmN4av5EbkFdwUeOAxP622O3pIcML0ue8sRjYQ3VcM5pVqg0LzicwhxzEiPSNWQArAerYDWs=
X-Received: by 2002:a9f:3f06:: with SMTP id h6mr34761uaj.106.1568673833793;
	Mon, 16 Sep 2019 15:43:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190916192429.27294-1-armccurdy@gmail.com>
	<20190916192429.27294-4-armccurdy@gmail.com>
	<0a559d39-3699-4504-addc-89fe7252fbea@Spark>
	<CAJ86T=UOKYMh-r1kmO2xjyu6aKDe1E3x8MVOd6J96qCfUNo_yA@mail.gmail.com>
	<20190916223454.GA27980@localhost>
In-Reply-To: <20190916223454.GA27980@localhost>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 16 Sep 2019 15:43:42 -0700
Message-ID: <CAJ86T=WeoZJsHqTusGmi=M7Qb7MgW1o7UUM4aO7D8wjx8qZp=A@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] ffmpeg: don't rely on configure to correctly detect ARM vfp or neon
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Sep 2019 22:43:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2019 at 3:34 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Mon, Sep 16, 2019 at 03:08:01PM -0700, Andre McCurdy wrote:
> > On Mon, Sep 16, 2019 at 2:33 PM Christopher Larson <kergoth@gmail.com> =
wrote:
> > >
> > > This seems like something that could do with a =E2=80=98why=E2=80=99 =
in the commit message and/or comments, to me.
> >
> > To be consistent with:
> >
> >   https://git.openembedded.org/openembedded-core/commit/?id=3D1a563214c=
af6bd5b3a026ebe953f8c692ebd640a
> >...
>
> libwebp sets -mfpu=3Dneon when autodetecting,
> is there a similar problem with ffmpeg?
>
> > > +# Do not trust configure to determine if ARM vfp or neon are availab=
le.
> > > +#
> > > +EXTRA_OECONF_ARM =3D " \
> > > + ${@bb.utils.contains('TUNE_FEATURES','vfp','--enable-vfp','--disabl=
e-vfp', d)} \
> > > + ${@bb.utils.contains("TUNE_FEATURES",'neon','--enable-neon','--disa=
ble-neon',d)} \
> >...
>
> If we cannot trust the vfp autodetection, why can we trust that the
> autodetection of the vfp variant (vfpv2, vfpv3 or vfpv3-d16) and
> the exact architecture (e.g. armv5te, armv6, armv6k or armv6t2)
> are correct?

In general we can't. However these are all corner cases which are
rarely (if ever) tested.

For ffmpeg configuring with --enable-runtime-cpudetect (which I think
we effectively do by default) probably hides a lot of the configure
time misdetection too.

> Which brings us back to the problem what the actual problem is (if any).

I built for target without VFP or NEON and saw both as being enabled
according to the configure log. Didn't investigate further than that.

> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>

