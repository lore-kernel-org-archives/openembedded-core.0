Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TBNZs-0008Vy-Qh
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 12:20:20 +0200
Received: by eekb57 with SMTP id b57so214030eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 03:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wrHZQveA33LYKQWAMR5OCvHbvSHV7AN+IMRGeg321eU=;
	b=LBRXMPjsyHsg4r9OqmeYratHBdko6wE2CyaUxW9MQtSp/UxrkSjE+E42mbyztNuSjt
	Et66r6NTi7L0ea7x1TW/lVnGIDfcI4liHvx/MNUxvWxrMa/wb9IgaUj8fVQLwzuOMTAA
	2v63UWw4b0xAKtnX/5wPlRaX5drC9sbQ949SJUi2hy3FnqS/oG3w5y6SyrbY6ZXp7Mip
	BDQ+KjkC+FvRMZg9Ez2uJG68W9avNZQSwSsOjOeIrr0alaa8xQMw4pRu/O7U+8O/GGEm
	zrhc1W6Y11WWDpjYS+NfR7xB0m1e6yDW3GmYcTAp8kOjD6B3nwILjmqpsngwwpODJHW0
	XhRw==
Received: by 10.204.152.6 with SMTP id e6mr4406221bkw.85.1347358070002;
	Tue, 11 Sep 2012 03:07:50 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j9sm8958999bkv.0.2012.09.11.03.07.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 03:07:48 -0700 (PDT)
Date: Tue, 11 Sep 2012 12:07:45 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20120911100745.GF3465@jama.jama.net>
References: <20120911080334.GD3465@jama.jama.net>
	<1347354207.2122.29.camel@ted>
	<20120911093605.GE3465@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120911093605.GE3465@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: andrei.gherzan@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: DEPENDS_virtclass-native = "libpng jpeg" not extended to libpng-native jpeg-native
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
X-List-Received-Date: Tue, 11 Sep 2012 10:20:20 -0000
X-Groupsio-MsgNum: 29023
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fXStkuK2IQBfcDe+"
Content-Disposition: inline

--fXStkuK2IQBfcDe+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 11, 2012 at 11:36:05AM +0200, Martin Jansa wrote:
> On Tue, Sep 11, 2012 at 10:03:27AM +0100, Richard Purdie wrote:
> > On Tue, 2012-09-11 at 10:03 +0200, Martin Jansa wrote:
> > > Hi,
> > >=20
> > > in meta-openembedded/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.b=
b:
> > >=20
> > > DEPENDS_virtclass-native =3D "libpng jpeg"
> > > DEPENDS =3D "libpng jpeg expat gtk+"
> > >=20
> > > BBCLASSEXTEND =3D "native"
> > >=20
> > > Did it work (at least at some point of time) that DEPENDS for
> > > libwmf-native were expanded to libpng-native and jpeg-native?
> >=20
> > I don't think that has ever worked. Its assumed that if you're going to
> > use class overrides, you put the right thing in place.
>=20
> OK, good. That probably applies also to:
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-August/028091=
=2Ehtml
> ccing Andrei Gherzan
>=20
> > > Because now it does not:
> > > OE tuna@shr ~/shr-core $ bitbake-diffsigs
> > > stamps.1347348593/nokia900/x86_64-linux/libwmf-native-0.2.8.4-r1.do_c=
onfigure.sigdata.315a83efebb27040d6bf0aaead16671e
> > > stamps.1347348593/om-gta02/x86_64-linux/libwmf-native-0.2.8.4-r1.do_c=
onfigure.sigdata.0f8349ada0c8a18a6d6ed7b7841ec955
> > > Hash for dependent task libpng_1.2.49.bb.do_populate_sysroot changed
> > > from 640001ee0530e51ef0aefb300c34f7dd to 7ba7d74a27e1e0af253ddac00a2b=
e1c2
> > > Hash for dependent task libjpeg-turbo_svn.bb.do_populate_sysroot chan=
ged
> > > from 3fe6eae3a6fd1af40233d548680c5bab to ff852ac3d5e826ff74e68b5ddc4a=
c3e1
> > >=20
> > > So native recipe depending on target checksum -> rebuilding with each
> > > MACHINE switch.
> > >=20
> > > I can fix it by:
> > > DEPENDS_virtclass-native =3D "libpng-native jpeg-native"
> > > but maybe there is more cases like this and this could be checked by
> > > native.bbclass or something like that.
> >=20
> > That is the correct thing to do, the code assumes when you write
> > explicit class overrides, you mean what you say...
>=20
> Ok, testing patch for that. 2nd similar issue is with sip-native which
> gets target DEPENDS through inherits, weirdly if I override DEPENDS
> in recipe after inherit it still gets qt4-x11-free :/
>=20
> meta-oe/recipes-extended/sip/sip-native_4.13.3.bb:
> inherit qt4x11 native python-dir
>=20
> # inherit qt4x11 adds dependency on target qt4-x11-free, which is bad,
> # because we don't need it and it's causing different sstate checksum:
> # $ bitbake-diffsigs
> #     stamps.1347348593/nokia900/x86_64-linux/sip-native-4.13.3-r0.do_con=
figure.sigdata.6e44871660ef91eab5ee4d56e55b6728
> #     stamps.1347348593/om-gta02/x86_64-linux/sip-native-4.13.3-r0.do_con=
figure.sigdata.cdaf666b98c2c6ccfb710743dcdbd988
> #       Hash for dependent task qt4-x11-free_4.8.1.bb.do_populate_sysroot=
 changed from 79234aca07686c1d97782e21fc098071 to 7e9ba3de3ba9f709a5d9ef5ab=
adb2d9e
> DEPENDS_class-native =3D "qt4-tools-native "
>=20
> Even with different overrides it does not work, from bitbake -e:
> sip-native.env.DEPENDS:# DEPENDS=3Dqt4-tools-native ${@base_contains("PRO=
VIDES", "qt4-x11", "", "qt4-x11 ", d)}${BASEDEPENDS} qt4-tools-native=20
> sip-native.env.DEPENDS:DEPENDS=3D"qt4-tools-native qt4-x11  qt4-tools-nat=
ive"
> sip-native.env.DEPENDS_class-native:# DEPENDS_class-native=3DNone
> sip-native.env.DEPENDS_class-native:# DEPENDS=3Dqt4-tools-native ${@base_=
contains("PROVIDES", "qt4-x11", "", "qt4-x11 ", d)}${BASEDEPENDS} qt4-tools=
-native=20
> sip-native.env.DEPENDS_class-native:DEPENDS=3D"qt4-tools-native qt4-x11  =
qt4-tools-native"
> sip-native.env.DEPENDS_virtclass-native:# DEPENDS_virtclass-native=3Dqt4-=
tools-native=20
> sip-native.env.DEPENDS_virtclass-native:# DEPENDS=3Dqt4-tools-native ${@b=
ase_contains("PROVIDES", "qt4-x11", "", "qt4-x11 ", d)}${BASEDEPENDS}=20
> sip-native.env.DEPENDS_virtclass-native:DEPENDS_virtclass-native=3D"qt4-t=
ools-native"
> sip-native.env.DEPENDS_virtclass-native:DEPENDS=3D"qt4-tools-native qt4-x=
11"
> sip-native.env.old.DEPENDS:# DEPENDS=3Dqt4-tools-native ${@base_contains(=
"PROVIDES", "qt4-x11", "", "qt4-x11 ", d)}${BASEDEPENDS}=20
> sip-native.env.old.DEPENDS:DEPENDS=3D"qt4-tools-native qt4-x11"
>=20
> How to override DEPENDS_prepend from inherited bbclasses?

This works, but is it right solution?

Tested on sip-native (where I don't have qt4-x11-free now).
meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb which has redundant DEPENDS =
=3D "qt4-x11-free"
meta/recipes-qt/qt-apps/qmmp_0.6.1.bb which has redundant inherit qmake2

OE om-gta02@shr ~/shr-core $ grep ^DEPENDS qmmp.env
DEPENDS=3D"qt4-x11 autoconf-native automake-native libtool-native libtool-c=
ross gnu-config-native qt4-tools-native  virtual/arm-oe-linux-gnueabi-gcc v=
irtual/arm-oe-linux-gnueabi-compilerlibs virtual/libc  taglib libmad libvor=
bis libogg alsa-lib  cmake-native"
OE om-gta02@shr ~/shr-core $ grep ^DEPENDS qt-mobility-x11.env=20
DEPENDS=3D"qt4-tools-native qt4-x11  virtual/arm-oe-linux-gnueabi-gcc virtu=
al/arm-oe-linux-gnueabi-compilerlibs virtual/libc  qt4-x11-free pulseaudio =
bluez4"

diff --git a/meta/classes/qt4x11.bbclass b/meta/classes/qt4x11.bbclass
index 52190f4..267a1cc 100644
--- a/meta/classes/qt4x11.bbclass
+++ b/meta/classes/qt4x11.bbclass
@@ -1,4 +1,4 @@
-DEPENDS_prepend =3D "${@base_contains("PROVIDES", "qt4-x11", "", "qt4-x11 =
", d)}"
+DEPENDS_prepend_class-target =3D "${@base_contains("PROVIDES", "qt4-x11", =
"", "qt4-x11 ", d)}"
=20
 inherit qmake2
=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fXStkuK2IQBfcDe+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBPDXEACgkQN1Ujt2V2gByISACgj1grkmXvKYhjX/b6xdMglm3t
6ycAnib9nw3K0gicbEiKh55ZeyoRpAfA
=BH7P
-----END PGP SIGNATURE-----

--fXStkuK2IQBfcDe+--
