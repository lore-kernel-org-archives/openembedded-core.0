Return-Path: <vomegaz@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3300071633;
	Tue, 24 Feb 2015 11:32:14 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id h11so24655371wiw.3;
	Tue, 24 Feb 2015 03:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=rIA8yfkCtCYulX69hqKSpmvg/QaTmOdtDTN6bdG11H8=;
	b=ZrqtTjIakEqwylInL198UvPp1lGNge1NOPR9OtzfWhc6OQ+msBc50eQomVch6Z/vuu
	K7zY47BQkZ4LnjaqCKhKF6O/lNQfsbQEY9zkqveqAeynpfD2xrV7/STk66AimIos8H2J
	68Xwke9pe/bEjEWP+DkFMIlDx9pzCS19yhLjCU0h9HR907+ElFmVC6auLpcg1mDbknYd
	uD6F/rzBzhtt19V7A3SmP03lDCWmOcdvgjbMVeY3hOxdydMrX5gKnH5ZkNS3VRYV79Lj
	9gkJ6YoQN/88hhKEq2FQvNwuG3DcAFeU5XJbSJYC6GP79cTAhnWAdrSypf3L/EVArsRX
	7D3g==
X-Received: by 10.180.89.238 with SMTP id br14mr7040914wib.68.1424777535521;
	Tue, 24 Feb 2015 03:32:15 -0800 (PST)
MIME-Version: 1.0
Sender: vomegaz@gmail.com
Received: by 10.194.134.97 with HTTP; Tue, 24 Feb 2015 03:31:35 -0800 (PST)
In-Reply-To: <54EA0B1E.5020905@gmail.com>
References: <20150220230920.GA2306@jama> <54EA0B1E.5020905@gmail.com>
From: Thomas PERROT <thomas.perrot@tupi.fr>
Date: Tue, 24 Feb 2015 12:31:35 +0100
X-Google-Sender-Auth: 8YRr3E8a7NWTCLK5-UsT6OA7QTQ
Message-ID: <CAGXeWgmKeS=JcaaffbNOh4bZz1D6xWfFqsgy_oiQ-w6JyakCbg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: State of bitbake world, Failed tasks 2015-02-20
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: thomas.perrot@tupi.fr
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Feb 2015 11:32:16 -0000
Content-Type: multipart/alternative; boundary=e89a8f3ba1ebe387a7050fd3de9e

--e89a8f3ba1ebe387a7050fd3de9e
Content-Type: text/plain; charset=UTF-8

Hi Martin,

Please, what is it your configuration to run "bitbake world" ?
I tried to run "bitbake world" only on oe-core, for some targets and I
obtain already the same issue, and I don't see this issue in your list of
failed tasks.

Here <https://travis-ci.org/tprrt/meta-musl>, I also tried with meta-musl
and I obtain the same issue.

The issue:

ERROR: Nothing PROVIDES 'virtual/egl' (but
/tmp/build_env/meta/recipes-graphics/clutter/clutter-1.0_1.20.0.bb,
/tmp/build_env/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb,
/tmp/build_env/meta/recipes-graphics/cogl/cogl-1.0_1.18.2.bb,
/tmp/build_env/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb,
/tmp/build_env/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb,
/tmp/build_env/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb,
/tmp/build_env/meta/recipes-graphics/wayland/weston_1.6.0.bb DEPENDS
on or otherwise requires it)

ERROR: mesa PROVIDES virtual/egl but was skipped: missing required
distro feature 'opengl' (not in DISTRO_FEATURES)

ERROR: mesa PROVIDES virtual/egl but was skipped: missing required
distro feature 'opengl' (not in DISTRO_FEATURES)

ERROR: Required build target 'clutter-gst-1.0' has no buildable providers.

Missing or unbuildable dependency chain was: ['clutter-gst-1.0',
'clutter-1.0', 'virtual/egl']


*Best regards*

-----------------------------------------------------------------------------------------

*Thomas P.*


On 22 February 2015 at 18:00, akuster808 <akuster808@gmail.com> wrote:

> Martin
>
> On 02/20/2015 03:09 PM, Martin Jansa wrote:
>
>> http://www.openembedded.org/wiki/Bitbake_World_Status
>>
>> == Failed tasks 2015-02-20 ==
>>
>> INFO: jenkins-job.sh-1.1.0 Complete log available at
>> http://logs.nslu2-linux.org/buildlogs/oe/world/log.report.
>> 20150220_202958.log
>>
>> === common (5) ===
>>      * /meta-openembedded/meta-efl/recipes-navigation/mcnavi/mcna
>> vi_0.3.4.bb, do_compile
>>      * /meta-openembedded/meta-networking/recipes-daemons/ptpd/
>> ptpd_2.3.1-rc2.bb, do_compile
>>      * /meta-openembedded/meta-networking/recipes-support/nis/
>> yp-tools_2.12.bb, do_compile
>>      * /meta-openembedded/meta-oe/recipes-extended/unixodbc/unix
>> odbc_2.3.2.bb, do_configure
>>      * /meta-openembedded/meta-oe/recipes-support/start-stop-daemon/
>> start-stop-daemon_1.16.0.2.bb, do_compile
>>
>> === common-x86 (2) ===
>>      * /meta-openembedded/meta-oe/recipes-kernel/ktap/ktap-module_0.4.bb,
>> do_compile
>>      * /meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb,
>> do_compile
>>
>> === qemuarm (6) ===
>>      * /meta-openembedded/meta-networking/recipes-connectivity/snort/
>> snort_2.9.6.0.bb, do_configure
>>      * /meta-openembedded/meta-networking/recipes-support/wireshark/
>> wireshark_1.12.3.bb, do_configure
>>
>
> Do you have my latest patch for wireshark?
>
>  b51998bf63a625757f0497342b53e0c351814fba in master-next
>
> - armin
>
>
>       * /meta-openembedded/meta-oe/recipes-benchmark/fio/fio_2.0.5.bb,
>> do_compile
>>      * /meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs
>> 4_0.4.12.bb, do_compile
>>      * /meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs
>> _0.8.18.bb, do_compile
>>      * /meta-smartphone/meta-android/recipes-multimedia/android-
>> audiosystem/android-audiosystem_bzr.bb, do_compile
>>
>> === qemux86 (0) ===
>>
>> === qemux86_64 (1) ===
>>      * /meta-qt5/recipes-qt/qt5/qt5-creator_3.3.0.bb, do_populate_sysroot
>>
>> === Number of failed tasks (27) ===
>> {| class=wikitable
>> |-
>> || qemuarm      || 11    || http://logs.nslu2-linux.org/
>> buildlogs/oe/world//log.world.20150218_225838.log// ||
>> http://errors.yoctoproject.org:80/Errors/Build/4802/
>> |-
>> || qemux86      || 8     || http://logs.nslu2-linux.org/
>> buildlogs/oe/world//log.world.20150219_132710.log// ||
>> http://errors.yoctoproject.org:80/Errors/Build/4806/
>> |-
>> || qemux86_64   || 8     || http://logs.nslu2-linux.org/
>> buildlogs/oe/world//log.world.20150220_044745.log// ||
>> http://errors.yoctoproject.org:80/Errors/Build/4811/
>> |}
>>
>> === PNBLACKLISTs (52) ===
>>
>> === QA issues (143) ===
>> {| class=wikitable
>> !| Count                ||Issue
>> |-
>> ||0     ||version-going-backwards
>> |-
>> ||1     ||libdir
>> |-
>> ||26    ||build-deps
>> |-
>> ||3     ||already-stripped
>> |-
>> ||50    ||file-rdeps
>> |-
>> ||63    ||textrel
>> |}
>>
>>
>> PNBLACKLISTs:
>> openembedded-core/:
>> meta-browser:
>> meta-openembedded:
>> meta-efl/recipes-efl/e17/diskio_svn.bb:PNBLACKLIST[diskio] ?= "broken:
>> switch to https://git.enlightenment.org/enlightenment/modules/diskio.git/
>> and fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58.
>> invalid state name: 'off'. "default" state must always be first."
>> meta-efl/recipes-efl/efl/entrance_svn.bb:PNBLACKLIST[entrance] ?=
>> "broken: switch to https://git.enlightenment.org/misc/entrance.git and
>> fix 0.0.4+svnr82070-r7/entrance/data/themes/old/default.edc:678. invalid
>> state name: 'defaault'. "default" state must always be first."
>> meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb:PNBLACKLIST[ifuse]
>> ?= "depends on blacklisted libimobiledevice"
>> meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gnome-mplayer]
>> ?= "rdepends on blacklisted mplayer"
>> meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb:PNBLACKLIST[gcr] ?= "CONFLICT:
>> 4 files conflict with gnome-keyring"
>> meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb:PNBLACKLIST[gdm] ?= "Depends
>> on broken polkit-gnome"
>> meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb:PNBLACKLIST[gnome-menus3]
>> ?= "CONFLICT: 24 files are conflicting with gnome-menus"
>> meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnome-panel3]
>> ?= "CONFLICT: depends on libgweather3 which conflicts with libgweather"
>> meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgweather3]
>> ?= "CONFLICT: 876 files are conflicting with libgweather"
>> meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?=
>> "BROKEN: doesn't build with B!=S"
>> meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:PNBLACKLIST[xbmc]
>> ?= "/usr/include/c++/ctime:70:11: error: '::gmtime' has not been declared"
>> meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:
>> PNBLACKLIST[coriander] ?= "BROKEN: fails to use SDL probably because
>> libsdl-config was removed, error: unknown type name 'SDL_Overlay'"
>> meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb:
>> PNBLACKLIST[renderer-service-upnp] ?= "BROKEN: doesn't build with B!=S
>> (trying to install rendererconsole.py from ${B} instead of ${S})"
>> meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb:PNBLACKLIST[snort]
>> ?= "BROKEN: autotools processing causes OOM condition on configure"
>> meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:
>> PNBLACKLIST[lksctp-tools] ?= "${@base_contains('DISTRO_FEATURES',
>> 'ld-is-gold', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
>> meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb:
>> PNBLACKLIST[libimobiledevice] ?= "cannot run test program while cross
>> compiling"
>> meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?=
>> "BROKEN: depends on broken libftdi"
>> meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zeroc-ice]
>> ?= "BROKEN: not compatible with default db version"
>> meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb:PNBLACKLIST[polkit-gnome]
>> ?= "Fails to build, m4:configure.ac:125: recursion limit of 1024
>> exceeded, use -L<N> to change it"
>> meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurface]
>> ?= "Needs to be upgraded for compatibility with new libdivecomputer"
>> meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-box2d]
>> ?= "BROKEN: doesn't build with B!=S"
>> meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?= "BROKEN:
>> doesn't build with B!=S (flex: can't open lex.lex)"
>> meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[xf86-input-mtev]
>> ?= "BROKEN: doesn't build with B!=S (Makefile without ${S} in sed call)"
>> meta-oe/recipes-qt/qconnman/qconnman-e_git.bb:PNBLACKLIST[qconnman-e] ?=
>> "BROKEN: doesn't work with B!=S, ls: cannot access *.pro: No such file or
>> directory"
>> meta-oe/recipes-qt/qconnman/qconnman_git.bb:PNBLACKLIST[qconnman] ?=
>> "BROKEN: doesn't work with B!=S, ls: cannot access *.pro: No such file or
>> directory"
>> meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb:PNBLACKLIST[sylpheed]
>> ?= "BROKEN: Doesn't work with B!=S"
>> meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd]
>> ?= "BROKEN: doesn't build with B!=S"
>> meta-oe/recipes-support/fltk/fltk_1.1.10.bb:PNBLACKLIST[fltk] ?=
>> "broken: still uses /usr/bin/freetype-config"
>> meta-oe/recipes-support/maliit/maliit-framework_git.
>> bb:PNBLACKLIST[maliit-framework] ?= "BROKEN: Wasn't updated to work with
>> B!=S, maybe incorrectly inherits autotools"
>> meta-oe/recipes-support/maliit/maliit-plugins_git.bb:PNBLACKLIST[maliit-plugins]
>> ?= "BROKEN: depends on broken maliit-framework"
>> meta-oe/recipes-support/mongodb/mongodb_git.bb:PNBLACKLIST[mongodb] ?=
>> "Fails to build with system boost"
>> meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmotif]
>> ?= "BROKEN: doesn't build with B!=S"
>> meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala-terminal]
>> ?= "BROKEN: Doesn't work with B!=S, touch: cannot touch `src/.stamp': No
>> such file or directory"
>> meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb:PNBLACKLIST[xfce4-vala]
>> ?= "Fails to build since vala upgrade to 0.26.1"
>> meta-qt5:
>> meta-smartphone:
>> meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] =
>> "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
>> meta-shr/recipes-shr/3rdparty/gwaterpas_0.3.bb:PNBLACKLIST[gwaterpas] ?=
>> "broken: depends on blacklisted fltk"
>> meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] = "Doesn't
>> build after vala upgrade from 0.24.0 to 0.26.1"
>> meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] =
>> "rdepends on blacklisted mplayer2"
>> meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] =
>> "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
>> meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompass]
>> = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
>> meta-webos-ports:
>> conf/world_fixes.inc:PNBLACKLIST[mplayer2] = ""
>> conf/world_fixes.inc:PNBLACKLIST[android-system] = "depends on lxc from
>> meta-virtualiazation which isn't included in my world builds"
>> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't
>> really need to be tested so much"
>> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't
>> really need to be tested so much"
>> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't
>> really need to be tested so much"
>> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't
>> really need to be tested so much"
>> conf/world_fixes.inc:PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't
>> really need to be tested so much"
>> conf/world_mask.inc:PNBLACKLIST[evince] = "fails to build"
>> conf/world_mask.inc:PNBLACKLIST[epiphany] = "fails to build"
>> conf/world_mask.inc:PNBLACKLIST[gnome-power-manager] = "fails to build"
>> conf/world_mask.inc:PNBLACKLIST[gnome-bluetooth] = "fails to build"
>> conf/world_mask.inc:PNBLACKLIST[media-ctl] = "fails to build"
>> QA issues by type:
>> count: 3        issue: already-stripped
>> qwt-6.0.1: File '/usr/lib/libqwt.so.6.0.1' from qwt was already stripped,
>> this will prevent future debugging! [already-stripped]
>> qwt-6.0.1: File '/usr/lib/libqwtmathml.so.6.0.1' from qwt was already
>> stripped, this will prevent future debugging! [already-stripped]
>> qwt-6.0.1: File '/usr/lib/qt4/plugins/designer/libqwt_designer_plugin.so'
>> from qwt was already stripped, this will prevent future debugging!
>> [already-stripped]
>>
>>
>> count: 1        issue: libdir
>> chromium-dbg: found library in wrong location: /usr/bin/chrome/.debug/libffmpegsumo.so
>> [libdir]
>>
>>
>> count: 63       issue: textrel
>> chromium-38.0.2125.101: ELF binary '/tmp/work/i586-oe-linux/
>> chromium/38.0.2125.101-r0/packages-split/chromium/usr/bin/chrome/libffmpegsumo.so'
>> has relocations in .text [textrel]
>> gstreamer1.0-libav-1.4.5: ELF binary '/tmp/work/armv5e-oe-linux-
>> gnueabi/gstreamer1.0-libav/1.4.5-r0/packages-split/
>> gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so' has relocations
>> in .text [textrel]
>> gstreamer1.0-libav-1.4.5: ELF binary '/tmp/work/i586-oe-linux/
>> gstreamer1.0-libav/1.4.5-r0/packages-split/gstreamer1.0-
>> libav/usr/lib/gstreamer-1.0/libgstlibav.so' has relocations in .text
>> [textrel]
>> libav-9.16: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/libav/9.16-r0/
>> packages-split/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations
>> in .text [textrel]
>> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/
>> libav/9.16-r0/packages-split/libavcodec/usr/lib/libavcodec.so.54.35.0'
>> has relocations in .text [textrel]
>> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/
>> libav/9.16-r0/packages-split/libavdevice/usr/lib/libavdevice.so.53.2.0'
>> has relocations in .text [textrel]
>> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/
>> libav/9.16-r0/packages-split/libavfilter/usr/lib/libavfilter.so.3.3.0'
>> has relocations in .text [textrel]
>> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/
>> libav/9.16-r0/packages-split/libavformat/usr/lib/libavformat.so.54.20.4'
>> has relocations in .text [textrel]
>> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/
>> libav/9.16-r0/packages-split/libavresample/usr/lib/libavresample.so.1.0.1'
>> has relocations in .text [textrel]
>> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/
>> libav/9.16-r0/packages-split/libavutil/usr/lib/libavutil.so.52.3.0' has
>> relocations in .text [textrel]
>> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/
>> libav/9.16-r0/packages-split/libswscale/usr/lib/libswscale.so.2.1.1' has
>> relocations in .text [textrel]
>> libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary
>> '/tmp/work/armv5e-oe-linux-gnueabi/libpostproc/52.3.0+
>> gitAUTOINC+811db3b957-r0/packages-split/libpostproc/usr/lib/libpostproc.so.52.3.0'
>> has relocations in .text [textrel]
>> libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary
>> '/tmp/work/i586-oe-linux/libpostproc/52.3.0+gitAUTOINC+
>> 811db3b957-r0/packages-split/libpostproc/usr/lib/libpostproc.so.52.3.0'
>> has relocations in .text [textrel]
>> mpg123-1.21.0: ELF binary '/tmp/work/i586-oe-linux/
>> mpg123/1.21.0-r0/packages-split/mpg123/usr/lib/libmpg123.so.0.40.3' has
>> relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
>> gnueabi/python3/3.3.3-r1.0/packages-split/python3-audio/
>> usr/lib/python3.3/lib-dynload/ossaudiodev.cpython-33m.so' has
>> relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
>> gnueabi/python3/3.3.3-r1.0/packages-split/python3-codecs/
>> usr/lib/python3.3/lib-dynload/_codecs_tw.cpython-33m.so' has relocations
>> in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
>> gnueabi/python3/3.3.3-r1.0/packages-split/python3-core/
>> usr/lib/python3.3/lib-dynload/binascii.cpython-33m.so' has relocations
>> in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
>> gnueabi/python3/3.3.3-r1.0/packages-split/python3-crypt/
>> usr/lib/python3.3/lib-dynload/_sha256.cpython-33m.so' has relocations in
>> .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
>> gnueabi/python3/3.3.3-r1.0/packages-split/python3-ctypes/
>> usr/lib/python3.3/lib-dynload/_ctypes_test.cpython-33m.so' has
>> relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
>> gnueabi/python3/3.3.3-r1.0/packages-split/python3-curses/
>> usr/lib/python3.3/lib-dynload/_curses.cpython-33m.so' has relocations in
>> .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
>> gnueabi/python3/3.3.3-r1.0/packages-split/python3-
>> elementtree/usr/lib/python3.3/lib-dynload/_elementtree.cpython-33m.so'
>> has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
>> gnueabi/python3/3.3.3-r1.0/packages-split/python3-fcntl/
>> usr/lib/python3.3/lib-dynload/fcntl.cpython-33m.so' has relocations in
>> .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
>> gnueabi/python3/3.3.3-r1.0/packages-split/python3-gdbm/
>> usr/lib/python3.3/lib-dynload/_gdbm.cpython-33m.so' has relocations in
>> .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
>> gnueabi/python3/3.3.3-r1.0/packages-split/python3-io/usr/
>> lib/python3.3/lib-dynload/_socket.cpython-33m.so' has relocations in
>> .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
>> gnueabi/python3/3.3.3-r1.0/packages-split/python3-json/
>> usr/lib/python3.3/lib-dynload/_json.cpython-33m.so' has relocations in
>> .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
>> gnueabi/python3/3.3.3-r1.0/packages-split/python3-lang/
>> usr/lib/python3.3/lib-dynload/_bisect.cpython-33m.so' has relocations in
>> .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
>> gnueabi/python3/3.3.3-r1.0/packages-split/python3-math/
>> usr/lib/python3.3/lib-dynload/cmath.cpython-33m.so' has relocations in
>> .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
>> gnueabi/python3/3.3.3-r1.0/packages-split/python3-misc/
>> usr/lib/python3.3/lib-dynload/_posixsubprocess.cpython-33m.so' has
>> relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
>> gnueabi/python3/3.3.3-r1.0/packages-split/python3-mmap/
>> usr/lib/python3.3/lib-dynload/mmap.cpython-33m.so' has relocations in
>> .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
>> gnueabi/python3/3.3.3-r1.0/packages-split/python3-
>> multiprocessing/usr/lib/python3.3/lib-dynload/_multipr
>> ocessing.cpython-33m.so' has relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
>> gnueabi/python3/3.3.3-r1.0/packages-split/python3-
>> profile/usr/lib/python3.3/lib-dynload/_lsprof.cpython-33m.so' has
>> relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
>> gnueabi/python3/3.3.3-r1.0/packages-split/python3-
>> readline/usr/lib/python3.3/lib-dynload/readline.cpython-33m.so' has
>> relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
>> gnueabi/python3/3.3.3-r1.0/packages-split/python3-
>> resource/usr/lib/python3.3/lib-dynload/resource.cpython-33m.so' has
>> relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
>> gnueabi/python3/3.3.3-r1.0/packages-split/python3-syslog/
>> usr/lib/python3.3/lib-dynload/syslog.cpython-33m.so' has relocations in
>> .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
>> gnueabi/python3/3.3.3-r1.0/packages-split/python3-
>> textutils/usr/lib/python3.3/lib-dynload/_csv.cpython-33m.so' has
>> relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
>> gnueabi/python3/3.3.3-r1.0/packages-split/python3-
>> unixadmin/usr/lib/python3.3/lib-dynload/grp.cpython-33m.so' has
>> relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
>> gnueabi/python3/3.3.3-r1.0/packages-split/python3-xml/
>> usr/lib/python3.3/lib-dynload/pyexpat.cpython-33m.so' has relocations in
>> .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
>> python3/3.3.3-r1.0/packages-split/python3-audio/usr/lib/
>> python3.3/lib-dynload/ossaudiodev.cpython-33m.so' has relocations in
>> .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
>> python3/3.3.3-r1.0/packages-split/python3-codecs/usr/lib/
>> python3.3/lib-dynload/_codecs_cn.cpython-33m.so' has relocations in
>> .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
>> python3/3.3.3-r1.0/packages-split/python3-core/usr/lib/
>> python3.3/lib-dynload/binascii.cpython-33m.so' has relocations in .text
>> [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
>> python3/3.3.3-r1.0/packages-split/python3-crypt/usr/lib/
>> python3.3/lib-dynload/_sha256.cpython-33m.so' has relocations in .text
>> [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
>> python3/3.3.3-r1.0/packages-split/python3-ctypes/usr/lib/
>> python3.3/lib-dynload/_ctypes_test.cpython-33m.so' has relocations in
>> .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
>> python3/3.3.3-r1.0/packages-split/python3-curses/usr/lib/
>> python3.3/lib-dynload/_curses.cpython-33m.so' has relocations in .text
>> [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
>> python3/3.3.3-r1.0/packages-split/python3-elementtree/usr/
>> lib/python3.3/lib-dynload/_elementtree.cpython-33m.so' has relocations
>> in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
>> python3/3.3.3-r1.0/packages-split/python3-fcntl/usr/lib/
>> python3.3/lib-dynload/fcntl.cpython-33m.so' has relocations in .text
>> [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
>> python3/3.3.3-r1.0/packages-split/python3-gdbm/usr/lib/
>> python3.3/lib-dynload/_gdbm.cpython-33m.so' has relocations in .text
>> [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
>> python3/3.3.3-r1.0/packages-split/python3-io/usr/lib/
>> python3.3/lib-dynload/_socket.cpython-33m.so' has relocations in .text
>> [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
>> python3/3.3.3-r1.0/packages-split/python3-json/usr/lib/
>> python3.3/lib-dynload/_json.cpython-33m.so' has relocations in .text
>> [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
>> python3/3.3.3-r1.0/packages-split/python3-lang/usr/lib/
>> python3.3/lib-dynload/_bisect.cpython-33m.so' has relocations in .text
>> [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
>> python3/3.3.3-r1.0/packages-split/python3-math/usr/lib/
>> python3.3/lib-dynload/cmath.cpython-33m.so' has relocations in .text
>> [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
>> python3/3.3.3-r1.0/packages-split/python3-misc/usr/lib/
>> python3.3/lib-dynload/_md5.cpython-33m.so' has relocations in .text
>> [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
>> python3/3.3.3-r1.0/packages-split/python3-mmap/usr/lib/
>> python3.3/lib-dynload/mmap.cpython-33m.so' has relocations in .text
>> [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
>> python3/3.3.3-r1.0/packages-split/python3-multiprocessing/
>> usr/lib/python3.3/lib-dynload/_multiprocessing.cpython-33m.so' has
>> relocations in .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
>> python3/3.3.3-r1.0/packages-split/python3-profile/usr/lib/
>> python3.3/lib-dynload/_lsprof.cpython-33m.so' has relocations in .text
>> [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
>> python3/3.3.3-r1.0/packages-split/python3-readline/usr/
>> lib/python3.3/lib-dynload/readline.cpython-33m.so' has relocations in
>> .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
>> python3/3.3.3-r1.0/packages-split/python3-resource/usr/
>> lib/python3.3/lib-dynload/resource.cpython-33m.so' has relocations in
>> .text [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
>> python3/3.3.3-r1.0/packages-split/python3-syslog/usr/lib/
>> python3.3/lib-dynload/syslog.cpython-33m.so' has relocations in .text
>> [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
>> python3/3.3.3-r1.0/packages-split/python3-textutils/usr/
>> lib/python3.3/lib-dynload/_csv.cpython-33m.so' has relocations in .text
>> [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
>> python3/3.3.3-r1.0/packages-split/python3-unixadmin/usr/
>> lib/python3.3/lib-dynload/grp.cpython-33m.so' has relocations in .text
>> [textrel]
>> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
>> python3/3.3.3-r1.0/packages-split/python3-xml/usr/lib/
>> python3.3/lib-dynload/pyexpat.cpython-33m.so' has relocations in .text
>> [textrel]
>> qtwebkit-5.4.0+gitAUTOINC+3a2cb4770c: ELF binary
>> '/tmp/work/i586-oe-linux/qtwebkit/5.4.0+gitAUTOINC+
>> 3a2cb4770c-r0/packages-split/qtwebkit/usr/lib/libQt5WebKit.so.5.4.0' has
>> relocations in .text [textrel]
>> webkit-efl-1.11.0: ELF binary '/tmp/work/i586-oe-linux/
>> webkit-efl/1_1.11.0-r0/packages-split/webkit-efl/usr/
>> lib/libjavascriptcore_efl.so.1.11.0' has relocations in .text [textrel]
>> webkit-gtk-1.8.3: ELF binary '/tmp/work/i586-oe-linux/
>> webkit-gtk/1.8.3-r1/packages-split/libjavascriptcore/usr/
>> lib/libjavascriptcoregtk-1.0.so.0.13.4' has relocations in .text
>> [textrel]
>>
>>
>> count: 26       issue: build-deps
>> emacs-23.4: emacs rdepends on ncurses-libtinfo, but it isn't a build
>> dependency? [build-deps]
>> exquisite-0.0.1+svnr82070: exquisite rdepends on initscripts-functions,
>> but it isn't a build dependency? [build-deps]
>> freetds-0.92.79: freetds rdepends on readline, but it isn't a build
>> dependency? [build-deps]
>> geoclue-2.0.0: geoclue rdepends on geoip, but it isn't a build
>> dependency? [build-deps]
>> glade3-3.8.5: glade3 rdepends on libpython2, but it isn't a build
>> dependency? [build-deps]
>> gpm-1.99.7: gpm rdepends on initscripts-functions, but it isn't a build
>> dependency? [build-deps]
>> grub-efi-2.00: grub-efi rdepends on fuse, but it isn't a build
>> dependency? [build-deps]
>> irda-utils-0.9.18: irda-utils rdepends on initscripts-functions, but it
>> isn't a build dependency? [build-deps]
>> libwebp-0.4.0: libwebp-bin rdepends on libgl-mesa, but it isn't a build
>> dependency? [build-deps]
>> libwebp-0.4.0: libwebp-bin rdepends on mesa-glut, but it isn't a build
>> dependency? [build-deps]
>> log4c-1.2.4: log4c rdepends on expat, but it isn't a build dependency?
>> [build-deps]
>> mpd-0.19.1: mpd rdepends on libsmbclient, but it isn't a build
>> dependency? [build-deps]
>> netkit-rwho-0.17: netkit-rwho-client rdepends on initscripts-functions,
>> but it isn't a build dependency? [build-deps]
>> pkcs11-helper-1.11: pkcs11-helper rdepends on nspr, but it isn't a build
>> dependency? [build-deps]
>> pkcs11-helper-1.11: pkcs11-helper rdepends on nss, but it isn't a build
>> dependency? [build-deps]
>> qt5-creator-3.3.0: qt5-creator rdepends on qt-creator, but it isn't a
>> build dependency? [build-deps]
>> qt5-creator-3.3.0: qt5-creator rdepends on qtquick1, but it isn't a build
>> dependency? [build-deps]
>> qtwayland-5.4.0+gitAUTOINC+50d6c0ae94: qtwayland-plugins rdepends on
>> libxcomposite, but it isn't a build dependency? [build-deps]
>> qtwebkit-5.4.0+gitAUTOINC+3a2cb4770c: qtwebkit rdepends on
>> libxcomposite, but it isn't a build dependency? [build-deps]
>> sox-14.4.0: sox rdepends on libflac, but it isn't a build dependency?
>> [build-deps]
>> stunnel-5.10: stunnel rdepends on libcap, but it isn't a build
>> dependency? [build-deps]
>> stunnel-5.10: stunnel rdepends on liblzma, but it isn't a build
>> dependency? [build-deps]
>> stunnel-5.10: stunnel rdepends on libsystemd, but it isn't a build
>> dependency? [build-deps]
>> sysklogd-1.5.1: sysklogd rdepends on initscripts-functions, but it isn't
>> a build dependency? [build-deps]
>> tcpdump-4.6.1: tcpdump rdepends on libsmi, but it isn't a build
>> dependency? [build-deps]
>> vlc-2.1.4: vlc rdepends on libsamplerate0, but it isn't a build
>> dependency? [build-deps]
>>
>>
>> count: 50       issue: file-rdeps
>> apache2-2.4.10: apache2-dev requires /usr/bin/perl, but no providers in
>> its RDEPENDS [file-rdeps]
>> chkconfig-1.3.58: chkconfig requires libnewt.so()(64bit), but no
>> providers in its RDEPENDS [file-rdeps]
>> chkconfig-1.3.58: chkconfig requires libnewt.so, but no providers in its
>> RDEPENDS [file-rdeps]
>> cloud9-0.6: cloud9 requires /bin/bash, but no providers in its RDEPENDS
>> [file-rdeps]
>> dvb-apps-1.1.1: dvb-apps requires libucsi.so()(64bit),
>> libdvbapi.so()(64bit), libdvbcfg.so()(64bit), libdvben50221.so()(64bit),
>> libdvbsec.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
>> dvb-apps-1.1.1: dvb-apps requires libucsi.so, libdvben50221.so,
>> libdvbsec.so, libdvbcfg.so, libdvbapi.so, but no providers in its RDEPENDS
>> [file-rdeps]
>> dvb-apps-1.1.1: dvb-femon requires libdvbapi.so()(64bit), but no
>> providers in its RDEPENDS [file-rdeps]
>> dvb-apps-1.1.1: dvb-femon requires libdvbapi.so, but no providers in its
>> RDEPENDS [file-rdeps]
>> dvb-apps-1.1.1: dvb-scan requires libdvbsec.so()(64bit),
>> libdvbapi.so()(64bit), libdvbcfg.so()(64bit), but no providers in its
>> RDEPENDS [file-rdeps]
>> dvb-apps-1.1.1: dvb-scan requires libdvbsec.so, libdvbcfg.so,
>> libdvbapi.so, but no providers in its RDEPENDS [file-rdeps]
>> dvb-apps-1.1.1: dvbdate requires libucsi.so()(64bit),
>> libdvbapi.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
>> dvb-apps-1.1.1: dvbdate requires libucsi.so, libdvbapi.so, but no
>> providers in its RDEPENDS [file-rdeps]
>> dvb-apps-1.1.1: dvbnet requires libdvbapi.so()(64bit), but no providers
>> in its RDEPENDS [file-rdeps]
>> dvb-apps-1.1.1: dvbnet requires libdvbapi.so, but no providers in its
>> RDEPENDS [file-rdeps]
>> dvb-apps-1.1.1: dvbtraffic requires libdvbapi.so()(64bit), but no
>> providers in its RDEPENDS [file-rdeps]
>> dvb-apps-1.1.1: dvbtraffic requires libdvbapi.so, but no providers in its
>> RDEPENDS [file-rdeps]
>> emacs-23.4: emacs requires /usr/bin/perl, but no providers in its
>> RDEPENDS [file-rdeps]
>> fakeroot-1.18.4: fakeroot requires /bin/bash, but no providers in its
>> RDEPENDS [file-rdeps]
>> fbida-2.09+gitAUTOINC+6aa5563cb3: fbida requires /bin/bash, but no
>> providers in its RDEPENDS [file-rdeps]
>> foxtrotgps-1.1.1: foxtrotgps requires /usr/bin/python, /usr/bin/perl, but
>> no providers in its RDEPENDS [file-rdeps]
>> gammu-1.32.0: gammu requires /bin/bash, but no providers in its RDEPENDS
>> [file-rdeps]
>> gammu-1.32.0: gammu-dev requires /bin/bash, but no providers in its
>> RDEPENDS [file-rdeps]
>> gateone-1.2: gateone requires /bin/bash, but no providers in its RDEPENDS
>> [file-rdeps]
>> giflib-4.1.6: giflib-utils requires /usr/bin/perl, but no providers in
>> its RDEPENDS [file-rdeps]
>> gnome-desktop-2.32.1: gnome-desktop requires /usr/bin/python, but no
>> providers in its RDEPENDS [file-rdeps]
>> gnome-panel-2.32.1: gnome-panel requires /usr/bin/python, but no
>> providers in its RDEPENDS [file-rdeps]
>> groff-1.22.2: groff requires /bin/sed, but no providers in its RDEPENDS
>> [file-rdeps]
>> gupnp-0.20.12: gupnp-dev requires /usr/bin/python, but no providers in
>> its RDEPENDS [file-rdeps]
>> hplip-3.12.6: hplip-filter requires /usr/bin/perl, but no providers in
>> its RDEPENDS [file-rdeps]
>> ipvsadm-1.26: ipvsadm requires /bin/bash, but no providers in its
>> RDEPENDS [file-rdeps]
>> libbonobo-2.32.1: libbonobo requires /usr/bin/perl, but no providers in
>> its RDEPENDS [file-rdeps]
>> libnewt-0.52.18: whiptail requires libnewt.so()(64bit), but no providers
>> in its RDEPENDS [file-rdeps]
>> libnewt-0.52.18: whiptail requires libnewt.so, but no providers in its
>> RDEPENDS [file-rdeps]
>> libnewt-python-0.52.18: libnewt-python requires libnewt.so()(64bit), but
>> no providers in its RDEPENDS [file-rdeps]
>> libnewt-python-0.52.18: libnewt-python requires libnewt.so, but no
>> providers in its RDEPENDS [file-rdeps]
>> lio-utils-4.1+gitAUTOINC+28bd928655: lio-utils requires /bin/bash, but
>> no providers in its RDEPENDS [file-rdeps]
>> lmsensors-config-1.0: lmsensors-config-cgi requires /usr/bin/rrdcgi, but
>> no providers in its RDEPENDS [file-rdeps]
>> nodejs-0.8.18: nodejs requires /bin/bash, but no providers in its
>> RDEPENDS [file-rdeps]
>> numptyphysics-0.2+svnr109: numptyphysics requires /bin/bash,
>> /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
>> opensaf-4.5.0: opensaf requires /bin/bash, /usr/bin/python, but no
>> providers in its RDEPENDS [file-rdeps]
>> packagekit-0.5.6: packagekit requires /bin/bash, but no providers in its
>> RDEPENDS [file-rdeps]
>> pcsc-lite-1.8.6: pcsc-lite requires /usr/bin/python, but no providers in
>> its RDEPENDS [file-rdeps]
>> pm-qa-0.4.14: pm-qa requires /bin/bash, but no providers in its RDEPENDS
>> [file-rdeps]
>> qt-creator-2.8.1: qt-creator requires /usr/bin/perl, but no providers in
>> its RDEPENDS [file-rdeps]
>> tracker-0.14.2: tracker-nautilus-extension requires
>> libnautilus-extension.so.1()(64bit), but no providers in its RDEPENDS
>> [file-rdeps]
>> tracker-0.14.2: tracker-nautilus-extension requires
>> libnautilus-extension.so.1, but no providers in its RDEPENDS [file-rdeps]
>> ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: ubx-utils requires /bin/bash,
>> but no providers in its RDEPENDS [file-rdeps]
>> unionfs-fuse-0.26: unionfs-fuse requires /bin/bash, but no providers in
>> its RDEPENDS [file-rdeps]
>> usbpath-0.0+svnr3172: usbpath requires /usr/bin/perl, but no providers in
>> its RDEPENDS [file-rdeps]
>> wvstreams-4.6.1: wvstreams requires /usr/bin/perl, but no providers in
>> its RDEPENDS [file-rdeps]
>>
>>
>> count: 0        issue: version-going-backwards
>>
>>
>>
>>  --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--e89a8f3ba1ebe387a7050fd3de9e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Martin,<div><br></div><div>Please, what is it your conf=
iguration to run &quot;bitbake world&quot; ?</div><div>I tried to run &quot=
;bitbake world&quot; only on oe-core, for some targets and I obtain already=
 the same issue, and I don&#39;t see this issue in your list of failed task=
s.</div><div><br></div><div><a href=3D"https://travis-ci.org/tprrt/meta-mus=
l">Here</a>, I also tried with meta-musl and I obtain the same issue.</div>=
<div><br></div><div>The issue:=C2=A0</div><div><pre id=3D"log" class=3D"" s=
tyle=3D"clear:left;min-height:42px;padding:15px 0px;color:rgb(241,241,241);=
font-size:12px;line-height:19px;white-space:pre-wrap;word-wrap:break-word;b=
order-radius:4px;background-color:rgb(42,42,42)"><p style=3D"padding:0px 15=
px 0px 55px;margin:0px;min-height:16px"><a style=3D"color:rgb(102,102,102);=
display:inline-block;text-align:right;min-width:40px"></a><span id=3D"1-152=
6" class=3D"" style=3D"font-weight:700;color:rgb(255,182,176)">ERROR</span>=
<span id=3D"1-1527">: </span><span id=3D"1-1528" class=3D"" style=3D"color:=
rgb(255,108,96)">Nothing PROVIDES &#39;virtual/egl&#39; (but /tmp/build_env=
/meta/recipes-graphics/clutter/<a href=3D"http://clutter-1.0_1.20.0.bb">clu=
tter-1.0_1.20.0.bb</a>, /tmp/build_env/meta/recipes-graphics/eglinfo/<a hre=
f=3D"http://eglinfo-fb_1.0.bb">eglinfo-fb_1.0.bb</a>, /tmp/build_env/meta/r=
ecipes-graphics/cogl/<a href=3D"http://cogl-1.0_1.18.2.bb">cogl-1.0_1.18.2.=
bb</a>, /tmp/build_env/meta/recipes-graphics/mesa/<a href=3D"http://mesa-de=
mos_8.2.0.bb">mesa-demos_8.2.0.bb</a>, /tmp/build_env/meta/recipes-multimed=
ia/gstreamer/<a href=3D"http://gst-plugins-gl_0.10.3.bb">gst-plugins-gl_0.1=
0.3.bb</a>, /tmp/build_env/meta/recipes-graphics/eglinfo/<a href=3D"http://=
eglinfo-x11_1.0.bb">eglinfo-x11_1.0.bb</a>, /tmp/build_env/meta/recipes-gra=
phics/wayland/<a href=3D"http://weston_1.6.0.bb">weston_1.6.0.bb</a> DEPEND=
S on or otherwise requires it)</span><span id=3D"1-1529"></span></p><p styl=
e=3D"padding:0px 15px 0px 55px;margin:0px;min-height:16px"><a style=3D"colo=
r:rgb(102,102,102);display:inline-block;text-align:right;min-width:40px"></=
a><span id=3D"1-1530" class=3D"" style=3D"font-weight:700;color:rgb(255,182=
,176)">ERROR</span><span id=3D"1-1531">: </span><span id=3D"1-1532" class=
=3D"" style=3D"color:rgb(255,108,96)">mesa PROVIDES virtual/egl but was ski=
pped: missing required distro feature &#39;opengl&#39; (not in DISTRO_FEATU=
RES)</span><span id=3D"1-1533"></span></p><p style=3D"padding:0px 15px 0px =
55px;margin:0px;min-height:16px"><a style=3D"color:rgb(102,102,102);display=
:inline-block;text-align:right;min-width:40px"></a><span id=3D"1-1534" clas=
s=3D"" style=3D"font-weight:700;color:rgb(255,182,176)">ERROR</span><span i=
d=3D"1-1535">: </span><span id=3D"1-1536" class=3D"" style=3D"color:rgb(255=
,108,96)">mesa PROVIDES virtual/egl but was skipped: missing required distr=
o feature &#39;opengl&#39; (not in DISTRO_FEATURES)</span><span id=3D"1-153=
7"></span></p><p style=3D"padding:0px 15px 0px 55px;margin:0px;min-height:1=
6px"><a style=3D"color:rgb(102,102,102);display:inline-block;text-align:rig=
ht;min-width:40px"></a><span id=3D"1-1538" class=3D"" style=3D"font-weight:=
700;color:rgb(255,182,176)">ERROR</span><span id=3D"1-1539">: </span><span =
id=3D"1-1540" class=3D"" style=3D"color:rgb(255,108,96)">Required build tar=
get &#39;clutter-gst-1.0&#39; has no buildable providers.</span></p><p styl=
e=3D"padding:0px 15px 0px 55px;margin:0px;min-height:16px"><a style=3D"colo=
r:rgb(102,102,102);display:inline-block;text-align:right;min-width:40px"></=
a><span id=3D"1-1541">Missing or unbuildable dependency chain was: [&#39;cl=
utter-gst-1.0&#39;, &#39;clutter-1.0&#39;, &#39;virtual/egl&#39;]</span></p=
></pre></div><div class=3D"gmail_extra"><br clear=3D"all"><div><div class=
=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><p style=3D"mar=
gin:0cm 0cm 0.0001pt 35.4pt;font-size:11pt;font-family:Calibri,sans-serif">=
<b><span lang=3D"EN-US" style=3D"font-size:8pt;font-family:Verdana,sans-ser=
if;color:gray">Best regards<u></u><u></u></span></b></p><p style=3D"margin:=
0cm 0cm 0.0001pt 35.4pt;font-size:11pt;font-family:Calibri,sans-serif"><spa=
n lang=3D"EN-US" style=3D"font-size:8pt;font-family:Verdana,sans-serif;colo=
r:gray">-------------------------------------------------------------------=
----------------------</span><b><span lang=3D"EN-GB" style=3D"font-size:8pt=
;font-family:Verdana,sans-serif;color:gray"><u></u><u></u></span></b></p><p=
 style=3D"margin:0cm 0cm 0.0001pt 35.4pt;font-size:11pt;font-family:Calibri=
,sans-serif"><b><span lang=3D"EN-GB" style=3D"font-size:8pt;font-family:Ver=
dana,sans-serif;color:gray">Thomas P.</span></b></p><div><br></div></div></=
div></div></div></div>
<br><div class=3D"gmail_quote">On 22 February 2015 at 18:00, akuster808 <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank=
">akuster808@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-=
color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">Martin<spa=
n class=3D""><br>
<br>
On 02/20/2015 03:09 PM, Martin Jansa wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
<a href=3D"http://www.openembedded.org/wiki/Bitbake_World_Status" target=3D=
"_blank">http://www.openembedded.org/<u></u>wiki/Bitbake_World_Status</a><b=
r>
<br>
=3D=3D Failed tasks 2015-02-20 =3D=3D<br>
<br>
INFO: jenkins-job.sh-1.1.0 Complete log available at <a href=3D"http://logs=
.nslu2-linux.org/buildlogs/oe/world/log.report.20150220_202958.log" target=
=3D"_blank">http://logs.nslu2-linux.org/<u></u>buildlogs/oe/world/log.repor=
t.<u></u>20150220_202958.log</a><br>
<br>
=3D=3D=3D common (5) =3D=3D=3D<br>
=C2=A0 =C2=A0 =C2=A0* /meta-openembedded/meta-efl/<u></u>recipes-navigation=
/mcnavi/<a href=3D"http://mcnavi_0.3.4.bb" target=3D"_blank">mcna<u></u>vi_=
0.3.4.bb</a>, do_compile<br>
=C2=A0 =C2=A0 =C2=A0* /meta-openembedded/meta-<u></u>networking/recipes-dae=
mons/<u></u>ptpd/<a href=3D"http://ptpd_2.3.1-rc2.bb" target=3D"_blank">ptp=
d_2.3.1-rc2.bb</a>, do_compile<br>
=C2=A0 =C2=A0 =C2=A0* /meta-openembedded/meta-<u></u>networking/recipes-sup=
port/<u></u>nis/<a href=3D"http://yp-tools_2.12.bb" target=3D"_blank">yp-to=
ols_2.12.bb</a>, do_compile<br>
=C2=A0 =C2=A0 =C2=A0* /meta-openembedded/meta-oe/<u></u>recipes-extended/un=
ixodbc/<a href=3D"http://unixodbc_2.3.2.bb" target=3D"_blank">unix<u></u>od=
bc_2.3.2.bb</a>, do_configure<br>
=C2=A0 =C2=A0 =C2=A0* /meta-openembedded/meta-oe/<u></u>recipes-support/sta=
rt-stop-<u></u>daemon/<a href=3D"http://start-stop-daemon_1.16.0.2.bb" targ=
et=3D"_blank">start-stop-daemon_1.16.<u></u>0.2.bb</a>, do_compile<br>
<br>
=3D=3D=3D common-x86 (2) =3D=3D=3D<br>
=C2=A0 =C2=A0 =C2=A0* /meta-openembedded/meta-oe/<u></u>recipes-kernel/ktap=
/<a href=3D"http://ktap-module_0.4.bb" target=3D"_blank">ktap-<u></u>module=
_0.4.bb</a>, do_compile<br>
=C2=A0 =C2=A0 =C2=A0* /meta-openembedded/meta-oe/<u></u>recipes-support/ema=
cs/<a href=3D"http://emacs_23.4.bb" target=3D"_blank">emacs_<u></u>23.4.bb<=
/a>, do_compile<br>
<br>
=3D=3D=3D qemuarm (6) =3D=3D=3D<br>
=C2=A0 =C2=A0 =C2=A0* /meta-openembedded/meta-<u></u>networking/recipes-<u>=
</u>connectivity/snort/<a href=3D"http://snort_2.9.6.0.bb" target=3D"_blank=
">snort_2.9.<u></u>6.0.bb</a>, do_configure<br>
=C2=A0 =C2=A0 =C2=A0* /meta-openembedded/meta-<u></u>networking/recipes-sup=
port/<u></u>wireshark/<a href=3D"http://wireshark_1.12.3.bb" target=3D"_bla=
nk">wireshark_1.12.3.bb</a>, do_configure<br>
</blockquote>
<br></span>
Do you have my latest patch for wireshark?<br>
<br>
=C2=A0b51998bf63a625757f0497342b53e0<u></u>c351814fba in master-next<br>
<br>
- armin<div class=3D""><div class=3D"h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
=C2=A0 =C2=A0 =C2=A0* /meta-openembedded/meta-oe/<u></u>recipes-benchmark/f=
io/<a href=3D"http://fio_2.0.5.bb" target=3D"_blank">fio_2.0.<u></u>5.bb</a=
>, do_compile<br>
=C2=A0 =C2=A0 =C2=A0* /meta-openembedded/meta-oe/<u></u>recipes-devtools/no=
dejs/<a href=3D"http://nodejs4_0.4.12.bb" target=3D"_blank">nodejs<u></u>4_=
0.4.12.bb</a>, do_compile<br>
=C2=A0 =C2=A0 =C2=A0* /meta-openembedded/meta-oe/<u></u>recipes-devtools/no=
dejs/<a href=3D"http://nodejs_0.8.18.bb" target=3D"_blank">nodejs<u></u>_0.=
8.18.bb</a>, do_compile<br>
=C2=A0 =C2=A0 =C2=A0* /meta-smartphone/meta-android/<u></u>recipes-multimed=
ia/android-<u></u>audiosystem/<a href=3D"http://android-audiosystem_bzr.bb"=
 target=3D"_blank">android-<u></u>audiosystem_bzr.bb</a>, do_compile<br>
<br>
=3D=3D=3D qemux86 (0) =3D=3D=3D<br>
<br>
=3D=3D=3D qemux86_64 (1) =3D=3D=3D<br>
=C2=A0 =C2=A0 =C2=A0* /meta-qt5/recipes-qt/qt5/<a href=3D"http://qt5-creato=
r_3.3.0.bb" target=3D"_blank">qt5-<u></u>creator_3.3.0.bb</a>, do_populate_=
sysroot<br>
<br>
=3D=3D=3D Number of failed tasks (27) =3D=3D=3D<br>
{| class=3Dwikitable<br>
|-<br>
|| qemuarm=C2=A0 =C2=A0 =C2=A0 || 11=C2=A0 =C2=A0 || <a href=3D"http://logs=
.nslu2-linux.org/buildlogs/oe/world//log.world.20150218_225838.log//" targe=
t=3D"_blank">http://logs.nslu2-linux.org/<u></u>buildlogs/oe/world//log.wor=
ld.<u></u>20150218_225838.log//</a> || <a href=3D"http://errors.yoctoprojec=
t.org:80/Errors/Build/4802/" target=3D"_blank">http://errors.yoctoproject.<=
u></u>org:80/Errors/Build/4802/</a><br>
|-<br>
|| qemux86=C2=A0 =C2=A0 =C2=A0 || 8=C2=A0 =C2=A0 =C2=A0|| <a href=3D"http:/=
/logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150219_132710.log//" =
target=3D"_blank">http://logs.nslu2-linux.org/<u></u>buildlogs/oe/world//lo=
g.world.<u></u>20150219_132710.log//</a> || <a href=3D"http://errors.yoctop=
roject.org:80/Errors/Build/4806/" target=3D"_blank">http://errors.yoctoproj=
ect.<u></u>org:80/Errors/Build/4806/</a><br>
|-<br>
|| qemux86_64=C2=A0 =C2=A0|| 8=C2=A0 =C2=A0 =C2=A0|| <a href=3D"http://logs=
.nslu2-linux.org/buildlogs/oe/world//log.world.20150220_044745.log//" targe=
t=3D"_blank">http://logs.nslu2-linux.org/<u></u>buildlogs/oe/world//log.wor=
ld.<u></u>20150220_044745.log//</a> || <a href=3D"http://errors.yoctoprojec=
t.org:80/Errors/Build/4811/" target=3D"_blank">http://errors.yoctoproject.<=
u></u>org:80/Errors/Build/4811/</a><br>
|}<br>
<br>
=3D=3D=3D PNBLACKLISTs (52) =3D=3D=3D<br>
<br>
=3D=3D=3D QA issues (143) =3D=3D=3D<br>
{| class=3Dwikitable<br>
!| Count=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ||Issue<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||version-going-backwards<br>
|-<br>
||1=C2=A0 =C2=A0 =C2=A0||libdir<br>
|-<br>
||26=C2=A0 =C2=A0 ||build-deps<br>
|-<br>
||3=C2=A0 =C2=A0 =C2=A0||already-stripped<br>
|-<br>
||50=C2=A0 =C2=A0 ||file-rdeps<br>
|-<br>
||63=C2=A0 =C2=A0 ||textrel<br>
|}<br>
<br>
<br>
PNBLACKLISTs:<br>
openembedded-core/:<br>
meta-browser:<br>
meta-openembedded:<br>
meta-efl/recipes-efl/e17/<u></u>diskio_svn.bb:PNBLACKLIST[<u></u>diskio] ?=
=3D &quot;broken: switch to <a href=3D"https://git.enlightenment.org/enligh=
tenment/modules/diskio.git/" target=3D"_blank">https://git.enlightenment.or=
g/<u></u>enlightenment/modules/diskio.<u></u>git/</a> and fix 0.0.1+svnr820=
70-r0.0/E-<u></u>MODULES-EXTRA/diskio/e-module-<u></u>diskio.edc:58. invali=
d state name: &#39;off&#39;. &quot;default&quot; state must always be first=
.&quot;<br>
meta-efl/recipes-efl/efl/<u></u>entrance_svn.bb:PNBLACKLIST[<u></u>entrance=
] ?=3D &quot;broken: switch to <a href=3D"https://git.enlightenment.org/mis=
c/entrance.git" target=3D"_blank">https://git.enlightenment.org/<u></u>misc=
/entrance.git</a> and fix 0.0.4+svnr82070-r7/entrance/<u></u>data/themes/ol=
d/default.edc:<u></u>678. invalid state name: &#39;defaault&#39;. &quot;def=
ault&quot; state must always be first.&quot;<br>
meta-filesystems/recipes-<u></u>filesystems/ifuse/ifuse_1.1.2.<u></u>bb:PNB=
LACKLIST[ifuse] ?=3D &quot;depends on blacklisted libimobiledevice&quot;<br=
>
meta-gnome/recipes-apps/gnome-<u></u>mplayer/gnome-mplayer_1.0.5.<u></u>bb:=
PNBLACKLIST[gnome-mplayer] ?=3D &quot;rdepends on blacklisted mplayer&quot;=
<br>
meta-gnome/recipes-gnome/gcr/<u></u>gcr_3.8.2.bb:PNBLACKLIST[gcr] ?=3D &quo=
t;CONFLICT: 4 files conflict with gnome-keyring&quot;<br>
meta-gnome/recipes-gnome/gdm/<u></u>gdm_2.32.2.bb:PNBLACKLIST[gdm] ?=3D &qu=
ot;Depends on broken polkit-gnome&quot;<br>
meta-gnome/recipes-gnome/<u></u>gnome-menus/gnome-menus3_3.10.<u></u>1.bb:P=
NBLACKLIST[gnome-menus3] ?=3D &quot;CONFLICT: 24 files are conflicting with=
 gnome-menus&quot;<br>
meta-gnome/recipes-gnome/<u></u>gnome-panel/gnome-panel3_3.0.<u></u>2.bb:PN=
BLACKLIST[gnome-panel3] ?=3D &quot;CONFLICT: depends on libgweather3 which =
conflicts with libgweather&quot;<br>
meta-gnome/recipes-gnome/<u></u>gweather/libgweather3_3.0.2.<u></u>bb:PNBLA=
CKLIST[libgweather3] ?=3D &quot;CONFLICT: 876 files are conflicting with li=
bgweather&quot;<br>
meta-gnome/recipes-gnome/<u></u>zenity/zenity_2.32.1.bb:PNBLAC<u></u>KLIST[=
zenity] ?=3D &quot;BROKEN: doesn&#39;t build with B!=3DS&quot;<br>
meta-multimedia/recipes-<u></u>mediacentre/xbmc/xbmc_git.bb:P<u></u>NBLACKL=
IST[xbmc] ?=3D &quot;/usr/include/c++/ctime:70:11: error: &#39;::gmtime&#39=
; has not been declared&quot;<br>
meta-multimedia/recipes-<u></u>multimedia/coriander/<u></u>coriander_2.0.2.=
bb:PNBLACKLIST<u></u>[coriander] ?=3D &quot;BROKEN: fails to use SDL probab=
ly because libsdl-config was removed, error: unknown type name &#39;SDL_Ove=
rlay&#39;&quot;<br>
meta-multimedia/recipes-<u></u>multimedia/dleyna/renderer-<u></u>service-up=
np_0.3.0.bb:PNBLACKL<u></u>IST[renderer-service-upnp] ?=3D &quot;BROKEN: do=
esn&#39;t build with B!=3DS (trying to install rendererconsole.py from ${B}=
 instead of ${S})&quot;<br>
meta-networking/recipes-<u></u>connectivity/snort/snort_2.9.<u></u>6.0.bb:P=
NBLACKLIST[snort] ?=3D &quot;BROKEN: autotools processing causes OOM condit=
ion on configure&quot;<br>
meta-networking/recipes-<u></u>support/lksctp-tools/lksctp-<u></u>tools_1.0=
.16.bb:PNBLACKLIST[<u></u>lksctp-tools] ?=3D &quot;${@base_contains(&#39;DI=
STRO_<u></u>FEATURES&#39;, &#39;ld-is-gold&#39;, &quot;BROKEN: fails to lin=
k against sctp_connectx symbol&quot;, &#39;&#39;, d)}&quot;<br>
meta-oe/recipes-connectivity/<u></u>libimobiledevice/<u></u>libimobiledevic=
e_1.1.4.bb:PNBL<u></u>ACKLIST[libimobiledevice] ?=3D &quot;cannot run test =
program while cross compiling&quot;<br>
meta-oe/recipes-connectivity/<u></u>soft66/soft66_git.bb:PNBLACKLI<u></u>ST=
[soft66] ?=3D &quot;BROKEN: depends on broken libftdi&quot;<br>
meta-oe/recipes-connectivity/<u></u>zeroc-ice/zeroc-ice_3.5.1.bb:P<u></u>NB=
LACKLIST[zeroc-ice] ?=3D &quot;BROKEN: not compatible with default db versi=
on&quot;<br>
meta-oe/recipes-extended/<u></u>polkit/polkit-gnome_0.102.bb:P<u></u>NBLACK=
LIST[polkit-gnome] ?=3D &quot;Fails to build, m4:<a href=3D"http://configur=
e.ac:125" target=3D"_blank">configure.ac:125</a>: recursion limit of 1024 e=
xceeded, use -L&lt;N&gt; to change it&quot;<br>
meta-oe/recipes-extended/<u></u>subsurface/subsurface_git.bb:P<u></u>NBLACK=
LIST[subsurface] ?=3D &quot;Needs to be upgraded for compatibility with new=
 libdivecomputer&quot;<br>
meta-oe/recipes-graphics/<u></u>clutter/clutter-box2d_git.bb:P<u></u>NBLACK=
LIST[clutter-box2d] ?=3D &quot;BROKEN: doesn&#39;t build with B!=3DS&quot;<=
br>
meta-oe/recipes-graphics/fim/<u></u>fim_0.4-rc1.bb:PNBLACKLIST[<u></u>fim] =
?=3D &quot;BROKEN: doesn&#39;t build with B!=3DS (flex: can&#39;t open lex.=
lex)&quot;<br>
meta-oe/recipes-graphics/xorg-<u></u>driver/<a href=3D"http://xf86-input-mt=
ev_git.bb" target=3D"_blank">xf86-input-mtev_git.bb</a>:<u></u>PNBLACKLIST[=
xf86-input-mtev] ?=3D &quot;BROKEN: doesn&#39;t build with B!=3DS (Makefile=
 without ${S} in sed call)&quot;<br>
meta-oe/recipes-qt/qconnman/<u></u>qconnman-e_git.bb:PNBLACKLIST[<u></u>qco=
nnman-e] ?=3D &quot;BROKEN: doesn&#39;t work with B!=3DS, ls: cannot access=
 *.pro: No such file or directory&quot;<br>
meta-oe/recipes-qt/qconnman/<u></u>qconnman_git.bb:PNBLACKLIST[<u></u>qconn=
man] ?=3D &quot;BROKEN: doesn&#39;t work with B!=3DS, ls: cannot access *.p=
ro: No such file or directory&quot;<br>
meta-oe/recipes-sato/claws-<u></u>mail/sylpheed_2.7.1.bb:PNBLACK<u></u>LIST=
[sylpheed] ?=3D &quot;BROKEN: Doesn&#39;t work with B!=3DS&quot;<br>
meta-oe/recipes-support/<u></u>apcupsd/apcupsd_3.14.10.bb:PNB<u></u>LACKLIS=
T[apcupsd] ?=3D &quot;BROKEN: doesn&#39;t build with B!=3DS&quot;<br>
meta-oe/recipes-support/fltk/<u></u>fltk_1.1.10.bb:PNBLACKLIST[<u></u>fltk]=
 ?=3D &quot;broken: still uses /usr/bin/freetype-config&quot;<br>
meta-oe/recipes-support/<u></u>maliit/maliit-framework_git.<u></u>bb:PNBLAC=
KLIST[maliit-<u></u>framework] ?=3D &quot;BROKEN: Wasn&#39;t updated to wor=
k with B!=3DS, maybe incorrectly inherits autotools&quot;<br>
meta-oe/recipes-support/<u></u>maliit/maliit-plugins_git.bb:P<u></u>NBLACKL=
IST[maliit-plugins] ?=3D &quot;BROKEN: depends on broken maliit-framework&q=
uot;<br>
meta-oe/recipes-support/<u></u>mongodb/mongodb_git.bb:PNBLACK<u></u>LIST[mo=
ngodb] ?=3D &quot;Fails to build with system boost&quot;<br>
meta-oe/recipes-support/<u></u>openmotif/openmotif_2.3.3.bb:P<u></u>NBLACKL=
IST[openmotif] ?=3D &quot;BROKEN: doesn&#39;t build with B!=3DS&quot;<br>
meta-oe/recipes-support/vala-<u></u>terminal/<a href=3D"http://vala-termina=
l_git.bb" target=3D"_blank">vala-terminal_git.bb</a>:<u></u>PNBLACKLIST[val=
a-terminal] ?=3D &quot;BROKEN: Doesn&#39;t work with B!=3DS, touch: cannot =
touch `src/.stamp&#39;: No such file or directory&quot;<br>
meta-xfce/recipes-bindings/<u></u>vala/xfce4-vala_4.10.3.bb:PNBL<u></u>ACKL=
IST[xfce4-vala] ?=3D &quot;Fails to build since vala upgrade to 0.26.1&quot=
;<br>
meta-qt5:<br>
meta-smartphone:<br>
meta-shr/recipes-shr/3rdparty/<u></u>ffalarms_git.bb:PNBLACKLIST[<u></u>ffa=
larms] =3D &quot;Doesn&#39;t build after vala upgrade from 0.24.0 to 0.26.1=
&quot;<br>
meta-shr/recipes-shr/3rdparty/<u></u>gwaterpas_0.3.bb:PNBLACKLIST[<u></u>gw=
aterpas] ?=3D &quot;broken: depends on blacklisted fltk&quot;<br>
meta-shr/recipes-shr/3rdparty/<u></u>iliwi_git.bb:PNBLACKLIST[<u></u>iliwi]=
 =3D &quot;Doesn&#39;t build after vala upgrade from 0.24.0 to 0.26.1&quot;=
<br>
meta-shr/recipes-shr/3rdparty/<u></u>intone_git.bb:PNBLACKLIST[<u></u>inton=
e] =3D &quot;rdepends on blacklisted mplayer2&quot;<br>
meta-shr/recipes-shr/3rdparty/<u></u>sensmon_git.bb:PNBLACKLIST[<u></u>sens=
mon] =3D &quot;Doesn&#39;t build after vala upgrade from 0.24.0 to 0.26.1&q=
uot;<br>
meta-shr/recipes-shr/3rdparty/<u></u>valacompass_git.bb:PNBLACKLIST<u></u>[=
valacompass] =3D &quot;Doesn&#39;t build after vala upgrade from 0.24.0 to =
0.26.1&quot;<br>
meta-webos-ports:<br>
conf/world_fixes.inc:<u></u>PNBLACKLIST[mplayer2] =3D &quot;&quot;<br>
conf/world_fixes.inc:<u></u>PNBLACKLIST[android-system] =3D &quot;depends o=
n lxc from meta-virtualiazation which isn&#39;t included in my world builds=
&quot;<br>
conf/world_fixes.inc:<u></u>PNBLACKLIST[bigbuckbunny-<u></u>1080p] =3D &quo=
t;big and doesn&#39;t really need to be tested so much&quot;<br>
conf/world_fixes.inc:<u></u>PNBLACKLIST[bigbuckbunny-480p] =3D &quot;big an=
d doesn&#39;t really need to be tested so much&quot;<br>
conf/world_fixes.inc:<u></u>PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big an=
d doesn&#39;t really need to be tested so much&quot;<br>
conf/world_fixes.inc:<u></u>PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big an=
d doesn&#39;t really need to be tested so much&quot;<br>
conf/world_fixes.inc:<u></u>PNBLACKLIST[tearsofsteel-<u></u>1080p] =3D &quo=
t;big and doesn&#39;t really need to be tested so much&quot;<br>
conf/world_mask.inc:<u></u>PNBLACKLIST[evince] =3D &quot;fails to build&quo=
t;<br>
conf/world_mask.inc:<u></u>PNBLACKLIST[epiphany] =3D &quot;fails to build&q=
uot;<br>
conf/world_mask.inc:<u></u>PNBLACKLIST[gnome-power-<u></u>manager] =3D &quo=
t;fails to build&quot;<br>
conf/world_mask.inc:<u></u>PNBLACKLIST[gnome-bluetooth] =3D &quot;fails to =
build&quot;<br>
conf/world_mask.inc:<u></u>PNBLACKLIST[media-ctl] =3D &quot;fails to build&=
quot;<br>
QA issues by type:<br>
count: 3=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: already-stripped<br>
qwt-6.0.1: File &#39;/usr/lib/libqwt.so.6.0.1&#39; from qwt was already str=
ipped, this will prevent future debugging! [already-stripped]<br>
qwt-6.0.1: File &#39;/usr/lib/libqwtmathml.so.6.0.<u></u>1&#39; from qwt wa=
s already stripped, this will prevent future debugging! [already-stripped]<=
br>
qwt-6.0.1: File &#39;/usr/lib/qt4/plugins/<u></u>designer/libqwt_designer_<=
u></u>plugin.so&#39; from qwt was already stripped, this will prevent futur=
e debugging! [already-stripped]<br>
<br>
<br>
count: 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: libdir<br>
chromium-dbg: found library in wrong location: /usr/bin/chrome/.debug/<u></=
u>libffmpegsumo.so [libdir]<br>
<br>
<br>
count: 63=C2=A0 =C2=A0 =C2=A0 =C2=A0issue: textrel<br>
chromium-38.0.2125.101: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>chro=
mium/38.0.2125.101-r0/<u></u>packages-split/chromium/usr/<u></u>bin/chrome/=
libffmpegsumo.so&#39; has relocations in .text [textrel]<br>
gstreamer1.0-libav-1.4.5: ELF binary &#39;/tmp/work/armv5e-oe-linux-<u></u>=
gnueabi/gstreamer1.0-libav/1.<u></u>4.5-r0/packages-split/<u></u>gstreamer1=
.0-libav/usr/lib/<u></u>gstreamer-1.0/libgstlibav.so&#39; has relocations i=
n .text [textrel]<br>
gstreamer1.0-libav-1.4.5: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>gs=
treamer1.0-libav/1.4.5-r0/<u></u>packages-split/gstreamer1.0-<u></u>libav/u=
sr/lib/gstreamer-1.0/<u></u>libgstlibav.so&#39; has relocations in .text [t=
extrel]<br>
libav-9.16: ELF binary &#39;/tmp/work/armv5e-oe-linux-<u></u>gnueabi/libav/=
9.16-r0/<u></u>packages-split/libavcodec/usr/<u></u>lib/libavcodec.so.54.35=
.0&#39; has relocations in .text [textrel]<br>
libav-9.16: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>libav/9.16-r0/pa=
ckages-split/<u></u>libavcodec/usr/lib/libavcodec.<u></u>so.54.35.0&#39; ha=
s relocations in .text [textrel]<br>
libav-9.16: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>libav/9.16-r0/pa=
ckages-split/<u></u>libavdevice/usr/lib/<u></u>libavdevice.so.53.2.0&#39; h=
as relocations in .text [textrel]<br>
libav-9.16: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>libav/9.16-r0/pa=
ckages-split/<u></u>libavfilter/usr/lib/<u></u>libavfilter.so.3.3.0&#39; ha=
s relocations in .text [textrel]<br>
libav-9.16: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>libav/9.16-r0/pa=
ckages-split/<u></u>libavformat/usr/lib/<u></u>libavformat.so.54.20.4&#39; =
has relocations in .text [textrel]<br>
libav-9.16: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>libav/9.16-r0/pa=
ckages-split/<u></u>libavresample/usr/lib/<u></u>libavresample.so.1.0.1&#39=
; has relocations in .text [textrel]<br>
libav-9.16: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>libav/9.16-r0/pa=
ckages-split/<u></u>libavutil/usr/lib/libavutil.<u></u>so.52.3.0&#39; has r=
elocations in .text [textrel]<br>
libav-9.16: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>libav/9.16-r0/pa=
ckages-split/<u></u>libswscale/usr/lib/libswscale.<u></u>so.2.1.1&#39; has =
relocations in .text [textrel]<br>
libpostproc-52.3.0+gitAUTOINC+<u></u>811db3b957: ELF binary &#39;/tmp/work/=
armv5e-oe-linux-<u></u>gnueabi/libpostproc/52.3.0+<u></u>gitAUTOINC+811db3b=
957-r0/<u></u>packages-split/libpostproc/<u></u>usr/lib/libpostproc.so.52.3=
.0&#39; has relocations in .text [textrel]<br>
libpostproc-52.3.0+gitAUTOINC+<u></u>811db3b957: ELF binary &#39;/tmp/work/=
i586-oe-linux/<u></u>libpostproc/52.3.0+gitAUTOINC+<u></u>811db3b957-r0/pac=
kages-split/<u></u>libpostproc/usr/lib/<u></u>libpostproc.so.52.3.0&#39; ha=
s relocations in .text [textrel]<br>
mpg123-1.21.0: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>mpg123/1.21.0=
-r0/packages-<u></u>split/mpg123/usr/lib/<u></u>libmpg123.so.0.40.3&#39; ha=
s relocations in .text [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/armv5e-oe-linux-<u></u>gnueabi/pyt=
hon3/3.3.3-r1.0/<u></u>packages-split/python3-audio/<u></u>usr/lib/python3.=
3/lib-dynload/<a href=3D"http://ossaudiodev.cpython-33m.so" target=3D"_blan=
k"><u></u>ossaudiodev.cpython-33m.so</a>&#39; has relocations in .text [tex=
trel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/armv5e-oe-linux-<u></u>gnueabi/pyt=
hon3/3.3.3-r1.0/<u></u>packages-split/python3-codecs/<u></u>usr/lib/python3=
.3/lib-dynload/<u></u>_<a href=3D"http://codecs_tw.cpython-33m.so" target=
=3D"_blank">codecs_tw.cpython-33m.so</a>&#39; has relocations in .text [tex=
trel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/armv5e-oe-linux-<u></u>gnueabi/pyt=
hon3/3.3.3-r1.0/<u></u>packages-split/python3-core/<u></u>usr/lib/python3.3=
/lib-dynload/<a href=3D"http://binascii.cpython-33m.so" target=3D"_blank"><=
u></u>binascii.cpython-33m.so</a>&#39; has relocations in .text [textrel]<b=
r>
python3-3.3.3: ELF binary &#39;/tmp/work/armv5e-oe-linux-<u></u>gnueabi/pyt=
hon3/3.3.3-r1.0/<u></u>packages-split/python3-crypt/<u></u>usr/lib/python3.=
3/lib-dynload/<u></u>_<a href=3D"http://sha256.cpython-33m.so" target=3D"_b=
lank">sha256.cpython-33m.so</a>&#39; has relocations in .text [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/armv5e-oe-linux-<u></u>gnueabi/pyt=
hon3/3.3.3-r1.0/<u></u>packages-split/python3-ctypes/<u></u>usr/lib/python3=
.3/lib-dynload/<u></u>_<a href=3D"http://ctypes_test.cpython-33m.so" target=
=3D"_blank">ctypes_test.cpython-33m.so</a>&#39; has relocations in .text [t=
extrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/armv5e-oe-linux-<u></u>gnueabi/pyt=
hon3/3.3.3-r1.0/<u></u>packages-split/python3-curses/<u></u>usr/lib/python3=
.3/lib-dynload/<u></u>_<a href=3D"http://curses.cpython-33m.so" target=3D"_=
blank">curses.cpython-33m.so</a>&#39; has relocations in .text [textrel]<br=
>
python3-3.3.3: ELF binary &#39;/tmp/work/armv5e-oe-linux-<u></u>gnueabi/pyt=
hon3/3.3.3-r1.0/<u></u>packages-split/python3-<u></u>elementtree/usr/lib/py=
thon3.3/<u></u>lib-dynload/_<a href=3D"http://elementtree.cpython-33m.so" t=
arget=3D"_blank">elementtree.<u></u>cpython-33m.so</a>&#39; has relocations=
 in .text [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/armv5e-oe-linux-<u></u>gnueabi/pyt=
hon3/3.3.3-r1.0/<u></u>packages-split/python3-fcntl/<u></u>usr/lib/python3.=
3/lib-dynload/<a href=3D"http://fcntl.cpython-33m.so" target=3D"_blank"><u>=
</u>fcntl.cpython-33m.so</a>&#39; has relocations in .text [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/armv5e-oe-linux-<u></u>gnueabi/pyt=
hon3/3.3.3-r1.0/<u></u>packages-split/python3-gdbm/<u></u>usr/lib/python3.3=
/lib-dynload/<u></u>_<a href=3D"http://gdbm.cpython-33m.so" target=3D"_blan=
k">gdbm.cpython-33m.so</a>&#39; has relocations in .text [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/armv5e-oe-linux-<u></u>gnueabi/pyt=
hon3/3.3.3-r1.0/<u></u>packages-split/python3-io/usr/<u></u>lib/python3.3/l=
ib-dynload/_<a href=3D"http://socket.cpython-33m.so" target=3D"_blank">soc<=
u></u>ket.cpython-33m.so</a>&#39; has relocations in .text [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/armv5e-oe-linux-<u></u>gnueabi/pyt=
hon3/3.3.3-r1.0/<u></u>packages-split/python3-json/<u></u>usr/lib/python3.3=
/lib-dynload/<u></u>_<a href=3D"http://json.cpython-33m.so" target=3D"_blan=
k">json.cpython-33m.so</a>&#39; has relocations in .text [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/armv5e-oe-linux-<u></u>gnueabi/pyt=
hon3/3.3.3-r1.0/<u></u>packages-split/python3-lang/<u></u>usr/lib/python3.3=
/lib-dynload/<u></u>_<a href=3D"http://bisect.cpython-33m.so" target=3D"_bl=
ank">bisect.cpython-33m.so</a>&#39; has relocations in .text [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/armv5e-oe-linux-<u></u>gnueabi/pyt=
hon3/3.3.3-r1.0/<u></u>packages-split/python3-math/<u></u>usr/lib/python3.3=
/lib-dynload/<a href=3D"http://cmath.cpython-33m.so" target=3D"_blank"><u><=
/u>cmath.cpython-33m.so</a>&#39; has relocations in .text [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/armv5e-oe-linux-<u></u>gnueabi/pyt=
hon3/3.3.3-r1.0/<u></u>packages-split/python3-misc/<u></u>usr/lib/python3.3=
/lib-dynload/<u></u>_<a href=3D"http://posixsubprocess.cpython-33m.so" targ=
et=3D"_blank">posixsubprocess.cpython-33m.<u></u>so</a>&#39; has relocation=
s in .text [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/armv5e-oe-linux-<u></u>gnueabi/pyt=
hon3/3.3.3-r1.0/<u></u>packages-split/python3-mmap/<u></u>usr/lib/python3.3=
/lib-dynload/<a href=3D"http://mmap.cpython-33m.so" target=3D"_blank"><u></=
u>mmap.cpython-33m.so</a>&#39; has relocations in .text [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/armv5e-oe-linux-<u></u>gnueabi/pyt=
hon3/3.3.3-r1.0/<u></u>packages-split/python3-<u></u>multiprocessing/usr/li=
b/<u></u>python3.3/lib-dynload/_<a href=3D"http://multiprocessing.cpython-3=
3m.so" target=3D"_blank">multipr<u></u>ocessing.cpython-33m.so</a>&#39; has=
 relocations in .text [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/armv5e-oe-linux-<u></u>gnueabi/pyt=
hon3/3.3.3-r1.0/<u></u>packages-split/python3-<u></u>profile/usr/lib/python=
3.3/lib-<u></u>dynload/_<a href=3D"http://lsprof.cpython-33m.so" target=3D"=
_blank">lsprof.cpython-33m.so</a><u></u>&#39; has relocations in .text [tex=
trel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/armv5e-oe-linux-<u></u>gnueabi/pyt=
hon3/3.3.3-r1.0/<u></u>packages-split/python3-<u></u>readline/usr/lib/pytho=
n3.3/<u></u>lib-dynload/<a href=3D"http://readline.cpython-33m.so" target=
=3D"_blank">readline.cpython-<u></u>33m.so</a>&#39; has relocations in .tex=
t [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/armv5e-oe-linux-<u></u>gnueabi/pyt=
hon3/3.3.3-r1.0/<u></u>packages-split/python3-<u></u>resource/usr/lib/pytho=
n3.3/<u></u>lib-dynload/<a href=3D"http://resource.cpython-33m.so" target=
=3D"_blank">resource.cpython-<u></u>33m.so</a>&#39; has relocations in .tex=
t [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/armv5e-oe-linux-<u></u>gnueabi/pyt=
hon3/3.3.3-r1.0/<u></u>packages-split/python3-syslog/<u></u>usr/lib/python3=
.3/lib-dynload/<a href=3D"http://syslog.cpython-33m.so" target=3D"_blank"><=
u></u>syslog.cpython-33m.so</a>&#39; has relocations in .text [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/armv5e-oe-linux-<u></u>gnueabi/pyt=
hon3/3.3.3-r1.0/<u></u>packages-split/python3-<u></u>textutils/usr/lib/pyth=
on3.3/<u></u>lib-dynload/_<a href=3D"http://csv.cpython-33m.so" target=3D"_=
blank">csv.cpython-33m.<u></u>so</a>&#39; has relocations in .text [textrel=
]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/armv5e-oe-linux-<u></u>gnueabi/pyt=
hon3/3.3.3-r1.0/<u></u>packages-split/python3-<u></u>unixadmin/usr/lib/pyth=
on3.3/<u></u>lib-dynload/<a href=3D"http://grp.cpython-33m.so" target=3D"_b=
lank">grp.cpython-33m.so</a><u></u>&#39; has relocations in .text [textrel]=
<br>
python3-3.3.3: ELF binary &#39;/tmp/work/armv5e-oe-linux-<u></u>gnueabi/pyt=
hon3/3.3.3-r1.0/<u></u>packages-split/python3-xml/<u></u>usr/lib/python3.3/=
lib-dynload/<a href=3D"http://pyexpat.cpython-33m.so" target=3D"_blank"><u>=
</u>pyexpat.cpython-33m.so</a>&#39; has relocations in .text [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>python3/3.3.3=
-r1.0/packages-<u></u>split/python3-audio/usr/lib/<u></u>python3.3/lib-dynl=
oad/<a href=3D"http://ossaudiodev.cpython-33m.so" target=3D"_blank">ossaudi=
o<u></u>dev.cpython-33m.so</a>&#39; has relocations in .text [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>python3/3.3.3=
-r1.0/packages-<u></u>split/python3-codecs/usr/lib/<u></u>python3.3/lib-dyn=
load/_<a href=3D"http://codecs_cn.cpython-33m.so" target=3D"_blank">codecs_=
<u></u>cn.cpython-33m.so</a>&#39; has relocations in .text [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>python3/3.3.3=
-r1.0/packages-<u></u>split/python3-core/usr/lib/<u></u>python3.3/lib-dynlo=
ad/<a href=3D"http://binascii.cpython-33m.so" target=3D"_blank">binascii<u>=
</u>.cpython-33m.so</a>&#39; has relocations in .text [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>python3/3.3.3=
-r1.0/packages-<u></u>split/python3-crypt/usr/lib/<u></u>python3.3/lib-dynl=
oad/_<a href=3D"http://sha256.cpython-33m.so" target=3D"_blank">sha256.<u><=
/u>cpython-33m.so</a>&#39; has relocations in .text [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>python3/3.3.3=
-r1.0/packages-<u></u>split/python3-ctypes/usr/lib/<u></u>python3.3/lib-dyn=
load/_<a href=3D"http://ctypes_test.cpython-33m.so" target=3D"_blank">ctype=
s_<u></u>test.cpython-33m.so</a>&#39; has relocations in .text [textrel]<br=
>
python3-3.3.3: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>python3/3.3.3=
-r1.0/packages-<u></u>split/python3-curses/usr/lib/<u></u>python3.3/lib-dyn=
load/_<a href=3D"http://curses.cpython-33m.so" target=3D"_blank">curses.<u>=
</u>cpython-33m.so</a>&#39; has relocations in .text [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>python3/3.3.3=
-r1.0/packages-<u></u>split/python3-elementtree/usr/<u></u>lib/python3.3/li=
b-dynload/_<a href=3D"http://elementtree.cpython-33m.so" target=3D"_blank">=
ele<u></u>menttree.cpython-33m.so</a>&#39; has relocations in .text [textre=
l]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>python3/3.3.3=
-r1.0/packages-<u></u>split/python3-fcntl/usr/lib/<u></u>python3.3/lib-dynl=
oad/<a href=3D"http://fcntl.cpython-33m.so" target=3D"_blank">fcntl.<u></u>=
cpython-33m.so</a>&#39; has relocations in .text [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>python3/3.3.3=
-r1.0/packages-<u></u>split/python3-gdbm/usr/lib/<u></u>python3.3/lib-dynlo=
ad/_<a href=3D"http://gdbm.cpython-33m.so" target=3D"_blank">gdbm.<u></u>cp=
ython-33m.so</a>&#39; has relocations in .text [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>python3/3.3.3=
-r1.0/packages-<u></u>split/python3-io/usr/lib/<u></u>python3.3/lib-dynload=
/_<a href=3D"http://socket.cpython-33m.so" target=3D"_blank">socket.<u></u>=
cpython-33m.so</a>&#39; has relocations in .text [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>python3/3.3.3=
-r1.0/packages-<u></u>split/python3-json/usr/lib/<u></u>python3.3/lib-dynlo=
ad/_<a href=3D"http://json.cpython-33m.so" target=3D"_blank">json.<u></u>cp=
ython-33m.so</a>&#39; has relocations in .text [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>python3/3.3.3=
-r1.0/packages-<u></u>split/python3-lang/usr/lib/<u></u>python3.3/lib-dynlo=
ad/_<a href=3D"http://bisect.cpython-33m.so" target=3D"_blank">bisect.<u></=
u>cpython-33m.so</a>&#39; has relocations in .text [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>python3/3.3.3=
-r1.0/packages-<u></u>split/python3-math/usr/lib/<u></u>python3.3/lib-dynlo=
ad/<a href=3D"http://cmath.cpython-33m.so" target=3D"_blank">cmath.<u></u>c=
python-33m.so</a>&#39; has relocations in .text [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>python3/3.3.3=
-r1.0/packages-<u></u>split/python3-misc/usr/lib/<u></u>python3.3/lib-dynlo=
ad/_<a href=3D"http://md5.cpython-33m.so" target=3D"_blank">md5.<u></u>cpyt=
hon-33m.so</a>&#39; has relocations in .text [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>python3/3.3.3=
-r1.0/packages-<u></u>split/python3-mmap/usr/lib/<u></u>python3.3/lib-dynlo=
ad/<a href=3D"http://mmap.cpython-33m.so" target=3D"_blank">mmap.<u></u>cpy=
thon-33m.so</a>&#39; has relocations in .text [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>python3/3.3.3=
-r1.0/packages-<u></u>split/python3-multiprocessing/<u></u>usr/lib/python3.=
3/lib-dynload/<u></u>_<a href=3D"http://multiprocessing.cpython-33m.so" tar=
get=3D"_blank">multiprocessing.cpython-33m.<u></u>so</a>&#39; has relocatio=
ns in .text [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>python3/3.3.3=
-r1.0/packages-<u></u>split/python3-profile/usr/lib/<u></u>python3.3/lib-dy=
nload/_<a href=3D"http://lsprof.cpython-33m.so" target=3D"_blank">lsprof.<u=
></u>cpython-33m.so</a>&#39; has relocations in .text [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>python3/3.3.3=
-r1.0/packages-<u></u>split/python3-readline/usr/<u></u>lib/python3.3/lib-d=
ynload/<a href=3D"http://readline.cpython-33m.so" target=3D"_blank">read<u>=
</u>line.cpython-33m.so</a>&#39; has relocations in .text [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>python3/3.3.3=
-r1.0/packages-<u></u>split/python3-resource/usr/<u></u>lib/python3.3/lib-d=
ynload/<a href=3D"http://resource.cpython-33m.so" target=3D"_blank">reso<u>=
</u>urce.cpython-33m.so</a>&#39; has relocations in .text [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>python3/3.3.3=
-r1.0/packages-<u></u>split/python3-syslog/usr/lib/<u></u>python3.3/lib-dyn=
load/<a href=3D"http://syslog.cpython-33m.so" target=3D"_blank">syslog.<u><=
/u>cpython-33m.so</a>&#39; has relocations in .text [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>python3/3.3.3=
-r1.0/packages-<u></u>split/python3-textutils/usr/<u></u>lib/python3.3/lib-=
dynload/_<a href=3D"http://csv.cpython-33m.so" target=3D"_blank">csv<u></u>=
.cpython-33m.so</a>&#39; has relocations in .text [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>python3/3.3.3=
-r1.0/packages-<u></u>split/python3-unixadmin/usr/<u></u>lib/python3.3/lib-=
dynload/<a href=3D"http://grp.cpython-33m.so" target=3D"_blank">grp.<u></u>=
cpython-33m.so</a>&#39; has relocations in .text [textrel]<br>
python3-3.3.3: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>python3/3.3.3=
-r1.0/packages-<u></u>split/python3-xml/usr/lib/<u></u>python3.3/lib-dynloa=
d/<a href=3D"http://pyexpat.cpython-33m.so" target=3D"_blank">pyexpat.<u></=
u>cpython-33m.so</a>&#39; has relocations in .text [textrel]<br>
qtwebkit-5.4.0+gitAUTOINC+<u></u>3a2cb4770c: ELF binary &#39;/tmp/work/i586=
-oe-linux/<u></u>qtwebkit/5.4.0+gitAUTOINC+<u></u>3a2cb4770c-r0/packages-sp=
lit/<u></u>qtwebkit/usr/lib/libQt5WebKit.<u></u>so.5.4.0&#39; has relocatio=
ns in .text [textrel]<br>
webkit-efl-1.11.0: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>webkit-ef=
l/1_1.11.0-r0/<u></u>packages-split/webkit-efl/usr/<u></u>lib/libjavascript=
core_efl.so.<u></u>1.11.0&#39; has relocations in .text [textrel]<br>
webkit-gtk-1.8.3: ELF binary &#39;/tmp/work/i586-oe-linux/<u></u>webkit-gtk=
/1.8.3-r1/packages-<u></u>split/libjavascriptcore/usr/<u></u>lib/libjavascr=
iptcoregtk-1.0.<u></u>so.0.13.4&#39; has relocations in .text [textrel]<br>
<br>
<br>
count: 26=C2=A0 =C2=A0 =C2=A0 =C2=A0issue: build-deps<br>
emacs-23.4: emacs rdepends on ncurses-libtinfo, but it isn&#39;t a build de=
pendency? [build-deps]<br>
exquisite-0.0.1+svnr82070: exquisite rdepends on initscripts-functions, but=
 it isn&#39;t a build dependency? [build-deps]<br>
freetds-0.92.79: freetds rdepends on readline, but it isn&#39;t a build dep=
endency? [build-deps]<br>
geoclue-2.0.0: geoclue rdepends on geoip, but it isn&#39;t a build dependen=
cy? [build-deps]<br>
glade3-3.8.5: glade3 rdepends on libpython2, but it isn&#39;t a build depen=
dency? [build-deps]<br>
gpm-1.99.7: gpm rdepends on initscripts-functions, but it isn&#39;t a build=
 dependency? [build-deps]<br>
grub-efi-2.00: grub-efi rdepends on fuse, but it isn&#39;t a build dependen=
cy? [build-deps]<br>
irda-utils-0.9.18: irda-utils rdepends on initscripts-functions, but it isn=
&#39;t a build dependency? [build-deps]<br>
libwebp-0.4.0: libwebp-bin rdepends on libgl-mesa, but it isn&#39;t a build=
 dependency? [build-deps]<br>
libwebp-0.4.0: libwebp-bin rdepends on mesa-glut, but it isn&#39;t a build =
dependency? [build-deps]<br>
log4c-1.2.4: log4c rdepends on expat, but it isn&#39;t a build dependency? =
[build-deps]<br>
mpd-0.19.1: mpd rdepends on libsmbclient, but it isn&#39;t a build dependen=
cy? [build-deps]<br>
netkit-rwho-0.17: netkit-rwho-client rdepends on initscripts-functions, but=
 it isn&#39;t a build dependency? [build-deps]<br>
pkcs11-helper-1.11: pkcs11-helper rdepends on nspr, but it isn&#39;t a buil=
d dependency? [build-deps]<br>
pkcs11-helper-1.11: pkcs11-helper rdepends on nss, but it isn&#39;t a build=
 dependency? [build-deps]<br>
qt5-creator-3.3.0: qt5-creator rdepends on qt-creator, but it isn&#39;t a b=
uild dependency? [build-deps]<br>
qt5-creator-3.3.0: qt5-creator rdepends on qtquick1, but it isn&#39;t a bui=
ld dependency? [build-deps]<br>
qtwayland-5.4.0+gitAUTOINC+<u></u>50d6c0ae94: qtwayland-plugins rdepends on=
 libxcomposite, but it isn&#39;t a build dependency? [build-deps]<br>
qtwebkit-5.4.0+gitAUTOINC+<u></u>3a2cb4770c: qtwebkit rdepends on libxcompo=
site, but it isn&#39;t a build dependency? [build-deps]<br>
sox-14.4.0: sox rdepends on libflac, but it isn&#39;t a build dependency? [=
build-deps]<br>
stunnel-5.10: stunnel rdepends on libcap, but it isn&#39;t a build dependen=
cy? [build-deps]<br>
stunnel-5.10: stunnel rdepends on liblzma, but it isn&#39;t a build depende=
ncy? [build-deps]<br>
stunnel-5.10: stunnel rdepends on libsystemd, but it isn&#39;t a build depe=
ndency? [build-deps]<br>
sysklogd-1.5.1: sysklogd rdepends on initscripts-functions, but it isn&#39;=
t a build dependency? [build-deps]<br>
tcpdump-4.6.1: tcpdump rdepends on libsmi, but it isn&#39;t a build depende=
ncy? [build-deps]<br>
vlc-2.1.4: vlc rdepends on libsamplerate0, but it isn&#39;t a build depende=
ncy? [build-deps]<br>
<br>
<br>
count: 50=C2=A0 =C2=A0 =C2=A0 =C2=A0issue: file-rdeps<br>
apache2-2.4.10: apache2-dev requires /usr/bin/perl, but no providers in its=
 RDEPENDS [file-rdeps]<br>
chkconfig-1.3.58: chkconfig requires libnewt.so()(64bit), but no providers =
in its RDEPENDS [file-rdeps]<br>
chkconfig-1.3.58: chkconfig requires libnewt.so, but no providers in its RD=
EPENDS [file-rdeps]<br>
cloud9-0.6: cloud9 requires /bin/bash, but no providers in its RDEPENDS [fi=
le-rdeps]<br>
dvb-apps-1.1.1: dvb-apps requires libucsi.so()(64bit), libdvbapi.so()(64bit=
), libdvbcfg.so()(64bit), libdvben50221.so()(64bit), libdvbsec.so()(64bit),=
 but no providers in its RDEPENDS [file-rdeps]<br>
dvb-apps-1.1.1: dvb-apps requires libucsi.so, libdvben50221.so, libdvbsec.s=
o, libdvbcfg.so, libdvbapi.so, but no providers in its RDEPENDS [file-rdeps=
]<br>
dvb-apps-1.1.1: dvb-femon requires libdvbapi.so()(64bit), but no providers =
in its RDEPENDS [file-rdeps]<br>
dvb-apps-1.1.1: dvb-femon requires libdvbapi.so, but no providers in its RD=
EPENDS [file-rdeps]<br>
dvb-apps-1.1.1: dvb-scan requires libdvbsec.so()(64bit), libdvbapi.so()(64b=
it), libdvbcfg.so()(64bit), but no providers in its RDEPENDS [file-rdeps]<b=
r>
dvb-apps-1.1.1: dvb-scan requires libdvbsec.so, libdvbcfg.so, libdvbapi.so,=
 but no providers in its RDEPENDS [file-rdeps]<br>
dvb-apps-1.1.1: dvbdate requires libucsi.so()(64bit), libdvbapi.so()(64bit)=
, but no providers in its RDEPENDS [file-rdeps]<br>
dvb-apps-1.1.1: dvbdate requires libucsi.so, libdvbapi.so, but no providers=
 in its RDEPENDS [file-rdeps]<br>
dvb-apps-1.1.1: dvbnet requires libdvbapi.so()(64bit), but no providers in =
its RDEPENDS [file-rdeps]<br>
dvb-apps-1.1.1: dvbnet requires libdvbapi.so, but no providers in its RDEPE=
NDS [file-rdeps]<br>
dvb-apps-1.1.1: dvbtraffic requires libdvbapi.so()(64bit), but no providers=
 in its RDEPENDS [file-rdeps]<br>
dvb-apps-1.1.1: dvbtraffic requires libdvbapi.so, but no providers in its R=
DEPENDS [file-rdeps]<br>
emacs-23.4: emacs requires /usr/bin/perl, but no providers in its RDEPENDS =
[file-rdeps]<br>
fakeroot-1.18.4: fakeroot requires /bin/bash, but no providers in its RDEPE=
NDS [file-rdeps]<br>
fbida-2.09+gitAUTOINC+<u></u>6aa5563cb3: fbida requires /bin/bash, but no p=
roviders in its RDEPENDS [file-rdeps]<br>
foxtrotgps-1.1.1: foxtrotgps requires /usr/bin/python, /usr/bin/perl, but n=
o providers in its RDEPENDS [file-rdeps]<br>
gammu-1.32.0: gammu requires /bin/bash, but no providers in its RDEPENDS [f=
ile-rdeps]<br>
gammu-1.32.0: gammu-dev requires /bin/bash, but no providers in its RDEPEND=
S [file-rdeps]<br>
gateone-1.2: gateone requires /bin/bash, but no providers in its RDEPENDS [=
file-rdeps]<br>
giflib-4.1.6: giflib-utils requires /usr/bin/perl, but no providers in its =
RDEPENDS [file-rdeps]<br>
gnome-desktop-2.32.1: gnome-desktop requires /usr/bin/python, but no provid=
ers in its RDEPENDS [file-rdeps]<br>
gnome-panel-2.32.1: gnome-panel requires /usr/bin/python, but no providers =
in its RDEPENDS [file-rdeps]<br>
groff-1.22.2: groff requires /bin/sed, but no providers in its RDEPENDS [fi=
le-rdeps]<br>
gupnp-0.20.12: gupnp-dev requires /usr/bin/python, but no providers in its =
RDEPENDS [file-rdeps]<br>
hplip-3.12.6: hplip-filter requires /usr/bin/perl, but no providers in its =
RDEPENDS [file-rdeps]<br>
ipvsadm-1.26: ipvsadm requires /bin/bash, but no providers in its RDEPENDS =
[file-rdeps]<br>
libbonobo-2.32.1: libbonobo requires /usr/bin/perl, but no providers in its=
 RDEPENDS [file-rdeps]<br>
libnewt-0.52.18: whiptail requires libnewt.so()(64bit), but no providers in=
 its RDEPENDS [file-rdeps]<br>
libnewt-0.52.18: whiptail requires libnewt.so, but no providers in its RDEP=
ENDS [file-rdeps]<br>
libnewt-python-0.52.18: libnewt-python requires libnewt.so()(64bit), but no=
 providers in its RDEPENDS [file-rdeps]<br>
libnewt-python-0.52.18: libnewt-python requires libnewt.so, but no provider=
s in its RDEPENDS [file-rdeps]<br>
lio-utils-4.1+gitAUTOINC+<u></u>28bd928655: lio-utils requires /bin/bash, b=
ut no providers in its RDEPENDS [file-rdeps]<br>
lmsensors-config-1.0: lmsensors-config-cgi requires /usr/bin/rrdcgi, but no=
 providers in its RDEPENDS [file-rdeps]<br>
nodejs-0.8.18: nodejs requires /bin/bash, but no providers in its RDEPENDS =
[file-rdeps]<br>
numptyphysics-0.2+svnr109: numptyphysics requires /bin/bash, /usr/bin/perl,=
 but no providers in its RDEPENDS [file-rdeps]<br>
opensaf-4.5.0: opensaf requires /bin/bash, /usr/bin/python, but no provider=
s in its RDEPENDS [file-rdeps]<br>
packagekit-0.5.6: packagekit requires /bin/bash, but no providers in its RD=
EPENDS [file-rdeps]<br>
pcsc-lite-1.8.6: pcsc-lite requires /usr/bin/python, but no providers in it=
s RDEPENDS [file-rdeps]<br>
pm-qa-0.4.14: pm-qa requires /bin/bash, but no providers in its RDEPENDS [f=
ile-rdeps]<br>
qt-creator-2.8.1: qt-creator requires /usr/bin/perl, but no providers in it=
s RDEPENDS [file-rdeps]<br>
tracker-0.14.2: tracker-nautilus-extension requires libnautilus-extension.s=
o.1()(<u></u>64bit), but no providers in its RDEPENDS [file-rdeps]<br>
tracker-0.14.2: tracker-nautilus-extension requires libnautilus-extension.s=
o.1, but no providers in its RDEPENDS [file-rdeps]<br>
ubx-utils-0.0.0+gitrAUTOINC+<u></u>b63c0932dd: ubx-utils requires /bin/bash=
, but no providers in its RDEPENDS [file-rdeps]<br>
unionfs-fuse-0.26: unionfs-fuse requires /bin/bash, but no providers in its=
 RDEPENDS [file-rdeps]<br>
usbpath-0.0+svnr3172: usbpath requires /usr/bin/perl, but no providers in i=
ts RDEPENDS [file-rdeps]<br>
wvstreams-4.6.1: wvstreams requires /usr/bin/perl, but no providers in its =
RDEPENDS [file-rdeps]<br>
<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: version-going-backwards<br>
<br>
<br>
<br>
</blockquote></div></div><span class=3D""><font color=3D"#888888">
-- <br>
______________________________<u></u>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<u></u>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/<u></u>mailman/listinfo/o=
penembedded-<u></u>core</a><br>
</font></span></blockquote></div><br></div></div>

--e89a8f3ba1ebe387a7050fd3de9e--
