Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SzUMV-0002wF-O6
	for openembedded-core@linuxtogo.org; Thu, 09 Aug 2012 17:09:23 +0200
Received: by wgbdr13 with SMTP id dr13so389664wgb.25
	for <openembedded-core@linuxtogo.org>;
	Thu, 09 Aug 2012 07:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2DIF3xvN6uJM3pI593bRSKQMvZGgS+c744o6GmsdmQs=;
	b=mukMDHB8eGxEV3YOC+ihUx06Hc0ZMYQOG3q1l3yR53evlOhRJAaPvW59QSTdWZ9uFJ
	53krz4u2E2F4aExxWeMuDGYloCz2KzSnjmUh/uhxS2nbegoDPbtzgK//J9QYxuy2CU3s
	E8fu7UqhsLEvdYtmtsazVJLvqfvixUIGa4WsBHA2lqgFge7s+aHs43NzRu+eCPD2xh/F
	0GWSi6/Q2k/uuq2QwjP5T2iUjXfHQ4Fdk/h8NUyEAhSHThKPmmbDYK2dobyfsD4EmtBP
	mhHM7dpoM12DLWu9n4rloMMKWjDIlK+GsGoU4f9fTisjzQfM4sJu9vaw69rXLyap4vZp
	CylQ==
Received: by 10.216.64.20 with SMTP id b20mr10535389wed.150.1344524255055;
	Thu, 09 Aug 2012 07:57:35 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id dc3sm2073014wib.7.2012.08.09.07.57.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Aug 2012 07:57:33 -0700 (PDT)
Date: Thu, 9 Aug 2012 16:57:32 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120809145732.GD3273@jama.jama.net>
References: <CAMKF1sokpajrms4PACKOSt8CYFt+6JEQ2Fre=QpzJfQF-KLrKA@mail.gmail.com>
	<20120809131016.GA3273@jama.jama.net>
	<CAMKF1sqC-_YTdwsLvVoVyz04ndMxNt6W1z__f_9nUTfb6aF8GQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqC-_YTdwsLvVoVyz04ndMxNt6W1z__f_9nUTfb6aF8GQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@linuxtogo.org
Subject: Re: binutils 2.23 call for testing the recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Aug 2012 15:09:23 -0000
X-Groupsio-MsgNum: 27240
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rQ2U398070+RC21q"
Content-Disposition: inline

--rQ2U398070+RC21q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 09, 2012 at 07:53:43AM -0700, Khem Raj wrote:
> On Thu, Aug 9, 2012 at 6:10 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > On Wed, Aug 08, 2012 at 10:45:19AM -0700, Khem Raj wrote:
> >> Hi
> >>
> >> Binutils 2.23 branch has started upstream. Given that toolchain
> >> components require a lot of soak time, I have created the recipes
> >> for binutils 2.23 and pushed it here
> >>
> >> http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/bi=
nutils-2.23
> >>
> >> If you are using angstrom set
> >>
> >> ANGSTROM_BINUTILS_VERSION =3D "2.23" in local.conf after pulling that =
branch
> >> for OE-Core it will work as it is
> >>
> >> Let me know if you see any errors.
> >
> > I was trying to build armv4t image with gold enabled again to see if
> > those issues with gold are resolved and building linux-3.2 and linux-2.=
6.39
> > are failing with this:
> >
> > |   LD      arch/arm/boot/compressed/vmlinux
> > | arm-oe-linux-gnueabi-ld: error: DIV usage mismatch between arch/arm/b=
oot/compressed/misc.o and output
> > | arm-oe-linux-gnueabi-ld: error: DIV usage mismatch between arch/arm/b=
oot/compressed/lib1funcs.o and output
> > | make[2]: *** [arch/arm/boot/compressed/vmlinux] Error 1
> >
> > Any hint for that?
>=20
> probably you need something like below
> https://lists.yoctoproject.org/pipermail/poky/2011-January/003131.html

I've used something like
https://github.com/CyanogenMod/android_kernel_samsung_tuna/commit/ec1ac589d=
49081286164246fbaaba0012ae7ecac
and core-image-minimal-mtdutils looks better wrt gold issues we had, now
waiting for bigger image like shr-lite-image to test it more.

Cheers,

>=20
> >
> > Cheers,
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rQ2U398070+RC21q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAjz9wACgkQN1Ujt2V2gBwa7QCgi37PNQ4OEms2WNjwggQLUVCF
NkkAoLgRTt+ClxQiw7Sm96Cqlsps6j2i
=zSBn
-----END PGP SIGNATURE-----

--rQ2U398070+RC21q--
