Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SQBrH-0001EQ-Mn
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 08:19:15 +0200
Received: by wgbdr1 with SMTP id dr1so2068313wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2012 23:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kR5+yF+x/6aV/2RjGGWQrRj+pfYmsH6jp4ny7uK+u54=;
	b=mFy0hPxHuN5KcqHLZO5IQQZdN+ItKL9C9asqXyMvpKEmhY4D7BMO/uXcXZJRt43M9A
	jhlPp4a6rkkzgmvB2KPzNwGL9TX+3Y1SMyIHcGeZ361rdPLMm2rG5VRVIC0TVpSsy5u0
	m648TGM6GA1RWoKNXxXY5D8a5YtRzuSDPVBvTjxYsR9eTdEvrAnUuoVOQHGtjkjiS4Pj
	WraGFU7iIkleiwaEomD7vmXhkzTAT/R3OeT6HjtpLnMpSXeLYPDOhV9eSu+8KK/weQXt
	E6tQ0AcJ1JpDKo9wkHJRcWI6Sxwb8JpGRczN/ouLQRk5CAjCWf5dytm4ej9nscxRMwW4
	npRg==
Received: by 10.180.24.66 with SMTP id s2mr47124wif.7.1336111769443;
	Thu, 03 May 2012 23:09:29 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e8sm2418063wiy.3.2012.05.03.23.09.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 May 2012 23:09:28 -0700 (PDT)
Date: Fri, 4 May 2012 08:09:31 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120504060931.GB3163@jama.jama.net>
References: <cover.1335992192.git.raj.khem@gmail.com>
	<907b74f1035fcd569920630c6fc68751cfb8ca14.1335992192.git.raj.khem@gmail.com>
	<4FA327A2.5040705@linux.intel.com>
	<20120504053258.GA3163@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120504053258.GA3163@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/3] kmod: Add recipes
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
X-List-Received-Date: Fri, 04 May 2012 06:19:15 -0000
X-Groupsio-MsgNum: 21639
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IrhDeMKUP4DT/M7F"
Content-Disposition: inline

--IrhDeMKUP4DT/M7F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 04, 2012 at 07:32:58AM +0200, Martin Jansa wrote:
> On Thu, May 03, 2012 at 05:49:38PM -0700, Saul Wold wrote:
> > On 05/02/2012 01:58 PM, Khem Raj wrote:
> > > kmod is replacement for module-init-tools
> > >
> > > Signed-off-by: Khem Raj<raj.khem@gmail.com>
> > > ---
> > >   meta/recipes-kernel/kmod/kmod-native_git.bb      |   14 +++++
> > >   meta/recipes-kernel/kmod/kmod.inc                |   31 +++++++++++
> > >   meta/recipes-kernel/kmod/kmod/depmod-search.conf |    6 ++
> > >   meta/recipes-kernel/kmod/kmod_git.bb             |   62 +++++++++++=
+++++++++++
> > >   4 files changed, 113 insertions(+), 0 deletions(-)
> > >   create mode 100644 meta/recipes-kernel/kmod/kmod-native_git.bb
> > >   create mode 100644 meta/recipes-kernel/kmod/kmod.inc
> > >   create mode 100644 meta/recipes-kernel/kmod/kmod/depmod-search.conf
> > >   create mode 100644 meta/recipes-kernel/kmod/kmod_git.bb
> > >
> >=20
> > I have been seeing build failures in the man section of kmod:
> >=20
> > | Making all in man
> > |=20
> > /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/b=
uild/tmp/sysroots/x86_64-linux/usr/bin/xsltproc=20
> > --nonet --param funcsynopsis.style "'ansi'" \
> > |=20
> > http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl=
=20
> > depmod.d.xml
> > |=20
> > /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/b=
uild/tmp/sysroots/x86_64-linux/usr/bin/xsltproc=20
> > --nonet --param funcsynopsis.style "'ansi'" \
> > |=20
> > http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl=
=20
> > modprobe.d.xml
> > | I/O error : Attempt to load network entity=20
> > http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
> > | warning: failed to load external entity=20
> > "http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xs=
l"
> > | cannot parse=20
> > http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
> > | make[2]: *** [depmod.d.5] Error 4
> > | make[2]: *** Waiting for unfinished jobs....
> > | I/O error : Attempt to load network entity=20
> > http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
> > | warning: failed to load external entity=20
> > "http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xs=
l"
> > | cannot parse=20
> > http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
> > | make[2]: *** [modprobe.d.5] Error 4
> > | make[1]: *** [all-recursive] Error 1
> > | make: *** [all] Error 2
> > | ERROR: oe_runmake failed
> >=20
> > Can you confirm this issue?
>=20
> I can from meta-oe version of kmod
>=20
> http://git.openembedded.org/meta-openembedded/commit/?id=3Df75e91c48cfc58=
f91dc8f70f80a154d97d2d6c60
>=20
> Not sure why khem haven't used this commit/patch.

I've filled https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2416 so
maybe someone will fix it properly.

Cheers,

>=20
> Cheers,
>=20
> >=20
> > Sau!
> >=20
> > > diff --git a/meta/recipes-kernel/kmod/kmod-native_git.bb b/meta/recip=
es-kernel/kmod/kmod-native_git.bb
> > > new file mode 100644
> > > index 0000000..96de8b8
> > > --- /dev/null
> > > +++ b/meta/recipes-kernel/kmod/kmod-native_git.bb
> > > @@ -0,0 +1,14 @@
> > > +# Copyright (C) 2012 Khem Raj<raj.khem@gmail.com>
> > > +# Released under the MIT license (see COPYING.MIT for the terms)
> > > +
> > > +require kmod.inc
> > > +inherit native
> > > +
> > > +PR =3D "${INC_PR}.0"
> > > +
> > > +do_install_append (){
> > > +	for tool in depmod insmod lsmod modinfo modprobe rmmod
> > > +	do
> > > +		ln -s kmod ${D}${bindir}/$tool
> > > +	done
> > > +}
> > > diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/=
kmod/kmod.inc
> > > new file mode 100644
> > > index 0000000..940a317
> > > --- /dev/null
> > > +++ b/meta/recipes-kernel/kmod/kmod.inc
> > > @@ -0,0 +1,31 @@
> > > +# Copyright (C) 2012 Khem Raj<raj.khem@gmail.com>
> > > +# Released under the MIT license (see COPYING.MIT for the terms)
> > > +
> > > +DESCRIPTION =3D "kmod is a set of tools to handle common tasks with =
Linux kernel modules like \
> > > +               insert, remove, list, check properties, resolve depen=
dencies and aliases."
> > > +HOMEPAGE =3D "http://packages.profusion.mobi/kmod/"
> > > +LICENSE =3D "GPL-2.0+&  LGPL-2.1+"
> > > +LICENSE_libkmod =3D "LGPL-2.1+"
> > > +SECTION =3D "base"
> > > +PV =3D "7+git${SRCREV}"
> > > +INC_PR =3D "r0"
> > > +DEPENDS +=3D "gnome-doc-utils-native"
> > > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaaba=
a882bbe \
> > > +                    file://libkmod/COPYING;md5=3Da6f89e2100d9b6cdffc=
ea4f398e37343 \
> > > +                   "
> > > +inherit autotools
> > > +
> > > +SRC_URI =3D "git://git.profusion.mobi/kmod.git;protocol=3Dgit;branch=
=3Dmaster \
> > > +           file://depmod-search.conf \
> > > +          "
> > > +
> > > +SRCREV =3D "02629fa02e96763db7460a930239cc93649a52f8"
> > > +
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +EXTRA_AUTORECONF +=3D "--install --symlink"
> > > +EXTRA_OECONF +=3D"--enable-debug --enable-logging --enable-tools"
> > > +
> > > +do_configure_prepend () {
> > > +        gtkdocize --docdir ${S}/libkmod/docs || touch ${S}/libkmod/d=
ocs/gtk-doc.make
> > > +}
> > > diff --git a/meta/recipes-kernel/kmod/kmod/depmod-search.conf b/meta/=
recipes-kernel/kmod/kmod/depmod-search.conf
> > > new file mode 100644
> > > index 0000000..527c0bb
> > > --- /dev/null
> > > +++ b/meta/recipes-kernel/kmod/kmod/depmod-search.conf
> > > @@ -0,0 +1,6 @@
> > > +#
> > > +# /etc/depmod.d/depmod.conf
> > > +#
> > > +
> > > +search updates extramodules built-in
> > > +
> > > diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kern=
el/kmod/kmod_git.bb
> > > new file mode 100644
> > > index 0000000..928fa88
> > > --- /dev/null
> > > +++ b/meta/recipes-kernel/kmod/kmod_git.bb
> > > @@ -0,0 +1,62 @@
> > > +# Copyright (C) 2012 Khem Raj<raj.khem@gmail.com>
> > > +# Released under the MIT license (see COPYING.MIT for the terms)
> > > +
> > > +require kmod.inc
> > > +
> > > +PR =3D "${INC_PR}.0"
> > > +
> > > +PROVIDES_${PN} +=3D "module-init-tools-insmod-static module-init-too=
ls-depmod module-init-tools"
> > > +RPROVIDES_${PN} +=3D "module-init-tools-insmod-static module-init-to=
ols-depmod module-init-tools"
> > > +CONFLICTS_${PN} +=3D "module-init-tools-insmod-static module-init-to=
ols-depmod module-init-tools"
> > > +
> > > +# autotools set prefix to /usr, however we want them in /bin and /sb=
in
> > > +bindir =3D "${base_bindir}"
> > > +sbindir =3D "${base_sbindir}"
> > > +# libdir =3D "${base_libdir}"
> > > +
> > > +SRC_URI +=3D " \
> > > +            file://depmod-search.conf \
> > > +           "
> > > +
> > > +do_install_append () {
> > > +        install -dm755 ${D}${base_bindir}
> > > +        install -dm755 ${D}${base_sbindir}
> > > +        # add symlinks to kmod
> > > +        ln -s ..${base_bindir}/kmod ${D}${base_bindir}/lsmod.kmod
> > > +        for tool in {ins,rm,dep}mod mod{info,probe}; do
> > > +                ln -s ..${base_bindir}/kmod ${D}${base_sbindir}/${to=
ol}.kmod
> > > +        done
> > > +        # configuration directories
> > > +        install -dm755 ${D}${base_libdir}/depmod.d
> > > +        install -dm755 ${D}${base_libdir}/modprobe.d
> > > +        install -dm755 ${D}${sysconfdir}/depmod.d
> > > +        install -dm755 ${D}${sysconfdir}/modprobe.d
> > > +
> > > +        # install depmod.d file for search/ dir
> > > +        install -Dm644 "${WORKDIR}/depmod-search.conf" "${D}${base_l=
ibdir}/depmod.d/search.conf"
> > > +}
> > > +
> > > +pkg_postinst_kmod() {
> > > +        for f in sbin/insmod sbin/modprobe sbin/rmmod sbin/modinfo; =
do
> > > +                bn=3D`basename $f`
> > > +                update-alternatives --install /$f $bn /$f.kmod 60
> > > +        done
> > > +        update-alternatives --install /bin/lsmod bin-lsmod /bin/lsmo=
d.kmod 60
> > > +        update-alternatives --install /sbin/lsmod lsmod /bin/lsmod.k=
mod 60
> > > +        update-alternatives --install /sbin/depmod depmod /sbin/depm=
od.kmod 60
> > > +}
> > > +
> > > +pkg_prerm_kmod() {
> > > +        for f in sbin/insmod sbin/modprobe sbin/rmmod sbin/modinfo; =
do
> > > +                bn=3D`basename $f`
> > > +                update-alternatives --remove $bn /$f.kmod
> > > +        done
> > > +        update-alternatives --remove bin-lsmod /bin/lsmod.kmod
> > > +        update-alternatives --remove lsmod /bin/lsmod.kmod
> > > +        update-alternatives --remove depmod /sbin/depmod.kmod
> > > +}
> > > +
> > > +PACKAGES =3D+ "libkmod"
> > > +
> > > +FILES_libkmod =3D "${base_libdir}/libkmod*${SOLIBS}"
> > > +FILES_${PN} +=3D "${base_libdir}/depmod.d ${base_libdir}/modprobe.d"
> >=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IrhDeMKUP4DT/M7F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+jcpsACgkQN1Ujt2V2gBz4/gCgjoLGUJwUrfYaEuMgI6P+wftf
uPYAoJ+fFiTi/xAcqnxUy/SJwsWjtx88
=fHna
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--
