Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RqAZB-0004Ye-3k
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 22:39:41 +0100
Received: by wibhq7 with SMTP id hq7so1551565wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2012 13:31:54 -0800 (PST)
Received: by 10.180.95.131 with SMTP id dk3mr13954452wib.6.1327527114336;
	Wed, 25 Jan 2012 13:31:54 -0800 (PST)
Received: from [172.20.1.20] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id t6sm2092693wid.1.2012.01.25.13.31.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jan 2012 13:31:53 -0800 (PST)
References: <cover.1327519635.git.sgw@linux.intel.com>
	<ae108b14ac3903401a784251e370aef987c99e25.1327519635.git.sgw@linux.intel.com>
In-Reply-To: <ae108b14ac3903401a784251e370aef987c99e25.1327519635.git.sgw@linux.intel.com>
Mime-Version: 1.0 (1.0)
Message-Id: <FB0A5153-E488-4F88-9127-C733EB09E2DB@dominion.thruhere.net>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (9A405)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 25 Jan 2012 22:31:46 +0100
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkhG4TtAxDmiyYVY9f8uDvgDBcwfsYsfjcs546kG4wlWHd7yuVukwIx152L1Nj83Piw2aJ7
Subject: Re: [PATCH 1/4] pm-utils: Add grep to RDEPENDS to avoid command failures.
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
X-List-Received-Date: Wed, 25 Jan 2012 21:39:41 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 25 jan. 2012 om 20:29 heeft Saul Wold <sgw@linux.intel.com> het volgende g=
eschreven:

> From: Marc Ferland <ferlandm@sonatest.com>
>=20
> This is needed because the pm-utils functions uses the "-x"
> option of grep which is not supported by the busybox grep.
>=20
> [YOCTO #1887]
>=20
> Written-by: Marc Ferland <ferlandm@sonatest.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb |    4 +++-
> 1 files changed, 3 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb b/meta/recipes-bs=
p/pm-utils/pm-utils_1.4.1.bb
> index a4ac230..a976c25 100644
> --- a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
> +++ b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
> @@ -6,12 +6,14 @@ LICENSE=3D"GPLv2"
> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19=
f \
>                     file://src/pm-pmu.c;beginline=3D1;endline=3D22;md5=3D3=
c1ddbc54e735fb4a0386e14c78a3147"
>=20
> -PR =3D "r0"
> +PR =3D "r1"
>=20
> SRC_URI =3D "http://pm-utils.freedesktop.org/releases/pm-utils-${PV}.tar.g=
z"
>=20
> inherit pkgconfig autotools
>=20
> +RDEPENDS =3D "grep"

RDEPENDS_${PN} =3D "grep"


> +
> FILES_${PN}-dbg +=3D "${libdir}/pm-utils/bin/.debug \
>            ${datadir}/doc/pm-utils/README.debugging"
>=20
> --=20
> 1.7.6.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


