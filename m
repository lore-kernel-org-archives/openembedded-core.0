Received: from mail-ey0-f193.google.com ([209.85.215.193])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S20W5-0000xn-Sn
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 14:21:25 +0100
Received: by eaad13 with SMTP id d13so1100414eaa.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 05:12:59 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.133.10 as permitted sender) client-ip=10.14.133.10; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.133.10 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.133.10])
	by 10.14.133.10 with SMTP id p10mr5111102eei.36.1330348379286 (num_hops
	= 1); Mon, 27 Feb 2012 05:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zPIdOuyy3xCwBTzebr8URYnyK7oNr0hR5+IadlEEEIA=;
	b=T95xHTPZ/s4fOhcLNLH7rkewYop+0vvGFdtm+acoa0Oj5WcTDcLAicqy7OMrQmaGSc
	M5SJEtH2CrKUXGgFt1Vor1Sg/jHnaLBju5sGXuqF9rjbm0OmyTVjPvdqKGvf8vX5Tnfl
	26mX1Uyp3BX7FAXxssQytuc2ikle8M8pg+170=
Received: by 10.14.133.10 with SMTP id p10mr3853600eei.36.1330348379153;
	Mon, 27 Feb 2012 05:12:59 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s48sm57943179eem.0.2012.02.27.05.12.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Feb 2012 05:12:58 -0800 (PST)
Date: Mon, 27 Feb 2012 14:12:56 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120227131256.GI3859@jama.jama.net>
References: <20120214230044.GB3914@jama.jama.net>
	<20120224123243.GJ3769@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120224123243.GJ3769@jama.jama.net>
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
X-List-Received-Date: Mon, 27 Feb 2012 13:21:26 -0000
X-Groupsio-MsgNum: 18030
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xs+9IvWevLaxKUtW"
Content-Disposition: inline

--xs+9IvWevLaxKUtW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2012 at 01:32:43PM +0100, Martin Jansa wrote:
> On Wed, Feb 15, 2012 at 12:00:44AM +0100, Martin Jansa wrote:
> > oe-core gtk+ has:
> >=20
> > X11DEPENDS =3D "virtual/libx11 libxext libxcursor libxrandr libxdamage =
libxrender libxcomposite"
> > DEPENDS =3D "glib-2.0 pango atk jpeg libpng gtk-doc-native gdk-pixbuf-n=
ative docbook-utils-native \
> >  libgcrypt cairo gdk-pixbuf"
> > PACKAGECONFIG[x11] =3D "--with-x=3Dyes --with-gdktarget=3Dx11,--with-x=
=3Dno,${X11DEPENDS}"
> >=20
> > meta-oe adds BBCLASSEXTEND =3D "native"
> > because gtk+-native-2* is needed for gtk+3 to build:
> > http://git.openembedded.org/meta-openembedded/commit/?id=3Da4155ac38dce=
214cbb59f6243b29ca3df76e0d29
> >=20
> > I would expect that all dependencies added by x11 PACKAGECONFIG will be=
 expanded=20
> > to -native variants like for every other dependency, but it's not true:
> >=20
> > gtk-native.env:X11DEPENDS=3D"virtual/libx11 libxext libxcursor libxrand=
r libxdamage libxrender libxcomposite"
> > gtk-native.env:# DEPENDS=3Dpkgconfig-native ${@autotools_dep_prepend(d)=
}${BASEDEPENDS} glib-2.0-native pango-native atk-native jpeg-native libpng-=
native gtk-doc-native gdk-pixbuf-native docbook-utils-native libgcrypt-nati=
ve cairo-native gdk-pixbuf-native ${X11DEPENDS}
> > gtk-gative.env:DEPENDS=3D"pkgconfig-native autoconf-native automake-nat=
ive libtool-native gnu-config-native  glib-2.0-native pango-native atk-nati=
ve jpeg-native libpng-native gtk-doc-native gdk-pixbuf-native docbook-utils=
-native libgcrypt-native cairo-native gdk-pixbuf-native virtual/libx11 libx=
ext libxcursor libxrandr libxdamage libxrender libxcomposite"
> >=20
> > gtk-target.env:X11DEPENDS=3D"virtual/libx11 libxext libxcursor libxrand=
r libxdamage libxrender libxcomposite"
> > gtk-target.env:# DEPENDS=3Dpkgconfig-native ${@autotools_dep_prepend(d)=
}${BASEDEPENDS} glib-2.0 pango atk jpeg libpng gtk-doc-native gdk-pixbuf-na=
tive docbook-utils-native  libgcrypt cairo gdk-pixbuf ${X11DEPENDS}
> > gtk-target.env:DEPENDS=3D"pkgconfig-native autoconf-native automake-nat=
ive libtool-native libtool-cross gnu-config-native  virtual/arm-oe-linux-gn=
ueabi-gcc virtual/arm-oe-linux-gnueabi-compilerlibs virtual/libc  glib-2.0 =
pango atk jpeg libpng gtk-doc-native gdk-pixbuf-native docbook-utils-native=
  libgcrypt cairo gdk-pixbuf virtual/libx11 libxext libxcursor libxrandr li=
bxdamage libxrender libxcomposite"
> >=20
> > And gtk+-native builds fails to configure because of missing libxrender=
-native (libx11-native is built by something else probably).
> >=20
> > configure:23318: checking for XOpenDisplay
> > configure:23318: gcc -o conftest -DGDK_PIXBUF_DISABLE_DEPRECATED -isyst=
em/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/sysroots/x86=
_64-linux/usr/include -O2 -pipe -Wall -isystem/var/lib/jenkins/jobs/shr-cor=
e/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include -DG_DISAB=
LE_SINGLE_INCLUDES -DATK_DISABLE_SINGLE_INCLUDES -DGDK_PIXBUF_DISABLE_SINGL=
E_INCLUDES -DGTK_DISABLE_SINGLE_INCLUDES  -L/var/lib/jenkins/jobs/shr-core/=
workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib -L/var/lib/jenk=
ins/jobs/shr-core/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/lib -=
Wl,-rpath-link,/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc=
/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/var/lib/jenkins/jobs/shr-co=
re/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/lib -Wl,-rpath,/var/=
lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/sysroots/x86_64-lin=
ux/usr/lib -Wl,-rpath,/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp=
-eglibc/sysroots/x86_64-linux/lib -Wl,-O1 conftest.c  -lXext -lXrender -lX1=
1    >&5
> > /usr/bin/ld: cannot find -lXrender
> > collect2: ld returned 1 exit status
> > configure:23318: $? =3D 1
> > configure: failed program was:
> > ...
> > configure:23318: result: no
> > configure:23322: error: *** libX11 not found. Check 'config.log' for mo=
re details.
> >=20
> > Regards,
>=20
> any idea about this? I'm tired of building virtual/libx11-native and
> libxrender-native manually after each gtk+-native build error :/.
>=20
> Yes I can fix it in gtk+ bbappend by repeating
> PACKAGECONFIG/DISTRO_FEATURES logic fog DEPENDS_virtclass-native, but
> this seems like bug in PACKAGECONFIG handling and could be in more
> recipes.

I've added bb.error to PACKAGECONFIG handling and virtclass-native
handler and PACKAGECONFIG is executed _always_ after virtclass-native
(or nativesdk), so all dependencies added by PACKAGECONFIG are not=20
available for virtclass-native handler to process.

With tmp-eglibc/cache removed to force reparse of all recipes I have
this order of handlers:
OE qemux86-64@ ~/oe-core $ grep "\(cairo\)\|\(gtk+\)\|\(libsdl\)\|\(pango\)=
\|\(xserver-xorg\)" log
ERROR: Executing virtclass-native handle for gtk+
ERROR: Executing PACKAGECONFIG handle for gtk+
ERROR: Executing virtclass-native handle for gtk+-native
ERROR: Executing PACKAGECONFIG handle for gtk+-native
ERROR: Executing virtclass-native handle for gtk+
ERROR: Executing PACKAGECONFIG handle for gtk+
ERROR: Executing virtclass-native handle for gtk+
ERROR: Executing PACKAGECONFIG handle for gtk+
ERROR: Executing virtclass-native handle for libsdl
ERROR: Executing PACKAGECONFIG handle for libsdl
ERROR: Executing virtclass-native handle for libsdl-nativesdk
ERROR: Executing PACKAGECONFIG handle for libsdl-nativesdk
ERROR: Executing virtclass-native handle for pango
ERROR: Executing PACKAGECONFIG handle for pango
ERROR: Executing virtclass-native handle for pango-native
ERROR: Executing PACKAGECONFIG handle for pango-native
ERROR: Executing virtclass-native handle for cairo
ERROR: Executing PACKAGECONFIG handle for cairo
ERROR: Executing virtclass-native handle for cairo-native
ERROR: Executing PACKAGECONFIG handle for cairo-native
ERROR: Executing virtclass-native handle for xserver-xorg
ERROR: Executing PACKAGECONFIG handle for xserver-xorg
ERROR: Executing virtclass-native handle for xserver-xorg-lite
ERROR: Executing PACKAGECONFIG handle for xserver-xorg-lite
ERROR: Executing virtclass-native handle for python-pycairo
ERROR: Executing PACKAGECONFIG handle for gtk+
ERROR: Executing virtclass-native handle for gtk+-native
ERROR: Executing PACKAGECONFIG handle for gtk+-native
ERROR: Executing virtclass-native handle for pango
ERROR: Executing PACKAGECONFIG handle for pango
ERROR: Executing virtclass-native handle for pango-native
ERROR: Executing PACKAGECONFIG handle for pango-native
ERROR: Executing virtclass-native handle for cairo
ERROR: Executing PACKAGECONFIG handle for cairo
ERROR: Executing virtclass-native handle for cairo-native
ERROR: Executing PACKAGECONFIG handle for cairo-native
ERROR: Executing virtclass-native handle for pango
ERROR: Executing PACKAGECONFIG handle for pango
ERROR: Executing virtclass-native handle for cairo
ERROR: Executing PACKAGECONFIG handle for cairo

Can we convert PACKAGECONFIG from anonymous python function in
base.bbclass to handler like native is and somehow define order of
handlers (like with addtask)?

Cheers,

>=20
> Cheers,
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xs+9IvWevLaxKUtW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9LgVgACgkQN1Ujt2V2gBw4tACfdZukcS2fhlFRgWdM5SqA0YkN
DXgAnApD5NZfeUVgY8yXu4mCB/n/2Vxj
=qwUZ
-----END PGP SIGNATURE-----

--xs+9IvWevLaxKUtW--
