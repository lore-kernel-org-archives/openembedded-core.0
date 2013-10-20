Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 222506D22B;
	Sun, 20 Oct 2013 19:43:43 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id r16so3063504ead.3
	for <multiple recipients>; Sun, 20 Oct 2013 12:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JsyJid6SgJJtcVpdH/m+lCAq3BzOEQUrU0Vdxf7oZz0=;
	b=In7Vman3xStSEBb6ePF8ouBOq3HKLoAEgYfqGMIzdQcKLNl7vlcjJenOTc/Zvgvnz+
	6P5+ALmzAnHrfj6awdDPEnVmt0QK/2aGaBIF4I+JF2fTMxsH0nzdPTboCHywLM+wFr2i
	WFMtIfJhhN6XK6eKPCHuczd68O+j4DE6LHXco+YS4UPBBdk7ff9j53p5hk2NPKI0wP5A
	Bn5Yi/AYIFV5GtxCdrRq9LG7439xiNvNMsd1MLt6VmxEZdc3PVaeKZFUI2J9hz2AwwG5
	U2LwC8SYA0pym5IWey1twM2P806IPn38+iMAXh44jKBUVa1RJLE3xqLNW7gTjrDEjcyT
	UO1A==
X-Received: by 10.15.68.198 with SMTP id w46mr798140eex.108.1382298225138;
	Sun, 20 Oct 2013 12:43:45 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id e13sm34323506eeu.4.2013.10.20.12.43.44
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Oct 2013 12:43:44 -0700 (PDT)
Date: Sun, 20 Oct 2013 21:43:45 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Message-ID: <20131020194345.GB3709@jama>
References: <20130502151833.GC3206@jama>
	<20130516075215.GA24809@jama.dyndns-home.com>
	<20130520130635.GA32431@jama> <20130603151008.GC3279@jama>
	<20130611160434.GI3233@jama> <20130622181656.GK14021@jama>
	<20130725162341.GA3280@jama> <20130808225419.GB17945@jama>
	<20130811114403.GG17945@jama> <20130917123058.GC7313@jama>
MIME-Version: 1.0
In-Reply-To: <20130917123058.GC7313@jama>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: State of bitbake world
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
X-List-Received-Date: Sun, 20 Oct 2013 19:43:45 -0000
X-Groupsio-MsgNum: 46066
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zCKi3GIZzVBPywwA"
Content-Disposition: inline

--zCKi3GIZzVBPywwA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2013 at 02:30:58PM +0200, Martin Jansa wrote:
> I haven't updated this status for few weeks because there were always
> some issue deeper in the dependency tree so it was hiding a lot of other
> issues, now it's good time to update all qemu* statuses. All these
> builds had both my dependency-fixes patchsets included.
>=20
> qemuarm: Summary: 5 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130915_024550.log
>=20
> qemux86: Summary: 10 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130915_190536.log
>=20
> qemux86-64: Summary: 14 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130916_160509.log
>=20
> common (4):
>   meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb, do_com=
pile
>   meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb, do_ins=
tall
>   meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_compile
>   meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb,=
 do_compile
>=20
> qemuarm (1):
>   openembedded-core/meta/recipes-gnome/gtk+/gtk+_2.24.20.bb, do_compile
>=20
> qemux86* common (5):
>   openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
>   meta-openembedded/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-=
kexecboot_3.8.bb, do_package
>   meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
>   meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compi=
le
>   meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb,=
 do_compile
>=20
> qemux86 (1):
>   meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode=
_2.11.14.bb, do_compile
>=20
> qemux86-64 (5):
>   meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
>   meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimob=
iledevice_1.1.4.bb, do_configure
>   meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.=
bb, do_compile
>   meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_g=
it.bb, do_compile
>   meta-openembedded/meta-oe/recipes-devtools/python/python-m2crypto_0.21.=
1.bb, do_compile

There are few new breakages from new autotools (bit thanks to khem who sent=
 couple of fixes
last week for that) and a lot more QA warnings about configure flags:

qemuarm: Summary: 10 tasks failed:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
31018_210429.log/

qemux86: Summary: 16 tasks failed:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
31020_104715.log/

qemux86-64: Summary: 18 tasks failed:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
31020_145054.log/

common (10):
meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb, do_compile
meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb, do_install
meta-openembedded/meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.bb, do=
_configure
meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_compile
meta-openembedded/meta-oe/recipes-core/libxml/libxml++_2.35.3.bb, do_compile
meta-openembedded/meta-networking/recipes-support/lowpan-tools/lowpan-tools=
_git.bb, do_install
meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb, do_=
compile
meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb, do_=
compile
meta-qt5/recipes-qt/qt5/qtwayland_git.bb, do_configure
meta-smartphone/meta-fso/recipes-freesmartphone/cornucopia/fsogsmd_0.12.0.b=
b, do_compile

qemux86* common (5):
meta-openembedded/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-kli=
bc-image.bb, do_rootfs
openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compile
meta-browser/recipes-browser/chromium/chromium_29.0.1518.2.bb, do_compile

qemux86 (1)
meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.1=
1.14.bb, do_compile

qemux86-64(3)
meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimobiled=
evice_1.1.4.bb, do_configure
meta-openembedded/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb=
, do_compile

QA issues (possibly not all, some packages were reused from sstate):
libtool-cross-2.4.2: libtool-cross: configure was passed unrecognised optio=
ns: --with-sysroot
libxdmcp-1.1.1: libxdmcp: configure was passed unrecognised options: --with=
out-groff --disable-malloc0returnsnull --without-ps2pdf --disable-specs
libxau-1.0.8: libxau: configure was passed unrecognised options: --without-=
xmlto --disable-malloc0returnsnull --without-ps2pdf --without-groff --witho=
ut-fop --disable-specs
xtrans-1.2.7: xtrans: configure was passed unrecognised options: --disable-=
malloc0returnsnull --without-ps2pdf --without-groff --disable-specs
inputproto-2.3: inputproto: configure was passed unrecognised options: --wi=
thout-xmlto --with-fop
renderproto-0.11.1: renderproto: configure was passed unrecognised options:=
 --with-fop --without-xmlto
libx11-1.6.1: libx11: configure was passed unrecognised options: --without-=
groff --without-ps2pdf
libxrender-0.9.8: libxrender: configure was passed unrecognised options: --=
without-groff --without-xmlto --without-fop --without-ps2pdf --disable-specs
util-linux-2.23.2: util-linux: configure was passed unrecognised options: -=
-enable-rdev --enable-init --enable-arch --with-fsprobe
libxext-1.3.2: libxext: configure was passed unrecognised options: --withou=
t-groff --without-ps2pdf
libice-1.0.8: libice: configure was passed unrecognised options: --without-=
groff --disable-malloc0returnsnull --without-ps2pdf
libsm-1.2.2: libsm: configure was passed unrecognised options: --without-gr=
off --disable-malloc0returnsnull --without-ps2pdf --disable-specs
pixman-0.30.2: pixman: configure was passed unrecognised options: --disable=
-malloc0returnsnull
fixesproto-5.0: fixesproto: configure was passed unrecognised options: --wi=
th-fop --without-xmlto
libxfixes-5.0.1: libxfixes: configure was passed unrecognised options: --wi=
thout-xmlto --disable-malloc0returnsnull --without-ps2pdf --without-groff -=
-without-fop --disable-specs
libgcrypt-1.5.3: libgcrypt: configure was passed unrecognised options: --wi=
thout-pth
libxft-2.3.1: libxft: configure was passed unrecognised options: --without-=
xmlto --disable-malloc0returnsnull --without-ps2pdf --without-groff --witho=
ut-fop --disable-specs
damageproto-1.2.1: damageproto: configure was passed unrecognised options: =
--with-fop --without-xmlto
randrproto-1.4.0: randrproto: configure was passed unrecognised options: --=
with-fop --without-xmlto
compositeproto-0.4.2: compositeproto: configure was passed unrecognised opt=
ions: --with-fop --without-xmlto
libxdamage-1.1.4: libxdamage: configure was passed unrecognised options: --=
without-xmlto --disable-malloc0returnsnull --without-ps2pdf --without-groff=
 --without-fop --disable-specs
libxrandr-1.4.1: libxrandr: configure was passed unrecognised options: --wi=
thout-groff --without-xmlto --without-fop --without-ps2pdf --disable-specs
libxcursor-1.1.14: libxcursor: configure was passed unrecognised options: -=
-without-xmlto --disable-malloc0returnsnull --without-ps2pdf --without-grof=
f --without-fop --disable-specs
libxcomposite-0.4.4: libxcomposite: configure was passed unrecognised optio=
ns: --without-groff --disable-malloc0returnsnull --without-fop --without-ps=
2pdf --disable-specs
eet-1.7.8: eet: configure was passed unrecognised options: --enable-cypher =
--disable-coverage
sqlite3-3080002: sqlite3: configure was passed unrecognised options: --disa=
ble-tcl
libxi-1.7.2: libxi: configure was passed unrecognised options: --without-gr=
off --without-ps2pdf
xineramaproto-1.2.1: xineramaproto: configure was passed unrecognised optio=
ns: --with-fop --without-xmlto
evas-1.7.8: evas: configure was passed unrecognised options: --disable-sdl =
--enable-xrender-x11 --disable-glitz-x11 --disable-xrender-xcb --enable-gl-=
x11 --enable-software-x11 --disable-software-qtopia
libxtst-1.2.2: libxtst: configure was passed unrecognised options: --withou=
t-groff --disable-malloc0returnsnull --without-ps2pdf
libxinerama-1.1.3: libxinerama: configure was passed unrecognised options: =
--without-groff --without-xmlto --without-fop --without-ps2pdf --disable-sp=
ecs
libxscrnsaver-1.2.2: libxscrnsaver: configure was passed unrecognised optio=
ns: --without-groff --without-xmlto --without-fop --without-ps2pdf --disabl=
e-specs
alsa-lib-1.0.27.2: alsa-lib: configure was passed unrecognised options: --w=
ith-cards --with-oss
python-2.7.3: python: configure was passed unrecognised options: --without-=
cxx --with-cyclic-gc
ecore-1.7.8: ecore: configure was passed unrecognised options: --disable-ec=
ore-desktop --enable-ecore-config --disable-ecore-evas-dfb --enable-ecore-e=
vas-xrender --enable-ecore-job --disable-ecore-evas-sdl
gstreamer-0.10.36: gstreamer: configure was passed unrecognised options: --=
disable-docs-build --with-check
videoproto-2.3.2: videoproto: configure was passed unrecognised options: --=
with-fop --without-xmlto
libpciaccess-0.13.2: libpciaccess: configure was passed unrecognised option=
s: --without-xmlto --disable-malloc0returnsnull --without-ps2pdf --without-=
groff --without-fop --disable-specs
xf86vidmodeproto-2.3.1: xf86vidmodeproto: configure was passed unrecognised=
 options: --with-fop --without-xmlto
libxv-1.0.9: libxv: configure was passed unrecognised options: --without-gr=
off --without-xmlto --without-fop --without-ps2pdf --disable-specs
tremor-20120314: tremor: configure was passed unrecognised options: --disab=
le-rpath
flac-1.2.1: flac: configure was passed unrecognised options: --without-id3l=
ib --disable-id3libtest
xf86driproto-2.1.1: xf86driproto: configure was passed unrecognised options=
: --with-fop --without-xmlto
glproto-1.4.16: glproto: configure was passed unrecognised options: --with-=
fop --without-xmlto
dri2proto-2.8: dri2proto: configure was passed unrecognised options: --with=
-fop --without-xmlto
libtool-2.4.2: libtool: configure was passed unrecognised options: --with-s=
ysroot
libxxf86vm-1.1.3: libxxf86vm: configure was passed unrecognised options: --=
without-groff --without-xmlto --without-fop --without-ps2pdf --disable-specs
edbus-1.7.8: edbus: configure was passed unrecognised options: --enable-bui=
ld-test-gui
resourceproto-1.2.0: resourceproto: configure was passed unrecognised optio=
ns: --with-fop --without-xmlto
libxt-1.1.4: libxt: configure was passed unrecognised options: --without-gr=
off --without-ps2pdf
libglade-2.6.4: libglade: configure was passed unrecognised options: --disa=
ble-schemas-install --enable-introspection --disable-update-mimedb
ethumb-1.7.8: ethumb: configure was passed unrecognised options: --with-eet=
-eet --disable-docs
libfontenc-1.1.2: libfontenc: configure was passed unrecognised options: --=
without-xmlto --disable-malloc0returnsnull --without-ps2pdf --without-groff=
 --without-fop --disable-specs
libxkbfile-1.0.8: libxkbfile: configure was passed unrecognised options: --=
without-xmlto --disable-malloc0returnsnull --without-ps2pdf --without-groff=
 --without-fop --disable-specs --without-xcb
libxres-1.0.7: libxres: configure was passed unrecognised options: --withou=
t-groff --without-xmlto --without-fop --without-ps2pdf --disable-specs
libnotify-0.6.0: libnotify: configure was passed unrecognised options: --di=
sable-schemas-install --enable-introspection --disable-update-mimedb
gnome-doc-utils-0.20.10: gnome-doc-utils: configure was passed unrecognised=
 options: --disable-update-mimedb --disable-schemas-install --enable-intros=
pection
samba-3.6.8: samba: configure was passed unrecognised options: --with-libdir
bluez-hcidump-2.5: bluez-hcidump: configure was passed unrecognised options=
: --with-bluez-includes --with-bluez-libs
xf86miscproto-0.9.3: xf86miscproto: configure was passed unrecognised optio=
ns: --with-fop --without-xmlto
xf86dgaproto-2.1: xf86dgaproto: configure was passed unrecognised options: =
--with-fop --without-xmlto
libwnck-2.30.5: libwnck: configure was passed unrecognised options: --disab=
le-schemas-install --disable-update-mimedb
libxfont-1.4.6: libxfont: configure was passed unrecognised options: --with=
out-groff --disable-malloc0returnsnull --without-ps2pdf --disable-specs
gnome-mime-data-2.18.0: gnome-mime-data: configure was passed unrecognised =
options: --disable-update-mimedb --disable-schemas-install --enable-introsp=
ection
libid3tag-0.15.1b: libid3tag: configure was passed unrecognised options: --=
enable-speed
libxmu-1.1.2: libxmu: configure was passed unrecognised options: --without-=
groff --disable-malloc0returnsnull --without-ps2pdf --disable-specs
libbonobo-2.24.3: libbonobo: configure was passed unrecognised options: --d=
isable-schemas-install --enable-introspection --disable-update-mimedb
gcc-4.8.1: The /usr/share/info/dir file is not meant to be shipped in a par=
ticular package.
libsdl-1.2.15: libsdl: configure was passed unrecognised options: --disable=
-video-gem --disable-video-xbios --enable-dlopen --disable-debug --enable-e=
ndian
libgnome-keyring-2.32.0: libgnome-keyring: configure was passed unrecognise=
d options: --disable-schemas-install --enable-introspection --disable-updat=
e-mimedb
xserver-xorg-1.14.0: xserver-xorg: configure was passed unrecognised option=
s: --with-fontdir --disable-mcfb --disable-ccfb --disable-xorgcfg --disable=
-acfb --disable-xf86misc
dmxproto-2.3.1: dmxproto: configure was passed unrecognised options: --with=
-fop --without-xmlto
gnome-disk-utility-2.32.0: gnome-disk-utility: configure was passed unrecog=
nised options: --enable-nautilus-extension --disable-schemas-install --enab=
le-introspection --disable-update-mimedb
libgnome-2.32.1: libgnome: configure was passed unrecognised options: --ena=
ble-introspection --disable-update-mimedb
libxxf86misc-1.0.3: libxxf86misc: configure was passed unrecognised options=
: --without-groff --without-xmlto --without-fop --without-ps2pdf --disable-=
specs
libxpm-3.5.11: libxpm: configure was passed unrecognised options: --without=
-xmlto --disable-malloc0returnsnull --without-ps2pdf --without-groff --with=
out-fop --disable-specs
calibrateproto-0.0+gitAUTOINC+1da6fd1e2c: calibrateproto: configure was pas=
sed unrecognised options: --without-xmlto --with-fop
gst-plugins-good-0.10.31: gst-plugins-good: configure was passed unrecognis=
ed options: --without-check
liblockfile-1.09: liblockfile: configure was passed unrecognised options: -=
-enable-static
libxxf86dga-1.1.4: libxxf86dga: configure was passed unrecognised options: =
--without-groff --without-xmlto --without-fop --without-ps2pdf --disable-sp=
ecs
libdmx-1.1.3: libdmx: configure was passed unrecognised options: --without-=
groff --without-xmlto --without-fop --without-ps2pdf --disable-specs
quota-4.01: quota: configure was passed unrecognised options: --with-tcpwra=
ppers
libav-0.8.8: ELF binary '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eg=
libc/work/armv5te-oe-linux-gnueabi/libav/0.8.8-r0/packages-split/libswscale=
/usr/lib/libswscale.so.2.1.0' has relocations in .text
libav-0.8.8: ELF binary '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eg=
libc/work/armv5te-oe-linux-gnueabi/libav/0.8.8-r0/packages-split/libpostpro=
c/usr/lib/libpostproc.so.52.0.0' has relocations in .text
libav-0.8.8: ELF binary '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eg=
libc/work/armv5te-oe-linux-gnueabi/libav/0.8.8-r0/packages-split/libavutil/=
usr/lib/libavutil.so.51.22.1' has relocations in .text
libav-0.8.8: ELF binary '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eg=
libc/work/armv5te-oe-linux-gnueabi/libav/0.8.8-r0/packages-split/libavforma=
t/usr/lib/libavformat.so.53.21.1' has relocations in .text
libav-0.8.8: ELF binary '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eg=
libc/work/armv5te-oe-linux-gnueabi/libav/0.8.8-r0/packages-split/libavfilte=
r/usr/lib/libavfilter.so.2.15.0' has relocations in .text
libav-0.8.8: ELF binary '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eg=
libc/work/armv5te-oe-linux-gnueabi/libav/0.8.8-r0/packages-split/libavdevic=
e/usr/lib/libavdevice.so.53.2.0' has relocations in .text
libav-0.8.8: ELF binary '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eg=
libc/work/armv5te-oe-linux-gnueabi/libav/0.8.8-r0/packages-split/libavcodec=
/usr/lib/libavcodec.so.53.35.0' has relocations in .text
openssh-6.2p2: openssh: configure was passed unrecognised options: --with-r=
and-helper
enchant-1.6.0: enchant: configure was passed unrecognised options: --disabl=
e-binreloc
mariadb-5.1.67: mariadb: configure was passed unrecognised options: --witho=
ut-plugin-maria
cairomm-1.10.0: cairomm: configure was passed unrecognised options: --disab=
le-some-floating-point --enable-tee --with-x
libbonoboui-2.24.3: libbonoboui: configure was passed unrecognised options:=
 --disable-schemas-install --enable-introspection --disable-update-mimedb
libxcalibrate-0.0+gitAUTOINC+209d83af61: libxcalibrate: configure was passe=
d unrecognised options: --without-xmlto --disable-malloc0returnsnull --with=
out-ps2pdf --without-groff --without-fop --disable-specs
cups-1.6.4: cups: configure was passed unrecognised options: --with-pdftops=
 --disable-tiff
libxaw-1.0.10: libxaw: configure was passed unrecognised options: --without=
-groff --disable-docs --without-ps2pdf --disable-malloc0returnsnull
gstreamer1.0-1.0.9: gstreamer1.0: configure was passed unrecognised options=
: --disable-docs-build --with-check
libgdata-0.7.1: libgdata: configure was passed unrecognised options: --disa=
ble-schemas-install --disable-update-mimedb
connman-1.18: connman: configure was passed unrecognised options: --disable=
-gtk-doc-pdf --disable-gtk-doc-html
libgsf-1.14.26: libgsf: configure was passed unrecognised options: --withou=
t-python --without-bonobo --without-gnome-vfs
libass-0.10.1: libass: configure was passed unrecognised options: --enable-=
png
pth-2.0.7: pth: configure was passed unrecognised options: configure:25078:=
 WARNING: unrecognized options:
openobex-1.5: openobex: configure was passed unrecognised options: --with-u=
sb --with-bluez
claws-mail-3.9.0: claws-mail: configure was passed unrecognised options: --=
disable-gnomeprint --disable-aspell-test --disable-clamav-plugin --enable-a=
spell
gsettings-desktop-schemas-3.7.3: gsettings-desktop-schemas: configure was p=
assed unrecognised options: --disable-update-mimedb --disable-schemas-insta=
ll
libgtop-2.28.2: libgtop: configure was passed unrecognised options: --disab=
le-schemas-install --enable-introspection --disable-update-mimedb
fuse-2.9.3: fuse: configure was passed unrecognised options: --disable-kern=
el-module
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: evolution-data-server: c=
onfigure was passed unrecognised options: --disable-uoa --with-dbus --witho=
ut-weather --with-soup --without-bug-buddy
gd-2.0.35+2.0.36rc1: gd: configure was passed unrecognised options: --with-=
zlib
gnome-menus-2.30.5: gnome-menus: configure was passed unrecognised options:=
 --disable-schemas-install --disable-update-mimedb
babl-0.1.10: babl: configure was passed unrecognised options: --disable-sch=
emas-install --disable-update-mimedb
libgnomekbd-2.32.0: libgnomekbd: configure was passed unrecognised options:=
 --enable-introspection --disable-update-mimedb
qwt-6.0.1: File '/usr/lib/libqwt.so.6.0.1' from qwt was already stripped, t=
his will prevent future debugging!
qwt-6.0.1: File '/usr/lib/libqwtmathml.so.6.0.1' from qwt was already strip=
ped, this will prevent future debugging!
qwt-6.0.1: File '/usr/lib/qt4/plugins/designer/libqwt_designer_plugin.so' f=
rom qwt was already stripped, this will prevent future debugging!
dconf-0.7.5: dconf: configure was passed unrecognised options: --disable-up=
date-mimedb --disable-schemas-install --enable-introspection
libgnomecups-0.2.3: libgnomecups: configure was passed unrecognised options=
: --disable-schemas-install --enable-introspection --disable-update-mimedb
libgweather-2.30.3: libgweather: configure was passed unrecognised options:=
 --enable-introspection --disable-update-mimedb
fsodeviced-0.12.0: fsodeviced: configure was passed unrecognised options: -=
-enable-htcdream-powercontrol
gypsy-0.9: gypsy: configure was passed unrecognised options: --with-distro
gtkmathview-0.8.0: gtkmathview: configure was passed unrecognised options: =
--disable-binreloc
gpgme-1.4.3: gpgme: configure was passed unrecognised options: --without-pt=
h-test --with-pth
gtk-engines-2.20.2: gtk-engines: configure was passed unrecognised options:=
 --disable-schemas-install --enable-introspection --disable-update-mimedb
rrdtool-1.4.7: rrdtool: configure was passed unrecognised options: --enable=
-local-libpng --enable-local-zlib
gtksourceview2-2.10.5: gtksourceview2: configure was passed unrecognised op=
tions: --disable-schemas-install --enable-introspection --disable-update-mi=
medb
tcpdump-4.3.0: tcpdump: configure was passed unrecognised options: --disabl=
e-rpath
leafpad-0.8.18.1: leafpad: configure was passed unrecognised options: --dis=
able-gtktest
metacity-2.34.13: metacity: configure was passed unrecognised options: --di=
sable-schemas-install --enable-introspection --disable-update-mimedb --disa=
ble-verbose
polkit-gnome-0.102: polkit-gnome: configure was passed unrecognised options=
: --disable-scrollkeeper --disable-man-pages
ghostscript-9.07: ghostscript: configure was passed unrecognised options: -=
-without-jasper configure:11519: WARNING: unrecognized options:
python3-3.3.2: python3: configure was passed unrecognised options: --withou=
t-cxx --with-cyclic-gc --with-wctype-functions
wget-1.14: wget: configure was passed unrecognised options: --with-libc
dropbear-2013.58: dropbear: configure was passed unrecognised options: conf=
igure:10587: WARNING: configure:9311: unrecognized options:
gnome-bluetooth-2.32.0: gnome-bluetooth: configure was passed unrecognised =
options: --disable-schemas-install --disable-update-mimedb
libomxil-0.9.3: libomxil: configure was passed unrecognised options: --disa=
ble-ffmpegcomponents
ed-1.9: The /usr/share/info/dir file is not meant to be shipped in a partic=
ular package.
mesa-demos-8.1.0: mesa-demos: configure was passed unrecognised options: --=
enable-libx11 --enable-libosmesa
fluidsynth-1.1.1: fluidsynth: configure was passed unrecognised options: --=
without-readline-support
gnome-settings-daemon-2.32.1: gnome-settings-daemon: configure was passed u=
nrecognised options: --disable-esd
modphp-5.5.2: modphp: configure was passed unrecognised options: --enable-f=
orce-cgi-redirect
libgnomeprint-2.18.7: libgnomeprint: configure was passed unrecognised opti=
ons: --disable-schemas-install --enable-introspection --disable-update-mime=
db
goffice-0.10.1: goffice: configure was passed unrecognised options: --disab=
le-schemas-install --disable-update-mimedb
qt-creator-2.8.1: qt-creator: found library in wrong location: /usr/share/q=
tcreator/qbs/lib/qbs/plugins/libqbs_cpp_scanner.so
qt-creator: found library in wrong location: /usr/share/qtcreator/qbs/lib/q=
bs/plugins/libqbs_qt_scanner.so
qt-creator-dbg: found library in wrong location: /usr/share/qtcreator/qbs/l=
ib/qbs/plugins/.debug/libqbs_cpp_scanner.so
qt-creator-dbg: found library in wrong location: /usr/share/qtcreator/qbs/l=
ib/qbs/plugins/.debug/libqbs_qt_scanner.so
links-x11-2.7: links-x11: configure was passed unrecognised options: --enab=
le-javascript --with-libfl --without-sdl
sylpheed-2.7.1: sylpheed: configure was passed unrecognised options: --enab=
le-gnutls
emacs-23.4: The /usr/share/info/dir file is not meant to be shipped in a pa=
rticular package.
expedite-1.7.8: expedite: configure was passed unrecognised options: --disa=
ble-software-sdl --disable-software-16-ddraw --disable-opengl-glew
oscam-1.10+7974: File '/usr/bin/oscam' from oscam was already stripped, thi=
s will prevent future debugging!
dpkg-1.17.1: dpkg: configure was passed unrecognised options: --with-start-=
stop-daemon --without-sgml-doc --without-static-progs --with-bz2lib --witho=
ut-dselect
weston-1.1.0: weston: configure was passed unrecognised options: --disable-=
android-compositor
modemmanager-0.6.0.0: modemmanager: configure was passed unrecognised optio=
ns: --disable-schemas-install --enable-introspection --disable-update-mimedb
epiphany-2.30.6: epiphany: configure was passed unrecognised options: --dis=
able-update-mimedb
libxkbui-1.0.2: libxkbui: configure was passed unrecognised options: --with=
out-xmlto --disable-malloc0returnsnull --without-ps2pdf --without-groff --w=
ithout-fop --disable-specs
aurora-daemon-0.1+gitrAUTOINC+b65354ad6c: aurora-daemon: found library in w=
rong location: /usr/share/aurora/applications/settings/libaurora-app-settin=
gs.so
gcr-3.8.2: gcr: configure was passed unrecognised options: --disable-schema=
s-install --disable-update-mimedb
gnome-themes-2.32.1: gnome-themes: configure was passed unrecognised option=
s: --disable-update-mimedb --disable-schemas-install --disable-hicolor-chec=
k --enable-introspection
links-2.7: links: configure was passed unrecognised options: --enable-javas=
cript --with-libfl --without-sdl
gthumb-2.12.4: gthumb: configure was passed unrecognised options: --enable-=
introspection --disable-update-mimedb
gst-plugins-gl-0.10.3: gst-plugins-gl: configure was passed unrecognised op=
tions: --disable-schemas-install
gnome-backgrounds-2.32.0: gnome-backgrounds: configure was passed unrecogni=
sed options: --disable-update-mimedb --disable-schemas-install --enable-int=
rospection
start-stop-daemon-1.16.0.2: start-stop-daemon: configure was passed unrecog=
nised options: --without-deselect
gnome-control-center-2.32.1: gnome-control-center: configure was passed unr=
ecognised options: --enable-introspection
libgweather3-3.0.2: libgweather3: configure was passed unrecognised options=
: --disable-update-mimedb
libwnck3-3.0.2: libwnck3: configure was passed unrecognised options: --disa=
ble-schemas-install --disable-update-mimedb
libxvmc-1.0.8: libxvmc: configure was passed unrecognised options: --withou=
t-groff --without-xmlto --without-fop --without-ps2pdf --disable-specs
gstreamer1.0-plugins-bad-1.0.9: gstreamer1.0-plugins-bad: configure was pas=
sed unrecognised options: --disable-direct3d9
openbox-3.5.0: openbox: configure was passed unrecognised options: --with-p=
lugins
gstreamer1.0-libav-1.0.9: ELF binary '/home/jenkins/oe/shr-core-branches/sh=
r-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gstreamer1.0-libav/1.0.9-r1=
/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so' ha=
s relocations in .text
inetutils-1.9.1: inetutils: configure was passed unrecognised options: --wi=
th-path-login --with-path-procnet-dev
gstreamer1.0-plugins-good-1.0.9: gstreamer1.0-plugins-good: configure was p=
assed unrecognised options: --disable-schemas-install
owfs-2.9p1: owfs: configure was passed unrecognised options: --enable-cache=
 --enable-mt
gst-fluendo-mpegdemux-0.10.72: gst-fluendo-mpegdemux: configure was passed =
unrecognised options: --disable-debug
zenity-2.32.1: zenity: configure was passed unrecognised options: --disable=
-update-mimedb --disable-schemas-install --enable-introspection
ruby-1.9.3-p429: ruby: configure was passed unrecognised options: --enable-=
wide-getaddrinfo
ipsec-tools-0.8.1: ipsec-tools: configure was passed unrecognised options: =
--without-gssapi
xbmc-11.0+gitrAUTOINC+82388d55da: xbmc: configure was passed unrecognised o=
ptions: --disable-rpath
lzip-1.14: The /usr/share/info/dir file is not meant to be shipped in a par=
ticular package.
gnome-mplayer-1.0.5: gnome-mplayer: configure was passed unrecognised optio=
ns: --disable-update-mimedb
atftp-0.7.1+gitAUTOINC+be3291a18c: atftp: Files/directories were installed =
but not shipped
  /etc
liblbxutil-1.1.0: liblbxutil: configure was passed unrecognised options: --=
without-xmlto --disable-malloc0returnsnull --without-ps2pdf --without-groff=
 --without-fop --disable-specs
tracker-0.14.2: tracker: configure was passed unrecognised options: --enabl=
e-introspection --disable-enca --disable-tiff --disable-schemas-install --d=
isable-update-mimedb --disable-introspection
tracker-0.14.2: tracker: Files/directories were installed but not shipped
  /usr/lib/tracker-0.14/writeback-modules/libwriteback-taglib.so
  /usr/lib/tracker-0.14/writeback-modules/libwriteback-taglib.la
libpostproc-0.0.0+gitAUTOINC+3b7053f46d: ELF binary '/home/jenkins/oe/shr-c=
ore-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libpostproc/=
0.0.0+gitAUTOINC+3b7053f46d-r1/packages-split/libpostproc/usr/lib/libpostpr=
oc.so.52.0.100' has relocations in .text
gnome-terminal-2.30.2: gnome-terminal: configure was passed unrecognised op=
tions: --enable-introspection --disable-update-mimedb
gnome-system-monitor-2.28.2: gnome-system-monitor: configure was passed unr=
ecognised options: --enable-introspection --disable-update-mimedb
guile-2.0.9: guile: configure was passed unrecognised options: --without-li=
breadline-support
cheese-2.30.1: cheese: configure was passed unrecognised options: --enable-=
introspection --disable-update-mimedb

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zCKi3GIZzVBPywwA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJkMnEACgkQN1Ujt2V2gBymOwCgnWM6OXIMuDd2BtUnfk+JW7F1
CL0An0tAbuU5+STylKgtB9YYwnHxutrq
=vHZi
-----END PGP SIGNATURE-----

--zCKi3GIZzVBPywwA--
