Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 966A56A362;
	Mon, 13 Oct 2014 07:55:06 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id em10so6600454wid.16
	for <multiple recipients>; Mon, 13 Oct 2014 00:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=qBo/bdamO1VT5vJytDsYZh9dTUAa8Pj4vBFt6IJ0lQE=;
	b=Sc/A98QhP4mSruRku4GYjeO+rcezg0nyaR8SPmmZLIHlpkH7eqmBqHTSai8SkdcthE
	rs5OSzYymo1qePSPcTG+b0di9LnUEavgRTJofVxM4lwYvd5B0b0HG2MwXFATGtMAjvlr
	C/LVmLGwwq2CKLU37XAfelHjNe1VNjAcUlYzw5uW9zxJCoeohlIdx5ZtsOtz/CBPdC2A
	p7fIqMJT55nO7eIeldh6f6k0zJ39MrYN2bvf01yfC7VxYpXOL/40Ina5rBPUFWg4i71L
	kpy3218Frsr9pwJ0TnnLiuJgmNu4MOJLWvjhthuuaEtqXI2fisOzS/W6eX/KwQvv9BiP
	7h7g==
X-Received: by 10.180.106.102 with SMTP id gt6mr18399821wib.78.1413186907116; 
	Mon, 13 Oct 2014 00:55:07 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u7sm11252368wif.7.2014.10.13.00.55.06 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Oct 2014 00:55:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 13 Oct 2014 09:56:52 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20141013075652.GE3000@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2014-10-13, QA issues
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
X-List-Received-Date: Mon, 13 Oct 2014 07:55:11 -0000
X-Groupsio-MsgNum: 58579
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dDnEQgWzhgf+8aPe"
Content-Disposition: inline

--dDnEQgWzhgf+8aPe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2014-10-13 =3D=3D

=3D=3D=3D common () =3D=3D=3D

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks =3D=3D=3D
{| class=3Dwikitable
|-
||qemuarm       ||0
||http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20141010_231804=
=2Elog/||
|-
||qemux86       ||0
||http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20141011_145654=
=2Elog/||
|-
||qemux86_64    ||0
||http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20141012_065401=
=2Elog/||
|}

Thanks to fix in shlibs code the QA report looks better now. Thanks RP for =
letting me know and Khem for the fix.

3   already-stripped:
1   libdir:
18   textrel:
10   build-deps:
62   file-rdeps:
0   version-going-backwards:

3       already-stripped:
qwt-6.0.1: File '/usr/lib/libqwt.so.6.0.1' from qwt was already stripped, t=
his will prevent future debugging! [already-stripped]
qwt-6.0.1: File '/usr/lib/libqwtmathml.so.6.0.1' from qwt was already strip=
ped, this will prevent future debugging! [already-stripped]
qwt-6.0.1: File '/usr/lib/qt4/plugins/designer/libqwt_designer_plugin.so' f=
rom qwt was already stripped, this will prevent future debugging! [already-=
stripped]


1       libdir:
chromium-dbg: found library in wrong location: /usr/bin/chrome/.debug/libff=
mpegsumo.so [libdir]


18      textrel:
chromium-37.0.2062.94: ELF binary '/tmp/work/i586-oe-linux/chromium/37.0.20=
62.94-r0/packages-split/chromium/usr/bin/chrome/libffmpegsumo.so' has reloc=
ations in .text [textrel]
gstreamer1.0-libav-1.4.1: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/gs=
treamer1.0-libav/1.4.1-r0/packages-split/gstreamer1.0-libav/usr/lib/gstream=
er-1.0/libgstlibav.so' has relocations in .text [textrel]
gstreamer1.0-libav-1.4.1: ELF binary '/tmp/work/i586-oe-linux/gstreamer1.0-=
libav/1.4.1-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libg=
stlibav.so' has relocations in .text [textrel]
libav-9.16: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/libav/9.16-r0/pa=
ckages-split/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in .=
text [textrel]
libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-spli=
t/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in .text [textr=
el]
libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-spli=
t/libavdevice/usr/lib/libavdevice.so.53.2.0' has relocations in .text [text=
rel]
libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-spli=
t/libavfilter/usr/lib/libavfilter.so.3.3.0' has relocations in .text [textr=
el]
libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-spli=
t/libavformat/usr/lib/libavformat.so.54.20.4' has relocations in .text [tex=
trel]
libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-spli=
t/libavresample/usr/lib/libavresample.so.1.0.1' has relocations in .text [t=
extrel]
libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-spli=
t/libavutil/usr/lib/libavutil.so.52.3.0' has relocations in .text [textrel]
libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-spli=
t/libswscale/usr/lib/libswscale.so.2.1.1' has relocations in .text [textrel]
libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/armv5te-oe-=
linux-gnueabi/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/li=
bpostproc/usr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/i586-oe-lin=
ux/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc/u=
sr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
mpg123-1.19.0: ELF binary '/tmp/work/i586-oe-linux/mpg123/1.19.0-r0/package=
s-split/mpg123/usr/lib/libmpg123.so.0.40.1' has relocations in .text [textr=
el]
qtwebengine-5.3.2: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/qtwebengi=
ne/5.3.2-r0/packages-split/qtwebengine/usr/lib/libQt0WebEngineCore.so.0.9.0=
' has relocations in .text [textrel]
qtwebkit-5.3.2: ELF binary '/tmp/work/i586-oe-linux/qtwebkit/5.3.2-r0/packa=
ges-split/qtwebkit/usr/lib/libQt5WebKit.so.5.3.2' has relocations in .text =
[textrel]
webkit-efl-1.11.0: ELF binary '/tmp/work/i586-oe-linux/webkit-efl/1_1.11.0-=
r0/packages-split/webkit-efl/usr/lib/libjavascriptcore_efl.so.1.11.0' has r=
elocations in .text [textrel]
webkit-gtk-1.8.3: ELF binary '/tmp/work/i586-oe-linux/webkit-gtk/1.8.3-r1/p=
ackages-split/libjavascriptcore/usr/lib/libjavascriptcoregtk-1.0.so.0.13.4'=
 has relocations in .text [textrel]


10      build-deps:
exquisite-0.0.1+svnr82070: exquisite rdepends on initscripts-functions, but=
 it isn't a build dependency? [build-deps]
gpm-1.99.7: gpm rdepends on initscripts-functions, but it isn't a build dep=
endency? [build-deps]
irda-utils-0.9.18: irda-utils rdepends on initscripts-functions, but it isn=
't a build dependency? [build-deps]
libwebp-0.4.0: libwebp-bin rdepends on libgl-mesa, but it isn't a build dep=
endency? [build-deps]
libwebp-0.4.0: libwebp-bin rdepends on mesa-glut, but it isn't a build depe=
ndency? [build-deps]
proftpd-1.3.4b: proftpd rdepends on initscripts-functions, but it isn't a b=
uild dependency? [build-deps]
sysklogd-1.5: sysklogd rdepends on initscripts-functions, but it isn't a bu=
ild dependency? [build-deps]
tumbler-0.1.30: tumbler rdepends on gstreamer1.0, but it isn't a build depe=
ndency? [build-deps]
tumbler-0.1.30: tumbler rdepends on libgsttag-1.0, but it isn't a build dep=
endency? [build-deps]
xinetd-2.3.15: xinetd rdepends on initscripts-functions, but it isn't a bui=
ld dependency? [build-deps]


62      file-rdeps:
chkconfig-1.3.58: chkconfig requires libnewt.so()(64bit), but no providers =
in its RDEPENDS [file-rdeps]
chkconfig-1.3.58: chkconfig requires libnewt.so, but no providers in its RD=
EPENDS [file-rdeps]
cloud9-0.6: cloud9 requires /bin/bash, but no providers in its RDEPENDS [fi=
le-rdeps]
docbook-xsl-stylesheets-1.78.1: docbook-xsl-stylesheets requires /usr/bin/p=
erl, /bin/bash, but no providers in its RDEPENDS [file-rdeps]
dpkg-1.17.4: dpkg requires /usr/bin/perl, but no providers in its RDEPENDS =
[file-rdeps]
dvb-apps-1.1.1: dvb-apps requires libucsi.so()(64bit), libdvbapi.so()(64bit=
), libdvbcfg.so()(64bit), libdvben50221.so()(64bit), libdvbsec.so()(64bit),=
 but no providers in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: dvb-apps requires libucsi.so, libdvben50221.so, libdvbsec.s=
o, libdvbcfg.so, libdvbapi.so, but no providers in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: dvb-femon requires libdvbapi.so()(64bit), but no providers =
in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: dvb-femon requires libdvbapi.so, but no providers in its RD=
EPENDS [file-rdeps]
dvb-apps-1.1.1: dvb-scan requires libdvbsec.so()(64bit), libdvbapi.so()(64b=
it), libdvbcfg.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: dvb-scan requires libdvbsec.so, libdvbcfg.so, libdvbapi.so,=
 but no providers in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: dvbdate requires libucsi.so()(64bit), libdvbapi.so()(64bit)=
, but no providers in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: dvbdate requires libucsi.so, libdvbapi.so, but no providers=
 in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: dvbnet requires libdvbapi.so()(64bit), but no providers in =
its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: dvbnet requires libdvbapi.so, but no providers in its RDEPE=
NDS [file-rdeps]
dvb-apps-1.1.1: dvbtraffic requires libdvbapi.so()(64bit), but no providers=
 in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: dvbtraffic requires libdvbapi.so, but no providers in its R=
DEPENDS [file-rdeps]
fakeroot-1.18.4: fakeroot requires /bin/bash, but no providers in its RDEPE=
NDS [file-rdeps]
fbida-2.09+gitAUTOINC+6aa5563cb3: fbida requires /bin/bash, but no provider=
s in its RDEPENDS [file-rdeps]
foxtrotgps-1.1.1: foxtrotgps requires /usr/bin/python, /usr/bin/perl, but n=
o providers in its RDEPENDS [file-rdeps]
gammu-1.32.0: gammu requires /bin/bash, but no providers in its RDEPENDS [f=
ile-rdeps]
gammu-1.32.0: gammu-dev requires /bin/bash, but no providers in its RDEPEND=
S [file-rdeps]
gateone-1.2: gateone requires /usr/bin/perl, /bin/bash, but no providers in=
 its RDEPENDS [file-rdeps]
giflib-4.1.6: giflib-utils requires /usr/bin/perl, but no providers in its =
RDEPENDS [file-rdeps]
glibmm-2.36.2: glibmm-dev requires /usr/bin/perl, but no providers in its R=
DEPENDS [file-rdeps]
gnome-desktop-2.32.1: gnome-desktop requires /usr/bin/python, but no provid=
ers in its RDEPENDS [file-rdeps]
gnome-panel-2.32.1: gnome-panel requires /usr/bin/python, but no providers =
in its RDEPENDS [file-rdeps]
groff-1.22.2: groff requires /bin/sed, but no providers in its RDEPENDS [fi=
le-rdeps]
gupnp-0.20.12: gupnp-dev requires /usr/bin/python, but no providers in its =
RDEPENDS [file-rdeps]
hplip-3.12.6: hplip-filter requires /usr/bin/perl, but no providers in its =
RDEPENDS [file-rdeps]
libbonobo-2.32.1: libbonobo requires /usr/bin/perl, but no providers in its=
 RDEPENDS [file-rdeps]
libgphoto2-2.4.11: libgphoto2 requires /bin/bash, but no providers in its R=
DEPENDS [file-rdeps]
libhugetlbfs-2.18: libhugetlbfs requires /bin/bash, /usr/bin/perl, but no p=
roviders in its RDEPENDS [file-rdeps]
libhugetlbfs-2.18: libhugetlbfs-tests requires /bin/bash, but no providers =
in its RDEPENDS [file-rdeps]
libnewt-0.52.17: whiptail requires libnewt.so()(64bit), but no providers in=
 its RDEPENDS [file-rdeps]
libnewt-0.52.17: whiptail requires libnewt.so, but no providers in its RDEP=
ENDS [file-rdeps]
libnewt-python-0.52.17: libnewt-python requires libnewt.so()(64bit), but no=
 providers in its RDEPENDS [file-rdeps]
libnewt-python-0.52.17: libnewt-python requires libnewt.so, but no provider=
s in its RDEPENDS [file-rdeps]
lio-utils-4.1+gitAUTOINC+28bd928655: lio-utils requires /bin/bash, but no p=
roviders in its RDEPENDS [file-rdeps]
lmsensors-config-1.0: lmsensors-config-cgi requires /usr/bin/rrdcgi, but no=
 providers in its RDEPENDS [file-rdeps]
mime-support-3.48: mime-support requires /usr/bin/perl, but no providers in=
 its RDEPENDS [file-rdeps]
nodejs-0.8.18: nodejs requires /bin/bash, but no providers in its RDEPENDS =
[file-rdeps]
numptyphysics-0.2+svnr109: numptyphysics requires /bin/bash, /usr/bin/perl,=
 but no providers in its RDEPENDS [file-rdeps]
packagekit-0.5.6: packagekit requires /bin/bash, but no providers in its RD=
EPENDS [file-rdeps]
pcsc-lite-1.8.6: pcsc-lite requires /usr/bin/python, but no providers in it=
s RDEPENDS [file-rdeps]
php-5.4.33: php requires /tmp/work/armv5te-oe-linux-gnueabi/php/5.4.33-r0/i=
mage/usr/bin/php, but no providers in its RDEPENDS [file-rdeps]
php-5.4.33: php requires /tmp/work/core2-64-oe-linux/php/5.4.33-r0/image/us=
r/bin/php, but no providers in its RDEPENDS [file-rdeps]
php-5.4.33: php requires /tmp/work/i586-oe-linux/php/5.4.33-r0/image/usr/bi=
n/php, but no providers in its RDEPENDS [file-rdeps]
pm-qa-0.4.14: pm-qa requires /bin/bash, but no providers in its RDEPENDS [f=
ile-rdeps]
qt-creator-2.8.1: qt-creator requires /usr/bin/perl, but no providers in it=
s RDEPENDS [file-rdeps]
qtbase-5.3.2: qtbase-mkspecs requires /bin/bash, but no providers in its RD=
EPENDS [file-rdeps]
syslog-ng-3.5.4.1: syslog-ng requires /usr/bin/awk, but no providers in its=
 RDEPENDS [file-rdeps]
systemd-216+gitAUTOINC+5d0ae62c66: systemd-kernel-install requires /bin/bas=
h, but no providers in its RDEPENDS [file-rdeps]
tracker-0.14.2: tracker-nautilus-extension requires libnautilus-extension.s=
o.1()(64bit), but no providers in its RDEPENDS [file-rdeps]
tracker-0.14.2: tracker-nautilus-extension requires libnautilus-extension.s=
o.1, but no providers in its RDEPENDS [file-rdeps]
ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: ubx-utils requires /bin/bash, but n=
o providers in its RDEPENDS [file-rdeps]
unionfs-fuse-0.26: unionfs-fuse requires /bin/bash, but no providers in its=
 RDEPENDS [file-rdeps]
usbpath-0.0+svnr3172: usbpath requires /usr/bin/perl, but no providers in i=
ts RDEPENDS [file-rdeps]
webmin-1.700: webmin-module-ajaxterm requires /sbin/runscript, but no provi=
ders in its RDEPENDS [file-rdeps]
wvstreams-4.6.1: wvstreams requires /usr/bin/perl, but no providers in its =
RDEPENDS [file-rdeps]
xfce4-dev-tools-4.11.0: xfce4-dev-tools requires /bin/bash, but no provider=
s in its RDEPENDS [file-rdeps]
xmlto-0.0.25: xmlto requires /bin/bash, but no providers in its RDEPENDS [f=
ile-rdeps]


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dDnEQgWzhgf+8aPe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQ7hcQACgkQN1Ujt2V2gBxF6ACfRDEuVe+OY7SLRd3RP24fFzoV
PEUAnjJO6Pq2ntVPA5mIrTbCxI/biZz4
=zqV0
-----END PGP SIGNATURE-----

--dDnEQgWzhgf+8aPe--
