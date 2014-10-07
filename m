Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f178.google.com (mail-vc0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id B793F65E0C;
	Tue,  7 Oct 2014 06:41:48 +0000 (UTC)
Received: by mail-vc0-f178.google.com with SMTP id hq12so4385513vcb.9
	for <multiple recipients>; Mon, 06 Oct 2014 23:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=6OZXznXpHVZtvxrPep5OcKPdpdCvZcE+qkO9va/F/3Q=;
	b=KnFMKcxtSix37Fx71+9Gk9C/u44s/zm468Md+5TNGiGcexjQM1ijaG1ApWbOQRX7D0
	3YMs5TREKVnZLIBzpt8MDWzDcPzVp8uKMPycudizt/MtnMIROAzRs93tHJc5o7sEoaPa
	2v9O8sHFkT0v7spS3i5Es1FZU5b1bGpb5gXUWtM+kLDyLbI+sR8sSBvLAWxEvZGE7T7z
	62TrlUHL7evoRzb5E928t9pP8vMo2R95Zr+j3mSgaf7IlwXII/jopYYIbxTZAB06w/+Q
	f/507TQ8cQm8wmjKfWV7RpUSozG5Gr61P6QyvjgPH07BBfX11+CCrbiZ2S1huEAXdufh
	epLQ==
MIME-Version: 1.0
X-Received: by 10.220.92.198 with SMTP id s6mr1530419vcm.38.1412664109532;
	Mon, 06 Oct 2014 23:41:49 -0700 (PDT)
Received: by 10.52.171.233 with HTTP; Mon, 6 Oct 2014 23:41:49 -0700 (PDT)
In-Reply-To: <20141006152331.GV25706@jama>
References: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
	<1412151555-19865-5-git-send-email-schnitzeltony@googlemail.com>
	<20141003200426.GM25706@jama> <20141003201007.GN25706@jama>
	<CALbNGRTP7S6MAxFU-yo2xXWTMbo3h-A8uS94ALLxgOOiONL6nQ@mail.gmail.com>
	<20141006152331.GV25706@jama>
Date: Tue, 7 Oct 2014 08:41:49 +0200
Message-ID: <CALbNGRQ44osDGnd2q+QWsqhXS+SbLMKuBFn8q8Rir9GPn+Akdw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Tue, 07 Oct 2014 06:41:50 -0000
Content-Type: multipart/alternative; boundary=089e015384586f8dab0504cf7ed8

--089e015384586f8dab0504cf7ed8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 6, 2014 at 5:23 PM, Martin Jansa <martin.jansa@gmail.com> wrote=
:

> On Mon, Oct 06, 2014 at 10:32:49AM +0200, Andreas M=C3=BCller wrote:
> > On Fri, Oct 3, 2014 at 10:10 PM, Martin Jansa <martin.jansa@gmail.com>
> > wrote:
> >
> > > On Fri, Oct 03, 2014 at 10:04:26PM +0200, Martin Jansa wrote:
> > > > On Wed, Oct 01, 2014 at 10:19:04AM +0200, Andreas M=C3=BCller wrote=
:
> > > > > * add libsecret to DEPENDS
> > > > > * remove libglade from DEPENDS
> > > > > * wireless (nm-signal-*.png) icons were updated upstream
> > > > > * inherit gnomebase instead of gnome
> > > > > * make bluetooth PACKAGECONFIG - disabled by default
> > > >
> > > > For some reason it has now the same problem as navit (through
> gypsy.la)
> > > >
> > > > | x86_64-oe-linux-libtool: compile:  x86_64-oe-linux-gcc -m64
> > > -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse
> > > --sysroot=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux8=
6-64
> > > -DHAVE_CONFIG_H -I.
> > >
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/networ=
k-manager-applet/0.9.8.10-r0/network-manager-applet-0.9.8.10/src/utils
> > > -I../.. -pthread
> > >
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inclu=
de/gtk-2.0
> > >
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/lib/g=
tk-2.0/include
> > >
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inclu=
de/pango-1.0
> > >
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inclu=
de/atk-1.0
> > >
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inclu=
de/cairo
> > >
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inclu=
de/pixman-1
> > >
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inclu=
de/libpng16
> > >
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inclu=
de/gdk-pixbuf-2.0
> > >
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inclu=
de/libpng16
> > >
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inclu=
de/pango-1.0
> > >
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inclu=
de/harfbuzz
> > >
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inclu=
de/pango-1.0
> > >
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inclu=
de/glib-2.0
> > >
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/lib/g=
lib-2.0/include
> > >
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/home/jenk=
ins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/include/freetype2
> > >
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inclu=
de/freetype2
> > > -pthread
> > >
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inclu=
de/libnm-glib
> > >
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inclu=
de/NetworkManager
> > > -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64
> > > > | ../../x86_64-oe-linux-libtool  --tag=3DCC   --mode=3Dlink
> > > x86_64-oe-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpma=
th=3Dsse
> > > --sysroot=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux8=
6-64
> > > -Wall -std=3Dgnu89  -O2 -pipe -g -feliminate-unused-debug-types -Wsha=
dow
> > > -Wmissing-declarations -Wmissing-prototypes
> -Wdeclaration-after-statement
> > > -Wstrict-prototypes -Wfloat-equal -Wno-unused-parameter
> -Wno-sign-compare
> > > -fno-strict-aliasing -Wno-unused-but-set-variable   -Wl,-O1
> > > -Wl,--hash-style=3Dgnu -Wl,--as-needed -o libutils.la
> libutils_la-utils.lo
> > > -lgtk-x11-2.0 -lgdk-x11-2.0 -lpangocairo-1.0 -latk-1.0 -lcairo
> > > -lgdk_pixbuf-2.0 -lgio-2.0 -lpangoft2-1.0 -lpango-1.0 -lgobject-2.0
> > > -lglib-2.0 -lfontconfig -lfreetype  -lgio-2.0 -lnm-glib -lnm-util
> > > -lnm-glib-vpn -ldbus-glib-1 -ldbus-1 -lgobject-2.0 -Wl,--export-dynam=
ic
> > > -lgmodule-2.0 -pthread -lglib-2.0
> > > > | /bin/grep:
> > > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/lib=
/
> > > libgudev-1.0.la: No such file or directory
> > > > | sed: can't read
> > > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/lib=
/
> > > libgudev-1.0.la: No such file or directory
> > > > | x86_64-oe-linux-libtool: link:
> > > `/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/li=
b/
> > > libgudev-1.0.la' is not a valid libtool archive
> > > > | make[5]: *** [libutils.la] Error 1
> > > > | make[5]: Leaving directory
> > >
> `/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/network=
-manager-applet/0.9.8.10-r0/build/src/utils'
> > > > | make[4]: *** [all-recursive] Error 1
> > > > | make[4]: Leaving directory
> > >
> `/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/network=
-manager-applet/0.9.8.10-r0/build/src/utils'
> > >
> > > the libgudev-1.0.la was moved from /usr/lib to /lib in systemd 215-21=
6
> > > updated
> > >
> > > --- a/packages/arm920tt-oe-linux-gnueabi/systemd/systemd-dbg/latest
> > > +++ b/packages/arm920tt-oe-linux-gnueabi/systemd/systemd-dbg/latest
> > > @@ -1,11 +1,11 @@
> > >  PE =3D 1
> > > -PV =3D 215+gitAUTOINC+252ff40a38
> > > +PV =3D 216+gitAUTOINC+5d0ae62c66
> > >  PR =3D r0
> > > -PKGV =3D 215+git0+252ff40a38
> > > -PKGR =3D r0.1
> > > +PKGV =3D 216+git0+5d0ae62c66
> > > +PKGR =3D r0.0
> > >  RPROVIDES =3D
> > >  RDEPENDS =3D
> > > -RRECOMMENDS =3D eglibc-dbg glib-2.0-dbg libacl-dbg libcap-dbg libffi=
-dbg
> > > libgcc-dbg libkmod-dbg liblzma-dbg libpam-dbg libudev-dbg
> > > util-linux-libblkid-dbg zlib-dbg
> > > -PKGSIZE =3D 49629406
> > > +RRECOMMENDS =3D glib-2.0-dbg glibc-dbg libacl-dbg libcap-dbg libffi-=
dbg
> > > libgcc-dbg libkmod-dbg liblzma-dbg libpam-dbg libudev-dbg
> > > util-linux-libblkid-dbg zlib-dbg
> > > +PKGSIZE =3D 50305088
> > >  FILES =3D /usr/bin/.debug /usr/sbin/.debug /usr/lib/systemd/.debug
> > > /usr/lib/.debug /bin/.debug /sbin/.debug /lib/.debug
> > > /usr/lib/systemd/.debug /usr/lib/matchbox-panel/.debug
> > > /usr/lib/systemd/systemd/.debug /usr/src/debug
> > > /usr/lib/systemd/ptest/.debug /lib/.debug /lib/systemd/.debug
> > > /lib/systemd/*/.debug /lib/security/.debug/
> > > -RDEPENDS =3D libgudev-1.0 libsystemd libudev systemd (=3D
> > > 1:215+git0+252ff40a38-r0.1)
> > > -RRECOMMENDS =3D acl-dev base-files-dev base-passwd-dev dbus-dev
> eglibc-dev
> > > glib-2.0-dev kmod-dev libacl-dev libcap-dev libcgroup-dev libffi-dev
> > > libgcc-dev libgcrypt-dev libgudev-1.0-dev libkmod-dev liblzma-dev
> > > libpam-dev libsystemd-dev libudev-dev readline-dev shadow-dev
> > > shadow-sysroot-dev systemd-binfmt-dev udev-dev
> update-alternatives-opkg-dev
> > > util-linux-dev util-linux-libblkid-dev util-linux-mount-dev
> > > volatile-binds-dev xz-dev zlib-dev
> > > -PKGSIZE =3D 78365
> > > +RDEPENDS =3D libgudev-1.0 libsystemd libudev systemd (=3D
> > > 1:216+git0+5d0ae62c66-r0.0)
> > > +RRECOMMENDS =3D acl-dev base-files-dev base-passwd-dev dbus-dev
> > > glib-2.0-dev glibc-dev kmod-dev libacl-dev libcap-dev libcgroup-dev
> > > libffi-dev libgcc-dev libgcrypt-dev libgudev-1.0-dev libkmod-dev
> > > liblzma-dev libpam-dev libsystemd-dev libudev-dev readline-dev
> shadow-dev
> > > shadow-sysroot-dev systemd-binfmt-dev udev-dev
> update-alternatives-opkg-dev
> > > util-linux-dev util-linux-libblkid-dev util-linux-mount-dev
> > > volatile-binds-dev xz-dev zlib-dev
> > > +PKGSIZE =3D 79477
> > >  FILES =3D /usr/include /lib/lib*.so /usr/lib/lib*.so /usr/lib/*.la
> > > /usr/lib/*.o /usr/lib/pkgconfig /usr/share/pkgconfig /usr/share/acloc=
al
> > > /lib/*.o /usr/lib/systemd/*.la /lib/*.la /lib/security/*.la
> > > /usr/share/dbus-1/interfaces/ /etc/rpm/macros.systemd
> > > -FILELIST =3D /lib/security/pam_systemd.la
> > > /usr/include/gudev-1.0/gudev/gudev.h
> > > /usr/include/gudev-1.0/gudev/gudevclient.h
> > > /usr/include/gudev-1.0/gudev/gudevdevice.h
> > > /usr/include/gudev-1.0/gudev/gudevenumerator.h
> > > /usr/include/gudev-1.0/gudev/gudevenums.h
> > > /usr/include/gudev-1.0/gudev/gudevenumtypes.h
> > > /usr/include/gudev-1.0/gudev/gudevtypes.h /usr/include/libudev.h
> > > /usr/include/systemd/_sd-common.h /usr/include/systemd/sd-daemon.h
> > > /usr/include/systemd/sd-id128.h /usr/include/systemd/sd-journal.h
> > > /usr/include/systemd/sd-login.h /usr/include/systemd/sd-messages.h
> /usr/lib/
> > > libgudev-1.0.la /usr/lib/libgudev-1.0.so /usr/lib/libnss_myhostname.l=
a
> > > /usr/lib/libsystemd.la /usr/lib/libsystemd.so /usr/lib/libudev.la
> > > /usr/lib/libudev.so /usr/lib/pkgconfig/gudev-1.0.pc
> > > /usr/lib/pkgconfig/libsystemd.pc /usr/lib/pkgconfig/libudev.pc
> > > /usr/share/pkgconfig/systemd.pc /usr/share/pkgconfig/udev.pc
> > > +FILELIST =3D /lib/libgudev-1.0.la /lib/libgudev-1.0.so /lib/security=
/
> > > pam_systemd.la /usr/include/gudev-1.0/gudev/gudev.h
> > > /usr/include/gudev-1.0/gudev/gudevclient.h
> > > /usr/include/gudev-1.0/gudev/gudevdevice.h
> > > /usr/include/gudev-1.0/gudev/gudevenumerator.h
> > > /usr/include/gudev-1.0/gudev/gudevenums.h
> > > /usr/include/gudev-1.0/gudev/gudevenumtypes.h
> > > /usr/include/gudev-1.0/gudev/gudevtypes.h /usr/include/libudev.h
> > > /usr/include/systemd/_sd-common.h /usr/include/systemd/sd-daemon.h
> > > /usr/include/systemd/sd-id128.h /usr/include/systemd/sd-journal.h
> > > /usr/include/systemd/sd-login.h /usr/include/systemd/sd-messages.h
> /usr/lib/
> > > libnss_myhostname.la /usr/lib/libnss_mymachines.la /usr/lib/
> libsystemd.la
> > > /usr/lib/libsystemd.so /usr/lib/libudev.la /usr/lib/libudev.so
> > > /usr/lib/pkgconfig/gudev-1.0.pc /usr/lib/pkgconfig/libsystemd.pc
> > > /usr/lib/pkgconfig/libudev.pc /usr/share/pkgconfig/systemd.pc
> > > /usr/share/pkgconfig/udev.pc
> > >
> > > Hmm - I made my tests with systemd 216 and had no errors. Shouldn't
> > pkg-config find libgudev <http://libgudev-1.0.la>?
>
> See http://patchwork.openembedded.org/patch/81291/ for more details.
>
> Yes I saw that - still wondering why it works fine here without this patc=
h.

Andreas

--089e015384586f8dab0504cf7ed8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On M=
on, Oct 6, 2014 at 5:23 PM, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><=
div class=3D"h5">On Mon, Oct 06, 2014 at 10:32:49AM +0200, Andreas M=C3=BCl=
ler wrote:<br>
&gt; On Fri, Oct 3, 2014 at 10:10 PM, Martin Jansa &lt;<a href=3D"mailto:ma=
rtin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt;<br>
&gt; wrote:<br>
&gt;<br>
&gt; &gt; On Fri, Oct 03, 2014 at 10:04:26PM +0200, Martin Jansa wrote:<br>
&gt; &gt; &gt; On Wed, Oct 01, 2014 at 10:19:04AM +0200, Andreas M=C3=BClle=
r wrote:<br>
&gt; &gt; &gt; &gt; * add libsecret to DEPENDS<br>
&gt; &gt; &gt; &gt; * remove libglade from DEPENDS<br>
&gt; &gt; &gt; &gt; * wireless (nm-signal-*.png) icons were updated upstrea=
m<br>
&gt; &gt; &gt; &gt; * inherit gnomebase instead of gnome<br>
&gt; &gt; &gt; &gt; * make bluetooth PACKAGECONFIG - disabled by default<br=
>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; For some reason it has now the same problem as navit (throug=
h <a href=3D"http://gypsy.la" target=3D"_blank">gypsy.la</a>)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; | x86_64-oe-linux-libtool: compile:=C2=A0 x86_64-oe-linux-gc=
c -m64<br>
&gt; &gt; -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse<br>
&gt; &gt; --sysroot=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qe=
mux86-64<br>
&gt; &gt; -DHAVE_CONFIG_H -I.<br>
&gt; &gt; -I/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linu=
x/network-manager-applet/0.9.8.10-r0/network-manager-applet-0.9.8.10/src/ut=
ils<br>
&gt; &gt; -I../.. -pthread<br>
&gt; &gt; -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/u=
sr/include/gtk-2.0<br>
&gt; &gt; -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/u=
sr/lib/gtk-2.0/include<br>
&gt; &gt; -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/u=
sr/include/pango-1.0<br>
&gt; &gt; -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/u=
sr/include/atk-1.0<br>
&gt; &gt; -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/u=
sr/include/cairo<br>
&gt; &gt; -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/u=
sr/include/pixman-1<br>
&gt; &gt; -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/u=
sr/include/libpng16<br>
&gt; &gt; -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/u=
sr/include/gdk-pixbuf-2.0<br>
&gt; &gt; -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/u=
sr/include/libpng16<br>
&gt; &gt; -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/u=
sr/include/pango-1.0<br>
&gt; &gt; -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/u=
sr/include/harfbuzz<br>
&gt; &gt; -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/u=
sr/include/pango-1.0<br>
&gt; &gt; -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/u=
sr/include/glib-2.0<br>
&gt; &gt; -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/u=
sr/lib/glib-2.0/include<br>
&gt; &gt; -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/h=
ome/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/include/fre=
etype2<br>
&gt; &gt; -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/u=
sr/include/freetype2<br>
&gt; &gt; -pthread<br>
&gt; &gt; -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/u=
sr/include/libnm-glib<br>
&gt; &gt; -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/u=
sr/include/NetworkManager<br>
&gt; &gt; -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64<b=
r>
&gt; &gt; &gt; | ../../x86_64-oe-linux-libtool=C2=A0 --tag=3DCC=C2=A0 =C2=
=A0--mode=3Dlink<br>
&gt; &gt; x86_64-oe-linux-gcc=C2=A0 -m64 -march=3Dcore2 -mtune=3Dcore2 -mss=
e3 -mfpmath=3Dsse<br>
&gt; &gt; --sysroot=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qe=
mux86-64<br>
&gt; &gt; -Wall -std=3Dgnu89=C2=A0 -O2 -pipe -g -feliminate-unused-debug-ty=
pes -Wshadow<br>
&gt; &gt; -Wmissing-declarations -Wmissing-prototypes -Wdeclaration-after-s=
tatement<br>
&gt; &gt; -Wstrict-prototypes -Wfloat-equal -Wno-unused-parameter -Wno-sign=
-compare<br>
&gt; &gt; -fno-strict-aliasing -Wno-unused-but-set-variable=C2=A0 =C2=A0-Wl=
,-O1<br>
&gt; &gt; -Wl,--hash-style=3Dgnu -Wl,--as-needed -o <a href=3D"http://libut=
ils.la" target=3D"_blank">libutils.la</a>=C2=A0 libutils_la-utils.lo<br>
&gt; &gt; -lgtk-x11-2.0 -lgdk-x11-2.0 -lpangocairo-1.0 -latk-1.0 -lcairo<br=
>
&gt; &gt; -lgdk_pixbuf-2.0 -lgio-2.0 -lpangoft2-1.0 -lpango-1.0 -lgobject-2=
.0<br>
&gt; &gt; -lglib-2.0 -lfontconfig -lfreetype=C2=A0 -lgio-2.0 -lnm-glib -lnm=
-util<br>
&gt; &gt; -lnm-glib-vpn -ldbus-glib-1 -ldbus-1 -lgobject-2.0 -Wl,--export-d=
ynamic<br>
&gt; &gt; -lgmodule-2.0 -pthread -lglib-2.0<br>
&gt; &gt; &gt; | /bin/grep:<br>
&gt; &gt; /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr=
/lib/<br>
&gt; &gt; <a href=3D"http://libgudev-1.0.la" target=3D"_blank">libgudev-1.0=
.la</a>: No such file or directory<br>
&gt; &gt; &gt; | sed: can&#39;t read<br>
&gt; &gt; /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr=
/lib/<br>
&gt; &gt; <a href=3D"http://libgudev-1.0.la" target=3D"_blank">libgudev-1.0=
.la</a>: No such file or directory<br>
&gt; &gt; &gt; | x86_64-oe-linux-libtool: link:<br>
&gt; &gt; `/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/us=
r/lib/<br>
&gt; &gt; <a href=3D"http://libgudev-1.0.la" target=3D"_blank">libgudev-1.0=
.la</a>&#39; is not a valid libtool archive<br>
&gt; &gt; &gt; | make[5]: *** [<a href=3D"http://libutils.la" target=3D"_bl=
ank">libutils.la</a>] Error 1<br>
&gt; &gt; &gt; | make[5]: Leaving directory<br>
&gt; &gt; `/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux=
/network-manager-applet/0.9.8.10-r0/build/src/utils&#39;<br>
&gt; &gt; &gt; | make[4]: *** [all-recursive] Error 1<br>
&gt; &gt; &gt; | make[4]: Leaving directory<br>
&gt; &gt; `/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux=
/network-manager-applet/0.9.8.10-r0/build/src/utils&#39;<br>
&gt; &gt;<br>
&gt; &gt; the <a href=3D"http://libgudev-1.0.la" target=3D"_blank">libgudev=
-1.0.la</a> was moved from /usr/lib to /lib in systemd 215-216<br>
&gt; &gt; updated<br>
&gt; &gt;<br>
&gt; &gt; --- a/packages/arm920tt-oe-linux-gnueabi/systemd/systemd-dbg/late=
st<br>
&gt; &gt; +++ b/packages/arm920tt-oe-linux-gnueabi/systemd/systemd-dbg/late=
st<br>
&gt; &gt; @@ -1,11 +1,11 @@<br>
&gt; &gt;=C2=A0 PE =3D 1<br>
&gt; &gt; -PV =3D 215+gitAUTOINC+252ff40a38<br>
&gt; &gt; +PV =3D 216+gitAUTOINC+5d0ae62c66<br>
&gt; &gt;=C2=A0 PR =3D r0<br>
&gt; &gt; -PKGV =3D 215+git0+252ff40a38<br>
&gt; &gt; -PKGR =3D r0.1<br>
&gt; &gt; +PKGV =3D 216+git0+5d0ae62c66<br>
&gt; &gt; +PKGR =3D r0.0<br>
&gt; &gt;=C2=A0 RPROVIDES =3D<br>
&gt; &gt;=C2=A0 RDEPENDS =3D<br>
&gt; &gt; -RRECOMMENDS =3D eglibc-dbg glib-2.0-dbg libacl-dbg libcap-dbg li=
bffi-dbg<br>
&gt; &gt; libgcc-dbg libkmod-dbg liblzma-dbg libpam-dbg libudev-dbg<br>
&gt; &gt; util-linux-libblkid-dbg zlib-dbg<br>
&gt; &gt; -PKGSIZE =3D 49629406<br>
&gt; &gt; +RRECOMMENDS =3D glib-2.0-dbg glibc-dbg libacl-dbg libcap-dbg lib=
ffi-dbg<br>
&gt; &gt; libgcc-dbg libkmod-dbg liblzma-dbg libpam-dbg libudev-dbg<br>
&gt; &gt; util-linux-libblkid-dbg zlib-dbg<br>
&gt; &gt; +PKGSIZE =3D 50305088<br>
&gt; &gt;=C2=A0 FILES =3D /usr/bin/.debug /usr/sbin/.debug /usr/lib/systemd=
/.debug<br>
&gt; &gt; /usr/lib/.debug /bin/.debug /sbin/.debug /lib/.debug<br>
&gt; &gt; /usr/lib/systemd/.debug /usr/lib/matchbox-panel/.debug<br>
&gt; &gt; /usr/lib/systemd/systemd/.debug /usr/src/debug<br>
&gt; &gt; /usr/lib/systemd/ptest/.debug /lib/.debug /lib/systemd/.debug<br>
&gt; &gt; /lib/systemd/*/.debug /lib/security/.debug/<br>
&gt; &gt; -RDEPENDS =3D libgudev-1.0 libsystemd libudev systemd (=3D<br>
&gt; &gt; 1:215+git0+252ff40a38-r0.1)<br>
&gt; &gt; -RRECOMMENDS =3D acl-dev base-files-dev base-passwd-dev dbus-dev =
eglibc-dev<br>
&gt; &gt; glib-2.0-dev kmod-dev libacl-dev libcap-dev libcgroup-dev libffi-=
dev<br>
&gt; &gt; libgcc-dev libgcrypt-dev libgudev-1.0-dev libkmod-dev liblzma-dev=
<br>
&gt; &gt; libpam-dev libsystemd-dev libudev-dev readline-dev shadow-dev<br>
&gt; &gt; shadow-sysroot-dev systemd-binfmt-dev udev-dev update-alternative=
s-opkg-dev<br>
&gt; &gt; util-linux-dev util-linux-libblkid-dev util-linux-mount-dev<br>
&gt; &gt; volatile-binds-dev xz-dev zlib-dev<br>
&gt; &gt; -PKGSIZE =3D 78365<br>
&gt; &gt; +RDEPENDS =3D libgudev-1.0 libsystemd libudev systemd (=3D<br>
&gt; &gt; 1:216+git0+5d0ae62c66-r0.0)<br>
&gt; &gt; +RRECOMMENDS =3D acl-dev base-files-dev base-passwd-dev dbus-dev<=
br>
&gt; &gt; glib-2.0-dev glibc-dev kmod-dev libacl-dev libcap-dev libcgroup-d=
ev<br>
&gt; &gt; libffi-dev libgcc-dev libgcrypt-dev libgudev-1.0-dev libkmod-dev<=
br>
&gt; &gt; liblzma-dev libpam-dev libsystemd-dev libudev-dev readline-dev sh=
adow-dev<br>
&gt; &gt; shadow-sysroot-dev systemd-binfmt-dev udev-dev update-alternative=
s-opkg-dev<br>
&gt; &gt; util-linux-dev util-linux-libblkid-dev util-linux-mount-dev<br>
&gt; &gt; volatile-binds-dev xz-dev zlib-dev<br>
&gt; &gt; +PKGSIZE =3D 79477<br>
&gt; &gt;=C2=A0 FILES =3D /usr/include /lib/lib*.so /usr/lib/lib*.so /usr/l=
ib/*.la<br>
&gt; &gt; /usr/lib/*.o /usr/lib/pkgconfig /usr/share/pkgconfig /usr/share/a=
clocal<br>
&gt; &gt; /lib/*.o /usr/lib/systemd/*.la /lib/*.la /lib/security/*.la<br>
&gt; &gt; /usr/share/dbus-1/interfaces/ /etc/rpm/macros.systemd<br>
&gt; &gt; -FILELIST =3D /lib/security/<a href=3D"http://pam_systemd.la" tar=
get=3D"_blank">pam_systemd.la</a><br>
&gt; &gt; /usr/include/gudev-1.0/gudev/gudev.h<br>
&gt; &gt; /usr/include/gudev-1.0/gudev/gudevclient.h<br>
&gt; &gt; /usr/include/gudev-1.0/gudev/gudevdevice.h<br>
&gt; &gt; /usr/include/gudev-1.0/gudev/gudevenumerator.h<br>
&gt; &gt; /usr/include/gudev-1.0/gudev/gudevenums.h<br>
&gt; &gt; /usr/include/gudev-1.0/gudev/gudevenumtypes.h<br>
&gt; &gt; /usr/include/gudev-1.0/gudev/gudevtypes.h /usr/include/libudev.h<=
br>
&gt; &gt; /usr/include/systemd/_sd-common.h /usr/include/systemd/sd-daemon.=
h<br>
&gt; &gt; /usr/include/systemd/sd-id128.h /usr/include/systemd/sd-journal.h=
<br>
&gt; &gt; /usr/include/systemd/sd-login.h /usr/include/systemd/sd-messages.=
h /usr/lib/<br>
&gt; &gt; <a href=3D"http://libgudev-1.0.la" target=3D"_blank">libgudev-1.0=
.la</a> /usr/lib/<a href=3D"http://libgudev-1.0.so" target=3D"_blank">libgu=
dev-1.0.so</a> /usr/lib/<a href=3D"http://libnss_myhostname.la" target=3D"_=
blank">libnss_myhostname.la</a><br>
&gt; &gt; /usr/lib/<a href=3D"http://libsystemd.la" target=3D"_blank">libsy=
stemd.la</a> /usr/lib/libsystemd.so /usr/lib/<a href=3D"http://libudev.la" =
target=3D"_blank">libudev.la</a><br>
&gt; &gt; /usr/lib/libudev.so /usr/lib/pkgconfig/gudev-1.0.pc<br>
&gt; &gt; /usr/lib/pkgconfig/libsystemd.pc /usr/lib/pkgconfig/libudev.pc<br=
>
&gt; &gt; /usr/share/pkgconfig/systemd.pc /usr/share/pkgconfig/udev.pc<br>
&gt; &gt; +FILELIST =3D /lib/<a href=3D"http://libgudev-1.0.la" target=3D"_=
blank">libgudev-1.0.la</a> /lib/<a href=3D"http://libgudev-1.0.so" target=
=3D"_blank">libgudev-1.0.so</a> /lib/security/<br>
&gt; &gt; <a href=3D"http://pam_systemd.la" target=3D"_blank">pam_systemd.l=
a</a> /usr/include/gudev-1.0/gudev/gudev.h<br>
&gt; &gt; /usr/include/gudev-1.0/gudev/gudevclient.h<br>
&gt; &gt; /usr/include/gudev-1.0/gudev/gudevdevice.h<br>
&gt; &gt; /usr/include/gudev-1.0/gudev/gudevenumerator.h<br>
&gt; &gt; /usr/include/gudev-1.0/gudev/gudevenums.h<br>
&gt; &gt; /usr/include/gudev-1.0/gudev/gudevenumtypes.h<br>
&gt; &gt; /usr/include/gudev-1.0/gudev/gudevtypes.h /usr/include/libudev.h<=
br>
&gt; &gt; /usr/include/systemd/_sd-common.h /usr/include/systemd/sd-daemon.=
h<br>
&gt; &gt; /usr/include/systemd/sd-id128.h /usr/include/systemd/sd-journal.h=
<br>
&gt; &gt; /usr/include/systemd/sd-login.h /usr/include/systemd/sd-messages.=
h /usr/lib/<br>
</div></div><span class=3D"">&gt; &gt; <a href=3D"http://libnss_myhostname.=
la" target=3D"_blank">libnss_myhostname.la</a> /usr/lib/<a href=3D"http://l=
ibnss_mymachines.la" target=3D"_blank">libnss_mymachines.la</a> /usr/lib/<a=
 href=3D"http://libsystemd.la" target=3D"_blank">libsystemd.la</a><br>
&gt; &gt; /usr/lib/libsystemd.so /usr/lib/<a href=3D"http://libudev.la" tar=
get=3D"_blank">libudev.la</a> /usr/lib/libudev.so<br>
&gt; &gt; /usr/lib/pkgconfig/gudev-1.0.pc /usr/lib/pkgconfig/libsystemd.pc<=
br>
&gt; &gt; /usr/lib/pkgconfig/libudev.pc /usr/share/pkgconfig/systemd.pc<br>
&gt; &gt; /usr/share/pkgconfig/udev.pc<br>
&gt; &gt;<br>
&gt; &gt; Hmm - I made my tests with systemd 216 and had no errors. Shouldn=
&#39;t<br>
</span>&gt; pkg-config find libgudev &lt;<a href=3D"http://libgudev-1.0.la"=
 target=3D"_blank">http://libgudev-1.0.la</a>&gt;?<br>
<br>
See <a href=3D"http://patchwork.openembedded.org/patch/81291/" target=3D"_b=
lank">http://patchwork.openembedded.org/patch/81291/</a> for more details.<=
br>
<div class=3D"HOEnZb"><div class=3D"h5"><br></div></div></blockquote></div>=
Yes I saw that - still wondering why it works fine here without this patch.=
<br><br></div><div class=3D"gmail_extra">Andreas<br></div></div>

--089e015384586f8dab0504cf7ed8--
