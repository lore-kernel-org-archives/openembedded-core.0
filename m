Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id EC2A57282C;
	Tue,  6 Jan 2015 02:40:37 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id eu11so29821331pac.22;
	Mon, 05 Jan 2015 18:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=lvPycQfh/D29oioCxVZNFTNK3bHb8gYIbWh729iZA08=;
	b=z6nlZHU5TNro+97CL7GDXC5QaM5qcVTOJvKm2lyEfKWJXYoEyCpvzTbph2w38sKF/Z
	UojBNgtU42SLAmf7n/Ya/Wv/sZQ8xJwV0w6KJwl+gb8I+AvC6y9tJ5vZZcxBkvaZIIMH
	xyiTV4AmgSV7tj54RLLHuGgq7JavM6GeNRkMKOvsrl+CIP72Vm2dn87lyxCrtaVZ1htS
	Ah0xZh6i9SeRTNSzei47+nhAPzIsAalASqmHckmWcfdQjyM+Ebmb3bzNfpSt4cX0uI0X
	zk3/CN+5RhXSGQRHqUq0RJPtQMhTp45Np0aFJwvvZM6YJA+jHuA3DDWB8xDI3EbE4HVe
	QLbg==
X-Received: by 10.70.123.10 with SMTP id lw10mr140723131pdb.161.1420512037722; 
	Mon, 05 Jan 2015 18:40:37 -0800 (PST)
Received: from ?IPv6:2601:c:a700:272f:9530:792e:11cb:1736?
	([2601:c:a700:272f:9530:792e:11cb:1736])
	by mx.google.com with ESMTPSA id
	gm8sm22290073pbc.25.2015.01.05.18.40.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Jan 2015 18:40:36 -0800 (PST)
Message-ID: <54AB4B20.1000302@gmail.com>
Date: Mon, 05 Jan 2015 18:40:32 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
References: <20150105120228.GG2484@jama>
In-Reply-To: <20150105120228.GG2484@jama>
Subject: Re: State of bitbake world, Failed tasks 2015-01-02
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
X-List-Received-Date: Tue, 06 Jan 2015 02:40:40 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit




I will follow up on strongqswan, proftp and netkit-rwho.

- armin

On 01/05/2015 04:02 AM, Martin Jansa wrote:
>
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> == Failed tasks 2015-01-02 ==
>
> INFO: jenkins-job.sh-1.1.0 Complete log available at http://logs.nslu2-linux.org/buildlogs/oe/world/log.report.20150103_191306.log
>
> === common (9) ===
>      * /meta-openembedded/meta-networking/recipes-protocols/openwsman/openwsman_2.4.12.bb, do_compile
>      * /meta-openembedded/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb, do_compile
>      * /meta-openembedded/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb, do_compile
>      * /meta-openembedded/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb, do_compile
>      * /meta-openembedded/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb, do_compile
>      * /meta-openembedded/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb, do_compile
>      * /meta-openembedded/meta-oe/recipes-support/libutempter/libutempter_1.1.6.bb, do_compile
>      * /meta-openembedded/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb, do_configure
>      * /meta-qt5/recipes-qt/examples/qt5-opengles2-test_git.bb, do_compile
>
> === common-x86 (1) ===
>      * /meta-openembedded/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.17.bb, do_compile
>
> === qemuarm (0) ===
>
> === qemux86 (2) ===
>      * /meta-openembedded/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb, do_compile
>      * /meta-openembedded/meta-networking/recipes-support/strongswan/strongswan_5.2.1.bb, do_compile
>
> === qemux86_64 (1) ===
>      * /openembedded-core/meta/recipes-kernel/perf/perf.bb, do_compile
>
> === Number of failed tasks (32) ===
> {| class=wikitable
> |-
> || qemuarm 	|| 9	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150101_135802.log// || http://errors.yoctoproject.org:80/Errors/Search/1/3895/
> |-
> || qemux86 	|| 12	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150102_045847.log// || http://errors.yoctoproject.org:80/Errors/Search/1/3911/
> |-
> || qemux86_64 	|| 11	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150102_213600.log// || http://errors.yoctoproject.org:80/Errors/Search/1/3912/
> |}
>
> === PNBLACKLISTs (52) ===
>
> === QA issues (216) ===
> {| class=wikitable
> !| Count		||Issue
> |-
> ||1	||libdir
> |-
> ||118	||version-going-backwards
> |-
> ||17	||textrel
> |-
> ||21	||build-deps
> |-
> ||3	||already-stripped
> |-
> ||56	||file-rdeps
> |}
>
>
> PNBLACKLISTs:
> openembedded-core/:
> meta-browser:
> meta-openembedded:
> meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb:PNBLACKLIST[ifuse] ?= "depends on blacklisted libimobiledevice"
> meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gnome-mplayer] ?= "rdepends on blacklisted mplayer"
> meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.10.bb:PNBLACKLIST[network-manager-applet] ?= "Depends on broken polkit-gnome"
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
> meta-webserver/recipes-php/modphp/modphp5.inc:PNBLACKLIST[modphp] ?= "CONFLICT: 466 header files conflict with php"
> meta-webserver/recipes-php/xdebug/xdebug_2.2.5.bb:PNBLACKLIST[xdebug] ?= "CONFLICT: depends on blocked modphp"
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
> count: 3	issue: already-stripped
> qwt-6.0.1: File '/usr/lib/libqwt.so.6.0.1' from qwt was already stripped, this will prevent future debugging! [already-stripped]
> qwt-6.0.1: File '/usr/lib/libqwtmathml.so.6.0.1' from qwt was already stripped, this will prevent future debugging! [already-stripped]
> qwt-6.0.1: File '/usr/lib/qt4/plugins/designer/libqwt_designer_plugin.so' from qwt was already stripped, this will prevent future debugging! [already-stripped]
>
>
> count: 1	issue: libdir
> chromium-dbg: found library in wrong location: /usr/bin/chrome/.debug/libffmpegsumo.so [libdir]
>
>
> count: 17	issue: textrel
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
> count: 21	issue: build-deps
> exquisite-0.0.1+svnr82070: exquisite rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
> glade3-3.8.5: glade3 rdepends on libpython2, but it isn't a build dependency? [build-deps]
> gpm-1.99.7: gpm rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
> imsettings-1.6.7: imsettings rdepends on xfconf, but it isn't a build dependency? [build-deps]
> irda-utils-0.9.18: irda-utils rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
> libssh-0.6.3: libssh rdepends on krb5, but it isn't a build dependency? [build-deps]
> libwebp-0.4.0: libwebp-bin rdepends on libgl-mesa, but it isn't a build dependency? [build-deps]
> libwebp-0.4.0: libwebp-bin rdepends on mesa-glut, but it isn't a build dependency? [build-deps]
> rwho-1.2.4: log4c rdepends on expat, but it isn't a build dependency? [build-deps]
> mpd-0.19.1: mpd rdepends on libsmbclient, but it isn't a build dependency? [build-deps]
> mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on libpostproc, but it isn't a build dependency? [build-deps]
> mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on libvorbis, but it isn't a build dependency? [build-deps]
> mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on libxscrnsaver, but it isn't a build dependency? [build-deps]
> mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on mpg123, but it isn't a build dependency? [build-deps]
> mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on portaudio-v19, but it isn't a build dependency? [build-deps]
> netkit-rwho-0.17: netkit-rwho-client rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
> proftpd-1.3.5: proftpd rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
> qtwayland-5.4.0+gitAUTOINC+a0c5ba81f4: qtwayland-plugins rdepends on libxcomposite, but it isn't a build dependency? [build-deps]
> qtwebkit-5.4.0+gitAUTOINC+af15cefb39: qtwebkit rdepends on libxcomposite, but it isn't a build dependency? [build-deps]
> squid-3.4.7: squid rdepends on libpam, but it isn't a build dependency? [build-deps]
> sysklogd-1.5: sysklogd rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
>
>
> count: 56	issue: file-rdeps
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
> imsettings-1.6.7: imsettings requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
> libbonobo-2.32.1: libbonobo requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
> libnewt-0.52.18: whiptail requires libnewt.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> libnewt-0.52.18: whiptail requires libnewt.so, but no providers in its RDEPENDS [file-rdeps]
> libnewt-python-0.52.18: libnewt-python requires libnewt.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> libnewt-python-0.52.18: libnewt-python requires libnewt.so, but no providers in its RDEPENDS [file-rdeps]
> lio-utils-4.1+gitAUTOINC+28bd928655: lio-utils requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
> lmsensors-config-1.0: lmsensors-config-cgi requires /usr/bin/rrdcgi, but no providers in its RDEPENDS [file-rdeps]
> nodejs-0.8.18: nodejs requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
> ntp-4.2.8: ntp-utils requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
> numptyphysics-0.2+svnr109: numptyphysics requires /bin/bash, /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
> opensaf-4.5.0: opensaf requires /bin/bash, /usr/bin/python, but no providers in its RDEPENDS [file-rdeps]
> packagekit-0.5.6: packagekit requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
> pax-utils-0.9.2: pax-utils requires /usr/bin/python, but no providers in its RDEPENDS [file-rdeps]
> pcsc-lite-1.8.6: pcsc-lite requires /usr/bin/python, but no providers in its RDEPENDS [file-rdeps]
> php-5.4.33: php requires /tmp/work/armv5te-oe-linux-gnueabi/php/5.4.33-r0/image/usr/bin/php, but no providers in its RDEPENDS [file-rdeps]
> php-5.4.33: php requires /tmp/work/core2-64-oe-linux/php/5.4.33-r0/image/usr/bin/php, but no providers in its RDEPENDS [file-rdeps]
> php-5.4.33: php requires /tmp/work/i586-oe-linux/php/5.4.33-r0/image/usr/bin/php, but no providers in its RDEPENDS [file-rdeps]
> pm-qa-0.4.14: pm-qa requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
> qt-creator-2.8.1: qt-creator requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
> systemd-216+gitAUTOINC+5d0ae62c66: systemd-kernel-install requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
> tracker-0.14.2: tracker-nautilus-extension requires libnautilus-extension.so.1()(64bit), but no providers in its RDEPENDS [file-rdeps]
> tracker-0.14.2: tracker-nautilus-extension requires libnautilus-extension.so.1, but no providers in its RDEPENDS [file-rdeps]
> ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: ubx-utils requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
> unionfs-fuse-0.26: unionfs-fuse requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
> usbpath-0.0+svnr3172: usbpath requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
> wvstreams-4.6.1: wvstreams requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
>
>
> count: 118	issue: version-going-backwards
>
>
>

