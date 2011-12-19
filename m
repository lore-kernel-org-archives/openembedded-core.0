Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rcaag-000386-QP
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 11:37:06 +0100
Received: by faaa20 with SMTP id a20so3420860faa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2011 02:30:03 -0800 (PST)
Received: by 10.180.98.138 with SMTP id ei10mr25892003wib.52.1324290603583;
	Mon, 19 Dec 2011 02:30:03 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id em4sm25102266wbb.20.2011.12.19.02.30.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Dec 2011 02:30:02 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Mon, 19 Dec 2011 11:29:58 +0100
In-Reply-To: <1324289521-10140-1-git-send-email-b19537@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1324289521-10140-1-git-send-email-b19537@freescale.com>
Message-Id: <C27D8181-0988-4BF7-A858-BC873D7C47F8@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH oe-core] valgrind: add powerpc into the compatible host list
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
X-List-Received-Date: Mon, 19 Dec 2011 10:37:06 -0000
X-Groupsio-MsgNum: 14444
Content-Type: multipart/signed;
	boundary="Apple-Mail=_54258AF3-B967-4DE6-8B98-4391E5862B53";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_54258AF3-B967-4DE6-8B98-4391E5862B53
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 19 dec. 2011, om 11:12 heeft <b19537@freescale.com> =
<b19537@freescale.com> het volgende geschreven:

> From: Zhenhua Luo <b19537@freescale.com>
>=20
>    add powerpc/powerpc64/ppc/ppc64 in COMPATIBLE_HOST variable

Since valgrind works on arm as well it might be better just to drop the =
COMPATIBLE_HOST, no?

regards,

Koen

>=20
> Signed-off-by: Zhenhua Luo <b19537@freescale.com>
> ---
> meta/recipes-devtools/valgrind/valgrind_3.6.1.bb |    4 ++--
> 1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.6.1.bb =
b/meta/recipes-devtools/valgrind/valgrind_3.6.1.bb
> index 021caa8..c09fc41 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.6.1.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.6.1.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Dc46082167a314d785d012a244748d803 \
>                     =
file://include/valgrind.h;beginline=3D1;endline=3D56;md5=3D13a71cedba99112=
334d8596162aec37e \
>                     =
file://COPYING.DOCS;md5=3D8fdeb5abdb235a08e76835f8f3260215"
> DEPENDS =3D "virtual/libx11"
> -PR =3D "r1"
> +PR =3D "r2"
>=20
> SRC_URI =3D "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 =
\
> 	   file://fix_issue_caused_by_ccache.patch \
> @@ -17,7 +17,7 @@ SRC_URI =3D =
"http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
> SRC_URI[md5sum] =3D "2c3aa122498baecc9d69194057ca88f5"
> SRC_URI[sha256sum] =3D =
"49bdcc4fbcf060049b5f0dcfd8a187a6e90e0b0e57309f633b64e44430726a0e"
>=20
> -COMPATIBLE_HOST =3D '(i.86|x86_64).*-linux'
> +COMPATIBLE_HOST =3D =
'(i.86|x86_64|powerpc|powerpc64|ppc|ppc64).*-linux'
>=20
> inherit autotools
>=20
> --=20
> 1.7.0.4
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--Apple-Mail=_54258AF3-B967-4DE6-8B98-4391E5862B53
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7vEikACgkQMkyGM64RGpG5EwCcDfnnb7rQ7DsEPFaBKArhjoVT
J1MAn2/SDrp/yJBoeZG26UWZvNjxn09f
=SLX9
-----END PGP SIGNATURE-----

--Apple-Mail=_54258AF3-B967-4DE6-8B98-4391E5862B53--
