Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2CDF46AC74;
	Thu, 17 Jul 2014 08:47:44 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id q58so2105346wes.4
	for <multiple recipients>; Thu, 17 Jul 2014 01:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=eiZtgTKNktcnmSL/UisUKl39a864bS6ROO/Ri8Nlp78=;
	b=GvMzRvoOQXL2Y4t8HEx4G3sqjsygHMvrmrEWUn3nC3O/EN9sweIRlJmRc4tqFHLWkc
	3+COpKUyegi/qqp5pmcG5IfLzwW80z6TT7Y8KIRDXDbjhuwzFMafaaurwtGw7U9JMiND
	HUI62KtQp3VAWFXNgwcoBTEeY6CSfPGE5+s6oAvAx6sa/7fPfL2LuSQ/BVsR01MjUCfN
	FAlV2rCFDpTyEm87jS2DFGU8tA4lce/W67wCo5pj5qVyZxN+Up6dZRdh1ylwgV62ZHAw
	PZkZFtg6TQDrCU8mXca9TDd7HZ/pfwCL5XLhygcL/n3YUeT/1JzwvtR8BHNGTLlVMozI
	tsPQ==
X-Received: by 10.180.211.19 with SMTP id my19mr19973084wic.2.1405586861651;
	Thu, 17 Jul 2014 01:47:41 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	n8sm38875140wia.19.2014.07.17.01.47.40 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jul 2014 01:47:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 17 Jul 2014 10:47:49 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140717084749.GJ2433@jama>
References: <20140716130503.GW2433@jama>
MIME-Version: 1.0
In-Reply-To: <20140716130503.GW2433@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: State of bitbake world, test-dependencies 2014-06-27
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
X-List-Received-Date: Thu, 17 Jul 2014 08:47:47 -0000
X-Groupsio-MsgNum: 55148
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vlBIoVqBuM4vJEpx"
Content-Disposition: inline

--vlBIoVqBuM4vJEpx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2014 at 03:05:03PM +0200, Martin Jansa wrote:
> This was incremental build.
>=20
> I've sent fix for xfconf which was causing many issues, but there is
> still too many of them.

This is list of wrong dependencies detected by RP's improved insane_qa
patch, it probably still isn't complete:

ccid-1.4.8: ccid rdepends on flex but its not a build dependency?
dconf-0.18.0: dconf-editor rdepends on libxml2 but its not a build dependen=
cy?
directfb-1.7.4: directfb rdepends on libdrm but its not a build dependency?
directfb-1.7.4: directfb rdepends on libdrm-kms but its not a build depende=
ncy?
directfb-1.7.4: directfb rdepends on liblzma but its not a build dependency?
directfb-1.7.4: directfb rdepends on tiff but its not a build dependency?
engrave-0.0.0+svnr82070: engrave rdepends on flex but its not a build depen=
dency?
epiphany-2.30.6: epiphany rdepends on libavahi-client but its not a build d=
ependency?
epiphany-2.30.6: epiphany rdepends on libavahi-common but its not a build d=
ependency?
epiphany-2.30.6: epiphany rdepends on libavahi-gobject but its not a build =
dependency?
epiphany-2.30.6: epiphany rdepends on libnotify but its not a build depende=
ncy?
evopedia-0.4.2+gitrAUTOINC+36ca70acb4: evopedia rdepends on libbz2 but its =
not a build dependency?
expedite-1.7.9: expedite rdepends on evas-engine-fb but its not a build dep=
endency?
expedite-1.7.9: expedite rdepends on evas-engine-software-generic but its n=
ot a build dependency?
expedite-1.7.9: expedite rdepends on evas-loader-png but its not a build de=
pendency?
expedite-1.7.9: expedite rdepends on libsdl but its not a build dependency?
gammu-1.32.0: gammu rdepends on glib-2.0 but its not a build dependency?
gammu-1.32.0: gammu rdepends on libgudev-1.0 but its not a build dependency?
gammu-1.32.0: libgammu rdepends on glib-2.0 but its not a build dependency?
gd-2.1.0: gd rdepends on liblzma but its not a build dependency?
gd-2.1.0: gd rdepends on tiff but its not a build dependency?
gimp-2.8.10: gimp rdepends on libbz2 but its not a build dependency?
glade3-3.8.2: glade3 rdepends on dbus-glib but its not a build dependency?
glade3-3.8.2: glade3 rdepends on dbus-lib but its not a build dependency?
glade3-3.8.2: glade3 rdepends on gconf but its not a build dependency?
glade3-3.8.2: glade3 rdepends on gnome-vfs but its not a build dependency?
glade3-3.8.2: glade3 rdepends on libart-lgpl but its not a build dependency?
glade3-3.8.2: glade3 rdepends on libavahi-client but its not a build depend=
ency?
glade3-3.8.2: glade3 rdepends on libavahi-common but its not a build depend=
ency?
glade3-3.8.2: glade3 rdepends on libavahi-glib but its not a build dependen=
cy?
glade3-3.8.2: glade3 rdepends on libbonobo but its not a build dependency?
glade3-3.8.2: glade3 rdepends on libbonoboui but its not a build dependency?
glade3-3.8.2: glade3 rdepends on libcanberra but its not a build dependency?
glade3-3.8.2: glade3 rdepends on libcap but its not a build dependency?
glade3-3.8.2: glade3 rdepends on libgcrypt but its not a build dependency?
glade3-3.8.2: glade3 rdepends on libgnome but its not a build dependency?
glade3-3.8.2: glade3 rdepends on libgnome-keyring but its not a build depen=
dency?
glade3-3.8.2: glade3 rdepends on libgnomecanvas but its not a build depende=
ncy?
glade3-3.8.2: glade3 rdepends on libgnomeui but its not a build dependency?
glade3-3.8.2: glade3 rdepends on libgpg-error but its not a build dependenc=
y?
glade3-3.8.2: glade3 rdepends on libltdl but its not a build dependency?
glade3-3.8.2: glade3 rdepends on libogg but its not a build dependency?
glade3-3.8.2: glade3 rdepends on libvorbis but its not a build dependency?
glade3-3.8.2: glade3 rdepends on orbit2 but its not a build dependency?
glade3-3.8.2: glade3 rdepends on popt but its not a build dependency?
gmtk-1.0.5: gmtk rdepends on gtk+3 but its not a build dependency?
gmtk-1.0.5: gmtk rdepends on json-c but its not a build dependency?
gmtk-1.0.5: gmtk rdepends on libcap but its not a build dependency?
gmtk-1.0.5: gmtk rdepends on libpulse but its not a build dependency?
gmtk-1.0.5: gmtk rdepends on libpulse-mainloop-glib but its not a build dep=
endency?
gmtk-1.0.5: gmtk rdepends on libsndfile1 but its not a build dependency?
gmtk-1.0.5: gmtk rdepends on libxi but its not a build dependency?
gmtk-1.0.5: gmtk rdepends on libxtst but its not a build dependency?
gnokii-0.6.31: gnokii rdepends on readline but its not a build dependency?
gnokii-0.6.31: libgnokii rdepends on bluez4 but its not a build dependency?
gnokii-0.6.31: libgnokii rdepends on libical but its not a build dependency?
gnokii-0.6.31: libgnokii rdepends on libusb-compat but its not a build depe=
ndency?
gnokii-0.6.31: libgnokii rdepends on libusb1 but its not a build dependency?
gnokii-0.6.31: libgnokii rdepends on pcsc-lite-lib but its not a build depe=
ndency?
gnome-disk-utility-2.32.0: gnome-disk-utility-libs rdepends on libgnome-key=
ring but its not a build dependency?
gtksourceview2-2.10.5: gtksourceview2 rdepends on libxml2 but its not a bui=
ld dependency?
guile-2.0.11: guile rdepends on libgc but its not a build dependency?
guile-2.0.11: guile rdepends on ncurses-libncurses but its not a build depe=
ndency?
guile-2.0.11: guile rdepends on readline but its not a build dependency?
kernelshark-1.2+gitAUTOINC+7055ffd37b: kernelshark rdepends on libxml2 but =
its not a build dependency?
klibc-utils-2.0.3: klibc-utils-cat rdepends on libklibc but its not a build=
 dependency?
klibc-utils-2.0.3: klibc-utils-chroot rdepends on libklibc but its not a bu=
ild dependency?
klibc-utils-2.0.3: klibc-utils-cpio rdepends on libklibc but its not a buil=
d dependency?
klibc-utils-2.0.3: klibc-utils-dd rdepends on libklibc but its not a build =
dependency?
klibc-utils-2.0.3: klibc-utils-dmesg rdepends on libklibc but its not a bui=
ld dependency?
klibc-utils-2.0.3: klibc-utils-false rdepends on libklibc but its not a bui=
ld dependency?
klibc-utils-2.0.3: klibc-utils-fstype rdepends on libklibc but its not a bu=
ild dependency?
klibc-utils-2.0.3: klibc-utils-gunzip rdepends on libklibc but its not a bu=
ild dependency?
klibc-utils-2.0.3: klibc-utils-gzip rdepends on libklibc but its not a buil=
d dependency?
klibc-utils-2.0.3: klibc-utils-halt rdepends on libklibc but its not a buil=
d dependency?
klibc-utils-2.0.3: klibc-utils-ipconfig rdepends on libklibc but its not a =
build dependency?
klibc-utils-2.0.3: klibc-utils-kill rdepends on libklibc but its not a buil=
d dependency?
klibc-utils-2.0.3: klibc-utils-kinit rdepends on libklibc but its not a bui=
ld dependency?
klibc-utils-2.0.3: klibc-utils-kinit.shared rdepends on libklibc but its no=
t a build dependency?
klibc-utils-2.0.3: klibc-utils-ln rdepends on libklibc but its not a build =
dependency?
klibc-utils-2.0.3: klibc-utils-losetup rdepends on libklibc but its not a b=
uild dependency?
klibc-utils-2.0.3: klibc-utils-ls rdepends on libklibc but its not a build =
dependency?
klibc-utils-2.0.3: klibc-utils-minips rdepends on libklibc but its not a bu=
ild dependency?
klibc-utils-2.0.3: klibc-utils-mkdir rdepends on libklibc but its not a bui=
ld dependency?
klibc-utils-2.0.3: klibc-utils-mkfifo rdepends on libklibc but its not a bu=
ild dependency?
klibc-utils-2.0.3: klibc-utils-mknod rdepends on libklibc but its not a bui=
ld dependency?
klibc-utils-2.0.3: klibc-utils-mount rdepends on libklibc but its not a bui=
ld dependency?
klibc-utils-2.0.3: klibc-utils-mv rdepends on libklibc but its not a build =
dependency?
klibc-utils-2.0.3: klibc-utils-nfsmount rdepends on libklibc but its not a =
build dependency?
klibc-utils-2.0.3: klibc-utils-nuke rdepends on libklibc but its not a buil=
d dependency?
klibc-utils-2.0.3: klibc-utils-pivot-root rdepends on libklibc but its not =
a build dependency?
klibc-utils-2.0.3: klibc-utils-poweroff rdepends on libklibc but its not a =
build dependency?
klibc-utils-2.0.3: klibc-utils-readlink rdepends on libklibc but its not a =
build dependency?
klibc-utils-2.0.3: klibc-utils-reboot rdepends on libklibc but its not a bu=
ild dependency?
klibc-utils-2.0.3: klibc-utils-resume rdepends on libklibc but its not a bu=
ild dependency?
klibc-utils-2.0.3: klibc-utils-run-init rdepends on libklibc but its not a =
build dependency?
klibc-utils-2.0.3: klibc-utils-sh.shared rdepends on libklibc but its not a=
 build dependency?
klibc-utils-2.0.3: klibc-utils-sleep rdepends on libklibc but its not a bui=
ld dependency?
klibc-utils-2.0.3: klibc-utils-sync rdepends on libklibc but its not a buil=
d dependency?
klibc-utils-2.0.3: klibc-utils-true rdepends on libklibc but its not a buil=
d dependency?
klibc-utils-2.0.3: klibc-utils-umount rdepends on libklibc but its not a bu=
ild dependency?
klibc-utils-2.0.3: klibc-utils-uname rdepends on libklibc but its not a bui=
ld dependency?
klibc-utils-2.0.3: klibc-utils-zcat rdepends on libklibc but its not a buil=
d dependency?
leptonica-1.70: leptonica rdepends on giflib but its not a build dependency?
libarchive-3.1.2: libarchive rdepends on nettle but its not a build depende=
ncy?
libarchive-3.1.2: libarchive-bin rdepends on nettle but its not a build dep=
endency?
liberation-fonts-1.04: liberation-fonts rdepends on fontconfig-utils but it=
s not a build dependency?
libextutils-helpers-perl-0.022: libextutils-helpers-perl rdepends on perl-m=
odule-module-load but its not a build dependency?
libmicrohttpd-0.9.34: libmicrohttpd rdepends on libssl but its not a build =
dependency?
libmicrohttpd-0.9.34: libmicrohttpd-bin rdepends on file but its not a buil=
d dependency?
libmikmod-3.3.6: libmikmod rdepends on dbus-lib but its not a build depende=
ncy?
libmikmod-3.3.6: libmikmod rdepends on json-c but its not a build dependenc=
y?
libmikmod-3.3.6: libmikmod rdepends on libcap but its not a build dependenc=
y?
libmikmod-3.3.6: libmikmod rdepends on libice but its not a build dependenc=
y?
libmikmod-3.3.6: libmikmod rdepends on libpulse but its not a build depende=
ncy?
libmikmod-3.3.6: libmikmod rdepends on libpulse-simple but its not a build =
dependency?
libmikmod-3.3.6: libmikmod rdepends on libsm but its not a build dependency?
libmikmod-3.3.6: libmikmod rdepends on libsndfile1 but its not a build depe=
ndency?
libmikmod-3.3.6: libmikmod rdepends on libx11 but its not a build dependenc=
y?
libmikmod-3.3.6: libmikmod rdepends on libx11-xcb but its not a build depen=
dency?
libmikmod-3.3.6: libmikmod rdepends on libxau but its not a build dependenc=
y?
libmikmod-3.3.6: libmikmod rdepends on libxcb but its not a build dependenc=
y?
libmikmod-3.3.6: libmikmod rdepends on libxdmcp but its not a build depende=
ncy?
libmikmod-3.3.6: libmikmod rdepends on libxext but its not a build dependen=
cy?
libmikmod-3.3.6: libmikmod rdepends on libxi but its not a build dependency?
libmikmod-3.3.6: libmikmod rdepends on libxtst but its not a build dependen=
cy?
libmikmod-3.3.6: libmikmod rdepends on util-linux-libuuid but its not a bui=
ld dependency?
libmodule-build-tiny-perl-0.036: libmodule-build-tiny-perl rdepends on perl=
-module-cpan-meta but its not a build dependency?
libmodule-build-tiny-perl-0.036: libmodule-build-tiny-perl rdepends on perl=
-module-module-load but its not a build dependency?
liboauth-1.0.3: liboauth rdepends on libcrypto but its not a build dependen=
cy?
libungif-4.1.4: libungif rdepends on libice but its not a build dependency?
libungif-4.1.4: libungif rdepends on libsm but its not a build dependency?
libungif-4.1.4: libungif rdepends on libx11 but its not a build dependency?
libungif-4.1.4: libungif rdepends on libxau but its not a build dependency?
libungif-4.1.4: libungif rdepends on libxcb but its not a build dependency?
libungif-4.1.4: libungif rdepends on libxdmcp but its not a build dependenc=
y?
libungif-4.1.4: libungif rdepends on util-linux-libuuid but its not a build=
 dependency?
libungif-4.1.4: libungif-utils rdepends on libx11 but its not a build depen=
dency?
libwebp-0.4.0: libwebp-bin rdepends on libgl-mesa but its not a build depen=
dency?
libwebp-0.4.0: libwebp-bin rdepends on mesa-glut but its not a build depend=
ency?
libwebp-0.4.0: libwebp-gif2webp rdepends on giflib but its not a build depe=
ndency?
libxklavier-5.3: libxklavier rdepends on libxml2 but its not a build depend=
ency?
ltrace-git: ltrace rdepends on libunwind but its not a build dependency?
midori-0.5.5: midori rdepends on libxscrnsaver but its not a build dependen=
cy?
mozjs-17.0.0: libmozjs rdepends on zlib but its not a build dependency?
mozjs-17.0.0: mozjs rdepends on zlib but its not a build dependency?
mpd-0.18.9: mpd rdepends on libjack but its not a build dependency?
mpd-0.18.9: mpd rdepends on libopus but its not a build dependency?
mpd-0.18.9: mpd rdepends on libwrap but its not a build dependency?
mpd-0.18.9: mpd rdepends on yajl but its not a build dependency?
mpeg2dec-0.4.1: mpeg2dec rdepends on libxext but its not a build dependency?
mpeg2dec-0.4.1: mpeg2dec rdepends on libxv but its not a build dependency?
mpg123-1.19.0: mpg123 rdepends on audiofile but its not a build dependency?
mpg123-1.19.0: mpg123 rdepends on esound but its not a build dependency?
mpg123-1.19.0: mpg123 rdepends on libjack but its not a build dependency?
mpg123-1.19.0: mpg123 rdepends on libsdl but its not a build dependency?
mpg123-1.19.0: mpg123 rdepends on portaudio-v19 but its not a build depende=
ncy?
mpg123-1.19.0: mpg123 rdepends on tslib but its not a build dependency?
oscam-1.10+9164: oscam rdepends on pcsc-lite-lib but its not a build depend=
ency?
perf-1.0: perf rdepends on libunwind but its not a build dependency?
piglit-1.0+gitrAUTOINC+bbeff5d21b: piglit rdepends on libxrender but its no=
t a build dependency?
protobuf-2.4.1: protobuf rdepends on zlib but its not a build dependency?
qemu-2.0.0: qemu rdepends on libusb1 but its not a build dependency?
qtimageformats-5.3.1: qtimageformats-plugins rdepends on jasper but its not=
 a build dependency?
qttools-5.3.1: qttools-plugins rdepends on qtwebkit but its not a build dep=
endency?
qttools-5.3.1: qttools-tools rdepends on qtwebkit but its not a build depen=
dency?
rtorrent-0.9.3: rtorrent rdepends on ncurses-libncursesw but its not a buil=
d dependency?
rtorrent-0.9.3: rtorrent rdepends on ncurses-libtinfo but its not a build d=
ependency?
sox-14.4.0: sox rdepends on libvorbis but its not a build dependency?
stunnel-4.56: stunnel rdepends on libwrap but its not a build dependency?
stunnel-4.56: stunnel rdepends on zlib but its not a build dependency?
synergy-1.3.8: synergy rdepends on libxinerama but its not a build dependen=
cy?
terminus-font-4.38: terminus-font-pcf rdepends on fontconfig-utils but its =
not a build dependency?
tesseract-3.02.02: tesseract rdepends on giflib but its not a build depende=
ncy?
tnftp-20130505: tnftp rdepends on libcrypto but its not a build dependency?
tnftp-20130505: tnftp rdepends on libssl but its not a build dependency?
tracker-0.14.2: tracker rdepends on enca but its not a build dependency?
tracker-0.14.2: tracker rdepends on gtk+3 but its not a build dependency?
tracker-0.14.2: tracker rdepends on libgee but its not a build dependency?
tracker-0.14.2: tracker rdepends on libgnome-keyring but its not a build de=
pendency?
tracker-0.14.2: tracker rdepends on libunistring but its not a build depend=
ency?
tracker-0.14.2: tracker rdepends on upower but its not a build dependency?
tracker-0.14.2: tracker-dev rdepends on enca but its not a build dependency?
tracker-0.14.2: tracker-dev rdepends on giflib but its not a build dependen=
cy?
tracker-0.14.2: tracker-dev rdepends on lcms but its not a build dependency?
tracker-0.14.2: tracker-dev rdepends on libgstpbutils-0.10 but its not a bu=
ild dependency?
tracker-0.14.2: tracker-dev rdepends on libgsttag-0.10 but its not a build =
dependency?
tracker-0.14.2: tracker-dev rdepends on liblzma but its not a build depende=
ncy?
tracker-0.14.2: tracker-dev rdepends on libpoppler but its not a build depe=
ndency?
tracker-0.14.2: tracker-dev rdepends on libpoppler-glib but its not a build=
 dependency?
tracker-0.14.2: tracker-dev rdepends on libunistring but its not a build de=
pendency?
tracker-0.14.2: tracker-dev rdepends on taglib but its not a build dependen=
cy?
tracker-0.14.2: tracker-dev rdepends on taglib-c but its not a build depend=
ency?
tracker-0.14.2: tracker-dev rdepends on tiff but its not a build dependency?
ttf-arphic-uming-20080216: ttf-arphic-uming rdepends on fontconfig-utils bu=
t its not a build dependency?
ttf-bitstream-vera-1.10: ttf-bitstream-vera rdepends on fontconfig-utils bu=
t its not a build dependency?
ttf-dejavu-2.23: ttf-dejavu-sans rdepends on fontconfig-utils but its not a=
 build dependency?
ttf-dejavu-2.23: ttf-dejavu-sans-condensed rdepends on fontconfig-utils but=
 its not a build dependency?
ttf-dejavu-2.23: ttf-dejavu-sans-mono rdepends on fontconfig-utils but its =
not a build dependency?
ttf-dejavu-2.23: ttf-dejavu-serif rdepends on fontconfig-utils but its not =
a build dependency?
ttf-dejavu-2.23: ttf-dejavu-serif-condensed rdepends on fontconfig-utils bu=
t its not a build dependency?
ttf-droid-0.1+gitrAUTOINC+21e6e2de1f: ttf-droid-sans rdepends on fontconfig=
-utils but its not a build dependency?
ttf-droid-0.1+gitrAUTOINC+21e6e2de1f: ttf-droid-sans-fallback rdepends on f=
ontconfig-utils but its not a build dependency?
ttf-droid-0.1+gitrAUTOINC+21e6e2de1f: ttf-droid-sans-japanese rdepends on f=
ontconfig-utils but its not a build dependency?
ttf-droid-0.1+gitrAUTOINC+21e6e2de1f: ttf-droid-sans-mono rdepends on fontc=
onfig-utils but its not a build dependency?
ttf-droid-0.1+gitrAUTOINC+21e6e2de1f: ttf-droid-serif rdepends on fontconfi=
g-utils but its not a build dependency?
ttf-gentium-1.02: ttf-gentium rdepends on fontconfig-utils but its not a bu=
ild dependency?
ttf-gentium-1.02: ttf-gentium-alt rdepends on fontconfig-utils but its not =
a build dependency?
ttf-hunkyfonts-0.3.0: ttf-hunky-sans rdepends on fontconfig-utils but its n=
ot a build dependency?
ttf-hunkyfonts-0.3.0: ttf-hunky-serif rdepends on fontconfig-utils but its =
not a build dependency?
ttf-inconsolata-20100526: ttf-inconsolata rdepends on fontconfig-utils but =
its not a build dependency?
ttf-liberation-0.2: ttf-liberation-mono rdepends on fontconfig-utils but it=
s not a build dependency?
ttf-liberation-0.2: ttf-liberation-sans rdepends on fontconfig-utils but it=
s not a build dependency?
ttf-liberation-0.2: ttf-liberation-serif rdepends on fontconfig-utils but i=
ts not a build dependency?
ttf-mplus-027: ttf-mplus-1c-black rdepends on fontconfig-utils but its not =
a build dependency?
ttf-mplus-027: ttf-mplus-1c-black rdepends on ttf-common but its not a buil=
d dependency?
ttf-mplus-027: ttf-mplus-1c-bold rdepends on fontconfig-utils but its not a=
 build dependency?
ttf-mplus-027: ttf-mplus-1c-bold rdepends on ttf-common but its not a build=
 dependency?
ttf-mplus-027: ttf-mplus-1c-heavy rdepends on fontconfig-utils but its not =
a build dependency?
ttf-mplus-027: ttf-mplus-1c-heavy rdepends on ttf-common but its not a buil=
d dependency?
ttf-mplus-027: ttf-mplus-1c-light rdepends on fontconfig-utils but its not =
a build dependency?
ttf-mplus-027: ttf-mplus-1c-light rdepends on ttf-common but its not a buil=
d dependency?
ttf-mplus-027: ttf-mplus-1c-medium rdepends on fontconfig-utils but its not=
 a build dependency?
ttf-mplus-027: ttf-mplus-1c-medium rdepends on ttf-common but its not a bui=
ld dependency?
ttf-mplus-027: ttf-mplus-1c-regular rdepends on fontconfig-utils but its no=
t a build dependency?
ttf-mplus-027: ttf-mplus-1c-regular rdepends on ttf-common but its not a bu=
ild dependency?
ttf-mplus-027: ttf-mplus-1c-thin rdepends on fontconfig-utils but its not a=
 build dependency?
ttf-mplus-027: ttf-mplus-1c-thin rdepends on ttf-common but its not a build=
 dependency?
ttf-mplus-027: ttf-mplus-1m-bold rdepends on fontconfig-utils but its not a=
 build dependency?
ttf-mplus-027: ttf-mplus-1m-bold rdepends on ttf-common but its not a build=
 dependency?
ttf-mplus-027: ttf-mplus-1m-light rdepends on fontconfig-utils but its not =
a build dependency?
ttf-mplus-027: ttf-mplus-1m-light rdepends on ttf-common but its not a buil=
d dependency?
ttf-mplus-027: ttf-mplus-1m-medium rdepends on fontconfig-utils but its not=
 a build dependency?
ttf-mplus-027: ttf-mplus-1m-medium rdepends on ttf-common but its not a bui=
ld dependency?
ttf-mplus-027: ttf-mplus-1m-regular rdepends on fontconfig-utils but its no=
t a build dependency?
ttf-mplus-027: ttf-mplus-1m-regular rdepends on ttf-common but its not a bu=
ild dependency?
ttf-mplus-027: ttf-mplus-1m-thin rdepends on fontconfig-utils but its not a=
 build dependency?
ttf-mplus-027: ttf-mplus-1m-thin rdepends on ttf-common but its not a build=
 dependency?
ttf-mplus-027: ttf-mplus-1mn-bold rdepends on fontconfig-utils but its not =
a build dependency?
ttf-mplus-027: ttf-mplus-1mn-bold rdepends on ttf-common but its not a buil=
d dependency?
ttf-mplus-027: ttf-mplus-1mn-light rdepends on fontconfig-utils but its not=
 a build dependency?
ttf-mplus-027: ttf-mplus-1mn-light rdepends on ttf-common but its not a bui=
ld dependency?
ttf-mplus-027: ttf-mplus-1mn-medium rdepends on fontconfig-utils but its no=
t a build dependency?
ttf-mplus-027: ttf-mplus-1mn-medium rdepends on ttf-common but its not a bu=
ild dependency?
ttf-mplus-027: ttf-mplus-1mn-regular rdepends on fontconfig-utils but its n=
ot a build dependency?
ttf-mplus-027: ttf-mplus-1mn-regular rdepends on ttf-common but its not a b=
uild dependency?
ttf-mplus-027: ttf-mplus-1mn-thin rdepends on fontconfig-utils but its not =
a build dependency?
ttf-mplus-027: ttf-mplus-1mn-thin rdepends on ttf-common but its not a buil=
d dependency?
ttf-mplus-027: ttf-mplus-1p-black rdepends on fontconfig-utils but its not =
a build dependency?
ttf-mplus-027: ttf-mplus-1p-black rdepends on ttf-common but its not a buil=
d dependency?
ttf-mplus-027: ttf-mplus-1p-bold rdepends on fontconfig-utils but its not a=
 build dependency?
ttf-mplus-027: ttf-mplus-1p-bold rdepends on ttf-common but its not a build=
 dependency?
ttf-mplus-027: ttf-mplus-1p-heavy rdepends on fontconfig-utils but its not =
a build dependency?
ttf-mplus-027: ttf-mplus-1p-heavy rdepends on ttf-common but its not a buil=
d dependency?
ttf-mplus-027: ttf-mplus-1p-light rdepends on fontconfig-utils but its not =
a build dependency?
ttf-mplus-027: ttf-mplus-1p-light rdepends on ttf-common but its not a buil=
d dependency?
ttf-mplus-027: ttf-mplus-1p-medium rdepends on fontconfig-utils but its not=
 a build dependency?
ttf-mplus-027: ttf-mplus-1p-medium rdepends on ttf-common but its not a bui=
ld dependency?
ttf-mplus-027: ttf-mplus-1p-regular rdepends on fontconfig-utils but its no=
t a build dependency?
ttf-mplus-027: ttf-mplus-1p-regular rdepends on ttf-common but its not a bu=
ild dependency?
ttf-mplus-027: ttf-mplus-1p-thin rdepends on fontconfig-utils but its not a=
 build dependency?
ttf-mplus-027: ttf-mplus-1p-thin rdepends on ttf-common but its not a build=
 dependency?
ttf-mplus-027: ttf-mplus-2c-black rdepends on fontconfig-utils but its not =
a build dependency?
ttf-mplus-027: ttf-mplus-2c-black rdepends on ttf-common but its not a buil=
d dependency?
ttf-mplus-027: ttf-mplus-2c-bold rdepends on fontconfig-utils but its not a=
 build dependency?
ttf-mplus-027: ttf-mplus-2c-bold rdepends on ttf-common but its not a build=
 dependency?
ttf-mplus-027: ttf-mplus-2c-heavy rdepends on fontconfig-utils but its not =
a build dependency?
ttf-mplus-027: ttf-mplus-2c-heavy rdepends on ttf-common but its not a buil=
d dependency?
ttf-mplus-027: ttf-mplus-2c-light rdepends on fontconfig-utils but its not =
a build dependency?
ttf-mplus-027: ttf-mplus-2c-light rdepends on ttf-common but its not a buil=
d dependency?
ttf-mplus-027: ttf-mplus-2c-medium rdepends on fontconfig-utils but its not=
 a build dependency?
ttf-mplus-027: ttf-mplus-2c-medium rdepends on ttf-common but its not a bui=
ld dependency?
ttf-mplus-027: ttf-mplus-2c-regular rdepends on fontconfig-utils but its no=
t a build dependency?
ttf-mplus-027: ttf-mplus-2c-regular rdepends on ttf-common but its not a bu=
ild dependency?
ttf-mplus-027: ttf-mplus-2c-thin rdepends on fontconfig-utils but its not a=
 build dependency?
ttf-mplus-027: ttf-mplus-2c-thin rdepends on ttf-common but its not a build=
 dependency?
ttf-mplus-027: ttf-mplus-2m-bold rdepends on fontconfig-utils but its not a=
 build dependency?
ttf-mplus-027: ttf-mplus-2m-bold rdepends on ttf-common but its not a build=
 dependency?
ttf-mplus-027: ttf-mplus-2m-light rdepends on fontconfig-utils but its not =
a build dependency?
ttf-mplus-027: ttf-mplus-2m-light rdepends on ttf-common but its not a buil=
d dependency?
ttf-mplus-027: ttf-mplus-2m-medium rdepends on fontconfig-utils but its not=
 a build dependency?
ttf-mplus-027: ttf-mplus-2m-medium rdepends on ttf-common but its not a bui=
ld dependency?
ttf-mplus-027: ttf-mplus-2m-regular rdepends on fontconfig-utils but its no=
t a build dependency?
ttf-mplus-027: ttf-mplus-2m-regular rdepends on ttf-common but its not a bu=
ild dependency?
ttf-mplus-027: ttf-mplus-2m-thin rdepends on fontconfig-utils but its not a=
 build dependency?
ttf-mplus-027: ttf-mplus-2m-thin rdepends on ttf-common but its not a build=
 dependency?
ttf-mplus-027: ttf-mplus-2p-black rdepends on fontconfig-utils but its not =
a build dependency?
ttf-mplus-027: ttf-mplus-2p-black rdepends on ttf-common but its not a buil=
d dependency?
ttf-mplus-027: ttf-mplus-2p-bold rdepends on fontconfig-utils but its not a=
 build dependency?
ttf-mplus-027: ttf-mplus-2p-bold rdepends on ttf-common but its not a build=
 dependency?
ttf-mplus-027: ttf-mplus-2p-heavy rdepends on fontconfig-utils but its not =
a build dependency?
ttf-mplus-027: ttf-mplus-2p-heavy rdepends on ttf-common but its not a buil=
d dependency?
ttf-mplus-027: ttf-mplus-2p-light rdepends on fontconfig-utils but its not =
a build dependency?
ttf-mplus-027: ttf-mplus-2p-light rdepends on ttf-common but its not a buil=
d dependency?
ttf-mplus-027: ttf-mplus-2p-medium rdepends on fontconfig-utils but its not=
 a build dependency?
ttf-mplus-027: ttf-mplus-2p-medium rdepends on ttf-common but its not a bui=
ld dependency?
ttf-mplus-027: ttf-mplus-2p-regular rdepends on fontconfig-utils but its no=
t a build dependency?
ttf-mplus-027: ttf-mplus-2p-regular rdepends on ttf-common but its not a bu=
ild dependency?
ttf-mplus-027: ttf-mplus-2p-thin rdepends on fontconfig-utils but its not a=
 build dependency?
ttf-mplus-027: ttf-mplus-2p-thin rdepends on ttf-common but its not a build=
 dependency?
ttf-sazanami-20040629: ttf-sazanami-gothic rdepends on fontconfig-utils but=
 its not a build dependency?
ttf-sazanami-20040629: ttf-sazanami-mincho rdepends on fontconfig-utils but=
 its not a build dependency?
ttf-ubuntu-font-family-0.80: ttf-ubuntu-mono rdepends on fontconfig-utils b=
ut its not a build dependency?
ttf-ubuntu-font-family-0.80: ttf-ubuntu-sans rdepends on fontconfig-utils b=
ut its not a build dependency?
ttf-wqy-zenhei-0.6.26: ttf-wqy-zenhei rdepends on fontconfig-utils but its =
not a build dependency?
xf86-video-intel-2.99.910: xf86-video-intel rdepends on libxcursor but its =
not a build dependency?
xf86-video-intel-2.99.910: xf86-video-intel rdepends on libxinerama but its=
 not a build dependency?
xf86-video-intel-2.99.910: xf86-video-intel rdepends on libxrandr but its n=
ot a build dependency?
xf86-video-intel-2.99.910: xf86-video-intel rdepends on libxrender but its =
not a build dependency?
xf86-video-intel-2.99.910: xf86-video-intel rdepends on libxtst but its not=
 a build dependency?
xserver-xorg-1.15.1: xserver-xorg rdepends on nettle but its not a build de=
pendency?
xserver-xorg-1.15.1: xserver-xorg-xvfb rdepends on nettle but its not a bui=
ld dependency?
xwd-1.0.6: xwd rdepends on libxkbfile but its not a build dependency?

and this is from slightly newer version of the check:
ccid rdepends on flex but its not a build dependency? [build-deps]
dconf-editor rdepends on libxml2 but its not a build dependency? [build-dep=
s]
directfb rdepends on libdrm but its not a build dependency? [build-deps]
directfb rdepends on libdrm-kms but its not a build dependency? [build-deps]
directfb rdepends on liblzma but its not a build dependency? [build-deps]
directfb rdepends on tiff but its not a build dependency? [build-deps]
epiphany rdepends on libavahi-client but its not a build dependency? [build=
-deps]
epiphany rdepends on libavahi-common but its not a build dependency? [build=
-deps]
epiphany rdepends on libavahi-gobject but its not a build dependency? [buil=
d-deps]
epiphany rdepends on libnotify but its not a build dependency? [build-deps]
evopedia rdepends on libbz2 but its not a build dependency? [build-deps]
expedite rdepends on evas-engine-fb but its not a build dependency? [build-=
deps]
expedite rdepends on evas-engine-software-generic but its not a build depen=
dency? [build-deps]
expedite rdepends on evas-loader-png but its not a build dependency? [build=
-deps]
expedite rdepends on libsdl but its not a build dependency? [build-deps]
gammu rdepends on glib-2.0 but its not a build dependency? [build-deps]
gammu rdepends on libgudev-1.0 but its not a build dependency? [build-deps]
gd rdepends on liblzma but its not a build dependency? [build-deps]
gd rdepends on tiff but its not a build dependency? [build-deps]
gnome-disk-utility-libs rdepends on libgnome-keyring but its not a build de=
pendency? [build-deps]
gtksourceview2 rdepends on libxml2 but its not a build dependency? [build-d=
eps]
klibc-utils-cat rdepends on libklibc but its not a build dependency? [build=
-deps]
klibc-utils-chroot rdepends on libklibc but its not a build dependency? [bu=
ild-deps]
klibc-utils-cpio rdepends on libklibc but its not a build dependency? [buil=
d-deps]
klibc-utils-dd rdepends on libklibc but its not a build dependency? [build-=
deps]
klibc-utils-dmesg rdepends on libklibc but its not a build dependency? [bui=
ld-deps]
klibc-utils-false rdepends on libklibc but its not a build dependency? [bui=
ld-deps]
klibc-utils-fstype rdepends on libklibc but its not a build dependency? [bu=
ild-deps]
klibc-utils-gunzip rdepends on libklibc but its not a build dependency? [bu=
ild-deps]
klibc-utils-gzip rdepends on libklibc but its not a build dependency? [buil=
d-deps]
klibc-utils-halt rdepends on libklibc but its not a build dependency? [buil=
d-deps]
klibc-utils-ipconfig rdepends on libklibc but its not a build dependency? [=
build-deps]
klibc-utils-kill rdepends on libklibc but its not a build dependency? [buil=
d-deps]
klibc-utils-kinit rdepends on libklibc but its not a build dependency? [bui=
ld-deps]
klibc-utils-kinit.shared rdepends on libklibc but its not a build dependenc=
y? [build-deps]
klibc-utils-ln rdepends on libklibc but its not a build dependency? [build-=
deps]
klibc-utils-losetup rdepends on libklibc but its not a build dependency? [b=
uild-deps]
klibc-utils-ls rdepends on libklibc but its not a build dependency? [build-=
deps]
klibc-utils-minips rdepends on libklibc but its not a build dependency? [bu=
ild-deps]
klibc-utils-mkdir rdepends on libklibc but its not a build dependency? [bui=
ld-deps]
klibc-utils-mkfifo rdepends on libklibc but its not a build dependency? [bu=
ild-deps]
klibc-utils-mknod rdepends on libklibc but its not a build dependency? [bui=
ld-deps]
klibc-utils-mount rdepends on libklibc but its not a build dependency? [bui=
ld-deps]
klibc-utils-mv rdepends on libklibc but its not a build dependency? [build-=
deps]
klibc-utils-nfsmount rdepends on libklibc but its not a build dependency? [=
build-deps]
klibc-utils-nuke rdepends on libklibc but its not a build dependency? [buil=
d-deps]
klibc-utils-pivot-root rdepends on libklibc but its not a build dependency?=
 [build-deps]
klibc-utils-poweroff rdepends on libklibc but its not a build dependency? [=
build-deps]
klibc-utils-readlink rdepends on libklibc but its not a build dependency? [=
build-deps]
klibc-utils-reboot rdepends on libklibc but its not a build dependency? [bu=
ild-deps]
klibc-utils-resume rdepends on libklibc but its not a build dependency? [bu=
ild-deps]
klibc-utils-run-init rdepends on libklibc but its not a build dependency? [=
build-deps]
klibc-utils-sh.shared rdepends on libklibc but its not a build dependency? =
[build-deps]
klibc-utils-sleep rdepends on libklibc but its not a build dependency? [bui=
ld-deps]
klibc-utils-sync rdepends on libklibc but its not a build dependency? [buil=
d-deps]
klibc-utils-true rdepends on libklibc but its not a build dependency? [buil=
d-deps]
klibc-utils-umount rdepends on libklibc but its not a build dependency? [bu=
ild-deps]
klibc-utils-uname rdepends on libklibc but its not a build dependency? [bui=
ld-deps]
klibc-utils-zcat rdepends on libklibc but its not a build dependency? [buil=
d-deps]
leptonica rdepends on giflib but its not a build dependency? [build-deps]
libarchive rdepends on nettle but its not a build dependency? [build-deps]
libarchive-bin rdepends on nettle but its not a build dependency? [build-de=
ps]
liberation-fonts rdepends on fontconfig-utils but its not a build dependenc=
y? [build-deps]
libextutils-helpers-perl rdepends on perl-module-module-load but its not a =
build dependency? [build-deps]
libgammu rdepends on glib-2.0 but its not a build dependency? [build-deps]
libmikmod rdepends on dbus-lib but its not a build dependency? [build-deps]
libmikmod rdepends on json-c but its not a build dependency? [build-deps]
libmikmod rdepends on libcap but its not a build dependency? [build-deps]
libmikmod rdepends on libice but its not a build dependency? [build-deps]
libmikmod rdepends on libpulse but its not a build dependency? [build-deps]
libmikmod rdepends on libpulse-simple but its not a build dependency? [buil=
d-deps]
libmikmod rdepends on libsm but its not a build dependency? [build-deps]
libmikmod rdepends on libsndfile1 but its not a build dependency? [build-de=
ps]
libmikmod rdepends on libx11 but its not a build dependency? [build-deps]
libmikmod rdepends on libx11-xcb but its not a build dependency? [build-dep=
s]
libmikmod rdepends on libxau but its not a build dependency? [build-deps]
libmikmod rdepends on libxcb but its not a build dependency? [build-deps]
libmikmod rdepends on libxdmcp but its not a build dependency? [build-deps]
libmikmod rdepends on libxext but its not a build dependency? [build-deps]
libmikmod rdepends on libxi but its not a build dependency? [build-deps]
libmikmod rdepends on libxtst but its not a build dependency? [build-deps]
libmikmod rdepends on util-linux-libuuid but its not a build dependency? [b=
uild-deps]
libmozjs rdepends on zlib but its not a build dependency? [build-deps]
liboauth rdepends on libcrypto but its not a build dependency? [build-deps]
libpurple-plugin-ssl-gnutls rdepends on libgcrypt but its not a build depen=
dency? [build-deps]
libpurple-plugin-ssl-gnutls rdepends on libgpg-error but its not a build de=
pendency? [build-deps]
libungif rdepends on libice but its not a build dependency? [build-deps]
libungif rdepends on libsm but its not a build dependency? [build-deps]
libungif rdepends on libx11 but its not a build dependency? [build-deps]
libungif rdepends on libxau but its not a build dependency? [build-deps]
libungif rdepends on libxcb but its not a build dependency? [build-deps]
libungif rdepends on libxdmcp but its not a build dependency? [build-deps]
libungif rdepends on util-linux-libuuid but its not a build dependency? [bu=
ild-deps]
libungif-utils rdepends on libx11 but its not a build dependency? [build-de=
ps]
libxklavier rdepends on libxml2 but its not a build dependency? [build-deps]
ltrace rdepends on libunwind but its not a build dependency? [build-deps]
midori rdepends on libxscrnsaver but its not a build dependency? [build-dep=
s]
mozjs rdepends on zlib but its not a build dependency? [build-deps]
mpd rdepends on libjack but its not a build dependency? [build-deps]
mpd rdepends on libopus but its not a build dependency? [build-deps]
mpd rdepends on libwrap but its not a build dependency? [build-deps]
mpd rdepends on yajl but its not a build dependency? [build-deps]
mpeg2dec rdepends on libxext but its not a build dependency? [build-deps]
mpeg2dec rdepends on libxv but its not a build dependency? [build-deps]
oscam rdepends on pcsc-lite-lib but its not a build dependency? [build-deps]
perf rdepends on libunwind but its not a build dependency? [build-deps]
piglit rdepends on libxrender but its not a build dependency? [build-deps]
protobuf rdepends on zlib but its not a build dependency? [build-deps]
qemu rdepends on libusb1 but its not a build dependency? [build-deps]
qtimageformats-plugins rdepends on jasper but its not a build dependency? [=
build-deps]
qttools-plugins rdepends on qtwebkit but its not a build dependency? [build=
-deps]
qttools-tools rdepends on qtwebkit but its not a build dependency? [build-d=
eps]
stunnel rdepends on libwrap but its not a build dependency? [build-deps]
stunnel rdepends on zlib but its not a build dependency? [build-deps]
synergy rdepends on libxinerama but its not a build dependency? [build-deps]
ttf-arphic-uming rdepends on fontconfig-utils but its not a build dependenc=
y? [build-deps]
ttf-dejavu-sans rdepends on fontconfig-utils but its not a build dependency=
? [build-deps]
ttf-dejavu-sans-condensed rdepends on fontconfig-utils but its not a build =
dependency? [build-deps]
ttf-dejavu-sans-mono rdepends on fontconfig-utils but its not a build depen=
dency? [build-deps]
ttf-dejavu-serif rdepends on fontconfig-utils but its not a build dependenc=
y? [build-deps]
ttf-dejavu-serif-condensed rdepends on fontconfig-utils but its not a build=
 dependency? [build-deps]
ttf-droid-sans rdepends on fontconfig-utils but its not a build dependency?=
 [build-deps]
ttf-droid-sans-fallback rdepends on fontconfig-utils but its not a build de=
pendency? [build-deps]
ttf-droid-sans-japanese rdepends on fontconfig-utils but its not a build de=
pendency? [build-deps]
ttf-droid-sans-mono rdepends on fontconfig-utils but its not a build depend=
ency? [build-deps]
ttf-droid-serif rdepends on fontconfig-utils but its not a build dependency=
? [build-deps]
ttf-gentium rdepends on fontconfig-utils but its not a build dependency? [b=
uild-deps]
ttf-gentium-alt rdepends on fontconfig-utils but its not a build dependency=
? [build-deps]
ttf-inconsolata rdepends on fontconfig-utils but its not a build dependency=
? [build-deps]
ttf-liberation-mono rdepends on fontconfig-utils but its not a build depend=
ency? [build-deps]
ttf-liberation-sans rdepends on fontconfig-utils but its not a build depend=
ency? [build-deps]
ttf-liberation-serif rdepends on fontconfig-utils but its not a build depen=
dency? [build-deps]
ttf-sazanami-gothic rdepends on fontconfig-utils but its not a build depend=
ency? [build-deps]
ttf-sazanami-mincho rdepends on fontconfig-utils but its not a build depend=
ency? [build-deps]
ttf-wqy-zenhei rdepends on fontconfig-utils but its not a build dependency?=
 [build-deps]
vagalume rdepends on libproxy but its not a build dependency? [build-deps]
xserver-xorg rdepends on nettle but its not a build dependency? [build-deps]
xserver-xorg-xvfb rdepends on nettle but its not a build dependency? [build=
-deps]



--vlBIoVqBuM4vJEpx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPHjbUACgkQN1Ujt2V2gBx0kQCeLad3ffVLXoyBX88lsAxU5xy/
XNAAn2buLOtEqQM1bZZJEYmKMVo3Z5pc
=h9LK
-----END PGP SIGNATURE-----

--vlBIoVqBuM4vJEpx--
