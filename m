Return-Path: <joe@deserted.net>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7774C735BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 16:10:39 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id h15so45102445igd.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 08:10:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=2eWFwjU/wq4X3yX0gQ/2bWEOIkoUa+MIjAd9SvDRAKA=;
	b=lOyL1dVG641YqoenyZWMzE+2Or9OQxvuKKhWo6WNqgKP1jxoeWA0Me3DI6t7kCt5Uf
	+fKyr8lrJG/6KTllWvnKE4AnGiDCgd+u/WhynAsHuYzwKZ0RTVmezR1ub48/Om28munb
	m6T4+f4++M7Ouny3aOwmmc/WhIG/t8k7dh+dxpAISQob40KVC7BG1jrBMwenTB+wWVuW
	au3JZvvUdFwEG8Wi3u0FrpU8TJNsjNU9W0AhBuDfC1LEGwaPutJQvSYBZbzcork/XHCm
	/bQk4yuCuaLtGgg+3y5pWFopxgiLFew4+LpI47OJ7rGZlZnoUUg7KCTOQo3rpRBzF0St
	9VxQ==
X-Gm-Message-State: ALoCoQlB8s3iL0zmVOupzyZu7pTaYfHhl7s8lg7F1Ep9zrA0MCICFbrnuY9SMyZQZ1C4oZQZsZLG
MIME-Version: 1.0
X-Received: by 10.107.128.69 with SMTP id b66mr7255137iod.30.1424362239938;
	Thu, 19 Feb 2015 08:10:39 -0800 (PST)
Received: by 10.42.21.13 with HTTP; Thu, 19 Feb 2015 08:10:39 -0800 (PST)
In-Reply-To: <20150219114615.GA2311@jama>
References: <20150218155738.GA2276@jama>
	<20150219114615.GA2311@jama>
Date: Thu, 19 Feb 2015 11:10:39 -0500
Message-ID: <CANBf+V3UUO4yV2VveFZAsNSVYgnfseQiAWSSCWwf0Az1oAtQoQ@mail.gmail.com>
From: Joe MacDonald <joe@deserted.net>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2015-02-18
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
X-List-Received-Date: Thu, 19 Feb 2015 16:10:42 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 19, 2015 at 6:46 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Feb 18, 2015 at 04:57:38PM +0100, Martin Jansa wrote:
>> http://www.openembedded.org/wiki/Bitbake_World_Status
>>
>> The metadata were updated between the builds, so the results aren't very
>> consistent between MACHINEs, but still it means that we have more issues
>> than last time, please help fixing them.
>
> snort failure is again very nasty, because it's m4 which eats all
> available memory and swap before it's killed by OOM killer.
>
> Luckily it always picked m4
>
> [Wed Feb 18 19:00:51 2015] Out of memory: Kill process 28522 (m4) score 961 or sacrifice child

Well that can't stand.  I've blacklisted snort until we can get it sorted.

-J.

> [Wed Feb 18 19:10:51 2015] Out of memory: Kill process 45228 (m4) score 958 or sacrifice child
> [Wed Feb 18 19:20:18 2015] Out of memory: Kill process 76957 (m4) score 961 or sacrifice child
> [Wed Feb 18 19:30:00 2015] Out of memory: Kill process 78689 (m4) score 962 or sacrifice child
> [Wed Feb 18 19:38:46 2015] Out of memory: Kill process 80602 (m4) score 962 or sacrifice child
> [Wed Feb 18 21:57:02 2015] Out of memory: Kill process 65803 (m4) score 970 or sacrifice child
> [Wed Feb 18 22:05:02 2015] Out of memory: Kill process 66297 (m4) score 970 or sacrifice child
> [Wed Feb 18 22:13:00 2015] Out of memory: Kill process 69325 (m4) score 970 or sacrifice child
> [Wed Feb 18 22:21:01 2015] Out of memory: Kill process 69908 (m4) score 970 or sacrifice child
> [Wed Feb 18 22:29:00 2015] Out of memory: Kill process 70511 (m4) score 970 or sacrifice child
> [Wed Feb 18 22:36:55 2015] Out of memory: Kill process 71169 (m4) score 970 or sacrifice child
> [Wed Feb 18 22:44:55 2015] Out of memory: Kill process 71675 (m4) score 970 or sacrifice child
> [Thu Feb 19 03:28:56 2015] Out of memory: Kill process 71342 (m4) score 970 or sacrifice child
>
>> == Failed tasks 2015-02-18 ==
>>
>> INFO: jenkins-job.sh-1.1.0 Complete log available at http://logs.nslu2-linux.org/buildlogs/oe/world/log.report.20150218_154659.log
>>
>> === common (9) ===
>>     * /meta-openembedded/meta-efl/recipes-efl/e17/diskio_svn.bb, do_compile
>>     * /meta-openembedded/meta-efl/recipes-efl/efl/entrance_svn.bb, do_compile
>>     * /meta-openembedded/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb, do_compile
>>     * /meta-openembedded/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb, do_configure
>>     * /meta-openembedded/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb, do_compile
>>     * /meta-openembedded/meta-networking/recipes-support/wireshark/wireshark_1.12.3.bb, do_configure
>>     * /meta-openembedded/meta-oe/recipes-extended/unixodbc/unixodbc_2.3.2.bb, do_configure
>>     * /meta-openembedded/meta-oe/recipes-support/fltk/fltk_1.1.10.bb, do_compile
>>     * /meta-openembedded/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb, do_compile
>>
>> === common-x86 (3) ===
>>     * /meta-openembedded/meta-networking/recipes-support/nis/yp-tools_2.12.bb, do_compile
>>     * /meta-openembedded/meta-oe/recipes-kernel/ktap/ktap-module_0.4.bb, do_compile
>>     * /meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compile
>>
>> === qemuarm (4) ===
>>     * /meta-openembedded/meta-oe/recipes-benchmark/fio/fio_2.0.5.bb, do_compile
>>     * /meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb, do_compile
>>     * /meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb, do_compile
>>     * /meta-smartphone/meta-android/recipes-multimedia/android-audiosystem/android-audiosystem_bzr.bb, do_compile
>>
>> === qemux86 (3) ===
>>     * /openembedded-core/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb, do_configure
>>     * /openembedded-core/meta/recipes-qt/qt4/qt-mobility-embedded_1.2.0.bb, do_compile
>>     * /openembedded-core/meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb, do_compile
>>
>> === qemux86_64 (1) ===
>>     * /openembedded-core/meta/recipes-bsp/grub/grub-efi_2.00.bb, do_compile
>>
>> === Number of failed tasks (41) ===
>> {| class=wikitable
>> |-
>> || qemuarm    || 13    || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150216_162745.log// || http://errors.yoctoproject.org:80/Errors/Build/4712/
>> |-
>> || qemux86    || 15    || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150217_073432.log// || http://errors.yoctoproject.org:80/Errors/Build/4723/
>> |-
>> || qemux86_64         || 13    || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150218_002454.log// || http://errors.yoctoproject.org:80/Errors/Build/4791/
>> |}
>>
>> === PNBLACKLISTs (47) ===
>>
>> === QA issues (140) ===
>> {| class=wikitable
>> !| Count              ||Issue
>> |-
>> ||0   ||version-going-backwards
>> |-
>> ||1   ||libdir
>> |-
>> ||23  ||build-deps
>> |-
>> ||3   ||already-stripped
>> |-
>> ||50  ||file-rdeps
>> |-
>> ||63  ||textrel
>> |}
>>
>> PNBLACKLISTs:
>> openembedded-core/:
>> meta-browser:
>> meta-openembedded:
>> meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb:PNBLACKLIST[ifuse] ?= "depends on blacklisted libimobiledevice"
>> meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gnome-mplayer] ?= "rdepends on blacklisted mplayer"
>> meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb:PNBLACKLIST[gcr] ?= "CONFLICT: 4 files conflict with gnome-keyring"
>> meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb:PNBLACKLIST[gdm] ?= "Depends on broken polkit-gnome"
>> meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb:PNBLACKLIST[gnome-menus3] ?= "CONFLICT: 24 files are conflicting with gnome-menus"
>> meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnome-panel3] ?= "CONFLICT: depends on libgweather3 which conflicts with libgweather"
>> meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgweather3] ?= "CONFLICT: 876 files are conflicting with libgweather"
>> meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?= "BROKEN: doesn't build with B!=S"
>> meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:PNBLACKLIST[xbmc] ?= "/usr/include/c++/ctime:70:11: error: '::gmtime' has not been declared"
>> meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:PNBLACKLIST[coriander] ?= "BROKEN: fails to use SDL probably because libsdl-config was removed, error: unknown type name 'SDL_Overlay'"
>> meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb:PNBLACKLIST[renderer-service-upnp] ?= "BROKEN: doesn't build with B!=S (trying to install rendererconsole.py from ${B} instead of ${S})"
>> meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:PNBLACKLIST[lksctp-tools] ?= "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
>> meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb:PNBLACKLIST[libimobiledevice] ?= "cannot run test program while cross compiling"
>> meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?= "BROKEN: depends on broken libftdi"
>> meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zeroc-ice] ?= "BROKEN: not compatible with default db version"
>> meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb:PNBLACKLIST[polkit-gnome] ?= "Fails to build, m4:configure.ac:125: recursion limit of 1024 exceeded, use -L<N> to change it"
>> meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurface] ?= "Needs to be upgraded for compatibility with new libdivecomputer"
>> meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-box2d] ?= "BROKEN: doesn't build with B!=S"
>> meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?= "BROKEN: doesn't build with B!=S (flex: can't open lex.lex)"
>> meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[xf86-input-mtev] ?= "BROKEN: doesn't build with B!=S (Makefile without ${S} in sed call)"
>> meta-oe/recipes-qt/qconnman/qconnman-e_git.bb:PNBLACKLIST[qconnman-e] ?= "BROKEN: doesn't work with B!=S, ls: cannot access *.pro: No such file or directory"
>> meta-oe/recipes-qt/qconnman/qconnman_git.bb:PNBLACKLIST[qconnman] ?= "BROKEN: doesn't work with B!=S, ls: cannot access *.pro: No such file or directory"
>> meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb:PNBLACKLIST[sylpheed] ?= "BROKEN: Doesn't work with B!=S"
>> meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd] ?= "BROKEN: doesn't build with B!=S"
>> meta-oe/recipes-support/maliit/maliit-framework_git.bb:PNBLACKLIST[maliit-framework] ?= "BROKEN: Wasn't updated to work with B!=S, maybe incorrectly inherits autotools"
>> meta-oe/recipes-support/maliit/maliit-plugins_git.bb:PNBLACKLIST[maliit-plugins] ?= "BROKEN: depends on broken maliit-framework"
>> meta-oe/recipes-support/mongodb/mongodb_git.bb:PNBLACKLIST[mongodb] ?= "Fails to build with system boost"
>> meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmotif] ?= "BROKEN: doesn't build with B!=S"
>> meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala-terminal] ?= "BROKEN: Doesn't work with B!=S, touch: cannot touch `src/.stamp': No such file or directory"
>> meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb:PNBLACKLIST[xfce4-vala] ?= "Fails to build since vala upgrade to 0.26.1"
>> meta-qt5:
>> meta-smartphone:
>> meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
>> meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
>> meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] = "rdepends on blacklisted mplayer2"
>> meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
>> meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompass] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
>> meta-webos-ports:
>> conf/world_fixes.inc:PNBLACKLIST[mplayer2] = ""
>> conf/world_fixes.inc:PNBLACKLIST[android-system] = "depends on lxc from meta-virtualiazation which isn't included in my world builds"
>> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be tested so much"
>> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be tested so much"
>> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested so much"
>> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested so much"
>> conf/world_fixes.inc:PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be tested so much"
>> conf/world_mask.inc:PNBLACKLIST[evince] = "fails to build"
>> conf/world_mask.inc:PNBLACKLIST[epiphany] = "fails to build"
>> conf/world_mask.inc:PNBLACKLIST[gnome-power-manager] = "fails to build"
>> conf/world_mask.inc:PNBLACKLIST[gnome-bluetooth] = "fails to build"
>> conf/world_mask.inc:PNBLACKLIST[media-ctl] = "fails to build"
>> QA issues by type:
>> count: 3      issue: already-stripped
>> qwt-6.0.1: File '/usr/lib/libqwt.so.6.0.1' from qwt was already stripped, this will prevent future debugging! [already-stripped]
>> qwt-6.0.1: File '/usr/lib/libqwtmathml.so.6.0.1' from qwt was already stripped, this will prevent future debugging! [already-stripped]
>> qwt-6.0.1: File '/usr/lib/qt4/plugins/designer/libqwt_designer_plugin.so' from qwt was already stripped, this will prevent future debugging! [already-stripped]
>>
>>
>> count: 1      issue: libdir
>> chromium-dbg: found library in wrong location: /usr/bin/chrome/.debug/libffmpegsumo.so [libdir]
>>
>>
>> count: 63     issue: textrel
>> chromium-38.0.2125.101: ELF binary '/tmp/work/i586-oe-linux/chromium/38.0.2125.101-r0/packages-split/chromium/usr/bin/chrome/libffmpegsumo.so' has relocations in .text [textrel]
>> gstreamer1.0-libav-1.4.5: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/gstreamer1.0-libav/1.4.5-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so' has relocations in .text [textrel]
>> gstreamer1.0-libav-1.4.5: ELF binary '/tmp/work/i586-oe-linux/gstreamer1.0-libav/1.4.5-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so' has relocations in .text [textrel]
>> libav-9.16: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/libav/9.16-r0/packages-split/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in .text [textrel]
>> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in .text [textrel]
>> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavdevice/usr/lib/libavdevice.so.53.2.0' has relocations in .text [textrel]
>> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavfilter/usr/lib/libavfilter.so.3.3.0' has relocations in .text [textrel]
>> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavformat/usr/lib/libavformat.so.54.20.4' has relocations in .text [textrel]
>> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavresample/usr/lib/libavresample.so.1.0.1' has relocations in .text [textrel]
>> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavutil/usr/lib/libavutil.so.52.3.0' has relocations in .text [textrel]
>> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libswscale/usr/lib/libswscale.so.2.1.1' has relocations in .text [textrel]
>> libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc/usr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
>> libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/i586-oe-linux/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc/usr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
>> mpg123-1.21.0: ELF binary '/tmp/work/i586-oe-linux/mpg123/1.21.0-r0/packages-split/mpg123/usr/lib/libmpg123.so.0.40.3' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-audio/usr/lib/python3.3/lib-dynload/ossaudiodev.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-codecs/usr/lib/python3.3/lib-dynload/_codecs_tw.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-core/usr/lib/python3.3/lib-dynload/binascii.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-crypt/usr/lib/python3.3/lib-dynload/_sha256.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-ctypes/usr/lib/python3.3/lib-dynload/_ctypes_test.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-curses/usr/lib/python3.3/lib-dynload/_curses.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-elementtree/usr/lib/python3.3/lib-dynload/_elementtree.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-fcntl/usr/lib/python3.3/lib-dynload/fcntl.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-gdbm/usr/lib/python3.3/lib-dynload/_gdbm.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-io/usr/lib/python3.3/lib-dynload/_socket.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-json/usr/lib/python3.3/lib-dynload/_json.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-lang/usr/lib/python3.3/lib-dynload/_bisect.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-math/usr/lib/python3.3/lib-dynload/cmath.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-misc/usr/lib/python3.3/lib-dynload/_posixsubprocess.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-mmap/usr/lib/python3.3/lib-dynload/mmap.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-multiprocessing/usr/lib/python3.3/lib-dynload/_multiprocessing.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-profile/usr/lib/python3.3/lib-dynload/_lsprof.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-readline/usr/lib/python3.3/lib-dynload/readline.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-resource/usr/lib/python3.3/lib-dynload/resource.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-syslog/usr/lib/python3.3/lib-dynload/syslog.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-textutils/usr/lib/python3.3/lib-dynload/_csv.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-unixadmin/usr/lib/python3.3/lib-dynload/grp.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-xml/usr/lib/python3.3/lib-dynload/pyexpat.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-audio/usr/lib/python3.3/lib-dynload/ossaudiodev.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-codecs/usr/lib/python3.3/lib-dynload/_codecs_cn.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-core/usr/lib/python3.3/lib-dynload/binascii.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-crypt/usr/lib/python3.3/lib-dynload/_sha256.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-ctypes/usr/lib/python3.3/lib-dynload/_ctypes_test.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-curses/usr/lib/python3.3/lib-dynload/_curses.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-elementtree/usr/lib/python3.3/lib-dynload/_elementtree.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-fcntl/usr/lib/python3.3/lib-dynload/fcntl.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-gdbm/usr/lib/python3.3/lib-dynload/_gdbm.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-io/usr/lib/python3.3/lib-dynload/_socket.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-json/usr/lib/python3.3/lib-dynload/_json.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-lang/usr/lib/python3.3/lib-dynload/_bisect.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-math/usr/lib/python3.3/lib-dynload/cmath.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-misc/usr/lib/python3.3/lib-dynload/_md5.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-mmap/usr/lib/python3.3/lib-dynload/mmap.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-multiprocessing/usr/lib/python3.3/lib-dynload/_multiprocessing.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-profile/usr/lib/python3.3/lib-dynload/_lsprof.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-readline/usr/lib/python3.3/lib-dynload/readline.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-resource/usr/lib/python3.3/lib-dynload/resource.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-syslog/usr/lib/python3.3/lib-dynload/syslog.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-textutils/usr/lib/python3.3/lib-dynload/_csv.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-unixadmin/usr/lib/python3.3/lib-dynload/grp.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-xml/usr/lib/python3.3/lib-dynload/pyexpat.cpython-33m.so' has relocations in .text [textrel]
>> qtwebkit-5.4.0+gitAUTOINC+3a2cb4770c: ELF binary '/tmp/work/i586-oe-linux/qtwebkit/5.4.0+gitAUTOINC+3a2cb4770c-r0/packages-split/qtwebkit/usr/lib/libQt5WebKit.so.5.4.0' has relocations in .text [textrel]
>> webkit-efl-1.11.0: ELF binary '/tmp/work/i586-oe-linux/webkit-efl/1_1.11.0-r0/packages-split/webkit-efl/usr/lib/libjavascriptcore_efl.so.1.11.0' has relocations in .text [textrel]
>> webkit-gtk-1.8.3: ELF binary '/tmp/work/i586-oe-linux/webkit-gtk/1.8.3-r1/packages-split/libjavascriptcore/usr/lib/libjavascriptcoregtk-1.0.so.0.13.4' has relocations in .text [textrel]
>>
>>
>> count: 23     issue: build-deps
>> emacs-23.4: emacs rdepends on ncurses-libtinfo, but it isn't a build dependency? [build-deps]
>> exquisite-0.0.1+svnr82070: exquisite rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
>> freetds-0.92.79: freetds rdepends on readline, but it isn't a build dependency? [build-deps]
>> geoclue-2.0.0: geoclue rdepends on geoip, but it isn't a build dependency? [build-deps]
>> glade3-3.8.5: glade3 rdepends on libpython2, but it isn't a build dependency? [build-deps]
>> gpm-1.99.7: gpm rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
>> grub-efi-2.00: grub-efi rdepends on fuse, but it isn't a build dependency? [build-deps]
>> irda-utils-0.9.18: irda-utils rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
>> libwebp-0.4.0: libwebp-bin rdepends on libgl-mesa, but it isn't a build dependency? [build-deps]
>> libwebp-0.4.0: libwebp-bin rdepends on mesa-glut, but it isn't a build dependency? [build-deps]
>> log4c-1.2.4: log4c rdepends on expat, but it isn't a build dependency? [build-deps]
>> mpd-0.19.1: mpd rdepends on libsmbclient, but it isn't a build dependency? [build-deps]
>> netkit-rwho-0.17: netkit-rwho-client rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
>> pkcs11-helper-1.11: pkcs11-helper rdepends on nspr, but it isn't a build dependency? [build-deps]
>> pkcs11-helper-1.11: pkcs11-helper rdepends on nss, but it isn't a build dependency? [build-deps]
>> qtwayland-5.4.0+gitAUTOINC+50d6c0ae94: qtwayland-plugins rdepends on libxcomposite, but it isn't a build dependency? [build-deps]
>> qtwebkit-5.4.0+gitAUTOINC+3a2cb4770c: qtwebkit rdepends on libxcomposite, but it isn't a build dependency? [build-deps]
>> squid-3.4.7: squid rdepends on libpam, but it isn't a build dependency? [build-deps]
>> stunnel-5.10: stunnel rdepends on libcap, but it isn't a build dependency? [build-deps]
>> stunnel-5.10: stunnel rdepends on liblzma, but it isn't a build dependency? [build-deps]
>> stunnel-5.10: stunnel rdepends on libsystemd, but it isn't a build dependency? [build-deps]
>> sysklogd-1.5.1: sysklogd rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
>> syslog-ng-3.5.4.1: syslog-ng-libs rdepends on util-linux-libuuid, but it isn't a build dependency? [build-deps]
>>
>>
>> count: 50     issue: file-rdeps
>> apache2-2.4.10: apache2-dev requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
>> chkconfig-1.3.58: chkconfig requires libnewt.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
>> chkconfig-1.3.58: chkconfig requires libnewt.so, but no providers in its RDEPENDS [file-rdeps]
>> cloud9-0.6: cloud9 requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
>> dvb-apps-1.1.1: dvb-apps requires libucsi.so()(64bit), libdvbapi.so()(64bit), libdvbcfg.so()(64bit), libdvben50221.so()(64bit), libdvbsec.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
>> dvb-apps-1.1.1: dvb-apps requires libucsi.so, libdvben50221.so, libdvbsec.so, libdvbcfg.so, libdvbapi.so, but no providers in its RDEPENDS [file-rdeps]
>> dvb-apps-1.1.1: dvb-femon requires libdvbapi.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
>> dvb-apps-1.1.1: dvb-femon requires libdvbapi.so, but no providers in its RDEPENDS [file-rdeps]
>> dvb-apps-1.1.1: dvb-scan requires libdvbsec.so()(64bit), libdvbapi.so()(64bit), libdvbcfg.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
>> dvb-apps-1.1.1: dvb-scan requires libdvbsec.so, libdvbcfg.so, libdvbapi.so, but no providers in its RDEPENDS [file-rdeps]
>> dvb-apps-1.1.1: dvbdate requires libucsi.so()(64bit), libdvbapi.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
>> dvb-apps-1.1.1: dvbdate requires libucsi.so, libdvbapi.so, but no providers in its RDEPENDS [file-rdeps]
>> dvb-apps-1.1.1: dvbnet requires libdvbapi.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
>> dvb-apps-1.1.1: dvbnet requires libdvbapi.so, but no providers in its RDEPENDS [file-rdeps]
>> dvb-apps-1.1.1: dvbtraffic requires libdvbapi.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
>> dvb-apps-1.1.1: dvbtraffic requires libdvbapi.so, but no providers in its RDEPENDS [file-rdeps]
>> emacs-23.4: emacs requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
>> fakeroot-1.18.4: fakeroot requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
>> fbida-2.09+gitAUTOINC+6aa5563cb3: fbida requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
>> foxtrotgps-1.1.1: foxtrotgps requires /usr/bin/python, /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
>> gammu-1.32.0: gammu requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
>> gammu-1.32.0: gammu-dev requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
>> gateone-1.2: gateone requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
>> giflib-4.1.6: giflib-utils requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
>> gnome-desktop-2.32.1: gnome-desktop requires /usr/bin/python, but no providers in its RDEPENDS [file-rdeps]
>> gnome-panel-2.32.1: gnome-panel requires /usr/bin/python, but no providers in its RDEPENDS [file-rdeps]
>> groff-1.22.2: groff requires /bin/sed, but no providers in its RDEPENDS [file-rdeps]
>> gupnp-0.20.12: gupnp-dev requires /usr/bin/python, but no providers in its RDEPENDS [file-rdeps]
>> hplip-3.12.6: hplip-filter requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
>> ipvsadm-1.26: ipvsadm requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
>> libbonobo-2.32.1: libbonobo requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
>> libnewt-0.52.18: whiptail requires libnewt.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
>> libnewt-0.52.18: whiptail requires libnewt.so, but no providers in its RDEPENDS [file-rdeps]
>> libnewt-python-0.52.18: libnewt-python requires libnewt.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
>> libnewt-python-0.52.18: libnewt-python requires libnewt.so, but no providers in its RDEPENDS [file-rdeps]
>> lio-utils-4.1+gitAUTOINC+28bd928655: lio-utils requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
>> lmsensors-config-1.0: lmsensors-config-cgi requires /usr/bin/rrdcgi, but no providers in its RDEPENDS [file-rdeps]
>> nodejs-0.8.18: nodejs requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
>> numptyphysics-0.2+svnr109: numptyphysics requires /bin/bash, /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
>> opensaf-4.5.0: opensaf requires /bin/bash, /usr/bin/python, but no providers in its RDEPENDS [file-rdeps]
>> packagekit-0.5.6: packagekit requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
>> pcsc-lite-1.8.6: pcsc-lite requires /usr/bin/python, but no providers in its RDEPENDS [file-rdeps]
>> pm-qa-0.4.14: pm-qa requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
>> qt-creator-2.8.1: qt-creator requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
>> tracker-0.14.2: tracker-nautilus-extension requires libnautilus-extension.so.1()(64bit), but no providers in its RDEPENDS [file-rdeps]
>> tracker-0.14.2: tracker-nautilus-extension requires libnautilus-extension.so.1, but no providers in its RDEPENDS [file-rdeps]
>> ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: ubx-utils requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
>> unionfs-fuse-0.26: unionfs-fuse requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
>> usbpath-0.0+svnr3172: usbpath requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
>> wvstreams-4.6.1: wvstreams requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
>>
>>
>> count: 0      issue: version-going-backwards
>> --
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
>
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
Joe MacDonald
:wq

