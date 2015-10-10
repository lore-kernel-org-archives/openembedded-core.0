Return-Path: <clopez@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id DC34975CF1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Oct 2015 12:13:16 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2AUBgD1/xhW/5tjdVteHAEBAYMHVG6FTLN7hgohgnKCCn8CgSA8EAEBAQEBAQGBCoQmAQEBAQIBSwEsBgsLGAkWDwkDAgECAQ82EwYCAogVAwoMAQi1QwGIZQ2FIQELAR+Gc4R+gTOBHYJEF4QXBZYTgk6BYWqGDYF0giCSGodJOCuEBG8Bh2kBAQE
X-IPAS-Result: A2AUBgD1/xhW/5tjdVteHAEBAYMHVG6FTLN7hgohgnKCCn8CgSA8EAEBAQEBAQGBCoQmAQEBAQIBSwEsBgsLGAkWDwkDAgECAQ82EwYCAogVAwoMAQi1QwGIZQ2FIQELAR+Gc4R+gTOBHYJEF4QXBZYTgk6BYWqGDYF0giCSGodJOCuEBG8Bh2kBAQE
X-IronPort-AV: E=Sophos;i="5.17,663,1437429600"; 
	d="asc'?scan'208";a="32614497"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 10 Oct 2015 14:13:16 +0200
Received: from 1.14.117.91.dynamic.mundo-r.com ([91.117.14.1]
	helo=[192.168.0.12]) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim)
	id 1Zkt1W-0005Gk-QR for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Oct 2015 14:13:14 +0200
To: openembedded-core@lists.openembedded.org
references: <20150514114002.GA2402@jama>
	<1444403489-29494-1-git-send-email-Martin.Jansa@gmail.com>
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
openpgp: id=B5D2B50BC48EC7F1EE90D9AB965089CE6B95F882;
	url=http://key.neutrino.es
x-enigmail-draft-status: N1110
organization: Igalia S.L.
message-id: <561900D1.5060906@igalia.com>
Date: Sat, 10 Oct 2015 14:13:05 +0200
user-agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:38.0) Gecko/20100101 Icedove/38.0
mime-version: 1.0
in-reply-to: <1444403489-29494-1-git-send-email-Martin.Jansa@gmail.com>
Subject: Re: [PATCH] webkitgtk, gcr, libsecret: force ARM mode
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
X-List-Received-Date: Sat, 10 Oct 2015 12:13:17 -0000
X-Groupsio-MsgNum: 72073
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="QKMQSJn022IirKiX2Oqb9KSAQ9vwTUd7S"

--QKMQSJn022IirKiX2Oqb9KSAQ9vwTUd7S
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 09/10/15 17:11, Martin Jansa wrote:
> * gcr, libsecret are new since switch to gcc 5.2
> * webkitgtk is old but it was removed while migrating from
>   webkit-gtk to webkitgtl (like REQUIRED_DISTRO_FEATURES were) :/
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---

> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb b/meta/recipes=
-sato/webkit/webkitgtk_2.8.5.bb
> index f14c868..e29666a 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
> @@ -70,3 +70,5 @@ FILES_${PN} +=3D "${libdir}/webkit2gtk-4.0/injected-b=
undle/libwebkit2gtkinjectedbu
>  FILES_${PN}-dbg +=3D "${libdir}/webkit2gtk-4.0/injected-bundle/.debug/=
libwebkit2gtkinjectedbundle.so"
>  FILES_${PN}-dbg +=3D "${libdir}/webkitgtk/webkit2gtk-4.0/.debug/*"
> =20
> +# http://errors.yoctoproject.org/Errors/Details/20370/
> +ARM_INSTRUCTION_SET =3D "arm"
>=20

I tried to build webkitgtk using current master of poky for machine
qemuarm and it built fine:

Build Configuration:
BB_VERSION        =3D "1.28.0"
BUILD_SYS         =3D "x86_64-linux"
NATIVELSBSTRING   =3D "Debian-8.1"
TARGET_SYS        =3D "arm-poky-linux-gnueabi"
MACHINE           =3D "qemuarm"
DISTRO            =3D "poky"
DISTRO_VERSION    =3D "2.0"
TUNE_FEATURES     =3D "arm armv5 thumb dsp"
TARGET_FPU        =3D "soft"
meta
meta-yocto
meta-yocto-bsp    =3D "master:ceeb52a2544045fe8432e36307a321f6e934de49"




Can you tell me how to reproduce this failure?
Also, what the ARM_INSTRUCTION_SET =3D "arm" line does?
Thanks.


--QKMQSJn022IirKiX2Oqb9KSAQ9vwTUd7S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: You can fetch my GnuPG key from http://key.neutrino.es

iQIcBAEBCgAGBQJWGQDRAAoJEJZQic5rlfiCKnMP/iPEAcA+dIYwuAtyP6n/I3cy
cEL0SLYFSNiVwtAPaEMoWjU0YRGLvUvRIRo9ucsim/rUGb+aQBiUHlz+jrvxUbwe
TuZ8HwoivZOWi3gGClWN3+dMb5SceKjXmOaHkkwzE1rJRdr8urBJOA7AtzH4QPT+
PEVovxN7rXaRuk63v9Toed8q60+gUf+H9CizewVODnpyBTvLiuNHwt+JPn8N0wZW
3l1kJFToRTBAC1qJiTOlsg6Kj4McNs1iWo7tH7staFvh3smEjoBHUMPu+Izvpd4q
bIyJCsa3XnCPSvVrsSDcj+eMIYeYYm0+xZ4YXgZoSTqFxlKF6NBMJjQ5WdfSBtaF
qZjStNVMRlNjfQiXt83yq7ghtuMz5nzHdXUaTJ/Nv0gGkhCCG3flAQD6/QV6tp2j
/GROgJDdegQfnibO7wX0+BbT3jvDJIQYHCugNXlIgHyW4+milkZ69410pjR/+VcT
CL6nOgOek+mbfF+hVx975ojd+IbEuJMyrMR5bhRUeWDR7PPoumqRr8VMCPrvtlRG
c1ReDpac1ACQmFOzKGDrHjloZVd3uJCWNBwKlx4npofhjTO88qpsTzh+hiJ4X79o
9YSHdFbYRCKhi09q0jqHK1AsXh73siguZR8WtxKsFbIZ8m1k7F4jGtfjjrp5tck2
gTZznOdi4nEYMyxBxckX
=d5sb
-----END PGP SIGNATURE-----

--QKMQSJn022IirKiX2Oqb9KSAQ9vwTUd7S--
