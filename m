Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RtNVS-0004jv-9b for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 19:05:06 +0100
Received: from f053033232.adsl.alicedsl.de ([78.53.33.232]
	helo=[192.168.178.43])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RtNNx-00016g-I1 for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 17:57:21 +0000
Message-ID: <1328291829.4220.12.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 03 Feb 2012 18:57:09 +0100
In-Reply-To: <1328214071-6782-1-git-send-email-tworaz666@gmail.com>
References: <1328214071-6782-1-git-send-email-tworaz666@gmail.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH] webkit-gtk: Make it webgl support configurable via DISTRO_FEATURES.
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
X-List-Received-Date: Fri, 03 Feb 2012 18:05:06 -0000
X-Groupsio-MsgNum: 17003
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-B8NuOE3xrEVVOBd8QRTX"

--=-B8NuOE3xrEVVOBd8QRTX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 02.02.2012, 21:21 +0100 schrieb Peter Tworek:
> * Add missing dependancy on virtual/libgl

depend*e*ncy and it*s* in the summary.

> * Make webgl configurable via DISTRO_FEATURES=3D"opengl"
> * Fix wrong resource path for error.html file

A separate patch for that would have been nice next time.

> Signed-off-by: Peter Tworek <tworaz666@gmail.com>
> ---
>  meta/recipes-sato/webkit/webkit-gtk_svn.bb |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-sato/webkit/webkit-gtk_svn.bb b/meta/recipes-sa=
to/webkit/webkit-gtk_svn.bb
> index 9652953..2d9ec80 100644
> --- a/meta/recipes-sato/webkit/webkit-gtk_svn.bb
> +++ b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
> @@ -8,13 +8,14 @@ LIC_FILES_CHKSUM =3D "file://Source/WebCore/rendering/R=
enderApplet.h;endline=3D22;md
>                      file://Source/JavaScriptCore/parser/Parser.h;endline=
=3D23;md5=3D2f3cff0ad0a9c486da5a376928973a90"
> =20
>  DEPENDS =3D "zlib enchant gnome-keyring libsoup-2.4 curl icu libxml2 cai=
ro libxslt libxt libidn gnutls gtk+ gstreamer gst-plugins-base flex-native =
gperf-native perl-native-runtime sqlite3"

(My mailer made a line break exactly after gtk so the + got on the next
line and I wondered what kind of diff that is.)

> +DEPENDS +=3D " ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/li=
bgl', '', d)}"
>  DEPENDS_darwin8 =3D "curl icu libxml2 cairo libxslt libidn gnutls gtk+ g=
streamer flex-native gperf-native perl-native-runtime sqlite3"
> =20
>  SRCREV_FORMAT =3D "source"
> =20
>  SRCREV =3D "101488"
>  PV =3D "1.7.2+svnr${SRCPV}"
> -PR =3D "r0"
> +PR =3D "r1"
> =20
>  SRC_URI =3D "\
>    svn://svn.webkit.org/repository/webkit/trunk/;module=3DSource;proto=3D=
http;name=3Dsource \
> @@ -41,6 +42,7 @@ EXTRA_OECONF =3D "\
>                  --enable-image-resizer \
>                  --enable-link-prefetch \
>                  --with-gtk=3D2.0 \
> +                ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-=
webgl', '--disable-webgl', d)} \
>                  UNICODE_CFLAGS=3D-D_REENTRANT \
>                 "
> =20
> @@ -81,7 +83,7 @@ FILES_${PN}launcher =3D "${bindir}/GtkLauncher"
>  FILES_${PN}launcher-dbg =3D "${bindir}/.debug/GtkLauncher"
>  FILES_libjavascriptcore =3D "${libdir}/libjavascriptcoregtk-1.0.so.*"
>  FILES_${PN}-webinspector =3D "${datadir}/webkitgtk-*/webinspector/"
> -FILES_${PN} +=3D "${datadir}/webkit-*/resources/error.html \
> +FILES_${PN} +=3D "${datadir}/webkitgtk-*/resources/error.html \
>                  ${datadir}/webkitgtk-*/images \
>                  ${datadir}/glib-2.0/schemas"

Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-B8NuOE3xrEVVOBd8QRTX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEUEABECAAYFAk8sH/UACgkQPX1aK2wOHVh/LQCeM5fbj6sYO1gNybitKtxNdkox
DdEAlA5laMqj9jX+yHdqATjDTM9OmWQ=
=F0T+
-----END PGP SIGNATURE-----

--=-B8NuOE3xrEVVOBd8QRTX--
