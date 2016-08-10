Return-Path: <prvs=20306b34ae=michael.davis@essvote.com>
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id C6BDF771D6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 20:59:06 +0000 (UTC)
X-AuditID: 0a00029b-f79b46d000000dc2-6d-57ab959a68f7
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	B2.17.03522.B959BA75; Wed, 10 Aug 2016 15:59:07 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Wed, 10 Aug 2016 15:59:06 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCHv3] pcsc-lite: Seperate GPLV3 portions from BSD
Thread-Index: AQHR80lUr7goP3n39kCFLVcWIx3bNKBDAU8A
Date: Wed, 10 Aug 2016 20:59:06 +0000
Message-ID: <8361576.XDxYRcRQpo@localhost.localdomain>
References: <1470862413-5030-1-git-send-email-michael.davis@essvote.com>
In-Reply-To: <1470862413-5030-1-git-send-email-michael.davis@essvote.com>
Reply-To: "Davis, Michael" <michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.8.93]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnkeLIzCtJLcpLzFFi42JZI5CnoTt76upwg4PTJCzu/HzH7sDocW7j
	CsYAxihum6TEkrLgzPQ8fbsE7ox/O44wF+wWqOg/LdvAeIu3i5GTQ0LARGLGgdPsELaYxIV7
	69m6GLk4hASOMko8fnmRFcKZxSjR9GIaWBWbgJHEueubGEFsEYFoiaUzZgLFOTiEBbwldnz3
	ggj7SKxd/IkNwjaSONa9CqyVRUBV4t3JRmYQm1fATGLGsh8sILaQgIfEq+sXwWo4BTwlVr2+
	BRU3k2h7+BLMZgQ67vupNUwgNrOAuMStJ/OZII4WkFiy5zwzhC0q8fLxP1YIW1bi244pLBD1
	OhILdkPcwyxgJfHx3kR2CFtbYtnC11D3CEqcnPmEZQKj+CwkK2YhaZ+FpH0WkvZZSNoXMLKu
	YuTLNdJLLS4uyy9J1UvOz93ECIwmLgam2TsY90xwOMQowMGoxMMb4LIqXIg1say4MvcQozQH
	i5I4r4qQUriQQHpiSWp2ampBalF8UWlOavEhRiYOzkOMEhxcUiLFqXkpqUWJpSUZ8aCYjS8G
	Rq1UA6PD8fNnr9jf2nStveeFl+Qu15TU5Tu4sxsn+eUZCjc+YN6r8t7xqFvIAdH6Jdu1pTbu
	PPPVKO6HaZ/GqV1s6XsOLLk23T3wu9b517lZ0RY5nGlldlcDXxp7VDI//LlxRdbMLavVOn1u
	3PcS9UkX7Pkn+DPg2c2Oxj6r1Ru9HtlYZjRMu2wbflGJpTgj0VCLuag4EQACo+PiogIAAA==
Subject: Re: [meta-oe][PATCHv3] pcsc-lite: Seperate GPLV3 portions from BSD
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
X-List-Received-Date: Wed, 10 Aug 2016 20:59:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CF68ADCB787E404592A992F5704C551D@essvote.com>
Content-Transfer-Encoding: quoted-printable

Ignore this one found an issue when I re-enabled my blacklist again.



On Wednesday, August 10, 2016 08:54:05 PM Davis, Michael wrote:
> GPLV3 and BSD portions were originally placed in the same package.
> The GPLv3 portion has been seperated into pcsc-lite-spy so the package ca=
n be used with GPLv3 blacklisted.
>=20
> Signed-off-by: Michael Davis <michael.davis@essvote.com>
> ---
>  meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb | 16 ++++++++++++-=
---
>  1 file changed, 12 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb b/meta=
-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
> index cc72549..7213276 100644
> --- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
> +++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
> @@ -1,7 +1,12 @@
>  SUMMARY =3D "PC/SC Lite smart card framework and applications"
>  HOMEPAGE =3D "http://pcsclite.alioth.debian.org/"
>  LICENSE =3D "BSD & GPLv3+"
> -LICENSE_${PN}-dev =3D "GPLv3+"
> +LICENSE_${PN} =3D "BSD"
> +LICENSE_${PN}-lib =3D "BSD"
> +LICENSE_${PN}-dev =3D "BSD"
> +LICENSE_${PN}-doc =3D "BSD"
> +LICENSE_${PN}-dbg =3D "BSD & GPLv3+"
> +LICENSE_${PN}-spy =3D "GPLv3+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbcfbd85230ac3c586fb294c8b627c=
f32"
>  DEPENDS =3D "udev"
> =20
> @@ -20,14 +25,17 @@ EXTRA_OECONF =3D " \
> =20
>  S =3D "${WORKDIR}/pcsc-lite-${PV}"
> =20
> -PACKAGES =3D+ "${PN}-lib"
> +PACKAGES =3D "${PN} ${PN}-dbg ${PN}-dev ${PN}-lib ${PN}-doc ${PN}-spy"
> =20
>  RRECOMMENDS_${PN} =3D "ccid"
> =20
> -FILES_${PN}-lib =3D "${libdir}/lib*${SOLIBS}"
> +FILES_${PN}-spy +=3D "${bindir}/pcsc-spy \
> +                    ${libdir}/libpcscspy*${SOLIBS} \
> +                    ${libdir{/libpcscspy.la"
> +FILES_${PN}-lib =3D "${libdir}/libpcsclite*${SOLIBS}"
> =20
>  RPROVIDES_${PN} +=3D "${PN}-systemd"
>  RREPLACES_${PN} +=3D "${PN}-systemd"
>  RCONFLICTS_${PN} +=3D "${PN}-systemd"
>  SYSTEMD_SERVICE_${PN} =3D "pcscd.socket"
> -RDEPENDS_${PN} +=3D"python"
> +RDEPENDS_${PN}-spy +=3D"python"
> =

