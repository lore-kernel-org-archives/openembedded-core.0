Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7DA956FC68;
	Mon,  6 Oct 2014 08:32:48 +0000 (UTC)
Received: by mail-vc0-f176.google.com with SMTP id hq11so2739265vcb.7
	for <multiple recipients>; Mon, 06 Oct 2014 01:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Tmyg7dS2Ns0GgLyCahadz0BYElcn/ZyYSTfuwDAroY4=;
	b=I1feADMdlDZGG7+xJzGE4NmsGW5rsPnrFH3eyY1mJBjhOEg0vRVcY8l/tcuFu29XP+
	yePoVqcw/neETEWPikYwMRFSqTZQnWZ0f1C8eFAbbw+GNdvegm6PFmtTxf5cpB1OGHUM
	4KKstK07N2Js7vRWH08K6wF60GKeG5RZC9ESHGNyHF5q/y1SzacguniYuu7sQHLbHOr5
	LF3Sh79ISW9x7S1FrLNiHGTxdnICi8ytpw2N1pYndCNv/pdszlIcBrozQYTRKJgtR0xQ
	V3+q4yNu3PAp2g46qSqkj6oNaa8FVJvddfRCA/MFP2eoZj+aRRvZ+2aEVhtsOpXuHQUX
	rqAw==
MIME-Version: 1.0
X-Received: by 10.220.251.200 with SMTP id mt8mr17259042vcb.24.1412584369328; 
	Mon, 06 Oct 2014 01:32:49 -0700 (PDT)
Received: by 10.52.171.233 with HTTP; Mon, 6 Oct 2014 01:32:49 -0700 (PDT)
In-Reply-To: <20141003201007.GN25706@jama>
References: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
	<1412151555-19865-5-git-send-email-schnitzeltony@googlemail.com>
	<20141003200426.GM25706@jama> <20141003201007.GN25706@jama>
Date: Mon, 6 Oct 2014 10:32:49 +0200
Message-ID: <CALbNGRTP7S6MAxFU-yo2xXWTMbo3h-A8uS94ALLxgOOiONL6nQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 06 Oct 2014 08:32:59 -0000
Content-Type: multipart/alternative; boundary=089e0122f0988c98350504bced09

--089e0122f0988c98350504bced09
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 3, 2014 at 10:10 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Fri, Oct 03, 2014 at 10:04:26PM +0200, Martin Jansa wrote:
> > On Wed, Oct 01, 2014 at 10:19:04AM +0200, Andreas M=C3=BCller wrote:
> > > * add libsecret to DEPENDS
> > > * remove libglade from DEPENDS
> > > * wireless (nm-signal-*.png) icons were updated upstream
> > > * inherit gnomebase instead of gnome
> > > * make bluetooth PACKAGECONFIG - disabled by default
> >
> > For some reason it has now the same problem as navit (through gypsy.la)
> >
> > | x86_64-oe-linux-libtool: compile:  x86_64-oe-linux-gcc -m64
> -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse
> --sysroot=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64
> -DHAVE_CONFIG_H -I.
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/networ=
k-manager-applet/0.9.8.10-r0/network-manager-applet-0.9.8.10/src/utils
> -I../.. -pthread
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inclu=
de/gtk-2.0
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/lib/g=
tk-2.0/include
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inclu=
de/pango-1.0
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inclu=
de/atk-1.0
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inclu=
de/cairo
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inclu=
de/pixman-1
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inclu=
de/libpng16
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inclu=
de/gdk-pixbuf-2.0
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inclu=
de/libpng16
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inclu=
de/pango-1.0
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inclu=
de/harfbuzz
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inclu=
de/pango-1.0
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inclu=
de/glib-2.0
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/lib/g=
lib-2.0/include
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/home/jenk=
ins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/include/freetype2
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inclu=
de/freetype2
> -pthread
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inclu=
de/libnm-glib
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inclu=
de/NetworkManager
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64
> > | ../../x86_64-oe-linux-libtool  --tag=3DCC   --mode=3Dlink
> x86_64-oe-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse
> --sysroot=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64
> -Wall -std=3Dgnu89  -O2 -pipe -g -feliminate-unused-debug-types -Wshadow
> -Wmissing-declarations -Wmissing-prototypes -Wdeclaration-after-statement
> -Wstrict-prototypes -Wfloat-equal -Wno-unused-parameter -Wno-sign-compare
> -fno-strict-aliasing -Wno-unused-but-set-variable   -Wl,-O1
> -Wl,--hash-style=3Dgnu -Wl,--as-needed -o libutils.la  libutils_la-utils.=
lo
> -lgtk-x11-2.0 -lgdk-x11-2.0 -lpangocairo-1.0 -latk-1.0 -lcairo
> -lgdk_pixbuf-2.0 -lgio-2.0 -lpangoft2-1.0 -lpango-1.0 -lgobject-2.0
> -lglib-2.0 -lfontconfig -lfreetype  -lgio-2.0 -lnm-glib -lnm-util
> -lnm-glib-vpn -ldbus-glib-1 -ldbus-1 -lgobject-2.0 -Wl,--export-dynamic
> -lgmodule-2.0 -pthread -lglib-2.0
> > | /bin/grep:
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/lib/
> libgudev-1.0.la: No such file or directory
> > | sed: can't read
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/lib/
> libgudev-1.0.la: No such file or directory
> > | x86_64-oe-linux-libtool: link:
> `/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/lib/
> libgudev-1.0.la' is not a valid libtool archive
> > | make[5]: *** [libutils.la] Error 1
> > | make[5]: Leaving directory
> `/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/network=
-manager-applet/0.9.8.10-r0/build/src/utils'
> > | make[4]: *** [all-recursive] Error 1
> > | make[4]: Leaving directory
> `/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/network=
-manager-applet/0.9.8.10-r0/build/src/utils'
>
> the libgudev-1.0.la was moved from /usr/lib to /lib in systemd 215-216
> updated
>
> --- a/packages/arm920tt-oe-linux-gnueabi/systemd/systemd-dbg/latest
> +++ b/packages/arm920tt-oe-linux-gnueabi/systemd/systemd-dbg/latest
> @@ -1,11 +1,11 @@
>  PE =3D 1
> -PV =3D 215+gitAUTOINC+252ff40a38
> +PV =3D 216+gitAUTOINC+5d0ae62c66
>  PR =3D r0
> -PKGV =3D 215+git0+252ff40a38
> -PKGR =3D r0.1
> +PKGV =3D 216+git0+5d0ae62c66
> +PKGR =3D r0.0
>  RPROVIDES =3D
>  RDEPENDS =3D
> -RRECOMMENDS =3D eglibc-dbg glib-2.0-dbg libacl-dbg libcap-dbg libffi-dbg
> libgcc-dbg libkmod-dbg liblzma-dbg libpam-dbg libudev-dbg
> util-linux-libblkid-dbg zlib-dbg
> -PKGSIZE =3D 49629406
> +RRECOMMENDS =3D glib-2.0-dbg glibc-dbg libacl-dbg libcap-dbg libffi-dbg
> libgcc-dbg libkmod-dbg liblzma-dbg libpam-dbg libudev-dbg
> util-linux-libblkid-dbg zlib-dbg
> +PKGSIZE =3D 50305088
>  FILES =3D /usr/bin/.debug /usr/sbin/.debug /usr/lib/systemd/.debug
> /usr/lib/.debug /bin/.debug /sbin/.debug /lib/.debug
> /usr/lib/systemd/.debug /usr/lib/matchbox-panel/.debug
> /usr/lib/systemd/systemd/.debug /usr/src/debug
> /usr/lib/systemd/ptest/.debug /lib/.debug /lib/systemd/.debug
> /lib/systemd/*/.debug /lib/security/.debug/
> -RDEPENDS =3D libgudev-1.0 libsystemd libudev systemd (=3D
> 1:215+git0+252ff40a38-r0.1)
> -RRECOMMENDS =3D acl-dev base-files-dev base-passwd-dev dbus-dev eglibc-d=
ev
> glib-2.0-dev kmod-dev libacl-dev libcap-dev libcgroup-dev libffi-dev
> libgcc-dev libgcrypt-dev libgudev-1.0-dev libkmod-dev liblzma-dev
> libpam-dev libsystemd-dev libudev-dev readline-dev shadow-dev
> shadow-sysroot-dev systemd-binfmt-dev udev-dev update-alternatives-opkg-d=
ev
> util-linux-dev util-linux-libblkid-dev util-linux-mount-dev
> volatile-binds-dev xz-dev zlib-dev
> -PKGSIZE =3D 78365
> +RDEPENDS =3D libgudev-1.0 libsystemd libudev systemd (=3D
> 1:216+git0+5d0ae62c66-r0.0)
> +RRECOMMENDS =3D acl-dev base-files-dev base-passwd-dev dbus-dev
> glib-2.0-dev glibc-dev kmod-dev libacl-dev libcap-dev libcgroup-dev
> libffi-dev libgcc-dev libgcrypt-dev libgudev-1.0-dev libkmod-dev
> liblzma-dev libpam-dev libsystemd-dev libudev-dev readline-dev shadow-dev
> shadow-sysroot-dev systemd-binfmt-dev udev-dev update-alternatives-opkg-d=
ev
> util-linux-dev util-linux-libblkid-dev util-linux-mount-dev
> volatile-binds-dev xz-dev zlib-dev
> +PKGSIZE =3D 79477
>  FILES =3D /usr/include /lib/lib*.so /usr/lib/lib*.so /usr/lib/*.la
> /usr/lib/*.o /usr/lib/pkgconfig /usr/share/pkgconfig /usr/share/aclocal
> /lib/*.o /usr/lib/systemd/*.la /lib/*.la /lib/security/*.la
> /usr/share/dbus-1/interfaces/ /etc/rpm/macros.systemd
> -FILELIST =3D /lib/security/pam_systemd.la
> /usr/include/gudev-1.0/gudev/gudev.h
> /usr/include/gudev-1.0/gudev/gudevclient.h
> /usr/include/gudev-1.0/gudev/gudevdevice.h
> /usr/include/gudev-1.0/gudev/gudevenumerator.h
> /usr/include/gudev-1.0/gudev/gudevenums.h
> /usr/include/gudev-1.0/gudev/gudevenumtypes.h
> /usr/include/gudev-1.0/gudev/gudevtypes.h /usr/include/libudev.h
> /usr/include/systemd/_sd-common.h /usr/include/systemd/sd-daemon.h
> /usr/include/systemd/sd-id128.h /usr/include/systemd/sd-journal.h
> /usr/include/systemd/sd-login.h /usr/include/systemd/sd-messages.h /usr/l=
ib/
> libgudev-1.0.la /usr/lib/libgudev-1.0.so /usr/lib/libnss_myhostname.la
> /usr/lib/libsystemd.la /usr/lib/libsystemd.so /usr/lib/libudev.la
> /usr/lib/libudev.so /usr/lib/pkgconfig/gudev-1.0.pc
> /usr/lib/pkgconfig/libsystemd.pc /usr/lib/pkgconfig/libudev.pc
> /usr/share/pkgconfig/systemd.pc /usr/share/pkgconfig/udev.pc
> +FILELIST =3D /lib/libgudev-1.0.la /lib/libgudev-1.0.so /lib/security/
> pam_systemd.la /usr/include/gudev-1.0/gudev/gudev.h
> /usr/include/gudev-1.0/gudev/gudevclient.h
> /usr/include/gudev-1.0/gudev/gudevdevice.h
> /usr/include/gudev-1.0/gudev/gudevenumerator.h
> /usr/include/gudev-1.0/gudev/gudevenums.h
> /usr/include/gudev-1.0/gudev/gudevenumtypes.h
> /usr/include/gudev-1.0/gudev/gudevtypes.h /usr/include/libudev.h
> /usr/include/systemd/_sd-common.h /usr/include/systemd/sd-daemon.h
> /usr/include/systemd/sd-id128.h /usr/include/systemd/sd-journal.h
> /usr/include/systemd/sd-login.h /usr/include/systemd/sd-messages.h /usr/l=
ib/
> libnss_myhostname.la /usr/lib/libnss_mymachines.la /usr/lib/libsystemd.la
> /usr/lib/libsystemd.so /usr/lib/libudev.la /usr/lib/libudev.so
> /usr/lib/pkgconfig/gudev-1.0.pc /usr/lib/pkgconfig/libsystemd.pc
> /usr/lib/pkgconfig/libudev.pc /usr/share/pkgconfig/systemd.pc
> /usr/share/pkgconfig/udev.pc
>
> Hmm - I made my tests with systemd 216 and had no errors. Shouldn't
pkg-config find libgudev <http://libgudev-1.0.la>?

Andreas

--089e0122f0988c98350504bced09
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On F=
ri, Oct 3, 2014 at 10:10 PM, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"=
mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><sp=
an class=3D"">On Fri, Oct 03, 2014 at 10:04:26PM +0200, Martin Jansa wrote:=
<br>
&gt; On Wed, Oct 01, 2014 at 10:19:04AM +0200, Andreas M=C3=BCller wrote:<b=
r>
&gt; &gt; * add libsecret to DEPENDS<br>
&gt; &gt; * remove libglade from DEPENDS<br>
&gt; &gt; * wireless (nm-signal-*.png) icons were updated upstream<br>
&gt; &gt; * inherit gnomebase instead of gnome<br>
&gt; &gt; * make bluetooth PACKAGECONFIG - disabled by default<br>
&gt;<br>
&gt; For some reason it has now the same problem as navit (through <a href=
=3D"http://gypsy.la" target=3D"_blank">gypsy.la</a>)<br>
&gt;<br>
&gt; | x86_64-oe-linux-libtool: compile:=C2=A0 x86_64-oe-linux-gcc -m64 -ma=
rch=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/jenkins/=
oe/world/shr-core/tmp-glibc/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/network-manager=
-applet/0.9.8.10-r0/network-manager-applet-0.9.8.10/src/utils -I../.. -pthr=
ead -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inc=
lude/gtk-2.0 -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-6=
4/usr/lib/gtk-2.0/include -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysro=
ots/qemux86-64/usr/include/pango-1.0 -I/home/jenkins/oe/world/shr-core/tmp-=
glibc/sysroots/qemux86-64/usr/include/atk-1.0 -I/home/jenkins/oe/world/shr-=
core/tmp-glibc/sysroots/qemux86-64/usr/include/cairo -I/home/jenkins/oe/wor=
ld/shr-core/tmp-glibc/sysroots/qemux86-64/usr/include/pixman-1 -I/home/jenk=
ins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/include/libpng16 -I=
/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/include/g=
dk-pixbuf-2.0 -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-=
64/usr/include/libpng16 -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroot=
s/qemux86-64/usr/include/pango-1.0 -I/home/jenkins/oe/world/shr-core/tmp-gl=
ibc/sysroots/qemux86-64/usr/include/harfbuzz -I/home/jenkins/oe/world/shr-c=
ore/tmp-glibc/sysroots/qemux86-64/usr/include/pango-1.0 -I/home/jenkins/oe/=
world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/include/glib-2.0 -I/home/j=
enkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/lib/glib-2.0/inc=
lude -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/home/j=
enkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/include/freetype=
2 -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/inclu=
de/freetype2 -pthread -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/=
qemux86-64/usr/include/libnm-glib -I/home/jenkins/oe/world/shr-core/tmp-gli=
bc/sysroots/qemux86-64/usr/include/NetworkManager -I/home/jenkins/oe/world/=
shr-core/tmp-glibc/sysroots/qemux86-64<br>
</span><span class=3D"">&gt; | ../../x86_64-oe-linux-libtool=C2=A0 --tag=3D=
CC=C2=A0 =C2=A0--mode=3Dlink x86_64-oe-linux-gcc=C2=A0 -m64 -march=3Dcore2 =
-mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/jenkins/oe/world/shr=
-core/tmp-glibc/sysroots/qemux86-64=C2=A0 -Wall -std=3Dgnu89=C2=A0 -O2 -pip=
e -g -feliminate-unused-debug-types -Wshadow -Wmissing-declarations -Wmissi=
ng-prototypes -Wdeclaration-after-statement -Wstrict-prototypes -Wfloat-equ=
al -Wno-unused-parameter -Wno-sign-compare -fno-strict-aliasing -Wno-unused=
-but-set-variable=C2=A0 =C2=A0-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-neede=
d -o <a href=3D"http://libutils.la" target=3D"_blank">libutils.la</a>=C2=A0=
 libutils_la-utils.lo -lgtk-x11-2.0 -lgdk-x11-2.0 -lpangocairo-1.0 -latk-1.=
0 -lcairo -lgdk_pixbuf-2.0 -lgio-2.0 -lpangoft2-1.0 -lpango-1.0 -lgobject-2=
.0 -lglib-2.0 -lfontconfig -lfreetype=C2=A0 -lgio-2.0 -lnm-glib -lnm-util -=
lnm-glib-vpn -ldbus-glib-1 -ldbus-1 -lgobject-2.0 -Wl,--export-dynamic -lgm=
odule-2.0 -pthread -lglib-2.0<br>
&gt; | /bin/grep: /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux8=
6-64/usr/lib/<a href=3D"http://libgudev-1.0.la" target=3D"_blank">libgudev-=
1.0.la</a>: No such file or directory<br>
&gt; | sed: can&#39;t read /home/jenkins/oe/world/shr-core/tmp-glibc/sysroo=
ts/qemux86-64/usr/lib/<a href=3D"http://libgudev-1.0.la" target=3D"_blank">=
libgudev-1.0.la</a>: No such file or directory<br>
&gt; | x86_64-oe-linux-libtool: link: `/home/jenkins/oe/world/shr-core/tmp-=
glibc/sysroots/qemux86-64/usr/lib/<a href=3D"http://libgudev-1.0.la" target=
=3D"_blank">libgudev-1.0.la</a>&#39; is not a valid libtool archive<br>
&gt; | make[5]: *** [<a href=3D"http://libutils.la" target=3D"_blank">libut=
ils.la</a>] Error 1<br>
&gt; | make[5]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glib=
c/work/core2-64-oe-linux/network-manager-applet/0.9.8.10-r0/build/src/utils=
&#39;<br>
&gt; | make[4]: *** [all-recursive] Error 1<br>
&gt; | make[4]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glib=
c/work/core2-64-oe-linux/network-manager-applet/0.9.8.10-r0/build/src/utils=
&#39;<br>
<br>
</span>the <a href=3D"http://libgudev-1.0.la" target=3D"_blank">libgudev-1.=
0.la</a> was moved from /usr/lib to /lib in systemd 215-216 updated<br>
<br>
--- a/packages/arm920tt-oe-linux-gnueabi/systemd/systemd-dbg/latest<br>
+++ b/packages/arm920tt-oe-linux-gnueabi/systemd/systemd-dbg/latest<br>
@@ -1,11 +1,11 @@<br>
=C2=A0PE =3D 1<br>
-PV =3D 215+gitAUTOINC+252ff40a38<br>
+PV =3D 216+gitAUTOINC+5d0ae62c66<br>
=C2=A0PR =3D r0<br>
-PKGV =3D 215+git0+252ff40a38<br>
-PKGR =3D r0.1<br>
+PKGV =3D 216+git0+5d0ae62c66<br>
+PKGR =3D r0.0<br>
=C2=A0RPROVIDES =3D<br>
=C2=A0RDEPENDS =3D<br>
-RRECOMMENDS =3D eglibc-dbg glib-2.0-dbg libacl-dbg libcap-dbg libffi-dbg l=
ibgcc-dbg libkmod-dbg liblzma-dbg libpam-dbg libudev-dbg util-linux-libblki=
d-dbg zlib-dbg<br>
-PKGSIZE =3D 49629406<br>
+RRECOMMENDS =3D glib-2.0-dbg glibc-dbg libacl-dbg libcap-dbg libffi-dbg li=
bgcc-dbg libkmod-dbg liblzma-dbg libpam-dbg libudev-dbg util-linux-libblkid=
-dbg zlib-dbg<br>
+PKGSIZE =3D 50305088<br>
=C2=A0FILES =3D /usr/bin/.debug /usr/sbin/.debug /usr/lib/systemd/.debug /u=
sr/lib/.debug /bin/.debug /sbin/.debug /lib/.debug /usr/lib/systemd/.debug =
/usr/lib/matchbox-panel/.debug /usr/lib/systemd/systemd/.debug /usr/src/deb=
ug /usr/lib/systemd/ptest/.debug /lib/.debug /lib/systemd/.debug /lib/syste=
md/*/.debug /lib/security/.debug/<br>
-RDEPENDS =3D libgudev-1.0 libsystemd libudev systemd (=3D 1:215+git0+252ff=
40a38-r0.1)<br>
-RRECOMMENDS =3D acl-dev base-files-dev base-passwd-dev dbus-dev eglibc-dev=
 glib-2.0-dev kmod-dev libacl-dev libcap-dev libcgroup-dev libffi-dev libgc=
c-dev libgcrypt-dev libgudev-1.0-dev libkmod-dev liblzma-dev libpam-dev lib=
systemd-dev libudev-dev readline-dev shadow-dev shadow-sysroot-dev systemd-=
binfmt-dev udev-dev update-alternatives-opkg-dev util-linux-dev util-linux-=
libblkid-dev util-linux-mount-dev volatile-binds-dev xz-dev zlib-dev<br>
-PKGSIZE =3D 78365<br>
+RDEPENDS =3D libgudev-1.0 libsystemd libudev systemd (=3D 1:216+git0+5d0ae=
62c66-r0.0)<br>
+RRECOMMENDS =3D acl-dev base-files-dev base-passwd-dev dbus-dev glib-2.0-d=
ev glibc-dev kmod-dev libacl-dev libcap-dev libcgroup-dev libffi-dev libgcc=
-dev libgcrypt-dev libgudev-1.0-dev libkmod-dev liblzma-dev libpam-dev libs=
ystemd-dev libudev-dev readline-dev shadow-dev shadow-sysroot-dev systemd-b=
infmt-dev udev-dev update-alternatives-opkg-dev util-linux-dev util-linux-l=
ibblkid-dev util-linux-mount-dev volatile-binds-dev xz-dev zlib-dev<br>
+PKGSIZE =3D 79477<br>
=C2=A0FILES =3D /usr/include /lib/lib*.so /usr/lib/lib*.so /usr/lib/*.la /u=
sr/lib/*.o /usr/lib/pkgconfig /usr/share/pkgconfig /usr/share/aclocal /lib/=
*.o /usr/lib/systemd/*.la /lib/*.la /lib/security/*.la /usr/share/dbus-1/in=
terfaces/ /etc/rpm/macros.systemd<br>
-FILELIST =3D /lib/security/<a href=3D"http://pam_systemd.la" target=3D"_bl=
ank">pam_systemd.la</a> /usr/include/gudev-1.0/gudev/gudev.h /usr/include/g=
udev-1.0/gudev/gudevclient.h /usr/include/gudev-1.0/gudev/gudevdevice.h /us=
r/include/gudev-1.0/gudev/gudevenumerator.h /usr/include/gudev-1.0/gudev/gu=
devenums.h /usr/include/gudev-1.0/gudev/gudevenumtypes.h /usr/include/gudev=
-1.0/gudev/gudevtypes.h /usr/include/libudev.h /usr/include/systemd/_sd-com=
mon.h /usr/include/systemd/sd-daemon.h /usr/include/systemd/sd-id128.h /usr=
/include/systemd/sd-journal.h /usr/include/systemd/sd-login.h /usr/include/=
systemd/sd-messages.h /usr/lib/<a href=3D"http://libgudev-1.0.la" target=3D=
"_blank">libgudev-1.0.la</a> /usr/lib/<a href=3D"http://libgudev-1.0.so" ta=
rget=3D"_blank">libgudev-1.0.so</a> /usr/lib/<a href=3D"http://libnss_myhos=
tname.la" target=3D"_blank">libnss_myhostname.la</a> /usr/lib/<a href=3D"ht=
tp://libsystemd.la" target=3D"_blank">libsystemd.la</a> /usr/lib/libsystemd=
.so /usr/lib/<a href=3D"http://libudev.la" target=3D"_blank">libudev.la</a>=
 /usr/lib/libudev.so /usr/lib/pkgconfig/gudev-1.0.pc /usr/lib/pkgconfig/lib=
systemd.pc /usr/lib/pkgconfig/libudev.pc /usr/share/pkgconfig/systemd.pc /u=
sr/share/pkgconfig/udev.pc<br>
+FILELIST =3D /lib/<a href=3D"http://libgudev-1.0.la" target=3D"_blank">lib=
gudev-1.0.la</a> /lib/<a href=3D"http://libgudev-1.0.so" target=3D"_blank">=
libgudev-1.0.so</a> /lib/security/<a href=3D"http://pam_systemd.la" target=
=3D"_blank">pam_systemd.la</a> /usr/include/gudev-1.0/gudev/gudev.h /usr/in=
clude/gudev-1.0/gudev/gudevclient.h /usr/include/gudev-1.0/gudev/gudevdevic=
e.h /usr/include/gudev-1.0/gudev/gudevenumerator.h /usr/include/gudev-1.0/g=
udev/gudevenums.h /usr/include/gudev-1.0/gudev/gudevenumtypes.h /usr/includ=
e/gudev-1.0/gudev/gudevtypes.h /usr/include/libudev.h /usr/include/systemd/=
_sd-common.h /usr/include/systemd/sd-daemon.h /usr/include/systemd/sd-id128=
.h /usr/include/systemd/sd-journal.h /usr/include/systemd/sd-login.h /usr/i=
nclude/systemd/sd-messages.h /usr/lib/<a href=3D"http://libnss_myhostname.l=
a" target=3D"_blank">libnss_myhostname.la</a> /usr/lib/<a href=3D"http://li=
bnss_mymachines.la" target=3D"_blank">libnss_mymachines.la</a> /usr/lib/<a =
href=3D"http://libsystemd.la" target=3D"_blank">libsystemd.la</a> /usr/lib/=
libsystemd.so /usr/lib/<a href=3D"http://libudev.la" target=3D"_blank">libu=
dev.la</a> /usr/lib/libudev.so /usr/lib/pkgconfig/gudev-1.0.pc /usr/lib/pkg=
config/libsystemd.pc /usr/lib/pkgconfig/libudev.pc /usr/share/pkgconfig/sys=
temd.pc /usr/share/pkgconfig/udev.pc<br>
<div class=3D""><div class=3D"h5"><br></div></div></blockquote></div>Hmm - =
I made my tests with systemd 216 and had no errors. Shouldn&#39;t pkg-confi=
g find <span class=3D""><a href=3D"http://libgudev-1.0.la" target=3D"_blank=
">libgudev</a>?<br><br></span></div><div class=3D"gmail_extra"><span class=
=3D"">Andreas<br></span></div></div>

--089e0122f0988c98350504bced09--
