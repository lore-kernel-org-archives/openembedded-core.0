Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QWONK-0000hD-I9
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 09:49:26 +0200
Received: by wye20 with SMTP id 20so4247920wye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 00:46:01 -0700 (PDT)
Received: by 10.216.62.137 with SMTP id y9mr367869wec.107.1308037561570;
	Tue, 14 Jun 2011 00:46:01 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fl19sm4814525wbb.66.2011.06.14.00.46.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Jun 2011 00:46:00 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <c3921b032b4db674706a2e17e6100d97c30ba994.1308030161.git.lei.mei@intel.com>
Date: Tue, 14 Jun 2011 09:45:58 +0200
Message-Id: <3520C10B-8657-4900-8C2E-6A4EE6AA7FC3@dominion.thruhere.net>
References: <cover.1308030161.git.lei.mei@intel.com>
	<c3921b032b4db674706a2e17e6100d97c30ba994.1308030161.git.lei.mei@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/1] gupnp: upgrade from 0.16.0 to 0.16.1
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
X-List-Received-Date: Tue, 14 Jun 2011 07:49:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 jun 2011, om 07:59 heeft Mei Lei het volgende geschreven:

> Signed-off-by: Mei Lei <lei.mei@intel.com>
> ---
> .../gupnp/{gupnp_0.16.0.bb =3D> gupnp_0.16.1.bb}     |    7 +++++--
> 1 files changed, 5 insertions(+), 2 deletions(-)
> rename meta/recipes-connectivity/gupnp/{gupnp_0.16.0.bb =3D> =
gupnp_0.16.1.bb} (79%)
>=20
> diff --git a/meta/recipes-connectivity/gupnp/gupnp_0.16.0.bb =
b/meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb
> similarity index 79%
> rename from meta/recipes-connectivity/gupnp/gupnp_0.16.0.bb
> rename to meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb
> index 07b6b90..5b23134 100644
> --- a/meta/recipes-connectivity/gupnp/gupnp_0.16.0.bb
> +++ b/meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb
> @@ -7,8 +7,8 @@ DEPENDS =3D "e2fsprogs gssdp libsoup-2.4 libxml2 =
gnome-icon-theme"
>=20
> SRC_URI =3D =
"http://gupnp.org/sites/all/files/sources/${BPN}-${PV}.tar.gz"
>=20
> -SRC_URI[md5sum] =3D "61b240c1a9fdf8ca82c5c3adde0d6757"
> -SRC_URI[sha256sum] =3D =
"1b77201866b7632fb68bc2a3bdea22ef8ead34ba850b3ee367797432cfc0f04a"
> +SRC_URI[md5sum] =3D "021bb237741532af4bca50157ff326e4"
> +SRC_URI[sha256sum] =3D =
"f01a1f4fd36ce161a3df29fa83e1a0a2fb40d3c9f30f6b403e7791688ad24cfe"
>=20
> PR =3D "r0"
>=20
> @@ -19,6 +19,9 @@ inherit autotools pkgconfig
> FILES_${PN} =3D "${libdir}/*.so.*"
> FILES_${PN}-dev +=3D "${bindir}/gupnp-binding-tool"
>=20
> +do_configure_prepend() {
> +	sed -i -e =
's:GOBJECT_INTROSPECTION_CHECK(\[0.6.4\]):AM_CONDITIONAL([HAVE_INTROSPECTI=
ON], [false]):g' ${S}/configure.ac
> +}
> SYSROOT_PREPROCESS_FUNCS +=3D "gupnp_sysroot_preprocess"

Does adding 'gobject-introspection' to DEPENDS or =
--disable-introspection to EXTRA_OECONF fix the build issue?

regards,

Koen=


