Return-Path: <andrea.adami@gmail.com>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id A93B9731DF;
	Fri, 15 Jan 2016 21:10:52 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id m198so142981228lfm.0;
	Fri, 15 Jan 2016 13:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=bI+0JdgSsADvikp5Xn9nnViuktulhQSYJHR219b5QAo=;
	b=xuEvkm8H2SzvK/WEgXp0N/hNYRc6qvQutZn0X4+NPdfEEEXBRliPL7X2v6rPNwJNUY
	qdH7ERgHnq57oM9mVkw4AziCTyyxwEJh3eB55X1L7rw9XVnLUGxc34i6PAmieNdia0f8
	AIiyWkNIxwmxNMoVRFqGuNbBoMPI2RapUypQDuevLlzMggsbf3YbSj2RjcXUg9Wa7Je3
	FraWwEq2vpw04YEMIPnM+taKjETxMmHC9ckReIDzkidRC9OPW0UYwfPSrcmnZ9l1yrAx
	7nWBw4hsDa+aUvkRX3tx5k7jxa0x+HxWOckGztge0LCOwvIp8M30YPzZGnt0yUyE5Yiw
	o6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=bI+0JdgSsADvikp5Xn9nnViuktulhQSYJHR219b5QAo=;
	b=El6v8qd6RIkyiMPMKP4t/oftCwn7q3pMWAxVlMa2rT40CGEVypnSn1q7pz8A7MBsHp
	Ucap/gaiIV655b2VMeqznceF5JrvOSZHHBmWvxhufBgN82gbf1fLvDGcDWCnY/tVt1oN
	4F/uHlsw54L1+AqIlRtgZZ9I/EXU0feFv2E9dmckCDclL3FiG45eL3GvOBKKA56o+3oK
	6pl5moJL4HOHhS84LfodDpeqoD5GI9mDHNkICxsLpB64XN1Djzh4AZO2YY4c5ugTNzaV
	lvvdZnpUr2hgVrNt38LAsZUUXnf/pnsGzDo3zveTd/e02iVO216tbOgxLJA0iE+MHB/j
	D7Tg==
X-Gm-Message-State: ALoCoQnXFyQ4qanrzj7EQU713MkzrcaTE+vEKzUF3wQqyiQt1LSbh4KFUTZBFAnTDd1gdsKg+2/vlxY5NNMftS4YQoXMAPQF0w==
MIME-Version: 1.0
X-Received: by 10.25.155.81 with SMTP id d78mr3571379lfe.77.1452892252643;
	Fri, 15 Jan 2016 13:10:52 -0800 (PST)
Received: by 10.114.19.35 with HTTP; Fri, 15 Jan 2016 13:10:52 -0800 (PST)
In-Reply-To: <569904A8.1070404@windriver.com>
References: <20160114122154.GD2582@jama>
	<CAAQYJAuk=8tRZiosoudTaV2nhhwOU53CLwLorqdzAUTL_jJ65A@mail.gmail.com>
	<569904A8.1070404@windriver.com>
Date: Fri, 15 Jan 2016 22:10:52 +0100
Message-ID: <CAAQYJAt4+rKfdiiShCRK0kKhVz5Jojqh+70JreHcfGz7Qz+Gtg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2016-01-09, full QA report
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
X-List-Received-Date: Fri, 15 Jan 2016 21:10:53 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 15, 2016 at 3:39 PM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> On 16-01-15 03:13 AM, Andrea Adami wrote:
>>
>> On Thu, Jan 14, 2016 at 1:21 PM, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>>>
>>> qemuarm was using slightly older metadata, that's why it shows more
>>> failures.
>>>
>>> Reexecuting qemuarm build shows only one failure:
>>> Summary: 1 task failed:
>>>
>>> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.24.2.bb,
>>> do_populate_sysroot
>>> Summary: There were 5 WARNING messages shown.
>>> Summary: There were 3 ERROR messages shown, returning a non-zero exit
>>> code.
>>>
>>> == Tested changes (not included in master yet) - bitbake ==
>>> cdf4cfb world-image: add extra target
>>>
>>> == Tested changes (not included in master yet) - openembedded-core ==
>>> d444e2c sstate-sysroot-cruft.sh: Extend the whitelist
>>> f5aec48 arch-armv7ve.inc: respect armv7a override as well
>>> 33ac877 libbsd: upgrade to 0.8.1
>>> 9b8400f scripts/create-pull-request: fix git request-pull syntax
>>> 07f4dba qemux86: Add identical qemux86copy variant for tests
>>> 3183ee1 report-error: Allow to upload reports automatically
>>>
>>> == Tested changes (not included in master yet) - meta-openembedded ==
>>> 4d6ae05 gnome-desktop: don't try to copy omf.make
>>> 17bd432 navit: disable qt4 support by default
>>> cde9695 gspd: disable qt4 support by default
>>> caf40a5 recipes: remove recipes using or depending on qt4 bbclasses or
>>> recipes
>>> 403bc6c waf-samba.bbclass: add cross-answers option and files
>>> b166d5a samba: backport patches for cross-compiling
>>> 74457f8 samba: fix the incorrect tmpfiles installed directory
>>> 81fed56 libtalloc: upgrade to 2.1.3
>>> eafd027 libtevent: upgrade to 0.9.25
>>> 5bb6a15 libldb: upgrade to 1.1.21
>>> 64b5ead libtdb: upgrade to 1.3.7
>>> be49dee xterm: 308 -> 320
>>> e912fac gvfs: update to 1.24.2 to make access to windows shares work
>>> again
>>> 24645de python-pip: 7.1.0 -> 7.1.2
>>> 023ae09 stunnel: 5.21 -> 5.28
>>> 68edfc2 opensaf: 4.6.0 -> 4.7.0
>>> 143e983 postfix: 3.0.2 -> 3.0.3
>>> a855432 rp-pppoe: 3.11 -> 3.12
>>> dc19244 dnsmasq: Listen only on loopback and disable DHCP
>>> 1356bc0 poco: Add recipe for POCO C++ library
>>> 5635496 mozjs: fix linking issues on i586
>>> fc26804 syslog-ng: 3.5.4.1 -> 3.6.4
>>> 641efda libsmi: 0.4.8 -> 0.5.0
>>> 456105b lvm2: 2.02.125 -> 2.02.138
>>> 5a09739 python-six: Error fix for recipes depend on python-six
>>> bae5cd5 Add python-jsonpatch and python-jsonpointer recipes
>>> ffb25e5 python-tornado: upgrade to 4.3
>>> 355ecdd mariadb: -native also needs gold workaround
>>> 38cfba5 cifs-utils: add PACKAGECONFIG for cifsidmap
>>> 5683c8b cifs-utils: add PACKAGECONFIG for pam
>>> fea767c netmap-modules: fix build with kernel < 3.17
>>> f21b8b5 dhcpcd: add recipe for dhcpcd
>>> ffea5e3 samba: Fix typo in PACKAGECONFIG for "acl" and "aio"
>>> 7a34c21 Revert "libjpeg-turbo: remove recipe"
>>> 1ea033a libjpeg-turbo: remove recipe
>>> 44d0230 lowpan-tools: add missing flex/bison deps
>>> 3c49bd0 postfix: fix clean broken issue
>>> 1b9a465 ncftp: fix build failures with ccdv
>>> 9ec3ca5 iscsitarget: skip the arch test for kernel modules
>>> 345134f iscsitarget: split the kernel module into separate package
>>> ce4c2a0 netkit-ftp: fixed invalid symlink
>>> 3944ca6 ctdb: add PACKAGECONFIG for libtdb
>>> 36bbcb2 cim-schema-exper: fix host-user-contaminated
>>> 4c62551 nbd: use BPN in Files
>>> 1622b4e wireshark: update SRC_URI link to sources
>>> 3f03fb3 postfix: premission of /var/spool/mail seems incorrect
>>> af66826 tcpdump: add PACKAGECONFIG for libcap-ng
>>>
>>> == Tested changes (not included in master yet) - meta-qt5 ==
>>> 943406e Revert "qtbase: fix Tartget typo"
>>> 7a2906b qtbase: fix Tartget typo
>>> c053ee2 qtscript/qtwebkit: disable thumb for armv4 and armv5 only to fix
>>> segfault on armv7
>>> ca847b3 qtwebengine: Fix error jpeg_codec.cc,
>>> media_capture_devices_dispatcher.cpp and file API qquickwebengineview_p_p.h.
>>> c29c758 qt5: add extra path to qmlplugins
>>>
>>> == Tested changes (not included in master yet) - meta-browser ==
>>>
>>> == Tested changes (not included in master yet) - meta-webos-ports ==
>>>
>>> == Tested changes (not included in master yet) - meta-smartphone ==
>>> 7daae02 meta-shr-distro: remove aurora dependency
>>> 1776861 layer.conf: add LAYERDEPENDS matching README files
>>> 208dda7 packagegroup-shr-feed: remove confclerk, evopedia, anki, monav
>>> fd22968 meta-fso, meta-aurora: move libfso-qt and qfsodbusxml2cpp to
>>> meta-aurora and add dependency on qt4 layer
>>> ec44745 Initial support for Samsung Galaxy SIII (International), aka
>>> i9300
>>> cf30493 initramfs-boot-android: clean up init script
>>> 34c0047 busybox: rename bbappend to match new version from oe-core
>>> 1223487 xserver-xorg: rename bbappend to match new version from oe-core
>>> 92f78c0 packagegroup-shr*: remove pidgin, jefliks and claws-mail
>>> blacklisted in meta-oe
>>> 2ce67f5 jefliks: blacklist because of gnutls upgrade
>>> 96a7810 meta-shr, meta-fso: drop nonworking recipes
>>>
>>> == Number of issues - stats ==
>>> {| class='wikitable'
>>> !|Date               !!colspan='3'|Failed tasks
>>> !!colspan='12'|QA !!Comment
>>> |-
>>> ||              ||qemuarm       ||qemux86       ||qemux86_64
>>> ||already-stripped      ||libdir        ||textrel       ||build-deps
>>> ||file-rdeps    ||version-going-backwards       ||host-user-contaminated
>>> ||installed-vs-shipped  ||unknown-configure-option      ||symlink-to-sysroot
>>> ||invalid-pkgconfig     ||pkgname       ||
>>> |-
>>> ||2016-01-09    ||2     ||3     ||6     ||0             ||6
>>> ||15            ||5             ||32            ||47604         ||16
>>> ||1             ||0             ||0             ||0             ||0
>>> ||
>>> |}
>>>
>>> http://www.openembedded.org/wiki/Bitbake_World_Status
>>>
>>> == Failed tasks 2016-01-09 ==
>>>
>>> INFO: jenkins-job.sh-1.7.0 Complete log available at
>>> http://logs.nslu2-linux.org/buildlogs/oe/world/log.report.20160110_162506.log
>>>
>>> === common () ===
>>>
>>> === common-x86 (2) ===
>>>      * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_compile
>>>      * /meta-browser/recipes-browser/chromium/chromium_40.0.2214.91.bb,
>>> do_compile
>>>
>>> === qemuarm (2) ===
>>>      *
>>> /meta-openembedded/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb,
>>> do_configure
>>>      * /meta-openembedded/meta-gnome/recipes-gnome/gvfs/gvfs_1.24.2.bb,
>>> do_compile
>>>
>>> === qemux86 (1) ===
>>>      *
>>> /meta-openembedded/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb,
>>> do_compile
>>>
>>> === qemux86_64 (4) ===
>>>      *
>>> /meta-openembedded/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_4.1.bb,
>>> do_compile_kernelmodules
>>
>>
>> Martin,
>>
>> it seems there is a patch around for kernel 4.1.2:
>> https://lkml.org/lkml/2015/7/12/163
>> I'm on 4.4 and cannot test it now...sorry.
>> Adding Bruce in copy.
>
>
> And that change looks like it became:
>
> ---------------
> commit 2fa3dc4ea7c1cdf4eed288de9a6cc5d3a8befddd
> Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Date:   Sun Jul 12 20:08:34 2015 -0300
>
>     [media] vb2: Fix compilation breakage when !CONFIG_BUG
>
>     Commit 77a3c6fd90c9 ("[media] vb2: Don't WARN when v4l2_buffer.bytesused
>     is 0 for multiplanar buffers") uses the __WARN() macro which isn't
>     defined when CONFIG_BUG isn't set. This introduces a compilation
>     breakage. Fix it by using WARN_ON() instead.
>
>     The commit was also broken in that it merged v1 of the patch while a new
>     v2 version had been submitted, reviewed and acked. Fix it by
>     incorporating the changes from v1 to v2.
>
>     Fixes: 77a3c6fd90c9 ("[media] vb2: Don't WARN when v4l2_buffer.bytesused
> is 0 for multiplanar buffers")
>
>     Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>     Acked-by: Larry Finger <Larry.Finger@lwfinger.net>
>     Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
>     Signed-off-by: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
>
> ---------------
>
> I'd rather be able to do a test build myself .. Andrea: is it
> as simple as adding meta-initramfs and building linux-yocto-tiny-kexecboot ?
>
> Bruce

I think so. Martin's build was for qemux86_64.

Andrea

>
>
>
>>
>> Cheers
>> Andrea
>>
>>
>>>      * /meta-openembedded/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb,
>>> do_compile
>>>      * /meta-openembedded/meta-oe/recipes-support/opencv/opencv_2.4.bb,
>>> do_compile
>>>      *
>>> /meta-openembedded/meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb,
>>> do_compile
>>>
>>> === Number of failed tasks (11) ===
>>> {| class=wikitable
>>> |-
>>> || qemuarm      || 2     ||
>>> http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20160107_155434.log//
>>> || http://errors.yoctoproject.org:80/Errors/Build/11454/
>>> |-
>>> || qemux86      || 3     ||
>>> http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20160108_151849.log//
>>> || http://errors.yoctoproject.org:80/Errors/Build/11462/
>>> |-
>>> || qemux86_64   || 6     ||
>>> http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20160109_155509.log//
>>> || http://errors.yoctoproject.org:80/Errors/Build/11476/
>>> |}
>>>
>>> === PNBLACKLISTs (91) ===
>>>
>>> === QA issues (47679) ===
>>> {| class=wikitable
>>> !| Count                ||Issue
>>> |-
>>> ||0     ||already-stripped
>>> |-
>>> ||0     ||invalid-pkgconfig
>>> |-
>>> ||0     ||pkgname
>>> |-
>>> ||0     ||symlink-to-sysroot
>>> |-
>>> ||0     ||unknown-configure-option
>>> |-
>>> ||1     ||installed-vs-shipped
>>> |-
>>> ||15    ||textrel
>>> |-
>>> ||16    ||host-user-contaminated
>>> |-
>>> ||32    ||file-rdeps
>>> |-
>>> ||47604 ||version-going-backwards
>>> |-
>>> ||5     ||build-deps
>>> |-
>>> ||6     ||libdir
>>> |}
>>>
>>>
>>> PNBLACKLISTs:
>>> openembedded-core/:
>>> meta-browser:
>>> meta-openembedded:
>>> meta-efl/recipes-efl/e17/diskio_svn.bb:PNBLACKLIST[diskio] ?= "broken:
>>> switch to https://git.enlightenment.org/enlightenment/modules/diskio.git/
>>> and fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58.
>>> invalid state name: 'off'. "default" state must always be first."
>>> meta-efl/recipes-efl/e17/elmdentica_svn.bb:PNBLACKLIST[elmdentica] ?=
>>> "OLD and depends on broken azy"
>>> meta-efl/recipes-efl/e17/emprint_svn.bb:PNBLACKLIST[emprint] ?= "if you
>>> want to use these modules with E18, then you need to update it to git recipe
>>> fetching newer sources from http://git.enlightenment.org/apps/emprint.git/"
>>> meta-efl/recipes-efl/e17/news_svn.bb:PNBLACKLIST[news] ?= "if you want to
>>> use these modules with E18, then you need to update it to git recipe
>>> fetching newer sources from
>>> http://git.enlightenment.org/enlightenment/modules/news.git/"
>>> meta-efl/recipes-efl/e17/rage_svn.bb:PNBLACKLIST[rage] ?= "if you want to
>>> use these modules with E18, then you need to update it to git recipe
>>> fetching newer sources from  http://git.enlightenment.org/apps/rage.git/"
>>> meta-efl/recipes-efl/e17/screenshot_svn.bb:PNBLACKLIST[screenshot] ?=
>>> "depends on blacklisted emprint"
>>> meta-efl/recipes-efl/efl/azy_svn.bb:PNBLACKLIST[azy] ?= "OLD and doesn't
>>> build with gcc-5"
>>> meta-efl/recipes-efl/efl/entrance_svn.bb:PNBLACKLIST[entrance] ?=
>>> "broken: switch to https://git.enlightenment.org/misc/entrance.git and fix
>>> 0.0.4+svnr82070-r7/entrance/data/themes/old/default.edc:678. invalid state
>>> name: 'defaault'. "default" state must always be first."
>>> meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb:PNBLACKLIST[mcnavi] ?=
>>> "BROKEN: latest version 0.3.4 is 3 years old and now broken with more strict
>>> ejde_cc from efl-1.13"
>>> meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb:PNBLACKLIST[epdfview]
>>> ?= "BROKEN: images are not displayed anymore"
>>>
>>> meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gnome-mplayer]
>>> ?= "rdepends on blacklisted mplayer"
>>>
>>> meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb:PNBLACKLIST[gcalctool]
>>> ?= "broken at least since April 2013
>>> http://permalink.gmane.org/gmane.comp.handhelds.openembedded/57920 and
>>> nobody complained, it's also replaced by gnome calculator"
>>>
>>> meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLIST[gnome-keyring]
>>> ?= "This version conflicts with gcr from oe-core"
>>>
>>> meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb:PNBLACKLIST[gnome-menus3]
>>> ?= "CONFLICT: 24 files are conflicting with gnome-menus"
>>>
>>> meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnome-panel3]
>>> ?= "CONFLICT: depends on libgweather3 which conflicts with libgweather"
>>>
>>> meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb:PNBLACKLIST[gnome-power-manager]
>>> ?= "BROKEN: not compatible with current libnotify"
>>>
>>> meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgweather3]
>>> ?= "CONFLICT: 876 files are conflicting with libgweather"
>>>
>>> meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb:PNBLACKLIST[nautilus3]
>>> ?= "BROKEN: fails to build, maybe missing dependency on
>>> gnome-desktop-utils.h provider"
>>>
>>> meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb:PNBLACKLIST[system-tools-backends]
>>> ?= "does not build with distroless qemuarm as reported in 'State of bitbake
>>> world' thread, nobody volunteered to fix them"
>>> meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?=
>>> "BROKEN: doesn't build with B!=S"
>>> meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:PNBLACKLIST[xbmc] ?=
>>> "/usr/include/c++/ctime:70:11: error: '::gmtime' has not been declared"
>>>
>>> meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb:PNBLACKLIST[mkvtoolnix]
>>> ?= "BROKEN: Failx to build with gcc-5"
>>>
>>> meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:PNBLACKLIST[coriander]
>>> ?= "BROKEN: fails to use SDL probably because libsdl-config was removed,
>>> error: unknown type name 'SDL_Overlay'"
>>>
>>> meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb:PNBLACKLIST[renderer-service-upnp]
>>> ?= "BROKEN: doesn't build with B!=S (trying to install rendererconsole.py
>>> from ${B} instead of ${S})"
>>>
>>> meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb:PNBLACKLIST[gst123]
>>> ?= "gst123 is still "sometimes" using wrong sysroot"
>>>
>>> meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:PNBLACKLIST[lksctp-tools]
>>> ?= "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN: fails to link
>>> against sctp_connectx symbol", '', d)}"
>>> meta-networking/recipes-support/nis/yp-tools_3.3.bb:PNBLACKLIST[yp-tools]
>>> ?= "BROKEN: fails to build for qemuarm."
>>>
>>> meta-networking/recipes-support/nis/ypbind-mt_2.2.bb:PNBLACKLIST[ypbind-mt]
>>> ?= "BROKEN: Depends on broken yp-tools"
>>>
>>> meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNBLACKLIST[bluez-hcidump]
>>> ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
>>> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
>>> meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4] ?=
>>> "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
>>> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
>>>
>>> meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:PNBLACKLIST[gst-plugin-bluetooth]
>>> ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
>>> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
>>> meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb:PNBLACKLIST[obexftp]
>>> ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
>>> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
>>> meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?=
>>> "BROKEN: depends on broken libftdi"
>>>
>>> meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zeroc-ice]
>>> ?= "BROKEN: not compatible with default db version"
>>> meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb:PNBLACKLIST[cloud9] ?= "Not
>>> comatible with current nodejs 0.12, but upstream is working on it for v3"
>>>
>>> meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb:PNBLACKLIST[packagekit]
>>> ?= "BROKEN: depends on old deprecated libopkg which is currently disabled
>>> and will be removed soon"
>>> meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb:PNBLACKLIST[rsyslog] ?=
>>> "Not compatible with gnutls version 3.4 currently in oe-core"
>>>
>>> meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurface]
>>> ?= "Needs to be upgraded for compatibility with new libdivecomputer"
>>> meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb:PNBLACKLIST[gtkextra] ?=
>>> "BROKEN: Fails to build with gcc-5"
>>>
>>> meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-box2d]
>>> ?= "BROKEN: doesn't build with B!=S"
>>> meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?= "BROKEN:
>>> doesn't build with B!=S (flex: can't open lex.lex)"
>>> meta-oe/recipes-graphics/slim/slim_1.3.2.bb:PNBLACKLIST[slim] ?= "does
>>> not build with distroless qemuarm as reported in 'State of bitbake world'
>>> thread, nobody volunteered to fix them"
>>>
>>> meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[xf86-input-mtev]
>>> ?= "BROKEN: doesn't build with B!=S (Makefile without ${S} in sed call)"
>>>
>>> meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:PNBLACKLIST[xf86-video-geode]
>>> ?= "BROKEN, fails to build"
>>> meta-oe/recipes-kernel/ktap/ktap-module_git.bb:PNBLACKLIST[ktap-module]
>>> ?= "Not compatible with 3.19 kernel"
>>> meta-oe/recipes-kernel/ktap/ktap_git.bb:PNBLACKLIST[ktap] ?= "Depends on
>>> blacklisted kernel-module-ktapvm"
>>> meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb:PNBLACKLIST[mplayer2]
>>> ?= "BROKEN, fails to build with gcc-5"
>>>
>>> meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtrotgps]
>>> ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
>>> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
>>> meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb:PNBLACKLIST[gdal] ?=
>>> "BROKEN: fails to build with gcc-5"
>>> meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=
>>> "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
>>> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
>>> meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=
>>> "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
>>> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
>>>
>>> meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb:PNBLACKLIST[claws-mail]
>>> ?= "depends on blacklisted libetpan"
>>>
>>> meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb:PNBLACKLIST[claws-plugin-gtkhtml2-viewer]
>>> ?= "depends on blacklisted claws-mail"
>>>
>>> meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb:PNBLACKLIST[claws-plugin-mailmbox]
>>> ?= "depends on blacklisted claws-mail"
>>>
>>> meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb:PNBLACKLIST[claws-plugin-rssyl]
>>> ?= "depends on blacklisted claws-mail"
>>> meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd]
>>> ?= "BROKEN: doesn't build with B!=S"
>>> meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?= "qemu:
>>> uncaught target signal 11 (Segmentation fault) - core dumped"
>>> meta-oe/recipes-support/fftw/benchfft_3.1.bb:PNBLACKLIST[benchfft] ?=
>>> "does not build with distroless qemuarm as reported in 'State of bitbake
>>> world' thread, nobody volunteered to fix them"
>>> meta-oe/recipes-support/iksemel/iksemel_1.4.bb:PNBLACKLIST[iksemel] ?=
>>> "Not compatible with gnutls version 3.4 currently in oe-core"
>>>
>>> meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb:PNBLACKLIST[libdbi-drivers]
>>> ?= "BROKEN: fails to build with gcc-5"
>>> meta-oe/recipes-support/libetpan/libetpan_0.57.bb:PNBLACKLIST[libetpan]
>>> ?= "Not compatible with gnutls version 3.4 currently in oe-core"
>>> meta-oe/recipes-support/mongodb/mongodb_git.bb:PNBLACKLIST[mongodb] ?=
>>> "Fails to build with system boost"
>>>
>>> meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmotif]
>>> ?= "BROKEN: doesn't build with B!=S"
>>>
>>> meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml]
>>> ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
>>> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
>>>
>>> meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb:PNBLACKLIST[pidgin-otr]
>>> ?= "depends on blacklisted pidgin"
>>> meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb:PNBLACKLIST[pidgin] ?=
>>> "Not compatible with gnutls version 3.4 currently in oe-core"
>>>
>>> meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb:PNBLACKLIST[start-stop-daemon]
>>> ?= "BROKEN: fails because of gettext, partial fix is available here
>>> http://patchwork.openembedded.org/patch/89867/"
>>>
>>> meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala-terminal]
>>> ?= "BROKEN: Doesn't work with B!=S, touch: cannot touch `src/.stamp': No
>>> such file or directory"
>>> meta-qt5:
>>> meta-smartphone:
>>> meta-shr/recipes-shr/3rdparty/emtooth2_svn.bb:PNBLACKLIST[emtooth2] ?=
>>> "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
>>> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
>>> meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] =
>>> "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
>>> meta-shr/recipes-shr/3rdparty/gwaterpas_0.3.bb:PNBLACKLIST[gwaterpas] ?=
>>> "broken: depends on blacklisted fltk"
>>> meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] = "Doesn't
>>> build after vala upgrade from 0.24.0 to 0.26.1"
>>> meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] =
>>> "rdepends on blacklisted mplayer2"
>>> meta-shr/recipes-shr/3rdparty/jefliks_git.bb:PNBLACKLIST[jefliks] ?=
>>> "depends on blacklisted iksemel"
>>> meta-shr/recipes-shr/3rdparty/pisi_0.5.3.bb:PNBLACKLIST[pisi] ?=
>>> "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
>>> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
>>> meta-shr/recipes-shr/3rdparty/podboy_svn.bb:PNBLACKLIST[podboy] ?=
>>> "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
>>> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
>>> meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] =
>>> "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
>>> meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompass]
>>> = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
>>> meta-shr/recipes-shr/shr/shr-installer_git.bb:PNBLACKLIST[shr-installer]
>>> ?= "Depends on blacklisted packagekit"
>>> meta-webos-ports:
>>> conf/world_fixes.inc:PNBLACKLIST[android-system] = "depends on lxc from
>>> meta-virtualiazation which isn't included in my world builds"
>>> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't
>>> really need to be tested so much"
>>> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't
>>> really need to be tested so much"
>>> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't
>>> really need to be tested so much"
>>> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't
>>> really need to be tested so much"
>>> conf/world_fixes.inc:PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't
>>> really need to be tested so much"
>>> conf/world_fixes.inc:PNBLACKLIST[build-appliance-image] = "tries to
>>> include whole downloads directory in /home/builder/poky :/"
>>> conf/world_mask.inc:PNBLACKLIST[evince] = "fails to build"
>>> conf/world_mask.inc:PNBLACKLIST[epiphany] = "fails to build"
>>> conf/world_mask.inc:PNBLACKLIST[gnome-power-manager] = "fails to build"
>>> conf/world_mask.inc:PNBLACKLIST[gnome-bluetooth] = "fails to build"
>>> conf/world_mask.inc:PNBLACKLIST[media-ctl] = "fails to build"
>>> QA issues by type:
>>> count: 0        issue: already-stripped
>>>
>>>
>>> count: 6        issue: libdir
>>> qtbase-dbg: found library in wrong location:
>>> /usr/share/qt5/examples/widgets/tools/echoplugin/plugin/.debug/libechoplugin.so
>>> [libdir]
>>> qtdeclarative-dbg: found library in wrong location:
>>> /usr/share/qt5/examples/qml/qmlextensionplugins/imports/TimeExample/.debug/libqmlqtimeexampleplugin.so
>>> [libdir]
>>> qtdeclarative-dbg: found library in wrong location:
>>> /usr/share/qt5/examples/quick/customitems/painteditem/TextBalloonPlugin/.debug/libqmltextballoonplugin.so
>>> [libdir]
>>> qtmultimedia-5.5.99+5.6.0-alpha1+gitAUTOINC+ac1b772ec8: qtmultimedia-dbg:
>>> found library in wrong location:
>>> /usr/share/qt5/examples/multimedia/spectrum/.debug/libfftreal.so.1.0.0
>>> [libdir]
>>> qtquick1-dbg: found library in wrong location:
>>> /usr/share/qt5/examples/declarative/cppextensions/imageprovider/ImageProviderCore/.debug/libqmlimageproviderplugin.so
>>> [libdir]
>>> qtsensors-dbg: found library in wrong location:
>>> /usr/share/qt5/examples/sensors/grue/.debug/libgruesensor.so.1.0.0 [libdir]
>>>
>>>
>>> count: 15       issue: textrel
>>> corosync-2.3.5: ELF binary
>>> '/tmp/work/core2-64-oe-linux/corosync/2.3.5-r0/packages-split/corosync/usr/sbin/corosync'
>>> has relocations in .text [textrel]
>>> gstreamer1.0-libav-1.6.2: ELF binary
>>> '/tmp/work/i586-oe-linux/gstreamer1.0-libav/1.6.2-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so'
>>> has relocations in .text [textrel]
>>> libav-9.18: ELF binary
>>> '/tmp/work/armv5e-oe-linux-gnueabi/libav/9.18-r0/packages-split/libavcodec/usr/lib/libavcodec.so.54.35.0'
>>> has relocations in .text [textrel]
>>> libav-9.18: ELF binary
>>> '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-split/libavcodec/usr/lib/libavcodec.so.54.35.0'
>>> has relocations in .text [textrel]
>>> libav-9.18: ELF binary
>>> '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-split/libavdevice/usr/lib/libavdevice.so.53.2.0'
>>> has relocations in .text [textrel]
>>> libav-9.18: ELF binary
>>> '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-split/libavfilter/usr/lib/libavfilter.so.3.3.0'
>>> has relocations in .text [textrel]
>>> libav-9.18: ELF binary
>>> '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-split/libavformat/usr/lib/libavformat.so.54.20.4'
>>> has relocations in .text [textrel]
>>> libav-9.18: ELF binary
>>> '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-split/libavresample/usr/lib/libavresample.so.1.0.1'
>>> has relocations in .text [textrel]
>>> libav-9.18: ELF binary
>>> '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-split/libavutil/usr/lib/libavutil.so.52.3.0'
>>> has relocations in .text [textrel]
>>> libav-9.18: ELF binary
>>> '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-split/libswscale/usr/lib/libswscale.so.2.1.1'
>>> has relocations in .text [textrel]
>>> libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary
>>> '/tmp/work/armv5te-oe-linux-gnueabi/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc/usr/lib/libpostproc.so.52.3.0'
>>> has relocations in .text [textrel]
>>> libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary
>>> '/tmp/work/i586-oe-linux/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc/usr/lib/libpostproc.so.52.3.0'
>>> has relocations in .text [textrel]
>>> matchbox-keyboard-0.0+gitAUTOINC+217f1bfe14: ELF binary
>>> '/tmp/work/armv5te-oe-linux-gnueabi/matchbox-keyboard/0.0+gitAUTOINC+217f1bfe14-r4/packages-split/matchbox-keyboard/usr/bin/matchbox-keyboard'
>>> has relocations in .text [textrel]
>>> qtwebengine-5.5.99+5.6.0-alpha1+gitAUTOINC+64dc919d31_7e655fbb76: ELF
>>> binary
>>> '/tmp/work/i586-oe-linux/qtwebengine/5.5.99+5.6.0-alpha1+gitAUTOINC+64dc919d31_7e655fbb76-r0/packages-split/qtwebengine/usr/lib/libQt5WebEngineCore.so.5.6.0'
>>> has relocations in .text [textrel]
>>> webkit-efl-1.11.0: ELF binary
>>> '/tmp/work/i586-oe-linux/webkit-efl/1_1.11.0-r0/packages-split/webkit-efl/usr/lib/libjavascriptcore_efl.so.1.11.0'
>>> has relocations in .text [textrel]
>>>
>>>
>>> count: 5        issue: build-deps
>>> cups-2.0.4: cups rdepends on libsystemd, but it isn't a build dependency?
>>> [build-deps]
>>> dhcpcd-s libnewt.so()(64bit), but no providers found in its RDEPENDS
>>> [file-rdeps]
>>> chkconfig-1.3.58: /usr/sbin/ntsysv_chkconfig contained in package
>>> chkconfig requires libnewt.so, but no providers found in its RDEPENDS
>>> [file-rdeps]
>>> dvb-apps-1.1.1: /usr/bin/dvbdate_dvbdate contained in package dvbdate
>>> requires libucsi.so()(64bit), but no providers found in its RDEPENDS
>>> [file-rdeps]
>>> dvb-apps-1.1.1: /usr/bin/dvbdate_dvbdate contained in package dvbdate
>>> requires libucsi.so, but no providers found in its RDEPENDS [file-rdeps]
>>> dvb-apps-1.1.1: /usr/bin/dvbnet_dvbnet contained in package dvbnet
>>> requires libdvbapi.so()(64bit), but no providers found in its RDEPENDS
>>> [file-rdeps]
>>> dvb-apps-1.1.1: /usr/bin/dvbnet_dvbnet contained in package dvbnet
>>> requires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
>>> dvb-apps-1.1.1: /usr/bin/dvbscan_dvb-scan contained in package dvb-scan
>>> requires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
>>> dvb-apps-1.1.1: /usr/bin/dvbscan_dvb-scan contained in package dvb-scan
>>> requires libdvbsec.so()(64bit), but no providers found in its RDEPENDS
>>> [file-rdeps]
>>> dvb-apps-1.1.1: /usr/bin/dvbtraffic_dvbtraffic contained in package
>>> dvbtraffic requires libdvbapi.so()(64bit), but no providers found in its
>>> RDEPENDS [file-rdeps]
>>> dvb-apps-1.1.1: /usr/bin/dvbtraffic_dvbtraffic contained in package
>>> dvbtraffic requires libdvbapi.so, but no providers found in its RDEPENDS
>>> [file-rdeps]
>>> dvb-apps-1.1.1: /usr/bin/femon_dvb-femon contained in package dvb-femon
>>> requires libdvbapi.so()(64bit), but no providers found in its RDEPENDS
>>> [file-rdeps]
>>> dvb-apps-1.1.1: /usr/bin/femon_dvb-femon contained in package dvb-femon
>>> requires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
>>> dvb-apps-1.1.1: /usr/bin/gotox_dvb-apps contained in package dvb-apps
>>> requires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
>>> dvb-apps-1.1.1: /usr/bin/gotox_dvb-apps contained in package dvb-apps
>>> requires libdvbsec.so()(64bit), but no providers found in its RDEPENDS
>>> [file-rdeps]
>>> fakeroot-1.18.4: /usr/bin/fakeroot_fakeroot contained in package fakeroot
>>> requires /bin/bash, but no providers found in its RDEPENDS [file-rdeps]
>>> gnome-desktop-2.32.1: /usr/bin/gnome-about_gnome-desktop contained in
>>> package gnome-desktop requires /usr/bin/python, but no providers found in
>>> its RDEPENDS [file-rdeps]
>>> gupnp-0.20.12: /usr/bin/gupnp-binding-tool_gupnp-dev contained in package
>>> gupnp-dev requires /usr/bin/python, but no providers found in its RDEPENDS
>>> [file-rdeps]
>>> libbonobo-2.32.1: /usr/bin/bonobo-slay_libbonobo contained in package
>>> libbonobo requires /usr/bin/perl, but no providers found in its RDEPENDS
>>> [file-rdeps]
>>> libdrm-2.4.65: /usr/bin/amdgpu@underscore@test_libdrm-tests contained in
>>> package libdrm-tests requires libcunit.so.1, but no providers found in its
>>> RDEPENDS [file-rdeps]
>>> libmodule-build-perl-0.31:
>>> /usr/bin/config@underscore@data_libmodule-build-perl contained in package
>>> libmodule-build-perl requires
>>> /tmp/sysroots/x86_64-linux/usr/bin/perl-native/perl.real, but no providers
>>> found in its RDEPENDS [file-rdeps]
>>> libnewt-0.52.18: /usr/bin/whiptail_whiptail contained in package whiptail
>>> requires libnewt.so()(64bit), but no providers found in its RDEPENDS
>>> [file-rdeps]
>>> libnewt-0.52.18: /usr/bin/whiptail_whiptail contained in package whiptail
>>> requires libnewt.so, but no providers found in its RDEPENDS [file-rdeps]
>>> libnewt-python-0.52.18:
>>> /usr/lib/python2.7/site-packages/@underscore@snack.so_libnewt-python
>>> contained in package libnewt-python requires libnewt.so()(64bit), but no
>>> providers found in its RDEPENDS [filr-1.0.6:
>>> /usr/bin/nmtui-connect_networkmanager-nmtui contained in package
>>> networkmanager-nmtui requires libnewt.so, but no providers found in its
>>> RDEPENDS [file-rdeps]
>>> numptyphysics-0.2+svnr109:
>>> /usr/share/numptyphysics/convert.pl_numptyphysics contained in package
>>> numptyphysics requires /usr/bin/perl, but no providers found in its RDEPENDS
>>> [file-rdeps]
>>> numptyphysics-0.2+svnr109:
>>> /usr/share/numptyphysics/convert@underscore@all.sh_numptyphysics contained
>>> in package numptyphysics requires /bin/bash, but no providers found in its
>>> RDEPENDS [file-rdeps]
>>> tracker-0.14.2:
>>> /usr/lib/nautilus/extensions-2.0/libnautilus-tracker-tags.so_tracker-nautilus-extension
>>> contained in package tracker-nautilus-extension requires
>>> libnautilus-extension.so.1()(64bit), but no providers found in its RDEPENDS
>>> [file-rdeps]
>>> tracker-0.14.2:
>>> /usr/lib/nautilus/extensions-2.0/libnautilus-tracker-tags.so_tracker-nautilus-extension
>>> contained in package tracker-nautilus-extension requires
>>> libnautilus-extension.so.1, but no providers found in its RDEPENDS
>>> [file-rdeps]
>>> ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: /usr/bin/memory-map.sh_ubx-utils
>>> contained in package ubx-utils requires /bin/bash, but no providers found in
>>> its RDEPENDS [file-rdeps]
>>> xfce4-clipman-plugin-1.2.6: /usr/bin/xfce4-clipman_xfce4-clipman-plugin
>>> contained in package xfce4-clipman-plugin requires libqrencode.so.3, but no
>>> providers found in its RDEPENDS [file-rdeps]
>>>
>>>
>>> count: 47604    issue: version-going-backwards
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>

