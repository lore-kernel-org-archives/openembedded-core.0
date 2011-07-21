Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qjvgp-00021U-UO
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 18:01:32 +0200
Received: by wwi18 with SMTP id 18so1160738wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 08:57:24 -0700 (PDT)
Received: by 10.216.140.141 with SMTP id e13mr327836wej.85.1311263843935;
	Thu, 21 Jul 2011 08:57:23 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id q20sm946199wec.41.2011.07.21.08.57.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jul 2011 08:57:23 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <3a3c12b31f8d8dc600750be9d75aeeb236c5b618.1311240498.git.nitin.a.kamble@intel.com>
Date: Thu, 21 Jul 2011 17:57:22 +0200
Message-Id: <B9F7AADC-C257-48A7-A607-41CB161DBA6C@dominion.thruhere.net>
References: <cover.1311240498.git.nitin.a.kamble@intel.com>
	<3a3c12b31f8d8dc600750be9d75aeeb236c5b618.1311240498.git.nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 2/2] glib-2.0: fix a compilation issue due to dtrace
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
X-List-Received-Date: Thu, 21 Jul 2011 16:01:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 jul. 2011, om 11:29 heeft nitin.a.kamble@intel.com het volgende =
geschreven:

> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>=20
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
> meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb |    1 -
> meta/recipes-core/glib-2.0/glib.inc           |    2 +-
> 2 files changed, 1 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb =
b/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
> index a2e609f..7d095c1 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
> @@ -19,4 +19,3 @@ SRC_URI[md5sum] =3D =
"789e7520f71c6a4bf08bc683ec764d24"
> SRC_URI[sha256sum] =3D =
"222f3055d6c413417b50901008c654865e5a311c73f0ae918b0a9978d1f9466f"
>=20
> BBCLASSEXTEND =3D "native"
> -


Missing PR bump

> diff --git a/meta/recipes-core/glib-2.0/glib.inc =
b/meta/recipes-core/glib-2.0/glib.inc
> index e25db3d..9768284 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -25,7 +25,7 @@ inherit autotools pkgconfig gettext
>=20
> S =3D "${WORKDIR}/glib-${PV}"
>=20
> -EXTRA_OECONF =3D "--disable-debug --enable-included-printf=3Dno"
> +EXTRA_OECONF =3D "--disable-debug --enable-included-printf=3Dno =
--enable-dtrace=3Dno"
> EXTRA_OECONF_virtclass-native =3D ""
> EXTRA_OECONF_linuxstdbase =3D "--enable-included-printf=3Dno"
>=20
> --=20
> 1.7.6
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



