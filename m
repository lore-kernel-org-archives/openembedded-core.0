Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QgX19-00086S-S9
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 09:04:27 +0200
Received: by wyg30 with SMTP id 30so3509200wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 00:00:31 -0700 (PDT)
Received: by 10.216.60.74 with SMTP id t52mr5470959wec.30.1310454030719;
	Tue, 12 Jul 2011 00:00:30 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id z22sm7363021weq.26.2011.07.12.00.00.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jul 2011 00:00:29 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <d92f0fcf6f83379a91b23e697cd43ac00078257e.1310425837.git.sgw@linux.intel.com>
Date: Tue, 12 Jul 2011 09:00:27 +0200
Message-Id: <C1E5A836-FA0D-40EF-9257-11885C935182@dominion.thruhere.net>
References: <cover.1310425837.git.sgw@linux.intel.com>
	<d92f0fcf6f83379a91b23e697cd43ac00078257e.1310425837.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 08/26] sqlite3: inherit shared_lib class
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
X-List-Received-Date: Tue, 12 Jul 2011 07:04:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 jul 2011, om 01:13 heeft Saul Wold het volgende geschreven:

> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/recipes-support/sqlite/sqlite3.inc |   10 ++--------
> 1 files changed, 2 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta/recipes-support/sqlite/sqlite3.inc =
b/meta/recipes-support/sqlite/sqlite3.inc
> index a5d122d..5f1adb3 100644
> --- a/meta/recipes-support/sqlite/sqlite3.inc
> +++ b/meta/recipes-support/sqlite/sqlite3.inc
> @@ -5,7 +5,7 @@ DEPENDS =3D "readline ncurses"
> DEPENDS_virtclass-native =3D ""
> LICENSE =3D "PD"
>=20
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig shared_lib

that has lib${PN} at the end of packages

> -PACKAGES =3D "lib${PN} lib${PN}-dev lib${PN}-doc ${PN} ${PN}-dbg"

And this one at the front.

> -FILES_${PN} =3D "${bindir}/*"
> -FILES_lib${PN} =3D "${libdir}/*.so.*"
> -FILES_lib${PN}-dev =3D "${libdir}/*.a ${libdir}/*.la ${libdir}/*.so \
> -		       ${libdir}/pkgconfig ${includedir}"
> -FILES_lib${PN}-doc =3D "${docdir} ${mandir} ${infodir}"
> -AUTO_LIBNAME_PKGS =3D "lib${PN}"
> +FILES_lib${PN}-doc +=3D "${docdir} ${mandir} ${infodir}"
>=20
> BBCLASSEXTEND =3D "native nativesdk"
> --=20
> 1.7.3.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



