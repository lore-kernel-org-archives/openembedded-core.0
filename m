Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SzTGA-0008Rx-1a
	for openembedded-core@lists.linuxtogo.org;
	Thu, 09 Aug 2012 15:58:46 +0200
Received: by weyr6 with SMTP id r6so267776wey.6
	for <openembedded-core@lists.linuxtogo.org>;
	Thu, 09 Aug 2012 06:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=resent-from:resent-date:resent-message-id:resent-to:date:from:to
	:subject:message-id:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=55F57LxKZtHz0PX4VvDsLmMA7Vp29zmofYt2xS0PwTg=;
	b=nz5exGKw7BhBlfupVDaLB9yJkLAtRMxMhFUdV2+tJw3ntL7HILtnpkS8o40OOWAd8J
	KmKc3jg+0D/rh9e/BA+ZoI8IOl3diPcgbm+0iMKlEZ4D0hKjK9QLJsYh//CeoFTnFBG6
	A4RD7yFSOPO31Onu02e9B+0i53hsZJoXrCZ2RHPp7hsIB1NrrwcPXXF1jJnhTbBbHDag
	cqZZfhpzT0tn9a5W6y82qCGJIpdWRkzbG4KxzDBi452GzJVFShhRmdfSi/SzzbKuk8Bs
	bYQRjYV3Ym28enVXictfkEaC/gB5UkR/QNgt9/9s36MfDox5uV+68xoNCIxCtgM6bEOH
	xolQ==
Received: by 10.180.97.33 with SMTP id dx1mr3047400wib.18.1344520017642;
	Thu, 09 Aug 2012 06:46:57 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k20sm1745866wiv.11.2012.08.09.06.46.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Aug 2012 06:46:56 -0700 (PDT)
Resent-From: Martin Jansa <Martin.Jansa@gmail.com>
Resent-Date: Thu, 9 Aug 2012 15:46:56 +0200
Resent-Message-ID: <20120809134656.GC3273@jama.jama.net>
Resent-To: openembedded-core@lists.linuxtogo.org
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ex20sm2516043wid.7.2012.08.09.06.10.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Aug 2012 06:10:16 -0700 (PDT)
Date: Thu, 9 Aug 2012 15:10:16 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120809131016.GA3273@jama.jama.net>
References: <CAMKF1sokpajrms4PACKOSt8CYFt+6JEQ2Fre=QpzJfQF-KLrKA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sokpajrms4PACKOSt8CYFt+6JEQ2Fre=QpzJfQF-KLrKA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Thu, 09 Aug 2012 13:58:46 -0000
X-Groupsio-MsgNum: 27231
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline

--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 08, 2012 at 10:45:19AM -0700, Khem Raj wrote:
> Hi
>=20
> Binutils 2.23 branch has started upstream. Given that toolchain
> components require a lot of soak time, I have created the recipes
> for binutils 2.23 and pushed it here
>=20
> http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/binut=
ils-2.23
>=20
> If you are using angstrom set
>=20
> ANGSTROM_BINUTILS_VERSION =3D "2.23" in local.conf after pulling that bra=
nch
> for OE-Core it will work as it is
>=20
> Let me know if you see any errors.

I was trying to build armv4t image with gold enabled again to see if
those issues with gold are resolved and building linux-3.2 and linux-2.6.39=
=20
are failing with this:

|   LD      arch/arm/boot/compressed/vmlinux
| arm-oe-linux-gnueabi-ld: error: DIV usage mismatch between arch/arm/boot/=
compressed/misc.o and output
| arm-oe-linux-gnueabi-ld: error: DIV usage mismatch between arch/arm/boot/=
compressed/lib1funcs.o and output
| make[2]: *** [arch/arm/boot/compressed/vmlinux] Error 1

Any hint for that?

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAjtrgACgkQN1Ujt2V2gBxLwgCfQQiR9e1+l/HAZGGW8g9p8XQI
WIcAoKKvZNl9njj7CnKBJ2mNQPH5n8QY
=vQVG
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
