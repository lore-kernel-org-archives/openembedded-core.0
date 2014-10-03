Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6623C601A8;
	Fri,  3 Oct 2014 20:09:09 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id cc10so3172743wib.17
	for <multiple recipients>; Fri, 03 Oct 2014 13:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wT5b9PJTPOdxJNXgc0f2CMTXyPrvBWdNwku2ISj8BYU=;
	b=q5cKuZCQo/9WAs3HjYYz1c7RsUX7lzWLtaBPvSwwys6VaZmTWzm7pIhyAtkVp9P5Mw
	m/qQL5/Hk5JjV162MNY7eUC9XD9Dpi6nxNBbOcW+QfgsqjOeU/iP6aNoLnfLRPmTc99n
	cVvXqU2tsn83QMO5XYxGc2QPZpqHJaSPP9Y0Lr4MF70MP5hfdeCrM3EXsp/baaquxwG+
	5cvksA6x2UEaZ9LIIC6TN8fo7Q1K7uCiQu9MbKiQJ0HtdpXQ7LRQ9owPEg6vGLenYawj
	J1SqoXerpQzBwqacH21PA2Xf9Kfv/vXPuGss5XF0BcmNgSbr9ShWHN8Ml0zTNrZJoMEs
	8gkA==
X-Received: by 10.181.5.42 with SMTP id cj10mr962825wid.28.1412366950144;
	Fri, 03 Oct 2014 13:09:10 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ny6sm3059801wic.22.2014.10.03.13.09.09 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Oct 2014 13:09:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 3 Oct 2014 22:10:07 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141003201007.GN25706@jama>
References: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
	<1412151555-19865-5-git-send-email-schnitzeltony@googlemail.com>
	<20141003200426.GM25706@jama>
MIME-Version: 1.0
In-Reply-To: <20141003200426.GM25706@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Fri, 03 Oct 2014 20:09:12 -0000
X-Groupsio-MsgNum: 58354
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GSmKOs+wxh1Tqap7"
Content-Disposition: inline

--GSmKOs+wxh1Tqap7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 03, 2014 at 10:04:26PM +0200, Martin Jansa wrote:
> On Wed, Oct 01, 2014 at 10:19:04AM +0200, Andreas M=FCller wrote:
> > * add libsecret to DEPENDS
> > * remove libglade from DEPENDS
> > * wireless (nm-signal-*.png) icons were updated upstream
> > * inherit gnomebase instead of gnome
> > * make bluetooth PACKAGECONFIG - disabled by default
>=20
> For some reason it has now the same problem as navit (through gypsy.la)
>=20
> | x86_64-oe-linux-libtool: compile:  x86_64-oe-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/jenkins/oe/world=
/shr-core/tmp-glibc/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/jenkins=
/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/network-manager-applet/=
0.9.8.10-r0/network-manager-applet-0.9.8.10/src/utils -I../.. -pthread -I/h=
ome/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/include/gtk=
-2.0 -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/li=
b/gtk-2.0/include -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemu=
x86-64/usr/include/pango-1.0 -I/home/jenkins/oe/world/shr-core/tmp-glibc/sy=
sroots/qemux86-64/usr/include/atk-1.0 -I/home/jenkins/oe/world/shr-core/tmp=
-glibc/sysroots/qemux86-64/usr/include/cairo -I/home/jenkins/oe/world/shr-c=
ore/tmp-glibc/sysroots/qemux86-64/usr/include/pixman-1 -I/home/jenkins/oe/w=
orld/shr-core/tmp-glibc/sysroots/qemux86-64/usr/include/libpng16 -I/home/je=
nkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/include/gdk-pixbu=
f-2.0 -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/i=
nclude/libpng16 -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux8=
6-64/usr/include/pango-1.0 -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysr=
oots/qemux86-64/usr/include/harfbuzz -I/home/jenkins/oe/world/shr-core/tmp-=
glibc/sysroots/qemux86-64/usr/include/pango-1.0 -I/home/jenkins/oe/world/sh=
r-core/tmp-glibc/sysroots/qemux86-64/usr/include/glib-2.0 -I/home/jenkins/o=
e/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/lib/glib-2.0/include -I/=
home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/home/jenkins/o=
e/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/include/freetype2 -I/hom=
e/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/include/freet=
ype2 -pthread -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-=
64/usr/include/libnm-glib -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysro=
ots/qemux86-64/usr/include/NetworkManager -I/home/jenkins/oe/world/shr-core=
/tmp-glibc/sysroots/qemux86-64
> | ../../x86_64-oe-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-oe-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64  -Wall -st=
d=3Dgnu89  -O2 -pipe -g -feliminate-unused-debug-types -Wshadow -Wmissing-d=
eclarations -Wmissing-prototypes -Wdeclaration-after-statement -Wstrict-pro=
totypes -Wfloat-equal -Wno-unused-parameter -Wno-sign-compare -fno-strict-a=
liasing -Wno-unused-but-set-variable   -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,-=
-as-needed -o libutils.la  libutils_la-utils.lo -lgtk-x11-2.0 -lgdk-x11-2.0=
 -lpangocairo-1.0 -latk-1.0 -lcairo -lgdk_pixbuf-2.0 -lgio-2.0 -lpangoft2-1=
=2E0 -lpango-1.0 -lgobject-2.0 -lglib-2.0 -lfontconfig -lfreetype  -lgio-2.=
0 -lnm-glib -lnm-util -lnm-glib-vpn -ldbus-glib-1 -ldbus-1 -lgobject-2.0 -W=
l,--export-dynamic -lgmodule-2.0 -pthread -lglib-2.0
> | /bin/grep: /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-6=
4/usr/lib/libgudev-1.0.la: No such file or directory
> | sed: can't read /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemu=
x86-64/usr/lib/libgudev-1.0.la: No such file or directory
> | x86_64-oe-linux-libtool: link: `/home/jenkins/oe/world/shr-core/tmp-gli=
bc/sysroots/qemux86-64/usr/lib/libgudev-1.0.la' is not a valid libtool arch=
ive
> | make[5]: *** [libutils.la] Error 1
> | make[5]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/w=
ork/core2-64-oe-linux/network-manager-applet/0.9.8.10-r0/build/src/utils'
> | make[4]: *** [all-recursive] Error 1
> | make[4]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/w=
ork/core2-64-oe-linux/network-manager-applet/0.9.8.10-r0/build/src/utils'

the libgudev-1.0.la was moved from /usr/lib to /lib in systemd 215-216 upda=
ted

--- a/packages/arm920tt-oe-linux-gnueabi/systemd/systemd-dbg/latest
+++ b/packages/arm920tt-oe-linux-gnueabi/systemd/systemd-dbg/latest
@@ -1,11 +1,11 @@
 PE =3D 1
-PV =3D 215+gitAUTOINC+252ff40a38
+PV =3D 216+gitAUTOINC+5d0ae62c66
 PR =3D r0
-PKGV =3D 215+git0+252ff40a38
-PKGR =3D r0.1
+PKGV =3D 216+git0+5d0ae62c66
+PKGR =3D r0.0
 RPROVIDES =3D=20
 RDEPENDS =3D=20
-RRECOMMENDS =3D eglibc-dbg glib-2.0-dbg libacl-dbg libcap-dbg libffi-dbg l=
ibgcc-dbg libkmod-dbg liblzma-dbg libpam-dbg libudev-dbg util-linux-libblki=
d-dbg zlib-dbg
-PKGSIZE =3D 49629406
+RRECOMMENDS =3D glib-2.0-dbg glibc-dbg libacl-dbg libcap-dbg libffi-dbg li=
bgcc-dbg libkmod-dbg liblzma-dbg libpam-dbg libudev-dbg util-linux-libblkid=
-dbg zlib-dbg
+PKGSIZE =3D 50305088
 FILES =3D /usr/bin/.debug /usr/sbin/.debug /usr/lib/systemd/.debug /usr/li=
b/.debug /bin/.debug /sbin/.debug /lib/.debug /usr/lib/systemd/.debug /usr/=
lib/matchbox-panel/.debug /usr/lib/systemd/systemd/.debug /usr/src/debug /u=
sr/lib/systemd/ptest/.debug /lib/.debug /lib/systemd/.debug /lib/systemd/*/=
=2Edebug /lib/security/.debug/
-RDEPENDS =3D libgudev-1.0 libsystemd libudev systemd (=3D 1:215+git0+252ff=
40a38-r0.1)
-RRECOMMENDS =3D acl-dev base-files-dev base-passwd-dev dbus-dev eglibc-dev=
 glib-2.0-dev kmod-dev libacl-dev libcap-dev libcgroup-dev libffi-dev libgc=
c-dev libgcrypt-dev libgudev-1.0-dev libkmod-dev liblzma-dev libpam-dev lib=
systemd-dev libudev-dev readline-dev shadow-dev shadow-sysroot-dev systemd-=
binfmt-dev udev-dev update-alternatives-opkg-dev util-linux-dev util-linux-=
libblkid-dev util-linux-mount-dev volatile-binds-dev xz-dev zlib-dev
-PKGSIZE =3D 78365
+RDEPENDS =3D libgudev-1.0 libsystemd libudev systemd (=3D 1:216+git0+5d0ae=
62c66-r0.0)
+RRECOMMENDS =3D acl-dev base-files-dev base-passwd-dev dbus-dev glib-2.0-d=
ev glibc-dev kmod-dev libacl-dev libcap-dev libcgroup-dev libffi-dev libgcc=
-dev libgcrypt-dev libgudev-1.0-dev libkmod-dev liblzma-dev libpam-dev libs=
ystemd-dev libudev-dev readline-dev shadow-dev shadow-sysroot-dev systemd-b=
infmt-dev udev-dev update-alternatives-opkg-dev util-linux-dev util-linux-l=
ibblkid-dev util-linux-mount-dev volatile-binds-dev xz-dev zlib-dev
+PKGSIZE =3D 79477
 FILES =3D /usr/include /lib/lib*.so /usr/lib/lib*.so /usr/lib/*.la /usr/li=
b/*.o /usr/lib/pkgconfig /usr/share/pkgconfig /usr/share/aclocal /lib/*.o /=
usr/lib/systemd/*.la /lib/*.la /lib/security/*.la /usr/share/dbus-1/interfa=
ces/ /etc/rpm/macros.systemd
-FILELIST =3D /lib/security/pam_systemd.la /usr/include/gudev-1.0/gudev/gud=
ev.h /usr/include/gudev-1.0/gudev/gudevclient.h /usr/include/gudev-1.0/gude=
v/gudevdevice.h /usr/include/gudev-1.0/gudev/gudevenumerator.h /usr/include=
/gudev-1.0/gudev/gudevenums.h /usr/include/gudev-1.0/gudev/gudevenumtypes.h=
 /usr/include/gudev-1.0/gudev/gudevtypes.h /usr/include/libudev.h /usr/incl=
ude/systemd/_sd-common.h /usr/include/systemd/sd-daemon.h /usr/include/syst=
emd/sd-id128.h /usr/include/systemd/sd-journal.h /usr/include/systemd/sd-lo=
gin.h /usr/include/systemd/sd-messages.h /usr/lib/libgudev-1.0.la /usr/lib/=
libgudev-1.0.so /usr/lib/libnss_myhostname.la /usr/lib/libsystemd.la /usr/l=
ib/libsystemd.so /usr/lib/libudev.la /usr/lib/libudev.so /usr/lib/pkgconfig=
/gudev-1.0.pc /usr/lib/pkgconfig/libsystemd.pc /usr/lib/pkgconfig/libudev.p=
c /usr/share/pkgconfig/systemd.pc /usr/share/pkgconfig/udev.pc
+FILELIST =3D /lib/libgudev-1.0.la /lib/libgudev-1.0.so /lib/security/pam_s=
ystemd.la /usr/include/gudev-1.0/gudev/gudev.h /usr/include/gudev-1.0/gudev=
/gudevclient.h /usr/include/gudev-1.0/gudev/gudevdevice.h /usr/include/gude=
v-1.0/gudev/gudevenumerator.h /usr/include/gudev-1.0/gudev/gudevenums.h /us=
r/include/gudev-1.0/gudev/gudevenumtypes.h /usr/include/gudev-1.0/gudev/gud=
evtypes.h /usr/include/libudev.h /usr/include/systemd/_sd-common.h /usr/inc=
lude/systemd/sd-daemon.h /usr/include/systemd/sd-id128.h /usr/include/syste=
md/sd-journal.h /usr/include/systemd/sd-login.h /usr/include/systemd/sd-mes=
sages.h /usr/lib/libnss_myhostname.la /usr/lib/libnss_mymachines.la /usr/li=
b/libsystemd.la /usr/lib/libsystemd.so /usr/lib/libudev.la /usr/lib/libudev=
=2Eso /usr/lib/pkgconfig/gudev-1.0.pc /usr/lib/pkgconfig/libsystemd.pc /usr=
/lib/pkgconfig/libudev.pc /usr/share/pkgconfig/systemd.pc /usr/share/pkgcon=
fig/udev.pc

>=20
>=20
> >=20
> > Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> > ---
> >  ...ses-and-properties-which-are-not-supporte.patch |  42 ++++---------=
--------
> >  .../files/icons/nm-signal-00.png                   | Bin 494 -> 0 bytes
> >  .../files/icons/nm-signal-100.png                  | Bin 413 -> 0 bytes
> >  .../files/icons/nm-signal-25.png                   | Bin 500 -> 0 bytes
> >  .../files/icons/nm-signal-50.png                   | Bin 496 -> 0 bytes
> >  .../files/icons/nm-signal-75.png                   | Bin 474 -> 0 bytes
> >  ...9.8.0.bb =3D> network-manager-applet_0.9.8.10.bb} |  21 ++++-------
> >  7 files changed, 15 insertions(+), 48 deletions(-)
> >  delete mode 100644 meta-gnome/recipes-connectivity/network-manager-app=
let/files/icons/nm-signal-00.png
> >  delete mode 100644 meta-gnome/recipes-connectivity/network-manager-app=
let/files/icons/nm-signal-100.png
> >  delete mode 100644 meta-gnome/recipes-connectivity/network-manager-app=
let/files/icons/nm-signal-25.png
> >  delete mode 100644 meta-gnome/recipes-connectivity/network-manager-app=
let/files/icons/nm-signal-50.png
> >  delete mode 100644 meta-gnome/recipes-connectivity/network-manager-app=
let/files/icons/nm-signal-75.png
> >  rename meta-gnome/recipes-connectivity/network-manager-applet/{network=
-manager-applet_0.9.8.0.bb =3D> network-manager-applet_0.9.8.10.bb} (59%)
> >=20
> > diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/fil=
es/0001-remove-classes-and-properties-which-are-not-supporte.patch b/meta-g=
nome/recipes-connectivity/network-manager-applet/files/0001-remove-classes-=
and-properties-which-are-not-supporte.patch
> > index b8ba181..4bd0e4f 100644
> > --- a/meta-gnome/recipes-connectivity/network-manager-applet/files/0001=
-remove-classes-and-properties-which-are-not-supporte.patch
> > +++ b/meta-gnome/recipes-connectivity/network-manager-applet/files/0001=
-remove-classes-and-properties-which-are-not-supporte.patch
> > @@ -1,8 +1,7 @@
> > -From 023b17f53d888dfb45981b141ce4dc151ab140f0 Mon Sep 17 00:00:00 2001
> > +From c7d75ce38fa392c04c39a75e7b7e068666a7b1e7 Mon Sep 17 00:00:00 2001
> >  From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googl=
email.com>
> > -Date: Thu, 4 Apr 2013 20:23:00 +0200
> > -Subject: [PATCH] remove classes and properties which are not supported=
 by
> > - gtk+
> > +Date: Tue, 8 Apr 2014 15:22:54 +0200
> > +Subject: [PATCH] remove classes and properties which are not supported=
 by gtk+
> >  MIME-Version: 1.0
> >  Content-Type: text/plain; charset=3DUTF-8
> >  Content-Transfer-Encoding: 8bit
> > @@ -13,12 +12,11 @@ Upstream-Status: Inappropriate [configuration]
> > =20
> >  Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> >  ---
> > - src/connection-editor/ce-page-general.ui      |    7 +------
> > - src/connection-editor/nm-connection-editor.ui |    2 +-
> > - 2 files changed, 2 insertions(+), 7 deletions(-)
> > + src/connection-editor/ce-page-general.ui | 3 ---
> > + 1 file changed, 3 deletions(-)
> > =20
> >  diff --git a/src/connection-editor/ce-page-general.ui b/src/connection=
-editor/ce-page-general.ui
> > -index f505c14..a3e8d2b 100644
> > +index b05f0df..049432b 100644
> >  --- a/src/connection-editor/ce-page-general.ui
> >  +++ b/src/connection-editor/ce-page-general.ui
> >  @@ -37,8 +37,6 @@
> > @@ -38,32 +36,6 @@ index f505c14..a3e8d2b 100644
> >           <property name=3D"use_underline">True</property>
> >           <property name=3D"xalign">0</property>
> >           <property name=3D"draw_indicator">True</property>
> > -@@ -86,11 +83,9 @@
> > -       </packing>
> > -     </child>
> > -     <child>
> > --      <object class=3D"GtkBox" id=3D"box2">
> > -+      <object class=3D"GtkVBox" id=3D"box2">
> > -         <property name=3D"visible">True</property>
> > -         <property name=3D"can_focus">False</property>
> > --        <property name=3D"valign">start</property>
> > --        <property name=3D"vexpand">True</property>
> > -         <property name=3D"spacing">6</property>
> > -         <child>
> > -           <object class=3D"GtkLabel" id=3D"firewall_zone_label">
> > -diff --git a/src/connection-editor/nm-connection-editor.ui b/src/conne=
ction-editor/nm-connection-editor.ui
> > -index 74ee266..6f1e166 100644
> > ---- a/src/connection-editor/nm-connection-editor.ui
> > -+++ b/src/connection-editor/nm-connection-editor.ui
> > -@@ -11,7 +11,7 @@
> > -     <property name=3D"icon_name">preferences-system-network</property>
> > -     <property name=3D"type_hint">dialog</property>
> > -     <child internal-child=3D"vbox">
> > --      <object class=3D"GtkBox" id=3D"dialog-vbox2">
> > -+      <object class=3D"GtkVBox" id=3D"dialog-vbox2">
> > -         <property name=3D"visible">True</property>
> > -         <property name=3D"can_focus">False</property>
> > -         <property name=3D"orientation">vertical</property>
> >  --=20
> > -1.7.6.5
> > +1.8.3.1
> > =20
> > diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/fil=
es/icons/nm-signal-00.png b/meta-gnome/recipes-connectivity/network-manager=
-applet/files/icons/nm-signal-00.png
> > deleted file mode 100644
> > index 836e723a2f53624d375650a8939dcc20b6a582eb..00000000000000000000000=
00000000000000000
> > GIT binary patch
> > literal 0
> > HcmV?d00001
> >=20
> > literal 494
> > zcmeAS@N?(olHy`uVBq!ia0vp^Vj#@H1|*Mc$*~4fY)RhkE)4%caKYZ?lYt_f1s;*b
> > z3=3DG`DAk4@xYmNj^kiEpy*OmP)3#Txr+V|l6HlUDVW=3DKSdbAE1aYF-JD%fR4Vl$uzQ
> > znxasiS(2d;l98(5?&%wlyJ0#|iqX&0#WBR<^xKeye$I{pbMDUEyTsq5LrtT}QK;#l
> > zeW;9zMU$g|%Ks)6MaM>EM)#~!>L1+s8Q<@?F6Q-FLE_rmyKmpTJ9Cfe|F_#|wvU$^
> > z*WFE8m7jV&eEL?#j57sgbra85GiwWNEC2TFeD#)n+z(v2EI1duWbN5~d-kn+OD*jz
> > zTa_N<ZIIj<#>U5LX13j^XNtq~Qz2)z%Q3!G)=3D_dOKM=3DO&$H#~J+Dr{B`1txA)B>7J
> > z^XE*`J+9s5&bjzvm1FAyC!N*@Un1W=3DYgnFp`e!54M5b$7I+=3D8|R32B$_^bJ6vt8lk
> > zdHnI;W{o8t8p2Z#EOIC}*~Sv#CBfI;s=3DuV;&u>Ylr9P~x5}e0_5*Dsn^~SojW6Jif
> > zg9_=3D(oyyNA)oI>au&Uuv;*uA4cJH$9eRqF$SC+wxADT<^1R|fkE%<lymd^4;#<JWw
> > h7i<4Aul~{hMsyCpzWI&?evY7E_jL7hS?83{1OS4L#;*VX
> >=20
> > diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/fil=
es/icons/nm-signal-100.png b/meta-gnome/recipes-connectivity/network-manage=
r-applet/files/icons/nm-signal-100.png
> > deleted file mode 100644
> > index def2da969fda37993833a33a96df7c25f344eb90..00000000000000000000000=
00000000000000000
> > GIT binary patch
> > literal 0
> > HcmV?d00001
> >=20
> > literal 413
> > zcmeAS@N?(olHy`uVBq!ia0vp^Vj#@H1|*Mc$*~4fY)RhkE)4%caKYZ?lYt_f1s;*b
> > z3=3DG`DAk4@xYmNj^kiEpy*OmP)3#Txbfbfx(cYs2QnIRD+&iT2ysd*(pE(3#eQEFmI
> > zYKlU6W=3DV!ZNJgrHyQgnJ?uO|gxxbz+jv*GO-%dFz*kmBkD(}T8mdH5GLAm76MZX;9
> > zqs>(Xb1pKiac14LJ8nvfa$-oqo*BXW{_NQ!eu(M+x3^-Ycji~mu`zkP?%cA?!Jl5F
> > zzuY0$|GUFB{{6gTkN7UCGxRNNEsVct&CPtEXmhwt2U|Y3x!d%N6=3DFaCOnMx?xV}WR
> > z`>msW-J)IR7g?&zF|W%ti!0e!D|poL_~o0KCI6czEPX7>t*~rUx&d>K!uGhMHu2H!
> > zJ_1@<YRU|;TQ?kbOiW`7&YZ~*JT>dyjG()dPCF(hF;-q&Ss>$_;Pv*#)3D>~3>*VO
> > z!y<YXSj1nEn?L*1vfo-!*^UWzFBgjZUvZa#^LIa=3D(I=3D&eppfu%^>bP0l+XkKkVl`x
> >=20
> > diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/fil=
es/icons/nm-signal-25.png b/meta-gnome/recipes-connectivity/network-manager=
-applet/files/icons/nm-signal-25.png
> > deleted file mode 100644
> > index 362960b8e744e5dcf34a29e85dff27670d043900..00000000000000000000000=
00000000000000000
> > GIT binary patch
> > literal 0
> > HcmV?d00001
> >=20
> > literal 500
> > zcmeAS@N?(olHy`uVBq!ia0vp^Vj#@H1|*Mc$*~4fY)RhkE)4%caKYZ?lYt_f1s;*b
> > z3=3DG`DAk4@xYmNj^kiEpy*OmP)3#Tv_Yn`O8IZ#M3GbEzKIX^cyHLnE7WngeFN=3D+<D
> > zO;IS%EXhy^$w*aj_w)_O-7p;}#Ter0;uvCa`fZ4z7mK67ns@8w-FR@o!$(iV(D1&v
> > z#*9u5wxk!_JbxP&DoAvsH9b2d`GZ0Jf%lc!h8JYh^ZnmX3-x)kCVhMMs@1#LfArty
> > zdl_jz>%?lQ$+a`*&Yc&+q|ll0|AE2$?`+H1*Q{B${e1P7eQXaVmaLF$xWX+FKK=3DRB
> > znuyJNH?!|@4pk5?D`hLQnl`OnvW>@J>$#vU(dFzvBcHu92z9VB+P8P-It5OqqsN|!
> > zonh)}SyJwMHmlcqR=3DNsX^HC?Rrq;+3Ctvlw*^K?KrhVowsVMMRrC$_r@WPqrmw)_t
> > zl=3D(2ZxnPU+p5=3DlEnNM|lB}gT%@-S)_DPP>q)WPwt^7mOz<;@~)PG=3DTumN+gUc>KI&
> > zxbhw6x=3D<FTRi+ZFvdlhvKPdE(*uT#t-Mm6M+|2xJNP4zRat>p=3Dz%17^4bEFr3Mc0;
> > mTVyC3oOJ8^EB1Mh?7PhU#q3uc5qB;G1-_@NpUXO@geCxTwZc9C
> >=20
> > diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/fil=
es/icons/nm-signal-50.png b/meta-gnome/recipes-connectivity/network-manager=
-applet/files/icons/nm-signal-50.png
> > deleted file mode 100644
> > index 1add41dcbd48a18c4637d46868b1c5b1cf3f3e35..00000000000000000000000=
00000000000000000
> > GIT binary patch
> > literal 0
> > HcmV?d00001
> >=20
> > literal 496
> > zcmeAS@N?(olHy`uVBq!ia0vp^Vj#@H1|*Mc$*~4fY)RhkE)4%caKYZ?lYt_f1s;*b
> > z3=3DG`DAk4@xYmNj^kiEpy*OmP)3#Txr*{dh@kAOmonIRD+&iT2ysd*(pE(3#eQEFmI
> > zYKlU6W=3DV!ZNJgrHyQgnJ?uO|=3DDaHU#7sn8b({Dqp{SG?_)PD9p%PQdO)spd|mbXPI
> > zP{GS@f|2+F7pFxXCo~-vI&3Luh*2plo7VJWbD07s+eL$`Z*F}4@@(%-)_;$;H(P!4
> > zmwvwHz?F4p^77XiGYNDS6jp{_vu0lXwV<Np(z<eqzY+&#uWEE<IO2C;#-01ATQ)uW
> > z@<t|$Ese?a%`M3rS2omN&`%7h7MM17X-0n@+tpQP&nTQ>czdG4WL~PPoy-@-OU)~q
> > z9<?u1YCU$};Qhy^Th&^fveQ;-M(lVQ%Uu!GGbf}ra@iubm4+f4-<rtvrdO|)Zh5%i
> > z{}aKE(|fWq7*=3DbvNKV`~;ZfqRm}eK6lV*hT_$sbiDzb=3D6h%rCu&ASg9R-9vuc-DRE
> > zu~Wdb7DeOfX?0vOHcD6A%FA1R+Wc%c-J5x6Ph@hre*?49CmYr<!7H4nW|c11-?nJ4
> > kZ04HZ^Zp(P{^S0U?~!Npu0{X$^nwE3)78&qol`;+02w#XW&i*H
> >=20
> > diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/fil=
es/icons/nm-signal-75.png b/meta-gnome/recipes-connectivity/network-manager=
-applet/files/icons/nm-signal-75.png
> > deleted file mode 100644
> > index 6b509e804f87099546e29af21d4901d2cd33961e..00000000000000000000000=
00000000000000000
> > GIT binary patch
> > literal 0
> > HcmV?d00001
> >=20
> > literal 474
> > zcmeAS@N?(olHy`uVBq!ia0vp^Vj#@H1|*Mc$*~4fY)RhkE)4%caKYZ?lYt_f1s;*b
> > z3=3DG`DAk4@xYmNj^kiEpy*OmP)3n!nErvHMqJU}7E%#er@=3DltB<)VvZPmw~~#C^fMp
> > zHASI3vm`?yBqLS9-P1Q9cf)j`6r+`=3Di(`nz>9-+<en$)hWZvHj|J<Q1xM<;d_jS%w
> > z_B=3DTCn?Y6RZY?thYk=3DZG=3D6A9Mo^N8MgpTtCz0*^WT6XHzr<Ag?oCoszd5u5T%)IJ)
> > zI&-<!?w$Lzco<CCo{LYv`zs~sb()2prSv-gjK3lWW^d&?!sDPWn7s9#$lLElhV7+%
> > zE^KPj*B!&|*za{=3DvSt>3pL=3DvcDMNs8=3DbYjMr2}tPTIAcZ7r*|<czAbpo$q0JCw)<|
> > zBU8@jImCR6ey3okc{O8Eg?fMZ>$4ZH^ByWPtQTOtV*XKHso@L9ji$~8Y3$m0r;o4j
> > zV=3D@VemEFUXC@mVzeV9ioSVw6>z;P>veJdx|zJL9MNATc_6RezzI3iy!e5KiT=3D=3DyCF
> > zNtefR-5yRd3o>STtceTUTc0xV@x}Db^SctQf@-$M|2Yu+$NdKjt4HyK2JyNmP!M~%
> > L`njxgN@xNAAqunS
> >=20
> > diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/net=
work-manager-applet_0.9.8.0.bb b/meta-gnome/recipes-connectivity/network-ma=
nager-applet/network-manager-applet_0.9.8.10.bb
> > similarity index 59%
> > rename from meta-gnome/recipes-connectivity/network-manager-applet/netw=
ork-manager-applet_0.9.8.0.bb
> > rename to meta-gnome/recipes-connectivity/network-manager-applet/networ=
k-manager-applet_0.9.8.10.bb
> > index 95c6802..e3c7663 100644
> > --- a/meta-gnome/recipes-connectivity/network-manager-applet/network-ma=
nager-applet_0.9.8.0.bb
> > +++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-ma=
nager-applet_0.9.8.10.bb
> > @@ -2,27 +2,26 @@ SUMMARY =3D "GTK+ applet for NetworkManager"
> >  LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9=
f6552"
> > =20
> > -PNBLACKLIST[network-manager-applet] =3D "BROKEN: depends on broken net=
workmanager"
> > +DEPENDS =3D "polkit-gnome libnotify libsecret networkmanager dbus-glib=
 gconf gnome-keyring libgnome-keyring iso-codes"
> > =20
> > -DEPENDS =3D "gnome-bluetooth polkit-gnome libnotify networkmanager dbu=
s-glib libglade gconf gnome-keyring libgnome-keyring iso-codes"
> > -
> > -inherit gnome gtk-icon-cache
> > +inherit gnomebase gtk-icon-cache
> > =20
> >  GNOME_COMPRESS_TYPE =3D "xz"
> > =20
> >  SRC_URI +=3D " \
> >      file://0001-remove-classes-and-properties-which-are-not-supporte.p=
atch \
> > -    file://images/* \
> >  "
> > -SRC_URI[archive.md5sum] =3D "531ce56c51ec86c5d2dc4cbe58649583"
> > -SRC_URI[archive.sha256sum] =3D "1afb6e736870ba95132bf0d211c46849e02a82=
0ba3902a059a616be888053590"
> > +SRC_URI[archive.md5sum] =3D "5148348c139229c6a753f815f3f11e1c"
> > +SRC_URI[archive.sha256sum] =3D "46fee9a1e667d1826e6a94bb6bd2e6bdbde535=
fc995e534542f5f7e8b8dae0cb"
> > =20
> >  # GTK2.x mode
> >  EXTRA_OECONF +=3D " \
> >      --with-gtkver=3D2 \
> > -    --with-bluetooth=3Dyes \
> >  "
> > =20
> > +PACKAGECONFIG[bluetooth] =3D "--with-bluetooth,--without-bluetooth,gno=
me-bluetooth,gnome-bluetooth"
> > +PACKAGECONFIG ??=3D ""
> > +
> >  do_configure_append() {
> >      rm config.log
> >      # Sigh... --enable-compile-warnings=3Dno doesn't actually turn off=
 -Werror
> > @@ -31,12 +30,8 @@ do_configure_append() {
> >      done
> >  }
> > =20
> > -do_install_append() {
> > -    install -m 0644 ${WORKDIR}/icons/* ${D}/usr/share/icons/hicolor/22=
x22/apps/
> > -}
> > -
> >  RDEPENDS_${PN} =3D+ "networkmanager"
> > -RRECOMMENDS_${PN} =3D+ "gnome-bluetooth gnome-keyring"
> > +RRECOMMENDS_${PN} =3D+ "gnome-keyring"
> > =20
> >  FILES_${PN} +=3D " \
> >      ${datadir}/nm-applet/ \
> > --=20
> > 1.8.3.1
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GSmKOs+wxh1Tqap7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQvAp8ACgkQN1Ujt2V2gBzxbwCcCZFrDqxLeknvTjmPO4efuuot
WXAAoJyXEKk1KOMkKpkzUDjfwKvsTQwj
=egQW
-----END PGP SIGNATURE-----

--GSmKOs+wxh1Tqap7--
