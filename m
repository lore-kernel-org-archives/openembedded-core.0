Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Re8MJ-0005Jp-LD
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 17:52:39 +0100
Received: by mail-ww0-f43.google.com with SMTP id ds11so15206555wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2011 08:45:34 -0800 (PST)
Received: by 10.227.203.10 with SMTP id fg10mr15141133wbb.1.1324658730067;
	Fri, 23 Dec 2011 08:45:30 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id di5sm33089991wib.3.2011.12.23.08.45.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Dec 2011 08:45:29 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Fri, 23 Dec 2011 17:45:27 +0100
In-Reply-To: <7252a7660c6a9703c7fca5153f87d9dbaaa347e5.1324657801.git.shane.wang@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <b3dad82177ad19a44f06edc4b857cb9697fa3950.1324657801.git.shane.wang@intel.com>
	<7252a7660c6a9703c7fca5153f87d9dbaaa347e5.1324657801.git.shane.wang@intel.com>
Message-Id: <CE503E09-2FAB-407C-8A54-77A62A480595@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 07/14] glib-2.0: upgrade to 2.30.2
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
X-List-Received-Date: Fri, 23 Dec 2011 16:52:39 -0000
X-Groupsio-MsgNum: 14761
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A668F5B8-BD07-44FD-B4AF-44E8EC28A6C4";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A668F5B8-BD07-44FD-B4AF-44E8EC28A6C4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 23 dec. 2011, om 17:35 heeft Shane Wang het volgende geschreven:

> Signed-off-by: Shane Wang <shane.wang@intel.com>
> ---
> .../{glib-2.0_2.30.1.bb =3D> glib-2.0_2.30.2.bb}     |    7 +++----
> 1 files changed, 3 insertions(+), 4 deletions(-)
> rename meta/recipes-core/glib-2.0/{glib-2.0_2.30.1.bb =3D> =
glib-2.0_2.30.2.bb} (88%)
>=20
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.30.1.bb =
b/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb
> similarity index 88%
> rename from meta/recipes-core/glib-2.0/glib-2.0_2.30.1.bb
> rename to meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb
> index bf415a1..62f7dc6 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.30.1.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb
> @@ -1,6 +1,6 @@
> require glib.inc
>=20
> -PR =3D "r1"
> +PR =3D "r0"
> PE =3D "1"
>=20
> DEPENDS +=3D "libffi python-argparse-native"
> @@ -13,10 +13,9 @@ SRC_URI =3D =
"${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.bz2 \
>            file://configure-libtool.patch \
>            file://60_wait-longer-for-threads-to-die.patch \
>            file://g_once_init_enter.patch \
> -           file://glib-2.0_fix_for_x32.patch \

Please delete the patch file as well when removing it from SRC_URI=

--Apple-Mail=_A668F5B8-BD07-44FD-B4AF-44E8EC28A6C4
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk70sCgACgkQMkyGM64RGpEfYgCbBENb3hKHa5WL1a3SJtv+lXck
DmkAnj9QPmN6zBLUTTtMRVwbA50UtCRO
=H62X
-----END PGP SIGNATURE-----

--Apple-Mail=_A668F5B8-BD07-44FD-B4AF-44E8EC28A6C4--
