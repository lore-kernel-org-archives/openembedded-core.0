Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Timbc-0002gv-7g
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 14:44:15 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so226953eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2012 05:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8NDA6gNDmRe2tkPywtfANyxuRHn/Ba4cJUULHMJ6nwk=;
	b=t6FpwC6xI/fcgRig+qettVXVyHs0OMMtxbPn9/MPoo9fEWIUSBkJiVO6pLcyt0+G4V
	/fLax/p8vmfUJjI0ShKjVJU2IAQZ/XVKcEAyy3AucjQmVAZfNOnSo65IdyMGVzLfjvTl
	85zTG4GFP6Ktb3Ttno0JnJGMcVVyMRTZdfrnqsdXAWVkK+YuZluEbd/moY/Gj7hpUday
	wyaqMMO9bTTWJMIu/ohDs/zsHOB1Kjk3NiQ9AKvF7OgdNEt20HHzUSz2MzlnKcOJUGVt
	v8jJckJ2mBLFqpYMwFA7YCpE9Yq4LyVH4YSZqtWNjjM7NgJ1LG6BBg+FunP1DKAlgMkf
	RYEQ==
Received: by 10.14.225.72 with SMTP id y48mr2848013eep.46.1355318978748;
	Wed, 12 Dec 2012 05:29:38 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id f49sm55975666eep.12.2012.12.12.05.29.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Dec 2012 05:29:38 -0800 (PST)
Date: Wed, 12 Dec 2012 14:29:51 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Message-ID: <20121212132951.GA1756@jama.jama.net>
References: <lywqwqktzq.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CA+chaQe8uniTRz5pm+kWcC2kH=1836UkVgfyRMBO1p3M2Ldf=Q@mail.gmail.com>
	<lysj7bpgpb.fsf@ensc-virt.intern.sigma-chemnitz.de>
MIME-Version: 1.0
In-Reply-To: <lysj7bpgpb.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: binutils: regression on kernel builds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Dec 2012 13:44:15 -0000
X-Groupsio-MsgNum: 32563
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Content-Disposition: inline

--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 12, 2012 at 02:01:36PM +0100, Enrico Scholz wrote:
> Martin Jansa <martin.jansa@gmail.com> writes:
>=20
> >> | arm-linux-gnueabi-ld: error: arch/arm/boot/compressed/piggy.gzip.o: =
unknown CPU architecture
> >> ...
> >> This works fine with binutils 2.22 and when using the BFD linker.
> >
> > You need to patch your kernel sources, some examples for different
> > kernel versions (please ignore incorrect commit message)
>=20
> I am not sure who (gold linker or kernel) is the responsible party.  But
> based on my experiences with low level programs (e.g. bootloaders and
> kernel) which are having serious problems with the gold linker, I set
> for now
>=20
> | KERNEL_LDSUFFIX =3D .bfd

FWIW: those patches I've referenced work for me fine (last 4 months
since binutils-2.23 patches first appeared on ML) on all 4 devices I'm usin=
g.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEUEARECAAYFAlDIhs8ACgkQN1Ujt2V2gByt5ACgkygNXeAr0oaGsJ8zSuN/nlJA
k8wAliFLyQXl65Q5mbV9Uyw+T0BnKeA=
=igoI
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
