Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1E6066B8D5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 08:28:47 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d51so2734606eek.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 01:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VzhRDPL2TFaWMkKBKCtXCks1uOPqq1aBN4IY1rcT6fw=;
	b=ZkS6t3a0ITGc1uRO/1AWkEc8iSlN+3f2KAL1WynnKWWiNH+sE8++JY9koV0lTuEQ76
	nYpqafXoEClDYvPb/TAHg9LqzvBiBpCDBOYakxpDnw0Q3oZMCbljAQDxfqVlrPX2V+7y
	P/cI04HXkal2TS7yDJsXdO6r3fMPsFxlyfNvnsZnAPbqXp2gwe806bSM3TDMkTgmYg8F
	z5paAU00/q9PExsVO1vRx2abnDIjF09G5FmrjsVMOw2hB0bBmwmDSuQ0UeBNizpGBD67
	vKScGQWw85lm869USr/R+Ofxiv17aPRSlH4oPbwKpSyMDaXkj83mhx5bMoHjdg/Sebkb
	wLng==
X-Received: by 10.15.83.2 with SMTP id b2mr41860651eez.28.1377678528494;
	Wed, 28 Aug 2013 01:28:48 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	p5sm35299220eeg.5.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 28 Aug 2013 01:28:47 -0700 (PDT)
Date: Wed, 28 Aug 2013 10:29:59 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20130828082959.GH3544@jama>
References: <1365017211-17183-1-git-send-email-dv@pseudoterminal.org>
	<515D9F33.9060909@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <515D9F33.9060909@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe][PATCH] eglinfo: Add recipes for x11 and fb backends
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
X-List-Received-Date: Wed, 28 Aug 2013 08:28:49 -0000
X-Groupsio-MsgNum: 44180
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2l43pqSnz0CmKuGJ"
Content-Disposition: inline

--2l43pqSnz0CmKuGJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 04, 2013 at 08:41:39AM -0700, Saul Wold wrote:
>=20
> I am going to defer this to 1.5 when it opens up, I still need to review=
=20
> the recipe, but wanted to give you a heads up about the deferral.

It looks like it was deferred too much or is it applied somewhere else?
I don't see it in oe-core.

>=20
>=20
> Thanks
> 	Sau!
>=20
>=20
> On 04/03/2013 12:26 PM, Carlos Rafael Giani wrote:
> > eglinfo is a small utility for printing out information about EGL as we=
ll
> > as about its client APIs, OpenGL / OpenGLES 1.x / OpenGLES 2.x / OpenVG.
> >
> > Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> > ---
> >   meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb  | 11 ++++++
> >   meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb |  6 +++
> >   meta/recipes-graphics/eglinfo/eglinfo.inc        | 49 +++++++++++++++=
+++++++++
> >   3 files changed, 66 insertions(+)
> >   create mode 100644 meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb
> >   create mode 100644 meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb
> >   create mode 100644 meta/recipes-graphics/eglinfo/eglinfo.inc
> >
> > diff --git a/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb b/meta/rec=
ipes-graphics/eglinfo/eglinfo-fb_1.0.bb
> > new file mode 100644
> > index 0000000..65b265f
> > --- /dev/null
> > +++ b/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb
> > @@ -0,0 +1,11 @@
> > +EGLINFO_PLATFORM ?=3D "fb"
> > +EGLINFO_BINARY_NAME ?=3D "eglinfo-fb"
> > +
> > +# .bbappend files in BSP meta layers can add EGLINFO_DEVICE
> > +# values if necessary. eglinfo.inc contains default values for
> > +# the currently supported devices.
> > +# Consult the eglinfo README.md for details
> > +
> > +include eglinfo.inc
> > +
> > +SUMMARY +=3D "(Framebuffer version)"
> > diff --git a/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb b/meta/re=
cipes-graphics/eglinfo/eglinfo-x11_1.0.bb
> > new file mode 100644
> > index 0000000..8793a25
> > --- /dev/null
> > +++ b/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb
> > @@ -0,0 +1,6 @@
> > +EGLINFO_PLATFORM ?=3D "x11"
> > +EGLINFO_BINARY_NAME ?=3D "eglinfo-x11"
> > +
> > +include eglinfo.inc
> > +
> > +SUMMARY +=3D "(X11 version)"
> > diff --git a/meta/recipes-graphics/eglinfo/eglinfo.inc b/meta/recipes-g=
raphics/eglinfo/eglinfo.inc
> > new file mode 100644
> > index 0000000..116435d
> > --- /dev/null
> > +++ b/meta/recipes-graphics/eglinfo/eglinfo.inc
> > @@ -0,0 +1,49 @@
> > +SUMMARY =3D "Utility for printing information EGL and its client APIs =
(OpenGL, OpenGL ES, OpenVG)"
> > +SECTION =3D "graphics"
> > +LICENSE =3D "Zlib"
> > +HOMEPAGE =3D "https://github.com/dv1/eglinfo"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8d4f33bc3add976f7dfae85dab6=
6f03c"
> > +
> > +DEPENDS =3D "virtual/egl"
> > +
> > +SRC_URI =3D "git://github.com/dv1/eglinfo.git;branch=3Dmaster"
> > +SRCREV =3D "4a49ff59545d9b6a8222badab64115f89d3a6774"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +
> > +# BSP layers should add .bbappend files for the -x11 and -fb .bb recip=
es,
> > +# which append the respective EGL/OpenGLES/OpenVG libraries to DEPENDS
> > +# not doing that here, since some platforms might not have OpenGL ES o=
r OpenVG support
> > +# (in that case, the eglinfo build scripts automatically disable the r=
elevant code paths)
> > +
> > +EGLINFO_DEVICE ?=3D "generic"
> > +EGLINFO_DEVICE_raspberrypi ?=3D "raspberrypi"
> > +EGLINFO_DEVICE_beagleboard ?=3D "beagleboard"
> > +EGLINFO_DEVICE_mx6 ?=3D "imx6"
> > +
> > +
> > +do_clean() {
> > +	if [ -x ${S}/waf ]; then
> > +		${S}/waf distclean
> > +	fi
> > +}
> > +
> > +do_configure() {
> > +	${S}/waf configure \
> > +		--platform=3D${EGLINFO_PLATFORM} \
> > +		--device=3D${EGLINFO_DEVICE} \
> > +		--sysroot ${STAGING_DIR_TARGET} \
> > +		--prefix=3D${prefix} \
> > +		${EXTRA_OECONF}
> > +}
> > +
> > +do_compile() {
> > +	${S}/waf
> > +}
> > +
> > +do_install() {
> > +	mkdir -p "${D}/${bindir}"
> > +	mv "${S}/build/release/eglinfo" "${D}/${bindir}/${EGLINFO_BINARY_NAME=
}"
> > +}
> > +
> >
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2l43pqSnz0CmKuGJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIdtQcACgkQN1Ujt2V2gBzoJgCfRu7QLs03GkKJeSugAtfZmAD/
NtoAoJsov2ZLBgcpad3bvGzIAW6P1FU2
=Hp78
-----END PGP SIGNATURE-----

--2l43pqSnz0CmKuGJ--
