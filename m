Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 173B671AD1;
	Sun,  5 Feb 2017 10:48:20 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id 89so9244892wrr.2;
	Sun, 05 Feb 2017 02:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=nYr9FpQxy8I6LP7YR/hZrKu7cYU6t9u6EjoXcYhc6U8=;
	b=nHFxwhI7U7A1spmTOWfS/W/6SjyNzSC2tIdhNCB26nlCD7pcl8YVLotTx98O9/A85e
	3hg5KpvQSS4MMr7AtgUyZuVcUQCcASF44vqmkTbvQAfuNU8eZ4I6uV8n9esa+HmGJZVI
	k9XBUkCDDJVa6jgUD6rGC7ycBkXGnZge/TtboyJJwlGdyRKqtY7JuKd0HuXRtj5H5PHg
	Yb3U3cZY4jiocfBg7xi0Ss9PDpfbsRd+1ci0ywO5QY4Qwe4PGu8qTeuWRckLLhITqSHp
	4pgauZItIYFnV4jTcb4KiiZfc4lyd9+DDezMwzNWnCFTZFeQXIzykZpgmvYcHFR4k2f3
	3Xbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=nYr9FpQxy8I6LP7YR/hZrKu7cYU6t9u6EjoXcYhc6U8=;
	b=jS9hCwInBqd1nfo4+6BgaNr0gniQWBYY5QN95RZnJIXveCjzCzaIBfFUNc5VocwdWI
	2GpLR28mElMi3iJxKt1li3Je8kbaTabW/VozQo/k2s1sBPZJ/dZcaR5DC1S1Djpq6z6H
	Nd9NNu/QuEJ6VanZBEX+0yjQR/642Qztp3wzMamnjrQNI6jdDjT5AJWOuXhapTpT5x9M
	BVzNjkcVwf62YhzhwlGkVnB1t99b+PuyYMPxhmKS2vQjx0BYYpl3WWHuFtO0skc+DEcc
	ZK1APWUgdSlCPokOffe+pQzD6uoPyP+2X23Fx3n9qV4RwmqW/OAvn4w/r4xvqjV+Ep8o
	MHqQ==
X-Gm-Message-State: AIkVDXI6qrMSgp+Riqrt6ONFWNsLd5+k3VpQXuaElE1ipvMjDyIVPpdvfKWcalmFB84HomwxF9bSYOiG2XIlog==
X-Received: by 10.223.154.109 with SMTP id z100mr4861159wrb.145.1486291699807; 
	Sun, 05 Feb 2017 02:48:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Sun, 5 Feb 2017 02:48:19 -0800 (PST)
In-Reply-To: <20170202120611.GA3269@jama>
References: <20170131171049.GA3273@jama> <20170202120611.GA3269@jama>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 5 Feb 2017 11:48:19 +0100
Message-ID: <CA+chaQd7SkPnB6MbOMb3oZEa_AwdP7RS+PHUby+0jJepnUCAzg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2017-02-01
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
X-List-Received-Date: Sun, 05 Feb 2017 10:48:24 -0000
Content-Type: multipart/alternative; boundary=f403045f4c62ccbd8f0547c640d3

--f403045f4c62ccbd8f0547c640d3
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 2, 2017 at 1:06 PM, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Tue, Jan 31, 2017 at 06:10:49PM +0100, Martin Jansa wrote:
> > There is a lot more failures this time (mostly because of RSS), but
> > I wanted to share it anyway, to be clear about the current state of
> > other layers.
> > :
>
> Still a lot of failures, I've updated the report script to stop
> processing test-dependencies jenkins jobs, so it's a bit shorter now,
> I've sent fixes for firefox*, geoclue and vboxguestdrivers, so next
> report shouls be at least 50 lines shorter as well.
>

It's a bit shorter but still ugly.

== Number of issues - stats ==
{| class='wikitable'
!|Date		     !!colspan='3'|Failed tasks			    !!colspan='6'|Failed
depencencies			 !!|Signatures		  !!colspan='12'|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||qemuarm||max||min	||qemux86||max||min	||all
	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	||
|-

||2017-02-02	||100	||97	||103	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||0		||2		||0		||5		||7920		||0		||2		||0		||0		||0		||0		||
|}
http://www.openembedded.org/wiki/Bitbake_World_Status

== Failed tasks 2017-02-02 ==

INFO: jenkins-job.sh-1.8.15 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.report.20170204_072659.log

=== common (90) ===
    * meta-browser/recipes-mozilla/firefox-addon/firefox-addon-webconverger_git.bb:do_install
    * meta-openembedded/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb:do_compile
    * meta-openembedded/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb:do_compile
    * meta-openembedded/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb:do_configure
    * meta-openembedded/meta-gnome/recipes-gnome/devilspie/devilspie2_0.33.bb:do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb:do_configure
    * meta-openembedded/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb:do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data_2.18.0.bb:do_configure
    * meta-openembedded/meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb:do_configure
    * meta-openembedded/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb:do_configure
    * meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb:do_configure
    * meta-openembedded/meta-gnome/recipes-gnome/libidl/libidl-native_0.8.14.bb:do_configure
    * meta-openembedded/meta-gnome/recipes-support/onboard/onboard_1.3.0.bb:do_compile
    * meta-openembedded/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb:do_compile
    * meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb:do_compile
    * meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb:do_configure
    * meta-openembedded/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb:do_compile
    * meta-openembedded/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.10.bb:do_configure
    * meta-openembedded/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb:do_fetch
    * meta-openembedded/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb:do_compile
    * meta-openembedded/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb:do_configure
    * meta-openembedded/meta-networking/recipes-connectivity/crda/crda_3.18.bb:do_compile
    * meta-openembedded/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb:do_configure
    * meta-openembedded/meta-networking/recipes-protocols/openflow/openflow_git.bb:do_configure
    * meta-openembedded/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb:do_compile
    * meta-openembedded/meta-networking/recipes-support/wireshark/wireshark_2.2.4.bb:do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb:do_configure
    * meta-openembedded/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb:do_configure
    * meta-openembedded/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.6.bb:do_configure
    * meta-openembedded/meta-oe/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb:do_compile
    * meta-openembedded/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-core/glib-2.0/glibmm_2.50.0.bb:do_configure
    * meta-openembedded/meta-oe/recipes-devtools/geany/geany_1.29.bb:do_configure
    * meta-openembedded/meta-oe/recipes-devtools/php/php_7.1.0.bb:do_install
    * meta-openembedded/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb:do_configure
    * meta-openembedded/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb:do_configure
    * meta-openembedded/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb:do_compile
    * meta-openembedded/meta-oe/recipes-gnome/libglade/libglade_2.6.4.bb:do_compile
    * meta-openembedded/meta-oe/recipes-graphics/fbida/fbida_2.10.bb:do_compile
    * meta-openembedded/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb:do_compile
    * meta-openembedded/meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb:do_compile
    * meta-openembedded/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.3.bb:do_configure
    * meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb:do_configure
    * meta-openembedded/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb:do_configure
    * meta-openembedded/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb:do_configure
    * meta-openembedded/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb:do_configure
    * meta-openembedded/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb:do_configure
    * meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.1.5.bb:do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb:do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb:do_configure
    * meta-openembedded/meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mixer_2.0.1.bb:do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb:do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.5.bb:do_compile
    * meta-openembedded/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb:do_configure
    * meta-openembedded/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.14.bb:do_configure
    * meta-openembedded/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.11.bb:do_configure
    * meta-openembedded/meta-oe/recipes-support/ode/ode_0.13.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/pidgin/pidgin_2.11.0.bb:do_configure
    * meta-openembedded/meta-oe/recipes-support/poppler/poppler_0.51.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/postgresql/postgresql_9.4.8.bb:do_configure
    * meta-openembedded/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/udisks/udisks_1.0.5.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/udisks/udisks2_2.1.7.bb:do_configure
    * meta-openembedded/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.15.bb:do_configure
    * meta-openembedded/meta-python/recipes-connectivity/gateone/gateone_git.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python3-cryptography-vectors_1.6.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.4.2.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python-cryptography-vectors_1.6.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python-pbr_1.10.0.bb:do_compile
    * meta-openembedded/meta-ruby/recipes-devtools/ruby/bundler_git.bb:do_compile
    * meta-openembedded/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb:do_install
    * meta-openembedded/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.0.bb:do_install
    * meta-openembedded/meta-webserver/recipes-webadmin/netdata/netdata_git.bb:do_configure
    * meta-openembedded/meta-xfce/recipes-apps/menulibre/menulibre_2.1.3.bb:do_compile
    * meta-openembedded/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.4.bb:do_configure
    * meta-openembedded/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb:do_compile
    * meta-openembedded/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_1.1.0.bb:do_compile
    * meta-smartphone/meta-fso/recipes-freesmartphone/freesmartphone/fso-gsm0710muxd_git.bb:do_compile
    * meta-smartphone/meta-shr/recipes-shr/3rdparty/omext_0.2.bb:do_compile
    * openembedded-core/meta/recipes-devtools/qemu/qemu_2.7.1.bb:do_configure
    * openembedded-core/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb:do_compile
    * openembedded-core/meta/recipes-kernel/latencytop/latencytop_0.5.bb:do_compile
    * openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.29.bb:do_compile

=== common-x86 (4) ===
    * meta-openembedded/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb:do_compile
    * meta-openembedded/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb:do_compile
    * meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.12.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb:do_compile

=== qemuarm (10) ===
    * meta-openembedded/meta-efl/recipes-devtools/python/python-edbus_1.7.0.bb:do_configure
    * meta-openembedded/meta-efl/recipes-efl/e17/exquisite_svn.bb:do_compile
    * meta-openembedded/meta-efl/recipes-efl/efl/elementary_1.15.1.bb:do_compile
    * meta-openembedded/meta-efl/recipes-efl/efl/libeweather_svn.bb:do_compile
    * meta-openembedded/meta-oe/recipes-benchmark/pmbw/pmbw_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb:do_compile
    * meta-smartphone/meta-shr/recipes-shr/3rdparty/atd-over-fso_0.70.bb:do_compile
    * meta-smartphone/meta-shr/recipes-shr/shr/e-wm-config-illume2-shr_git.bb:do_compile
    * meta-smartphone/meta-shr/recipes-shr/shr/libshr-glib_git.bb:do_compile

=== qemux86 (3) ===
    * meta-qt5/recipes-qt/maliit/maliit-framework-qt5_git.bb:do_compile
    * openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_configure
    * openembedded-core/meta/recipes-extended/cups/cups_2.2.1.bb:do_configure

=== qemux86_64 (2) ===
    * meta-browser/recipes-browser/chromium/chromium_52.0.2743.76.bb:do_compile
    * meta-browser/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb:do_compile

=== Number of failed tasks (300) ===
{| class=wikitable
|-
|| qemuarm 	|| 100	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemuarm.20170202_205344.log/
|| http://errors.yoctoproject.org/Errors/Build/31819/
|-
|| qemux86 	|| 97	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemux86.20170202_021822.log/
|| http://errors.yoctoproject.org/Errors/Build/31807/
|-
|| qemux86_64 	|| 103	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemux86-64.20170202_222838.log/
|| http://errors.yoctoproject.org/Errors/Build/31830/
|}

=== PNBLACKLISTs (115) ===

=== QA issues (7929) ===
{| class=wikitable
!| Count		||Issue

|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||host-user-contaminated
|-
||0	||invalid-pkgconfig
|-
||0	||libdir
|-
||0	||pkgname
|-
||0	||symlink-to-sysroot
|-
||0	||unknown-configure-option
|-
||2	||installed-vs-shipped
|-
||2	||textrel
|-
||5	||file-rdeps
|-
||7920	||version-going-backwards
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signatures.20170203_155418.log/

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
recipes-browser/chromium/cef3_280796.bb:PNBLACKLIST[cef3] ?= "BROKEN:
fails to build with gcc-6"
meta-openembedded:
meta-efl/recipes-efl/e17/diskio_svn.bb:PNBLACKLIST[diskio] ?= "broken:
switch to https://git.enlightenment.org/enlightenment/modules/diskio.git/
and fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58.
invalid state name: 'off'. "default" state must always be first."
meta-efl/recipes-efl/e17/elbow_git.bb:PNBLACKLIST[elbow] ?= "Depends
on blacklisted webkit-efl"
meta-efl/recipes-efl/e17/elmdentica_svn.bb:PNBLACKLIST[elmdentica] ?=
"OLD and depends on broken azy"
meta-efl/recipes-efl/e17/emprint_svn.bb:PNBLACKLIST[emprint] ?= "if
you want to use these modules with E18, then you need to update it to
git recipe fetching newer sources from
http://git.enlightenment.org/apps/emprint.git/"
meta-efl/recipes-efl/e17/news_svn.bb:PNBLACKLIST[news] ?= "if you want
to use these modules with E18, then you need to update it to git
recipe fetching newer sources from
http://git.enlightenment.org/enlightenment/modules/news.git/"
meta-efl/recipes-efl/e17/rage_svn.bb:PNBLACKLIST[rage] ?= "if you want
to use these modules with E18, then you need to update it to git
recipe fetching newer sources from
http://git.enlightenment.org/apps/rage.git/"
meta-efl/recipes-efl/e17/screenshot_svn.bb:PNBLACKLIST[screenshot] ?=
"depends on blacklisted emprint"
meta-efl/recipes-efl/efl/azy_svn.bb:PNBLACKLIST[azy] ?= "OLD and
doesn't build with gcc-5"
meta-efl/recipes-efl/efl/engrave_svn.bb:PNBLACKLIST[engrave] ?=
"BROKEN: fails to build with latest oe-core"
meta-efl/recipes-efl/efl/entrance_svn.bb:PNBLACKLIST[entrance] ?=
"broken: switch to https://git.enlightenment.org/misc/entrance.git and
fix 0.0.4+svnr82070-r7/entrance/data/themes/old/default.edc:678.
invalid state name: 'defaault'. "default" state must always be first."
meta-efl/recipes-efl/webkit/webkit-efl.inc:PNBLACKLIST[webkit-efl] ?=
"Old and unmaintaned fork with many security issues"
meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb:PNBLACKLIST[mcnavi]
?= "BROKEN: latest version 0.3.4 is 3 years old and now broken with
more strict ejde_cc from efl-1.13"
meta-filesystems/recipes-utils/dmapi/dmapi_2.2.12.bb:PNBLACKLIST[dmapi]
?= "Depends on broken xfsprogs"
meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb:PNBLACKLIST[xfsdump]
?= "Depends on broken xfsprogs"
meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb:PNBLACKLIST[epdfview]
?= "BROKEN: images are not displayed anymore"
meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gnome-mplayer]
?= "rdepends on blacklisted mplayer"
meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb:PNBLACKLIST[gtk-theme-torturer]
?= "BROKEN: gmacros.h:182:53: error: size of array
'_GStaticAssertCompileTimeAssertion_2' is negative"
meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb:PNBLACKLIST[gcalctool]
?= "broken at least since April 2013
http://permalink.gmane.org/gmane.comp.handhelds.openembedded/57920 and
nobody complained, it's also replaced by gnome calculator"
meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb:PNBLACKLIST[gdm] ?=
"Depends on broken gnome-panel"
meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb:PNBLACKLIST[gnome-control-center]
?= "Depends on broken gnome-menus"
meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLIST[gnome-keyring]
?= "This version conflicts with gcr from oe-core"
meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb:PNBLACKLIST[gnome-menus]
?= "BROKEN: fails to build because of python + conflicts with
gnome-menu3"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnome-panel3]
?= "CONFLICT: depends on libgweather3 which conflicts with
libgweather"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnome-panel3]
?= "Depends on broken gnome-menus"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb:PNBLACKLIST[gnome-panel]
?= "Depends on broken libgweather"
meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb:PNBLACKLIST[gnome-power-manager]
?= "BROKEN: not compatible with current libnotify"
meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb:PNBLACKLIST[gnome-session]
?= "BROKEN: fails to build with gcc-6"
meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb:PNBLACKLIST[gnome-terminal]
?= "BROKEN: fails to build with gcc-6"
meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb:PNBLACKLIST[libgnomecups]
?= "Depends on broken libgnomeui"
meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb:PNBLACKLIST[libgnomeprint]
?= "Depends on broken libgnomecups"
meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb:PNBLACKLIST[gnumeric]
?= "Depends on broken libgnomeprint"
meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgweather3]
?= "CONFLICT: 876 files are conflicting with libgweather"
meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb:PNBLACKLIST[libgweather]
?= "BROKEN: fails to build with gcc-6"
meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb:PNBLACKLIST[nautilus3]
?= "BROKEN: fails to build, maybe missing dependency on
gnome-desktop-utils.h provider"
meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb:PNBLACKLIST[tasks] ?=
"Fails to build with gcc-6"
meta-gnome/recipes-gnome/pimlico/tasks_git.bb:PNBLACKLIST[tasks] ?=
"Fails to build with gcc-6"
meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb:PNBLACKLIST[system-tools-backends]
?= "does not build with distroless qemuarm as reported in 'State of
bitbake world' thread, nobody volunteered to fix them"
meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity]
?= "BROKEN: doesn't build with B!=S"
meta-gnome/recipes-support/goffice/goffice_0.10.1.bb:PNBLACKLIST[goffice]
?= "BROKEN: fails to build with gcc-6"
meta-gnome/recipes-support/tracker/tracker_0.14.2.bb:PNBLACKLIST[tracker]
?= "BROKEN: fails to build with new binutils-2.27"
meta-gpe/recipes-support/fbreader/fbreader_git.bb:PNBLACKLIST[fbreader]
?= "BROKEN: fails to build with gcc-6"
meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb:PNBLACKLIST[mkvtoolnix]
?= "BROKEN: Failx to build with gcc-5"
meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:PNBLACKLIST[coriander]
?= "BROKEN: fails to use SDL probably because libsdl-config was
removed, error: unknown type name 'SDL_Overlay'"
meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb:PNBLACKLIST[renderer-service-upnp]
?= "BROKEN: doesn't build with B!=S (trying to install
rendererconsole.py from ${B} instead of ${S})"
meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg_0.10.13.bb:PNBLACKLIST[gst-ffmpeg]
?= "Not compatible with currently used ffmpeg 3"
meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb:PNBLACKLIST[gst123]
?= "gst123 is still "sometimes" using wrong sysroot"
meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb:PNBLACKLIST[dnrd]
?= "BROKEN: dnrd-2.20.3-r0 do_package: QA Issue: dnrd:
Files/directories were installed but not shipped in any package:"
meta-networking/recipes-kernel/netmap/netmap-modules_git.bb:PNBLACKLIST[netmap-modules]
?= "BROKEN: not compatible with default kernel version 4.8"
meta-networking/recipes-kernel/netmap/netmap_git.bb:PNBLACKLIST[netmap]
?= "BROKEN: Tries to build kernel module and fails, either it should
be disabled or there should be dependency on kernel like in
netmap-modules"
meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb:PNBLACKLIST[accel-ppp]
?= "BROKEN: fails to build with new binutils-2.27"
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACKLIST[lksctp-tools]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN:
fails to link against sctp_connectx symbol", '', d)}"
meta-networking/recipes-support/nis/ypbind-mt_2.2.bb:PNBLACKLIST[ypbind-mt]
?= "BROKEN: Depends on broken yp-tools"
meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNBLACKLIST[bluez-hcidump]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '',
d)}"
meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '',
d)}"
meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:PNBLACKLIST[gst-plugin-bluetooth]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '',
d)}"
meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66]
?= "BROKEN: depends on broken libftdi"
meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb:PNBLACKLIST[wvdial]
?= "Depends on broken wvstreams"
meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb:PNBLACKLIST[wvstreams]
?= "BROKEN: fails to build with gcc-6"
meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zeroc-ice]
?= "BROKEN: not compatible with default db version"
meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb:PNBLACKLIST[fakeroot]
?= "BROKEN: QA Issue: -dev package contains non-symlink .so"
meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb:PNBLACKLIST[cloud9] ?=
"Not comatible with current nodejs 0.12, but upstream is working on it
for v3"
meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb:PNBLACKLIST[ltp-ddt]
?= "BROKEN: fails since last autotools.bbclass changes"
meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb:PNBLACKLIST[packagekit]
?= "BROKEN: depends on old deprecated libopkg which is currently
disabled and will be removed soon"
meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurface]
?= "Needs to be upgraded for compatibility with new libdivecomputer"
meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb:PNBLACKLIST[gtkextra]
?= "BROKEN: Fails to build with gcc-5"
meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-box2d]
?= "BROKEN: doesn't build with B!=S"
meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?=
"BROKEN: doesn't build with B!=S (flex: can't open lex.lex)"
meta-oe/recipes-graphics/slim/slim_1.3.2.bb:PNBLACKLIST[slim] ?= "does
not build with distroless qemuarm as reported in 'State of bitbake
world' thread, nobody volunteered to fix them"
meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[xf86-input-mtev]
?= "BROKEN: doesn't build with B!=S (Makefile without ${S} in sed
call)"
meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:PNBLACKLIST[xf86-video-geode]
?= "BROKEN, fails to build"
meta-oe/recipes-kernel/ktap/ktap-module_git.bb:PNBLACKLIST[ktap-module]
?= "Not compatible with 3.19 kernel"
meta-oe/recipes-kernel/ktap/ktap_git.bb:PNBLACKLIST[ktap] ?= "Depends
on blacklisted kernel-module-ktapvm"
meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb:PNBLACKLIST[mplayer2]
?= "Not compatible with currently used ffmpeg 3"
meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtrotgps]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '',
d)}"
meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb:PNBLACKLIST[gdal] ?=
"BROKEN: fails to build with gcc-5"
meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=
"${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=
"${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb:PNBLACKLIST[claws-mail]
?= "depends on blacklisted libetpan"
meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb:PNBLACKLIST[claws-plugin-gtkhtml2-viewer]
?= "depends on blacklisted claws-mail"
meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb:PNBLACKLIST[claws-plugin-mailmbox]
?= "depends on blacklisted claws-mail"
meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb:PNBLACKLIST[claws-plugin-rssyl]
?= "depends on blacklisted claws-mail"
meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd]
?= "BROKEN: doesn't build with B!=S"
meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?=
"qemu: uncaught target signal 11 (Segmentation fault) - core dumped"
meta-oe/recipes-support/fftw/benchfft_3.1.bb:PNBLACKLIST[benchfft] ?=
"does not build with distroless qemuarm as reported in 'State of
bitbake world' thread, nobody volunteered to fix them"
meta-oe/recipes-support/iksemel/iksemel_1.4.bb:PNBLACKLIST[iksemel] ?=
"Not compatible with gnutls version 3.4 currently in oe-core"
meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb:PNBLACKLIST[libdbi-drivers]
?= "BROKEN: fails to build with gcc-5"
meta-oe/recipes-support/libetpan/libetpan_0.57.bb:PNBLACKLIST[libetpan]
?= "Not compatible with gnutls version 3.4 currently in oe-core"
meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.4.bb:PNBLACKLIST[open-vcdiff]
?= "BROKEN: fails to build with gcc-6"
meta-oe/recipes-support/opencv/opencv-samples_2.4.bb:PNBLACKLIST[opencv-samples]
?= "Depends on blacklisted opencv"
meta-oe/recipes-support/opencv/opencv_2.4.bb:PNBLACKLIST[opencv] ?=
"Not compatible with currently used ffmpeg 3"
meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmotif]
?= "BROKEN: doesn't build with B!=S"
meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '',
d)}"
meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb:PNBLACKLIST[openwbem]
?= "BROKEN: fails to build with gcc-6"
meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb:PNBLACKLIST[pidgin-otr]
?= "depends on blacklisted pidgin"
meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala-terminal]
?= "BROKEN: Doesn't work with B!=S, touch: cannot touch `src/.stamp':
No such file or directory"
meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.36.bb:PNBLACKLIST[vboxguestdrivers]
?= "BROKEN: not compatible with default kernel version 4.8"
meta-qt5:
meta-smartphone:
meta-fso/recipes-freesmartphone/freesmartphone/libframeworkd-glib_git.bb:PNBLACKLIST[libframeworkd-glib]
?= "BROKEN: many errors when building with gcc-6"
meta-fso/recipes-freesmartphone/freesmartphone/zhone_git.bb:PNBLACKLIST[zhone]
?= "rdepends on python-pycairo which was removed"
meta-shr/recipes-shr/3rdparty/advancedcaching_git.bb:PNBLACKLIST[advancedcaching]
?= "RDEPENDS on python-pygtk was removed from oe-core"
meta-shr/recipes-shr/3rdparty/emtooth2_svn.bb:PNBLACKLIST[emtooth2] ?=
"${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] =
"Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/gwaterpas_0.3.bb:PNBLACKLIST[gwaterpas]
?= "broken: depends on blacklisted fltk"
meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] =
"Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] =
"rdepends on blacklisted mplayer2"
meta-shr/recipes-shr/3rdparty/jefliks_git.bb:PNBLACKLIST[jefliks] ?=
"depends on blacklisted iksemel"
meta-shr/recipes-shr/3rdparty/openmoko-gps_svn.bb:PNBLACKLIST[openmoko-gps]
?= "RDEPENDS on python-pygtk which was removed from oe-core"
meta-shr/recipes-shr/3rdparty/pisi_0.5.3.bb:PNBLACKLIST[pisi] ?=
"RDEPENDS on python-pygtk which was removed from oe-core"
meta-shr/recipes-shr/3rdparty/podboy_svn.bb:PNBLACKLIST[podboy] ?=
"${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] =
"Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompass]
= "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/games/aceofpenguins_1.4.bb:PNBLACKLIST[aceofpenguins]
?= "BROKEN: fails to build with new binutils-2.27"
meta-shr/recipes-shr/shr/shr-installer_git.bb:PNBLACKLIST[shr-installer]
?= "Depends on blacklisted packagekit"
meta-webos-ports:
meta-luneos/recipes-luneos/luna-webappmanager/luna-webappmanager.bb:PNBLACKLIST[luna-webappmanager]
?= "BROKEN: needs to be adapted to new qt-5.7"
meta-luneui/recipes-luneui/luna-next/luna-next.bb:PNBLACKLIST[luna-next]
?= "BROKEN: needs to be adapted to new qtwayland-5.7"
PNBLACKLIST[android-system] = "depends on lxc from
meta-virtualiazation which isn't included in my world builds"
PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[build-appliance-image] = "tries to include whole downloads
directory in /home/builder/poky :/"
PNBLACKLIST[linux-yocto-tiny-kexecboot] = "does weird sh!t breaking
other kernels and modules - broken for years"
PNBLACKLIST[linux-yocto-tiny] = "does weird sh!t breaking other
kernels and modules - broken for years"


QA issues by type:

count: 0	issue: already-stripped


count: 0	issue: libdir


count: 2	issue: textrel

corosync-2.4.0: ELF binary
'/tmp/work/core2-64-oe-linux/corosync/2.4.0-r0/packages-split/corosync/usr/sbin/corosync'
has relocations in .text [textrel]
x264-r2491+gitAUTOINC+86b71982e1: ELF binary
'/tmp/work/i586-oe-linux/x264/r2491+gitAUTOINC+86b71982e1-r0/packages-split/x264/usr/lib/libx264.so.148'
has relocations in .text [textrel]


count: 0	issue: build-deps


count: 5	issue: file-rdeps
libmodule-build-perl-0.31: /usr/bin/config_data contained in package
libmodule-build-perl requires
/tmp/work/armv5te-oe-linux-gnueabi/libmodule-build-perl/0.31-r0/recipe-sysroot-native/usr/bin/perl-native/perl.real,
but no providers found in RDEPENDS_libmodule-build-perl? [file-rdeps]
libmodule-build-perl-0.31: /usr/bin/config_data contained in package
libmodule-build-perl requires
/tmp/work/core2-64-oe-linux/libmodule-build-perl/0.31-r0/recipe-sysroot-native/usr/bin/perl-native/perl.real,
but no providers found in RDEPENDS_libmodule-build-perl? [file-rdeps]
libmodule-build-perl-0.31: /usr/bin/config_data contained in package
libmodule-build-perl requires
/tmp/work/i586-oe-linux/libmodule-build-perl/0.31-r0/recipe-sysroot-native/usr/bin/perl-native/perl.real,
but no providers found in RDEPENDS_libmodule-build-perl? [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert_all.sh
contained in package numptyphysics requires /bin/bash, but no
providers found in RDEPENDS_numptyphysics? [file-rdeps]
ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: /usr/bin/memory-map.sh
contained in package ubx-utils requires /bin/bash, but no providers
found in RDEPENDS_ubx-utils? [file-rdeps]



count: 7920 issue: version-going-backwards
... skip 7919 lines...

zbar-0.10: Package version for package zbar went backwards which would
break package feeds from (0:0.10-r0.7 to 0:0.10-r0.0)
[version-going-backwards]


count: 0	issue: host-user-contaminated


count: 2	issue: installed-vs-shipped

iproute2: 2 installed and not shipped files. [installed-vs-shipped]
pcmciautils: 4 installed and not shipped files. [installed-vs-shipped]


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname



== Tested changes (not included in master yet) - bitbake ==

latest upstream commit:
2a309cd bitbake: Bump version to 1.33.0 (develoment version)
not included in master yet:
23e5bdc world-image: add extra target

== Tested changes (not included in master yet) - openembedded-core ==

latest upstream commit:
4247681 pkgconfig: fix typo introduced during recent conversion to PACKAGECONFIG
not included in master yet:
d1b416b qemux86: Add identical qemux86copy variant for tests
20d635b sstate-sysroot-cruft.sh: Extend the whitelist
626fce7 recipes: Replace "cp -a" with "cp -R --no-dereference
--preserve=mode,links"
4f081ef buildhistory.bbclass: metadata-revs show repo parent
8b306e3 metadata-revs: provide more information
c8a611b report-error: Allow to upload reports automatically
48774e1 flex: upgrade to 2.6.3
871cbf7 Revert "flex: upgrade to 2.6.3"
d793134 Revert "flex: upgrade to 2.6.2"

== Tested changes (not included in master yet) - meta-openembedded ==

latest upstream commit:
5ecbf9b poppler: update to 0.51.0
not included in master yet:
d95ddd7 kodi: Add krypton/17.x Jarvis/16.x recipes
5f453ae kodi: Fix build with pic on x86_64
f5962a8 kodi-17: Add packageconfig for lcms support
720a6a6 kodi-17: Fix build with musl
d20fcdd kodi-17: Update to latest
0f5b12c kodi-17: Fix build for qemuarm and update to latest
af36464 opensaf: 5.0.0 -> 5.1.0
693a20a lftp: update to 4.7.5 and change SRC_URI source
c88d8bd tcpdump: upgrade to 4.8.1
d778c85 iscsitarget: Fix call trace of ahash API calling
8b973aa relayd: derive PV from SRCPV
c1ecc8d rsyslog: use atomic builtins to avoid race issue
c28a522 dibbler: fix SRC_URI from ${P} to ${BP}
a3e2a3f fwts: upgrade to 17.01.00 release
45581e1 iscsitarget: fix inconsistent crash while login to iscsi
target from initiator

e342498 iscsitarget: use upstream to build with linux kernel >= 4.3
1bba45e iscsitarget: update patch to contain changes required to build
with only linux v4.8 and above
5399ec7 picocom: Fix build
e3c8469 onboard: initial add 1.3.0
5cfc356 nginx: update to version 1.11.8
c55d406 python-ipaddress: update to version 1.0.18
4751b71 python-flask-bootstrap: update to version 3.3.7.1
f1e1e05 python-netaddr: update to version 0.7.19
cccfbdb tremor: add (from oe-core)
275101c wireshark: update package to 2.2.4
4ffeaf1 xfce: add dbus-glib-native to DEPENDS to fix do_configure
9a6ea91 luajit: mips and mipsel are 32bit targets too
271bbe0 libgphoto2: remove bash runtime dependency.
306d47a python-selectors34: add new recipe for version 1.1
dbdb2c7 python-serpent: add new recipe for version 1.16
f01190d python-pyro4: update to version 4.53
a4b6d42 python-psutil: upgrade to version 5.0.1
9f6da5e python-click: update to version 6.7
2efbc1e python-cffi: Fix build for per-recipe sysroot.
cd9c5ce python-ndg-httpsclient: Fix build for per recipe sysroot.
90f6b5c python-pyopenssl: Fix build for per recipe sysroot.
56f1ea9 jack: add ARM NEON support for sample conversions
52c7bba fluidsynth: add ARM NEON support for sample interpolation
1fd940f nano: upgrade to 2.7.4
26ce753 remove some more True options to getVar calls
7cc8699 inetutils: register hostname.1 man page as an alternate
7344e23 multipath-tools: fix building of shared objects
280e767 multipath-tools: update to 0.6.4
cb16b43 opencv: Configure freetype via PACKAGECONFIG
576248e nginx: handle systemd service file
709329f libnet-ssleay-perl: fix build error
d7f39e1 python-cffi: Don't overwrite inherited dependencies
911739d python-pyopenssl: Don't overwrite inherited dependencies
e13ee3e python3-multidict: make repeated builds work even without sphinx
d607794 python-pyyaml: add dependency on python
dd1fc9a python-pytz: update to 2016.10
c162c91 gst-instruments: add recipe
a2c6b48 vboxguestdrivers: upgrade to 5.1.14 to fix compatibility with 4.9 kernel
aa61b94 geoclue: add missing dependency on gobject-introspection-native

== Tested changes (not included in master yet) - meta-qt5 ==

latest upstream commit:
9ed8210 qtwayland: fix build without xkbcommon-evdev
not included in master yet:

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
dac70ab chromium: split patch 'Remove hard coded values for CC and CXX'
not included in master yet:
7e31067 firefox*: add missing dependencies on zip-native and unzip-native

== Tested changes (not included in master yet) - meta-webos-ports ==

latest upstream commit:
e107290 alsa-utils: rename bbappend to match new version from oe-core
not included in master yet:

== Tested changes (not included in master yet) - meta-smartphone ==

latest upstream commit:
a04ef72 android-system: restore mount for hal-droid
not included in master yet:

--f403045f4c62ccbd8f0547c640d3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
hu, Feb 2, 2017 at 1:06 PM, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On T=
ue, Jan 31, 2017 at 06:10:49PM +0100, Martin Jansa wrote:<br>
&gt; There is a lot more failures this time (mostly because of RSS), but<br=
>
&gt; I wanted to share it anyway, to be clear about the current state of<br=
>
&gt; other layers.<br>
&gt; :<br>
<br>
Still a lot of failures, I&#39;ve updated the report script to stop<br>
processing test-dependencies jenkins jobs, so it&#39;s a bit shorter now,<b=
r>
I&#39;ve sent fixes for firefox*, geoclue and vboxguestdrivers, so next<br>
report shouls be at least 50 lines shorter as well.<br></blockquote><div><b=
r></div><div>It&#39;s a bit shorter but still ugly.</div><div><br></div><pr=
e id=3D"gmail-out" class=3D"gmail-console-output" style=3D"box-sizing:borde=
r-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-botto=
m:0px;color:rgb(51,51,51);font-size:14px"><pre style=3D"box-sizing:border-b=
ox;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0=
px">=3D=3D Number of issues - stats =3D=3D
{| class=3D&#39;wikitable&#39;
!|Date		     !!colspan=3D&#39;3&#39;|Failed tasks			    !!colspan=3D&#39;6&=
#39;|Failed depencencies			 !!|Signatures		  !!colspan=3D&#39;12&#39;|QA !!=
Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||qemuarm||max||min	||qemux86||max||mi=
n	||all 	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||=
version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||u=
nknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	=
||=09
|-
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">||2017-02-02	||100	||97	||103	||=
N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||0		||2		||0		||5		||7920		||0	=
	||2		||0		||0		||0		||0		||=09
|}

<a href=3D"http://www.openembedded.org/wiki/Bitbake_World_Status" style=3D"=
box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://www=
.openembedded.org/wiki/Bitbake_World_Status</a>

=3D=3D Failed tasks 2017-02-02 =3D=3D

INFO: jenkins-job.sh-1.8.15 Complete log available at <a href=3D"http://log=
s.nslu2-linux.org/buildlogs/oe/world/pyro/log.report.20170204_072659.log" s=
tyle=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">ht=
tp://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.report.20170204_07265=
9.log</a>

=3D=3D=3D common (90) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox-addon/firefox-addon-webconverger=
_git.bb:do_install
    * meta-openembedded/meta-filesystems/recipes-filesystems/unionfs-fuse/u=
nionfs-fuse_0.26.bb:do_compile
    * meta-openembedded/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.=
8.0.bb:do_compile
    * meta-openembedded/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb=
:do_configure
    * meta-openembedded/meta-gnome/recipes-gnome/devilspie/devilspie2_0.33.=
bb:do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-ba=
ckgrounds_2.32.0.bb:do_configure
    * meta-openembedded/meta-gnome/recipes-gnome/gnome-desktop/gnome-deskto=
p_2.32.1.bb:do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime=
-data_2.18.0.bb:do_configure
    * meta-openembedded/meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.=
20.2.bb:do_configure
    * meta-openembedded/meta-gnome/recipes-gnome/gtksourceview/gtksourcevie=
w2_2.10.5.bb:do_configure
    * meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.=
0.bb:do_configure
    * meta-openembedded/meta-gnome/recipes-gnome/libidl/libidl-native_0.8.1=
4.bb:do_configure
    * meta-openembedded/meta-gnome/recipes-support/onboard/onboard_1.3.0.bb=
:do_compile
    * meta-openembedded/meta-gpe/recipes-graphics/libgpewidget/libgpewidget=
_0.117.bb:do_compile
    * meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc=
_1.5.1.bb:do_compile
    * meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-kli=
bc_2.0.2.bb:do_configure
    * meta-openembedded/meta-multimedia/recipes-connectivity/gupnp/gupnp-ig=
d_0.2.2.bb:do_compile
    * meta-openembedded/meta-multimedia/recipes-connectivity/gupnp/gupnp-to=
ols_0.8.10.bb:do_configure
    * meta-openembedded/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1=
.bb:do_fetch
    * meta-openembedded/meta-multimedia/recipes-multimedia/gstreamer-0.10/g=
streamer_0.10.36.bb:do_compile
    * meta-openembedded/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19=
.21.bb:do_configure
    * meta-openembedded/meta-networking/recipes-connectivity/crda/crda_3.18=
.bb:do_compile
    * meta-openembedded/meta-networking/recipes-connectivity/openconnect/op=
enconnect_git.bb:do_configure
    * meta-openembedded/meta-networking/recipes-protocols/openflow/openflow=
_git.bb:do_configure
    * meta-openembedded/meta-networking/recipes-support/netcat/netcat-openb=
sd_1.105.bb:do_compile
    * meta-openembedded/meta-networking/recipes-support/wireshark/wireshark=
_2.2.4.bb:do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.b=
b:do_configure
    * meta-openembedded/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0=
.bb:do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb:do_=
configure
    * meta-openembedded/meta-oe/recipes-connectivity/networkmanager/network=
manager-openvpn_1.2.6.bb:do_configure
    * meta-openembedded/meta-oe/recipes-connectivity/telepathy/libtelepathy=
_0.3.3.bb:do_compile
    * meta-openembedded/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb:=
do_compile
    * meta-openembedded/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb:do_c=
ompile
    * meta-openembedded/meta-oe/recipes-core/glib-2.0/glibmm_2.50.0.bb:do_c=
onfigure
    * meta-openembedded/meta-oe/recipes-devtools/geany/geany_1.29.bb:do_con=
figure
    * meta-openembedded/meta-oe/recipes-devtools/php/php_7.1.0.bb:do_instal=
l
    * meta-openembedded/meta-oe/recipes-devtools/vala-dbus-binding-tool/val=
a-dbus-binding-tool_git.bb:do_configure
    * meta-openembedded/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb=
:do_compile
    * meta-openembedded/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb:d=
o_configure
    * meta-openembedded/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb:do_=
compile
    * meta-openembedded/meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb:do_c=
ompile
    * meta-openembedded/meta-oe/recipes-gnome/libglade/libglade_2.6.4.bb:do=
_compile
    * meta-openembedded/meta-oe/recipes-graphics/fbida/fbida_2.10.bb:do_com=
pile
    * meta-openembedded/meta-oe/recipes-graphics/fontforge/fontforge_201508=
24.bb:do_compile
    * meta-openembedded/meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb:=
do_compile
    * meta-openembedded/meta-oe/recipes-graphics/wayland/wayland-fits_git.b=
b:do_compile
    * meta-openembedded/meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.3.bb=
:do_configure
    * meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-gla=
mo_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-graphics/xorg-font/font-adobe-100dp=
i_1.0.3.bb:do_configure
    * meta-openembedded/meta-oe/recipes-graphics/xorg-font/font-adobe-utopi=
a-100dpi_1.0.4.bb:do_configure
    * meta-openembedded/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1=
.0.3.bb:do_configure
    * meta-openembedded/meta-oe/recipes-graphics/xorg-font/font-bh-lucidaty=
pewriter-100dpi_1.0.3.bb:do_configure
    * meta-openembedded/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1=
.1.2.bb:do_configure
    * meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.1.5.bb:do_comp=
ile
    * meta-openembedded/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.=
6.bb:do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb:do_co=
nfigure
    * meta-openembedded/meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mix=
er_2.0.1.bb:do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixe=
r_1.2.12.bb:do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.5.=
bb:do_compile
    * meta-openembedded/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb:d=
o_configure
    * meta-openembedded/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.=
14.bb:do_configure
    * meta-openembedded/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.1=
1.bb:do_configure
    * meta-openembedded/meta-oe/recipes-support/ode/ode_0.13.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/pidgin/pidgin_2.11.0.bb:do_=
configure
    * meta-openembedded/meta-oe/recipes-support/poppler/poppler_0.51.0.bb:d=
o_compile
    * meta-openembedded/meta-oe/recipes-support/postgresql/postgresql_9.4.8=
.bb:do_configure
    * meta-openembedded/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.b=
b:do_compile
    * meta-openembedded/meta-oe/recipes-support/udisks/udisks_1.0.5.bb:do_c=
ompile
    * meta-openembedded/meta-oe/recipes-support/udisks/udisks2_2.1.7.bb:do_=
configure
    * meta-openembedded/meta-oe/recipes-support/usb-modeswitch/usb-modeswit=
ch_2.2.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs=
_0.15.bb:do_configure
    * meta-openembedded/meta-python/recipes-connectivity/gateone/gateone_gi=
t.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python3-cryptog=
raphy-vectors_1.6.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python3-ndg-htt=
psclient_0.4.2.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python-cryptogr=
aphy-vectors_1.6.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python-pbr_1.10=
.0.bb:do_compile
    * meta-openembedded/meta-ruby/recipes-devtools/ruby/bundler_git.bb:do_c=
ompile
    * meta-openembedded/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.=
6.bb:do_install
    * meta-openembedded/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.0=
.bb:do_install
    * meta-openembedded/meta-webserver/recipes-webadmin/netdata/netdata_git=
.bb:do_configure
    * meta-openembedded/meta-xfce/recipes-apps/menulibre/menulibre_2.1.3.bb=
:do_compile
    * meta-openembedded/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_=
0.3.4.bb:do_configure
    * meta-openembedded/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.=
bb:do_compile
    * meta-openembedded/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-p=
lugin_1.1.0.bb:do_compile
    * meta-smartphone/meta-fso/recipes-freesmartphone/freesmartphone/fso-gs=
m0710muxd_git.bb:do_compile
    * meta-smartphone/meta-shr/recipes-shr/3rdparty/omext_0.2.bb:do_compile
    * openembedded-core/meta/recipes-devtools/qemu/qemu_2.7.1.bb:do_configu=
re
    * openembedded-core/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb:=
do_compile
    * openembedded-core/meta/recipes-kernel/latencytop/latencytop_0.5.bb:do=
_compile
    * openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.29.bb:do_c=
ompile

=3D=3D=3D common-x86 (4) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb:do_c=
ompile
    * meta-openembedded/meta-oe/recipes-graphics/terminus-font/terminus-fon=
t_4.38.bb:do_compile
    * meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-nou=
veau_1.0.12.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb:=
do_compile

=3D=3D=3D qemuarm (10) =3D=3D=3D
    * meta-openembedded/meta-efl/recipes-devtools/python/python-edbus_1.7.0=
.bb:do_configure
    * meta-openembedded/meta-efl/recipes-efl/e17/exquisite_svn.bb:do_compil=
e
    * meta-openembedded/meta-efl/recipes-efl/efl/elementary_1.15.1.bb:do_co=
mpile
    * meta-openembedded/meta-efl/recipes-efl/efl/libeweather_svn.bb:do_comp=
ile
    * meta-openembedded/meta-oe/recipes-benchmark/pmbw/pmbw_git.bb:do_compi=
le
    * meta-openembedded/meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb:do_comp=
ile
    * meta-openembedded/meta-oe/recipes-support/multipath-tools/multipath-t=
ools_git.bb:do_compile
    * meta-smartphone/meta-shr/recipes-shr/3rdparty/atd-over-fso_0.70.bb:do=
_compile
    * meta-smartphone/meta-shr/recipes-shr/shr/e-wm-config-illume2-shr_git.=
bb:do_compile
    * meta-smartphone/meta-shr/recipes-shr/shr/libshr-glib_git.bb:do_compil=
e

=3D=3D=3D qemux86 (3) =3D=3D=3D
    * meta-qt5/recipes-qt/maliit/maliit-framework-qt5_git.bb:do_compile
    * openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do=
_configure
    * openembedded-core/meta/recipes-extended/cups/cups_2.2.1.bb:do_configu=
re

=3D=3D=3D qemux86_64 (2) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium_52.0.2743.76.bb:do_com=
pile
    * meta-browser/recipes-browser/chromium/chromium-wayland_53.0.2785.143.=
bb:do_compile

=3D=3D=3D Number of failed tasks (300) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 100	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/=
world/pyro/log.world.qemuarm.20170202_205344.log/" style=3D"box-sizing:bord=
er-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.o=
rg/buildlogs/oe/world/pyro/log.world.qemuarm.20170202_205344.log/</a> || <a=
 href=3D"http://errors.yoctoproject.org/Errors/Build/31819/" style=3D"box-s=
izing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.y=
octoproject.org/Errors/Build/31819/</a>
|-
|| qemux86 	|| 97	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/w=
orld/pyro/log.world.qemux86.20170202_021822.log/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.or=
g/buildlogs/oe/world/pyro/log.world.qemux86.20170202_021822.log/</a> || <a =
href=3D"http://errors.yoctoproject.org/Errors/Build/31807/" style=3D"box-si=
zing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.yo=
ctoproject.org/Errors/Build/31807/</a>
|-
|| qemux86_64 	|| 103	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/=
oe/world/pyro/log.world.qemux86-64.20170202_222838.log/" style=3D"box-sizin=
g:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-l=
inux.org/buildlogs/oe/world/pyro/log.world.qemux86-64.20170202_222838.log/<=
/a> || <a href=3D"http://errors.yoctoproject.org/Errors/Build/31830/" style=
=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http:/=
/errors.yoctoproject.org/Errors/Build/31830/</a>
|}

=3D=3D=3D PNBLACKLISTs (115) =3D=3D=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">=3D=3D=3D QA issues (7929) =3D=
=3D=3D
{| class=3Dwikitable
!| Count		||Issue
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||host-user-contaminated
|-
||0	||invalid-pkgconfig
|-
||0	||libdir
|-
||0	||pkgname
|-
||0	||symlink-to-sysroot
|-
||0	||unknown-configure-option
|-
||2	||installed-vs-shipped
|-
||2	||textrel
|-
||5	||file-rdeps
|-
||7920	||version-going-backwards
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.signatures.20170203_155418.log/" style=3D"box-sizing:border-box;word-=
wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.org/buildlogs=
/oe/world/pyro/log.signatures.20170203_155418.log/</a>

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
recipes-browser/chromium/cef3_280796.bb:PNBLACKLIST[cef3] ?=3D &quot;BROKEN=
: fails to build with gcc-6&quot;
meta-openembedded:
meta-efl/recipes-efl/e17/diskio_svn.bb:PNBLACKLIST[diskio] ?=3D &quot;broke=
n: switch to <a href=3D"https://git.enlightenment.org/enlightenment/modules=
/diskio.git/" style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb=
(92,53,102)">https://git.enlightenment.org/enlightenment/modules/diskio.git=
/</a> and fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.e=
dc:58. invalid state name: &#39;off&#39;. &quot;default&quot; state must al=
ways be first.&quot;
meta-efl/recipes-efl/e17/elbow_git.bb:PNBLACKLIST[elbow] ?=3D &quot;Depends=
 on blacklisted webkit-efl&quot;
meta-efl/recipes-efl/e17/elmdentica_svn.bb:PNBLACKLIST[elmdentica] ?=3D &qu=
ot;OLD and depends on broken azy&quot;
meta-efl/recipes-efl/e17/emprint_svn.bb:PNBLACKLIST[emprint] ?=3D &quot;if =
you want to use these modules with E18, then you need to update it to git r=
ecipe fetching newer sources from <a href=3D"http://git.enlightenment.org/a=
pps/emprint.git/" style=3D"box-sizing:border-box;word-wrap:break-word;color=
:rgb(92,53,102)">http://git.enlightenment.org/apps/emprint.git/</a>&quot;
meta-efl/recipes-efl/e17/news_svn.bb:PNBLACKLIST[news] ?=3D &quot;if you wa=
nt to use these modules with E18, then you need to update it to git recipe =
fetching newer sources from <a href=3D"http://git.enlightenment.org/enlight=
enment/modules/news.git/" style=3D"box-sizing:border-box;word-wrap:break-wo=
rd;color:rgb(92,53,102)">http://git.enlightenment.org/enlightenment/modules=
/news.git/</a>&quot;
meta-efl/recipes-efl/e17/rage_svn.bb:PNBLACKLIST[rage] ?=3D &quot;if you wa=
nt to use these modules with E18, then you need to update it to git recipe =
fetching newer sources from  <a href=3D"http://git.enlightenment.org/apps/r=
age.git/" style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,=
53,102)">http://git.enlightenment.org/apps/rage.git/</a>&quot;
meta-efl/recipes-efl/e17/screenshot_svn.bb:PNBLACKLIST[screenshot] ?=3D &qu=
ot;depends on blacklisted emprint&quot;
meta-efl/recipes-efl/efl/azy_svn.bb:PNBLACKLIST[azy] ?=3D &quot;OLD and doe=
sn&#39;t build with gcc-5&quot;
meta-efl/recipes-efl/efl/engrave_svn.bb:PNBLACKLIST[engrave] ?=3D &quot;BRO=
KEN: fails to build with latest oe-core&quot;
meta-efl/recipes-efl/efl/entrance_svn.bb:PNBLACKLIST[entrance] ?=3D &quot;b=
roken: switch to <a href=3D"https://git.enlightenment.org/misc/entrance.git=
" style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)"=
>https://git.enlightenment.org/misc/entrance.git</a> and fix 0.0.4+svnr8207=
0-r7/entrance/data/themes/old/default.edc:678. invalid state name: &#39;def=
aault&#39;. &quot;default&quot; state must always be first.&quot;
meta-efl/recipes-efl/webkit/webkit-efl.inc:PNBLACKLIST[webkit-efl] ?=3D &qu=
ot;Old and unmaintaned fork with many security issues&quot;
meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb:PNBLACKLIST[mcnavi] ?=3D=
 &quot;BROKEN: latest version 0.3.4 is 3 years old and now broken with more=
 strict ejde_cc from efl-1.13&quot;
meta-filesystems/recipes-utils/dmapi/dmapi_2.2.12.bb:PNBLACKLIST[dmapi] ?=
=3D &quot;Depends on broken xfsprogs&quot;
meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb:PNBLACKLIST[xfsdump=
] ?=3D &quot;Depends on broken xfsprogs&quot;
meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb:PNBLACKLIST[epdfview] ?=
=3D &quot;BROKEN: images are not displayed anymore&quot;
meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gn=
ome-mplayer] ?=3D &quot;rdepends on blacklisted mplayer&quot;
meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb:PN=
BLACKLIST[gtk-theme-torturer] ?=3D &quot;BROKEN: gmacros.h:182:53: error: s=
ize of array &#39;_GStaticAssertCompileTimeAssertion_2&#39; is negative&quo=
t;
meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb:PNBLACKLIST[gcalctoo=
l] ?=3D &quot;broken at least since April 2013 <a href=3D"http://permalink.=
gmane.org/gmane.comp.handhelds.openembedded/57920" style=3D"box-sizing:bord=
er-box;word-wrap:break-word;color:rgb(92,53,102)">http://permalink.gmane.or=
g/gmane.comp.handhelds.openembedded/57920</a> and nobody complained, it&#39=
;s also replaced by gnome calculator&quot;
meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb:PNBLACKLIST[gdm] ?=3D &quot;Depe=
nds on broken gnome-panel&quot;
meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.b=
b:PNBLACKLIST[gnome-control-center] ?=3D &quot;Depends on broken gnome-menu=
s&quot;
meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLIST[=
gnome-keyring] ?=3D &quot;This version conflicts with gcr from oe-core&quot=
;
meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb:PNBLACKLIST[gnom=
e-menus] ?=3D &quot;BROKEN: fails to build because of python + conflicts wi=
th gnome-menu3&quot;
meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnom=
e-panel3] ?=3D &quot;CONFLICT: depends on libgweather3 which conflicts with=
 libgweather&quot;
meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnom=
e-panel3] ?=3D &quot;Depends on broken gnome-menus&quot;
meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb:PNBLACKLIST[gnom=
e-panel] ?=3D &quot;Depends on broken libgweather&quot;
meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb:=
PNBLACKLIST[gnome-power-manager] ?=3D &quot;BROKEN: not compatible with cur=
rent libnotify&quot;
meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb:PNBLACKLIST[=
gnome-session] ?=3D &quot;BROKEN: fails to build with gcc-6&quot;
meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb:PNBLACKLIST[gnome-t=
erminal] ?=3D &quot;BROKEN: fails to build with gcc-6&quot;
meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb:PNBLACKLIST[libgnomecu=
ps] ?=3D &quot;Depends on broken libgnomeui&quot;
meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb:PNBLACKLIST[libgnome=
print] ?=3D &quot;Depends on broken libgnomecups&quot;
meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb:PNBLACKLIST[gnumeric] =
?=3D &quot;Depends on broken libgnomeprint&quot;
meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgwea=
ther3] ?=3D &quot;CONFLICT: 876 files are conflicting with libgweather&quot=
;
meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb:PNBLACKLIST[libgwea=
ther] ?=3D &quot;BROKEN: fails to build with gcc-6&quot;
meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb:PNBLACKLIST[nautilus3]=
 ?=3D &quot;BROKEN: fails to build, maybe missing dependency on gnome-deskt=
op-utils.h provider&quot;
meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb:PNBLACKLIST[tasks] ?=3D &quo=
t;Fails to build with gcc-6&quot;
meta-gnome/recipes-gnome/pimlico/tasks_git.bb:PNBLACKLIST[tasks] ?=3D &quot=
;Fails to build with gcc-6&quot;
meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb:PNBLA=
CKLIST[system-tools-backends] ?=3D &quot;does not build with distroless qem=
uarm as reported in &#39;State of bitbake world&#39; thread, nobody volunte=
ered to fix them&quot;
meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?=3D &=
quot;BROKEN: doesn&#39;t build with B!=3DS&quot;
meta-gnome/recipes-support/goffice/goffice_0.10.1.bb:PNBLACKLIST[goffice] ?=
=3D &quot;BROKEN: fails to build with gcc-6&quot;
meta-gnome/recipes-support/tracker/tracker_0.14.2.bb:PNBLACKLIST[tracker] ?=
=3D &quot;BROKEN: fails to build with new binutils-2.27&quot;
meta-gpe/recipes-support/fbreader/fbreader_git.bb:PNBLACKLIST[fbreader] ?=
=3D &quot;BROKEN: fails to build with gcc-6&quot;
meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb:PNBLACKLIST[mkvtoo=
lnix] ?=3D &quot;BROKEN: Failx to build with gcc-5&quot;
meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:PNBLACKLIST=
[coriander] ?=3D &quot;BROKEN: fails to use SDL probably because libsdl-con=
fig was removed, error: unknown type name &#39;SDL_Overlay&#39;&quot;
meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb:PN=
BLACKLIST[renderer-service-upnp] ?=3D &quot;BROKEN: doesn&#39;t build with =
B!=3DS (trying to install rendererconsole.py from ${B} instead of ${S})&quo=
t;
meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg_0.10.13.bb:PNB=
LACKLIST[gst-ffmpeg] ?=3D &quot;Not compatible with currently used ffmpeg 3=
&quot;
meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb:PNBLACKLIST[gs=
t123] ?=3D &quot;gst123 is still &quot;sometimes&quot; using wrong sysroot&=
quot;
meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb:PNBLACKLIST[dnrd] ?=3D =
&quot;BROKEN: dnrd-2.20.3-r0 do_package: QA Issue: dnrd: Files/directories =
were installed but not shipped in any package:&quot;
meta-networking/recipes-kernel/netmap/netmap-modules_git.bb:PNBLACKLIST[net=
map-modules] ?=3D &quot;BROKEN: not compatible with default kernel version =
4.8&quot;
meta-networking/recipes-kernel/netmap/netmap_git.bb:PNBLACKLIST[netmap] ?=
=3D &quot;BROKEN: Tries to build kernel module and fails, either it should =
be disabled or there should be dependency on kernel like in netmap-modules&=
quot;
meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb:PNBLACKLIST[ac=
cel-ppp] ?=3D &quot;BROKEN: fails to build with new binutils-2.27&quot;
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACK=
LIST[lksctp-tools] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39=
;, &#39;ld-is-gold&#39;, &quot;BROKEN: fails to link against sctp_connectx =
symbol&quot;, &#39;&#39;, d)}&quot;
meta-networking/recipes-support/nis/ypbind-mt_2.2.bb:PNBLACKLIST[ypbind-mt]=
 ?=3D &quot;BROKEN: Depends on broken yp-tools&quot;
meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNBLACKLIST[bluez-h=
cidump] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;blu=
ez5&#39;, &#39;bluez5 conflicts with bluez4 and bluez5 is selected in DISTR=
O_FEATURES&#39;, &#39;&#39;, d)}&quot;
meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4] ?=3D=
 &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bluez5&#39;, &#=
39;bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES&#=
39;, &#39;&#39;, d)}&quot;
meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:PNBLACKLIS=
T[gst-plugin-bluetooth] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURE=
S&#39;, &#39;bluez5&#39;, &#39;bluez5 conflicts with bluez4 and bluez5 is s=
elected in DISTRO_FEATURES&#39;, &#39;&#39;, d)}&quot;
meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?=3D =
&quot;BROKEN: depends on broken libftdi&quot;
meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb:PNBLACKLIST[wvdial] ?=3D=
 &quot;Depends on broken wvstreams&quot;
meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb:PNBLACKLIST[wvstream=
s] ?=3D &quot;BROKEN: fails to build with gcc-6&quot;
meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zeroc=
-ice] ?=3D &quot;BROKEN: not compatible with default db version&quot;
meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb:PNBLACKLIST[fakeroot] ?=3D=
 &quot;BROKEN: QA Issue: -dev package contains non-symlink .so&quot;
meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb:PNBLACKLIST[cloud9] ?=3D &quo=
t;Not comatible with current nodejs 0.12, but upstream is working on it for=
 v3&quot;
meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb:PNBLACKLIST[ltp-ddt] ?=3D=
 &quot;BROKEN: fails since last autotools.bbclass changes&quot;
meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb:PNBLACKLIST[package=
kit] ?=3D &quot;BROKEN: depends on old deprecated libopkg which is currentl=
y disabled and will be removed soon&quot;
meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurfac=
e] ?=3D &quot;Needs to be upgraded for compatibility with new libdivecomput=
er&quot;
meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb:PNBLACKLIST[gtkextra] ?=3D=
 &quot;BROKEN: Fails to build with gcc-5&quot;
meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-b=
ox2d] ?=3D &quot;BROKEN: doesn&#39;t build with B!=3DS&quot;
meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?=3D &quot;BRO=
KEN: doesn&#39;t build with B!=3DS (flex: can&#39;t open lex.lex)&quot;
meta-oe/recipes-graphics/slim/slim_1.3.2.bb:PNBLACKLIST[slim] ?=3D &quot;do=
es not build with distroless qemuarm as reported in &#39;State of bitbake w=
orld&#39; thread, nobody volunteered to fix them&quot;
meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[xf8=
6-input-mtev] ?=3D &quot;BROKEN: doesn&#39;t build with B!=3DS (Makefile wi=
thout ${S} in sed call)&quot;
meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:PNBLACKLIS=
T[xf86-video-geode] ?=3D &quot;BROKEN, fails to build&quot;
meta-oe/recipes-kernel/ktap/ktap-module_git.bb:PNBLACKLIST[ktap-module] ?=
=3D &quot;Not compatible with 3.19 kernel&quot;
meta-oe/recipes-kernel/ktap/ktap_git.bb:PNBLACKLIST[ktap] ?=3D &quot;Depend=
s on blacklisted kernel-module-ktapvm&quot;
meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb:PNBLACKLIST[mplayer2] ?=
=3D &quot;Not compatible with currently used ffmpeg 3&quot;
meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtr=
otgps] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;blue=
z5&#39;, &#39;bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO=
_FEATURES&#39;, &#39;&#39;, d)}&quot;
meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb:PNBLACKLIST[gdal] ?=3D &quot=
;BROKEN: fails to build with gcc-5&quot;
meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=3D &quot;${=
@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bluez5&#39;, &#39;bluez5=
 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES&#39;, &#39=
;&#39;, d)}&quot;
meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=3D &quot;${=
@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bluez5&#39;, &#39;bluez5=
 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES&#39;, &#39=
;&#39;, d)}&quot;
meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb:PNBLACKLIST[claws-mail]=
 ?=3D &quot;depends on blacklisted libetpan&quot;
meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb:PNBLAC=
KLIST[claws-plugin-gtkhtml2-viewer] ?=3D &quot;depends on blacklisted claws=
-mail&quot;
meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb:PNBLACKLIST[c=
laws-plugin-mailmbox] ?=3D &quot;depends on blacklisted claws-mail&quot;
meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb:PNBLACKLIST[claw=
s-plugin-rssyl] ?=3D &quot;depends on blacklisted claws-mail&quot;
meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd] ?=
=3D &quot;BROKEN: doesn&#39;t build with B!=3DS&quot;
meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?=3D &quot;q=
emu: uncaught target signal 11 (Segmentation fault) - core dumped&quot;
meta-oe/recipes-support/fftw/benchfft_3.1.bb:PNBLACKLIST[benchfft] ?=3D &qu=
ot;does not build with distroless qemuarm as reported in &#39;State of bitb=
ake world&#39; thread, nobody volunteered to fix them&quot;
meta-oe/recipes-support/iksemel/iksemel_1.4.bb:PNBLACKLIST[iksemel] ?=3D &q=
uot;Not compatible with gnutls version 3.4 currently in oe-core&quot;
meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb:PNBLACKLIST[libdbi=
-drivers] ?=3D &quot;BROKEN: fails to build with gcc-5&quot;
meta-oe/recipes-support/libetpan/libetpan_0.57.bb:PNBLACKLIST[libetpan] ?=
=3D &quot;Not compatible with gnutls version 3.4 currently in oe-core&quot;
meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.4.bb:PNBLACKLIST[open-v=
cdiff] ?=3D &quot;BROKEN: fails to build with gcc-6&quot;
meta-oe/recipes-support/opencv/opencv-samples_2.4.bb:PNBLACKLIST[opencv-sam=
ples] ?=3D &quot;Depends on blacklisted opencv&quot;
meta-oe/recipes-support/opencv/opencv_2.4.bb:PNBLACKLIST[opencv] ?=3D &quot=
;Not compatible with currently used ffmpeg 3&quot;
meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmotif]=
 ?=3D &quot;BROKEN: doesn&#39;t build with B!=3DS&quot;
meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml] =
?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bluez5&#39;=
, &#39;bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATUR=
ES&#39;, &#39;&#39;, d)}&quot;
meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb:PNBLACKLIST[openwbem] ?=
=3D &quot;BROKEN: fails to build with gcc-6&quot;
meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb:PNBLACKLIST[pidgin-otr] =
?=3D &quot;depends on blacklisted pidgin&quot;
meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala=
-terminal] ?=3D &quot;BROKEN: Doesn&#39;t work with B!=3DS, touch: cannot t=
ouch `src/.stamp&#39;: No such file or directory&quot;
meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.36.bb:PNBLACK=
LIST[vboxguestdrivers] ?=3D &quot;BROKEN: not compatible with default kerne=
l version 4.8&quot;
meta-qt5:
meta-smartphone:
meta-fso/recipes-freesmartphone/freesmartphone/libframeworkd-glib_git.bb:PN=
BLACKLIST[libframeworkd-glib] ?=3D &quot;BROKEN: many errors when building =
with gcc-6&quot;
meta-fso/recipes-freesmartphone/freesmartphone/zhone_git.bb:PNBLACKLIST[zho=
ne] ?=3D &quot;rdepends on python-pycairo which was removed&quot;
meta-shr/recipes-shr/3rdparty/advancedcaching_git.bb:PNBLACKLIST[advancedca=
ching] ?=3D &quot;RDEPENDS on python-pygtk was removed from oe-core&quot;
meta-shr/recipes-shr/3rdparty/emtooth2_svn.bb:PNBLACKLIST[emtooth2] ?=3D &q=
uot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bluez5&#39;, &#39;=
bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES&#39;=
, &#39;&#39;, d)}&quot;
meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] =3D &qu=
ot;Doesn&#39;t build after vala upgrade from 0.24.0 to 0.26.1&quot;
meta-shr/recipes-shr/3rdparty/gwaterpas_0.3.bb:PNBLACKLIST[gwaterpas] ?=3D =
&quot;broken: depends on blacklisted fltk&quot;
meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] =3D &quot;Doe=
sn&#39;t build after vala upgrade from 0.24.0 to 0.26.1&quot;
meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] =3D &quot;r=
depends on blacklisted mplayer2&quot;
meta-shr/recipes-shr/3rdparty/jefliks_git.bb:PNBLACKLIST[jefliks] ?=3D &quo=
t;depends on blacklisted iksemel&quot;
meta-shr/recipes-shr/3rdparty/openmoko-gps_svn.bb:PNBLACKLIST[openmoko-gps]=
 ?=3D &quot;RDEPENDS on python-pygtk which was removed from oe-core&quot;
meta-shr/recipes-shr/3rdparty/pisi_0.5.3.bb:PNBLACKLIST[pisi] ?=3D &quot;RD=
EPENDS on python-pygtk which was removed from oe-core&quot;
meta-shr/recipes-shr/3rdparty/podboy_svn.bb:PNBLACKLIST[podboy] ?=3D &quot;=
${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bluez5&#39;, &#39;blue=
z5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES&#39;, &#=
39;&#39;, d)}&quot;
meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] =3D &quot=
;Doesn&#39;t build after vala upgrade from 0.24.0 to 0.26.1&quot;
meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompass] =
=3D &quot;Doesn&#39;t build after vala upgrade from 0.24.0 to 0.26.1&quot;
meta-shr/recipes-shr/games/aceofpenguins_1.4.bb:PNBLACKLIST[aceofpenguins] =
?=3D &quot;BROKEN: fails to build with new binutils-2.27&quot;
meta-shr/recipes-shr/shr/shr-installer_git.bb:PNBLACKLIST[shr-installer] ?=
=3D &quot;Depends on blacklisted packagekit&quot;
meta-webos-ports:
meta-luneos/recipes-luneos/luna-webappmanager/luna-webappmanager.bb:PNBLACK=
LIST[luna-webappmanager] ?=3D &quot;BROKEN: needs to be adapted to new qt-5=
.7&quot;
meta-luneui/recipes-luneui/luna-next/luna-next.bb:PNBLACKLIST[luna-next] ?=
=3D &quot;BROKEN: needs to be adapted to new qtwayland-5.7&quot;
PNBLACKLIST[android-system] =3D &quot;depends on lxc from meta-virtualiazat=
ion which isn&#39;t included in my world builds&quot;
PNBLACKLIST[bigbuckbunny-1080p] =3D &quot;big and doesn&#39;t really need t=
o be tested so much&quot;
PNBLACKLIST[bigbuckbunny-480p] =3D &quot;big and doesn&#39;t really need to=
 be tested so much&quot;
PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doesn&#39;t really need to=
 be tested so much&quot;
PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doesn&#39;t really need to=
 be tested so much&quot;
PNBLACKLIST[tearsofsteel-1080p] =3D &quot;big and doesn&#39;t really need t=
o be tested so much&quot;
PNBLACKLIST[build-appliance-image] =3D &quot;tries to include whole downloa=
ds directory in /home/builder/poky :/&quot;
PNBLACKLIST[linux-yocto-tiny-kexecboot] =3D &quot;does weird sh!t breaking =
other kernels and modules - broken for years&quot;
PNBLACKLIST[linux-yocto-tiny] =3D &quot;does weird sh!t breaking other kern=
els and modules - broken for years&quot;


QA issues by type:
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">count: 0	issue: already-stripped


count: 0	issue: libdir


count: 2	issue: textrel
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">corosync-2.4.0: ELF binary &#39;=
/tmp/work/core2-64-oe-linux/corosync/2.4.0-r0/packages-split/corosync/usr/s=
bin/corosync&#39; has relocations in .text [textrel]
x264-r2491+gitAUTOINC+86b71982e1: ELF binary &#39;/tmp/work/i586-oe-linux/x=
264/r2491+gitAUTOINC+86b71982e1-r0/packages-split/x264/usr/lib/libx264.so.1=
48&#39; has relocations in .text [textrel]


count: 0	issue: build-deps


count: 5	issue: file-rdeps
libmodule-build-perl-0.31: /usr/bin/config_data contained in package libmod=
ule-build-perl requires /tmp/work/armv5te-oe-linux-gnueabi/libmodule-build-=
perl/0.31-r0/recipe-sysroot-native/usr/bin/perl-native/perl.real, but no pr=
oviders found in RDEPENDS_libmodule-build-perl? [file-rdeps]
libmodule-build-perl-0.31: /usr/bin/config_data contained in package libmod=
ule-build-perl requires /tmp/work/core2-64-oe-linux/libmodule-build-perl/0.=
31-r0/recipe-sysroot-native/usr/bin/perl-native/perl.real, but no providers=
 found in RDEPENDS_libmodule-build-perl? [file-rdeps]
libmodule-build-perl-0.31: /usr/bin/config_data contained in package libmod=
ule-build-perl requires /tmp/work/i586-oe-linux/libmodule-build-perl/0.31-r=
0/recipe-sysroot-native/usr/bin/perl-native/perl.real, but no providers fou=
nd in RDEPENDS_libmodule-build-perl? [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert_all.sh containe=
d in package numptyphysics requires /bin/bash, but no providers found in RD=
EPENDS_numptyphysics? [file-rdeps]
ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: /usr/bin/memory-map.sh contained in=
 package ubx-utils requires /bin/bash, but no providers found in RDEPENDS_u=
bx-utils? [file-rdeps]

=C2=A0</pre></pre><div><span style=3D"white-space:pre-wrap;color:rgb(51,51,=
51);font-size:14px">count: 7920	issue: version-going-backwards</span></div>=
<div>... skip 7919 lines...</div><div><pre id=3D"gmail-out" class=3D"gmail-=
console-output" style=3D"box-sizing:border-box;white-space:pre-wrap;word-wr=
ap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-siz=
e:14px"><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:=
break-word;margin-top:0px;margin-bottom:0px">zbar-0.10: Package version for=
 package zbar went backwards which would break package feeds from (0:0.10-r=
0.7 to 0:0.10-r0.0) [version-going-backwards]


count: 0	issue: host-user-contaminated


count: 2	issue: installed-vs-shipped
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">iproute2: 2 installed and not sh=
ipped files. [installed-vs-shipped]
pcmciautils: 4 installed and not shipped files. [installed-vs-shipped]


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
2a309cd bitbake: Bump version to 1.33.0 (develoment version)
not included in master yet:=20
23e5bdc world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
4247681 pkgconfig: fix typo introduced during recent conversion to PACKAGEC=
ONFIG
not included in master yet:=20
d1b416b qemux86: Add identical qemux86copy variant for tests
20d635b sstate-sysroot-cruft.sh: Extend the whitelist
626fce7 recipes: Replace &quot;cp -a&quot; with &quot;cp -R --no-dereferenc=
e --preserve=3Dmode,links&quot;
4f081ef buildhistory.bbclass: metadata-revs show repo parent
8b306e3 metadata-revs: provide more information
c8a611b report-error: Allow to upload reports automatically
48774e1 flex: upgrade to 2.6.3
871cbf7 Revert &quot;flex: upgrade to 2.6.3&quot;
d793134 Revert &quot;flex: upgrade to 2.6.2&quot;

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
5ecbf9b poppler: update to 0.51.0
not included in master yet:=20
d95ddd7 kodi: Add krypton/17.x Jarvis/16.x recipes
5f453ae kodi: Fix build with pic on x86_64
f5962a8 kodi-17: Add packageconfig for lcms support
720a6a6 kodi-17: Fix build with musl
d20fcdd kodi-17: Update to latest
0f5b12c kodi-17: Fix build for qemuarm and update to latest
af36464 opensaf: 5.0.0 -&gt; 5.1.0
693a20a lftp: update to 4.7.5 and change SRC_URI source
c88d8bd tcpdump: upgrade to 4.8.1
d778c85 iscsitarget: Fix call trace of ahash API calling
8b973aa relayd: derive PV from SRCPV
c1ecc8d rsyslog: use atomic builtins to avoid race issue
c28a522 dibbler: fix SRC_URI from ${P} to ${BP}
a3e2a3f fwts: upgrade to 17.01.00 release
45581e1 iscsitarget: fix inconsistent crash while login to iscsi target fro=
m initiator
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">e342498 iscsitarget: use upstrea=
m to build with linux kernel &gt;=3D 4.3
1bba45e iscsitarget: update patch to contain changes required to build with=
 only linux v4.8 and above
5399ec7 picocom: Fix build
e3c8469 onboard: initial add 1.3.0
5cfc356 nginx: update to version 1.11.8
c55d406 python-ipaddress: update to version 1.0.18
4751b71 python-flask-bootstrap: update to version 3.3.7.1
f1e1e05 python-netaddr: update to version 0.7.19
cccfbdb tremor: add (from oe-core)
275101c wireshark: update package to 2.2.4
4ffeaf1 xfce: add dbus-glib-native to DEPENDS to fix do_configure
9a6ea91 luajit: mips and mipsel are 32bit targets too
271bbe0 libgphoto2: remove bash runtime dependency.
306d47a python-selectors34: add new recipe for version 1.1
dbdb2c7 python-serpent: add new recipe for version 1.16
f01190d python-pyro4: update to version 4.53
a4b6d42 python-psutil: upgrade to version 5.0.1
9f6da5e python-click: update to version 6.7
2efbc1e python-cffi: Fix build for per-recipe sysroot.
cd9c5ce python-ndg-httpsclient: Fix build for per recipe sysroot.
90f6b5c python-pyopenssl: Fix build for per recipe sysroot.
56f1ea9 jack: add ARM NEON support for sample conversions
52c7bba fluidsynth: add ARM NEON support for sample interpolation
1fd940f nano: upgrade to 2.7.4
26ce753 remove some more True options to getVar calls
7cc8699 inetutils: register hostname.1 man page as an alternate
7344e23 multipath-tools: fix building of shared objects
280e767 multipath-tools: update to 0.6.4
cb16b43 opencv: Configure freetype via PACKAGECONFIG
576248e nginx: handle systemd service file
709329f libnet-ssleay-perl: fix build error
d7f39e1 python-cffi: Don&#39;t overwrite inherited dependencies
911739d python-pyopenssl: Don&#39;t overwrite inherited dependencies
e13ee3e python3-multidict: make repeated builds work even without sphinx
d607794 python-pyyaml: add dependency on python
dd1fc9a python-pytz: update to 2016.10
c162c91 gst-instruments: add recipe
a2c6b48 vboxguestdrivers: upgrade to 5.1.14 to fix compatibility with 4.9 k=
ernel
aa61b94 geoclue: add missing dependency on gobject-introspection-native

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
9ed8210 qtwayland: fix build without xkbcommon-evdev
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
dac70ab chromium: split patch &#39;Remove hard coded values for CC and CXX&=
#39;
not included in master yet:=20
7e31067 firefox*: add missing dependencies on zip-native and unzip-native

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=
=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
e107290 alsa-utils: rename bbappend to match new version from oe-core
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
a04ef72 android-system: restore mount for hal-droid
not included in master yet: </pre></pre></div><div>=C2=A0</div></div></div>=
</div>

--f403045f4c62ccbd8f0547c640d3--
