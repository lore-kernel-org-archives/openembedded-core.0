Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SQBHw-0000Gg-Lx
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 07:42:44 +0200
Received: by wera1 with SMTP id a1so1739958wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2012 22:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=c2rm0BPyZbaVVEl0/Xm/3I5V3f4yproanxlH23hhw6Q=;
	b=emvsG9N91Y/d2/jlD78um3CipNur8xzS9kb5Qwbey04GgY+uhyQz2iTKgcn9C/bbMF
	VTR27hifu9SHh2HqKt6tx1Lcx42U5RI+ea2vJhHIInR8aja11XLvInsuS5/lhp9aE4bj
	vbWtM4Cp9YeMORISJlbZzE+F1NRFxG3nCjJUlOOBUqt0JGxs2XvpPM41Vy8tTuTQ16EQ
	HKWhNvaQgiApQkJ4ZWZZGXzfrjbZIvqdSBsj787YZZJPXZzT/ZPnQ//e/YmNHfy7obBW
	uFc/QE5uLjz76XAxBWmxW/7TCcGJeabFxULXDgBf5oaUQwUQ8V31UAD06Z1XTgwcYe6G
	Cwew==
Received: by 10.180.24.66 with SMTP id s2mr9518105wif.7.1336109576883;
	Thu, 03 May 2012 22:32:56 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ev10sm2177670wid.10.2012.05.03.22.32.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 May 2012 22:32:55 -0700 (PDT)
Date: Fri, 4 May 2012 07:32:58 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120504053258.GA3163@jama.jama.net>
References: <cover.1335992192.git.raj.khem@gmail.com>
	<907b74f1035fcd569920630c6fc68751cfb8ca14.1335992192.git.raj.khem@gmail.com>
	<4FA327A2.5040705@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4FA327A2.5040705@linux.intel.com>
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
X-List-Received-Date: Fri, 04 May 2012 05:42:44 -0000
X-Groupsio-MsgNum: 21635
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline

--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 03, 2012 at 05:49:38PM -0700, Saul Wold wrote:
> On 05/02/2012 01:58 PM, Khem Raj wrote:
> > kmod is replacement for module-init-tools
> >
> > Signed-off-by: Khem Raj<raj.khem@gmail.com>
> > ---
> >   meta/recipes-kernel/kmod/kmod-native_git.bb      |   14 +++++
> >   meta/recipes-kernel/kmod/kmod.inc                |   31 +++++++++++
> >   meta/recipes-kernel/kmod/kmod/depmod-search.conf |    6 ++
> >   meta/recipes-kernel/kmod/kmod_git.bb             |   62 +++++++++++++=
+++++++++
> >   4 files changed, 113 insertions(+), 0 deletions(-)
> >   create mode 100644 meta/recipes-kernel/kmod/kmod-native_git.bb
> >   create mode 100644 meta/recipes-kernel/kmod/kmod.inc
> >   create mode 100644 meta/recipes-kernel/kmod/kmod/depmod-search.conf
> >   create mode 100644 meta/recipes-kernel/kmod/kmod_git.bb
> >
>=20
> I have been seeing build failures in the man section of kmod:
>=20
> | Making all in man
> |=20
> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/bui=
ld/tmp/sysroots/x86_64-linux/usr/bin/xsltproc=20
> --nonet --param funcsynopsis.style "'ansi'" \
> |=20
> http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl=
=20
> depmod.d.xml
> |=20
> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/bui=
ld/tmp/sysroots/x86_64-linux/usr/bin/xsltproc=20
> --nonet --param funcsynopsis.style "'ansi'" \
> |=20
> http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl=
=20
> modprobe.d.xml
> | I/O error : Attempt to load network entity=20
> http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
> | warning: failed to load external entity=20
> "http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl"
> | cannot parse=20
> http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
> | make[2]: *** [depmod.d.5] Error 4
> | make[2]: *** Waiting for unfinished jobs....
> | I/O error : Attempt to load network entity=20
> http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
> | warning: failed to load external entity=20
> "http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl"
> | cannot parse=20
> http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
> | make[2]: *** [modprobe.d.5] Error 4
> | make[1]: *** [all-recursive] Error 1
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
>=20
> Can you confirm this issue?

I can from meta-oe version of kmod

http://git.openembedded.org/meta-openembedded/commit/?id=3Df75e91c48cfc58f9=
1dc8f70f80a154d97d2d6c60

Not sure why khem haven't used this commit/patch.

Cheers,

>=20
> Sau!
>=20
> > diff --git a/meta/recipes-kernel/kmod/kmod-native_git.bb b/meta/recipes=
-kernel/kmod/kmod-native_git.bb
> > new file mode 100644
> > index 0000000..96de8b8
> > --- /dev/null
> > +++ b/meta/recipes-kernel/kmod/kmod-native_git.bb
> > @@ -0,0 +1,14 @@
> > +# Copyright (C) 2012 Khem Raj<raj.khem@gmail.com>
> > +# Released under the MIT license (see COPYING.MIT for the terms)
> > +
> > +require kmod.inc
> > +inherit native
> > +
> > +PR =3D "${INC_PR}.0"
> > +
> > +do_install_append (){
> > +	for tool in depmod insmod lsmod modinfo modprobe rmmod
> > +	do
> > +		ln -s kmod ${D}${bindir}/$tool
> > +	done
> > +}
> > diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/km=
od/kmod.inc
> > new file mode 100644
> > index 0000000..940a317
> > --- /dev/null
> > +++ b/meta/recipes-kernel/kmod/kmod.inc
> > @@ -0,0 +1,31 @@
> > +# Copyright (C) 2012 Khem Raj<raj.khem@gmail.com>
> > +# Released under the MIT license (see COPYING.MIT for the terms)
> > +
> > +DESCRIPTION =3D "kmod is a set of tools to handle common tasks with Li=
nux kernel modules like \
> > +               insert, remove, list, check properties, resolve depende=
ncies and aliases."
> > +HOMEPAGE =3D "http://packages.profusion.mobi/kmod/"
> > +LICENSE =3D "GPL-2.0+&  LGPL-2.1+"
> > +LICENSE_libkmod =3D "LGPL-2.1+"
> > +SECTION =3D "base"
> > +PV =3D "7+git${SRCREV}"
> > +INC_PR =3D "r0"
> > +DEPENDS +=3D "gnome-doc-utils-native"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa8=
82bbe \
> > +                    file://libkmod/COPYING;md5=3Da6f89e2100d9b6cdffcea=
4f398e37343 \
> > +                   "
> > +inherit autotools
> > +
> > +SRC_URI =3D "git://git.profusion.mobi/kmod.git;protocol=3Dgit;branch=
=3Dmaster \
> > +           file://depmod-search.conf \
> > +          "
> > +
> > +SRCREV =3D "02629fa02e96763db7460a930239cc93649a52f8"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +EXTRA_AUTORECONF +=3D "--install --symlink"
> > +EXTRA_OECONF +=3D"--enable-debug --enable-logging --enable-tools"
> > +
> > +do_configure_prepend () {
> > +        gtkdocize --docdir ${S}/libkmod/docs || touch ${S}/libkmod/doc=
s/gtk-doc.make
> > +}
> > diff --git a/meta/recipes-kernel/kmod/kmod/depmod-search.conf b/meta/re=
cipes-kernel/kmod/kmod/depmod-search.conf
> > new file mode 100644
> > index 0000000..527c0bb
> > --- /dev/null
> > +++ b/meta/recipes-kernel/kmod/kmod/depmod-search.conf
> > @@ -0,0 +1,6 @@
> > +#
> > +# /etc/depmod.d/depmod.conf
> > +#
> > +
> > +search updates extramodules built-in
> > +
> > diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel=
/kmod/kmod_git.bb
> > new file mode 100644
> > index 0000000..928fa88
> > --- /dev/null
> > +++ b/meta/recipes-kernel/kmod/kmod_git.bb
> > @@ -0,0 +1,62 @@
> > +# Copyright (C) 2012 Khem Raj<raj.khem@gmail.com>
> > +# Released under the MIT license (see COPYING.MIT for the terms)
> > +
> > +require kmod.inc
> > +
> > +PR =3D "${INC_PR}.0"
> > +
> > +PROVIDES_${PN} +=3D "module-init-tools-insmod-static module-init-tools=
-depmod module-init-tools"
> > +RPROVIDES_${PN} +=3D "module-init-tools-insmod-static module-init-tool=
s-depmod module-init-tools"
> > +CONFLICTS_${PN} +=3D "module-init-tools-insmod-static module-init-tool=
s-depmod module-init-tools"
> > +
> > +# autotools set prefix to /usr, however we want them in /bin and /sbin
> > +bindir =3D "${base_bindir}"
> > +sbindir =3D "${base_sbindir}"
> > +# libdir =3D "${base_libdir}"
> > +
> > +SRC_URI +=3D " \
> > +            file://depmod-search.conf \
> > +           "
> > +
> > +do_install_append () {
> > +        install -dm755 ${D}${base_bindir}
> > +        install -dm755 ${D}${base_sbindir}
> > +        # add symlinks to kmod
> > +        ln -s ..${base_bindir}/kmod ${D}${base_bindir}/lsmod.kmod
> > +        for tool in {ins,rm,dep}mod mod{info,probe}; do
> > +                ln -s ..${base_bindir}/kmod ${D}${base_sbindir}/${tool=
}.kmod
> > +        done
> > +        # configuration directories
> > +        install -dm755 ${D}${base_libdir}/depmod.d
> > +        install -dm755 ${D}${base_libdir}/modprobe.d
> > +        install -dm755 ${D}${sysconfdir}/depmod.d
> > +        install -dm755 ${D}${sysconfdir}/modprobe.d
> > +
> > +        # install depmod.d file for search/ dir
> > +        install -Dm644 "${WORKDIR}/depmod-search.conf" "${D}${base_lib=
dir}/depmod.d/search.conf"
> > +}
> > +
> > +pkg_postinst_kmod() {
> > +        for f in sbin/insmod sbin/modprobe sbin/rmmod sbin/modinfo; do
> > +                bn=3D`basename $f`
> > +                update-alternatives --install /$f $bn /$f.kmod 60
> > +        done
> > +        update-alternatives --install /bin/lsmod bin-lsmod /bin/lsmod.=
kmod 60
> > +        update-alternatives --install /sbin/lsmod lsmod /bin/lsmod.kmo=
d 60
> > +        update-alternatives --install /sbin/depmod depmod /sbin/depmod=
=2Ekmod 60
> > +}
> > +
> > +pkg_prerm_kmod() {
> > +        for f in sbin/insmod sbin/modprobe sbin/rmmod sbin/modinfo; do
> > +                bn=3D`basename $f`
> > +                update-alternatives --remove $bn /$f.kmod
> > +        done
> > +        update-alternatives --remove bin-lsmod /bin/lsmod.kmod
> > +        update-alternatives --remove lsmod /bin/lsmod.kmod
> > +        update-alternatives --remove depmod /sbin/depmod.kmod
> > +}
> > +
> > +PACKAGES =3D+ "libkmod"
> > +
> > +FILES_libkmod =3D "${base_libdir}/libkmod*${SOLIBS}"
> > +FILES_${PN} +=3D "${base_libdir}/depmod.d ${base_libdir}/modprobe.d"
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEUEARECAAYFAk+jagoACgkQN1Ujt2V2gByI8wCgtHgyfM1b+L32OPfxbW/TMjrv
vjYAmPitHyRDIch/hAjWO2SBwbUhPNo=
=BJ2I
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--
