Return-Path: <akuster808@gmail.com>
Received: from mail-qg0-f65.google.com (mail-qg0-f65.google.com
	[209.85.192.65])
	by mail.openembedded.org (Postfix) with ESMTP id 102DF731D8;
	Mon, 16 May 2016 16:03:15 +0000 (UTC)
Received: by mail-qg0-f65.google.com with SMTP id e35so14022453qge.1;
	Mon, 16 May 2016 09:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=Bg+p5TzmX5NV2zKc4uufDTsIGQZBOD3DPbHSYUySqZg=;
	b=S6XKDgS4fijxuKrZRMFVsaWFDuqe1z9avp05UuPvbAyzPG/f3zdCYvPL8DldK9NpKb
	H/MwoFd6CvzD9TdBb3W4cEo+Mxq5gct5gkU9YoDQGH2xa3jfenZ0astOUO/u9vyWqo+T
	wAVcvvXO+EQHRfAyeSBu68SJNAhEk5ZDqyYrlGlWO6vWwb/Bp1ZMVF3NuVceM/foGQg1
	B5iHvOFLi4XbWrxZJODpQFchd000E7hMlJvQKZIIMkfuZdtITUhcyOXUBhuz5WlgeGYF
	pB5D1+Q1yczR2vz6ZQeZEVK4YPdAknF0vtrFGjOcBxkfCVPYJlckan/H7cNQeIm5IWuw
	mr6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Bg+p5TzmX5NV2zKc4uufDTsIGQZBOD3DPbHSYUySqZg=;
	b=Su+6iOwCbF4rqJptnm8cd2fx9ep/FoarKfe3Eq9o8mdNv69psyJg6kGJ0QQCmGQcFE
	N+82J8U1MruGzcd2Kf2w27NvtrEyBeB+m/XXJ2U+0pBPVXlahziXMzZtchrlq847QEQ9
	1ToDwPogvatPDHo+Kx8IHkAx3Yrj0xEXPr7rQn18MxdVR84UAxBJtwMsBLc/KBROPDgy
	cIX12yDa9jFKj+/tpwTjXGBTcFk6rXBMHt0KcfYghnvaCybksQk4FTi5UPOvm1G8/rjh
	p3wrb5MNIKFnYS9wzNA1HkllkSPqR3/LeZ5Ggj3X9rI+67B4d6jj/OZuthBm+l0LpMdE
	Gsrg==
X-Gm-Message-State: AOPr4FW4N7OiobjKQb/a9/WpwR8QdqIZ+Gs+o4rFmkd2szkQtbCzfoUQVlB0k1snK48GLg==
X-Received: by 10.140.252.10 with SMTP id x10mr31425633qhc.81.1463414595439;
	Mon, 16 May 2016 09:03:15 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:213a:5f79:bc19:2f7c?
	([2601:202:4000:1239:213a:5f79:bc19:2f7c])
	by smtp.googlemail.com with ESMTPSA id
	b6sm15164146qkh.12.2016.05.16.09.03.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2016 09:03:14 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
References: <20160513203108.GC2565@jama>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5739EF38.8010006@gmail.com>
Date: Mon, 16 May 2016 09:03:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20160513203108.GC2565@jama>
Subject: Re: State of bitbake world 2016-05-12
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
X-List-Received-Date: Mon, 16 May 2016 16:03:18 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 05/13/2016 01:31 PM, Martin Jansa wrote:
> This time complete QA issues list
> 
> == Number of issues - stats ==
> {| class='wikitable'
> !|Date		     !!colspan='3'|Failed tasks			    !!colspan='6'|Failed depencencies			 !!|Signatures		  !!colspan='12'|QA !!Comment
> |-
> ||		||qemuarm	||qemux86	||qemux86_64	||qemuarm||max||min	||qemux86||max||min	||all 	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	||	
> |-
> ||2016-05-12	||2	||3	||3	||17	||6	||6	||19	||5	||6	||0	||0		||0		||3		||2		||29		||24		||1		||0		||0		||0		||0		||0		||	
> |}
> 
> http://www.openembedded.org/wiki/Bitbake_World_Status
> 
> == Failed tasks 2016-05-12 ==
> 
> INFO: jenkins-job.sh-1.8.4 Complete log available at http://logs.nslu2-linux.org/buildlogs/oe/world/log.report.20160513_101447.log
> 
> === common (2) ===
>     * /meta-openembedded/meta-python/recipes-devtools/python/python-cryptography_1.1.bb, do_compile

sent a fix for this

- armin

>     * /meta-webos-ports/meta-luneui/recipes-luneui/luna-next/luna-next.bb, do_compile
> 
> === common-x86 (0) ===
> 
> === qemuarm (0) ===
> 
> === qemux86 (1) ===
>     * /meta-openembedded/meta-networking/recipes-connectivity/lftp/lftp_4.6.3a.bb, do_compile
> 
> === qemux86_64 (1) ===
>     * /openembedded-core/meta/recipes-core/meta/meta-ide-support.bb, do_package_write_ipk
> 
> === Number of failed tasks (8) ===
> {| class=wikitable
> |-
> || qemuarm 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.qemuarm.20160511_004639.log// || http://errors.yoctoproject.org:80/Errors/Build/15676/
> |-
> || qemux86 	|| 3	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.qemux86.20160511_004537.log// || http://errors.yoctoproject.org:80/Errors/Build/15687/
> |-
> || qemux86_64 	|| 3	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.qemux86-64.20160512_040242.log// || http://errors.yoctoproject.org:80/Errors/Build/15732/
> |}
> 
> === PNBLACKLISTs (91) ===
> 
> === QA issues (59) ===
> {| class=wikitable
> !| Count		||Issue
> |-
> ||0	||already-stripped
> |-
> ||0	||installed-vs-shipped
> |-
> ||0	||invalid-pkgconfig
> |-
> ||0	||libdir
> |-
> ||0	||pkgname
> |-
> ||0	||symlink-to-sysroot
> |-
> ||0	||unknown-configure-option
> |-
> ||1	||host-user-contaminated
> |-
> ||24	||version-going-backwards
> |-
> ||29	||file-rdeps
> |-
> ||2	||build-deps
> |-
> ||3	||textrel
> |}
> 
> 
> 
> === Failed dependencies for qemuarm (17) ===
> 
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20160512_002359.log/
> Found differences: 
> WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
> WARN: libdrm: libdrm-tests rdepends on cunit, but it isn't a build dependency?
> WARN: libdrm: libdrm-tests rdepends on libdrm-amdgpu, but it isn't a build dependency?
> WARN: enchant: enchant rdepends on hunspell, but it isn't a build dependency?
> Found errors: 
> ERROR: 17 issues were found in these recipes: chkconfig-alternatives-native enchant gtkmathview libdrm luna-next meta-world-pkgdata netmap proxy-libintl python-cryptography samba
> 
> === Recipes failing with maximal dependencies for qemuarm (6) ===
> chkconfig-alternatives-native -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20160512_002359.log//2_max/failed/chkconfig-alternatives-native.log
> luna-next -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20160512_002359.log//2_max/failed/luna-next.log
> meta-world-pkgdata -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20160512_002359.log//2_max/failed/meta-world-pkgdata.log
> netmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20160512_002359.log//2_max/failed/netmap.log
> proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20160512_002359.log//2_max/failed/proxy-libintl.log
> python-cryptography -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20160512_002359.log//2_max/failed/python-cryptography.log
> 
> === Recipes failing with minimal dependencies for qemuarm (6) ===
> gtkmathview -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20160512_002359.log//3_min/failed/gtkmathview.log
> luna-next -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20160512_002359.log//3_min/failed/luna-next.log
> meta-world-pkgdata -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20160512_002359.log//3_min/failed/meta-world-pkgdata.log
> netmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20160512_002359.log//3_min/failed/netmap.log
> proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20160512_002359.log//3_min/failed/proxy-libintl.log
> python-cryptography -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20160512_002359.log//3_min/failed/python-cryptography.log
> 
> === Failed dependencies for qemux86 (19) ===
> 
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20160513_041548.log/
> Found differences: 
> WARN: jasper: jasper-bin rdepends on libgl-mesa, but it isn't a build dependency?
> WARN: jasper: jasper-bin rdepends on libglu, but it isn't a build dependency?
> WARN: jasper: jasper-bin rdepends on mesa-glut, but it isn't a build dependency?
> WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
> WARN: libdrm: libdrm-tests rdepends on cunit, but it isn't a build dependency?
> WARN: libdrm: libdrm-tests rdepends on libdrm-amdgpu, but it isn't a build dependency?
> WARN: enchant: enchant rdepends on hunspell, but it isn't a build dependency?
> Found errors: 
> ERROR: 19 issues were found in these recipes: chkconfig-alternatives-native enchant gtkmathview jasper libdrm luna-next netmap perf proxy-libintl python-cryptography samba
> 
> === Recipes failing with maximal dependencies for qemux86 (5) ===
> chkconfig-alternatives-native -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20160513_041548.log//2_max/failed/chkconfig-alternatives-native.log
> luna-next -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20160513_041548.log//2_max/failed/luna-next.log
> netmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20160513_041548.log//2_max/failed/netmap.log
> proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20160513_041548.log//2_max/failed/proxy-libintl.log
> python-cryptography -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20160513_041548.log//2_max/failed/python-cryptography.log
> 
> === Recipes failing with minimal dependencies for qemux86 (6) ===
> gtkmathview -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20160513_041548.log//3_min/failed/gtkmathview.log
> luna-next -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20160513_041548.log//3_min/failed/luna-next.log
> netmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20160513_041548.log//3_min/failed/netmap.log
> perf -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20160513_041548.log//3_min/failed/perf.log
> proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20160513_041548.log//3_min/failed/proxy-libintl.log
> python-cryptography -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20160513_041548.log//3_min/failed/python-cryptography.log
> 
> === Incorrect PACKAGE_ARCH or sstate signatures (0) ===
> 
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatures.20160512_062345.log/
> 
> No issues detected
> 
> 
> PNBLACKLISTs:
> openembedded-core/:
> meta-browser:
> meta-openembedded:
> meta-efl/recipes-efl/e17/diskio_svn.bb:PNBLACKLIST[diskio] ?= "broken: switch to https://git.enlightenment.org/enlightenment/modules/diskio.git/ and fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58. invalid state name: 'off'. "default" state must always be first."
> meta-efl/recipes-efl/e17/elbow_git.bb:PNBLACKLIST[elbow] ?= "Depends on blacklisted webkit-efl"
> meta-efl/recipes-efl/e17/elmdentica_svn.bb:PNBLACKLIST[elmdentica] ?= "OLD and depends on broken azy"
> meta-efl/recipes-efl/e17/emprint_svn.bb:PNBLACKLIST[emprint] ?= "if you want to use these modules with E18, then you need to update it to git recipe fetching newer sources from http://git.enlightenment.org/apps/emprint.git/"
> meta-efl/recipes-efl/e17/news_svn.bb:PNBLACKLIST[news] ?= "if you want to use these modules with E18, then you need to update it to git recipe fetching newer sources from http://git.enlightenment.org/enlightenment/modules/news.git/"
> meta-efl/recipes-efl/e17/rage_svn.bb:PNBLACKLIST[rage] ?= "if you want to use these modules with E18, then you need to update it to git recipe fetching newer sources from  http://git.enlightenment.org/apps/rage.git/"
> meta-efl/recipes-efl/e17/screenshot_svn.bb:PNBLACKLIST[screenshot] ?= "depends on blacklisted emprint"
> meta-efl/recipes-efl/efl/azy_svn.bb:PNBLACKLIST[azy] ?= "OLD and doesn't build with gcc-5"
> meta-efl/recipes-efl/efl/engrave_svn.bb:PNBLACKLIST[engrave] ?= "BROKEN: fails to build with latest oe-core"
> meta-efl/recipes-efl/efl/entrance_svn.bb:PNBLACKLIST[entrance] ?= "broken: switch to https://git.enlightenment.org/misc/entrance.git and fix 0.0.4+svnr82070-r7/entrance/data/themes/old/default.edc:678. invalid state name: 'defaault'. "default" state must always be first."
> meta-efl/recipes-efl/webkit/webkit-efl.inc:PNBLACKLIST[webkit-efl] ?= "Old and unmaintaned fork with many security issues"
> meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb:PNBLACKLIST[mcnavi] ?= "BROKEN: latest version 0.3.4 is 3 years old and now broken with more strict ejde_cc from efl-1.13"
> meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb:PNBLACKLIST[epdfview] ?= "BROKEN: images are not displayed anymore"
> meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gnome-mplayer] ?= "rdepends on blacklisted mplayer"
> meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb:PNBLACKLIST[gtk-theme-torturer] ?= "BROKEN: gmacros.h:182:53: error: size of array '_GStaticAssertCompileTimeAssertion_2' is negative"
> meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb:PNBLACKLIST[gcalctool] ?= "broken at least since April 2013 http://permalink.gmane.org/gmane.comp.handhelds.openembedded/57920 and nobody complained, it's also replaced by gnome calculator"
> meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLIST[gnome-keyring] ?= "This version conflicts with gcr from oe-core"
> meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb:PNBLACKLIST[gnome-menus3] ?= "CONFLICT: 24 files are conflicting with gnome-menus"
> meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnome-panel3] ?= "CONFLICT: depends on libgweather3 which conflicts with libgweather"
> meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb:PNBLACKLIST[gnome-power-manager] ?= "BROKEN: not compatible with current libnotify"
> meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgweather3] ?= "CONFLICT: 876 files are conflicting with libgweather"
> meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb:PNBLACKLIST[nautilus3] ?= "BROKEN: fails to build, maybe missing dependency on gnome-desktop-utils.h provider"
> meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb:PNBLACKLIST[system-tools-backends] ?= "does not build with distroless qemuarm as reported in 'State of bitbake world' thread, nobody volunteered to fix them"
> meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?= "BROKEN: doesn't build with B!=S"
> meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:PNBLACKLIST[xbmc] ?= "/usr/include/c++/ctime:70:11: error: '::gmtime' has not been declared"
> meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb:PNBLACKLIST[mkvtoolnix] ?= "BROKEN: Failx to build with gcc-5"
> meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:PNBLACKLIST[coriander] ?= "BROKEN: fails to use SDL probably because libsdl-config was removed, error: unknown type name 'SDL_Overlay'"
> meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb:PNBLACKLIST[renderer-service-upnp] ?= "BROKEN: doesn't build with B!=S (trying to install rendererconsole.py from ${B} instead of ${S})"
> meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg_0.10.13.bb:PNBLACKLIST[gst-ffmpeg] ?= "Not compatible with currently used ffmpeg 3"
> meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb:PNBLACKLIST[gst123] ?= "gst123 is still "sometimes" using wrong sysroot"
> meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb:PNBLACKLIST[snort] ?= "BROKEN: QA Issue: snort_preproc.pc, snort_output.pc, snort.pc"
> meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb:PNBLACKLIST[dnrd] ?= "BROKEN: dnrd-2.20.3-r0 do_package: QA Issue: dnrd: Files/directories were installed but not shipped in any package:"
> meta-networking/recipes-daemons/squid/squid_3.5.7.bb:PNBLACKLIST[squid] ?= "BROKEN: sysroots/qemuarm/usr/include/linux/in.h:28:16: error: redeclaration of 'IPPROTO_IP'"
> meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:PNBLACKLIST[lksctp-tools] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
> meta-networking/recipes-support/nis/yp-tools_3.3.bb:PNBLACKLIST[yp-tools] ?= "BROKEN: fails to build for qemuarm."
> meta-networking/recipes-support/nis/ypbind-mt_2.2.bb:PNBLACKLIST[ypbind-mt] ?= "BROKEN: Depends on broken yp-tools"
> meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNBLACKLIST[bluez-hcidump] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:PNBLACKLIST[gst-plugin-bluetooth] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb:PNBLACKLIST[obexftp] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?= "BROKEN: depends on broken libftdi"
> meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zeroc-ice] ?= "BROKEN: not compatible with default db version"
> meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb:PNBLACKLIST[fakeroot] ?= "BROKEN: QA Issue: -dev package contains non-symlink .so"
> meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb:PNBLACKLIST[cloud9] ?= "Not comatible with current nodejs 0.12, but upstream is working on it for v3"
> meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb:PNBLACKLIST[ltp-ddt] ?= "BROKEN: fails since last autotools.bbclass changes"
> meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb:PNBLACKLIST[mpich] ?= "BROKEN: QA Issue: libmpi.la failed sanity test (workdir), QA Issue: mpich.pc failed sanity test (tmpdir)"
> meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb:PNBLACKLIST[packagekit] ?= "BROKEN: depends on old deprecated libopkg which is currently disabled and will be removed soon"
> meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurface] ?= "Needs to be upgraded for compatibility with new libdivecomputer"
> meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb:PNBLACKLIST[gtkextra] ?= "BROKEN: Fails to build with gcc-5"
> meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-box2d] ?= "BROKEN: doesn't build with B!=S"
> meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?= "BROKEN: doesn't build with B!=S (flex: can't open lex.lex)"
> meta-oe/recipes-graphics/slim/slim_1.3.2.bb:PNBLACKLIST[slim] ?= "does not build with distroless qemuarm as reported in 'State of bitbake world' thread, nobody volunteered to fix them"
> meta-oe/recipes-graphics/tesseract/tesseract_3.02.02.bb:PNBLACKLIST[tesseract] ?= "BROKEN: QA Issue: tesseract.pc failed sanity test (tmpdir)"
> meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[xf86-input-mtev] ?= "BROKEN: doesn't build with B!=S (Makefile without ${S} in sed call)"
> meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:PNBLACKLIST[xf86-video-geode] ?= "BROKEN, fails to build"
> meta-oe/recipes-kernel/ktap/ktap-module_git.bb:PNBLACKLIST[ktap-module] ?= "Not compatible with 3.19 kernel"
> meta-oe/recipes-kernel/ktap/ktap_git.bb:PNBLACKLIST[ktap] ?= "Depends on blacklisted kernel-module-ktapvm"
> meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb:PNBLACKLIST[mplayer2] ?= "Not compatible with currently used ffmpeg 3"
> meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtrotgps] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb:PNBLACKLIST[gdal] ?= "BROKEN: fails to build with gcc-5"
> meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb:PNBLACKLIST[claws-mail] ?= "depends on blacklisted libetpan"
> meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb:PNBLACKLIST[claws-plugin-gtkhtml2-viewer] ?= "depends on blacklisted claws-mail"
> meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb:PNBLACKLIST[claws-plugin-mailmbox] ?= "depends on blacklisted claws-mail"
> meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb:PNBLACKLIST[claws-plugin-rssyl] ?= "depends on blacklisted claws-mail"
> meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd] ?= "BROKEN: doesn't build with B!=S"
> meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?= "qemu: uncaught target signal 11 (Segmentation fault) - core dumped"
> meta-oe/recipes-support/fftw/benchfft_3.1.bb:PNBLACKLIST[benchfft] ?= "does not build with distroless qemuarm as reported in 'State of bitbake world' thread, nobody volunteered to fix them"
> meta-oe/recipes-support/iksemel/iksemel_1.4.bb:PNBLACKLIST[iksemel] ?= "Not compatible with gnutls version 3.4 currently in oe-core"
> meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb:PNBLACKLIST[libdbi-drivers] ?= "BROKEN: fails to build with gcc-5"
> meta-oe/recipes-support/libetpan/libetpan_0.57.bb:PNBLACKLIST[libetpan] ?= "Not compatible with gnutls version 3.4 currently in oe-core"
> meta-oe/recipes-support/opencv/opencv-samples_2.4.bb:PNBLACKLIST[opencv-samples] ?= "Depends on blacklisted opencv"
> meta-oe/recipes-support/opencv/opencv_2.4.bb:PNBLACKLIST[opencv] ?= "Not compatible with currently used ffmpeg 3"
> meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmotif] ?= "BROKEN: doesn't build with B!=S"
> meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb:PNBLACKLIST[pidgin-otr] ?= "depends on blacklisted pidgin"
> meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala-terminal] ?= "BROKEN: Doesn't work with B!=S, touch: cannot touch `src/.stamp': No such file or directory"
> meta-qt5:
> meta-smartphone:
> meta-shr/recipes-shr/3rdparty/advancedcaching_git.bb:PNBLACKLIST[advancedcaching] ?= "RDEPENDS on python-pygtk was removed from oe-core"
> meta-shr/recipes-shr/3rdparty/emtooth2_svn.bb:PNBLACKLIST[emtooth2] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/gwaterpas_0.3.bb:PNBLACKLIST[gwaterpas] ?= "broken: depends on blacklisted fltk"
> meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] = "rdepends on blacklisted mplayer2"
> meta-shr/recipes-shr/3rdparty/jefliks_git.bb:PNBLACKLIST[jefliks] ?= "depends on blacklisted iksemel"
> meta-shr/recipes-shr/3rdparty/openmoko-gps_svn.bb:PNBLACKLIST[openmoko-gps] ?= "RDEPENDS on python-pygtk which was removed from oe-core"
> meta-shr/recipes-shr/3rdparty/pisi_0.5.3.bb:PNBLACKLIST[pisi] ?= "RDEPENDS on python-pygtk which was removed from oe-core"
> meta-shr/recipes-shr/3rdparty/podboy_svn.bb:PNBLACKLIST[podboy] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompass] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/shr/shr-installer_git.bb:PNBLACKLIST[shr-installer] ?= "Depends on blacklisted packagekit"
> meta-webos-ports:
> PNBLACKLIST[android-system] = "depends on lxc from meta-virtualiazation which isn't included in my world builds"
> PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be tested so much"
> PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be tested so much"
> PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested so much"
> PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested so much"
> PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be tested so much"
> PNBLACKLIST[build-appliance-image] = "tries to include whole downloads directory in /home/builder/poky :/"
> PNBLACKLIST[linux-yocto-tiny-kexecboot] = "does weird sh!t breaking other kernels and modules - broken for years"
> PNBLACKLIST[linux-yocto-tiny] = "does weird sh!t breaking other kernels and modules - broken for years"
> 
> 
> QA issues by type:
> count: 0	issue: already-stripped
> 
> 
> count: 0	issue: libdir
> 
> 
> count: 3	issue: textrel
> cef3-280796: ELF binary '/tmp/work/i586-oe-linux/cef3/280796-r0/packages-split/cef3-codecs-ffmpeg/usr/lib/cef3/libffmpegsumo.so' has relocations in .text [textrel]
> chromium-48.0.2548.0: ELF binary '/tmp/work/i586-oe-linux/chromium/48.0.2548.0-r0/packages-split/chromium/usr/bin/chromium/chrome' has relocations in .text [textrel]
> corosync-2.3.5: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.3.5-r0/packages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]
> 
> 
> count: 2	issue: build-deps
> qtwayland-5.6.99+5.7.0-beta+gitAUTOINC+d27075a3f9: qtwayland-plugins rdepends on libxcomposite, but it isn't a build dependency, missing libxcomposite in DEPENDS or PACKAGECONFIG? [build-deps]
> samba-4.4.2: samba rdepends on libpam, but it isn't a build dependency, missing libpam in DEPENDS or PACKAGECONFIG? [build-deps]
> 
> 
> count: 29	issue: file-rdeps
> chkconfig-1.3.58: /usr/sbin/ntsysv contained in package chkconfig requires libnewt.so()(64bit), but no providers found in RDEPENDS_chkconfig? [file-rdeps]
> chkconfig-1.3.58: /usr/sbin/ntsysv contained in package chkconfig requires libnewt.so, but no providers found in RDEPENDS_chkconfig? [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/dvbdate contained in package dvbdate requires libucsi.so()(64bit), but no providers found in RDEPENDS_dvbdate? [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/dvbdate contained in package dvbdate requires libucsi.so, but no providers found in RDEPENDS_dvbdate? [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/dvbnet contained in package dvbnet requires libdvbapi.soraffic contained in package dvbtraffic requires libdvbapi.so, but no providers found in RDEPENDS_dvbtraffic? [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/femon contained in package dvb-femon requires libdvbapi.so()(64bit), but no providers found in RDEPENDS_dvb-femon? [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/femon contained in package dvb-femon requires libdvbapi.so, but no providers found in RDEPENDS_dvb-femon? [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/gotox contained in package dvb-apps requires libdvbapi.so, but no providers found in RDEPENDS_dvb-apps? [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/gotox contained in package dvb-apps requires libdvbsec.so()(64bit), but no providers found in RDEPENDS_dvb-apps? [file-rdeps]
> gnome-menus-2.30.5: /usr/bin/gmenu-simple-editor contained in package gnome-menus requires /tmp/sysroots/x86_64-linux/usr/bin/python-native/python, but no providers found in RDEPENDS_gnome-menus? [file-rdeps]
> libmodule-build-perl-0.31: /usr/bin/config_data contained in package libmodule-build-perl requires /tmp/sysroots/x86_64-linux/usr/bin/perl-native/perl.real, but no providers found in RDEPENDS_libmodule-build-perl? [file-rdeps]
> libnewt-0.52.18: /usr/bin/whiptail contained in package whiptail requires libnewt.so()(64bit), but no providers found in RDEPENDS_whiptail? [file-rdeps]
> libnewt-0.52.18: /usr/bin/whiptail contained in package whiptail requires libnewt.so, but no providers found in RDEPENDS_whiptail? [file-rdeps]
> libnewt-python-0.52.18: /usr/lib/python2.7/site-packages/_snack.so contained in package libnewt-python requires libnewt.so()(64bit), but no providers found in RDEPENDS_libnewt-python? [file-rdeps]
> libnewt-python-0.52.18: /usr/lib/python2.7/site-packages/_snack.so contained in package libnewt-python requires libnewt.so, but no providers found in RDEPENDS_libnewt-python? [file-rdeps]
> networkmanager-1.0.10: /usr/bin/nmtui-connect contained in package networkmanager-nmtui requires libnewt.so()(64bit), but no providers found in RDEPENDS_networkmanager-nmtui? [file-rdeps]
> networkmanager-1.0.10: /usr/bin/nmtui-connect contained in package networkmanager-nmtui requires libnewt.so, but no providers found in RDEPENDS_networkmanager-nmtui? [file-rdeps]
> numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert_all.sh contained in package numptyphysics requires /bin/bash, but no providers found in RDEPENDS_numptyphysics? [file-rdeps]
> numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert.pl contained in package numptyphysics requires /usr/bin/perl, but no providers found in RDEPENDS_numptyphysics? [file-rdeps]
> ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: /usr/bin/memory-map.sh contained in package ubx-utils requires /bin/bash, but no providers found in RDEPENDS_ubx-utils? [file-rdeps]
> xfsprogs-3.2.3: /sbin/mkfs.xfs contained in package xfsprogs-mkfs requires libxfs.so.0()(64bit), but no providers found in RDEPENDS_xfsprogs-mkfs? [file-rdeps]
> xfsprogs-3.2.3: /sbin/mkfs.xfs contained in package xfsprogs-mkfs requires libxfs.so.0, but no providers found in RDEPENDS_xfsprogs-mkfs? [file-rdeps]
> xfsprogs-3.2.3: /usr/sbin/xfs_db contained in package xfsprogs requires libxfs.so.0()(64bit), but no providers found in RDEPENDS_xfsprogs? [file-rdeps]
> xfsprogs-3.2.3: /usr/sbin/xfs_db contained in package xfsprogs requires libxfs.so.0, but no providers found in RDEPENDS_xfsprogs? [file-rdeps]
> 
> 
> count: 24	issue: version-going-backwards
> efibootmgr-0.12: Package version for package efibootmgr-dbg went backwards which would break package feeds from (0:0.12-r0.1 to 0:0.12-r0.0) [version-going-backwards]
> efibootmgr-0.12: Package ver-r0.0) [version-going-backwards]
> efibootmgr-0.12: Package version for package efibootmgr went backwards which would break package feeds from (0:0.12-r0.1 to 0:0.12-r0.0) [version-going-backwards]
> efibootmgr-0.12: Package version for package efibootmgr went backwards which would break package feeds from (0:0.12-r0.4 to 0:0.12-r0.0) [version-going-backwards]
> znc-1.6.0: Package version for package znc-dbg went backwards which would break package feeds from (0:1.6.0-r0.11 to 0:1.6.0-r0.1) [version-going-backwards]
> znc-1.6.0: Package version for package znc-dbg went backwards which would break package feeds from (0:1.6.0-r0.9 to 0:1.6.0-r0.0) [version-going-backwards]
> znc-1.6.0: Package version for package znc-dev went backwards which would break package feeds from (0:1.6.0-r0.11 to 0:1.6.0-r0.1) [version-going-backwards]
> znc-1.6.0: Package version for package znc-dev went backwards which would break package feeds from (0:1.6.0-r0.9 to 0:1.6.0-r0.0) [version-going-backwards]
> znc-1.6.0: Package version for package znc-doc went backwards which would break package feeds from (0:1.6.0-r0.11 to 0:1.6.0-r0.1) [version-going-backwards]
> znc-1.6.0: Package version for package znc-doc went backwards which would break package feeds from (0:1.6.0-r0.9 to 0:1.6.0-r0.0) [version-going-backwards]
> znc-1.6.0: Package version for package znc-locale went backwards which would break package feeds from (0:1.6.0-r0.11 to 0:1.6.0-r0.1) [version-going-backwards]
> znc-1.6.0: Package version for package znc-locale went backwards which would break package feeds from (0:1.6.0-r0.9 to 0:1.6.0-r0.0) [version-going-backwards]
> znc-1.6.0: Package version for package znc-staticdev went backwards which would break package feeds from (0:1.6.0-r0.11 to 0:1.6.0-r0.1) [version-going-backwards]
> znc-1.6.0: Package version for package znc-staticdev went backwards which would break package feeds from (0:1.6.0-r0.9 to 0:1.6.0-r0.0) [version-going-backwards]
> znc-1.6.0: Package version for package znc went backwards which would break package feeds from (0:1.6.0-r0.11 to 0:1.6.0-r0.1) [version-going-backwards]
> znc-1.6.0: Package version for package znc went backwards which would break package feeds from (0:1.6.0-r0.9 to 0:1.6.0-r0.0) [version-going-backwards]
> 
> 
> count: 1	issue: host-user-contaminated
> glibc-locale-2.23: glibc-locale: /glibc-binary-localedata-ar-eg/usr/lib/locale/ar_EG/LC_COLLATE is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> 
> 
> count: 0	issue: installed-vs-shipped
> 
> 
> count: 0	issue: unknown-configure-option
> 
> 
> count: 0	issue: symlink-to-sysroot
> 
> 
> count: 0	issue: invalid-pkgconfig
> 
> 
> count: 0	issue: pkgname
> 
> 
> 
> == Tested changes (not included in master yet) - bitbake ==
> 1ee841e world-image: add extra target
> 
> == Tested changes (not included in master yet) - openembedded-core ==
> e2b08f9 core-image-{minimal,testmaster}-initramfs: set COMPATIBLE_HOST
> ab40501 linux-yocto-rt, core-image-rt*: Explicitly skip when PREFERRED_PROVIDER_virtual/kernel isn't set to linux-yocto-rt
> 0cdd9b2 metadata-revs: provide more information
> 5634928 buildhistory.bbclass: metadata-revs show repo parent
> 5c40c8b recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=mode,links"
> 658166d sstate-sysroot-cruft.sh: Extend the whitelist
> 4ae7434 qemux86: Add identical qemux86copy variant for tests
> 81be3b0 report-error: Allow to upload reports automatically
> 
> == Tested changes (not included in master yet) - meta-openembedded ==
> 368b622 nbd: fix LIC_FILES_CHKSUM
> 9bcd6c7 libhugetlbfs: enable build for x86-32
> asted changes (not included in master yet) - meta-smartphone ==
> 62d8eb3 linux-gta04: include linux-dtb
> 2d312a0 shr: add wayland to DISTRO_FEATURES
> 56f69af linux-gta04: upgrade to 4.4
> f68a25e om-gta04: drop u-boot from EXTRA_IMAGEDEPENDS
> 9086db3 defaulttunes.inc: switch to hf, because SGX SDK for SGX530 is available only for hf
> 46f572e linux-gta04: enable SGX530
> 81f156d linux-gta04: bump SRCREV to get fixes for build with gcc-5
> 9d5058a u-boot-mkimage: Backport fix from upstream to fix build with gcc-5
> 
> 
> 

