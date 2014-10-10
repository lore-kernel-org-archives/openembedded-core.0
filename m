Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 243D76FBB9;
	Fri, 10 Oct 2014 10:33:32 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id em10so1590090wid.7
	for <multiple recipients>; Fri, 10 Oct 2014 03:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=PYVj5HL+fKo0h//tHaKe9r6vEq0vFlPJNBHkhkTlmQM=;
	b=XSGBMZ6k7BYUYviXxCdP9XSHjpWhG07pFZ//exZ8eAAz993TEOrOyA8+KB0bXn5vS9
	TlDHf/6HqdMtjQKKkxrZw3aJCwp8oqksvR10/3e6jNaUK01B/qa7TV4Jqk4KnlGMFnSl
	8laxI7yff2xL/iCGr2ZZJlhE6K9VoJilHR37kK+m+fE+tKXiEmtwxHZcYQlERRtLEvb6
	SBhCi43vwphQCGKY95zMsZr8TQSXM5tzs0QWAz5i1cPivAem1qZzrhmha9esnRI2jELY
	C50uLdPF9QTd8unOjMpigPHLc7M6eCnrNS9qTLU314r1YgI8uh+Nrxc1bgCUgJ9ULH8e
	jWhw==
X-Received: by 10.181.27.132 with SMTP id jg4mr3849392wid.82.1412937212983;
	Fri, 10 Oct 2014 03:33:32 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gg18sm2145563wic.21.2014.10.10.03.33.31 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Oct 2014 03:33:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 10 Oct 2014 12:34:38 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20141010103438.GI12322@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2014-10-10, QA issues
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
X-List-Received-Date: Fri, 10 Oct 2014 10:33:35 -0000
X-Groupsio-MsgNum: 58497
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U3s59FfKcByyGl+j"
Content-Disposition: inline

--U3s59FfKcByyGl+j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Both issues are caused by pending reviews (vlc is
broken by opencv upgrade). So this is the first "clean"
report (except that couple fixes are still only in
jansa/master branches and on MLs, but not yet merged).

Next goal: clean QA log, see bellow.

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2014-10-10 =3D=3D

=3D=3D=3D common (2) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb=
, do_compile
    * meta-openembedded/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb, do_=
configure

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks =3D=3D=3D
{| class=3Dwikitable
|-
||qemuarm       ||2     ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20141009_050706.log/||http://errors.yoctoproject.org:80/Errors/Sea=
rch/1/2906/
|-
||qemux86       ||2     ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20141009_060811.log/||http://errors.yoctoproject.org:80/Errors/Sea=
rch/1/2907/
|-
||qemux86_64    ||2     ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20141009_071120.log/||http://errors.yoctoproject.org:80/Errors/Sea=
rch/1/2908/
|}

QA issues (per issue type, because of spam from new file-deps check)

$ logs=3D"log.world.2014100*"; for t in already-stripped libdir textrel bui=
ld-deps file-rdeps version-going-backwards; do count=3D`cat $logs/qa.log | =
sort -u | grep "\[$t\]" | wc -l`; echo "$count   $t:"; done; for t in alrea=
dy-stripped libdir textrel build-deps file-rdeps version-going-backwards; d=
o count=3D`cat $logs/qa.log | sort -u | grep "\[$t\]" | wc -l`; echo "$coun=
t $t:"; cat $logs/qa.log | sort -u | grep "\[$t\]" | sed 's#/home/jenkins/o=
e/world/shr-core/tmp-glibc/#/tmp/#g'; echo; echo; done

3	already-stripped:
2	libdir:
18	textrel:
18	build-deps:
361	file-rdeps:
36	version-going-backwards:

3       already-stripped:
qwt-6.0.1: File '/usr/lib/libqwt.so.6.0.1' from qwt was already stripped, t=
his will prevent future debugging! [already-stripped]
qwt-6.0.1: File '/usr/lib/libqwtmathml.so.6.0.1' from qwt was already strip=
ped, this will prevent future debugging! [already-stripped]
qwt-6.0.1: File '/usr/lib/qt4/plugins/designer/libqwt_designer_plugin.so' f=
rom qwt was already stripped, this will prevent future debugging! [already-=
stripped]


2       libdir:
chromium-37.0.2062.94: chromium: found library in wrong location: /usr/bin/=
chrome/libffmpegsumo.so [libdir]
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


18      build-deps:
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
opencv-2.99+3.0.0-alpha+gitAUTOINC+fb9a143429: libopencv-highgui rdepends o=
n gtk+3, but it isn't a build dependency? [build-deps]
opencv-2.99+3.0.0-alpha+gitAUTOINC+fb9a143429: libopencv-videoio rdepends o=
n gstreamer1.0, but it isn't a build dependency? [build-deps]
opencv-2.99+3.0.0-alpha+gitAUTOINC+fb9a143429: libopencv-videoio rdepends o=
n libgstapp-1.0, but it isn't a build dependency? [build-deps]
opencv-2.99+3.0.0-alpha+gitAUTOINC+fb9a143429: libopencv-videoio rdepends o=
n libgstpbutils-1.0, but it isn't a build dependency? [build-deps]
opencv-2.99+3.0.0-alpha+gitAUTOINC+fb9a143429: libopencv-videoio rdepends o=
n libgstriff-1.0, but it isn't a build dependency? [build-deps]
proftpd-1.3.4b: proftpd rdepends on initscripts-functions, but it isn't a b=
uild dependency? [build-deps]
sysklogd-1.5: sysklogd rdepends on initscripts-functions, but it isn't a bu=
ild dependency? [build-deps]
tracker-0.14.2: tracker rdepends on libnmglib, but it isn't a build depende=
ncy? [build-deps]
tracker-0.14.2: tracker rdepends on libnmutil, but it isn't a build depende=
ncy? [build-deps]
tracker-0.14.2: tracker rdepends on nss, but it isn't a build dependency? [=
build-deps]
tumbler-0.1.30: tumbler rdepends on gstreamer1.0, but it isn't a build depe=
ndency? [build-deps]
tumbler-0.1.30: tumbler rdepends on libgsttag-1.0, but it isn't a build dep=
endency? [build-deps]
xinetd-2.3.15: xinetd rdepends on initscripts-functions, but it isn't a bui=
ld dependency? [build-deps]


361     file-rdeps:
chkconfig-1.3.58: chkconfig requires libnewt.so()(64bit), but no providers =
in its RDEPENDS [file-rdeps]
chkconfig-1.3.58: chkconfig requires libnewt.so, but no providers in its RD=
EPENDS [file-rdeps]
cloud9-0.6: cloud9 requires /bin/bash, but no providers in its RDEPENDS [fi=
le-rdeps]
cpu-0.0.1+svnr82070: cpu requires libpulsecommon-5.0.so()(64bit), but no pr=
oviders in its RDEPENDS [file-rdeps]
cpu-0.0.1+svnr82070: cpu requires libpulsecommon-5.0.so, but no providers i=
n its RDEPENDS [file-rdeps]
diskio-0.0.1+svnr82070: diskio requires libpulsecommon-5.0.so()(64bit), but=
 no providers in its RDEPENDS [file-rdeps]
diskio-0.0.1+svnr82070: diskio requires libpulsecommon-5.0.so, but no provi=
ders in its RDEPENDS [file-rdeps]
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
e-wm-0.18.8: e-wm requires libpulsecommon-5.0.so()(64bit), but no providers=
 in its RDEPENDS [file-rdeps]
e-wm-0.18.8: e-wm requires libpulsecommon-5.0.so, but no providers in its R=
DEPENDS [file-rdeps]
efl-1.11.2: ecore-audio requires libpulsecommon-5.0.so()(64bit), but no pro=
viders in its RDEPENDS [file-rdeps]
efl-1.11.2: ecore-audio requires libpulsecommon-5.0.so, but no providers in=
 its RDEPENDS [file-rdeps]
efl-1.11.2: edje requires libpulsecommon-5.0.so()(64bit), but no providers =
in its RDEPENDS [file-rdeps]
efl-1.11.2: edje requires libpulsecommon-5.0.so, but no providers in its RD=
EPENDS [file-rdeps]
efl-1.11.2: ethumb requires libpulsecommon-5.0.so()(64bit), but no provider=
s in its RDEPENDS [file-rdeps]
efl-1.11.2: ethumb requires libpulsecommon-5.0.so, but no providers in its =
RDEPENDS [file-rdeps]
elementary-1.11.2: elementary requires libpulsecommon-5.0.so()(64bit), but =
no providers in its RDEPENDS [file-rdeps]
elementary-1.11.2: elementary requires libpulsecommon-5.0.so, but no provid=
ers in its RDEPENDS [file-rdeps]
elementary-1.11.2: elementary-accessibility requires libpulsecommon-5.0.so(=
)(64bit), but no providers in its RDEPENDS [file-rdeps]
elementary-1.11.2: elementary-accessibility requires libpulsecommon-5.0.so,=
 but no providers in its RDEPENDS [file-rdeps]
elementary-1.11.2: elementary-tests requires libpulsecommon-5.0.so()(64bit)=
, but no providers in its RDEPENDS [file-rdeps]
elementary-1.11.2: elementary-tests requires libpulsecommon-5.0.so, but no =
providers in its RDEPENDS [file-rdeps]
elfe-0.0.1+gitrAUTOINC+1ec0e7713c: elfe requires libpulsecommon-5.0.so()(64=
bit), but no providers in its RDEPENDS [file-rdeps]
elfe-0.0.1+gitrAUTOINC+1ec0e7713c: elfe requires libpulsecommon-5.0.so, but=
 no providers in its RDEPENDS [file-rdeps]
estardict-0.7: estardict requires libpulsecommon-5.0.so()(64bit), but no pr=
oviders in its RDEPENDS [file-rdeps]
estardict-0.7: estardict requires libpulsecommon-5.0.so, but no providers i=
n its RDEPENDS [file-rdeps]
exalt-client-0.0.1+svnr82070: exalt-client requires libpulsecommon-5.0.so()=
(64bit), but no providers in its RDEPENDS [file-rdeps]
exalt-client-0.0.1+svnr82070: exalt-client requires libpulsecommon-5.0.so, =
but no providers in its RDEPENDS [file-rdeps]
exquisite-0.0.1+svnr82070: exquisite requires libpulsecommon-5.0.so()(64bit=
), but no providers in its RDEPENDS [file-rdeps]
exquisite-0.0.1+svnr82070: exquisite requires libpulsecommon-5.0.so, but no=
 providers in its RDEPENDS [file-rdeps]
fakeroot-1.18.4: fakeroot requires /bin/bash, but no providers in its RDEPE=
NDS [file-rdeps]
fbida-2.09+gitAUTOINC+6aa5563cb3: fbida requires /bin/bash, but no provider=
s in its RDEPENDS [file-rdeps]
flame-0.0.3+svnr82070: flame requires libpulsecommon-5.0.so()(64bit), but n=
o providers in its RDEPENDS [file-rdeps]
flame-0.0.3+svnr82070: flame requires libpulsecommon-5.0.so, but no provide=
rs in its RDEPENDS [file-rdeps]
fluidsynth-1.1.6: fluidsynth requires libpulsecommon-5.0.so()(64bit), but n=
o providers in its RDEPENDS [file-rdeps]
fluidsynth-1.1.6: fluidsynth requires libpulsecommon-5.0.so, but no provide=
rs in its RDEPENDS [file-rdeps]
forecasts-0.2.0+svnr82070: forecasts requires libpulsecommon-5.0.so()(64bit=
), but no providers in its RDEPENDS [file-rdeps]
forecasts-0.2.0+svnr82070: forecasts requires libpulsecommon-5.0.so, but no=
 providers in its RDEPENDS [file-rdeps]
foxtrotgps-1.1.1: foxtrotgps requires /usr/bin/python, /usr/bin/perl, but n=
o providers in its RDEPENDS [file-rdeps]
fsodeviced-0.12.0: fsodeviced-module-accelerometer-kxsd9 requires libfsodev=
ice.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
fsodeviced-0.12.0: fsodeviced-module-accelerometer-kxsd9 requires libfsodev=
ice.so, but no providers in its RDEPENDS [file-rdeps]
fsodeviced-0.12.0: fsodeviced-module-accelerometer-lis302 requires libfsode=
vice.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
fsodeviced-0.12.0: fsodeviced-module-accelerometer-lis302 requires libfsode=
vice.so, but no providers in its RDEPENDS [file-rdeps]
fsodeviced-0.12.0: fsodeviced-module-backlight-omappanel requires libfsodev=
ice.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
fsodeviced-0.12.0: fsodeviced-module-backlight-omappanel requires libfsodev=
ice.so, but no providers in its RDEPENDS [file-rdeps]
fsodeviced-0.12.0: fsodeviced-module-n900-quirks requires libfsodevice.so()=
(64bit), but no providers in its RDEPENDS [file-rdeps]
fsodeviced-0.12.0: fsodeviced-module-n900-quirks requires libfsodevice.so, =
but no providers in its RDEPENDS [file-rdeps]
fsodeviced-0.12.0: fsodeviced-module-openmoko-powercontrol requires libfsod=
evice.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
fsodeviced-0.12.0: fsodeviced-module-openmoko-powercontrol requires libfsod=
evice.so, but no providers in its RDEPENDS [file-rdeps]
fsodeviced-0.12.0: fsodeviced-module-vibrator-omapvibe requires libfsodevic=
e.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
fsodeviced-0.12.0: fsodeviced-module-vibrator-omapvibe requires libfsodevic=
e.so, but no providers in its RDEPENDS [file-rdeps]
fsodeviced-0.12.0: fsodeviced-module-vibrator-timedoutputclass requires lib=
fsodevice.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
fsodeviced-0.12.0: fsodeviced-module-vibrator-timedoutputclass requires lib=
fsodevice.so, but no providers in its RDEPENDS [file-rdeps]
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-lowlevel-motorola-ez=
x requires libfsogsm.so()(64bit), but no providers in its RDEPENDS [file-rd=
eps]
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-lowlevel-motorola-ez=
x requires libfsogsm.so, but no providers in its RDEPENDS [file-rdeps]
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-lowlevel-openmoko re=
quires libfsogsm.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-lowlevel-openmoko re=
quires libfsogsm.so, but no providers in its RDEPENDS [file-rdeps]
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-lowlevel-samsung-cre=
spo requires libfsogsm.so()(64bit), but no providers in its RDEPENDS [file-=
rdeps]
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-lowlevel-samsung-cre=
spo requires libfsogsm.so, but no providers in its RDEPENDS [file-rdeps]
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-freescale-nept=
une requires libfsogsm.so()(64bit), but no providers in its RDEPENDS [file-=
rdeps]
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-freescale-nept=
une requires libfsogsm.so, but no providers in its RDEPENDS [file-rdeps]
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-nokia-isi requ=
ires libfsogsm.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-nokia-isi requ=
ires libfsogsm.so, but no providers in its RDEPENDS [file-rdeps]
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-option-gtm601 =
requires libfsogsm.so()(64bit), but no providers in its RDEPENDS [file-rdep=
s]
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-option-gtm601 =
requires libfsogsm.so, but no providers in its RDEPENDS [file-rdeps]
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-qualcomm-htc r=
equires libfsogsm.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-qualcomm-htc r=
equires libfsogsm.so, but no providers in its RDEPENDS [file-rdeps]
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-samsung requir=
es libfsogsm.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-samsung requir=
es libfsogsm.so, but no providers in its RDEPENDS [file-rdeps]
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-ti-calypso req=
uires libfsogsm.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-ti-calypso req=
uires libfsogsm.so, but no providers in its RDEPENDS [file-rdeps]
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
gmtk-1.0.5: gmtk requires libpulsecommon-5.0.so()(64bit), but no providers =
in its RDEPENDS [file-rdeps]
gmtk-1.0.5: gmtk requires libpulsecommon-5.0.so, but no providers in its RD=
EPENDS [file-rdeps]
gnome-desktop-2.32.1: gnome-desktop requires /usr/bin/python, but no provid=
ers in its RDEPENDS [file-rdeps]
gnome-panel-2.32.1: gnome-panel requires /usr/bin/python, but no providers =
in its RDEPENDS [file-rdeps]
groff-1.22.2: groff requires /bin/sed, but no providers in its RDEPENDS [fi=
le-rdeps]
gst-plugins-good-0.10.31: gst-plugins-good-pulse requires libpulsecommon-5.=
0.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
gst-plugins-good-0.10.31: gst-plugins-good-pulse requires libpulsecommon-5.=
0.so, but no providers in its RDEPENDS [file-rdeps]
gstreamer1.0-plugins-good-1.4.1: gstreamer1.0-plugins-good-pulse requires l=
ibpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
gstreamer1.0-plugins-good-1.4.1: gstreamer1.0-plugins-good-pulse requires l=
ibpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
gupnp-0.20.12: gupnp-dev requires /usr/bin/python, but no providers in its =
RDEPENDS [file-rdeps]
hplip-3.12.6: hplip-filter requires /usr/bin/perl, but no providers in its =
RDEPENDS [file-rdeps]
libbonobo-2.32.1: libbonobo requires /usr/bin/perl, but no providers in its=
 RDEPENDS [file-rdeps]
libcanberra-0.29: libcanberra-pulse requires libpulsecommon-5.0.so()(64bit)=
, but no providers in its RDEPENDS [file-rdeps]
libcanberra-0.29: libcanberra-pulse requires libpulsecommon-5.0.so, but no =
providers in its RDEPENDS [file-rdeps]
libeflvala-2011.01.13.1+svnr82070: libeflvala requires libpulsecommon-5.0.s=
o()(64bit), but no providers in its RDEPENDS [file-rdeps]
libeflvala-2011.01.13.1+svnr82070: libeflvala requires libpulsecommon-5.0.s=
o, but no providers in its RDEPENDS [file-rdeps]
libeweather-0.0.0+svnr82070: libeweather requires libpulsecommon-5.0.so()(6=
4bit), but no providers in its RDEPENDS [file-rdeps]
libeweather-0.0.0+svnr82070: libeweather requires libpulsecommon-5.0.so, bu=
t no providers in its RDEPENDS [file-rdeps]
libeweather-0.0.0+svnr82070: libeweather-plugins requires libpulsecommon-5.=
0.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
libeweather-0.0.0+svnr82070: libeweather-plugins requires libpulsecommon-5.=
0.so, but no providers in its RDEPENDS [file-rdeps]
libgphoto2-2.4.11: libgphoto2 requires /bin/bash, but no providers in its R=
DEPENDS [file-rdeps]
libhugetlbfs-2.18: libhugetlbfs requires /bin/bash, /usr/bin/perl, but no p=
roviders in its RDEPENDS [file-rdeps]
libhugetlbfs-2.18: libhugetlbfs-tests requires /bin/bash, but no providers =
in its RDEPENDS [file-rdeps]
libmikmod-3.3.6: libmikmod requires libpulsecommon-5.0.so()(64bit), but no =
providers in its RDEPENDS [file-rdeps]
libmikmod-3.3.6: libmikmod requires libpulsecommon-5.0.so, but no providers=
 in its RDEPENDS [file-rdeps]
libnewt-0.52.17: whiptail requires libnewt.so()(64bit), but no providers in=
 its RDEPENDS [file-rdeps]
libnewt-0.52.17: whiptail requires libnewt.so, but no providers in its RDEP=
ENDS [file-rdeps]
libnewt-python-0.52.17: libnewt-python requires libnewt.so()(64bit), but no=
 providers in its RDEPENDS [file-rdeps]
libnewt-python-0.52.17: libnewt-python requires libnewt.so, but no provider=
s in its RDEPENDS [file-rdeps]
libphone-ui-shr-0.0.1+gitrAUTOINC+25e6160710: libphone-ui-shr requires libp=
ulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
libphone-ui-shr-0.0.1+gitrAUTOINC+25e6160710: libphone-ui-shr requires libp=
ulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
lio-utils-4.1+gitAUTOINC+28bd928655: lio-utils requires /bin/bash, but no p=
roviders in its RDEPENDS [file-rdeps]
lmsensors-config-1.0: lmsensors-config-cgi requires /usr/bin/rrdcgi, but no=
 providers in its RDEPENDS [file-rdeps]
lxdm-0.5.0+gitAUTOINC+07fb151a99: lxdm requires /bin/bash, but no providers=
 in its RDEPENDS [file-rdeps]
mime-support-3.48: mime-support requires /usr/bin/perl, but no providers in=
 its RDEPENDS [file-rdeps]
mpg123-1.19.0: mpg123 requires libpulsecommon-5.0.so()(64bit), but no provi=
ders in its RDEPENDS [file-rdeps]
mpg123-1.19.0: mpg123 requires libpulsecommon-5.0.so, but no providers in i=
ts RDEPENDS [file-rdeps]
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
pidgin-2.10.9: libpurple-protocol-aim requires liboscar.so.0()(64bit), but =
no providers in its RDEPENDS [file-rdeps]
pidgin-2.10.9: libpurple-protocol-aim requires liboscar.so.0, but no provid=
ers in its RDEPENDS [file-rdeps]
pidgin-2.10.9: libpurple-protocol-icq requires liboscar.so.0()(64bit), but =
no providers in its RDEPENDS [file-rdeps]
pidgin-2.10.9: libpurple-protocol-icq requires liboscar.so.0, but no provid=
ers in its RDEPENDS [file-rdeps]
pidgin-2.10.9: libpurple-protocol-xmpp requires libjabber.so.0()(64bit), bu=
t no providers in its RDEPENDS [file-rdeps]
pidgin-2.10.9: libpurple-protocol-xmpp requires libjabber.so.0, but no prov=
iders in its RDEPENDS [file-rdeps]
pidgin-2.10.9: libpurple-protocol-yahoo requires libymsg.so.0()(64bit), but=
 no providers in its RDEPENDS [file-rdeps]
pidgin-2.10.9: libpurple-protocol-yahoo requires libymsg.so.0, but no provi=
ders in its RDEPENDS [file-rdeps]
pidgin-2.10.9: libpurple-protocol-yahoojp requires libymsg.so.0()(64bit), b=
ut no providers in its RDEPENDS [file-rdeps]
pidgin-2.10.9: libpurple-protocol-yahoojp requires libymsg.so.0, but no pro=
viders in its RDEPENDS [file-rdeps]
places-0.1.0+svnr82070: places requires libpulsecommon-5.0.so()(64bit), but=
 no providers in its RDEPENDS [file-rdeps]
places-0.1.0+svnr82070: places requires libpulsecommon-5.0.so, but no provi=
ders in its RDEPENDS [file-rdeps]
pm-qa-0.4.14: pm-qa requires /bin/bash, but no providers in its RDEPENDS [f=
ile-rdeps]
pulseaudio-5.0: libpulse requires libpulsecommon-5.0.so()(64bit), but no pr=
oviders in its RDEPENDS [file-rdeps]
pulseaudio-5.0: libpulse requires libpulsecommon-5.0.so, but no providers i=
n its RDEPENDS [file-rdeps]
pulseaudio-5.0: libpulse-mainloop-glib requires libpulsecommon-5.0.so()(64b=
it), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: libpulse-mainloop-glib requires libpulsecommon-5.0.so, but =
no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: libpulse-simple requires libpulsecommon-5.0.so()(64bit), bu=
t no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: libpulse-simple requires libpulsecommon-5.0.so, but no prov=
iders in its RDEPENDS [file-rdeps]
pulseaudio-5.0: libpulsecore requires libpulsecommon-5.0.so()(64bit), but n=
o providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: libpulsecore requires libpulsecommon-5.0.so, but no provide=
rs in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-lib-alsa-util requires libpulsecommon-5.0.so()(6=
4bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-lib-alsa-util requires libpulsecommon-5.0.so, bu=
t no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-lib-avahi-wrap requires libpulsecommon-5.0.so()(=
64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-lib-avahi-wrap requires libpulsecommon-5.0.so, b=
ut no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-lib-bluez4-util requires libpulsecommon-5.0.so()=
(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-lib-bluez4-util requires libpulsecommon-5.0.so, =
but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-lib-cli requires libpulsecommon-5.0.so()(64bit),=
 but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-lib-cli requires libpulsecommon-5.0.so, but no p=
roviders in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-lib-oss-util requires libpulsecommon-5.0.so()(64=
bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-lib-oss-util requires libpulsecommon-5.0.so, but=
 no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-lib-protocol-cli requires libcli.so, libpulsecom=
mon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-lib-protocol-cli requires libpulsecommon-5.0.so(=
)(64bit), libcli.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-lib-protocol-esound requires libpulsecommon-5.0.=
so()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-lib-protocol-esound requires libpulsecommon-5.0.=
so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-lib-protocol-http requires libpulsecommon-5.0.so=
()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-lib-protocol-http requires libpulsecommon-5.0.so=
, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-lib-protocol-native requires libpulsecommon-5.0.=
so()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-lib-protocol-native requires libpulsecommon-5.0.=
so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-lib-protocol-simple requires libpulsecommon-5.0.=
so()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-lib-protocol-simple requires libpulsecommon-5.0.=
so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-lib-rtp requires libpulsecommon-5.0.so()(64bit),=
 but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-lib-rtp requires libpulsecommon-5.0.so, but no p=
roviders in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-misc requires libpulsecommon-5.0.so()(64bit), bu=
t no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-misc requires libpulsecommon-5.0.so, but no prov=
iders in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-alsa-card requires libpulsecommon-5.0.so(=
)(64bit), libalsa-util.so()(64bit), but no providers in its RDEPENDS [file-=
rdeps]
pulseaudio-5.0: pulseaudio-module-alsa-card requires libpulsecommon-5.0.so,=
 libalsa-util.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-alsa-sink requires libpulsecommon-5.0.so(=
)(64bit), libalsa-util.so()(64bit), but no providers in its RDEPENDS [file-=
rdeps]
pulseaudio-5.0: pulseaudio-module-alsa-sink requires libpulsecommon-5.0.so,=
 libalsa-util.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-alsa-source requires libpulsecommon-5.0.s=
o()(64bit), libalsa-util.so()(64bit), but no providers in its RDEPENDS [fil=
e-rdeps]
pulseaudio-5.0: pulseaudio-module-alsa-source requires libpulsecommon-5.0.s=
o, libalsa-util.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-always-sink requires libpulsecommon-5.0.s=
o()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-always-sink requires libpulsecommon-5.0.s=
o, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-augment-properties requires libpulsecommo=
n-5.0.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-augment-properties requires libpulsecommo=
n-5.0.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-bluetooth-discover requires libpulsecommo=
n-5.0.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-bluetooth-discover requires libpulsecommo=
n-5.0.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-bluetooth-policy requires libpulsecommon-=
5.0.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-bluetooth-policy requires libpulsecommon-=
5.0.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-bluez4-device requires libbluez4-util.so,=
 libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-bluez4-device requires libpulsecommon-5.0=
=2Eso()(64bit), libbluez4-util.so()(64bit), but no providers in its RDEPEND=
S [file-rdeps]
pulseaudio-5.0: pulseaudio-module-bluez4-discover requires libbluez4-util.s=
o, libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-bluez4-discover requires libpulsecommon-5=
=2E0.so()(64bit), libbluez4-util.so()(64bit), but no providers in its RDEPE=
NDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-card-restore requires libpulsecommon-5.0.=
so()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-card-restore requires libpulsecommon-5.0.=
so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-cli requires libcli.so, libpulsecommon-5.=
0.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-cli requires libpulsecommon-5.0.so()(64bi=
t), libcli.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-cli-protocol-tcp requires libprotocol-cli=
=2Eso, libcli.so, libpulsecommon-5.0.so, but no providers in its RDEPENDS [=
file-rdeps]
pulseaudio-5.0: pulseaudio-module-cli-protocol-tcp requires libpulsecommon-=
5.0.so()(64bit), libcli.so()(64bit), libprotocol-cli.so()(64bit), but no pr=
oviders in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-cli-protocol-unix requires libprotocol-cl=
i.so, libcli.so, libpulsecommon-5.0.so, but no providers in its RDEPENDS [f=
ile-rdeps]
pulseaudio-5.0: pulseaudio-module-cli-protocol-unix requires libpulsecommon=
-5.0.so()(64bit), libcli.so()(64bit), libprotocol-cli.so()(64bit), but no p=
roviders in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-combine requires libpulsecommon-5.0.so()(=
64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-combine requires libpulsecommon-5.0.so, b=
ut no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-combine-sink requires libpulsecommon-5.0.=
so()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-combine-sink requires libpulsecommon-5.0.=
so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-console-kit requires libpulsecommon-5.0.s=
o()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-console-kit requires libpulsecommon-5.0.s=
o, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-dbus-protocol requires libpulsecommon-5.0=
=2Eso()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-dbus-protocol requires libpulsecommon-5.0=
=2Eso, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-default-device-restore requires libpulsec=
ommon-5.0.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-default-device-restore requires libpulsec=
ommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-detect requires libpulsecommon-5.0.so()(6=
4bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-detect requires libpulsecommon-5.0.so, bu=
t no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-device-manager requires libprotocol-nativ=
e.so, libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-device-manager requires libpulsecommon-5.=
0.so()(64bit), libprotocol-native.so()(64bit), but no providers in its RDEP=
ENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-device-restore requires libprotocol-nativ=
e.so, libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-device-restore requires libpulsecommon-5.=
0.so()(64bit), libprotocol-native.so()(64bit), but no providers in its RDEP=
ENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-echo-cancel requires libpulsecommon-5.0.s=
o()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-echo-cancel requires libpulsecommon-5.0.s=
o, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-esound-compat-spawnfd requires libpulseco=
mmon-5.0.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-esound-compat-spawnfd requires libpulseco=
mmon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-esound-compat-spawnpid requires libpulsec=
ommon-5.0.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-esound-compat-spawnpid requires libpulsec=
ommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-esound-protocol-tcp requires libprotocol-=
esound.so()(64bit), libpulsecommon-5.0.so()(64bit), but no providers in its=
 RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-esound-protocol-tcp requires libprotocol-=
esound.so, libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rd=
eps]
pulseaudio-5.0: pulseaudio-module-esound-protocol-tcp requires libpulsecomm=
on-5.0.so, libprotocol-esound.so, but no providers in its RDEPENDS [file-rd=
eps]
pulseaudio-5.0: pulseaudio-module-esound-protocol-unix requires libprotocol=
-esound.so, libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-r=
deps]
pulseaudio-5.0: pulseaudio-module-esound-protocol-unix requires libpulsecom=
mon-5.0.so()(64bit), libprotocol-esound.so()(64bit), but no providers in it=
s RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-esound-sink requires libpulsecommon-5.0.s=
o()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-esound-sink requires libpulsecommon-5.0.s=
o, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-filter-apply requires libpulsecommon-5.0.=
so()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-filter-apply requires libpulsecommon-5.0.=
so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-filter-heuristics requires libpulsecommon=
-5.0.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-filter-heuristics requires libpulsecommon=
-5.0.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-gconf requires libpulsecommon-5.0.so()(64=
bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-gconf requires libpulsecommon-5.0.so, but=
 no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-http-protocol-tcp requires libprotocol-ht=
tp.so, libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-http-protocol-tcp requires libpulsecommon=
-5.0.so()(64bit), libprotocol-http.so()(64bit), but no providers in its RDE=
PENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-http-protocol-unix requires libprotocol-h=
ttp.so, libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-http-protocol-unix requires libpulsecommo=
n-5.0.so()(64bit), libprotocol-http.so()(64bit), but no providers in its RD=
EPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-intended-roles requires libpulsecommon-5.=
0.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-intended-roles requires libpulsecommon-5.=
0.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-ladspa-sink requires libpulsecommon-5.0.s=
o()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-ladspa-sink requires libpulsecommon-5.0.s=
o, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-loopback requires libpulsecommon-5.0.so()=
(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-loopback requires libpulsecommon-5.0.so, =
but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-match requires libpulsecommon-5.0.so()(64=
bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-match requires libpulsecommon-5.0.so, but=
 no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-mmkbd-evdev requires libpulsecommon-5.0.s=
o()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-mmkbd-evdev requires libpulsecommon-5.0.s=
o, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-native-protocol-fd requires libprotocol-n=
ative.so, libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rde=
ps]
pulseaudio-5.0: pulseaudio-module-native-protocol-fd requires libpulsecommo=
n-5.0.so()(64bit), libprotocol-native.so()(64bit), but no providers in its =
RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-native-protocol-tcp requires libprotocol-=
native.so, libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rd=
eps]
pulseaudio-5.0: pulseaudio-module-native-protocol-tcp requires libpulsecomm=
on-5.0.so()(64bit), libprotocol-native.so()(64bit), but no providers in its=
 RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-native-protocol-unix requires libprotocol=
-native.so, libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-r=
deps]
pulseaudio-5.0: pulseaudio-module-native-protocol-unix requires libpulsecom=
mon-5.0.so()(64bit), libprotocol-native.so()(64bit), but no providers in it=
s RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-null-sink requires libpulsecommon-5.0.so(=
)(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-null-sink requires libpulsecommon-5.0.so,=
 but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-null-source requires libpulsecommon-5.0.s=
o()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-null-source requires libpulsecommon-5.0.s=
o, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-oss requires liboss-util.so, libpulsecomm=
on-5.0.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-oss requires libpulsecommon-5.0.so()(64bi=
t), liboss-util.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-pipe-sink requires libpulsecommon-5.0.so(=
)(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-pipe-sink requires libpulsecommon-5.0.so,=
 but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-pipe-source requires libpulsecommon-5.0.s=
o()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-pipe-source requires libpulsecommon-5.0.s=
o, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-position-event-sounds requires libpulseco=
mmon-5.0.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-position-event-sounds requires libpulseco=
mmon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-remap-sink requires libpulsecommon-5.0.so=
()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-remap-sink requires libpulsecommon-5.0.so=
, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-remap-source requires libpulsecommon-5.0.=
so()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-remap-source requires libpulsecommon-5.0.=
so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-rescue-streams requires libpulsecommon-5.=
0.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-rescue-streams requires libpulsecommon-5.=
0.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-role-cork requires libpulsecommon-5.0.so(=
)(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-role-cork requires libpulsecommon-5.0.so,=
 but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-role-ducking requires libpulsecommon-5.0.=
so()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-role-ducking requires libpulsecommon-5.0.=
so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-rtp-recv requires libpulsecommon-5.0.so()=
(64bit), librtp.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-rtp-recv requires librtp.so, libpulsecomm=
on-5.0.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-rtp-send requires libpulsecommon-5.0.so()=
(64bit), librtp.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-rtp-send requires librtp.so, libpulsecomm=
on-5.0.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-rygel-media-server requires libprotocol-h=
ttp.so, libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-rygel-media-server requires libpulsecommo=
n-5.0.so()(64bit), libprotocol-http.so()(64bit), but no providers in its RD=
EPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-simple-protocol-tcp requires libprotocol-=
simple.so, libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rd=
eps]
pulseaudio-5.0: pulseaudio-module-simple-protocol-tcp requires libpulsecomm=
on-5.0.so()(64bit), libprotocol-simple.so()(64bit), but no providers in its=
 RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-simple-protocol-unix requires libprotocol=
-simple.so, libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-r=
deps]
pulseaudio-5.0: pulseaudio-module-simple-protocol-unix requires libpulsecom=
mon-5.0.so()(64bit), libprotocol-simple.so()(64bit), but no providers in it=
s RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-sine requires libpulsecommon-5.0.so()(64b=
it), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-sine requires libpulsecommon-5.0.so, but =
no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-sine-source requires libpulsecommon-5.0.s=
o()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-sine-source requires libpulsecommon-5.0.s=
o, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-stream-restore requires libprotocol-nativ=
e.so, libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-stream-restore requires libpulsecommon-5.=
0.so()(64bit), libprotocol-native.so()(64bit), but no providers in its RDEP=
ENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-suspend-on-idle requires libpulsecommon-5=
=2E0.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-suspend-on-idle requires libpulsecommon-5=
=2E0.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-switch-on-connect requires libpulsecommon=
-5.0.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-switch-on-connect requires libpulsecommon=
-5.0.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-switch-on-port-available requires libpuls=
ecommon-5.0.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-switch-on-port-available requires libpuls=
ecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-systemd-login requires libpulsecommon-5.0=
=2Eso()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-systemd-login requires libpulsecommon-5.0=
=2Eso, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-tunnel-sink requires libpulsecommon-5.0.s=
o()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-tunnel-sink requires libpulsecommon-5.0.s=
o, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-tunnel-sink-new requires libpulsecommon-5=
=2E0.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-tunnel-sink-new requires libpulsecommon-5=
=2E0.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-tunnel-source requires libpulsecommon-5.0=
=2Eso()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-tunnel-source requires libpulsecommon-5.0=
=2Eso, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-tunnel-source-new requires libpulsecommon=
-5.0.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-tunnel-source-new requires libpulsecommon=
-5.0.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-udev-detect requires libpulsecommon-5.0.s=
o()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-udev-detect requires libpulsecommon-5.0.s=
o, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-virtual-sink requires libpulsecommon-5.0.=
so()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-virtual-sink requires libpulsecommon-5.0.=
so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-virtual-source requires libpulsecommon-5.=
0.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-virtual-source requires libpulsecommon-5.=
0.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-virtual-surround-sink requires libpulseco=
mmon-5.0.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-virtual-surround-sink requires libpulseco=
mmon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-volume-restore requires libpulsecommon-5.=
0.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-volume-restore requires libpulsecommon-5.=
0.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-x11-bell requires libpulsecommon-5.0.so()=
(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-x11-bell requires libpulsecommon-5.0.so, =
but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-x11-cork-request requires libpulsecommon-=
5.0.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-x11-cork-request requires libpulsecommon-=
5.0.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-x11-publish requires libprotocol-native.s=
o, libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-x11-publish requires libpulsecommon-5.0.s=
o()(64bit), libprotocol-native.so()(64bit), but no providers in its RDEPEND=
S [file-rdeps]
pulseaudio-5.0: pulseaudio-module-x11-xsmp requires libpulsecommon-5.0.so()=
(64bit), but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-x11-xsmp requires libpulsecommon-5.0.so, =
but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-zeroconf-discover requires libavahi-wrap.=
so, libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-zeroconf-discover requires libpulsecommon=
-5.0.so()(64bit), libavahi-wrap.so()(64bit), but no providers in its RDEPEN=
DS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-zeroconf-publish requires libavahi-wrap.s=
o, libpulsecommon-5.0.so, libprotocol-native.so, but no providers in its RD=
EPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-zeroconf-publish requires libprotocol-nat=
ive.so()(64bit), libpulsecommon-5.0.so()(64bit), libavahi-wrap.so()(64bit),=
 but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-module-zeroconf-publish requires libprotocol-nat=
ive.so, libavahi-wrap.so, libpulsecommon-5.0.so, but no providers in its RD=
EPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-server requires libpulsecommon-5.0.so()(64bit), =
but no providers in its RDEPENDS [file-rdeps]
pulseaudio-5.0: pulseaudio-server requires libpulsecommon-5.0.so, but no pr=
oviders in its RDEPENDS [file-rdeps]
qt-creator-2.8.1: qt-creator requires /usr/bin/perl, but no providers in it=
s RDEPENDS [file-rdeps]
qtbase-5.3.2: qtbase-mkspecs requires /bin/bash, but no providers in its RD=
EPENDS [file-rdeps]
rain-0.0.3+svnr82070: rain requires libpulsecommon-5.0.so()(64bit), but no =
providers in its RDEPENDS [file-rdeps]
rain-0.0.3+svnr82070: rain requires libpulsecommon-5.0.so, but no providers=
 in its RDEPENDS [file-rdeps]
shr-e-gadgets-0.0.0+gitrAUTOINC+42806ea24f: shr-e-gadgets requires libpulse=
common-5.0.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
shr-e-gadgets-0.0.0+gitrAUTOINC+42806ea24f: shr-e-gadgets requires libpulse=
common-5.0.so, but no providers in its RDEPENDS [file-rdeps]
shr-wizard-0.0.0+gitrAUTOINC+1dae79221f: shr-wizard requires libpulsecommon=
-5.0.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
shr-wizard-0.0.0+gitrAUTOINC+1dae79221f: shr-wizard requires libpulsecommon=
-5.0.so, but no providers in its RDEPENDS [file-rdeps]
sox-14.4.0: sox requires libpulsecommon-5.0.so()(64bit), but no providers i=
n its RDEPENDS [file-rdeps]
sox-14.4.0: sox requires libpulsecommon-5.0.so, but no providers in its RDE=
PENDS [file-rdeps]
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
uptime-0.0.2+svnr82070: uptime requires libpulsecommon-5.0.so()(64bit), but=
 no providers in its RDEPENDS [file-rdeps]
uptime-0.0.2+svnr82070: uptime requires libpulsecommon-5.0.so, but no provi=
ders in its RDEPENDS [file-rdeps]
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

--U3s59FfKcByyGl+j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQ3tj4ACgkQN1Ujt2V2gBy+HwCeLcZQHKR21pDSXydhLyaHfBBS
2+UAoJda7nD+XXS7VFcc9yZSuMYFNQGp
=t4+V
-----END PGP SIGNATURE-----

--U3s59FfKcByyGl+j--
