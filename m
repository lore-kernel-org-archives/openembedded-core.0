Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S8a5V-0000iw-52
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 17:33:09 +0100
Received: by wera1 with SMTP id a1so4125888wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 09:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Cq1LewY5YNpPrjMGxi1pX4AM6E3J9uqqUrlBpYJLJWE=;
	b=ds80qHxHh3577Z3SiTr/hvWJ1CeaSO8spl5Vw8X/3wJuPsXr01An8IZanLUWgMGsf5
	4npgZ3cMYyWhKTBEGvmG6he2TG3mIC/hyLfrwJI8GYsZZsUgjJ/DhHm1FSc/IMh083ok
	vCFIOGT1W71HBCPprPOi/OR1Ud1VOZpxACtgz7lD2DzxMGgTLjk77he+MOX7o94bs0OF
	8Jt9+ymT6PTtBY+a2SWumkcbEyfnFCcln4FCa5YwYzRzrKxLWXTNpKgr3f/EPx0Tefxe
	zup61c8fHhesdQKOTgTJVo5TE+MM3/VGu3rY59CReHsU+pP83NUZq/nq5N36flbJHtCI
	jsQw==
Received: by 10.180.103.35 with SMTP id ft3mr7973890wib.0.1331915061301;
	Fri, 16 Mar 2012 09:24:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bg3sm14846914wib.10.2012.03.16.09.24.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Mar 2012 09:24:16 -0700 (PDT)
Date: Fri, 16 Mar 2012 17:24:14 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120316162414.GD3855@jama.jama.net>
References: <20120214230044.GB3914@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120214230044.GB3914@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: DEPENDS not extended to -native for BBCLASSEXTENDS when added by PACKAGECONFIG
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
X-List-Received-Date: Fri, 16 Mar 2012 16:33:09 -0000
X-Groupsio-MsgNum: 19063
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fOHHtNG4YXGJ0yqR"
Content-Disposition: inline

--fOHHtNG4YXGJ0yqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 15, 2012 at 12:00:44AM +0100, Martin Jansa wrote:
> oe-core gtk+ has:
>=20
> X11DEPENDS =3D "virtual/libx11 libxext libxcursor libxrandr libxdamage li=
bxrender libxcomposite"
> DEPENDS =3D "glib-2.0 pango atk jpeg libpng gtk-doc-native gdk-pixbuf-nat=
ive docbook-utils-native \
>  libgcrypt cairo gdk-pixbuf"
> PACKAGECONFIG[x11] =3D "--with-x=3Dyes --with-gdktarget=3Dx11,--with-x=3D=
no,${X11DEPENDS}"
>=20
> meta-oe adds BBCLASSEXTEND =3D "native"
> because gtk+-native-2* is needed for gtk+3 to build:
> http://git.openembedded.org/meta-openembedded/commit/?id=3Da4155ac38dce21=
4cbb59f6243b29ca3df76e0d29
>=20
> I would expect that all dependencies added by x11 PACKAGECONFIG will be e=
xpanded=20
> to -native variants like for every other dependency, but it's not true:
>=20
> gtk-native.env:X11DEPENDS=3D"virtual/libx11 libxext libxcursor libxrandr =
libxdamage libxrender libxcomposite"
> gtk-native.env:# DEPENDS=3Dpkgconfig-native ${@autotools_dep_prepend(d)}$=
{BASEDEPENDS} glib-2.0-native pango-native atk-native jpeg-native libpng-na=
tive gtk-doc-native gdk-pixbuf-native docbook-utils-native libgcrypt-native=
 cairo-native gdk-pixbuf-native ${X11DEPENDS}
> gtk-gative.env:DEPENDS=3D"pkgconfig-native autoconf-native automake-nativ=
e libtool-native gnu-config-native  glib-2.0-native pango-native atk-native=
 jpeg-native libpng-native gtk-doc-native gdk-pixbuf-native docbook-utils-n=
ative libgcrypt-native cairo-native gdk-pixbuf-native virtual/libx11 libxex=
t libxcursor libxrandr libxdamage libxrender libxcomposite"
>=20
> gtk-target.env:X11DEPENDS=3D"virtual/libx11 libxext libxcursor libxrandr =
libxdamage libxrender libxcomposite"
> gtk-target.env:# DEPENDS=3Dpkgconfig-native ${@autotools_dep_prepend(d)}$=
{BASEDEPENDS} glib-2.0 pango atk jpeg libpng gtk-doc-native gdk-pixbuf-nati=
ve docbook-utils-native  libgcrypt cairo gdk-pixbuf ${X11DEPENDS}
> gtk-target.env:DEPENDS=3D"pkgconfig-native autoconf-native automake-nativ=
e libtool-native libtool-cross gnu-config-native  virtual/arm-oe-linux-gnue=
abi-gcc virtual/arm-oe-linux-gnueabi-compilerlibs virtual/libc  glib-2.0 pa=
ngo atk jpeg libpng gtk-doc-native gdk-pixbuf-native docbook-utils-native  =
libgcrypt cairo gdk-pixbuf virtual/libx11 libxext libxcursor libxrandr libx=
damage libxrender libxcomposite"
>=20
> And gtk+-native builds fails to configure because of missing libxrender-n=
ative (libx11-native is built by something else probably).

Following patch fixes this case for me

OE om-gta02@shr ~/shr-core $ grep ^DEPENDS=3D gtk+-native.env3
DEPENDS=3D"pkgconfig-native autoconf-native automake-native libtool-native
gnu-config-native  glib-2.0-native pango-native atk-native jpeg-native
libpng-native gtk-doc-native gdk-pixbuf-native docbook-utils-native
libgcrypt-native cairo-native gdk-pixbuf-native virtual/libx11-native
libxrender-native virtual/libx11-native libxext-native libxcursor-native
libxrandr-native libxdamage-native libxrender-native
libxcomposite-native"
OE om-gta02@shr ~/shr-core $ grep ^DEPENDS=3D gtk+.env3
DEPENDS=3D"pkgconfig-native autoconf-native automake-native libtool-native
libtool-cross gnu-config-native  virtual/arm-oe-linux-gnueabi-gcc
virtual/arm-oe-linux-gnueabi-compilerlibs virtual/libc  glib-2.0 pango
atk jpeg libpng gtk-doc-native gdk-pixbuf-native docbook-utils-native
libgcrypt cairo gdk-pixbuf virtual/libx11-native libxrender-native
virtual/libx11 libxext libxcursor libxrandr libxdamage libxrender
libxcomposite"

But it's harder to do e.g.

DEPENDS_virtclass-native =3D "some smaller set of only really needed foo an=
d bar"

so even with only libx11-native and libxrender really mandatory depends=20
(configure failing without them), I had to add few more BBCLASSEXTENDs:
#       new file:   meta-oe/recipes-graphics/xorg-lib/libxcomposite_0.4.3.b=
bappend
#       new file:   meta-oe/recipes-graphics/xorg-lib/libxcursor_1.1.12.bba=
ppend
#       new file:   meta-oe/recipes-graphics/xorg-lib/libxdamage_1.1.3.bbap=
pend
#       new file:   meta-oe/recipes-graphics/xorg-lib/libxfixes_5.0.bbappend
#       new file:   meta-oe/recipes-graphics/xorg-lib/libxrandr_1.3.2.bbapp=
end
#       new file:   meta-oe/recipes-graphics/xorg-proto/compositeproto_0.4.=
2.bbappend
#       new file:   meta-oe/recipes-graphics/xorg-proto/damageproto_1.2.1.b=
bappend
#       new file:   meta-oe/recipes-graphics/xorg-proto/fixesproto_5.0.bbap=
pend
#       new file:   meta-oe/recipes-graphics/xorg-proto/randrproto_1.3.2.bb=
append

I'll probably send adding those BBCLASSEXTENDs to oe-core directly instead =
of meta-oe
because with more .bbappends in meta-oe it will be harder to upgrade oe-cor=
e versions.

Cheers,

>=20
> configure:23318: checking for XOpenDisplay
> configure:23318: gcc -o conftest -DGDK_PIXBUF_DISABLE_DEPRECATED -isystem=
/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/include -O2 -pipe -Wall -isystem/var/lib/jenkins/jobs/shr-core/=
workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include -DG_DISABLE=
_SINGLE_INCLUDES -DATK_DISABLE_SINGLE_INCLUDES -DGDK_PIXBUF_DISABLE_SINGLE_=
INCLUDES -DGTK_DISABLE_SINGLE_INCLUDES  -L/var/lib/jenkins/jobs/shr-core/wo=
rkspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib -L/var/lib/jenkin=
s/jobs/shr-core/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/lib -Wl=
,-rpath-link,/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/s=
ysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/var/lib/jenkins/jobs/shr-core=
/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/lib -Wl,-rpath,/var/li=
b/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux=
/usr/lib -Wl,-rpath,/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-e=
glibc/sysroots/x86_64-linux/lib -Wl,-O1 conftest.c  -lXext -lXrender -lX11 =
   >&5
> /usr/bin/ld: cannot find -lXrender
> collect2: ld returned 1 exit status
> configure:23318: $? =3D 1
> configure: failed program was:
> ...
> configure:23318: result: no
> configure:23322: error: *** libX11 not found. Check 'config.log' for more=
 details.
>=20
> Regards,
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fOHHtNG4YXGJ0yqR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9jaS4ACgkQN1Ujt2V2gBxEkgCdE12RIAk6/DTl1R2t9OlqPAxS
1rcAmgPk1Z6pSxXwgWvI1FTut0rpmLtQ
=w5JL
-----END PGP SIGNATURE-----

--fOHHtNG4YXGJ0yqR--
