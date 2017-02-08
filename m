Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id E3E9D606D0;
	Wed,  8 Feb 2017 11:37:32 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id i10so8479526wrb.0;
	Wed, 08 Feb 2017 03:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=6Bls0m90RmQQhrFEsHbwfB3s5SjmEWwMW2YLYV/Few4=;
	b=CJzr4DI2HKgd/4hq5hNieB2P4/CsJYwwWlH93kZgAdqqMCMziYT+g0c23V4fqHlZm6
	t12FA57ajs/EXvUQNYVehnGWY8Vln4+HvUAKJZ3Ks4YMWIdYFO1A+95VO1VSmwUdk5kO
	eRgQ+YJnYjpkh5lKrWtLm8pwSUUcp/iwubEf32V81Bha0FOSu4fFBMYg6TbicECA1TvG
	KLj0blR/INJlpjBdVZwXRVW/yrLdRGYfODp8hYBeEAtwbScIxcKr9ECLZKDkv40HeZNl
	kMJC/s7/0Kc74hg3cjkIxZFZJCjRB6fROCl4ucDaRh5ioEdIhR4OHa6hDrWjOjEurcTD
	bAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=6Bls0m90RmQQhrFEsHbwfB3s5SjmEWwMW2YLYV/Few4=;
	b=si1Hb3O1iwMLl/PdpBtIHnKv84SmRSFom5b98w5cfC8Q291k/U6CVu85vunugv2Ki5
	2rCQnh1SqXkwMbX4ehcSOwZ5+9K8m9PQlWHPb+rxbQLA8hspv/i9a78pLR7kTWHpFqiX
	eE7XfsV9kVo5sUGNAgq76bkbJcA4XYEyK/WRTQGtjxvpRiXtkbKd9pY/cbeP80kWQvxO
	tvfhYULf1CEY7+51yKs9q3UypcDrJMZ9Z48QJM09W6fJX3iQEfizgf1zZmr7RrNa3AOK
	Mz/e8v7kpUSTP9lLxAVVR79BzZP34hC1ogysp3UY46YX9y2q3qaQVF7l6B6u211bhiwC
	mFPQ==
X-Gm-Message-State: AIkVDXIhpQET0kOjZM5fFH0sjiqe1wikN/C2PgGwxg/wZgrM1ICRZ2MhJjDh5301qs7tcg==
X-Received: by 10.223.134.218 with SMTP id 26mr18079429wry.104.1486553851367; 
	Wed, 08 Feb 2017 03:37:31 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	i189sm2887244wmg.7.2017.02.08.03.37.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 08 Feb 2017 03:37:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 8 Feb 2017 12:37:31 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20170208113731.GD3276@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: State of bitbake world, Failed tasks 2017-02-07
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
X-List-Received-Date: Wed, 08 Feb 2017 11:37:33 -0000
X-Groupsio-MsgNum: 93006
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZARJHfwaSJQLOEUz"
Content-Disposition: inline

--ZARJHfwaSJQLOEUz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=3D=3D Number of issues - stats =3D=3D
{| class=3D'wikitable'
!|Date		     !!colspan=3D'3'|Failed tasks			    !!colspan=3D'6'|Failed depe=
ncencies			 !!|Signatures		  !!colspan=3D'12'|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||qemuarm||max||min	||qemux86||max||mi=
n	||all 	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||=
version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||u=
nknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	=
||=09
|-
||2017-02-07	||99	||102	||104	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		=
||0		||2		||0		||5		||314		||0		||2		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2017-02-07 =3D=3D

INFO: jenkins-job.sh-1.8.15 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20170208_013442.log

=3D=3D=3D common (96) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox-addon/firefox-addon-webconverger=
_git.bb:do_install
    * meta-openembedded/meta-efl/recipes-devtools/python/python-edbus_1.7.0=
=2Ebb:do_configure
    * meta-openembedded/meta-efl/recipes-efl/e17/exquisite_svn.bb:do_compile
    * meta-openembedded/meta-efl/recipes-efl/efl/elementary_1.15.1.bb:do_co=
mpile
    * meta-openembedded/meta-efl/recipes-efl/efl/libeweather_svn.bb:do_comp=
ile
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
=2Ebb:do_fetch
    * meta-openembedded/meta-multimedia/recipes-multimedia/gstreamer-0.10/g=
streamer_0.10.36.bb:do_compile
    * meta-openembedded/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19=
=2E21.bb:do_configure
    * meta-openembedded/meta-networking/recipes-connectivity/crda/crda_3.18=
=2Ebb:do_compile
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
=2Ebb:do_compile
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
    * meta-openembedded/meta-oe/recipes-devtools/php/php_7.1.0.bb:do_install
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
=2E0.3.bb:do_configure
    * meta-openembedded/meta-oe/recipes-graphics/xorg-font/font-bh-lucidaty=
pewriter-100dpi_1.0.3.bb:do_configure
    * meta-openembedded/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1=
=2E1.2.bb:do_configure
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
=2Ebb:do_configure
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
=2E0.bb:do_compile
    * meta-openembedded/meta-ruby/recipes-devtools/ruby/bundler_git.bb:do_c=
ompile
    * meta-openembedded/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.=
6.bb:do_install
    * meta-openembedded/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.0=
=2Ebb:do_install
    * meta-openembedded/meta-webserver/recipes-webadmin/netdata/netdata_git=
=2Ebb:do_configure
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
    * meta-smartphone/meta-shr/recipes-shr/3rdparty/atd-over-fso_0.70.bb:do=
_compile
    * meta-smartphone/meta-shr/recipes-shr/3rdparty/omext_0.2.bb:do_compile
    * meta-smartphone/meta-shr/recipes-shr/shr/e-wm-config-illume2-shr_git.=
bb:do_compile
    * openembedded-core/meta/recipes-devtools/qemu/qemu_2.8.0.bb:do_configu=
re
    * openembedded-core/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb:=
do_compile
    * openembedded-core/meta/recipes-kernel/latencytop/latencytop_0.5.bb:do=
_compile
    * openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.29.bb:do_c=
ompile

=3D=3D=3D common-x86 (6) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium_52.0.2743.76.bb:do_com=
pile
    * meta-browser/recipes-browser/chromium/chromium-wayland_53.0.2785.143.=
bb:do_compile
    * meta-openembedded/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb:do_c=
ompile
    * meta-openembedded/meta-oe/recipes-graphics/terminus-font/terminus-fon=
t_4.38.bb:do_compile
    * meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-nou=
veau_1.0.12.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb:=
do_compile

=3D=3D=3D qemuarm (3) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-benchmark/pmbw/pmbw_git.bb:do_compi=
le
    * meta-openembedded/meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb:do_comp=
ile
    * meta-openembedded/meta-oe/recipes-support/multipath-tools/multipath-t=
ools_git.bb:do_compile

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-support/dstat/dstat_0.7.3.bb:do_com=
pile

=3D=3D=3D Number of failed tasks (305) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 99	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/l=
og.world.qemuarm.20170206_071426.log/ || http://errors.yoctoproject.org/Err=
ors/Build/31915/
|-
|| qemux86 	|| 102	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/=
log.world.qemux86.20170206_071436.log/ || http://errors.yoctoproject.org/Er=
rors/Build/31917/
|-
|| qemux86_64 	|| 104	 || http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.world.qemux86-64.20170207_021126.log/ || http://errors.yoctoproject.=
org/Errors/Build/31934/
|}

=3D=3D=3D PNBLACKLISTs (115) =3D=3D=3D

=3D=3D=3D QA issues (323) =3D=3D=3D
{| class=3Dwikitable
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
||314	||version-going-backwards
|-
||5	||file-rdeps
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20170207_014707.log/

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
recipes-browser/chromium/cef3_280796.bb:PNBLACKLIST[cef3] ?=3D "BROKEN: fai=
ls to build with gcc-6"
meta-openembedded:
meta-efl/recipes-efl/e17/diskio_svn.bb:PNBLACKLIST[diskio] ?=3D "broken: sw=
itch to https://git.enlightenment.org/enlightenment/modules/diskio.git/ and=
 fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58. in=
valid state name: 'off'. "default" state must always be first."
meta-efl/recipes-efl/e17/elbow_git.bb:PNBLACKLIST[elbow] ?=3D "Depends on b=
lacklisted webkit-efl"
meta-efl/recipes-efl/e17/elmdentica_svn.bb:PNBLACKLIST[elmdentica] ?=3D "OL=
D and depends on broken azy"
meta-efl/recipes-efl/e17/emprint_svn.bb:PNBLACKLIST[emprint] ?=3D "if you w=
ant to use these modules with E18, then you need to update it to git recipe=
 fetching newer sources from http://git.enlightenment.org/apps/emprint.git/"
meta-efl/recipes-efl/e17/news_svn.bb:PNBLACKLIST[news] ?=3D "if you want to=
 use these modules with E18, then you need to update it to git recipe fetch=
ing newer sources from http://git.enlightenment.org/enlightenment/modules/n=
ews.git/"
meta-efl/recipes-efl/e17/rage_svn.bb:PNBLACKLIST[rage] ?=3D "if you want to=
 use these modules with E18, then you need to update it to git recipe fetch=
ing newer sources from  http://git.enlightenment.org/apps/rage.git/"
meta-efl/recipes-efl/e17/screenshot_svn.bb:PNBLACKLIST[screenshot] ?=3D "de=
pends on blacklisted emprint"
meta-efl/recipes-efl/efl/azy_svn.bb:PNBLACKLIST[azy] ?=3D "OLD and doesn't =
build with gcc-5"
meta-efl/recipes-efl/efl/engrave_svn.bb:PNBLACKLIST[engrave] ?=3D "BROKEN: =
fails to build with latest oe-core"
meta-efl/recipes-efl/efl/entrance_svn.bb:PNBLACKLIST[entrance] ?=3D "broken=
: switch to https://git.enlightenment.org/misc/entrance.git and fix 0.0.4+s=
vnr82070-r7/entrance/data/themes/old/default.edc:678. invalid state name: '=
defaault'. "default" state must always be first."
meta-efl/recipes-efl/webkit/webkit-efl.inc:PNBLACKLIST[webkit-efl] ?=3D "Ol=
d and unmaintaned fork with many security issues"
meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb:PNBLACKLIST[mcnavi] ?=3D=
 "BROKEN: latest version 0.3.4 is 3 years old and now broken with more stri=
ct ejde_cc from efl-1.13"
meta-filesystems/recipes-utils/dmapi/dmapi_2.2.12.bb:PNBLACKLIST[dmapi] ?=
=3D "Depends on broken xfsprogs"
meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb:PNBLACKLIST[xfsdump=
] ?=3D "Depends on broken xfsprogs"
meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb:PNBLACKLIST[epdfview] ?=
=3D "BROKEN: images are not displayed anymore"
meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gn=
ome-mplayer] ?=3D "rdepends on blacklisted mplayer"
meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb:PN=
BLACKLIST[gtk-theme-torturer] ?=3D "BROKEN: gmacros.h:182:53: error: size o=
f array '_GStaticAssertCompileTimeAssertion_2' is negative"
meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb:PNBLACKLIST[gcalctoo=
l] ?=3D "broken at least since April 2013 http://permalink.gmane.org/gmane.=
comp.handhelds.openembedded/57920 and nobody complained, it's also replaced=
 by gnome calculator"
meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb:PNBLACKLIST[gdm] ?=3D "Depends o=
n broken gnome-panel"
meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.b=
b:PNBLACKLIST[gnome-control-center] ?=3D "Depends on broken gnome-menus"
meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLIST[=
gnome-keyring] ?=3D "This version conflicts with gcr from oe-core"
meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb:PNBLACKLIST[gnom=
e-menus] ?=3D "BROKEN: fails to build because of python + conflicts with gn=
ome-menu3"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnom=
e-panel3] ?=3D "CONFLICT: depends on libgweather3 which conflicts with libg=
weather"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnom=
e-panel3] ?=3D "Depends on broken gnome-menus"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb:PNBLACKLIST[gnom=
e-panel] ?=3D "Depends on broken libgweather"
meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb:=
PNBLACKLIST[gnome-power-manager] ?=3D "BROKEN: not compatible with current =
libnotify"
meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb:PNBLACKLIST[=
gnome-session] ?=3D "BROKEN: fails to build with gcc-6"
meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb:PNBLACKLIST[gnome-t=
erminal] ?=3D "BROKEN: fails to build with gcc-6"
meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb:PNBLACKLIST[libgnomecu=
ps] ?=3D "Depends on broken libgnomeui"
meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb:PNBLACKLIST[libgnome=
print] ?=3D "Depends on broken libgnomecups"
meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb:PNBLACKLIST[gnumeric] =
?=3D "Depends on broken libgnomeprint"
meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgwea=
ther3] ?=3D "CONFLICT: 876 files are conflicting with libgweather"
meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb:PNBLACKLIST[libgwea=
ther] ?=3D "BROKEN: fails to build with gcc-6"
meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb:PNBLACKLIST[nautilus3]=
 ?=3D "BROKEN: fails to build, maybe missing dependency on gnome-desktop-ut=
ils.h provider"
meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb:PNBLACKLIST[tasks] ?=3D "Fai=
ls to build with gcc-6"
meta-gnome/recipes-gnome/pimlico/tasks_git.bb:PNBLACKLIST[tasks] ?=3D "Fail=
s to build with gcc-6"
meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb:PNBLA=
CKLIST[system-tools-backends] ?=3D "does not build with distroless qemuarm =
as reported in 'State of bitbake world' thread, nobody volunteered to fix t=
hem"
meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?=3D "=
BROKEN: doesn't build with B!=3DS"
meta-gnome/recipes-support/goffice/goffice_0.10.1.bb:PNBLACKLIST[goffice] ?=
=3D "BROKEN: fails to build with gcc-6"
meta-gnome/recipes-support/tracker/tracker_0.14.2.bb:PNBLACKLIST[tracker] ?=
=3D "BROKEN: fails to build with new binutils-2.27"
meta-gpe/recipes-support/fbreader/fbreader_git.bb:PNBLACKLIST[fbreader] ?=
=3D "BROKEN: fails to build with gcc-6"
meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb:PNBLACKLIST[mkvtoo=
lnix] ?=3D "BROKEN: Failx to build with gcc-5"
meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:PNBLACKLIST=
[coriander] ?=3D "BROKEN: fails to use SDL probably because libsdl-config w=
as removed, error: unknown type name 'SDL_Overlay'"
meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb:PN=
BLACKLIST[renderer-service-upnp] ?=3D "BROKEN: doesn't build with B!=3DS (t=
rying to install rendererconsole.py from ${B} instead of ${S})"
meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg_0.10.13.bb:PNB=
LACKLIST[gst-ffmpeg] ?=3D "Not compatible with currently used ffmpeg 3"
meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb:PNBLACKLIST[gs=
t123] ?=3D "gst123 is still "sometimes" using wrong sysroot"
meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb:PNBLACKLIST[dnrd] ?=3D =
"BROKEN: dnrd-2.20.3-r0 do_package: QA Issue: dnrd: Files/directories were =
installed but not shipped in any package:"
meta-networking/recipes-kernel/netmap/netmap-modules_git.bb:PNBLACKLIST[net=
map-modules] ?=3D "BROKEN: not compatible with default kernel version 4.8"
meta-networking/recipes-kernel/netmap/netmap_git.bb:PNBLACKLIST[netmap] ?=
=3D "BROKEN: Tries to build kernel module and fails, either it should be di=
sabled or there should be dependency on kernel like in netmap-modules"
meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb:PNBLACKLIST[ac=
cel-ppp] ?=3D "BROKEN: fails to build with new binutils-2.27"
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACK=
LIST[lksctp-tools] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gol=
d', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
meta-networking/recipes-support/nis/ypbind-mt_2.2.bb:PNBLACKLIST[ypbind-mt]=
 ?=3D "BROKEN: Depends on broken yp-tools"
meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNBLACKLIST[bluez-h=
cidump] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 con=
flicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4] ?=3D=
 "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with =
bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:PNBLACKLIS=
T[gst-plugin-bluetooth] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'blue=
z5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURE=
S', '', d)}"
meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?=3D =
"BROKEN: depends on broken libftdi"
meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb:PNBLACKLIST[wvdial] ?=3D=
 "Depends on broken wvstreams"
meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb:PNBLACKLIST[wvstream=
s] ?=3D "BROKEN: fails to build with gcc-6"
meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zeroc=
-ice] ?=3D "BROKEN: not compatible with default db version"
meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb:PNBLACKLIST[fakeroot] ?=3D=
 "BROKEN: QA Issue: -dev package contains non-symlink .so"
meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb:PNBLACKLIST[cloud9] ?=3D "Not=
 comatible with current nodejs 0.12, but upstream is working on it for v3"
meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb:PNBLACKLIST[ltp-ddt] ?=3D=
 "BROKEN: fails since last autotools.bbclass changes"
meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb:PNBLACKLIST[package=
kit] ?=3D "BROKEN: depends on old deprecated libopkg which is currently dis=
abled and will be removed soon"
meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurfac=
e] ?=3D "Needs to be upgraded for compatibility with new libdivecomputer"
meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb:PNBLACKLIST[gtkextra] ?=3D=
 "BROKEN: Fails to build with gcc-5"
meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-b=
ox2d] ?=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?=3D "BROKEN: =
doesn't build with B!=3DS (flex: can't open lex.lex)"
meta-oe/recipes-graphics/slim/slim_1.3.2.bb:PNBLACKLIST[slim] ?=3D "does no=
t build with distroless qemuarm as reported in 'State of bitbake world' thr=
ead, nobody volunteered to fix them"
meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[xf8=
6-input-mtev] ?=3D "BROKEN: doesn't build with B!=3DS (Makefile without ${S=
} in sed call)"
meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:PNBLACKLIS=
T[xf86-video-geode] ?=3D "BROKEN, fails to build"
meta-oe/recipes-kernel/ktap/ktap-module_git.bb:PNBLACKLIST[ktap-module] ?=
=3D "Not compatible with 3.19 kernel"
meta-oe/recipes-kernel/ktap/ktap_git.bb:PNBLACKLIST[ktap] ?=3D "Depends on =
blacklisted kernel-module-ktapvm"
meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb:PNBLACKLIST[mplayer2] ?=
=3D "Not compatible with currently used ffmpeg 3"
meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtr=
otgps] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conf=
licts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb:PNBLACKLIST[gdal] ?=3D "BROK=
EN: fails to build with gcc-5"
meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=3D "${@bb.u=
tils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 an=
d bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=3D "${@bb.u=
tils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 an=
d bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb:PNBLACKLIST[claws-mail]=
 ?=3D "depends on blacklisted libetpan"
meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb:PNBLAC=
KLIST[claws-plugin-gtkhtml2-viewer] ?=3D "depends on blacklisted claws-mail"
meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb:PNBLACKLIST[c=
laws-plugin-mailmbox] ?=3D "depends on blacklisted claws-mail"
meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb:PNBLACKLIST[claw=
s-plugin-rssyl] ?=3D "depends on blacklisted claws-mail"
meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:utls version 3.4 current=
ly in oe-core"
meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.4.bb:PNBLACKLIST[open-v=
cdiff] ?=3D "BROKEN: fails to build with gcc-6"
meta-oe/recipes-support/opencv/opencv-samples_2.4.bb:PNBLACKLIST[opencv-sam=
ples] ?=3D "Depends on blacklisted opencv"
meta-oe/recipes-support/opencv/opencv_2.4.bb:PNBLACKLIST[opencv] ?=3D "Not =
compatible with currently used ffmpeg 3"
meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmotif]=
 ?=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml] =
?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts w=
ith bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb:PNBLACKLIST[openwbem] ?=
=3D "BROKEN: fails to build with gcc-6"
meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb:PNBLACKLIST[pidgin-otr] =
?=3D "depends on blacklisted pidgin"
meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala=
-terminal] ?=3D "BROKEN: Doesn't work with B!=3DS, touch: cannot touch `src=
/.stamp': No such file or directory"
meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.36.bb:PNBLACK=
LIST[vboxguestdrivers] ?=3D "BROKEN: not compatible with default kernel ver=
sion 4.8"
meta-qt5:
meta-smartphone:
meta-fso/recipes-freesmartphone/freesmartphone/libframeworkd-glib_git.bb:PN=
BLACKLIST[libframeworkd-glib] ?=3D "BROKEN: many errors when building with =
gcc-6"
meta-fso/recipes-freesmartphone/freesmartphone/zhone_git.bb:PNBLACKLIST[zho=
ne] ?=3D "rdepends on python-pycairo which was removed"
meta-shr/recipes-shr/3rdparty/advancedcaching_git.bb:PNBLACKLIST[advancedca=
ching] ?=3D "RDEPENDS on python-pygtk was removed from oe-core"
meta-shr/recipes-shr/3rdparty/emtooth2_svn.bb:PNBLACKLIST[emtooth2] ?=3D "$=
{@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with blu=
ez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] =3D "Do=
esn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/gwaterpas_0.3.bb:PNBLACKLIST[gwaterpas] ?=3D =
"broken: depends on blacklisted fltk"
meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] =3D "Doesn't =
build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] =3D "rdepen=
ds on blacklisted mplayer2"
meta-shr/recipes-shr/3rdparty/jefliks_git.bb:PNBLACKLIST[jefliks] ?=3D "dep=
ends on blacklisted iksemel"
meta-shr/recipes-shr/3rdparty/openmoko-gps_svn.bb:PNBLACKLIST[openmoko-gps]=
 ?=3D "RDEPENDS on python-pygtk which was removed from oe-core"
meta-shr/recipes-shr/3rdparty/pisi_0.5.3.bb:PNBLACKLIST[pisi] ?=3D "RDEPEND=
S on python-pygtk which was removed from oe-core"
meta-shr/recipes-shr/3rdparty/podboy_svn.bb:PNBLACKLIST[podboy] ?=3D "${@bb=
=2Eutils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez=
4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] =3D "Does=
n't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompass] =
=3D "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/games/aceofpenguins_1.4.bb:PNBLACKLIST[aceofpenguins] =
?=3D "BROKEN: fails to build with new binutils-2.27"
meta-shr/recipes-shr/shr/shr-installer_git.bb:PNBLACKLIST[shr-installer] ?=
=3D "Depends on blacklisted packagekit"
meta-webos-ports:
meta-luneos/recipes-luneos/luna-webappmanager/luna-webappmanager.bb:PNBLACK=
LIST[luna-webappmanager] ?=3D "BROKEN: need
PNBLACKLIST[linux-yocto-tiny-kexecboot] =3D "does weird sh!t breaking other=
 kernels and modules - broken for years"
PNBLACKLIST[linux-yocto-tiny] =3D "does weird sh!t breaking other kernels a=
nd modules - broken for years"


QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 2	issue: textrel
corosync-2.4.0: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.4.0-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]
x264-r2491+gitAUTOINC+86b71982e1: ELF binary '/tmp/work/i586-oe-linux/x264/=
r2491+gitAUTOINC+86b71982e1-r0/packages-split/x264/usr/lib/libx264.so.148' =
has relocations in .text [textrel]


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


count: 314	issue: version-going-backwards
cups-2.2.1: Package version for package cups-dbg went backwards which would=
 break package feeds from (0:2.2.1-r0.5 to 0:2.2.1-r0.0) [version-going-bac=
kwards]
cups-2.2.1: Package version for package cups-dev went backwards which would=
 break package feeds from (0:2.2.1-r0.5 to 0:2.2.1-r0.0) [version-going-bac=
kwards]
cups-2.2.1: Package version for package cups-doc went backwards which would=
 break package feeds from (0:2.2.1-r0.5 to 0:2.2.1-r0.0) [version-going-bac=
kwards]
cups-2.2.1: Package version for package cups-libimage went backwards which =
would break package feeds from (0:2.2.1-r0.5 to 0:2.2.1-r0.0) [version-goin=
g-backwards]
cups-2.2.1: Package version for package cups-lib went backwards which would=
 break package feeds from (0:2.2.1-r0.5 to 0:2.2.1-r0.0) [version-going-bac=
kwards]
cups-2.2.1: Package version for package cups-locale-ca went backwards which=
 would break package feeds from (0:2.2.1-r0.5 to 0:2.2.1-r0.0) [version-goi=
ng-backwards]
cups-2.2.1: Package version for package cups-locale-cs went backwards which=
 would break package feeds from (0:2.2.1-r0.5 to 0:2.2.1-r0.0) [version-goi=
ng-backwards]
cups-2.2.1: Package version for package cups-locale-de went backwards which=
 would break package feeds from (0:2.2.1-r0.5 to 0:2.2.1-r0.0) [version-goi=
ng-backwards]
cups-2.2.1: Package version for package cups-locale-es went backwards which=
 would break package feeds from (0:2.2.1-r0.5 to 0:2.2.1-r0.0) [version-goi=
ng-backwards]
cups-2.2.1: Package version for package cups-locale-fr went backwards which=
 would break package feeds from (0:2.2.1-r0.5 to 0:2.2.1-r0.0) [version-goi=
ng-backwards]
cups-2.2n for package cups-staticdev went backwards which would break packa=
ge feeds from (0:2.2.1-r0.5 to 0:2.2.1-r0.0) [version-going-backwards]
cups-2.2.1: Package version for package cups went backwards which would bre=
ak package feeds from (0:2.2.1-r0.5 to 0:2.2.1-r0.0) [version-going-backwar=
ds]
edbus-1.7.9: Package version for package edbus-dbg went backwards which wou=
ld break package feeds from (2:1.7.9-r0.55 to 2:1.7.9-r0.0) [version-going-=
backwards]
edbus-1.7.9: Package version for package edbus-dev went backwards which wou=
ld break package feeds from (2:1.7.9-r0.55 to 2:1.7.9-r0.0) [version-going-=
backwards]
edbus-1.7.9: Package version for package edbus-doc went backwards which wou=
ld break package feeds from (2:1.7.9-r0.55 to 2:1.7.9-r0.0) [version-going-=
backwards]
edbus-1.7.9: Package version for package edbus-ebluez went backwards which =
would break package feeds from (2:1.7.9-r0.55 to 2:1.7.9-r0.0) [version-goi=
ng-backwards]
edbus-1.7.9: Package version for package edbus-econnman went backwards whic=
h would break package feeds from (2:1.7.9-r0.55 to 2:1.7.9-r0.0) [version-g=
oing-backwards]
edbus-1.7.9: Package version for package edbus-edbus went backwards which w=
ould break package feeds from (2:1.7.9-r0.55 to 2:1.7.9-r0.0) [version-goin=
g-backwards]
edbus-1.7.9: Package version for package edbus-ehal went backwards which wo=
uld break package feeds from (2:1.7.9-r0.55 to 2:1.7.9-r0.0) [version-going=
-backwards]
edbus-1.7.9: Package version for package edbus-enm went backwards which wou=
ld break package feeds from (2:1.7.9-r0.55 to 2:1.7.9-r0.0) [version-going-=
backwards]
edbus-1.7.9: Package version for package edbus-enotify went backwards which=
 would break package feeds from (2:1.7.9-r0.55 to 2:1.7.9-r0.0) [version-go=
ing-backwards]
edbus-1.7.9: Package version for package edbus-eofono went backwards which =
would break package feeds from (2:1.7.9-r0.55 to 2:1.7.9-r0.0) [version-goi=
ng-backwards]
edbus-1.7.9: Package version for package edbus-eolian went backwards which =
would break package feeds from (2:1.7.9-r0.55 to 2:1.7.9-r0.0) [version-goi=
ng-backwards]
edbus-1.7.9: Package version for package edbus-eukit went backwards which w=
ould break package feeds from (2:1.7.9-r0.55 to 2:1.7.9-r0.0) [version-goin=
g-backwards]
edbus-1.7.9: Package version for package edbus-locale went backwards which =
would break package feeds from (2:1.7.9-r0.55 to 2:1.7.9-r0.0) [version-goi=
ng-backwards]
edbus-1.7.9: Package version for package edbus-staticdev went backwards whi=
ch would break package feeds from (2:1.7.9-r0.55 to 2:1.7.9-r0.0) [version-=
going-backwards]
edbus-1.7.9: Package version for package edbus-tests went backwards which w=
ould break package feeds from (2:1.7.9-r0.55 to 2:1.7.9-r0.0) [version-goin=
g-backwards]
edbus-1.7.9: Package version for package edbus-themes went backwards which =
would break package feeds from (2:1.7.9-r0.55 to 2:1.7.9-r0.0) [version-goi=
ng-backwards]
edbus-1.7.9: Package version for package edbus went backwards which would b=
reak package feeds from (2:1.7.9-r0.55 to 2:1.7.9-r0.0) [version-going-back=
wards]
efl-1.15.1: Package version for package ecore-audio went backwards which wo=
uld break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-goi=
ng-backwards]
efl-1.15.1: Package version for package ecore-con went backwards which woul=
d break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-going=
-backwards]
efl-1.15.1: Package version for package ecore-evas went backwards which wou=
ld break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-goin=
g-backwards]
efl-1.15.1: Package version for package version for package ecore-input-eva=
s went backwards which would break package feeds from (2:1.15.1-r0.56 to 2:=
1.15.1-r0.0) [version-going-backwards]
efl-1.15.1: Package version for package ecore-input went backwards which wo=
uld break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-goi=
ng-backwards]
efl-1.15.1: Package version for package ecore-ipc went backwards which woul=
d break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-going=
-backwards]
efl-1.15.1: Package version for package ecore went backwards which would br=
eak package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-going-bac=
kwards]
efl-1.15.1: Package version for package ecore-x went backwards which would =
break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-going-b=
ackwards]
efl-1.15.1: Package version for package edje-utils went backwards which wou=
ld break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-goin=
g-backwards]
efl-1.15.1: Package version for package edje went backwards which would bre=
ak package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-going-back=
wards]
efl-1.15.1: Package version for package eet went backwards which would brea=
k package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-going-backw=
ards]
efl-1.15.1: Package version for package eeze went backwards which would bre=
ak package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-going-back=
wards]
efl-1.15.1: Package version for package efl-dbg went backwards which would =
break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-going-b=
ackwards]
efl-1.15.1: Package version for package efl-dev went backwards which would =
break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-going-b=
ackwards]
efl-1.15.1: Package version for package efl-doc went backwards which would =
break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-going-b=
ackwards]
efl-1.15.1: Package version for package efl-eolian went backwards which wou=
ld break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-goin=
g-backwards]
efl-1.15.1: Package version for package efl-locale-ca went backwards which =
would break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-g=
oing-backwards]
efl-1.15.1: Package version for package efl-locale-cs went backwards which =
would break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-g=
oing-backwards]
efl-1.15.1: Package version for package efl-locale-de went backwards which =
would break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-g=
oing-backwards]
efl-1.15.1: Package version for package efl-locale-el went backwards which =
would break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-g=
oing-backwards]
efl-1.15.1: Package version for package efl-locale-eo went backwards which =
would break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-g=
oing-backwards]
efl-1.15.1: Package version for package efl-locale-es went backwards which =
would break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-g=
oing-backwards]
efl-1.15.1: Package version for package efl-locale-fi went backwards which =
would break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-g=
oing-backwards]
efl-1.15.1: Package version for package efl-locale-fr went backwards which =
would break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-g=
oing-backwards]
efl-1.15.1: Package version for package efl-locale-gl went backwards which =
would break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-g=
oing-backwards]
efl-1.15.1: Pa.0) [version-going-backwards]
efl-1.15.1: Package version for package efl-locale-pt went backwards which =
would break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-g=
oing-backwards]
efl-1.15.1: Package version for package efl-locale-ru went backwards which =
would break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-g=
oing-backwards]
efl-1.15.1: Package version for package efl-locale-sl went backwards which =
would break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-g=
oing-backwards]
efl-1.15.1: Package version for package efl-locale-sr went backwards which =
would break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-g=
oing-backwards]
efl-1.15.1: Package version for package efl-locale-tr went backwards which =
would break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-g=
oing-backwards]
efl-1.15.1: Package version for package efl-locale-zh-cn went backwards whi=
ch would break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [versio=
n-going-backwards]
efl-1.15.1: Package version for package efl-staticdev went backwards which =
would break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-g=
oing-backwards]
efl-1.15.1: Package version for package efl-tests went backwards which woul=
d break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-going=
-backwards]
efl-1.15.1: Package version for package efl-themes went backwards which wou=
ld break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-goin=
g-backwards]
efl-1.15.1: Package version for package efl went backwards which would brea=
k package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-going-backw=
ards]
efl-1.15.1: Package version for package efreet-mime went backwards which wo=
uld break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-goi=
ng-backwards]
efl-1.15.1: Package version for package efreet-trash went backwards which w=
ould break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-go=
ing-backwards]
efl-1.15.1: Package version for package efreet went backwards which would b=
reak package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-going-ba=
ckwards]
efl-1.15.1: Package version for package eina went backwards which would bre=
ak package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-going-back=
wards]
efl-1.15.1: Package version for package eio went backwards which would brea=
k package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-going-backw=
ards]
efl-1.15.1: Package version for package eldbus went backwards which would b=
reak package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-going-ba=
ckwards]
efl-1.15.1: Package version for package elua went backwards which would bre=
ak package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-going-back=
wards]
efl-1.15.1: Package version for package embryo-tests went backwards which w=
ould break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-go=
ing-backwards]
efl-1.15.1: Package version for package embryo-utils went backwards which w=
ould break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-go=
ing-backwards]
efl-1.15.1: Package version for package embryo went backwards which would b=
reak package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-going-ba=
ckwards]
efl-1.15.1: Package version for package emotion went backwards which would =
break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-going-b=
ackwards]
efl-1.15.1: Package version for package eo went backwards which would break=
 package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-goin[version=
-going-backwards]
efl-1.15.1: Package version for package evas-engine-software-generic went b=
ackwards which would break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r=
0.0) [version-going-backwards]
efl-1.15.1: Package version for package evas-engine-software-x11 went backw=
ards which would break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0)=
 [version-going-backwards]
efl-1.15.1: Package version for package evas-engine-wayland-egl went backwa=
rds which would break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) =
[version-going-backwards]
efl-1.15.1: Package version for package evas-engine-wayland-shm went backwa=
rds which would break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) =
[version-going-backwards]
efl-1.15.1: Package version for package evas-loader-png went backwards whic=
h would break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version=
-going-backwards]
efl-1.15.1: Package version for package evas went backwards which would bre=
ak package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-going-back=
wards]
efl-1.15.1: Package version for package libeet went backwards which would b=
reak package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-going-ba=
ckwards]
efl-1.15.1: Package version for package libefreet went backwards which woul=
d break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-going=
-backwards]
efl-1.15.1: Package version for package libemotion went backwards which wou=
ld break package feeds from (2:1.15.1-r0.56 to 2:1.15.1-r0.0) [version-goin=
g-backwards]
emotion-generic-players-1.15.0: Package version for package emotion-generic=
-players-dbg went backwards which would break package feeds from (2:1.15.0-=
r0.55 to 2:1.15.0-r0.0) [version-going-backwards]
emotion-generic-players-1.15.0: Package version for package emotion-generic=
-players-dev went backwards which would break package feeds from (2:1.15.0-=
r0.55 to 2:1.15.0-r0.0) [version-going-backwards]
emotion-generic-players-1.15.0: Package version for package emotion-generic=
-players-doc went backwards which would break package feeds from (2:1.15.0-=
r0.55 to 2:1.15.0-r0.0) [version-going-backwards]
emotion-generic-players-1.15.0: Package version for package emotion-generic=
-players-eolian went backwards which would break package feeds from (2:1.15=
=2E0-r0.55 to 2:1.15.0-r0.0) [version-going-backwards]
emotion-generic-players-1.15.0: Package version for package emotion-generic=
-players-locale went backwards which would break package feeds from (2:1.15=
=2E0-r0.55 to 2:1.15.0-r0.0) [version-going-backwards]
emotion-generic-players-1.15.0: Package version for package emotion-generic=
-players-staticdev went backwards which would break package feeds from (2:1=
=2E15.0-r0.55 to 2:1.15.0-r0.0) [version-going-backwards]
emotion-generic-players-1.15.0: Package version for package emotion-generic=
-players-tests went backwards which would break package feeds from (2:1.15.=
0-r0.55 to 2:1.15.0-r0.0) [version-going-backwards]
emotion-generic-players-1.15.0: Package version for package emotion-generic=
-players-themes went backwards which would break package feeds from (2:1.15=
=2E0-r0.55 to 2:1.15.0-r0.0) [version-going-backwards]
emotion-generic-players-1.15.0: Package version for package emotion-generic=
-players went backwards which would break package feeds from (2:1.15.0-r0.5=
5 to 2:1.15.0-r0.0) [version-going-backwards]
evas-generic-loaders-1.15.0: Package version for package evas-generic-loade=
rs-dbg went backwards which would break package feeds from (2:1.15.0-r0.52 =
to 2:1.15.0-r0.0) [version-going-backwards]
evas-generic-loaders-1.15.0: Paccdev went backwards which would break packa=
ge feeds from (2:1.15.0-r0.52 to 2:1.15.0-r0.0) [version-going-backwards]
evas-generic-loaders-1.15.0: Package version for package evas-generic-loade=
rs-tests went backwards which would break package feeds from (2:1.15.0-r0.5=
2 to 2:1.15.0-r0.0) [version-going-backwards]
evas-generic-loaders-1.15.0: Package version for package evas-generic-loade=
rs-themes went backwards which would break package feeds from (2:1.15.0-r0.=
52 to 2:1.15.0-r0.0) [version-going-backwards]
evas-generic-loaders-1.15.0: Package version for package evas-generic-loade=
r-svg went backwards which would break package feeds from (2:1.15.0-r0.52 t=
o 2:1.15.0-r0.0) [version-going-backwards]
evas-generic-loaders-1.15.0: Package version for package evas-generic-loade=
rs went backwards which would break package feeds from (2:1.15.0-r0.52 to 2=
:1.15.0-r0.0) [version-going-backwards]
evas-generic-loaders-1.15.0: Package version for package evas-generic-loade=
r-xcf went backwards which would break package feeds from (2:1.15.0-r0.52 t=
o 2:1.15.0-r0.0) [version-going-backwards]
expedite-1.7.9: Package version for package expedite-dbg went backwards whi=
ch would break package feeds from (0:1.7.9-r0.55 to 0:1.7.9-r0.0) [version-=
going-backwards]
expedite-1.7.9: Package version for package expedite-dev went backwards whi=
ch would break package feeds from (0:1.7.9-r0.55 to 0:1.7.9-r0.0) [version-=
going-backwards]
expedite-1.7.9: Package version for package expedite-doc went backwards whi=
ch would break package feeds from (0:1.7.9-r0.55 to 0:1.7.9-r0.0) [version-=
going-backwards]
expedite-1.7.9: Package version for package expedite-lib went backwards whi=
ch would break package feeds from (0:1.7.9-r0.55 to 0:1.7.9-r0.0) [version-=
going-backwards]
expedite-1.7.9: Package version for package expedite-locale went backwards =
which would break package feeds from (0:1.7.9-r0.55 to 0:1.7.9-r0.0) [versi=
on-going-backwards]
expedite-1.7.9: Package version for package expedite-staticdev went backwar=
ds which would break package feeds from (0:1.7.9-r0.55 to 0:1.7.9-r0.0) [ve=
rsion-going-backwards]
expedite-1.7.9: Package version for package expedite-themes went backwards =
which would break package feeds from (0:1.7.9-r0.55 to 0:1.7.9-r0.0) [versi=
on-going-backwards]
expedite-1.7.9: Package version for package expedite went backwards which w=
ould break package feeds from (0:1.7.9-r0.55 to 0:1.7.9-r0.0) [version-goin=
g-backwards]
foomatic-filters-4.0.17: Package version for package foomatic-filters-dbg w=
ent backwards which would break package feeds from (0:4.0.17-r1.57 to 0:4.0=
=2E17-r1.0) [version-going-backwards]
foomatic-filters-4.0.17: Package version for package foomatic-filters-dev w=
ent backwards which would break package feeds from (0:4.0.17-r1.57 to 0:4.0=
=2E17-r1.0) [version-going-backwards]
foomatic-filters-4.0.17: Package version for package foomatic-filters-doc w=
ent backwards which would break package feeds from (0:4.0.17-r1.57 to 0:4.0=
=2E17-r1.0) [version-going-backwards]
foomatic-filters-4.0.17: Package version for package foomatic-filters-local=
e went backwards which would break package feeds from (0:4.0.17-r1.57 to 0:=
4.0.17-r1.0) [version-going-backwards]
foomatic-filters-4.0.17: Package version for package foomatic-filters-stati=
cdev went backwards which would break package feeds from (0:4.0.17-r1.57 to=
 0:4.0.17-r1.0) [version-going-backwards]
foomatic-filters-4.0.17: Package version for package foomatic-filters went =
backwards which would break package feeds from (0:4.0.17-r1.57 to 0:4.0.17-=
r1.0) [version-going-backwards]
freerdp-1.2.5+gitrAUTOINC+62da9d2eerdp-1.2.5+gitrAUTOINC+62da9d28c6: Packag=
e version for package freerdp-staticdev went backwards which would break pa=
ckage feeds from (0:1.0.0-7677-g62da9d2-r0.63 to 0:1.0.0-7677-g62da9d2-r0.0=
) [version-going-backwards]
freerdp-1.2.5+gitrAUTOINC+62da9d28c6: Package version for package freerdp w=
ent backwards which would break package feeds from (0:1.0.0-7677-g62da9d2-r=
0.63 to 0:1.0.0-7677-g62da9d2-r0.0) [version-going-backwards]
freerdp-1.2.5+gitrAUTOINC+62da9d28c6: Package version for package libfreerd=
p went backwards which would break package feeds from (0:1.0.0-7677-g62da9d=
2-r0.63 to 0:1.0.0-7677-g62da9d2-r0.0) [version-going-backwards]
ghostscript-9.20: Package version for package ghostscript-dbg went backward=
s which would break package feeds from (0:9.20-r0.3 to 0:9.20-r0.0) [versio=
n-going-backwards]
ghostscript-9.20: Package version for package ghostscript-dev went backward=
s which would break package feeds from (0:9.20-r0.3 to 0:9.20-r0.0) [versio=
n-going-backwards]
ghostscript-9.20: Package version for package ghostscript-doc went backward=
s which would break package feeds from (0:9.20-r0.3 to 0:9.20-r0.0) [versio=
n-going-backwards]
ghostscript-9.20: Package version for package ghostscript-locale went backw=
ards which would break package feeds from (0:9.20-r0.3 to 0:9.20-r0.0) [ver=
sion-going-backwards]
ghostscript-9.20: Package version for package ghostscript-staticdev went ba=
ckwards which would break package feeds from (0:9.20-r0.3 to 0:9.20-r0.0) [=
version-going-backwards]
ghostscript-9.20: Package version for package ghostscript went backwards wh=
ich would break package feeds from (0:9.20-r0.3 to 0:9.20-r0.0) [version-go=
ing-backwards]
hplip-3.12.6: Package version for package hplip-backend went backwards whic=
h would break package feeds from (0:3.12.6-r1.55 to 0:3.12.6-r1.0) [version=
-going-backwards]
hplip-3.12.6: Package version for package hplip-cups went backwards which w=
ould break package feeds from (0:3.12.6-r1.55 to 0:3.12.6-r1.0) [version-go=
ing-backwards]
hplip-3.12.6: Package version for package hplip-dbg went backwards which wo=
uld break package feeds from (0:3.12.6-r1.55 to 0:3.12.6-r1.0) [version-goi=
ng-backwards]
hplip-3.12.6: Package version for package hplip-dev went backwards which wo=
uld break package feeds from (0:3.12.6-r1.55 to 0:3.12.6-r1.0) [version-goi=
ng-backwards]
hplip-3.12.6: Package version for package hplip-doc went backwards which wo=
uld break package feeds from (0:3.12.6-r1.55 to 0:3.12.6-r1.0) [version-goi=
ng-backwards]
hplip-3.12.6: Package version for package hplip-filter went backwards which=
 would break package feeds from (0:3.12.6-r1.55 to 0:3.12.6-r1.0) [version-=
going-backwards]
hplip-3.12.6: Package version for package hplip-hal went backwards which wo=
uld break package feeds from (0:3.12.6-r1.55 to 0:3.12.6-r1.0) [version-goi=
ng-backwards]
hplip-3.12.6: Package version for package hplip-locale went backwards which=
 would break package feeds from (0:3.12.6-r1.55 to 0:3.12.6-r1.0) [version-=
going-backwards]
hplip-3.12.6: Package version for package hplip-ppd went backwards which wo=
uld break package feeds from (0:3.12.6-r1.55 to 0:3.12.6-r1.0) [version-goi=
ng-backwards]
hplip-3.12.6: Package version for package hplip-staticdev went backwards wh=
ich would break package feeds from (0:3.12.6-r1.55 to 0:3.12.6-r1.0) [versi=
on-going-backwards]
hplip-3.12.6: Package version for package hplip went backwards which would =
break package feeds from (0:3.12.6-r1.55 to 0:3.12.6-r1.0) [version-going-b=
ackwards]
pkgconfig-0.29.1+gitAUTOINC+87152c05be: Package version for package pkgconf=
ig-dbg went backwards whicent backwards which would break package feeds fro=
m (0:0.29.1+git0+87152c05be-r0.47 to 0:0.29.1+git0+87152c05be-r0.0) [versio=
n-going-backwards]
pkgconfig-0.29.1+gitAUTOINC+87152c05be: Package version for package pkgconf=
ig went backwards which would break package feeds from (0:0.29.1+git0+87152=
c05be-r0.47 to 0:0.29.1+git0+87152c05be-r0.0) [version-going-backwards]
samba-4.4.5: Package version for package libaddns-samba4 went backwards whi=
ch would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-=
going-backwards]
samba-4.4.5: Package version for package libads-samba4 went backwards which=
 would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-go=
ing-backwards]
samba-4.4.5: Package version for package libasn1util-samba4 went backwards =
which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [versi=
on-going-backwards]
samba-4.4.5: Package version for package libauth4-samba4 went backwards whi=
ch would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-=
going-backwards]
samba-4.4.5: Package version for package libauthkrb5-samba4 went backwards =
which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [versi=
on-going-backwards]
samba-4.4.5: Package version for package libauth-samba4 went backwards whic=
h would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-g=
oing-backwards]
samba-4.4.5: Package version for package libauth-sam-reply-samba4 went back=
wards which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) =
[version-going-backwards]
samba-4.4.5: Package version for package libauth-unix-token-samba4 went bac=
kwards which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0)=
 [version-going-backwards]
samba-4.4.5: Package version for package libcharset3-samba4 went backwards =
which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [versi=
on-going-backwards]
samba-4.4.5: Package version for package libcliauth-samba4 went backwards w=
hich would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [versio=
n-going-backwards]
samba-4.4.5: Package version for package libcli-cldap-samba4 went backwards=
 which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [vers=
ion-going-backwards]
samba-4.4.5: Package version for package libcli-ldap-common-samba4 went bac=
kwards which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0)=
 [version-going-backwards]
samba-4.4.5: Package version for package libcli-ldap-samba4 went backwards =
which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [versi=
on-going-backwards]
samba-4.4.5: Package version for package libcli-nbt-samba4 went backwards w=
hich would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [versio=
n-going-backwards]
samba-4.4.5: Package version for package libcli-smb-common-samba4 went back=
wards which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) =
[version-going-backwards]
samba-4.4.5: Package version for package libcli-spoolss-samba4 went backwar=
ds which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [ve=
rsion-going-backwards]
samba-4.4.5: Package version for package libcluster-samba4 went backwards w=
hich would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [versio=
n-going-backwards]
samba-4.4.5: Package version for package libcmdline-credentials-samba4 went=
 backwards which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r=
0.0) [version-going-backwards]
samba-4.4.5: Package version for package libdbwrap-samba4 went backwards wh=
ich would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5- from (0:4.4.5=
-r0.27 to 0:4.4.5-r0.0) [version-going-backwards]
samba-4.4.5: Package version for package libevents-samba4 went backwards wh=
ich would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version=
-going-backwards]
samba-4.4.5: Package version for package libflag-mapping-samba4 went backwa=
rds which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [v=
ersion-going-backwards]
samba-4.4.5: Package version for package libgenrand-samba4 went backwards w=
hich would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [versio=
n-going-backwards]
samba-4.4.5: Package version for package libgensec-samba4 went backwards wh=
ich would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version=
-going-backwards]
samba-4.4.5: Package version for package libgpo-samba4 went backwards which=
 would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-go=
ing-backwards]
samba-4.4.5: Package version for package libgse-samba4 went backwards which=
 would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-go=
ing-backwards]
samba-4.4.5: Package version for package libhttp-samba4 went backwards whic=
h would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-g=
oing-backwards]
samba-4.4.5: Package version for package libidmap-samba4 went backwards whi=
ch would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-=
going-backwards]
samba-4.4.5: Package version for package libinterfaces-samba4 went backward=
s which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [ver=
sion-going-backwards]
samba-4.4.5: Package version for package libiov-buf-samba4 went backwards w=
hich would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [versio=
n-going-backwards]
samba-4.4.5: Package version for package libkrb5samba-samba4 went backwards=
 which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [vers=
ion-going-backwards]
samba-4.4.5: Package version for package libldbsamba-samba4 went backwards =
which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [versi=
on-going-backwards]
samba-4.4.5: Package version for package liblibcli-lsa3-samba4 went backwar=
ds which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [ve=
rsion-going-backwards]
samba-4.4.5: Package version for package liblibcli-netlogon3-samba4 went ba=
ckwards which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0=
) [version-going-backwards]
samba-4.4.5: Package version for package liblibsmb-samba4 went backwards wh=
ich would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version=
-going-backwards]
samba-4.4.5: Package version for package liblibwbclient-old-samba4 went bac=
kwards which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0)=
 [version-going-backwards]
samba-4.4.5: Package version for package libmessages-dgm-samba4 went backwa=
rds which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [v=
ersion-going-backwards]
samba-4.4.5: Package version for package libmessages-util-samba4 went backw=
ards which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [=
version-going-backwards]
samba-4.4.5: Package version for package libmessaging-samba4 went backwards=
 which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [vers=
ion-going-backwards]
samba-4.4.5: Package version for package libmsghdr-samba4 went backwards wh=
ich would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version=
-going-backwards]
samba-4.4.5: Package version for package libmsrpc3-samba4 went backwards wh=
ich would break package feeds from (0ckage feeds from (0:4.4.5-r0.27 to 0:4=
=2E4.5-r0.0) [version-going-backwards]
samba-4.4.5: Package version for package libndr went backwards which would =
break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-going-bac=
kwards]
samba-4.4.5: Package version for package libnetapi went backwards which wou=
ld break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-going-=
backwards]
samba-4.4.5: Package version for package libnetif-samba4 went backwards whi=
ch would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-=
going-backwards]
samba-4.4.5: Package version for package libnet-keytab-samba4 went backward=
s which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [ver=
sion-going-backwards]
samba-4.4.5: Package version for package libnon-posix-acls-samba4 went back=
wards which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) =
[version-going-backwards]
samba-4.4.5: Package version for package libnpa-tstream-samba4 went backwar=
ds which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [ve=
rsion-going-backwards]
samba-4.4.5: Package version for package libnss-info-samba4 went backwards =
which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [versi=
on-going-backwards]
samba-4.4.5: Package version for package libnss-winbind went backwards whic=
h would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-g=
oing-backwards]
samba-4.4.5: Package version for package libnss-wins went backwards which w=
ould break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-goin=
g-backwards]
samba-4.4.5: Package version for package libpopt-samba3-samba4 went backwar=
ds which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [ve=
rsion-going-backwards]
samba-4.4.5: Package version for package libprinting-migrate-samba4 went ba=
ckwards which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0=
) [version-going-backwards]
samba-4.4.5: Package version for package libregistry-samba4 went backwards =
which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [versi=
on-going-backwards]
samba-4.4.5: Package version for package libreplace-samba4 went backwards w=
hich would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [versio=
n-going-backwards]
samba-4.4.5: Package version for package libsamba3-util-samba4 went backwar=
ds which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [ve=
rsion-going-backwards]
samba-4.4.5: Package version for package libsamba-cluster-support-samba4 we=
nt backwards which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5=
-r0.0) [version-going-backwards]
samba-4.4.5: Package version for package libsamba-credentials went backward=
s which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [ver=
sion-going-backwards]
samba-4.4.5: Package version for package libsamba-debug-samba4 went backwar=
ds which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [ve=
rsion-going-backwards]
samba-4.4.5: Package version for package libsamba-errors went backwards whi=
ch would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-=
going-backwards]
samba-4.4.5: Package version for package libsamba-hostconfig went backwards=
 which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [vers=
ion-going-backwards]
samba-4.4.5: Package version for package libsamba-modules-samba4 went backw=
ards which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [=
version-going-backwards]
samba-4.4.5: Package version for package libsamba-net-samba4 went backwards=
 which would break packat backwards which would break package feeds from (0=
:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-going-backwards]
samba-4.4.5: Package version for package libsamba-util went backwards which=
 would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-go=
ing-backwards]
samba-4.4.5: Package version for package libsamdb-common-samba4 went backwa=
rds which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [v=
ersion-going-backwards]
samba-4.4.5: Package version for package libsamdb went backwards which woul=
d break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-going-b=
ackwards]
samba-4.4.5: Package version for package libsecrets3-samba4 went backwards =
which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [versi=
on-going-backwards]
samba-4.4.5: Package version for package libserver-id-db-samba4 went backwa=
rds which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [v=
ersion-going-backwards]
samba-4.4.5: Package version for package libserver-role-samba4 went backwar=
ds which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [ve=
rsion-going-backwards]
samba-4.4.5: Package version for package libshares-samba4 went backwards wh=
ich would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version=
-going-backwards]
samba-4.4.5: Package version for package libsmbclient-raw-samba4 went backw=
ards which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [=
version-going-backwards]
samba-4.4.5: Package version for package libsmbclient went backwards which =
would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-goi=
ng-backwards]
samba-4.4.5: Package version for package libsmbconf went backwards which wo=
uld break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-going=
-backwards]
samba-4.4.5: Package version for package libsmbd-base-samba4 went backwards=
 which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [vers=
ion-going-backwards]
samba-4.4.5: Package version for package libsmbd-conn-samba4 went backwards=
 which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [vers=
ion-going-backwards]
samba-4.4.5: Package version for package libsmbd-shim-samba4 went backwards=
 which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [vers=
ion-going-backwards]
samba-4.4.5: Package version for package libsmbldaphelper-samba4 went backw=
ards which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [=
version-going-backwards]
samba-4.4.5: Package version for package libsmbldap went backwards which wo=
uld break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-going=
-backwards]
samba-4.4.5: Package version for package libsmbpasswdparser-samba4 went bac=
kwards which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0)=
 [version-going-backwards]
samba-4.4.5: Package version for package libsmbregistry-samba4 went backwar=
ds which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [ve=
rsion-going-backwards]
samba-4.4.5: Package version for package libsmb-transport-samba4 went backw=
ards which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [=
version-going-backwards]
samba-4.4.5: Package version for package libsocket-blocking-samba4 went bac=
kwards which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0)=
 [version-going-backwards]
samba-4.4.5: Package version for package libsys-rw-samba4 went backwards wh=
ich would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version=
-going-backwards]
samba-4.4.5: Package version for package libtalloc-report-samba4 went bakag=
e version for package libtorture-samba4 went backwards which would break pa=
ckage feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-going-backwards]
samba-4.4.5: Package version for package libtrusts-util-samba4 went backwar=
ds which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [ve=
rsion-going-backwards]
samba-4.4.5: Package version for package libutil-cmdline-samba4 went backwa=
rds which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [v=
ersion-going-backwards]
samba-4.4.5: Package version for package libutil-reg-samba4 went backwards =
which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [versi=
on-going-backwards]
samba-4.4.5: Package version for package libutil-setid-samba4 went backward=
s which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [ver=
sion-going-backwards]
samba-4.4.5: Package version for package libutil-tdb-samba4 went backwards =
which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [versi=
on-going-backwards]
samba-4.4.5: Package version for package libwbclient went backwards which w=
ould break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-goin=
g-backwards]
samba-4.4.5: Package version for package libwinbind-client-samba4 went back=
wards which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) =
[version-going-backwards]
samba-4.4.5: Package version for package libxattr-tdb-samba4 went backwards=
 which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [vers=
ion-going-backwards]
samba-4.4.5: Package version for package pam-pluginwinbind went backwards w=
hich would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [versio=
n-going-backwards]
samba-4.4.5: Package version for package registry-tools went backwards whic=
h would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-g=
oing-backwards]
samba-4.4.5: Package version for package samba-auth-script went backwards w=
hich would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [versio=
n-going-backwards]
samba-4.4.5: Package version for package samba-auth-unix went backwards whi=
ch would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-=
going-backwards]
samba-4.4.5: Package version for package samba-auth-wbc went backwards whic=
h would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-g=
oing-backwards]
samba-4.4.5: Package version for package samba-base went backwards which wo=
uld break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-going=
-backwards]
samba-4.4.5: Package version for package samba-common went backwards which =
would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-goi=
ng-backwards]
samba-4.4.5: Package version for package samba-ctdb-tests went backwards wh=
ich would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version=
-going-backwards]
samba-4.4.5: Package version for package samba-dbg went backwards which wou=
ld break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-going-=
backwards]
samba-4.4.5: Package version for package samba-dev went backwards which wou=
ld break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-going-=
backwards]
samba-4.4.5: Package version for package samba-doc went backwards which wou=
ld break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-going-=
backwards]
samba-4.4.5: Package version for package samba-dsdb-modules went backwards =
which would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [versi=
on-going-backwards]
samba-4.4.5: Package version for package samba-locale went backwards which =
wousion for package samba-pidl went backwards which would break package fee=
ds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-going-backwards]
samba-4.4.5: Package version for package samba-python went backwards which =
would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-goi=
ng-backwards]
samba-4.4.5: Package version for package samba-staticdev went backwards whi=
ch would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-=
going-backwards]
samba-4.4.5: Package version for package samba-testsuite went backwards whi=
ch would break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-=
going-backwards]
samba-4.4.5: Package version for package samba went backwards which would b=
reak package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-going-back=
wards]
samba-4.4.5: Package version for package smbclient went backwards which wou=
ld break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-going-=
backwards]
samba-4.4.5: Package version for package winbind went backwards which would=
 break package feeds from (0:4.4.5-r0.27 to 0:4.4.5-r0.0) [version-going-ba=
ckwards]
smbnetfs-git: Package version for package smbnetfs-dbg went backwards which=
 would break package feeds from (0:0.5.3a-1-gace1c51-r0.63 to 0:0.5.3a-1-ga=
ce1c51-r0.0) [version-going-backwards]
smbnetfs-git: Package version for package smbnetfs-dev went backwards which=
 would break package feeds from (0:0.5.3a-1-gace1c51-r0.63 to 0:0.5.3a-1-ga=
ce1c51-r0.0) [version-going-backwards]
smbnetfs-git: Package version for package smbnetfs-doc went backwards which=
 would break package feeds from (0:0.5.3a-1-gace1c51-r0.63 to 0:0.5.3a-1-ga=
ce1c51-r0.0) [version-going-backwards]
smbnetfs-git: Package version for package smbnetfs-locale went backwards wh=
ich would break package feeds from (0:0.5.3a-1-gace1c51-r0.63 to 0:0.5.3a-1=
-gace1c51-r0.0) [version-going-backwards]
smbnetfs-git: Package version for package smbnetfs-staticdev went backwards=
 which would break package feeds from (0:0.5.3a-1-gace1c51-r0.63 to 0:0.5.3=
a-1-gace1c51-r0.0) [version-going-backwards]
smbnetfs-git: Package version for package smbnetfs went backwards which wou=
ld break package feeds from (0:0.5.3a-1-gace1c51-r0.63 to 0:0.5.3a-1-gace1c=
51-r0.0) [version-going-backwards]
zbar-0.10: Package version for package zbar-dbg went backwards which would =
break package feeds from (0:0.10-r0.7 to 0:0.10-r0.0) [version-going-backwa=
rds]
zbar-0.10: Package version for package zbar-dev went backwards which would =
break package feeds from (0:0.10-r0.7 to 0:0.10-r0.0) [version-going-backwa=
rds]
zbar-0.10: Package version for package zbar-doc went backwards which would =
break package feeds from (0:0.10-r0.7 to 0:0.10-r0.0) [version-going-backwa=
rds]
zbar-0.10: Package version for package zbar-locale went backwards which wou=
ld break package feeds from (0:0.10-r0.7 to 0:0.10-r0.0) [version-going-bac=
kwards]
zbar-0.10: Package version for package zbar-staticdev went backwards which =
would break package feeds from (0:0.10-r0.7 to 0:0.10-r0.0) [version-going-=
backwards]
zbar-0.10: Package version for package zbar went backwards which would brea=
k package feeds from (0:0.10-r0.7 to 0:0.10-r0.0) [version-going-backwards]


count: 0	issue: host-user-contaminated


count: 2	issue: installed-vs-shipped
iproute2: 2 installed and not shipped files. [installed-vs-shipped]
pcmciautils: 4 installed and not shipped files. [installed-vs-shipped]


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname



=3D=3D Tested changes (not included irt "flex: upgrade to 2.6.3"
0dc4ea3 Revert "flex: upgrade to 2.6.2"

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
5ecbf9b poppler: update to 0.51.0
not included in master yet:=20
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
45581e1 iscsitarget: fix inconsistent crash while login to iscsi target fro=
m initiator
e342498 iscsitarget: use upstream to build with linux kernel >=3D 4.3
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
d7f39e1 python-cffi: Don't overwrite inherited dependencies
911739d python-pyopenssl: Don't overwrite inherited dependencies
e13ee3e python3-multidict: make repeated builds work even without sphinx
d607794 python-pyyaml: add dependency on python
dd1fc9a python-pytz: update to 2016.10
c162c91 gst-instruments: add recipe
a2c6b48 vboxguestdrivers: upgrade to 5.1.14 to fix compatibility with 4.9 k=
ernel
aa61b94 geoclue: add missing dependency on gobject-introspection-native

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
aa6551d qtwebengine: disable generate_character_data
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
dac70ab chromium: split patch 'Remove hard coded values for CC and CXX'
not included in master yet:=20
7e31067 firefox*: add missing dependencies on zip-native and unzip-native

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
41crsion from oe-core
f539bed pidgin: rename bbappend to match new version from oe-core
a06e4ae geoclue: use 2.4.4 version from meta-oe
8d5cebd mesa: add LIC_FILES_CHKSUM for 10.3.8
2f5cd36 libsdl2: use gles2 instead of opengl
f21b824 Mojomail: Switch to own fork for testing
92f80d1 FreeImage: Use test branch for gcc6
edd2a10 pulseaudio: install also 2 new headers mem.h and srbchannel.h to fi=
x pulseaudio-modules-droid build
d60d060 luneos(-package): update for new kernel names
421efd0 README: update to depend on master branches
5917978 qtbase: enable fontconfig
fcce062 qtwayland, qtwebengine: use webOS-ports/master-next branch compatib=
le with 5.7
6a4aeb2 luna-next: Make compatible with Qt 5.7
b953158 qtwayland, qtwebengine: temporary drop bbappend
1f17227 luna-sysservice: Fix build with qt 5.7
884c084 luna-next, luna-webappmanager: temporary drop from image
265d156 packagegroup-luneos-development: drop qt5-opengles2-test
0e56926 libconnman-qt: replace with libconnman-qt5 from meta-qt5
3377551 libqofono: use the recipe from meta-qt5
437bdab glib-2.0: rename bbappend to match new version from oe-core
3cfd08f opkg: rename bbappend to match new version from oe-core
e107290 alsa-utils: rename bbappend to match new version from oe-core
397b848 nodejs-enyo-dev: rename to have native suffix and use SYSROOT_DIRS =
variable
7596b25 qtlocation: drop invalid and unused OE_LUNEOS_ENABLED option
bf4c271 phonesim: fix build with Qt 5.8
c52753e mobile-broadband-provider-info: Fix build with newer oe-core
3204e7e qtbase: enable xkbcommon-evdev for qtwayland

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
a04ef72 android-system: restore mount for hal-droid
not included in master yet:=20
4203314 libhybris: add dependency on wayland-native

--ZARJHfwaSJQLOEUz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWJsC+gAKCRA3VSO3ZXaA
HHfIAJ9JYajqAr6xUe6t5gwkE9ftlD4OYACeMoDntH4V9YlJM7P2EvUsQZ7Sfi0=
=wKbV
-----END PGP SIGNATURE-----

--ZARJHfwaSJQLOEUz--
