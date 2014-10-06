Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 010AD65E0C;
	Mon,  6 Oct 2014 15:22:30 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id n3so4980164wiv.9
	for <multiple recipients>; Mon, 06 Oct 2014 08:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TIZ2Pz9okGSl8PnSS5xMytA9OmALsseWA8DvRAyszME=;
	b=XtsUu1tTPKwxGRYefCsqRARL/zSHT0AQEiEkvfwysbFQjvxc2Y/Hh74eGlIbZGyi7s
	Xj1vYlRXWi42uZieAAtZghw6lp1RcQRN+YYxzzNylm3TnbfRP6snPMS1TzXFERdGdzj1
	QXSVVut2t+p4AoYK+FcAsP1onzAWZ/+EzHy1DxkUTtVTjRtDO+/YST/h2/9RZ0bNgMx0
	j+B/XS72NkGbrdSYLXHz4jg1W8b/K4NmVGKcog3A3pJePdLU8zsD117fPDdh63AKVSBw
	lVz6SCrez//NxhIec8WPFquoBIsQjZKujr8jBxtTszKGqEgUJ6QTCmXm+Q+7PiCFSoQt
	JV6Q==
X-Received: by 10.180.38.15 with SMTP id c15mr2106867wik.65.1412608951147;
	Mon, 06 Oct 2014 08:22:31 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ey6sm11636547wib.16.2014.10.06.08.22.30 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Oct 2014 08:22:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 6 Oct 2014 17:23:31 +0200
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20141006152331.GV25706@jama>
References: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
	<1412151555-19865-5-git-send-email-schnitzeltony@googlemail.com>
	<20141003200426.GM25706@jama> <20141003201007.GN25706@jama>
	<CALbNGRTP7S6MAxFU-yo2xXWTMbo3h-A8uS94ALLxgOOiONL6nQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRTP7S6MAxFU-yo2xXWTMbo3h-A8uS94ALLxgOOiONL6nQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [PATCH][meta-oe 04/15] network-manager-applet: update to 0.9.8.10
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
X-List-Received-Date: Mon, 06 Oct 2014 15:22:34 -0000
X-Groupsio-MsgNum: 58383
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/neOAU127r7zg3jS"
Content-Disposition: inline

--/neOAU127r7zg3jS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 06, 2014 at 10:32:49AM +0200, Andreas M=FCller wrote:
> On Fri, Oct 3, 2014 at 10:10 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>=20
> > On Fri, Oct 03, 2014 at 10:04:26PM +0200, Martin Jansa wrote:
> > > On Wed, Oct 01, 2014 at 10:19:04AM +0200, Andreas M=FCller wrote:
> > > > * add libsecret to DEPENDS
> > > > * remove libglade from DEPENDS
> > > > * wireless (nm-signal-*.png) icons were updated upstream
> > > > * inherit gnomebase instead of gnome
> > > > * make bluetooth PACKAGECONFIG - disabled by default
> > >
> > > For some reason it has now the same problem as navit (through gypsy.l=
a)
> > >
> > > | x86_64-oe-linux-libtool: compile:  x86_64-oe-linux-gcc -m64
> > -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse
> > --sysroot=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-=
64
> > -DHAVE_CONFIG_H -I.
> > -I/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/netw=
ork-manager-applet/0.9.8.10-r0/network-manager-applet-0.9.8.10/src/utils
> > -I../.. -pthread
> > -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inc=
lude/gtk-2.0
> > -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/lib=
/gtk-2.0/include
> > -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inc=
lude/pango-1.0
> > -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inc=
lude/atk-1.0
> > -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inc=
lude/cairo
> > -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inc=
lude/pixman-1
> > -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inc=
lude/libpng16
> > -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inc=
lude/gdk-pixbuf-2.0
> > -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inc=
lude/libpng16
> > -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inc=
lude/pango-1.0
> > -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inc=
lude/harfbuzz
> > -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inc=
lude/pango-1.0
> > -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inc=
lude/glib-2.0
> > -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/lib=
/glib-2.0/include
> > -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/home/je=
nkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/include/freetype2
> > -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inc=
lude/freetype2
> > -pthread
> > -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inc=
lude/libnm-glib
> > -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inc=
lude/NetworkManager
> > -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64
> > > | ../../x86_64-oe-linux-libtool  --tag=3DCC   --mode=3Dlink
> > x86_64-oe-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse
> > --sysroot=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-=
64
> > -Wall -std=3Dgnu89  -O2 -pipe -g -feliminate-unused-debug-types -Wshadow
> > -Wmissing-declarations -Wmissing-prototypes -Wdeclaration-after-stateme=
nt
> > -Wstrict-prototypes -Wfloat-equal -Wno-unused-parameter -Wno-sign-compa=
re
> > -fno-strict-aliasing -Wno-unused-but-set-variable   -Wl,-O1
> > -Wl,--hash-style=3Dgnu -Wl,--as-needed -o libutils.la  libutils_la-util=
s.lo
> > -lgtk-x11-2.0 -lgdk-x11-2.0 -lpangocairo-1.0 -latk-1.0 -lcairo
> > -lgdk_pixbuf-2.0 -lgio-2.0 -lpangoft2-1.0 -lpango-1.0 -lgobject-2.0
> > -lglib-2.0 -lfontconfig -lfreetype  -lgio-2.0 -lnm-glib -lnm-util
> > -lnm-glib-vpn -ldbus-glib-1 -ldbus-1 -lgobject-2.0 -Wl,--export-dynamic
> > -lgmodule-2.0 -pthread -lglib-2.0
> > > | /bin/grep:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/lib/
> > libgudev-1.0.la: No such file or directory
> > > | sed: can't read
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/lib/
> > libgudev-1.0.la: No such file or directory
> > > | x86_64-oe-linux-libtool: link:
> > `/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/lib/
> > libgudev-1.0.la' is not a valid libtool archive
> > > | make[5]: *** [libutils.la] Error 1
> > > | make[5]: Leaving directory
> > `/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/netwo=
rk-manager-applet/0.9.8.10-r0/build/src/utils'
> > > | make[4]: *** [all-recursive] Error 1
> > > | make[4]: Leaving directory
> > `/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/netwo=
rk-manager-applet/0.9.8.10-r0/build/src/utils'
> >
> > the libgudev-1.0.la was moved from /usr/lib to /lib in systemd 215-216
> > updated
> >
> > --- a/packages/arm920tt-oe-linux-gnueabi/systemd/systemd-dbg/latest
> > +++ b/packages/arm920tt-oe-linux-gnueabi/systemd/systemd-dbg/latest
> > @@ -1,11 +1,11 @@
> >  PE =3D 1
> > -PV =3D 215+gitAUTOINC+252ff40a38
> > +PV =3D 216+gitAUTOINC+5d0ae62c66
> >  PR =3D r0
> > -PKGV =3D 215+git0+252ff40a38
> > -PKGR =3D r0.1
> > +PKGV =3D 216+git0+5d0ae62c66
> > +PKGR =3D r0.0
> >  RPROVIDES =3D
> >  RDEPENDS =3D
> > -RRECOMMENDS =3D eglibc-dbg glib-2.0-dbg libacl-dbg libcap-dbg libffi-d=
bg
> > libgcc-dbg libkmod-dbg liblzma-dbg libpam-dbg libudev-dbg
> > util-linux-libblkid-dbg zlib-dbg
> > -PKGSIZE =3D 49629406
> > +RRECOMMENDS =3D glib-2.0-dbg glibc-dbg libacl-dbg libcap-dbg libffi-dbg
> > libgcc-dbg libkmod-dbg liblzma-dbg libpam-dbg libudev-dbg
> > util-linux-libblkid-dbg zlib-dbg
> > +PKGSIZE =3D 50305088
> >  FILES =3D /usr/bin/.debug /usr/sbin/.debug /usr/lib/systemd/.debug
> > /usr/lib/.debug /bin/.debug /sbin/.debug /lib/.debug
> > /usr/lib/systemd/.debug /usr/lib/matchbox-panel/.debug
> > /usr/lib/systemd/systemd/.debug /usr/src/debug
> > /usr/lib/systemd/ptest/.debug /lib/.debug /lib/systemd/.debug
> > /lib/systemd/*/.debug /lib/security/.debug/
> > -RDEPENDS =3D libgudev-1.0 libsystemd libudev systemd (=3D
> > 1:215+git0+252ff40a38-r0.1)
> > -RRECOMMENDS =3D acl-dev base-files-dev base-passwd-dev dbus-dev eglibc=
-dev
> > glib-2.0-dev kmod-dev libacl-dev libcap-dev libcgroup-dev libffi-dev
> > libgcc-dev libgcrypt-dev libgudev-1.0-dev libkmod-dev liblzma-dev
> > libpam-dev libsystemd-dev libudev-dev readline-dev shadow-dev
> > shadow-sysroot-dev systemd-binfmt-dev udev-dev update-alternatives-opkg=
-dev
> > util-linux-dev util-linux-libblkid-dev util-linux-mount-dev
> > volatile-binds-dev xz-dev zlib-dev
> > -PKGSIZE =3D 78365
> > +RDEPENDS =3D libgudev-1.0 libsystemd libudev systemd (=3D
> > 1:216+git0+5d0ae62c66-r0.0)
> > +RRECOMMENDS =3D acl-dev base-files-dev base-passwd-dev dbus-dev
> > glib-2.0-dev glibc-dev kmod-dev libacl-dev libcap-dev libcgroup-dev
> > libffi-dev libgcc-dev libgcrypt-dev libgudev-1.0-dev libkmod-dev
> > liblzma-dev libpam-dev libsystemd-dev libudev-dev readline-dev shadow-d=
ev
> > shadow-sysroot-dev systemd-binfmt-dev udev-dev update-alternatives-opkg=
-dev
> > util-linux-dev util-linux-libblkid-dev util-linux-mount-dev
> > volatile-binds-dev xz-dev zlib-dev
> > +PKGSIZE =3D 79477
> >  FILES =3D /usr/include /lib/lib*.so /usr/lib/lib*.so /usr/lib/*.la
> > /usr/lib/*.o /usr/lib/pkgconfig /usr/share/pkgconfig /usr/share/aclocal
> > /lib/*.o /usr/lib/systemd/*.la /lib/*.la /lib/security/*.la
> > /usr/share/dbus-1/interfaces/ /etc/rpm/macros.systemd
> > -FILELIST =3D /lib/security/pam_systemd.la
> > /usr/include/gudev-1.0/gudev/gudev.h
> > /usr/include/gudev-1.0/gudev/gudevclient.h
> > /usr/include/gudev-1.0/gudev/gudevdevice.h
> > /usr/include/gudev-1.0/gudev/gudevenumerator.h
> > /usr/include/gudev-1.0/gudev/gudevenums.h
> > /usr/include/gudev-1.0/gudev/gudevenumtypes.h
> > /usr/include/gudev-1.0/gudev/gudevtypes.h /usr/include/libudev.h
> > /usr/include/systemd/_sd-common.h /usr/include/systemd/sd-daemon.h
> > /usr/include/systemd/sd-id128.h /usr/include/systemd/sd-journal.h
> > /usr/include/systemd/sd-login.h /usr/include/systemd/sd-messages.h /usr=
/lib/
> > libgudev-1.0.la /usr/lib/libgudev-1.0.so /usr/lib/libnss_myhostname.la
> > /usr/lib/libsystemd.la /usr/lib/libsystemd.so /usr/lib/libudev.la
> > /usr/lib/libudev.so /usr/lib/pkgconfig/gudev-1.0.pc
> > /usr/lib/pkgconfig/libsystemd.pc /usr/lib/pkgconfig/libudev.pc
> > /usr/share/pkgconfig/systemd.pc /usr/share/pkgconfig/udev.pc
> > +FILELIST =3D /lib/libgudev-1.0.la /lib/libgudev-1.0.so /lib/security/
> > pam_systemd.la /usr/include/gudev-1.0/gudev/gudev.h
> > /usr/include/gudev-1.0/gudev/gudevclient.h
> > /usr/include/gudev-1.0/gudev/gudevdevice.h
> > /usr/include/gudev-1.0/gudev/gudevenumerator.h
> > /usr/include/gudev-1.0/gudev/gudevenums.h
> > /usr/include/gudev-1.0/gudev/gudevenumtypes.h
> > /usr/include/gudev-1.0/gudev/gudevtypes.h /usr/include/libudev.h
> > /usr/include/systemd/_sd-common.h /usr/include/systemd/sd-daemon.h
> > /usr/include/systemd/sd-id128.h /usr/include/systemd/sd-journal.h
> > /usr/include/systemd/sd-login.h /usr/include/systemd/sd-messages.h /usr=
/lib/
> > libnss_myhostname.la /usr/lib/libnss_mymachines.la /usr/lib/libsystemd.=
la
> > /usr/lib/libsystemd.so /usr/lib/libudev.la /usr/lib/libudev.so
> > /usr/lib/pkgconfig/gudev-1.0.pc /usr/lib/pkgconfig/libsystemd.pc
> > /usr/lib/pkgconfig/libudev.pc /usr/share/pkgconfig/systemd.pc
> > /usr/share/pkgconfig/udev.pc
> >
> > Hmm - I made my tests with systemd 216 and had no errors. Shouldn't
> pkg-config find libgudev <http://libgudev-1.0.la>?

See http://patchwork.openembedded.org/patch/81291/ for more details.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/neOAU127r7zg3jS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQys/MACgkQN1Ujt2V2gBzSzwCeKpeUMXlEj7uOm5yYf5YWEFTr
tVQAoIzY36i5PWxaVQO618pVvaQqQ34r
=HGtL
-----END PGP SIGNATURE-----

--/neOAU127r7zg3jS--
