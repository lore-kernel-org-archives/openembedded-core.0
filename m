Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RqhBm-0007U2-6y
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 09:29:42 +0100
Received: by wgbdt11 with SMTP id dt11so1350180wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 00:21:53 -0800 (PST)
Received: by 10.180.101.161 with SMTP id fh1mr9190350wib.0.1327652513711;
	Fri, 27 Jan 2012 00:21:53 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id cb8sm10064909wib.0.2012.01.27.00.21.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jan 2012 00:21:52 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1b0c6306e6ea02b92ce5a1bac7ce21a31ad13204.1327123057.git.sgw@linux.intel.com>
Date: Fri, 27 Jan 2012 09:21:48 +0100
Message-Id: <868E40BB-6EA8-4C91-AFEA-5C8949A95616@dominion.thruhere.net>
References: <cover.1327123057.git.sgw@linux.intel.com>
	<1b0c6306e6ea02b92ce5a1bac7ce21a31ad13204.1327123057.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 13/20] libtool: refactor packages for staticdev
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
X-List-Received-Date: Fri, 27 Jan 2012 08:29:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 jan. 2012, om 06:18 heeft Saul Wold het volgende geschreven:

> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/recipes-devtools/libtool/libtool-2.4.2.inc |    9 +++++----
> 1 files changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/libtool/libtool-2.4.2.inc =
b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
> index a8ea0ae..d55b2bd 100644
> --- a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
> +++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
> @@ -8,7 +8,7 @@ LICENSE =3D "GPLv2 & LGPLv2.1"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D751419260aa954499f7abaabaa882bbe \
>     file://libltdl/COPYING.LIB;md5=3De3eda01d9815f8d24aae2dbd89b68b06"
>=20
> -INC_PR =3D "r0"
> +INC_PR =3D "r1"
>=20
> SRC_URI =3D "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
>            file://trailingslash.patch \
> @@ -34,10 +34,11 @@ EXTRA_AUTORECONF =3D "--exclude=3Dlibtoolize"
>=20
> DEPENDS =3D "libtool-native"
>=20
> -PACKAGES =3D+ "libltdl libltdl-dev libltdl-dbg"
> +PACKAGES =3D+ "libltdl libltdl-dev libltdl-dbg libltdl-staticdev"
> FILES_${PN} +=3D "${datadir}/aclocal*"
> -FILES_libltdl =3D "${libdir}/libltdl.so.*"
> -FILES_libltdl-dev =3D "${libdir}/libltdl.* ${includedir}/ltdl.h =
${includedir}/libltdl/*.h"
> +FILES_libltdl =3D "${libdir}/libltdl${SOLIBS}

The missing quote prohibits OE from packaging it correctly, leading to:

|  * satisfy_dependencies_for: Cannot satisfy the following dependencies =
for task-gnome:
|  *    libltdl7 (>=3D 2.4.2) *   libltdl7 (>=3D 2.4.2) *   libltdl7 (>=3D=
 2.4.2) *   libltdl7 (>=3D 2.4.2) *   libltdl7 (>=3D 2.4.2) *   libltdl7 =
(>=3D 2.4.2) *   libltdl7 (>=3D 2.4.2) *

For incremental builds and binary feeds.

regards,

Koen=


