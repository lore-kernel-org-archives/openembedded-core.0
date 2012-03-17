Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1S8qog-0006ds-DI for openembedded-core@lists.openembedded.org;
	Sat, 17 Mar 2012 11:24:54 +0100
Received: from f053034109.adsl.alicedsl.de ([78.53.34.109]
	helo=[192.168.178.43])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1S8qgN-0005XA-Mt for openembedded-core@lists.openembedded.org;
	Sat, 17 Mar 2012 10:16:19 +0000
Message-ID: <1331979365.3602.6.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Sat, 17 Mar 2012 11:16:05 +0100
In-Reply-To: <a1f5c268db3260e44e705a22e67d54185a83e4e3.1331924359.git.nitin.a.kamble@intel.com>
References: <29a1b86fa5383e17f311314c38972b78d760fd92.1331924359.git.nitin.a.kamble@intel.com>
	<a1f5c268db3260e44e705a22e67d54185a83e4e3.1331924359.git.nitin.a.kamble@intel.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 7/7] git: fix packaging warnings
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
X-List-Received-Date: Sat, 17 Mar 2012 10:24:54 -0000
X-Groupsio-MsgNum: 19100
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-oMB0zle6t6BCHusSCLWN"

--=-oMB0zle6t6BCHusSCLWN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Nitin,


Am Freitag, den 16.03.2012, 12:00 -0700 schrieb nitin.a.kamble@intel.com:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>=20
> This commits fixes these packaging warnings
>  WARNING: For recipe git, the following files/directories were installed
> but not shipped in any package:
>  WARNING:   /usr/lib/perl-native
>  WARNING:   /usr/lib/perl-native/perl
>  WARNING:   /usr/lib/perl-native/perl/5.14.2
>  WARNING:   /usr/lib/perl-native/perl/5.14.2/Git.pm
>  WARNING:   /usr/lib/perl-native/perl/5.14.2/perllocal.pod
>  WARNING:   /usr/lib/perl-native/perl/5.14.2/auto
>  WARNING:   /usr/lib/perl-native/perl/5.14.2/auto/Git
>  WARNING:   /usr/lib/perl-native/perl/5.14.2/auto/Git/.packlist
>=20
> PR not bumber because no change in the output packages.

bumpe*d*

> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  meta/recipes-devtools/git/git.inc |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/gi=
t/git.inc
> index ca13ffd..be3831b 100644
> --- a/meta/recipes-devtools/git/git.inc
> +++ b/meta/recipes-devtools/git/git.inc
> @@ -16,6 +16,7 @@ do_install () {
>  	oe_runmake install DESTDIR=3D"${D}" bindir=3D${bindir} \
>  		template_dir=3D${datadir}/git-core/templates \
>  		GIT_PYTHON_DIR=3D${D}${datadir}/git-core/python
> +	rm -rf ${D}${libdir}/perl-native
>  }
> =20
>  do_install_append_virtclass-native() {
> @@ -47,6 +48,7 @@ RDEPENDS_${PN}-perltools =3D "${PN} perl perl-module-fi=
le-path findutils"
>  PACKAGES =3D+ "${PN}-python"
>  FILES_${PN}-python =3D "${libdir}/python*"
> =20
> +

This extra line seems to have been snuck in.

>  # git-tk package with gitk and git-gui
>  PACKAGES =3D+ "${PN}-tk"
>  #RDEPENDS_${PN}-tk =3D "${PN} tk tcl"


Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-oMB0zle6t6BCHusSCLWN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEABECAAYFAk9kZGYACgkQPX1aK2wOHVgsqACfUo2jURfnlGl98NHGWu7C3VeL
4QcAnjmao/oUiV9aomACq8NvX4yWP8Dl
=Llxf
-----END PGP SIGNATURE-----

--=-oMB0zle6t6BCHusSCLWN--
