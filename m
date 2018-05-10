Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 912C775393;
	Thu, 10 May 2018 22:07:35 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l1-v6so6888582wmb.2;
	Thu, 10 May 2018 15:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=N37Dn/w9MnsznU4IbYPxNJSeiWD1FwcYhZu+RuuIEtc=;
	b=RPgwhaxVuH767CUZSo7+9YHMf3BEYZCRS0Yv9S7IShz3Pd/wO2lym5USxvJ5dWypA+
	zUMOby80pVbgccWEDtT3230PRrHdThEtVWcyBVwtXL5yaRe5B9rcV1ot1fDXF8h8n50g
	5q2CyJJnlYgtDE4m8Ys2RO//zuKJb+lq6DiJ0LoibA3MOzU7/X77WifpjsY3oCR+BNwF
	u/6M3yr3+6TBpKjLQNdPTOChcoZ2LH+1k+MIvH62pa6uopPjBToYEaBXbchTzyiIruEE
	IpDsA8Qs2mmyRxL5NF135/I4Z0MaoA/s83kxaPUSXe4xTMzHqBuHse+2v50OPRlMwaEg
	bMhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=N37Dn/w9MnsznU4IbYPxNJSeiWD1FwcYhZu+RuuIEtc=;
	b=FLXQxwJikiDMW+j4bR16OH68cRsKXwBzlRit93REhVCAJmLdPSQy4iUkRr51zMqN/v
	UilC99MYTPIf/0iNTwBYFpPnTbqeRb7V27q/mGdQFW+qtDIYCOUJ8BUrqonU48UO85Hy
	5egVVksZVkdVeSO6RI/3NyBvCvtQHepA4U73Dsdy+4IpSqSDjekyVWGRuxhm3OseEpOb
	h7IbViTIkaqAE328BcgxvWUlaTOqW8LTxQBhQ+4HfsAv2KDUNj4Mjjbh5RilfBkckIoi
	CYYUte2c9HX/Bjer1W+5rhLcn73Iar5qpVNnnYBkP7ywjCSZ+0ScuE9CB9sIUt2TG1W8
	KYCQ==
X-Gm-Message-State: ALKqPwfFrNB9+70tBG+yD00q+T8w95lhtBqmaZzpk2HN/7EnoucA/oDp
	8ZocTdmF7aYRmei5dfzBkCU=
X-Google-Smtp-Source: AB8JxZrAPGfAaIp+JzISF6Nc1rpnNw+gieuxyczSsd5Hx+3XDQBkr/dsZJzVhasd1NCkX7Af7I+KEQ==
X-Received: by 2002:a1c:7d42:: with SMTP id
	y63-v6mr387779wmc.121.1525990055884; 
	Thu, 10 May 2018 15:07:35 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	e80-v6sm2879636wmd.1.2018.05.10.15.07.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 10 May 2018 15:07:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 11 May 2018 00:07:35 +0200
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20180510220735.GD1954@jama>
References: <CAMKF1spa1bbrUjQWbhdUw3C4Cxu99fU=Be3sEm+SYFNq_oxEKw@mail.gmail.com>
	<CA+chaQcUU=Dew1cATDBpuA2_f_eh1=DAyEMaDHfVx7kY88rZhg@mail.gmail.com>
	<8d962430-ac63-5e97-fd32-2c0464c62acb@gmail.com>
	<20180510191145.GA1954@jama>
	<CAJ86T=Xz+2neJPBw41_sFxd977xp=zznsgzFdbeHJ-aysJNk+g@mail.gmail.com>
	<20180510214325.GC1954@jama>
MIME-Version: 1.0
In-Reply-To: <20180510214325.GC1954@jama>
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
X-List-Received-Date: Thu, 10 May 2018 22:07:36 -0000
X-Groupsio-MsgNum: 111241
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="P+33d92oIH25kiaB"
Content-Disposition: inline

--P+33d92oIH25kiaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 10, 2018 at 11:43:25PM +0200, Martin Jansa wrote:
> On Thu, May 10, 2018 at 12:27:50PM -0700, Andre McCurdy wrote:
> > On Thu, May 10, 2018 at 12:11 PM, Martin Jansa <martin.jansa@gmail.com>=
 wrote:
> > > On Thu, May 10, 2018 at 11:50:02AM -0700, Khem Raj wrote:
> > >> Hi Martin
> > >>
> > >> Thanks for testing and reporting back
> > >>
> > >> On 5/9/18 2:38 AM, Martin Jansa wrote:
> > >> > My initial tests show couple issues, but usually caused by other c=
hanges
> > >> > in that branch, not the gcc-8 itself.
> > >> >
> > >> > 1) strace-4.22 from
> > >> > http://git.openembedded.org/openembedded-core-contrib/commit/?h=3D=
kraj/gcc-8&id=3Daf33a8b721cc9caebd3f5226b4c5903f666ab654
> > >> > fails to build with ptest enabled (it builds with 4.20 version if I
> > >> > revert this change)
> > >> > ../../strace-4.22/tests/inject-nf.c: In function 'main':
> > >> > ../../strace-4.22/tests/inject-nf.c:86:1: error: r7 cannot be used=
 in
> > >> > asm here
> > >> >   }
> > >> >   ^
> > >>
> > >> are you targeting thumb1 ? how can I reproduce it ?
> > >
> > > I'm trying to find out what's different in the builds where it was
> > > failing, will provide more info later.
> >=20
> > This is probably due to making an inline syscall from Thumb (doesn't a
> > matter Thumb1 or Thumb2) with frame pointers enabled.
> >=20
> > Does adding -fomit-frame-pointer to CFLAGS fix it?
>=20
> It was with raspberrypi3, thumb (Thumb2) enabled in DISTRO, there is
> already -fno-omit-frame-pointer in the default command line for it,
> adding -fomit-frame-pointer at the end fixes it:
>=20
> docker-lge @ ~/build/build-webos-master/BUILD/work/raspberrypi3-webos-lin=
ux-gnueabi/strace/4.22-r0/build/tests $ arm-webos-linux-gnueabi-gcc  -march=
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
>=20
> This might come from:
> meta/conf/bitbake.conf:DEBUG_OPTIMIZATION =3D "-O -fno-omit-frame-pointer=
 ${DEBUG_FLAGS} -pipe"
> because in this build I had DEBUG_BUILD enabled.
>=20
> Will retest with 4.20 version + DEBUG_BUILD to see if it fails there as w=
ell now.

4.20 doesn't fail with DEBUG_BUILD, because inject-nf.c test is new in
4.22:

https://github.com/strace/strace/commit/58598cd7f6e23e531d71bfe5a4e35f898a4=
f3b2d#diff-dc01d20c1e55f8adf7536cb46d4481e1

What is preferred fix for this? Is adding -fomit-frame-pointer to CFLAGS
when ptest is in DISTRO_FEATURES acceptable solution?

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--P+33d92oIH25kiaB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWvTCpgAKCRA3VSO3ZXaA
HJo+AJ9BKfck9MBrb9TaCZrBDeTcRt8z6wCcCpf4dk6835UOTGKdQL3UglXolQA=
=1V6e
-----END PGP SIGNATURE-----

--P+33d92oIH25kiaB--
