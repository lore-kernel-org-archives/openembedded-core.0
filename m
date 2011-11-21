Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RSYAA-0004OA-2d
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Nov 2011 19:00:14 +0100
Received: by wwp14 with SMTP id 14so8703117wwp.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2011 09:53:44 -0800 (PST)
Received: by 10.227.203.131 with SMTP id fi3mr1816934wbb.17.1321898022877;
	Mon, 21 Nov 2011 09:53:42 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ca18sm5433541wib.13.2011.11.21.09.53.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Nov 2011 09:53:41 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Mon, 21 Nov 2011 18:53:36 +0100
In-Reply-To: <1eb02b430c12807824427da5cb5abb586a5be8cb.1321811216.git.raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <d06edef859ff936294d76bc07523f50eaaa5baf4.1321811216.git.raj.khem@gmail.com>
	<1eb02b430c12807824427da5cb5abb586a5be8cb.1321811216.git.raj.khem@gmail.com>
Message-Id: <134351F4-81FC-4E78-8075-96C092AEE63E@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 4/5] netbase: Update recipe 4.46 -> 4.47
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
X-List-Received-Date: Mon, 21 Nov 2011 18:00:14 -0000
X-Groupsio-MsgNum: 12679
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C584C3C7-6BEF-48CA-863F-D77270DE1A0D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C584C3C7-6BEF-48CA-863F-D77270DE1A0D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Some warning (or an ETA at least) before this went in would have been =
appreciated by a lot of BSP maintainers...

Op 20 nov. 2011, om 18:50 heeft Khem Raj het volgende geschreven:

> moreover 4.46 tar is not available on debian pools
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> .../netbase/{netbase-4.46 =3D> netbase-4.47}/hosts   |    0
> .../netbase/{netbase-4.46 =3D> netbase-4.47}/init    |    0
> .../{netbase-4.46 =3D> netbase-4.47}/interfaces      |    0
> .../netbase/{netbase-4.46 =3D> netbase-4.47}/nfsroot |    0
> .../qemuarm/interfaces                             |    0
> .../qemuarmv6/interfaces                           |    0
> .../qemuarmv7/interfaces                           |    0
> .../qemumips/interfaces                            |    0
> .../qemuppc/interfaces                             |    0
> .../qemux86-64/interfaces                          |    0
> .../qemux86/interfaces                             |    0
> .../netbase/{netbase_4.46.bb =3D> netbase_4.47.bb}   |    6 +++---
> 12 files changed, 3 insertions(+), 3 deletions(-)
> rename meta/recipes-core/netbase/{netbase-4.46 =3D> =
netbase-4.47}/hosts (100%)
> rename meta/recipes-core/netbase/{netbase-4.46 =3D> netbase-4.47}/init =
(100%)
> rename meta/recipes-core/netbase/{netbase-4.46 =3D> =
netbase-4.47}/interfaces (100%)
> rename meta/recipes-core/netbase/{netbase-4.46 =3D> =
netbase-4.47}/nfsroot (100%)
> rename meta/recipes-core/netbase/{netbase-4.46 =3D> =
netbase-4.47}/qemuarm/interfaces (100%)
> rename meta/recipes-core/netbase/{netbase-4.46 =3D> =
netbase-4.47}/qemuarmv6/interfaces (100%)
> rename meta/recipes-core/netbase/{netbase-4.46 =3D> =
netbase-4.47}/qemuarmv7/interfaces (100%)
> rename meta/recipes-core/netbase/{netbase-4.46 =3D> =
netbase-4.47}/qemumips/interfaces (100%)
> rename meta/recipes-core/netbase/{netbase-4.46 =3D> =
netbase-4.47}/qemuppc/interfaces (100%)
> rename meta/recipes-core/netbase/{netbase-4.46 =3D> =
netbase-4.47}/qemux86-64/interfaces (100%)
> rename meta/recipes-core/netbase/{netbase-4.46 =3D> =
netbase-4.47}/qemux86/interfaces (100%)
> rename meta/recipes-core/netbase/{netbase_4.46.bb =3D> =
netbase_4.47.bb} (92%)
>=20
> diff --git a/meta/recipes-core/netbase/netbase-4.46/hosts =
b/meta/recipes-core/netbase/netbase-4.47/hosts
> similarity index 100%
> rename from meta/recipes-core/netbase/netbase-4.46/hosts
> rename to meta/recipes-core/netbase/netbase-4.47/hosts
> diff --git a/meta/recipes-core/netbase/netbase-4.46/init =
b/meta/recipes-core/netbase/netbase-4.47/init
> similarity index 100%
> rename from meta/recipes-core/netbase/netbase-4.46/init
> rename to meta/recipes-core/netbase/netbase-4.47/init
> diff --git a/meta/recipes-core/netbase/netbase-4.46/interfaces =
b/meta/recipes-core/netbase/netbase-4.47/interfaces
> similarity index 100%
> rename from meta/recipes-core/netbase/netbase-4.46/interfaces
> rename to meta/recipes-core/netbase/netbase-4.47/interfaces
> diff --git a/meta/recipes-core/netbase/netbase-4.46/nfsroot =
b/meta/recipes-core/netbase/netbase-4.47/nfsroot
> similarity index 100%
> rename from meta/recipes-core/netbase/netbase-4.46/nfsroot
> rename to meta/recipes-core/netbase/netbase-4.47/nfsroot
> diff --git a/meta/recipes-core/netbase/netbase-4.46/qemuarm/interfaces =
b/meta/recipes-core/netbase/netbase-4.47/qemuarm/interfaces
> similarity index 100%
> rename from meta/recipes-core/netbase/netbase-4.46/qemuarm/interfaces
> rename to meta/recipes-core/netbase/netbase-4.47/qemuarm/interfaces
> diff --git =
a/meta/recipes-core/netbase/netbase-4.46/qemuarmv6/interfaces =
b/meta/recipes-core/netbase/netbase-4.47/qemuarmv6/interfaces
> similarity index 100%
> rename from =
meta/recipes-core/netbase/netbase-4.46/qemuarmv6/interfaces
> rename to meta/recipes-core/netbase/netbase-4.47/qemuarmv6/interfaces
> diff --git =
a/meta/recipes-core/netbase/netbase-4.46/qemuarmv7/interfaces =
b/meta/recipes-core/netbase/netbase-4.47/qemuarmv7/interfaces
> similarity index 100%
> rename from =
meta/recipes-core/netbase/netbase-4.46/qemuarmv7/interfaces
> rename to meta/recipes-core/netbase/netbase-4.47/qemuarmv7/interfaces
> diff --git =
a/meta/recipes-core/netbase/netbase-4.46/qemumips/interfaces =
b/meta/recipes-core/netbase/netbase-4.47/qemumips/interfaces
> similarity index 100%
> rename from meta/recipes-core/netbase/netbase-4.46/qemumips/interfaces
> rename to meta/recipes-core/netbase/netbase-4.47/qemumips/interfaces
> diff --git a/meta/recipes-core/netbase/netbase-4.46/qemuppc/interfaces =
b/meta/recipes-core/netbase/netbase-4.47/qemuppc/interfaces
> similarity index 100%
> rename from meta/recipes-core/netbase/netbase-4.46/qemuppc/interfaces
> rename to meta/recipes-core/netbase/netbase-4.47/qemuppc/interfaces
> diff --git =
a/meta/recipes-core/netbase/netbase-4.46/qemux86-64/interfaces =
b/meta/recipes-core/netbase/netbase-4.47/qemux86-64/interfaces
> similarity index 100%
> rename from =
meta/recipes-core/netbase/netbase-4.46/qemux86-64/interfaces
> rename to meta/recipes-core/netbase/netbase-4.47/qemux86-64/interfaces
> diff --git a/meta/recipes-core/netbase/netbase-4.46/qemux86/interfaces =
b/meta/recipes-core/netbase/netbase-4.47/qemux86/interfaces
> similarity index 100%
> rename from meta/recipes-core/netbase/netbase-4.46/qemux86/interfaces
> rename to meta/recipes-core/netbase/netbase-4.47/qemux86/interfaces
> diff --git a/meta/recipes-core/netbase/netbase_4.46.bb =
b/meta/recipes-core/netbase/netbase_4.47.bb
> similarity index 92%
> rename from meta/recipes-core/netbase/netbase_4.46.bb
> rename to meta/recipes-core/netbase/netbase_4.47.bb
> index b55a8a1..ddfa8ad 100644
> --- a/meta/recipes-core/netbase/netbase_4.46.bb
> +++ b/meta/recipes-core/netbase/netbase_4.47.bb
> @@ -17,6 +17,9 @@ SRC_URI =3D =
"${DEBIAN_MIRROR}/main/n/netbase/netbase_${PV}.tar.gz \
>            file://interfaces \
>            file://nfsroot"
>=20
> +SRC_URI[md5sum] =3D "fcd87a62f177592724a8066e3774ae97"
> +SRC_URI[sha256sum] =3D =
"a7e6525c9a09b00eff3395d09739b3c70a18bff8d13f7daa21fdf81989387726"
> +
> do_install () {
> 	install -d ${D}${sysconfdir}/init.d \
> 		   ${D}${sbindir} \
> @@ -48,6 +51,3 @@ CONFFILES_${PN} =3D "${sysconfdir}/hosts =
${sysconfdir}/network/interfaces"
> PACKAGE_ARCH_qemuarm =3D "${MACHINE_ARCH}"
> PACKAGE_ARCH_qemux86 =3D "${MACHINE_ARCH}"
> PACKAGE_ARCH_qemux86-64 =3D "${MACHINE_ARCH}"
> -
> -SRC_URI[md5sum] =3D "e15762f4a8280a62f7ddfea6093120f1"
> -SRC_URI[sha256sum] =3D =
"2fdee144112731ee0028fee2584cc82d664857ca7004c2eb59de7bda5b159838"
> --=20
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--Apple-Mail=_C584C3C7-6BEF-48CA-863F-D77270DE1A0D
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7KkCIACgkQMkyGM64RGpE5wgCfY+BnSTd05bPYC3RGb7s/Ayef
wy0AoKOd7p61Ph+m5tYgIxdRjs5o5ofB
=YO55
-----END PGP SIGNATURE-----

--Apple-Mail=_C584C3C7-6BEF-48CA-863F-D77270DE1A0D--
