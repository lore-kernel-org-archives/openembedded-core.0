Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Rz5Qb-0001jj-JE for openembedded-core@lists.openembedded.org;
	Sun, 19 Feb 2012 12:59:41 +0100
Received: from f053040043.adsl.alicedsl.de ([78.53.40.43]
	helo=[192.168.178.43])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Rz5Iq-00040m-Vs; Sun, 19 Feb 2012 11:51:41 +0000
Message-ID: <1329652279.13140.46.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Feb 2012 12:51:19 +0100
In-Reply-To: <CAEsOVNfS-UvJPCR527463OzKJLvVxK7GAnwr_==Lz7sjEOsYbA@mail.gmail.com>
References: <1320883434.10843.244.camel@ted>
	<CAEsOVNfS-UvJPCR527463OzKJLvVxK7GAnwr_==Lz7sjEOsYbA@mail.gmail.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: useradd: Add missing DEPEND on shadow
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
X-List-Received-Date: Sun, 19 Feb 2012 11:59:41 -0000
X-Groupsio-MsgNum: 17584
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-TZ+SkHiallzTseGuFQk2"

--=-TZ+SkHiallzTseGuFQk2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 19.02.2012, 07:29 +0000 schrieb McClintock Matthew-B29882:
> On Wed, Nov 9, 2011 at 4:03 PM, Richard Purdie wrote:
> > Without this rootfs generation fails as an RDEPENDS is added
> > but the package might not have bneen built.

s/bneen/been/

> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclas=
s
> > index 8cd7f4f..7faf1a7 100644
> > --- a/meta/classes/useradd.bbclass
> > +++ b/meta/classes/useradd.bbclass
> > @@ -2,7 +2,7 @@
> >  # target sysroot, and shadow -native and -sysroot provide the utilitie=
s
> >  # and support files needed to add and modify user and group accounts
> >  DEPENDS_append =3D "${USERADDDEPENDS}"
> > -USERADDDEPENDS =3D " base-passwd shadow-native shadow-sysroot"
> > +USERADDDEPENDS =3D " base-passwd shadow-native shadow-sysroot shadow"
>=20
> The shadow recipe is a 'PACKAGE_ARCH =3D "${MACHINE_ARCH}"' recipe. This
> makes all recipes that inherit useradd depend on shadow which will
> depend on the MACHINE being built for. Ideally, we just need a way to
> ensure these packages are deployed - we don't want them to effect
> signatures.
>=20
> Can you suggest a better fix here? Some
> bb.exec_func("shadow:do_populate_sysroot") or something equivalent?

You raise a good point, but I have no solution.


Thanks,

Paul

--=-TZ+SkHiallzTseGuFQk2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk9A4jcACgkQPX1aK2wOHVj87gCfQMr04xaEHIyfg9i+Kz3A0xxH
DbUAn2ONxU8b7IRxc7F3VaEUaDzimMeR
=hJ+K
-----END PGP SIGNATURE-----

--=-TZ+SkHiallzTseGuFQk2--
