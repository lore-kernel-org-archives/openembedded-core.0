Received: from mail-pa0-f46.google.com ([209.85.220.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UOESs-0005hV-2K
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 23:46:30 +0200
Received: by mail-pa0-f46.google.com with SMTP id lb1so2251928pab.19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2013 14:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=c8A4qpHnxpZNKB5cO6wf/qkpPI2DKrCDMvk7LZy9sHY=;
	b=R3Do61cLMTWZydNJRyQLL5kGjdKmbKx1dEnsjELs7I0TbltWFrT0hted9/Ei5I5XA4
	2X8LeT89Z04TeOUXMahsgIXAocRKHb3AyHPKh5p4Y9MQvegGZV9oA/DWTOSlnsDvrYRe
	xD6rm6OWe4ZUK9200ojR5JXIfEDHzQN1NO+AhmMT9tOBgHOwTJNBFTTPHukJvPaBt1z7
	+6bLduuRBoN0USDpeaK8BwgbDpdNUq3Rt465gEYKSefkEg2TSS1RA8JyC/9fKeZn/mhh
	K25gh1gZdv3u4iGqXtaI7+TFJJXrAP9Uo6rwJXC6MPEmXBQIUdYZYqABZJdpOvSejeCS
	iDEw==
X-Received: by 10.68.194.8 with SMTP id hs8mr16524822pbc.44.1365197354643;
	Fri, 05 Apr 2013 14:29:14 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id in5sm15786652pbc.20.2013.04.05.14.29.11
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 14:29:13 -0700 (PDT)
Date: Fri, 5 Apr 2013 23:29:04 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Yevhen Kyriukha <kirgene@gmail.com>
Message-ID: <20130405212904.GH3191@jama>
References: <1365196380-1930-1-git-send-email-kirgene@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1365196380-1930-1-git-send-email-kirgene@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: added python-systemd package generation.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Apr 2013 21:46:30 -0000
X-Groupsio-MsgNum: 37505
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wjoFZxbW4tu+iR6v"
Content-Disposition: inline

--wjoFZxbW4tu+iR6v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 06, 2013 at 12:13:00AM +0300, Yevhen Kyriukha wrote:
> ---
>  meta/recipes-core/systemd/systemd_199.bb |   21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core=
/systemd/systemd_199.bb
> index ba1d133..2a3d351 100644
> --- a/meta/recipes-core/systemd/systemd_199.bb
> +++ b/meta/recipes-core/systemd/systemd_199.bb
> @@ -10,12 +10,18 @@ PROVIDES =3D "udev"
> =20
>  PE =3D "1"
> =20
> -DEPENDS =3D "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-nati=
ve acl readline dbus libcap libcgroup tcp-wrappers glib-2.0"
> +DEPENDS =3D "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-nati=
ve acl readline dbus libcap libcgroup tcp-wrappers glib-2.0 python"
>  DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d=
)}"
> =20
>  SECTION =3D "base/shell"
> =20
> -inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d
> +inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d pytho=
nnative python-dir
> +
> +# need to export these variables for python-config to work
> +export BUILD_SYS
> +export HOST_SYS
> +export STAGING_INCDIR
> +export STAGING_LIBDIR
> =20
>  SRC_URI =3D "http://www.freedesktop.org/software/systemd/systemd-${PV}.t=
ar.xz \
>             file://touchscreen.rules \
> @@ -63,9 +69,9 @@ EXTRA_OECONF =3D " --with-rootprefix=3D${base_prefix} \
>                   --disable-coredump \
>                   --disable-introspection \
>                   --disable-tcpwrap \
> +                 --with-python \
>                   --enable-split-usr \
>                   --disable-microhttpd \
> -                 --without-python \
>                   --with-sysvrcnd-path=3D${sysconfdir} \
>                   ac_cv_path_KILL=3D${base_bindir}/kill \
>                 "
> @@ -114,7 +120,7 @@ python populate_packages_prepend (){
>  }
>  PACKAGES_DYNAMIC +=3D "^lib(udev|gudev|systemd).*"
> =20
> -PACKAGES =3D+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-anal=
yze ${PN}-kernel-install"
> +PACKAGES =3D+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-anal=
yze ${PN}-kernel-install python-${PN} python-${PN}-dbg python-${PN}-staticd=
ev"
> =20
>  USERADD_PACKAGES =3D "${PN}"
>  GROUPADD_PARAM_${PN} =3D "-r lock; -r systemd-journal"
> @@ -124,6 +130,13 @@ FILES_${PN}-analyze =3D "${base_bindir}/systemd-anal=
yze"
>  FILES_${PN}-initramfs =3D "/init"
>  RDEPENDS_${PN}-initramfs =3D "${PN}"
> =20
> +FILES_python-${PN} =3D "${PYTHON_SITEPACKAGES_DIR}/systemd/*.py* ${PYTHO=
N_SITEPACKAGES_DIR}/systemd/*.so"
> +RDEPENDS_python-${PN} =3D "python-core"
> +FILES_python-${PN}-staticdev =3D "${PYTHON_SITEPACKAGES_DIR}/systemd/*.l=
a"
> +RDEPENDS_python-${PN} =3D "python-core"
> +FILES_python-${PN}-dbg =3D "${PYTHON_SITEPACKAGES_DIR}/systemd/.debug"
> +RDEPENDS_python-${PN} =3D "python-core"

You have 3x RDEPENDS_python-${PN} (maybe you wanted -dbg and -staticdev,
but those do not need python-core imho).

It's more common to start with ${PN}, but maybe it makes sense with
python- prefix if you think about it as python module not systemd
package...

> +
>  FILES_${PN}-gui =3D "${bindir}/systemadm"
> =20
>  FILES_${PN}-vconsole-setup =3D "${systemd_unitdir}/systemd-vconsole-setu=
p \
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wjoFZxbW4tu+iR6v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFfQiAACgkQN1Ujt2V2gByBKACfaFJN2Ets1ehfRUSE7UeLYbdD
pUQAn1JeztYhEzZUFElSqhYPXTi54T5d
=BvwT
-----END PGP SIGNATURE-----

--wjoFZxbW4tu+iR6v--
