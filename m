Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9615961485
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 08:34:55 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id c4so5775793eek.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 01:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hIGfu5LjZlaktIhLxz3nG+Mqjd1zsjWB4z8aFOMQUR4=;
	b=deBmrWlMDtSvnzu6sUKZDES19CndMCTTkC7GO2bj2RKI19U62Uj0NZB4NRLUPIbpy6
	JNFE33LjTYHOwAZMgJLWy0mCxyzSOeF+u7BRy4TibxLg+KXkPAOqOff3msYkPwEkzN9x
	AQXyNjyu/lKqnrmEW9kdGoJp3+jPsn1Z7RLsDZaM6IKG8hD4D3QhZSNxhY74Albe3/Ia
	sGLWoSowJ1GGYvlIwbyta4yFphuyAYQHGQcL/IiCCsNUINCV9Of5VJNlxseM4ig61BC7
	A+q5BaO7QNsTZ9Btw2DqnTczqnu333illsf+hm+HF5PtaiInEmGlMpOcv4E4zUJYaQ8g
	7n5w==
X-Received: by 10.15.107.194 with SMTP id cb42mr23587043eeb.136.1372062895425; 
	Mon, 24 Jun 2013 01:34:55 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	i2sm26658417eeu.4.2013.06.24.01.34.54 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 24 Jun 2013 01:34:54 -0700 (PDT)
Date: Mon, 24 Jun 2013 10:35:30 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Yevhen Kyriukha <kirgene@gmail.com>
Message-ID: <20130624083530.GN14021@jama>
References: <1371951415-52721-1-git-send-email-kirgene@gmail.com>
	<CA+chaQcfgpbEjMZ8pKoP6BWkXrdQYw6+MEDc2yu8sYS1QRsQOA@mail.gmail.com>
	<CADV-EXGjDtAyJMc7n1M8SaUjiNPw5U9p6CYNaFEXqy5XXSqaUw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADV-EXGjDtAyJMc7n1M8SaUjiNPw5U9p6CYNaFEXqy5XXSqaUw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6] systemd: added python-systemd package generation.
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
X-List-Received-Date: Mon, 24 Jun 2013 08:34:56 -0000
X-Groupsio-MsgNum: 40924
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JLiXfqD9/Kt1b+Pq"
Content-Disposition: inline

--JLiXfqD9/Kt1b+Pq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2013 at 01:21:07PM +0300, Yevhen Kyriukha wrote:
> Oh, yes.
> You should move "pythonnative python-dir" from DEPENDS and append to inhe=
rit.

me? it's your patch, please send v7.

> 2013/6/23 Martin Jansa <martin.jansa@gmail.com>:
> > -DEPENDS =3D "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-na=
tive
> > acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux"
> > +DEPENDS =3D "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-na=
tive
> > acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux
> > pythonnative python-dir"
> >
> > This doesn't look right, did you want to inherit them?
> >
> >
> > On Sun, Jun 23, 2013 at 3:36 AM, Yevhen Kyriukha <kirgene@gmail.com> wr=
ote:
> >>
> >> ---
> >>  meta/recipes-core/systemd/systemd_204.bb |   20 ++++++++++++++++----
> >>  1 file changed, 16 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/meta/recipes-core/systemd/systemd_204.bb
> >> b/meta/recipes-core/systemd/systemd_204.bb
> >> index b8b1290..ea0cdd2 100644
> >> --- a/meta/recipes-core/systemd/systemd_204.bb
> >> +++ b/meta/recipes-core/systemd/systemd_204.bb
> >> @@ -10,9 +10,15 @@ PROVIDES =3D "udev"
> >>
> >>  PE =3D "1"
> >>
> >> -DEPENDS =3D "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-n=
ative
> >> acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux"
> >> +DEPENDS =3D "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-n=
ative
> >> acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux
> >> pythonnative python-dir"
> >>  DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', ''=
, d)}"
> >>
> >> +# need to export these variables for python-config to work
> >> +export BUILD_SYS
> >> +export HOST_SYS
> >> +export STAGING_INCDIR
> >> +export STAGING_LIBDIR
> >> +
> >>  SECTION =3D "base/shell"
> >>
> >>  inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d
> >> update-alternatives qemu
> >> @@ -51,6 +57,8 @@ DEPENDS +=3D "libgcrypt"
> >>  # Compress the journal
> >>  PACKAGECONFIG[xz] =3D "--enable-xz,--disable-xz,xz"
> >>  PACKAGECONFIG[tcp-wrappers] =3D
> >> "--enable-tcpwrap,--disable-tcpwrap,tcp-wrappers"
> >> +# Use python-systemd
> >> +PACKAGECONFIG[python] =3D "--with-python,--without-python,python"
> >>
> >>  CACHED_CONFIGUREVARS =3D "ac_cv_path_KILL=3D${base_bindir}/kill"
> >>
> >> @@ -71,7 +79,6 @@ EXTRA_OECONF =3D " --with-rootprefix=3D${rootprefix}=
 \
> >>                   --disable-tcpwrap \
> >>                   --enable-split-usr \
> >>                   --disable-microhttpd \
> >> -                 --without-python \
> >>                   --with-sysvrcnd-path=3D${sysconfdir} \
> >>                   --with-firmware-path=3D/lib/firmware \
> >>                   ac_cv_path_KILL=3D${base_bindir}/kill \
> >> @@ -93,6 +100,8 @@ do_install() {
> >>         # Provided by a separate recipe
> >>         rm ${D}${systemd_unitdir}/system/serial-getty* -f
> >>
> >> +       rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/systemd/*.la
> >> +
> >>         # Provide support for initramfs
> >>         ln -s ${rootlibexecdir}/systemd/systemd ${D}/init
> >>         ln -s ${rootlibexecdir}/systemd/systemd-udevd
> >> ${D}/${base_sbindir}/udevd
> >> @@ -121,7 +130,7 @@ python populate_packages_prepend (){
> >>  }
> >>  PACKAGES_DYNAMIC +=3D "^lib(udev|gudev|systemd).*"
> >>
> >> -PACKAGES =3D+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-a=
nalyze
> >> ${PN}-kernel-install"
> >> +PACKAGES =3D+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-a=
nalyze
> >> ${PN}-kernel-install python-${PN}"
> >>
> >>  USERADD_PACKAGES =3D "${PN}"
> >>  GROUPADD_PARAM_${PN} =3D "-r lock; -r systemd-journal"
> >> @@ -131,6 +140,9 @@ FILES_${PN}-analyze =3D "${bindir}/systemd-analyze"
> >>  FILES_${PN}-initramfs =3D "/init"
> >>  RDEPENDS_${PN}-initramfs =3D "${PN}"
> >>
> >> +FILES_python-${PN} =3D "${PYTHON_SITEPACKAGES_DIR}/systemd/*.py*
> >> ${PYTHON_SITEPACKAGES_DIR}/systemd/*.so"
> >> +RDEPENDS_python-${PN} =3D "python-core python-datetime python-logging
> >> python-syslog"
> >> +
> >>  FILES_${PN}-gui =3D "${bindir}/systemadm"
> >>
> >>  FILES_${PN}-vconsole-setup =3D
> >> "${rootlibexecdir}/systemd/systemd-vconsole-setup \
> >> @@ -187,7 +199,7 @@ FILES_${PN} =3D " ${base_bindir}/* \
> >>                  /lib/udev/rules.d/99-systemd.rules \
> >>                 "
> >>
> >> -FILES_${PN}-dbg +=3D "${rootlibdir}/.debug ${systemd_unitdir}/.debug
> >> ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
> >> +FILES_${PN}-dbg +=3D "${rootlibdir}/.debug ${systemd_unitdir}/.debug
> >> ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/
> >> ${PYTHON_SITEPACKAGES_DIR}/systemd/.debug"
> >>  FILES_${PN}-dev +=3D "${base_libdir}/security/*.la
> >> ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
> >>
> >>  RDEPENDS_${PN} +=3D "dbus util-linux-mount"
> >> --
> >> 1.7.9.5
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JLiXfqD9/Kt1b+Pq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHIBNIACgkQN1Ujt2V2gBwkeACgs227wTImNrVWa0h/eBlShIKX
OzwAoKIIKOS8pG4z1jD9c0QA5KWHdRvv
=e+PN
-----END PGP SIGNATURE-----

--JLiXfqD9/Kt1b+Pq--
