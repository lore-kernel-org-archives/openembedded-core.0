Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id F1A1075894;
	Fri, 30 Oct 2015 21:02:56 +0000 (UTC)
Received: by wmeg8 with SMTP id g8so20840428wme.1;
	Fri, 30 Oct 2015 14:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GpBRtb7sm9jxGvzaVi6+G/sO6tJXT4kzSmQWuW/6wPw=;
	b=mBQS2fqfJ8Gx1jg1hRUUStWRMtfL1xnr/N+YYQC/eoiMhHemGd5VkMI7m4v0u1fbC7
	sEZ0MIvNwBCS/eQbItFrrwzeF9xT19ppE2slOiQA93FQGKYfrs4yMXu4oEiIolm+PQ44
	wcxmw0DzTGOkyWYfhaOB8qJS+H6WSFYnhHtfnP0p74jrUUCVEYwZjfEy1D5zm/nCOl43
	MGxuh2IdimeDRfKnaMx7eIR+GVwlxskHG62BIdD1cvMcrBGy7Gk5vdIudwUxBXNLXXvt
	UM5JKYUkuK1zrV1G8SC1+vQ5J1JtiKh4UMtszq31iWAzVaS0KNagl9dBhExR0xAiNyKN
	OHKA==
X-Received: by 10.28.52.17 with SMTP id b17mr226274wma.81.1446238976990;
	Fri, 30 Oct 2015 14:02:56 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	v191sm4628776wmd.24.2015.10.30.14.02.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Oct 2015 14:02:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 30 Oct 2015 22:03:31 +0100
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20151030210331.GE2566@jama>
References: <9D79B6D4-2FE1-4C77-A359-C0F47DCC090D@gmail.com>
	<2298055.NpNxBfbHVS@bancha.hex>
	<CAMKF1srB9b9iPF3WGyUeozOQdXi3DRa=BPx9CmtrM7VN_CAXeQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srB9b9iPF3WGyUeozOQdXi3DRa=BPx9CmtrM7VN_CAXeQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of libcs in OE-Core glibc/uclibc/musl
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
X-List-Received-Date: Fri, 30 Oct 2015 21:02:58 -0000
X-Groupsio-MsgNum: 72789
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5UGlQXeG3ziZS81+"
Content-Disposition: inline

--5UGlQXeG3ziZS81+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2015 at 01:55:42PM -0700, Khem Raj wrote:
> On Fri, Oct 30, 2015 at 4:10 AM, Roman Khimov <roman@khimov.ru> wrote:
> > =D0=92 =D0=BF=D0=B8=D1=81=D1=8C=D0=BC=D0=B5 =D0=BE=D1=82 29 =D0=BE=D0=
=BA=D1=82=D1=8F=D0=B1=D1=80=D1=8F 2015 08:42:31 =D0=BF=D0=BE=D0=BB=D1=8C=D0=
=B7=D0=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D1=8C Khem Raj =D0=BD=D0=B0=D0=BF=
=D0=B8=D1=81=D0=B0=D0=BB:
> >> 1. Drop kconfig support in glibc and we become inline with upstream
> >
> > No opinion on this.

I agree, it can be outside oe-core and enabled + maintained by those who
care about it, it doesn't need to burden you Khem when you're doing all
glibc upgrades in oe-core.

> >> 2. Move musl support to OE-Core from meta-musl
> >
> > I would certainly support this kind of for musl.

I agree, it looks like more reasonable replacement for uclibc.

> >> 3. Drop uclibc or leave it in current broken state, I would like to pu=
ll it
> >> out into a layer in meta-openembedded and we can leave the core plumbi=
ng as
> >> it is in OE-Core
> >
> > But I don't think that moving uClibc out of OE Core is OK with the next
> > release. We do use it and there are probably some users too, I think it=
's
> > better to have a longer transition period for this kind of change, like=
 make
> > the next release support three libcs and only move uClibc to meta-oe in=
 a
> > subsequent release. This would give everyone some time to evaluate
> > alternatives rather than forcing to make choices right at the OE Core u=
pdate
> > when usually there are lots of other things that need to be fixed.
>=20
> may be not a bad idea however, this still will be available as an
> independent layer on meta-openembedded
> but we could still keep it for a release

I agree again, few people are using it (based on recent survey from
Cliff), so having it in separate layer looks good to me.

> >
> >> 4. Poky-tiny switches to use musl
> >
> > No opinion on this.

I won't ever use poky-tiny, but switching it from glibc+kconfig to musl
would probably make it easier to do some build testing on Yocto AB, so
in the end it should improve test-coverage than current uclibc in
oe-core has.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5UGlQXeG3ziZS81+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYz2yIACgkQN1Ujt2V2gBy8eQCZARA3gg3LZSnuHf0jfnq4NCRe
XAEAnixGRFB8v69fkkbkSQhoQcgUbFLR
=OiFn
-----END PGP SIGNATURE-----

--5UGlQXeG3ziZS81+--
