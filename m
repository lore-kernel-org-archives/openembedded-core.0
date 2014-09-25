Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 63A66609B2;
	Thu, 25 Sep 2014 16:23:11 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id a1so7821414wgh.29
	for <multiple recipients>; Thu, 25 Sep 2014 09:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=tD0eBTzdGek98Dvff8gMncCZqVlLyupUhz92NBEzgfU=;
	b=ZlIdswkVmgmlyvhwo7C7YZrIWfD6Damnmcg/ZIx7nEFiOvF8sX0RHSaM3OzwLPxsgw
	cjyT0E5U0nfBI9pnbH7DgitKXQi5bTA2tYMMyj6mXUsjxkqy7/ahTqvdfBsvtlUceFU1
	b421ldKoUKXHQ6J8gHYclfJQOD+oYYXshixeAZlrnYoXd+uwaqKWuZ9E2g0rLNqQsUow
	7mjjFy88DPHF2eQGjSDzi1kJYhGl060fpudoqOaih1UBS+bKFlsEua7HJ8j5AOY6QRam
	NPwPiiw7piKVvyVJYlQg9klAUEeSj1yyCaYhfU64RTVP3C5IEfnvxivv9ecZLlG7f3vw
	MZDg==
X-Received: by 10.194.47.134 with SMTP id d6mr8514409wjn.76.1411662192163;
	Thu, 25 Sep 2014 09:23:12 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	mx19sm3690881wic.3.2014.09.25.09.23.11 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Sep 2014 09:23:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 25 Sep 2014 18:23:59 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140925162359.GM25706@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, test-dependencies 2014-08-08
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
X-List-Received-Date: Thu, 25 Sep 2014 16:23:14 -0000
X-Groupsio-MsgNum: 58149
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="t5NgoZwlhlUmGr82"
Content-Disposition: inline

--t5NgoZwlhlUmGr82
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Complete logs:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20140901_10=
0637.log/

ERROR: 483 issues were found in these recipes: adb ajenti
android-initscripts anjuta-remote-run apcupsd barnyard barnyard2
bigbuckbunny-1080p bigbuckbunny-480p bigbuckbunny-720p
ca-certificates-cross check chromium claws-mail
claws-plugin-gtkhtml2-viewer claws-plugin-mailmbox claws-plugin-rssyl
clutter-box2d concurrencykit coriander cramfs dbus-ptest edbus2 elbow
emacs emprint eve fim freerdp genext2fs gnome-mplayer gnu-efi gnuradio
grub-efi gummiboot hostap-daemon ifuse imake initramfs-live-install
initramfs-live-install-efi initramfs-live-install-efi-testfs
initramfs-live-install-testfs intone ipython ipython3 js krb5 libacpi
libftdi libgc libimobiledevice libjson libungif
linux-yocto-tiny-kexecboot llvm2.8 llvm2.9 llvm3.2 lua5.1
maliit-framework maliit-plugins mplayer2 nasm network-manager-applet
networkmanager news numactl ocf-linux omgps opendataplane openmotif
packagegroup-core-basic packagegroup-core-sdk-gmae
packagegroup-core-standalone-gmae-sdk-target packagegroup-xfce-extended
python-setuptools python3-docutils python3-jinja python3-nose
python3-pycurl python3-pyzmq python3-sphinx qcanobserver
qcanobserver-socketcan qconnman qconnman-e qtjsbackend qtjsondb rage
renderer-service-upnp ristretto rpm-postinsts screenshot soft66 sylpheed
syslinux talloc tearsofsteel-1080p tumbler u-boot-fw-utils ubootchart
uhd uhd-firmware v86d vala-terminal valgrind web-webkit webkit-efl
wxpython wxwidgets xbmc xchat xf86-input-mtev xf86-input-vmmouse
xf86-video-ati xf86-video-geode xf86-video-intel xf86-video-nouveau
xf86-video-vesa xf86-video-vmware xfce4-power-manager xorg-cf-files
zaurusd zenity zeroc-ice zsh

The list of failed recipes looks alarmingly long, but probably the
biggest part of it are blacklisted or removed recipes (full
test-dependencies build was including all recipes which were ever
built with current buildhistory repo I have on jenkins server).

=20

This is first report with the message format unified with insane_qa check.

collectd-5.2.2: collectd rdepends on initscripts-functions, but it isn't a =
build dependency? [build-deps]
curl-7.37.1: libcurl rdepends on rtmpdump, but it isn't a build dependency?=
 [build-deps]
curlpp-0.7.3: libcurlpp rdepends on rtmpdump, but it isn't a build dependen=
cy? [build-deps]
exquisite-0.0.1+svnr82070: exquisite rdepends on initscripts-functions, but=
 it isn't a build dependency? [build-deps]
fbida-2.09+gitAUTOINC+6aa5563cb3: fbida rdepends on libwebp, but it isn't a=
 build dependency? [build-deps]
gpm-1.99.7: gpm rdepends on initscripts-functions, but it isn't a build dep=
endency? [build-deps]
gst-plugins-bad-0.10.23: gst-plugins-bad-curl rdepends on rtmpdump, but it =
isn't a build dependency? [build-deps]
gst-plugins-bad-0.10.23: gst-plugins-bad-rtmp rdepends on libcrypto, but it=
 isn't a build dependency? [build-deps]
gst-plugins-bad-0.10.23: gst-plugins-bad-rtmp rdepends on libssl, but it is=
n't a build dependency? [build-deps]
gst-plugins-bad-0.10.23: gst-plugins-bad-rtmp rdepends on rtmpdump, but it =
isn't a build dependency? [build-deps]
gstreamer1.0-plugins-bad-1.4.1: gstreamer1.0-plugins-bad-curl rdepends on r=
tmpdump, but it isn't a build dependency? [build-deps]
irda-utils-0.9.18: irda-utils rdepends on initscripts-functions, but it isn=
't a build dependency? [build-deps]
libetpan-0.57: libetpan rdepends on rtmpdump, but it isn't a build dependen=
cy? [build-deps]
liboauth-1.0.3: liboauth rdepends on rtmpdump, but it isn't a build depende=
ncy? [build-deps]
opencv-2.4.9+gitAUTOINC+df8e28283f: libopencv-highgui rdepends on jasper, b=
ut it isn't a build dependency? [build-deps]
opencv-2.4.9+gitAUTOINC+df8e28283f: libopencv-highgui rdepends on libdc1394=
, but it isn't a build dependency? [build-deps]
postgresql-9.2.4: postgresql rdepends on initscripts-functions, but it isn'=
t a build dependency? [build-deps]
proftpd-1.3.4b: proftpd rdepends on initscripts-functions, but it isn't a b=
uild dependency? [build-deps]
python3-3.3.3: python3-tkinter rdepends on tcl-lib, but it isn't a build de=
pendency? [build-deps]
qtbase-5.3.1: qtbase-plugins rdepends on cups-lib, but it isn't a build dep=
endency? [build-deps]
radvd-1.9.8: radvd rdepends on initscripts-functions, but it isn't a build =
dependency? [build-deps]
strongswan-5.2.0: strongswan rdepends on rtmpdump, but it isn't a build dep=
endency? [build-deps]
sysklogd-1.5: sysklogd rdepends on initscripts-functions, but it isn't a bu=
ild dependency? [build-deps]
tcpdump-4.6.1: tcpdump rdepends on libsmi, but it isn't a build dependency?=
 [build-deps]
udisks-1.0.4: udisks rdepends on lvm2, but it isn't a build dependency? [bu=
ild-deps]
xinetd-2.3.15: xinetd rdepends on initscripts-functions, but it isn't a bui=
ld dependency? [build-deps]

Then few getting libhybris as dependency, this isn't deterministic, the com=
ponents will link with virtual/libgl provider
which gets built first (so it's alternating between mesa and libhybris in m=
y case).

mesa-demos-8.2.0: mesa-demos rdepends on libhybris, but it isn't a build de=
pendency? [build-deps]
mx-1.0-1.4.7+gitAUTOINC+9b1db6b806: mx-1.0 rdepends on libhybris, but it is=
n't a build dependency? [build-deps]
piglit-1.0+gitrAUTOINC+bbeff5d21b: piglit rdepends on libhybris, but it isn=
't a build dependency? [build-deps]
qtwayland-5.3.0+gitAUTOINC+98dca3b54f: qtwayland-plugins rdepends on libhyb=
ris, but it isn't a build dependency? [build-deps]
qtwebengine-0.9.99+gitAUTOINC+21f6ce84ec: qtwebengine rdepends on libhybris=
, but it isn't a build dependency? [build-deps]
weston-1.5.0: weston-examples rdepends on libhybris, but it isn't a build d=
ependency? [build-deps]
weston-1.5.0: weston rdepends on libhybris, but it isn't a build dependency=
? [build-deps]

And there is couple more QA issues which aren't build-deps:

bluez5-5.22: bluez5: configure was passed unrecognised options: --with-syst=
emdunitdir [unknown-configure-option]
gstreamer1.0-libav-1.4.1: ELF binary '/home/jenkins/oe/world/shr-core/tmp-e=
glibc/work/armv5te-oe-linux-gnueabi/gstreamer1.0-libav/1.4.1-r0/packages-sp=
lit/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so' has relocation=
s in .text [textrel]
libav-9.16: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eglibc/work/arm=
v5te-oe-linux-gnueabi/libav/9.16-r0/packages-split/libavcodec/usr/lib/libav=
codec.so.54.35.0' has relocations in .text [textrel]
libgcrypt-1.6.1: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eglibc/wor=
k/armv5te-oe-linux-gnueabi/libgcrypt/1.6.1-r0/packages-split/libgcrypt/usr/=
lib/libgcrypt.so.20.0.1' has relocations in .text [textrel]
libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/home/jenkins/oe/worl=
d/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libpostproc/52.3.0+gitA=
UTOINC+811db3b957-r0/packages-split/libpostproc/usr/lib/libpostproc.so.52.3=
=2E0' has relocations in .text [textrel]
openldap-2.4.39: openldap: Files/directories were installed but not shipped=
   /run [installed-vs-shipped]
qtwebengine-0.9.99+gitAUTOINC+21f6ce84ec: ELF binary '/home/jenkins/oe/worl=
d/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtwebengine/0.9.99+gitA=
UTOINC+21f6ce84ec-r0/packages-split/qtwebengine/usr/lib/libQt0WebEngineCore=
=2Eso.0.9.0' has relocations in .text [textrel]
qwt-6.0.1: File '/usr/lib/libqwtmathml.so.6.0.1' from qwt was already strip=
ped, this will prevent future debugging! [already-stripped]
qwt-6.0.1: File '/usr/lib/libqwt.so.6.0.1' from qwt was already stripped, t=
his will prevent future debugging! [already-stripped]
qwt-6.0.1: File '/usr/lib/qt4/plugins/designer/libqwt_designer_plugin.so' f=
rom qwt was already stripped, this will prevent future debugging! [already-=
stripped]
xbmc-13.2: xbmc: configure was passed unrecognised options: --disable-rxsx =
[unknown-configure-option]

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--t5NgoZwlhlUmGr82
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQkQZ8ACgkQN1Ujt2V2gBx09gCfcn01oAfksHXMrL2WdMojrsot
gy0AoKJvjFXq7PCBvt4KX6rYBotgr16i
=EUpF
-----END PGP SIGNATURE-----

--t5NgoZwlhlUmGr82--
