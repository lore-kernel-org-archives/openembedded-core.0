Received: from mail-pd0-f169.google.com ([209.85.192.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1UMbfu-00084W-Tr; Mon, 01 Apr 2013 12:09:15 +0200
Received: by mail-pd0-f169.google.com with SMTP id 10so1154206pdc.14
	for <multiple recipients>; Mon, 01 Apr 2013 02:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ZaiCqaptOvymJ1X3CYTTCwrhedmjrBZeiR0zY2d+164=;
	b=qe5b5Z+YF4bDwEKMF0JxG82Hj1d+B752z+jDvS1/nOLo2h2P16X6KQ/OHyJh7igBJW
	OHTHVddMTqkToPvA3nA4ryBFryT3bOyiCzBcDt5bQH2fflRC5Sz/Ix9Mmoc0tc9xK7vn
	VhUqjaGoU+ST/nJvUfs4D7a8DKm0q/Ugmaz0cJBfq245D5PL37P0RpVt9NYKBEkfXycr
	VWGAbYgqQ2Ibg/bTVLcPGEzdeRo1dzjjgMCQutYO6GQIFd+SmYw5zCyZwKinpqPixnHv
	2XAJiMwpNQRr1UUdSasxNXHlR2x1tsST+LHE8DRSDpzTt7ylRCriqZqyvnGxoKmKLCnO
	Dj9g==
X-Received: by 10.66.253.74 with SMTP id zy10mr17769238pac.122.1364809925895; 
	Mon, 01 Apr 2013 02:52:05 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id i9sm14698754paa.7.2013.04.01.02.52.02
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 01 Apr 2013 02:52:04 -0700 (PDT)
Date: Mon, 1 Apr 2013 11:52:02 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130401095202.GP11120@jama>
References: <6B577862-4C24-49DB-80F2-3A1408AF8337@gmail.com>
	<20130329145514.GH11120@jama> <20130330090319.GM11120@jama>
MIME-Version: 1.0
In-Reply-To: <20130330090319.GM11120@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org oe-core layer"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] GCC 4.8 recipes
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
X-List-Received-Date: Mon, 01 Apr 2013 10:09:15 -0000
X-Groupsio-MsgNum: 37260
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bd2KlmcTHfsQFEJ+"
Content-Disposition: inline

--Bd2KlmcTHfsQFEJ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 30, 2013 at 10:03:19AM +0100, Martin Jansa wrote:
> And now the rest of qemuarm gcc-4.8 world failure
>=20
> openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.148.bb, do_co=
mpile
> ICE as reported before
>=20
> openembedded-core/meta/recipes-devtools/gcc/gcc_4.8.bb, do_compile
> gcc-4.8.0/libatomic/config/linux/arm/store_n.c:46:0: fatal error:
> opening dependency file .deps/store_1_.lo.Ppo: No such file or directory
> |  #include "../../../store_n.c"
>=20
> openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.14.0.=
bb, do_compile
> xf86Crtc.c:391:5: error: implicit declaration of function 'xf86InputRotat=
ionNotify' [-Werror=3Dimplicit-function-declaration]
>=20
> openembedded-core/meta/recipes-graphics/xorg-app/xmodmap_1.0.7.bb, do_com=
pile
> xmodmap.c:289:5: error: implicit declaration of function 'asprintf' [-Wer=
ror=3Dimplicit-function-declaration]
>=20
> meta-openembedded/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb, do_compi=
le
> glib-2.0/glib/gmacros.h:162:53: error: typedef '_GStaticAssertCompileTime=
Assertion_0' locally defined but not used [-Werror=3Dunused-local-typedefs]
>=20
> meta-openembedded/meta-oe/recipes-connectivity/networkmanager/modemmanage=
r_0.6.0.0.bb, do_compile
> glib-2.0/glib/gmacros.h:162:53: error: typedef '_GStaticAssertCompileTime=
Assertion_0' locally defined but not used
>=20
> meta-openembedded/meta-oe/recipes-support/ipsec-tools/ipsec-tools_0.7.2.b=
b, do_compile
> ipsec_doi.c:1321:24: error: argument to 'sizeof' in 'memset' call is the =
same expression as the destination; did you mean to dereference it? [-Werro=
r=3Dsizeof-pointer-memaccess]
> |   memset(pair, 0, sizeof(pair));
>=20
> And couple of old failures, which are not caused by gcc upgrade for sure.
>=20
> Complete log:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130329_124637.log/

And logs from qemux86:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30330_090402.log/

qemux86-64
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30331_084823.log/

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Bd2KlmcTHfsQFEJ+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFZWMIACgkQN1Ujt2V2gBxOGQCfdXEJ4zndFHeKErZgeiMQEZWA
sXkAniO0synKxpDoH48f8QT1cEibOi4u
=Kpi2
-----END PGP SIGNATURE-----

--Bd2KlmcTHfsQFEJ+--
