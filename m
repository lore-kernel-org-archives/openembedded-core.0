Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id ADDFE60765;
	Fri, 10 Feb 2017 08:28:12 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id k90so14297421wrc.3;
	Fri, 10 Feb 2017 00:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=rReEuupTr/4vZiX+iEGF3nXEQYTkef4nNHgVqsD3K2o=;
	b=gfAYTo9v7slkIvsPso7nsYx9p+k7o4lP2VETsdBBZnMXcrMAn/0OhNSiNufGxR0Woz
	7esb60T8mF+kQzgR//4BcnEc9hGIkLrJZaGQyFUEb7ZSjQY7Y/XC5rlBBa94mKjGYUqv
	eM6ciRtr6QqUUvfvqYGvGJknKp4umJ2AkdIpI2byc5kSaN7RyozJoVwFD4Jz6w+FFD+d
	Al9m6QfcJNyBPR164Jb4fA+XmniJlqXD1MRTZu2oYOVyILv+8Fz/nY+g5/jeA4vSUAfv
	NjlYf+iiiWxTlL0/ihbN7oofBDDIAXxpZnZ9lMNMJTGBEHVLrBlzuRcaSNUFphKB29OL
	Coig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=rReEuupTr/4vZiX+iEGF3nXEQYTkef4nNHgVqsD3K2o=;
	b=IHCr9d5f/eYmOAU++DopJjoZoyMNCXYoXAhzSG17KfT3sev5RIdBJmGrjA3ruacWKW
	WwpPjnt2nWxmTRksqqlzaqehTGJEzNTOYU8/CWTjk+w8OQxvqBYN2J7TKxsyBIspfMlG
	RgkkHisWfoJCBMZJZHinDvIkC6lKdnfHFMZ9LvxGWDnq1Y18Jbxz0b1fTmJlxerbULB3
	owooBgs0+JD+qCWljMosM7K3jXyB4XzScMU/KeVQir5lrW6xzQCZnQwTzp+WqehTFt73
	QhkD0hdxZk0lX1v0E9ni/EimVbWTejEt0vGtjJxxaTQpTFF/n81tcwT2uN97374ZDqTC
	WB7w==
X-Gm-Message-State: AMke39nMnfK/sMMBqj8vQir0K/46YULmp32JdeM+wjMhkvaCWlRfQMqUoEAT04G4lRqOxQ==
X-Received: by 10.223.132.166 with SMTP id 35mr6347217wrg.122.1486715292222;
	Fri, 10 Feb 2017 00:28:12 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id v196sm394234wmv.5.2017.02.10.00.28.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 10 Feb 2017 00:28:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 10 Feb 2017 09:28:11 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20170210082811.GA3021@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: State of bitbake world, Failed tasks 2017-02-08
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
X-List-Received-Date: Fri, 10 Feb 2017 08:28:14 -0000
X-Groupsio-MsgNum: 93123
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline

--zYM0uCDKw75PZbzx
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
||2017-02-08	||96	||100	||100	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		=
||0		||2		||0		||6		||36		||0		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2017-02-08 =3D=3D

INFO: jenkins-job.sh-1.8.15 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20170209_155817.log

=3D=3D=3D common (93) =3D=3D=3D
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
bb:do_fetch
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

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc-utils_2=
=2E0.4.bb:do_compile

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (296) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 96	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/l=
og.world.qemuarm.20170208_014039.log/ || http://errors.yoctoproject.org/Err=
ors/Build/32020/
|-
|| qemux86 	|| 100	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/=
log.world.qemux86.20170208_014038.log/ || http://errors.yoctoproject.org/Er=
rors/Build/32021/
|-
|| qemux86_64 	|| 100	 || http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.world.qemux86-64.20170208_214303.log/ || http://errors.yoctoproject.=
org/Errors/Build/32154/
|}

=3D=3D=3D PNBLACKLISTs (115) =3D=3D=3D

=3D=3D=3D QA issues (44) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||host-user-contaminated
|-
||0	||installed-vs-shipped
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
||2	||textrel
|-
||36	||version-going-backwards
|-
||6	||file-rdeps
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20170208_211921.log/

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
meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd] ?=
=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?=3D "qemu: =
uncaught target signal 11 (Segmentation fault) - core dumped"
meta-oe/recipes-support/fftw/benchfft_3.1.bb:PNBoe/recipes-support/openmoti=
f/openmotif_2.3.3.bb:PNBLACKLIST[openmotif] ?=3D "BROKEN: doesn't build wit=
h B!=3DS"
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
LIST[luna-webappmanager] ?=3D "BROKEN: needs to be adapted to new qt-5.7"
meta-luneui/recipes-luneui/luna-next/luna-next.bb:PNBLACKLIST[luna-next] ?=
=3D "BROKEN: needs to be adapted to new qtwayland-5.7"
PNBLACKLIST[android-system] =3D "depends on lxc from meta-virtualiazation w=
hich isn't included in my world builds"
PNBLACKLIST[bigbuckbunny-1080p] =3D "big and doesn't really need to be test=
ed so much"
PNBLACKLIST[bigbuckbunny-480p] =3D "big aash, but no providers found in RDE=
PENDS_ubx-utils? [file-rdeps]


count: 36	issue: version-going-backwards
latencytop-0.5: Package version for package latencytop-dbg went backwards w=
hich would break package feeds from (0:0.5-r3.49 to 0:0.5-r3.0) [version-go=
ing-backwards]
latencytop-0.5: Package version for package latencytop-dbg went backwards w=
hich would break package feeds from (0:0.5-r3.54 to 0:0.5-r3.0) [version-go=
ing-backwards]
latencytop-0.5: Package version for package latencytop-dbg went backwards w=
hich would break package feeds from (0:0.5-r3.57 to 0:0.5-r3.0) [version-go=
ing-backwards]
latencytop-0.5: Package version for package latencytop-dev went backwards w=
hich would break package feeds from (0:0.5-r3.49 to 0:0.5-r3.0) [version-go=
ing-backwards]
latencytop-0.5: Package version for package latencytop-dev went backwards w=
hich would break package feeds from (0:0.5-r3.54 to 0:0.5-r3.0) [version-go=
ing-backwards]
latencytop-0.5: Package version for package latencytop-dev went backwards w=
hich would break package feeds from (0:0.5-r3.57 to 0:0.5-r3.0) [version-go=
ing-backwards]
latencytop-0.5: Package version for package latencytop-doc went backwards w=
hich would break package feeds from (0:0.5-r3.49 to 0:0.5-r3.0) [version-go=
ing-backwards]
latencytop-0.5: Package version for package latencytop-doc went backwards w=
hich would break package feeds from (0:0.5-r3.54 to 0:0.5-r3.0) [version-go=
ing-backwards]
latencytop-0.5: Package version for package latencytop-doc went backwards w=
hich would break package feeds from (0:0.5-r3.57 to 0:0.5-r3.0) [version-go=
ing-backwards]
latencytop-0.5: Package version for package latencytop-locale went backward=
s which would break package feeds from (0:0.5-r3.49 to 0:0.5-r3.0) [version=
-going-backwards]
latencytop-0.5: Package version for package latencytop-locale went backward=
s which would break package feeds from (0:0.5-r3.54 to 0:0.5-r3.0) [version=
-going-backwards]
latencytop-0.5: Package version for package latencytop-locale went backward=
s which would break package feeds from (0:0.5-r3.57 to 0:0.5-r3.0) [version=
-going-backwards]
latencytop-0.5: Package version for package latencytop-staticdev went backw=
ards which would break package feeds from (0:0.5-r3.49 to 0:0.5-r3.0) [vers=
ion-going-backwards]
latencytop-0.5: Package version for package latencytop-staticdev went backw=
ards which would break package feeds from (0:0.5-r3.54 to 0:0.5-r3.0) [vers=
ion-going-backwards]
latencytop-0.5: Package version for package latencytop-staticdev went backw=
ards which would break package feeds from (0:0.5-r3.57 to 0:0.5-r3.0) [vers=
ion-going-backwards]
latencytop-0.5: Package version for package latencytop went backwards which=
 would break package feeds from (0:0.5-r3.49 to 0:0.5-r3.0) [version-going-=
backwards]
latencytop-0.5: Package version for package latencytop went backwards which=
 would break package feeds from (0:0.5-r3.54 to 0:0.5-r3.0) [version-going-=
backwards]
latencytop-0.5: Package version for package latencytop went backwards which=
 would break package feeds from (0:0.5-r3.57 to 0:0.5-r3.0) [version-going-=
backwards]
pong-clock-1.0: Package version for package pong-clock-dbg went backwards w=
hich would break package feeds from (0:1.0-r0.47 to 0:1.0-r0.0) [version-go=
ing-backwards]
pong-clock-1.0: Package version for package pong-clock-dbg went backwards w=
hich would break package feeds from (0:1.0-r0.50 to 0:1.0-r0.0) [version-go=
ing-backwards]
pong-clock-1.0: Package version for package pong-clock-dbg went backwards w=
hich would break package feeds from (0:1.0-r0.53 to 0:1.0-r0.0) [version-go=
ing-backwardng-clock-staticdev went backwards which would break package fee=
ds from (0:1.0-r0.53 to 0:1.0-r0.0) [version-going-backwards]
pong-clock-1.0: Package version for package pong-clock went backwards which=
 would break package feeds from (0:1.0-r0.47 to 0:1.0-r0.0) [version-going-=
backwards]
pong-clock-1.0: Package version for package pong-clock went backwards which=
 would break package feeds from (0:1.0-r0.50 to 0:1.0-r0.0) [version-going-=
backwards]
pong-clock-1.0: Package version for package pong-clock went backwards which=
 would break package feeds from (0:1.0-r0.53 to 0:1.0-r0.0) [version-going-=
backwards]


count: 0	issue: host-user-contaminated


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
95deeca bitbake: Update version to 1.33.1
not included in master yet:=20
092fbe1 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
68da6c9 oeqa/selftest/pkgdata: use m4 instead of bash
not included in master yet:=20
196bbe7 qemux86: Add identical qemux86copy variant for tests
ca37011 sstate-sysroot-cruft.sh: Extend the whitelist
9e4b23e recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
69e3d9f buildhistory.bbclass: metadata-revs show repo parent
8b232cb metadata-revs: provide more information
65967ae report-error: Allow to upload reports automatically
d8fee89 flex: upgrade to 2.6.3
0f48f8b Revert "flex: upgrade to 2.6.3"
bb4d035 Revert "flex: upgrade to 2.6.2"

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
cd9c5ce python-ndg-httpsc:=20
7e31067 firefox*: add missing dependencies on zip-native and unzip-native

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
b848230 luneos-package: inhibit default deps and limit do_deploy deps
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
a04ef72 android-system: restore mount for hal-droid
not included in master yet:=20
4203314 libhybris: add dependency on wayland-native

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWJ15mgAKCRA3VSO3ZXaA
HMyVAJ9DAcyqe4ZXjshpg37lqovhdPOH+QCeNNISJcMpybpoAEY04yIrVzA5DJA=
=QQBc
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--
