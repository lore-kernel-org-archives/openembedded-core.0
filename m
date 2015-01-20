Return-Path: <andrea.adami@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 858D97282F;
	Tue, 20 Jan 2015 08:21:19 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id q1so17609600lam.2;
	Tue, 20 Jan 2015 00:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=9JP8mUYR6pAE0cszmQrh/tc79i5fh1DhsXzHKovAlEw=;
	b=vfIHTaTSoqKlt8zOochd6withbFKPA34BjNF2Jc4WXHGdWBjbpfZ3SPg1Jua3ho2dd
	ElmTq7w6CGJXNuIuHxr4ccLYy31CdW4KwyiILtrn1qXEt+jT0hNgxzOS6FB3KA+G5UG6
	ocpmLeCB9AvjrN6yEna7dnqW5Ic5Y41wn+6dSfykeVBRRqoZDDBkgbslcQihU/QWxgSF
	jJVOfyNOsYJXHmjZPB6yZtqdY1SUqzjLNrQSNnUzSm6SwOikvssGGU8uL+Z6VJcAhuiR
	AEnufi1kOW9LE4ljVZAhhbaO4niz1pn1xFKN6oZXukA5CK2nisnE/qC+V9O2WzEJWeAS
	0vrg==
MIME-Version: 1.0
X-Received: by 10.112.132.2 with SMTP id oq2mr36662027lbb.11.1421742078077;
	Tue, 20 Jan 2015 00:21:18 -0800 (PST)
Received: by 10.112.52.136 with HTTP; Tue, 20 Jan 2015 00:21:18 -0800 (PST)
In-Reply-To: <20150119173507.GA2456@jama>
References: <20150119173507.GA2456@jama>
Date: Tue, 20 Jan 2015 09:21:18 +0100
Message-ID: <CAAQYJAuME6s-OS-BV48vXXJFknqhx03oYKLwYuniLgO-qMjO-Q@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2015-01-19
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
X-List-Received-Date: Tue, 20 Jan 2015 08:21:30 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 19, 2015 at 6:35 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> perf was finally fixed for qemux86-64, python3 and kexec-tools-klibc got broken

The recipe was broken by commit
5fccfd0f0a9dd4dca96389f5d856d3fab21745e2 kexec-tools: separate B and
S.
I'll adjust the custom recipe as soon as possible to fix:

< OBJDIR='/oe/oe-core/build/tmp-glibc/work/armv5te-oe-linux-gnueabi/kexec-tools-klibc/2.0.2-r0/kexec-tools-2.0.2/objdir-arm-oe-linux-gnueabi'
---
> OBJDIR='/oe/oe-core/build/tmp-glibc/work/armv5te-oe-linux-gnueabi/kexec-tools-klibc/2.0.2-r1/build/objdir-arm-oe-linux-gnueabi'

Regards

Andrea

>
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> == Failed tasks 2015-01-19 ==
>
> INFO: jenkins-job.sh-1.1.0 Complete log available at http://logs.nslu2-linux.org/buildlogs/oe/world/log.report.20150119_173134.log
>
> === common (2) ===
>     * /meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb, do_compile
>     * /openembedded-core/meta/recipes-devtools/python/python3_3.3.3.bb, do_compile
>
> === common-x86 (0) ===
>
> === qemuarm (1) ===
>     * /meta-openembedded/meta-oe/recipes-navigation/geos/geos_3.4.2.bb, do_compile
>
> === qemux86 (0) ===
>
> === qemux86_64 (0) ===
>
> === Number of failed tasks (7) ===
> {| class=wikitable
> |-
> || qemuarm      || 3     || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150117_205137.log// || http://errors.yoctoproject.org:80/Errors/Search/1/4215/
> |-
> || qemux86      || 2     || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150118_113518.log// || http://errors.yoctoproject.org:80/Errors/Search/1/4216/
> |-
> || qemux86_64   || 2     || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150119_023408.log// || http://errors.yoctoproject.org:80/Errors/Search/1/4220/
> |}
>
> === PNBLACKLISTs (50) ===
>
> === QA issues (97) ===
> {| class=wikitable
> !| Count                ||Issue
> |-
> ||0     ||version-going-backwards
> |-
> ||1     ||libdir
> |-
> ||17    ||textrel
> |-
> ||26    ||build-deps
> |-
> ||3     ||already-stripped
> |-
> ||50    ||file-rdeps
> |}
>
>
> PNBLACKLISTs:
> openembedded-core/:
> meta-browser:
> meta-openembedded:
> meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb:PNBLACKLIST[ifuse] ?= "depends on blacklisted libimobiledevice"
> meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gnome-mplayer] ?= "rdepends on blacklisted mplayer"
> meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb:PNBLACKLIST[gcr] ?= "CONFLICT: 4 files conflict with gnome-keyring"
> meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb:PNBLACKLIST[gdm] ?= "Depends on broken polkit-gnome"
> meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb:PNBLACKLIST[gnome-bluetooth] ?= "dbus-binding-tool fails with: Unable to load gnome-bluetooth-2.32.0/lib/bluetooth-client.xml": "manager" is not a valid D-Bus interface name"
> meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb:PNBLACKLIST[gnome-menus3] ?= "CONFLICT: 24 files are conflicting with gnome-menus"
> meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnome-panel3] ?= "CONFLICT: depends on libgweather3 which conflicts with libgweather"
> meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgweather3] ?= "CONFLICT: 876 files are conflicting with libgweather"
> meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?= "BROKEN: doesn't build with B!=S"
> meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:PNBLACKLIST[xbmc] ?= "/usr/include/c++/ctime:70:11: error: '::gmtime' has not been declared"
> meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:PNBLACKLIST[coriander] ?= "BROKEN: fails to use SDL probably because libsdl-config was removed, error: unknown type name 'SDL_Overlay'"
> meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb:PNBLACKLIST[renderer-service-upnp] ?= "BROKEN: doesn't build with B!=S (trying to install rendererconsole.py from ${B} instead of ${S})"
> meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:PNBLACKLIST[lksctp-tools] ?= "BROKEN: fails to link against sctp_connectx symbol"
> meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb:PNBLACKLIST[libimobiledevice] ?= "cannot run test program while cross compiling"
> meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?= "BROKEN: depends on broken libftdi"
> meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zeroc-ice] ?= "BROKEN: not compatible with default db version"
> meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb:PNBLACKLIST[polkit-gnome] ?= "Fails to build, m4:configure.ac:125: recursion limit of 1024 exceeded, use -L<N> to change it"
> meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurface] ?= "Needs to be upgraded for compatibility with new libdivecomputer"
> meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-box2d] ?= "BROKEN: doesn't build with B!=S"
> meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?= "BROKEN: doesn't build with B!=S (flex: can't open lex.lex)"
> meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[xf86-input-mtev] ?= "BROKEN: doesn't build with B!=S (Makefile without ${S} in sed call)"
> meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb:PNBLACKLIST[mplayer2] ?= "Requires newer libav which has negative D_P"
> meta-oe/recipes-qt/qconnman/qconnman-e_git.bb:PNBLACKLIST[qconnman-e] ?= "BROKEN: doesn't work with B!=S, ls: cannot access *.pro: No such file or directory"
> meta-oe/recipes-qt/qconnman/qconnman_git.bb:PNBLACKLIST[qconnman] ?= "BROKEN: doesn't work with B!=S, ls: cannot access *.pro: No such file or directory"
> meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb:PNBLACKLIST[sylpheed] ?= "BROKEN: Doesn't work with B!=S"
> meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd] ?= "BROKEN: doesn't build with B!=S"
> meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?= "qemu: uncaught target signal 11 (Segmentation fault) - core dumped"
> meta-oe/recipes-support/maliit/maliit-framework_git.bb:PNBLACKLIST[maliit-framework] ?= "BROKEN: Wasn't updated to work with B!=S, maybe incorrectly inherits autotools"
> meta-oe/recipes-support/maliit/maliit-plugins_git.bb:PNBLACKLIST[maliit-plugins] ?= "BROKEN: depends on broken maliit-framework"
> meta-oe/recipes-support/mongodb/mongodb_git.bb:PNBLACKLIST[mongodb] ?= "Fails to build with system boost"
> meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmotif] ?= "BROKEN: doesn't build with B!=S"
> meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala-terminal] ?= "BROKEN: Doesn't work with B!=S, touch: cannot touch `src/.stamp': No such file or directory"
> meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb:PNBLACKLIST[xfce4-vala] ?= "Fails to build since vala upgrade to 0.26.1"
> meta-qt5:
> meta-smartphone:
> meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] = "rdepends on blacklisted mplayer2"
> meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompass] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-webos-ports:
> conf/world_fixes.inc:PNBLACKLIST[mplayer2] = ""
> conf/world_fixes.inc:PNBLACKLIST[android-system] = "depends on lxc from meta-virtualiazation which isn't included in my world builds"
> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be tested so much"
> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be tested so much"
> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested so much"
> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested so much"
> conf/world_fixes.inc:PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be tested so much"
> conf/world_mask.inc:PNBLACKLIST[evince] = "fails to build"
> conf/world_mask.inc:PNBLACKLIST[epiphany] = "fails to build"
> conf/world_mask.inc:PNBLACKLIST[gnome-power-manager] = "fails to build"
> conf/world_mask.inc:PNBLACKLIST[gnome-bluetooth] = "fails to build"
> conf/world_mask.inc:PNBLACKLIST[media-ctl] = "fails to build"
> QA issues by type:
> count: 3        issue: already-stripped
> qwt-6.0.1: File '/usr/lib/libqwt.so.6.0.1' from qwt was already stripped, this will prevent future debugging! [already-stripped]
> qwt-6.0.1: File '/usr/lib/libqwtmathml.so.6.0.1' from qwt was already stripped, this will prevent future debugging! [already-stripped]
> qwt-6.0.1: File '/usr/lib/qt4/plugins/designer/libqwt_designer_plugin.so' from qwt was already stripped, this will prevent future debugging! [already-stripped]
>
>
> count: 1        issue: libdir
> chromium-dbg: found library in wrong location: /usr/bin/chrome/.debug/libffmpegsumo.so [libdir]
>
>
> count: 17       issue: textrel
> chromium-38.0.2125.101: ELF binary '/tmp/work/i586-oe-linux/chromium/38.0.2125.101-r0/packages-split/chromium/usr/bin/chrome/libffmpegsumo.so' has relocations in .text [textrel]
> gstreamer1.0-libav-1.4.5: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/gstreamer1.0-libav/1.4.5-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so' has relocations in .text [textrel]
> gstreamer1.0-libav-1.4.5: ELF binary '/tmp/work/i586-oe-linux/gstreamer1.0-libav/1.4.5-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so' has relocations in .text [textrel]
> libav-9.16: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/libav/9.16-r0/packages-split/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in .text [textrel]
> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in .text [textrel]
> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavdevice/usr/lib/libavdevice.so.53.2.0' has relocations in .text [textrel]
> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavfilter/usr/lib/libavfilter.so.3.3.0' has relocations in .text [textrel]
> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavformat/usr/lib/libavformat.so.54.20.4' has relocations in .text [textrel]
> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavresample/usr/lib/libavresample.so.1.0.1' has relocations in .text [textrel]
> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavutil/usr/lib/libavutil.so.52.3.0' has relocations in .text [textrel]
> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libswscale/usr/lib/libswscale.so.2.1.1' has relocations in .text [textrel]
> libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc/usr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
> libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/i586-oe-linux/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc/usr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
> mpg123-1.21.0: ELF binary '/tmp/work/i586-oe-linux/mpg123/1.21.0-r0/packages-split/mpg123/usr/lib/libmpg123.so.0.40.3' has relocations in .text [textrel]
> qtwebkit-5.4.0+gitAUTOINC+af15cefb39: ELF binary '/tmp/work/i586-oe-linux/qtwebkit/5.4.0+gitAUTOINC+af15cefb39-r0/packages-split/qtwebkit/usr/lib/libQt5WebKit.so.5.4.0' has relocations in .text [textrel]
> webkit-efl-1.11.0: ELF binary '/tmp/work/i586-oe-linux/webkit-efl/1_1.11.0-r0/packages-split/webkit-efl/usr/lib/libjavascriptcore_efl.so.1.11.0' has relocations in .text [textrel]
> webkit-gtk-1.8.3: ELF binary '/tmp/work/i586-oe-linux/webkit-gtk/1.8.3-r1/packages-split/libjavascriptcore/usr/lib/libjavascriptcoregtk-1.0.so.0.13.4' has relocations in .text [textrel]
>
>
> count: 26       issue: build-deps
> cherokee-1.2.98: cherokee rdepends on geoip, but it isn't a build dependency? [build-deps]
> exquisite-0.0.1+svnr82070: exquisite rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
> geoclue-2.0.0: geoclue rdepends on geoip, but it isn't a build dependency? [build-deps]
> glade3-3.8.5: glade3 rdepends on libpython2, but it isn't a build dependency? [build-deps]
> gpm-1.99.7: gpm rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
> grub-efi-2.00: grub-efi rdepends on fuse, but it isn't a build dependency? [build-deps]
> irda-utils-0.9.18: irda-utils rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
> libwebp-0.4.0: libwebp-bin rdepends on libgl-mesa, but it isn't a build dependency? [build-deps]
> libwebp-0.4.0: libwebp-bin rdepends on mesa-glut, but it isn't a build dependency? [build-deps]
> log4c-1.2.4: log4c rdepends on expat, but it isn't a build dependency? [build-deps]
> mpd-0.19.1: mpd rdepends on libsmbclient, but it isn't a build dependency? [build-deps]
> mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on libpostproc, but it isn't a build dependency? [build-deps]
> mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on libvorbis, but it isn't a build dependency? [build-deps]
> mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on libxscrnsaver, but it isn't a build dependency? [build-deps]
> mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on mpg123, but it isn't a build dependency? [build-deps]
> mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on portaudio-v19, but it isn't a build dependency? [build-deps]
> netkit-rwho-0.17: netkit-rwho-client rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
> pkcs11-helper-1.11: pkcs11-helper rdepends on nspr, but it isn't a build dependency? [build-deps]
> pkcs11-helper-1.11: pkcs11-helper rdepends on nss, but it isn't a build dependency? [build-deps]
> proftpd-1.3.5: proftpd rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
> qtwayland-5.4.0+gitAUTOINC+a0c5ba81f4: qtwayland-plugins rdepends on libxcomposite, but it isn't a build dependency? [build-deps]
> qtwebkit-5.4.0+gitAUTOINC+af15cefb39: qtwebkit rdepends on libxcomposite, but it isn't a build dependency? [build-deps]
> squid-3.4.7: squid rdepends on libpam, but it isn't a build dependency? [build-deps]
> sysklogd-1.5.1: sysklogd rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
> syslog-ng-3.5.4.1: syslog-ng-libs rdepends on geoip, but it isn't a build dependency? [build-deps]
> wireshark-1.12.3: wireshark rdepends on geoip, but it isn't a build dependency? [build-deps]
>
>
> count: 50       issue: file-rdeps
> apache2-2.4.10: apache2-dev requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
> chkconfig-1.3.58: chkconfig requires libnewt.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> chkconfig-1.3.58: chkconfig requires libnewt.so, but no providers in its RDEPENDS [file-rdeps]
> cloud9-0.6: cloud9 requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
> dpkg-1.17.21: dpkg requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvb-apps requires libucsi.so()(64bit), libdvbapi.so()(64bit), libdvbcfg.so()(64bit), libdvben50221.so()(64bit), libdvbsec.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvb-apps requires libucsi.so, libdvben50221.so, libdvbsec.so, libdvbcfg.so, libdvbapi.so, but no providers in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvb-femon requires libdvbapi.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvb-femon requires libdvbapi.so, but no providers in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvb-scan requires libdvbsec.so()(64bit), libdvbapi.so()(64bit), libdvbcfg.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvb-scan requires libdvbsec.so, libdvbcfg.so, libdvbapi.so, but no providers in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvbdate requires libucsi.so()(64bit), libdvbapi.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvbdate requires libucsi.so, libdvbapi.so, but no providers in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvbnet requires libdvbapi.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvbnet requires libdvbapi.so, but no providers in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvbtraffic requires libdvbapi.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvbtraffic requires libdvbapi.so, but no providers in its RDEPENDS [file-rdeps]
> fakeroot-1.18.4: fakeroot requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
> fbida-2.09+gitAUTOINC+6aa5563cb3: fbida requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
> foxtrotgps-1.1.1: foxtrotgps requires /usr/bin/python, /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
> gammu-1.32.0: gammu requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
> gammu-1.32.0: gammu-dev requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
> gateone-1.2: gateone requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
> giflib-4.1.6: giflib-utils requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
> gnome-desktop-2.32.1: gnome-desktop requires /usr/bin/python, but no providers in its RDEPENDS [file-rdeps]
> gnome-panel-2.32.1: gnome-panel requires /usr/bin/python, but no providers in its RDEPENDS [file-rdeps]
> groff-1.22.2: groff requires /bin/sed, but no providers in its RDEPENDS [file-rdeps]
> gupnp-0.20.12: gupnp-dev requires /usr/bin/python, but no providers in its RDEPENDS [file-rdeps]
> hplip-3.12.6: hplip-filter requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
> ipvsadm-1.26: ipvsadm requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
> libbonobo-2.32.1: libbonobo requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
> libnewt-0.52.18: whiptail requires libnewt.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> libnewt-0.52.18: whiptail requires libnewt.so, but no providers in its RDEPENDS [file-rdeps]
> libnewt-python-0.52.18: libnewt-python requires libnewt.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> libnewt-python-0.52.18: libnewt-python requires libnewt.so, but no providers in its RDEPENDS [file-rdeps]
> lio-utils-4.1+gitAUTOINC+28bd928655: lio-utils requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
> lmsensors-config-1.0: lmsensors-config-cgi requires /usr/bin/rrdcgi, but no providers in its RDEPENDS [file-rdeps]
> nodejs-0.8.18: nodejs requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
> numptyphysics-0.2+svnr109: numptyphysics requires /bin/bash, /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
> opensaf-4.5.0: opensaf requires /bin/bash, /usr/bin/python, but no providers in its RDEPENDS [file-rdeps]
> packagekit-0.5.6: packagekit requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
> pcsc-lite-1.8.6: pcsc-lite requires /usr/bin/python, but no providers in its RDEPENDS [file-rdeps]
> pm-qa-0.4.14: pm-qa requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
> qt-creator-2.8.1: qt-creator requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
> tracker-0.14.2: tracker-nautilus-extension requires libnautilus-extension.so.1()(64bit), but no providers in its RDEPENDS [file-rdeps]
> tracker-0.14.2: tracker-nautilus-extension requires libnautilus-extension.so.1, but no providers in its RDEPENDS [file-rdeps]
> ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: ubx-utils requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
> unionfs-fuse-0.26: unionfs-fuse requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
> usbpath-0.0+svnr3172: usbpath requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
> wvstreams-4.6.1: wvstreams requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

