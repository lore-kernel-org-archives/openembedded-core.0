Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0B19975354;
	Thu, 10 May 2018 21:43:25 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id a8-v6so6046996wmg.5;
	Thu, 10 May 2018 14:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=RGTHldVf+txcaE3Ah1ThA6fDyG9ChhiIgUh7X8A5GHg=;
	b=JttyOJbTfsa/l2tZZRV1/sQsETIUXZMN2/pNqVZJYZRjT6LUJ548UVqpZVuUVicXE7
	qrFQjysZIjxvTz/OgEGmaEg2lTQuYUsWsFj8Ekbtb6RsTOaqZDwHqPDvH8tOoE4ws9y+
	qnu2IUFCE0ZVdSfEmP7sgtOCJaAJQ1dci9bp6afwGeN1dFaS20kdoqY65iHVZzTsvfZS
	WMMRhh3ogHoTE+rTOXeV0qpbzAz6PMsvXYoBxWZ2F3toG6XVn9snRUjPR1UAbUkaYTSZ
	SBFApnPD7y9qp5dc4pb9NdrNW+GBaAcI1aGzw6Jkb6j+Ovm7UbVQCbo3poQYQmvtb/TH
	t1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=RGTHldVf+txcaE3Ah1ThA6fDyG9ChhiIgUh7X8A5GHg=;
	b=t9+4sprAjkaP0Ef6qZGmTQSR1pl7822FeLDq3PPjKMBoNFD111VuSP60in+Ksbev4z
	MO7aJMdhW3XtUWPy+oSKx37CVs/edHCOFk3mpgUDbIlgscDT29ZoLeafbBj731sjra8Z
	p5Nb9inpT1rFv6Ppxuk3pwbX0SMLJc4gUlN2u4Dz2e9D5kfn6mWMj/kf9mZ5Rz0dFWNU
	iXbGktydj08qBbFoD6JushxjmEA/pW0k8Q0BBtUNM5sQiMsYXVvHhB4zS2QrxFr7PQ05
	o6TnXyMsOdzjPH0W8QO2OpyIxlnJKnbS3b4B94iNc2zwgW/oaAiTrpjTnH0JTtkp9qiO
	zxRg==
X-Gm-Message-State: ALKqPwf4LyDJYqc+BaTgBp7lAzV0hA8VKyCf/1eQM1goSY7S/7WOzZPi
	cUhOKfxvoUZershWi1Sd0bQ=
X-Google-Smtp-Source: AB8JxZowaorblDycBVdpYIBoAGidyjhVK4fl/6R/Lo3rspK4f0ISLw1KhFoAcfysIFsCpgN9akei0Q==
X-Received: by 2002:a1c:6489:: with SMTP id
	y131-v6mr348703wmb.82.1525988606503; 
	Thu, 10 May 2018 14:43:26 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	16-v6sm2548943wrt.20.2018.05.10.14.43.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 10 May 2018 14:43:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 10 May 2018 23:43:25 +0200
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20180510214325.GC1954@jama>
References: <CAMKF1spa1bbrUjQWbhdUw3C4Cxu99fU=Be3sEm+SYFNq_oxEKw@mail.gmail.com>
	<CA+chaQcUU=Dew1cATDBpuA2_f_eh1=DAyEMaDHfVx7kY88rZhg@mail.gmail.com>
	<8d962430-ac63-5e97-fd32-2c0464c62acb@gmail.com>
	<20180510191145.GA1954@jama>
	<CAJ86T=Xz+2neJPBw41_sFxd977xp=zznsgzFdbeHJ-aysJNk+g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=Xz+2neJPBw41_sFxd977xp=zznsgzFdbeHJ-aysJNk+g@mail.gmail.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Cc: Yocto Project <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: [RFT] GCC 8.1
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
X-List-Received-Date: Thu, 10 May 2018 21:43:26 -0000
X-Groupsio-MsgNum: 111238
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qbvjkv9qwOGw/5Fx"
Content-Disposition: inline

--Qbvjkv9qwOGw/5Fx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 10, 2018 at 12:27:50PM -0700, Andre McCurdy wrote:
> On Thu, May 10, 2018 at 12:11 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > On Thu, May 10, 2018 at 11:50:02AM -0700, Khem Raj wrote:
> >> Hi Martin
> >>
> >> Thanks for testing and reporting back
> >>
> >> On 5/9/18 2:38 AM, Martin Jansa wrote:
> >> > My initial tests show couple issues, but usually caused by other cha=
nges
> >> > in that branch, not the gcc-8 itself.
> >> >
> >> > 1) strace-4.22 from
> >> > http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkr=
aj/gcc-8&id=3Daf33a8b721cc9caebd3f5226b4c5903f666ab654
> >> > fails to build with ptest enabled (it builds with 4.20 version if I
> >> > revert this change)
> >> > ../../strace-4.22/tests/inject-nf.c: In function 'main':
> >> > ../../strace-4.22/tests/inject-nf.c:86:1: error: r7 cannot be used in
> >> > asm here
> >> >   }
> >> >   ^
> >>
> >> are you targeting thumb1 ? how can I reproduce it ?
> >
> > I'm trying to find out what's different in the builds where it was
> > failing, will provide more info later.
>=20
> This is probably due to making an inline syscall from Thumb (doesn't a
> matter Thumb1 or Thumb2) with frame pointers enabled.
>=20
> Does adding -fomit-frame-pointer to CFLAGS fix it?

It was with raspberrypi3, thumb (Thumb2) enabled in DISTRO, there is
already -fno-omit-frame-pointer in the default command line for it,
adding -fomit-frame-pointer at the end fixes it:

docker-lge @ ~/build/build-webos-master/BUILD/work/raspberrypi3-webos-linux=
-gnueabi/strace/4.22-r0/build/tests $ arm-webos-linux-gnueabi-gcc  -march=
=3Darmv7ve -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard -mcpu=3Dcortex-a7 =
--sysroot=3D/OE/webos/build/build-webos-master/BUILD/work/raspberrypi3-webo=
s-linux-gnueabi/strace/4.22-r0/recipe-sysroot -DHAVE_CONFIG_H    -I. -I../l=
inux/arm -I../../strace-4.22/linux/arm -I../linux -I../../strace-4.22/linux=
 -I.. -I../../strace-4.22 -DTESTS_SIZEOF_KERNEL_LONG_T=3D4 -DTESTS_SIZEOF_L=
ONG=3D4  -Wall -Wempty-body -Wformat-security -Wignored-qualifiers -Wimplic=
it-fallthrough=3D5 -Winit-self -Wlogical-op -Wmissing-parameter-type -Wnest=
ed-externs -Wold-style-declaration -Wold-style-definition -Wsign-compare -W=
type-limits -Wwrite-strings -O -fno-omit-frame-pointer -g -feliminate-unuse=
d-debug-types -fdebug-prefix-map=3D/OE/webos/build/build-webos-master/BUILD=
/work/raspberrypi3-webos-linux-gnueabi/strace/4.22-r0=3D/usr/src/debug/stra=
ce/4.22-r0 -fdebug-prefix-map=3D/OE/webos/build/build-webos-master/BUILD/wo=
rk/raspberrypi3-webos-linux-gnueabi/strace/4.22-r0/recipe-sysroot=3D -fdebu=
g-prefix-map=3D/OE/webos/build/build-webos-master/BUILD/work/raspberrypi3-w=
ebos-linux-gnueabi/strace/4.22-r0/recipe-sysroot-native=3D  -pipe  -c -o in=
ject-nf.o ../../strace-4.22/tests/inject-nf.c -fomit-frame-pointer

This might come from:
meta/conf/bitbake.conf:DEBUG_OPTIMIZATION =3D "-O -fno-omit-frame-pointer $=
{DEBUG_FLAGS} -pipe"
because in this build I had DEBUG_BUILD enabled.

Will retest with 4.20 version + DEBUG_BUILD to see if it fails there as wel=
l now.

Thanks for pointers.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Qbvjkv9qwOGw/5Fx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWvS8/QAKCRA3VSO3ZXaA
HB7OAKC0DdXpap3Cw3RJFDvMwAi8HaMAKQCgoXefXcCRSs0tIz/MV3surBHilbs=
=1qrK
-----END PGP SIGNATURE-----

--Qbvjkv9qwOGw/5Fx--
