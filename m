Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3E64F70675;
	Thu, 24 Jul 2014 10:53:19 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id p10so2606955wes.2
	for <multiple recipients>; Thu, 24 Jul 2014 03:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=kJ34vxO+F51EoMDoIIaVpKpWfqPCn71c7O9xA9FcUCQ=;
	b=UNDoKTmFxam/hVFzb+pxTPUBwObYWNoWfrHdWiws0/0YySd7IZWDxtbzZ5qBkw/OsQ
	60Qf1nrEqXmoaB2axdS7uYkq6jp9T6ZR5v5NWer4I2aYCarmbY3lmL0mLeWcG24g2W0h
	KPDOujZMz/ZVc3pJzzLpNW+Vik9FNmxCi8MukCbjSiyh4n1gMzwoezGF9Qnjp70DPnu2
	gfOECXDCsPidxWp14dAh2ad/5jKAaojKFybDZx8gXLAz/4dZ3ONcMZvn0mwTaNPCRGDL
	GSQ6po2tvbBacoRBWEYquFJIeapEhhe+e9kOlx68RpY/DuUAWxNcYDOXzTVxGKdAsiEB
	9k2Q==
X-Received: by 10.194.90.106 with SMTP id bv10mr11387257wjb.20.1406199200153; 
	Thu, 24 Jul 2014 03:53:20 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fb8sm21556138wib.15.2014.07.24.03.53.18 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Jul 2014 03:53:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 24 Jul 2014 12:53:36 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140724105336.GE2492@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, test-dependencies 2014-07-24
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
X-List-Received-Date: Thu, 24 Jul 2014 10:53:23 -0000
X-Groupsio-MsgNum: 55485
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qxfKREH7IwbezJ+T"
Content-Disposition: inline

--qxfKREH7IwbezJ+T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Another incremental with many fixes for foreign automake and missing
dependencies for m4 macro providers and couple of PNBLACKLISTs.

Complete logs:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20140724_01=
3722.log/

mkvtoolnix is review for new version, it builds fine on 2/3 builders I
have access too, I'll investigate before merging it

firefox is probably fixed by
http://patchwork.openembedded.org/patch/75173/
I'll include this work around in my next world builds

monkey issue is in new review and looked at by submitter

lttng-modules issue was reported on ML and it seems that we can expect
upgrade to newer version soon

openal-soft, gst-ffmpeg aren't compatible with libav-9 now used by world
builds.

packagegroup-shr-feed is here just because of firefox

ERROR: 17 issues were found in these recipes: firefox gst-ffmpeg
lttng-modules mkvtoolnix monkey openal-soft packagegroup-shr-feed

So it looks like we're again in better shape, but something is strange
with this new insane_qa check for build dependencies, since it was
introduced in master-next it finds more issues than test-dependencies.sh
did and vice-versa test-dependencies.sh now doesn't report some issues
which IIRC weren't properly fixed yet. So we need to double check why.

insane_qa check:
dconf-0.18.0: dconf-editor rdepends on libxml2 but its not a build dependen=
cy? [build-deps]
directfb-1.7.4: directfb rdepends on libdrm but its not a build dependency?=
 [build-deps]
directfb-1.7.4: directfb rdepends on libdrm-kms but its not a build depende=
ncy? [build-deps]
directfb-1.7.4: directfb rdepends on liblzma but its not a build dependency=
? [build-deps]
directfb-1.7.4: directfb rdepends on tiff but its not a build dependency? [=
build-deps]
engrave-0.0.0+svnr82070: engrave rdepends on flex but its not a build depen=
dency? [build-deps]
epiphany-2.30.6: epiphany rdepends on libavahi-client but its not a build d=
ependency? [build-deps]
epiphany-2.30.6: epiphany rdepends on libavahi-common but its not a build d=
ependency? [build-deps]
epiphany-2.30.6: epiphany rdepends on libavahi-gobject but its not a build =
dependency? [build-deps]
epiphany-2.30.6: epiphany rdepends on libnotify but its not a build depende=
ncy? [build-deps]
evopedia-0.4.2+gitrAUTOINC+36ca70acb4: evopedia rdepends on libbz2 but its =
not a build dependency? [build-deps]
expedite-1.7.9: expedite rdepends on evas-engine-fb but its not a build dep=
endency? [build-deps]
expedite-1.7.9: expedite rdepends on evas-engine-software-generic but its n=
ot a build dependency? [build-deps]
expedite-1.7.9: expedite rdepends on evas-loader-png but its not a build de=
pendency? [build-deps]
expedite-1.7.9: expedite rdepends on libsdl but its not a build dependency?=
 [build-deps]
gd-2.1.0: gd rdepends on liblzma but its not a build dependency? [build-dep=
s]
gd-2.1.0: gd rdepends on tiff but its not a build dependency? [build-deps]
gimp-2.8.10: gimp rdepends on libbz2 but its not a build dependency? [build=
-deps]
gmtk-1.0.5: gmtk rdepends on gtk+3 but its not a build dependency? [build-d=
eps]
gmtk-1.0.5: gmtk rdepends on json-c but its not a build dependency? [build-=
deps]
gmtk-1.0.5: gmtk rdepends on libcap but its not a build dependency? [build-=
deps]
gmtk-1.0.5: gmtk rdepends on libpulse but its not a build dependency? [buil=
d-deps]
gmtk-1.0.5: gmtk rdepends on libpulse-mainloop-glib but its not a build dep=
endency? [build-deps]
gmtk-1.0.5: gmtk rdepends on libsndfile1 but its not a build dependency? [b=
uild-deps]
gmtk-1.0.5: gmtk rdepends on libxi but its not a build dependency? [build-d=
eps]
gmtk-1.0.5: gmtk rdepends on libxtst but its not a build dependency? [build=
-deps]
gnome-disk-utility-2.32.0: gnome-disk-utility-libs rdepends on libgnome-key=
ring but its not a build dependency? [build-deps]
gtksourceview2-2.10.5: gtksourceview2 rdepends on libxml2 but its not a bui=
ld dependency? [build-deps]
guile-2.0.11: guile rdepends on ncurses-libncurses but its not a build depe=
ndency? [build-deps]
guile-2.0.11: guile rdepends on readline but its not a build dependency? [b=
uild-deps]
kernelshark-1.2+gitAUTOINC+7055ffd37b: kernelshark rdepends on libxml2 but =
its not a build dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-cat rdepends on libklibc but its not a build=
 dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-chroot rdepends on libklibc but its not a bu=
ild dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-cpio rdepends on libklibc but its not a buil=
d dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-dd rdepends on libklibc but its not a build =
dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-dmesg rdepends on libklibc but its not a bui=
ld dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-false rdepends on libklibc but its not a bui=
ld dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-fstype rdepends on libklibc but its not a bu=
ild dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-gunzip rdepends on libklibc but its not a bu=
ild dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-gzip rdepends on libklibc but its not a buil=
d dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-halt rdepends on libklibc but its not a buil=
d dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-ipconfig rdepends on libklibc but its not a =
build dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-kill rdepends on libklibc but its not a buil=
d dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-kinit rdepends on libklibc but its not a bui=
ld dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-kinit.shared rdepends on libklibc but its no=
t a build dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-ln rdepends on libklibc but its not a build =
dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-losetup rdepends on libklibc but its not a b=
uild dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-ls rdepends on libklibc but its not a build =
dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-minips rdepends on libklibc but its not a bu=
ild dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-mkdir rdepends on libklibc but its not a bui=
ld dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-mkfifo rdepends on libklibc but its not a bu=
ild dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-mknod rdepends on libklibc but its not a bui=
ld dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-mount rdepends on libklibc but its not a bui=
ld dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-mv rdepends on libklibc but its not a build =
dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-nfsmount rdepends on libklibc but its not a =
build dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-nuke rdepends on libklibc but its not a buil=
d dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-pivot-root rdepends on libklibc but its not =
a build dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-poweroff rdepends on libklibc but its not a =
build dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-readlink rdepends on libklibc but its not a =
build dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-reboot rdepends on libklibc but its not a bu=
ild dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-resume rdepends on libklibc but its not a bu=
ild dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-run-init rdepends on libklibc but its not a =
build dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-sh.shared rdepends on libklibc but its not a=
 build dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-sleep rdepends on libklibc but its not a bui=
ld dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-sync rdepends on libklibc but its not a buil=
d dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-true rdepends on libklibc but its not a buil=
d dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-umount rdepends on libklibc but its not a bu=
ild dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-uname rdepends on libklibc but its not a bui=
ld dependency? [build-deps]
klibc-utils-2.0.3: klibc-utils-zcat rdepends on libklibc but its not a buil=
d dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-cat rdepends on libklibc but its not a build=
 dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-chroot rdepends on libklibc but its not a bu=
ild dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-cpio rdepends on libklibc but its not a buil=
d dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-dd rdepends on libklibc but its not a build =
dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-dmesg rdepends on libklibc but its not a bui=
ld dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-false rdepends on libklibc but its not a bui=
ld dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-fstype rdepends on libklibc but its not a bu=
ild dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-gunzip rdepends on libklibc but its not a bu=
ild dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-gzip rdepends on libklibc but its not a buil=
d dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-halt rdepends on libklibc but its not a buil=
d dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-ipconfig rdepends on libklibc but its not a =
build dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-kill rdepends on libklibc but its not a buil=
d dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-kinit rdepends on libklibc but its not a bui=
ld dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-kinit.shared rdepends on libklibc but its no=
t a build dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-ln rdepends on libklibc but its not a build =
dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-losetup rdepends on libklibc but its not a b=
uild dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-ls rdepends on libklibc but its not a build =
dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-minips rdepends on libklibc but its not a bu=
ild dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-mkdir rdepends on libklibc but its not a bui=
ld dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-mkfifo rdepends on libklibc but its not a bu=
ild dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-mknod rdepends on libklibc but its not a bui=
ld dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-mount rdepends on libklibc but its not a bui=
ld dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-mv rdepends on libklibc but its not a build =
dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-nfsmount rdepends on libklibc but its not a =
build dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-nuke rdepends on libklibc but its not a buil=
d dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-pivot-root rdepends on libklibc but its not =
a build dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-poweroff rdepends on libklibc but its not a =
build dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-readlink rdepends on libklibc but its not a =
build dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-reboot rdepends on libklibc but its not a bu=
ild dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-resume rdepends on libklibc but its not a bu=
ild dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-run-init rdepends on libklibc but its not a =
build dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-sh.shared rdepends on libklibc but its not a=
 build dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-sleep rdepends on libklibc but its not a bui=
ld dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-sync rdepends on libklibc but its not a buil=
d dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-true rdepends on libklibc but its not a buil=
d dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-umount rdepends on libklibc but its not a bu=
ild dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-uname rdepends on libklibc but its not a bui=
ld dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-zcat rdepends on libklibc but its not a buil=
d dependency? [build-deps]
leptonica-1.70: leptonica rdepends on giflib but its not a build dependency=
? [build-deps]
libarchive-3.1.2: libarchive rdepends on nettle but its not a build depende=
ncy? [build-deps]
libarchive-3.1.2: libarchive-bin rdepends on nettle but its not a build dep=
endency? [build-deps]
libextutils-helpers-perl-0.022: libextutils-helpers-perl rdepends on perl-m=
odule-module-load but its not a build dependency? [build-deps]
libmicrohttpd-0.9.34: libmicrohttpd rdepends on libssl but its not a build =
dependency? [build-deps]
libmicrohttpd-0.9.34: libmicrohttpd-bin rdepends on file but its not a buil=
d dependency? [build-deps]
libmikmod-3.3.6: libmikmod rdepends on dbus-lib but its not a build depende=
ncy? [build-deps]
libmikmod-3.3.6: libmikmod rdepends on json-c but its not a build dependenc=
y? [build-deps]
libmikmod-3.3.6: libmikmod rdepends on libcap but its not a build dependenc=
y? [build-deps]
libmikmod-3.3.6: libmikmod rdepends on libice but its not a build dependenc=
y? [build-deps]
libmikmod-3.3.6: libmikmod rdepends on libpulse but its not a build depende=
ncy? [build-deps]
libmikmod-3.3.6: libmikmod rdepends on libpulse-simple but its not a build =
dependency? [build-deps]
libmikmod-3.3.6: libmikmod rdepends on libsm but its not a build dependency=
? [build-deps]
libmikmod-3.3.6: libmikmod rdepends on libsndfile1 but its not a build depe=
ndency? [build-deps]
libmikmod-3.3.6: libmikmod rdepends on libx11 but its not a build dependenc=
y? [build-deps]
libmikmod-3.3.6: libmikmod rdepends on libx11-xcb but its not a build depen=
dency? [build-deps]
libmikmod-3.3.6: libmikmod rdepends on libxau but its not a build dependenc=
y? [build-deps]
libmikmod-3.3.6: libmikmod rdepends on libxcb but its not a build dependenc=
y? [build-deps]
libmikmod-3.3.6: libmikmod rdepends on libxdmcp but its not a build depende=
ncy? [build-deps]
libmikmod-3.3.6: libmikmod rdepends on libxext but its not a build dependen=
cy? [build-deps]
libmikmod-3.3.6: libmikmod rdepends on libxi but its not a build dependency=
? [build-deps]
libmikmod-3.3.6: libmikmod rdepends on libxtst but its not a build dependen=
cy? [build-deps]
libmikmod-3.3.6: libmikmod rdepends on util-linux-libuuid but its not a bui=
ld dependency? [build-deps]
libmodule-build-tiny-perl-0.036: libmodule-build-tiny-perl rdepends on perl=
-module-cpan-meta but its not a build dependency? [build-deps]
libmodule-build-tiny-perl-0.036: libmodule-build-tiny-perl rdepends on perl=
-module-module-load but its not a build dependency? [build-deps]
libungif-4.1.4: libungif rdepends on libice but its not a build dependency?=
 [build-deps]
libungif-4.1.4: libungif rdepends on libsm but its not a build dependency? =
[build-deps]
libungif-4.1.4: libungif rdepends on libx11 but its not a build dependency?=
 [build-deps]
libungif-4.1.4: libungif rdepends on libxau but its not a build dependency?=
 [build-deps]
libungif-4.1.4: libungif rdepends on libxcb but its not a build dependency?=
 [build-deps]
libungif-4.1.4: libungif rdepends on libxdmcp but its not a build dependenc=
y? [build-deps]
libungif-4.1.4: libungif rdepends on util-linux-libuuid but its not a build=
 dependency? [build-deps]
libungif-4.1.4: libungif-utils rdepends on libx11 but its not a build depen=
dency? [build-deps]
libwebp-0.4.0: libwebp-bin rdepends on libgl-mesa but its not a build depen=
dency? [build-deps]
libwebp-0.4.0: libwebp-bin rdepends on mesa-glut but its not a build depend=
ency? [build-deps]
libwebp-0.4.0: libwebp-gif2webp rdepends on giflib but its not a build depe=
ndency? [build-deps]
libxklavier-5.3: libxklavier rdepends on libxml2 but its not a build depend=
ency? [build-deps]
ltrace-git: ltrace rdepends on libunwind but its not a build dependency? [b=
uild-deps]
midori-0.5.5: midori rdepends on libxscrnsaver but its not a build dependen=
cy? [build-deps]
modemmanager-0.6.0.0: modemmanager rdepends on dbus-glib but its not a buil=
d dependency? [build-deps]
mpd-0.18.9: mpd rdepends on libjack but its not a build dependency? [build-=
deps]
mpd-0.18.9: mpd rdepends on libopus but its not a build dependency? [build-=
deps]
mpd-0.18.9: mpd rdepends on libwrap but its not a build dependency? [build-=
deps]
mpd-0.18.9: mpd rdepends on yajl but its not a build dependency? [build-dep=
s]
mpeg2dec-0.4.1: mpeg2dec rdepends on libxext but its not a build dependency=
? [build-deps]
mpeg2dec-0.4.1: mpeg2dec rdepends on libxv but its not a build dependency? =
[build-deps]
mpg123-1.19.0: mpg123 rdepends on audiofile but its not a build dependency?=
 [build-deps]
mpg123-1.19.0: mpg123 rdepends on esound but its not a build dependency? [b=
uild-deps]
mpg123-1.19.0: mpg123 rdepends on libjack but its not a build dependency? [=
build-deps]
mpg123-1.19.0: mpg123 rdepends on libsdl but its not a build dependency? [b=
uild-deps]
mpg123-1.19.0: mpg123 rdepends on portaudio-v19 but its not a build depende=
ncy? [build-deps]
mpg123-1.19.0: mpg123 rdepends on tslib but its not a build dependency? [bu=
ild-deps]
oscam-1.10+9164: oscam rdepends on pcsc-lite-lib but its not a build depend=
ency? [build-deps]
perf-1.0: perf rdepends on libunwind but its not a build dependency? [build=
-deps]
piglit-1.0+gitrAUTOINC+bbeff5d21b: piglit rdepends on libxrender but its no=
t a build dependency? [build-deps]
protobuf-2.4.1: protobuf rdepends on zlib but its not a build dependency? [=
build-deps]
qemu-2.0.0: qemu rdepends on libusb1 but its not a build dependency? [build=
-deps]
qtimageformats-5.3.1: qtimageformats-plugins rdepends on jasper but its not=
 a build dependency? [build-deps]
qttools-5.3.1: qttools-plugins rdepends on qtwebkit but its not a build dep=
endency? [build-deps]
qttools-5.3.1: qttools-tools rdepends on qtwebkit but its not a build depen=
dency? [build-deps]
snort-2.9.6.0: snort rdepends on util-linux-libuuid but its not a build dep=
endency? [build-deps]
sox-14.4.0: sox rdepends on libvorbis but its not a build dependency? [buil=
d-deps]
stunnel-4.56: stunnel rdepends on libwrap but its not a build dependency? [=
build-deps]
stunnel-4.56: stunnel rdepends on zlib but its not a build dependency? [bui=
ld-deps]
synergy-1.3.8: synergy rdepends on libxinerama but its not a build dependen=
cy? [build-deps]
tesseract-3.02.02: tesseract rdepends on giflib but its not a build depende=
ncy? [build-deps]
tnftp-20130505: tnftp rdepends on libcrypto but its not a build dependency?=
 [build-deps]
tnftp-20130505: tnftp rdepends on libssl but its not a build dependency? [b=
uild-deps]
tracker-0.14.2: tracker rdepends on enca but its not a build dependency? [b=
uild-deps]
tracker-0.14.2: tracker rdepends on gtk+3 but its not a build dependency? [=
build-deps]
tracker-0.14.2: tracker rdepends on libgee but its not a build dependency? =
[build-deps]
tracker-0.14.2: tracker rdepends on libgnome-keyring but its not a build de=
pendency? [build-deps]
tracker-0.14.2: tracker rdepends on libunistring but its not a build depend=
ency? [build-deps]
tracker-0.14.2: tracker rdepends on upower but its not a build dependency? =
[build-deps]
tracker-0.14.2: tracker-dev rdepends on enca but its not a build dependency=
? [build-deps]
tracker-0.14.2: tracker-dev rdepends on giflib but its not a build dependen=
cy? [build-deps]
tracker-0.14.2: tracker-dev rdepends on lcms but its not a build dependency=
? [build-deps]
tracker-0.14.2: tracker-dev rdepends on libgstpbutils-0.10 but its not a bu=
ild dependency? [build-deps]
tracker-0.14.2: tracker-dev rdepends on libgsttag-0.10 but its not a build =
dependency? [build-deps]
tracker-0.14.2: tracker-dev rdepends on liblzma but its not a build depende=
ncy? [build-deps]
tracker-0.14.2: tracker-dev rdepends on libpoppler but its not a build depe=
ndency? [build-deps]
tracker-0.14.2: tracker-dev rdepends on libpoppler-glib but its not a build=
 dependency? [build-deps]
tracker-0.14.2: tracker-dev rdepends on libunistring but its not a build de=
pendency? [build-deps]
tracker-0.14.2: tracker-dev rdepends on taglib but its not a build dependen=
cy? [build-deps]
tracker-0.14.2: tracker-dev rdepends on taglib-c but its not a build depend=
ency? [build-deps]
tracker-0.14.2: tracker-dev rdepends on tiff but its not a build dependency=
? [build-deps]
ttf-mplus-027: ttf-mplus-1c-black rdepends on ttf-common but its not a buil=
d dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1c-bold rdepends on ttf-common but its not a build=
 dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1c-heavy rdepends on ttf-common but its not a buil=
d dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1c-light rdepends on ttf-common but its not a buil=
d dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1c-medium rdepends on ttf-common but its not a bui=
ld dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1c-regular rdepends on ttf-common but its not a bu=
ild dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1c-thin rdepends on ttf-common but its not a build=
 dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1m-bold rdepends on ttf-common but its not a build=
 dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1m-light rdepends on ttf-common but its not a buil=
d dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1m-medium rdepends on ttf-common but its not a bui=
ld dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1m-regular rdepends on ttf-common but its not a bu=
ild dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1m-thin rdepends on ttf-common but its not a build=
 dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1mn-bold rdepends on ttf-common but its not a buil=
d dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1mn-light rdepends on ttf-common but its not a bui=
ld dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1mn-medium rdepends on ttf-common but its not a bu=
ild dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1mn-regular rdepends on ttf-common but its not a b=
uild dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1mn-thin rdepends on ttf-common but its not a buil=
d dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1p-black rdepends on ttf-common but its not a buil=
d dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1p-bold rdepends on ttf-common but its not a build=
 dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1p-heavy rdepends on ttf-common but its not a buil=
d dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1p-light rdepends on ttf-common but its not a buil=
d dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1p-medium rdepends on ttf-common but its not a bui=
ld dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1p-regular rdepends on ttf-common but its not a bu=
ild dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1p-thin rdepends on ttf-common but its not a build=
 dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2c-black rdepends on ttf-common but its not a buil=
d dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2c-bold rdepends on ttf-common but its not a build=
 dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2c-heavy rdepends on ttf-common but its not a buil=
d dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2c-light rdepends on ttf-common but its not a buil=
d dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2c-medium rdepends on ttf-common but its not a bui=
ld dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2c-regular rdepends on ttf-common but its not a bu=
ild dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2c-thin rdepends on ttf-common but its not a build=
 dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2m-bold rdepends on ttf-common but its not a build=
 dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2m-light rdepends on ttf-common but its not a buil=
d dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2m-medium rdepends on ttf-common but its not a bui=
ld dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2m-regular rdepends on ttf-common but its not a bu=
ild dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2m-thin rdepends on ttf-common but its not a build=
 dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2p-black rdepends on ttf-common but its not a buil=
d dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2p-bold rdepends on ttf-common but its not a build=
 dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2p-heavy rdepends on ttf-common but its not a buil=
d dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2p-light rdepends on ttf-common but its not a buil=
d dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2p-medium rdepends on ttf-common but its not a bui=
ld dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2p-regular rdepends on ttf-common but its not a bu=
ild dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2p-thin rdepends on ttf-common but its not a build=
 dependency? [build-deps]
vlc-2.1.4: vlc rdepends on libpostproc but its not a build dependency? [bui=
ld-deps]
webmin-1.620: webmin rdepends on perl-module-timelocal but its not a build =
dependency? [build-deps]
webmin-1.620: webmin-module-proc rdepends on procps but its not a build dep=
endency? [build-deps]
webmin-1.620: webmin-module-raid rdepends on mdadm but its not a build depe=
ndency? [build-deps]
wireshark-1.12.0-rc2: wireshark rdepends on libcap but its not a build depe=
ndency? [build-deps]
wireshark-1.12.0-rc2: wireshark rdepends on libnl but its not a build depen=
dency? [build-deps]
wireshark-1.12.0-rc2: wireshark rdepends on libnl-genl but its not a build =
dependency? [build-deps]
wireshark-1.12.0-rc2: wireshark rdepends on libnl-nf but its not a build de=
pendency? [build-deps]
wireshark-1.12.0-rc2: wireshark rdepends on libnl-route but its not a build=
 dependency? [build-deps]
wireshark-1.12.0-rc2: wireshark rdepends on portaudio-v19 but its not a bui=
ld dependency? [build-deps]
wireshark-1.12.0-rc2: wireshark rdepends on sbc but its not a build depende=
ncy? [build-deps]
xwd-1.0.6: xwd rdepends on libxkbfile but its not a build dependency? [buil=
d-deps]

test-dependencies.sh check:
opencv/libopencv-highgui/latest lost dependency on  jasper libdc1394
snort/snort/latest lost dependency on  util-linux-libuuid
wireshark/wireshark/latest lost dependency on  libcap libnl libnl-genl libn=
l-nf libnl-route portaudio-v19 sbc

As bonus there is separate log file for each failing recipe, see
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20140724_01=
3722.log/3_min/failed/
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20140724_01=
3722.log/2_max/failed/

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qxfKREH7IwbezJ+T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPQ5bAACgkQN1Ujt2V2gByAcACeNIPuCYVJfleJzGERJjqASZCe
eb8AoI/Z0btzEFcppj83vr9fsdvrdhAg
=eusF
-----END PGP SIGNATURE-----

--qxfKREH7IwbezJ+T--
