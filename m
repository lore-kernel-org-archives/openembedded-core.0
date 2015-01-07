Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 529B97289F;
	Wed,  7 Jan 2015 10:10:45 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id l18so869813wgh.14;
	Wed, 07 Jan 2015 02:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=pfkcLFs7UiRrpOkc9HRXGmZVbsZWreYagxRBoJKnHf4=;
	b=WkF9R965WPrLQNcL7/wgY+N8pyygrnc+mQCdl+ZoXNkCuwMLv5xDF8b5Xf8e9YTawX
	EWvGODzQweQa7UHSJflsSqBDcLgMgCLD+O27sc8a1Z4dz4PjhU8nJGSrSRxO8YKMvlGy
	80KRUM3qf9epMDVt787hrPB1OklCPgacPiVTStxaSUF0fz+QdI1wJWotAMXeo1caT8m4
	Rt1lujB+z8IklGjwGugy9b41Ty2i4QITN6tcr9nQlDA5rYsxJLQRlFcfcoOISXkHI9P8
	4E12jZFcM2HyQqKGLtDG3jxV7Bw81jpaXRh/qdriiHN0LrlE1KsVnoXwo6YHNI5OqjLk
	m8zw==
X-Received: by 10.180.76.144 with SMTP id k16mr5678281wiw.3.1420625444979;
	Wed, 07 Jan 2015 02:10:44 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	qg11sm17224374wic.17.2015.01.07.02.10.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Jan 2015 02:10:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 7 Jan 2015 11:10:47 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20150107101047.GG29986@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2015-01-07
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
X-List-Received-Date: Wed, 07 Jan 2015 10:10:48 -0000
X-Groupsio-MsgNum: 61093
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4eRLI4hEmsdu6Npr"
Content-Disposition: inline

--4eRLI4hEmsdu6Npr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This time not very useful as qemux86* are failing to build kernel.

http://www.openembedded.org/wiki/Bitbake_World_Status

== Failed tasks 2015-01-07 ==

INFO: jenkins-job.sh-1.1.0 Complete log available at http://logs.nslu2-linux.org/buildlogs/oe/world/log.report.20150107_100747.log

=== common (9) ===
    * /meta-openembedded/meta-networking/recipes-protocols/openwsman/openwsman_2.4.12.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-support/libutempter/libutempter_1.1.6.bb, do_compile
    * /meta-openembedded/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb, do_configure
    * /meta-qt5/recipes-qt/examples/qt5-opengles2-test_git.bb, do_compile

=== common-x86 (1) ===
    * /openembedded-core/meta/recipes-kernel/linux/linux-yocto_3.17.bb, do_kernel_configme

=== qemuarm (0) ===

=== qemux86 (0) ===

=== qemux86_64 (0) ===

=== Number of failed tasks (29) ===
{| class=wikitable
|-
|| qemuarm 	|| 9	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150106_212602.log// || http://errors.yoctoproject.org:80/Errors/Search/1/3916/
|-
|| qemux86 	|| 10	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150106_231530.log// || http://errors.yoctoproject.org:80/Errors/Search/1/3929/
|-
|| qemux86_64 	|| 10	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150107_015729.log// || http://errors.yoctoproject.org:80/Errors/Search/1/3931/
|}

=== PNBLACKLISTs (50) ===

=== QA issues (53) ===
{| class=wikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||libdir
|-
||1	||textrel
|-
||42	||version-going-backwards
|-
||5	||build-deps
|-
||5	||file-rdeps
|}


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb:PNBLACKLIST[ifuse] ?= "depends on blacklisted libimobiledevice"
meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gnome-mplayer] ?= "rdepends on blacklisted mplayer"
meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.10.bb:PNBLACKLIST[network-manager-applet] ?= "Depends on broken polkit-gnome"
meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb:PNBLACKLIST[gcr] ?= "CONFLICT: 4 files conflict with gnome-keyring"
meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb:PNBLACKLIST[gdm] ?= "Depends on broken polkit-gnome"
meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb:PNBLACKLIST[gnome-bluetooth] ?= "dbus-binding-tool fails with: Unable to load gnome-bluetooth-2.32.0/lib/bluetooth-client.xml": "manager" is not a valid D-Bus interface name"
meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb:PNBLACKLIST[gnome-menus3] ?= "CONFLICT: 24 files are conflicting with gnome-menus"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnome-panel3] ?= "CONFLICT: depends on libgweather3 which conflicts with libgweather"
meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgweather3] ?= "CONFLICT: 876 files are conflicting with libgweather"
meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?= "BROKEN: doesn't build with B!=S"
meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:PNBLACKLIST[xbmc] ?= "/usr/include/c++/ctime:70:11: error: '::gmtime' has not been declared"
meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:PNBLACKLIST[coriander] ?= "BROKEN: fails to use SDL probably because libsdl-config was removed, error: unknown type name 'SDL_Overlay'"
meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb:PNBLACKLIST[renderer-service-upnp] ?= "BROKEN: doesn't build with B!=S (trying to install rendererconsole.py from ${B} instead of ${S})"
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:PNBLACKLIST[lksctp-tools] ?= "BROKEN: fails to link against sctp_connectx symbol"
meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb:PNBLACKLIST[libimobiledevice] ?= "cannot run test program while cross compiling"
meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?= "BROKEN: depends on broken libftdi"
meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zeroc-ice] ?= "BROKEN: not compatible with default db version"
meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb:PNBLACKLIST[polkit-gnome] ?= "Fails to build, m4:configure.ac:125: recursion limit of 1024 exceeded, use -L<N> to change it"
meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurface] ?= "Needs to be upgraded for compatibility with new libdivecomputer"
meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-box2d] ?= "BROKEN: doesn't build with B!=S"
meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?= "BROKEN: doesn't build with B!=S (flex: can't open lex.lex)"
meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[xf86-input-mtev] ?= "BROKEN: doesn't build with B!=S (Makefile without ${S} in sed call)"
meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb:PNBLACKLIST[mplayer2] ?= "Requires newer libav which has negative D_P"
meta-oe/recipes-qt/qconnman/qconnman-e_git.bb:PNBLACKLIST[qconnman-e] ?= "BROKEN: doesn't work with B!=S, ls: cannot access *.pro: No such file or directory"
meta-oe/recipes-qt/qconnman/qconnman_git.bb:PNBLACKLIST[qconnman] ?= "BROKEN: doesn't work with B!=S, ls: cannot access *.pro: No such file or directory"
meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb:PNBLACKLIST[sylpheed] ?= "BROKEN: Doesn't work with B!=S"
meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd] ?= "BROKEN: doesn't build with B!=S"
meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?= "qemu: uncaught target signal 11 (Segmentation fault) - core dumped"
meta-oe/recipes-support/maliit/maliit-framework_git.bb:PNBLACKLIST[maliit-framework] ?= "BROKEN: Wasn't updated to work with B!=S, maybe incorrectly inherits autotools"
meta-oe/recipes-support/maliit/maliit-plugins_git.bb:PNBLACKLIST[maliit-plugins] ?= "BROKEN: depends on broken maliit-framework"
meta-oe/recipes-support/mongodb/mongodb_git.bb:PNBLACKLIST[mongodb] ?= "Fails to build with system boost"
meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmotif] ?= "BROKEN: doesn't build with B!=S"
meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala-terminal] ?= "BROKEN: Doesn't work with B!=S, touch: cannot touch `src/.stamp': No such file or directory"
meta-qt5:
meta-smartphone:
meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] = "rdepends on blacklisted mplayer2"
meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompass] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-webos-ports:
conf/world_fixes.inc:PNBLACKLIST[mplayer2] = ""
conf/world_fixes.inc:PNBLACKLIST[android-system] = "depends on lxc from meta-virtualiazation which isn't included in my world builds"
conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be tested so much"
conf/world_mask.inc:PNBLACKLIST[evince] = "fails to build"
conf/world_mask.inc:PNBLACKLIST[epiphany] = "fails to build"
conf/world_mask.inc:PNBLACKLIST[gnome-power-manager] = "fails to build"
conf/world_mask.inc:PNBLACKLIST[gnome-bluetooth] = "fails to build"
conf/world_mask.inc:PNBLACKLIST[media-ctl] = "fails to build"
QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 1	issue: textrel
webkit-efl-1.11.0: ELF binary '/tmp/work/i586-oe-linux/webkit-efl/1_1.11.0-r0/packages-split/webkit-efl/usr/lib/libjavascriptcore_efl.so.1.11.0' has relocations in .text [textrel]


count: 5	issue: build-deps
exquisite-0.0.1+svnr82070: exquisite rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
imsettings-1.6.7: imsettings rdepends on xfconf, but it isn't a build dependency? [build-deps]
libssh-0.6.4+gitAUTOINC+3880a8ed80: libssh rdepends on krb5, but it isn't a build dependency? [build-deps]
mpd-0.19.1: mpd rdepends on libsmbclient, but it isn't a build dependency? [build-deps]
vlc-2.1.4: vlc rdepends on libssh2, but it isn't a build dependency? [build-deps]


count: 5	issue: file-rdeps
corosync-2.3.4: corosync requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
gammu-1.32.0: gammu requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
gammu-1.32.0: gammu-dev requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
imsettings-1.6.7: imsettings requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
php-5.5.20: php requires /tmp/work/core2-64-oe-linux/php/5.5.20-r0/image/usr/bin/php, but no providers in its RDEPENDS [file-rdeps]


count: 42	issue: version-going-backwards
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl went backwards which would break package feeds from (0:2.16-r0.73 to 0:2.16-r0.72) [version-going-backwards]
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl-dbg went backwards which would break package feeds from (0:2.16-r0.73 to 0:2.16-r0.72) [version-going-backwards]
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl-dev went backwards which would break package feeds from (0:2.16-r0.73 to 0:2.16-r0.72) [version-going-backwards]
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl-doc went backwards which would break package feeds from (0:2.16-r0.73 to 0:2.16-r0.72) [version-going-backwards]
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl-locale went backwards which would break package feeds from (0:2.16-r0.73 to 0:2.16-r0.72) [version-going-backwards]
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl-staticdev went backwards which would break package feeds from (0:2.16-r0.73 to 0:2.16-r0.72) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl went backwards which would break package feeds from (0:1.03-r0.72 to 0:1.03-r0.71) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-dbg went backwards which would break package feeds from (0:1.03-r0.72 to 0:1.03-r0.71) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-dev went backwards which would break package feeds from (0:1.03-r0.72 to 0:1.03-r0.71) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-doc went backwards which would break package feeds from (0:1.03-r0.72 to 0:1.03-r0.71) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-locale went backwards which would break package feeds from (0:1.03-r0.72 to 0:1.03-r0.71) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-staticdev went backwards which would break package feeds from (0:1.03-r0.72 to 0:1.03-r0.71) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-perl went backwards which would break package feeds from (0:1.997-r0.70 to 0:1.997-r0.69) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-perl-dbg went backwards which would break package feeds from (0:1.997-r0.70 to 0:1.997-r0.69) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-perl-dev went backwards which would break package feeds from (0:1.997-r0.70 to 0:1.997-r0.69) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-perl-doc went backwards which would break package feeds from (0:1.997-r0.70 to 0:1.997-r0.69) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-perl-locale went backwards which would break package feeds from (0:1.997-r0.70 to 0:1.997-r0.69) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-perl-staticdev went backwards which would break package feeds from (0:1.997-r0.70 to 0:1.997-r0.69) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for package luna-sysmgr-ipc-messages went backwards which would break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155bd3f1-r0.17) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for package luna-sysmgr-ipc-messages-dbg went backwards which would break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155bd3f1-r0.17) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for package luna-sysmgr-ipc-messages-dev went backwards which would break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155bd3f1-r0.17) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for package luna-sysmgr-ipc-messages-doc went backwards which would break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155bd3f1-r0.17) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for package luna-sysmgr-ipc-messages-locale went backwards which would break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155bd3f1-r0.17) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for package luna-sysmgr-ipc-messages-staticdev went backwards which would break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155bd3f1-r0.17) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-rule-datetime went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-rule-datetime-dbg went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-rule-datetime-dev went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-rule-datetime-doc went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-rule-datetime-locale went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-rule-datetime-staticdev went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rule-network went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rule-network-dbg went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rule-network-dev went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rule-network-doc went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rule-network-locale went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rule-network-staticdev went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common went backwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r8.104) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-dbg went backwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r8.104) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-dev went backwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r8.104) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-doc went backwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r8.104) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-locale went backwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r8.104) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-staticdev went backwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r8.104) [version-going-backwards]

--4eRLI4hEmsdu6Npr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlStBicACgkQN1Ujt2V2gBy5mwCfQyBlKN20StkV4hDBVuT0I6Pr
kMsAoKQma9q6tvOy58N1PYIDPrODMu6X
=439E
-----END PGP SIGNATURE-----

--4eRLI4hEmsdu6Npr--
