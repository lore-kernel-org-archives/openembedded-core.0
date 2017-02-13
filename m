Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f193.google.com (mail-wj0-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0D4D171E39;
	Mon, 13 Feb 2017 13:04:41 +0000 (UTC)
Received: by mail-wj0-f193.google.com with SMTP id ip10so160796wjb.1;
	Mon, 13 Feb 2017 05:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=FpDIj0Ob2DtRKQ4SHpQBPchcEC082cS5Db61MIqtpZI=;
	b=Fw8CorKJQngKur0ELGaw1rLHB5mfbS48roqiRfs4hVCK0I0TjWJmxwxCtwSN9xnSG4
	9bLq1ms0uaWYHbFwoni6r4vhKVeuC9khtgIXKd1gVYFnvMJmh2LwVT5U4HJE+f/QoiGg
	UE06O6lfVtVzdyzy+beV3z4yzzNZIZJSHfboVQM8NXCWjhVpoltre+2n6VW2e4XUNDxh
	RFah3g9+CmYpAKs20bC4LUucSsS4OX2DvvsVNPqhbS0UGW9Ef6pwU5TAEJQIzmViYJTs
	+/0s9pxIfhfwtBO6h1CpZILFIMVqfY82AlywNkhudAGHPJmbttYJqq3fXAQCXTvLC3VW
	iVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=FpDIj0Ob2DtRKQ4SHpQBPchcEC082cS5Db61MIqtpZI=;
	b=FfRvLUVFWI9c/HDxbohL+v6LyKj8oaEm5I5zyEw+oxhOIpfBe9E2+fM9db7h+WeKMx
	MUqOx4Ufkxv1rA7cbl6vaGY34icHSZuzXml4RIdB1lmiEvWrxNyamHW3wzlbe3K9Nkz/
	s2XgPEqhNymwZqpjUlHvl8EW2xvii8Ng3zfDheZOwPI+N0IpBOf4uiwRDkIoLeG4zhko
	6JMXfya9LTP0rTk9R2m6bAGpbxYjRWLFrZz56lE7/MNKLUqyb/fZ/OO0PwpFmWB/NjyI
	g6jvWiViTqZ6lSxu6xkIYYzr4k06f7573eHXpiyAcV0FSEOUvpr80fr51citmFXvTGjA
	Zj7A==
X-Gm-Message-State: AMke39mQxnpKcfiaY6qw9qQGfPtMpSE77BAbbW+sWB00xfctNbnO2H2eWykc32OyCIqw9Q==
X-Received: by 10.28.143.204 with SMTP id r195mr18563526wmd.32.1486991079672; 
	Mon, 13 Feb 2017 05:04:39 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	y39sm10783981wry.55.2017.02.13.05.04.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 13 Feb 2017 05:04:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 13 Feb 2017 14:04:38 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20170213130438.GA3280@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: State of bitbake world, Failed tasks 2017-02-11
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
X-List-Received-Date: Mon, 13 Feb 2017 13:04:43 -0000
X-Groupsio-MsgNum: 93226
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline

--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

100+ PNBLACKLISTs later and more to come today

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
||2017-02-11	||10	||13	||12	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||=
0		||1		||0		||3		||455		||0		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2017-02-11 =3D=3D

INFO: jenkins-job.sh-1.8.15 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20170213_020340.log

=3D=3D=3D common (10) =3D=3D=3D
    * meta-openembedded/meta-gnome/recipes-extended/gparted/gparted_0.27.0.=
bb:do_configure
    * meta-openembedded/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-d=
isk-utility_2.32.0.bb:do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/gnome-system-monitor/gnome=
-system-monitor_2.28.2.bb:do_compile
    * meta-openembedded/meta-networking/recipes-protocols/openflow/openflow=
_1.0.bb:do_configure
    * meta-openembedded/meta-oe/recipes-devtools/php/php_5.6.26.bb:do_insta=
ll
    * meta-openembedded/meta-oe/recipes-devtools/vala-dbus-binding-tool/val=
a-dbus-binding-tool_0.4.0.bb:do_configure
    * meta-openembedded/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8=
=2E0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.=
bb:do_fetch
    * meta-openembedded/meta-oe/recipes-support/postgresql/postgresql_9.4.1=
0.bb:do_configure
    * meta-smartphone/meta-fso/recipes-freesmartphone/freesmartphone/fso-gs=
m0710muxd_git.bb:do_compile

=3D=3D=3D common-x86 (2) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium_52.0.2743.76.bb:do_com=
pile
    * meta-browser/recipes-browser/chromium/chromium-wayland_53.0.2785.143.=
bb:do_compile

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-openembedded/meta-python/recipes-devtools/python/python3-pycrypt=
o_2.6.1.bb:do_fetch

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (35) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 10	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/l=
og.world.qemuarm.20170211_153002.log/ ||=20
|-
|| qemux86 	|| 13	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/l=
og.world.qemux86.20170211_083606.log/ || http://errors.yoctoproject.org/Err=
ors/Build/32275/
|-
|| qemux86_64 	|| 12	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.world.qemux86-64.20170211_160237.log/ || http://errors.yoctoproject.o=
rg/Errors/Build/32319/
|}

=3D=3D=3D PNBLACKLISTs (418) =3D=3D=3D

=3D=3D=3D QA issues (459) =3D=3D=3D
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
||1	||textrel
|-
||3	||file-rdeps
|-
||455	||version-going-backwards
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20170211_173129.log/

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
recipes-browser/chromium/cef3_280796.bb:PNBLACKLIST[cef3] ?=3D "BROKEN: fai=
ls to build with gcc-6"
meta-openembedded:
meta-efl/recipes-devtools/python/python-edbus_1.7.0.bb:PNBLACKLIST[python-e=
dbus] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/D=
etails/130600/"
meta-efl/recipes-devtools/python/python-efl_1.15.0.bb:PNBLACKLIST[python-ef=
l] ?=3D "Depends on blacklisted elementary"
meta-efl/recipes-devtools/python/python-efl_git.bb:PNBLACKLIST[python-efl] =
?=3D "Depends on blacklisted elementary"
meta-efl/recipes-efl/e17/cpu_svn.bb:PNBLACKLIST[cpu] ?=3D "Depends on black=
listed e-wm"
meta-efl/recipes-efl/e17/diskio_svn.bb:PNBLACKLIST[diskio] ?=3D "broken: sw=
itch to https://git.enlightenment.org/enlightenment/modules/diskio.git/ and=
 fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58. in=
valid state name: 'off'. "default" state must always be first."
meta-efl/recipes-efl/e17/e-tasks_git.bb:PNBLACKLIST[e-tasks] ?=3D "Depends =
on blacklisted elementary"
meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb:PNBLACKLIST[e-wm-theme-b=
-and-w] ?=3D "Runtime depends on blacklisted e-wm"
meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb:PNBLACKLIST[e-wm-theme-b=
-and-w] ?=3D "Runtime depends on blacklisted e-wm-theme-b-and-w"
meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb:PNBLACKLIST[e-wm-theme-b=
-and-w] ?=3D "Runtime depends on blacklisted e-wm-theme-b-and-w-dev"
meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb:PNBLACKLIST[e-wm=
-theme-illume-efenniht] ?=3D "Runtime depends on blacklisted e-wm"
meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb:PNBLACKLIST[e-wm=
-theme-illume-efenniht] ?=3D "Runtime depends on blacklisted e-wm-theme-ill=
ume-efenniht"
meta-efl/recipes-efl/e17/e-wm_0.18.8.bb:PNBLACKLIST[e-wm] ?=3D "Depends on =
blacklisted elementary"
meta-efl/recipes-efl/e17/e-wm_0.19.10.bb:PNBLACKLIST[e-wm] ?=3D "Depends on=
 blacklisted elementary"
meta-efl/recipes-efl/e17/e-wm_git.bb:PNBLACKLIST[e-wm] ?=3D "Depends on bla=
cklisted elementary"
meta-efl/recipes-efl/e17/edje-viewer_svn.bb:PNBLACKLIST[edje-viewer] ?=3D "=
Depends on blacklisted elementary"
meta-efl/recipes-efl/e17/elbow_git.bb:PNBLACKLIST[elbow] ?=3D "Depends on b=
lacklisted webkit-efl"
meta-efl/recipes-efl/e17/elfe_git.bb:PNBLACKLIST[elfe] ?=3D "Depends on bla=
cklisted elementary"
meta-efl/recipes-efl/e17/elmdentica_svn.bb:PNBLACKLIST[elmdentica] ?=3D "OL=
D and depends on broken azy"
meta-efl/recipes-efl/e17/emprint_svn.bb:PNBLACKLIST[emprint] ?=3D "if you w=
ant to use these modules with E18, then you need to update it to git recipe=
 fetching newer sources from http://git.enlightenment.org/apps/emprint.git/"
meta-efl/recipes-efl/e17/enjoy_git.bb:PNBLACKLIST[enjoy] ?=3D "Depends on b=
lacklisted elementary"
meta-efl/recipes-efl/e17/ephoto_svn.bb:PNBLACKLIST[ephoto] ?=3D "Depends on=
 blacklisted elementary"
meta-efl/recipes-efl/e17/exalt-client_svn.bb:PNBLACKLIST[exalt-client] ?=3D=
 "Depends on blacklisted elementary"
meta-efl/recipes-efl/e17/exalt_svn.bb:PNBLACKLIST[exalt] ?=3D "Depends on b=
lacklisted elementary"
meta-efl/recipes-efl/e17/exquisite_svn.bb:PNBLACKLIST[exquisite] ?=3D "Fail=
s to build with RSS http://errors.yoctoproject.org/Errors/Details/130619/"
meta-efl/recipes-efl/e17/flame_svn.bb:PNBLACKLIST[flame] ?=3D "Depends on b=
lacklisted e-wm"
meta-efl/recipes-efl/e17/forecasts_svn.bb:PNBLACKLIST[forecasts] ?=3D "Depe=
nds on blacklisted e-wm"
meta-efl/recipes-efl/e17/news_svn.bb:PNBLACKLIST[news] ?=3D "if you want to=
 use these modules with E18, then you need to update it to git recipe fetch=
ing newer sources from http://git.enlightenment.org/enlightenment/modules/n=
ews.git/"
meta-efl/recipes-efl/e17/places_svn.bb:PNBLACKLIST[places] ?=3D "Depends on=
 blacklisted e-wm"
meta-efl/recipes-efl/e17/rage_svn.bb:PNBLACKLIST[rage] ?=3D "if you want to=
 use these modules with E18, then you need to update it to git recipe fetch=
ing newer sources from  http://git.enlightenment.org/apps/rage.git/"
meta-efl/recipes-efl/e17/rain_svn.bb:PNBLACKLIST[rain] ?=3D "Depends on bla=
cklisted e-wm"
meta-efl/recipes-efl/e17/screenshot_svn.bb:PNBLACKLIST[screenshot] ?=3D "de=
pends on blacklisted emprint"
meta-efl/recipes-efl/e17/terminology_0.9.1.bb:PNBLACKLIST[terminology] ?=3D=
 "Depends on blacklisted elementary"
meta-efl/recipes-efl/e17/uptime_svn.bb:PNBLACKLIST[uptime] ?=3D "Depends on=
 blacklisted e-wm"
meta-efl/recipes-efl/efl/azy_svn.bb:PNBLACKLIST[azy] ?=3D "OLD and doesn't =
build with gcc-5"
meta-efl/recipes-efl/efl/elementary_1.15.1.bb:PNBLACKLIST[elementary] ?=3D =
"Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/1305=
84/"
meta-efl/recipes-efl/efl/engrave_svn.bb:PNBLACKLIST[engrave] ?=3D "BROKEN: =
fails to build with latest oe-core"
meta-efl/recipes-efl/efl/entrance_svn.bb:PNBLACKLIST[entrance] ?=3D "broken=
: switch to https://git.enlightenment.org/misc/entrance.git and fix 0.0.4+s=
vnr82070-r7/entrance/data/themes/old/default.edc:678. invalid state name: '=
defaault'. "default" state must always be first."
meta-efl/recipes-efl/efl/epdf_svn.bb:PNBLACKLIST[epdf] ?=3D "Depends on bla=
cklisted poppler"
meta-efl/recipes-efl/efl/libeflvala_svn.bb:PNBLACKLIST[libeflvala] ?=3D "De=
pends on blacklisted elementary"
meta-efl/recipes-efl/efl/libeweather_svn.bb:PNBLACKLIST[libeweather] ?=3D "=
Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/13064=
9/"
meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb:PNBLACKLIST[pack=
agegroup-efl-sdk] ?=3D "Runtime depends on blacklisted elementary-dev"
meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.b=
b:PNBLACKLIST[packagegroup-efl-standalone-sdk-target] ?=3D "Runtime depends=
 on blacklisted elementary-dev"
meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb:PNBLACKLIST[p=
ackagegroup-x11-illume] ?=3D "Runtime depends on blacklisted e-wm"
meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb:PNBLACKLIST[p=
ackagegroup-x11-illume] ?=3D "Runtime depends on blacklisted e-wm-config-mo=
bile"
meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb:PNBLACKLIST[p=
ackagegroup-x11-illume] ?=3D "Runtime depends on blacklisted e-wm-theme-def=
ault"
meta-efl/recipes-efl/webkit/webkit-efl.inc:PNBLACKLIST[webkit-efl] ?=3D "Ol=
d and unmaintaned fork with many security issues"
meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb:PNBLACKLIST[mcnavi] ?=3D=
 "BROKEN: latest version 0.3.4 is 3 years old and now broken with more stri=
ct ejde_cc from efl-1.13"
meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb:PNBL=
ACKLIST[unionfs-fuse] ?=3D "Fails to build with RSS http://errors.yoctoproj=
ect.org/Errors/Details/130648/"
meta-filesystems/recipes-utils/dmapi/dmapi_2.2.12.bb:PNBLACKLIST[dmapi] ?=
=3D "Depends on broken xfsprogs"
meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb:PNBLACKLIST[xfsdump=
] ?=3D "Depends on broken xfsprogs"
meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb:PNBLACKLIST[xfspr=
ogs] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/De=
tails/130663/"
meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb:PNBLACKLIST[cheese] ?=3D "D=
epends on blacklisted gstreamer"
meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb:PNBLACKLIST[cheese] ?=3D "D=
epends on blacklisted gnome-desktop"
meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb:PNBLACKLIST[epdfview] ?=
=3D "BROKEN: images are not displayed anymore"
meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb:PNBLACKLIST[gmtk] ?=3D =
"Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/1306=
61/"
meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gn=
ome-mplayer] ?=3D "rdepends on blacklisted mplayer"
meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb:PN=
BLACKLIST[gtk-theme-torturer] ?=3D "BROKEN: gmacros.h:182:53: error: size o=
f array '_GStaticAssertCompileTimeAssertion_2' is negative"
meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb:PNBLACKLIST[abiword] ?=3D=
 "Depends on blacklisted libglade"
meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb:PNBLACKLIST[libbonobo] =
?=3D "Depends on blacklisted orbit2"
meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb:PNBLACKLIST[libbonobo=
ui] ?=3D "Depends on blacklisted libglade"
meta-gnome/recipes-gnome/devilspie/devilspie2_0.33.bb:PNBLACKLIST[devilspie=
2] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/Deta=
ils/130666/"
meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb:PNBLACKLIST[evolu=
tion-data-server] ?=3D "Depends on blacklisted libglade"
meta-gnome/recipes-gnome/evince/evince_3.18.2.bb:PNBLACKLIST[evince] ?=3D "=
Depends on blacklisted poppler"
meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb:PNBLACKLIST[gcalctoo=
l] ?=3D "broken at least since April 2013 http://permalink.gmane.org/gmane.=
comp.handhelds.openembedded/57920 and nobody complained, it's also replaced=
 by gnome calculator"
meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb:PNBLACKLIST[gdm] ?=3D "Depends o=
n broken gnome-panel"
meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb:PNBLACKLIST[gedit] ?=3D "Dep=
ends on blacklisted gtksourceview2"
meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb:PNBL=
ACKLIST[gnome-backgrounds] ?=3D "Fails to build with RSS http://errors.yoct=
oproject.org/Errors/Details/130647/"
meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.b=
b:PNBLACKLIST[gnome-control-center] ?=3D "Depends on broken gnome-menus"
meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb:PNBLACKLIST[=
gnome-desktop] ?=3D "Fails to build with RSS http://errors.yoctoproject.org=
/Errors/Details/130595/"
meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLIST[=
gnome-keyring] ?=3D "This version conflicts with gcr from oe-core"
meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb:PNBLACKLIST[gnom=
e-menus] ?=3D "BROKEN: fails to build because of python + conflicts with gn=
ome-menu3"
meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data_2.18.0.bb:PNBLACKL=
IST[gnome-mime-data] ?=3D "Fails to build with RSS http://errors.yoctoproje=
ct.org/Errors/Details/130589/"
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
meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1=
=2Ebb:PNBLACKLIST[gnome-settings-daemon] ?=3D "Depends on blacklisted libgn=
omekbd"
meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1=
=2Ebb:PNBLACKLIST[gnome-settings-daemon] ?=3D "Depends on blacklisted gnome=
-desktop"
meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb:PNBLACKLIST[gnome-vf=
s] ?=3D "Depends on blacklisted gnome-mime-data"
meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb:PNBLACKLIST[gnome-t=
erminal] ?=3D "BROKEN: fails to build with gcc-6"
meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb:PNBLACKLIST[libgnomecu=
ps] ?=3D "Depends on broken libgnomeui"
meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb:PNBLACKLIST[libgnome=
print] ?=3D "Depends on broken libgnomecups"
meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb:PNBLACKLIST[gnumeric] =
?=3D "Depends on broken libgnomeprint"
meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb:PNBLACKLIST[gthumb] ?=3D "=
Depends on blacklisted gstreamer"
meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb:PNBLACKLIST[gtk-=
engines] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Error=
s/Details/130602/"
meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb:PNBLACKLIST=
[gtksourceview2] ?=3D "Fails to build with RSS http://errors.yoctoproject.o=
rg/Errors/Details/130597/"
meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgwea=
ther3] ?=3D "CONFLICT: 876 files are conflicting with libgweather"
meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb:PNBLACKLIST[libgwea=
ther] ?=3D "BROKEN: fails to build with gcc-6"
meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb:PNBLACKLIST[libgnome] =
?=3D "Depends on blacklisted gnome-vfs"
meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb:PNBLACKLIST[libgnome] =
?=3D "Depends on blacklisted esound"
meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb:PNBLACKLIST[libg=
nomecanvas] ?=3D "Depends on blacklisted libglade"
meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb:PNBLACKLIST[libgnom=
ekbd] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/D=
etails/130608/"
meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb:PNBLACKLIST[libgnome=
ui] ?=3D "Depends on blacklisted libbonoboui"
meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb:PNBLACKLIST[libgnome=
ui] ?=3D "Depends on blacklisted libgnomecanvas"
meta-gnome/recipes-gnome/libidl/libidl-native_0.8.14.bb:PNBLACKLIST[libidl-=
native] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors=
/Details/130582/"
meta-gnome/recipes-gnome/libidl/libidl_0.8.14.bb:PNBLACKLIST[libidl] ?=3D "=
Depends on blacklisted libidl-native"
meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb:PNBLACKLIST[nautilus3]=
 ?=3D "BROKEN: fails to build, maybe missing dependency on gnome-desktop-ut=
ils.h provider"
meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb:PNBLACKLIST[nautilus] =
?=3D "Depends on blacklisted gnome-desktop"
meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb:PNBLACKLIST[orbit2] ?=3D =
"Depends on blacklisted libidl-native"
meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb:PNBLACKLIST[contacts] ?=3D=
 "Depends on blacklisted evolution-data-server"
meta-gnome/recipes-gnome/pimlico/contacts_git.bb:PNBLACKLIST[contacts] ?=3D=
 "Depends on blacklisted evolution-data-server"
meta-gnome/recipes-gnome/pimlico/dates_git.bb:PNBLACKLIST[dates] ?=3D "Depe=
nds on blacklisted libglade"
meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb:PNBLACKLIST[tasks] ?=3D "Fai=
ls to build with gcc-6"
meta-gnome/recipes-gnome/pimlico/tasks_git.bb:PNBLACKLIST[tasks] ?=3D "Fail=
s to build with gcc-6"
meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb:PNBLA=
CKLIST[system-tools-backends] ?=3D "does not build with distroless qemuarm =
as reported in 'State of bitbake world' thread, nobody volunteered to fix t=
hem"
meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb:PNBLACKLIST[gnome-th=
emes] ?=3D "Depends on blacklisted gtk-engines"
meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?=3D "=
BROKEN: doesn't build with B!=3DS"
meta-gnome/recipes-support/florence/florence_0.5.4.bb:PNBLACKLIST[florence]=
 ?=3D "Depends on blacklisted libglade"
meta-gnome/recipes-support/florence/florence_0.5.4.bb:PNBLACKLIST[florence]=
 ?=3D "Depends on blacklisted gstreamer"
meta-gnome/recipes-support/goffice/goffice_0.10.1.bb:PNBLACKLIST[goffice] ?=
=3D "BROKEN: fails to build with gcc-6"
meta-gnome/recipes-support/onboard/onboard_1.3.0.bb:PNBLACKLIST[onboard] ?=
=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/=
130637/"
meta-gnome/recipes-support/tracker/tracker_0.14.2.bb:PNBLACKLIST[tracker] ?=
=3D "BROKEN: fails to build with new binutils-2.27"
meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb:PNBLACKLIST[gpe-scap] ?=
=3D "Depends on blacklisted libglade"
meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb:PNBLACKLIST[gpe-scap] ?=
=3D "Depends on blacklisted libgpewidget"
meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb:PNBLACKLIST[li=
bgpewidget] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Er=
rors/Details/130594/"
meta-gpe/recipes-graphics/minilite/minilite_0.50.bb:PNBLACKLIST[minilite] ?=
=3D "Depends on blacklisted libgpewidget"
meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb:PNBLACKLIST[fbreader]=
 ?=3D "Depends on blacklisted libgpewidget"
meta-gpe/recipes-support/fbreader/fbreader_git.bb:PNBLACKLIST[fbreader] ?=
=3D "BROKEN: fails to build with gcc-6"
meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.4.bb:PNBLACKLIST[klib=
c-utils] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Error=
s/Details/130679/"
meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb:PNBLACKLIST[ub=
i-utils-klibc] ?=3D "Fails to build with RSS http://errors.yoctoproject.org=
/Errors/Details/130665/"
meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb:PNBLACKLIST[=
kexec-tools-klibc] ?=3D "Fails to build with RSS http://errors.yoctoproject=
=2Eorg/Errors/Details/130674/"
meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb:PNBLACKLIST[g=
upnp-igd] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Erro=
rs/Details/130645/"
meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.10.bb:PNBLACKLIS=
T[gupnp-tools] ?=3D "Fails to build with RSS http://errors.yoctoproject.org=
/Errors/Details/130670/"
meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb:PNBLACKLIST[dvb-apps=
] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/Detai=
ls/130603/"
meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb:PNBLACKLIST[tvheaden=
d] ?=3D "Depends on blacklisted dvb-apps"
meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts_git.bb:PNBLACKL=
IST[kodi-addon-pvr-hts] ?=3D "Depends on blacklisted kodi"
meta-multimedia/recipes-mediacenter/kodi/kodi-platform_git.bb:PNBLACKLIST[k=
odi-platform] ?=3D "Depends on blacklisted kodi"
meta-multimedia/recipes-mediacenter/kodi/kodi-startup.bb:PNBLACKLIST[kodi-s=
tartup] ?=3D "Runtime depends on blacklisted kodi"
meta-multimedia/recipes-mediacenter/kodi/kodi-startup.bb:PNBLACKLIST[kodi-s=
tartup] ?=3D "Runtime depends on blacklisted kodi-startup-dev"
meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb:PNBLACKLIST[kodi] ?=3D =
"Depends on blacklisted libsdl-mixer"
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
meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo-mp3_0.10.31.b=
b:PNBLACKLIST[gst-fluendo-mp3] ?=3D "Depends on blacklisted gstreamer"
meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo-mpegdemux_0.1=
0.85.bb:PNBLACKLIST[gst-fluendo-mpegdemux] ?=3D "Depends on blacklisted gst=
reamer"
meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-meta-base_0.10.bb:PNB=
LACKLIST[gst-meta-base] ?=3D "Depends on blacklisted gstreamer"
meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax_0.10.1.bb:PNB=
LACKLIST[gst-openmax] ?=3D "Depends on blacklisted gstreamer"
meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad_0.10.23.b=
b:PNBLACKLIST[gst-plugins-bad] ?=3D "Depends on blacklisted gstreamer"
meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.=
bb:PNBLACKLIST[gst-plugins-base] ?=3D "Depends on blacklisted gstreamer"
meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl_0.10.3.bb:=
PNBLACKLIST[gst-plugins-gl] ?=3D "Depends on blacklisted gstreamer"
meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.=
bb:PNBLACKLIST[gst-plugins-good] ?=3D "Depends on blacklisted gstreamer"
meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly_0.10.19.=
bb:PNBLACKLIST[gst-plugins-ugly] ?=3D "Depends on blacklisted gstreamer"
meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp_0.10.8.bb:PNBLAC=
KLIST[gst-rtsp] ?=3D "Depends on blacklisted gstreamer"
meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb:PNBL=
ACKLIST[gstreamer] ?=3D "Fails to build with RSS http://errors.yoctoproject=
=2Eorg/Errors/Details/130583/"
meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb:PNBLACKLIST[gs=
t123] ?=3D "gst123 is still "sometimes" using wrong sysroot"
meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb:PNBLACKLIST[mpd] =
?=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details=
/130612/"
meta-networking/recipes-connectivity/crda/crda_3.18.bb:PNBLACKLIST[crda] ?=
=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/=
130675/"
meta-networking/recipes-connectivity/openconnect/openconnect_git.bb:PNBLACK=
LIST[openconnect] ?=3D "Fails to build with RSS http://errors.yoctoproject.=
org/Errors/Details/130672/"
meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb:PNBLACKLIST[dnrd] ?=3D =
"BROKEN: dnrd-2.20.3-r0 do_package: QA Issue: dnrd: Fi2.5.bb:PNBLACKLIST[bl=
uez-hcidump] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez=
5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4] ?=3D=
 "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with =
bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:PNBLACKLIS=
T[gst-plugin-bluetooth] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'blue=
z5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURE=
S', '', d)}"
meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb:PNBLACKLIST[gnokii] ?=
=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/=
130662/"
meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb:PNBLACKLIST[libmbim]=
 ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/Detail=
s/130590/"
meta-oe/recipes-connectivity/libqmi/libqmi_1.16.0.bb:PNBLACKLIST[libqmi] ?=
=3D "Depends on blacklisted libmbim"
meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.4.bb:PNBLACKLIST=
[modemmanager] ?=3D "Depends on blacklisted libmbim"
meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb:PNBLACKLIST[mosh] ?=3D "Fai=
ls to build with RSS http://errors.yoctoproject.org/Errors/Details/130653/"
meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.6.bb=
:PNBLACKLIST[networkmanager-openvpn] ?=3D "Fails to build with RSS http://e=
rrors.yoctoproject.org/Errors/Details/130667/"
meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?=3D =
"BROKEN: depends on broken libftdi"
meta-oe/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb:PNBLACKLIST[li=
btelepathy] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Er=
rors/Details/130609/"
meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.16.1.bb:=
PNBLACKLIST[telepathy-mission-control] ?=3D "Depends on blacklisted libtele=
pathy"
meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb:PNBLACKLIST[wvdial] ?=3D=
 "Depends on broken wvstreams"
meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb:PNBLACKLIST[wvstream=
s] ?=3D "BROKEN: fails to build with gcc-6"
meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zeroc=
-ice] ?=3D "BROKEN: not compatible with default db version"
meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb:PNBLACKLIST[dbus-daemon-=
proxy] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/=
Details/130613/"
meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb:PNBLACKLIST[libdbus-c++] ?=
=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/=
130644/"
meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb:PNBLACKLIST[fakeroot] ?=3D=
 "BROKEN: QA Issue: -dev package contains non-symlink .so"
meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb:PNBLACKLIST[pa=
ckagegroup-cli-tools] ?=3D "Runtime depends on blacklisted dbus-daemon-prox=
y"
meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb:PNBLACKLIST[pa=
ckagegroup-cli-tools] ?=3D "Runtime depends on blacklisted packagegroup-cli=
-tools"
meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb:PNBLACKLIST[cloud9] ?=3D "Not=
 comatible with current nodejs 0.12, but upstream is working on it for v3"
meta-oe/recipes-devtools/geany/geany-plugins_1.29.bb:PNBLACKLIST[geany-plug=
ins] ?=3D "Depends on blacklisted geany"
meta-oe/recipes-devtools/geany/geany_1.29.bb:PNBLACKLIST[geany] ?=3D "Fails=
 to build with RSS http://errors.yoctoproject.org/Errors/Details/130611/"
meta-oe/recipes-devtools/glade/glade3_3.8.5.bb:PNBLACKLIST[glade3] ?=3D "De=
pends on blacklisted libbonoboui"
meta-oe/recis/Details/130581/"
meta-oe/recipes-extended/collectd/collectd_5.5.0.bb:PNBLACKLIST[collectd] ?=
=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/=
130654/"
meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb:PNBLACKLIST[libgxim] ?=3D=
 "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130=
604/"
meta-oe/recipes-extended/openlmi/openlmi-storage_0.8.1.bb:PNBLACKLIST[openl=
mi-storage] ?=3D "Depends on blacklisted pywbem"
meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb:PNBLACKLIST[openlm=
i-tools] ?=3D "Depends on blacklisted pywbem"
meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb:PNBLACKLIST[pywbem] ?=3D "F=
ails to build with RSS http://errors.yoctoproject.org/Errors/Details/130596=
/"
meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb:PNBLACKLIST[pywbem] ?=3D "F=
ails to build with RSS http://errors.yoctoproject.org/Errors/Details/130681=
/"
meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurfac=
e] ?=3D "Needs to be upgraded for compatibility with new libdivecomputer"
meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb:PNBLACKLIST[gtkextra] ?=3D=
 "BROKEN: Fails to build with gcc-5"
meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb:PNBLACKLIST[gtkhtml2] ?=3D "=
Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/13063=
3/"
meta-oe/recipes-gnome/libglade/libglade_2.6.4.bb:PNBLACKLIST[libglade] ?=3D=
 "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130=
585/"
meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-b=
ox2d] ?=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-graphics/fbida/fbida_2.10.bb:PNBLACKLIST[fbida] ?=3D "Fails=
 to build with RSS http://errors.yoctoproject.org/Errors/Details/130677/"
meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?=3D "BROKEN: =
doesn't build with B!=3DS (flex: can't open lex.lex)"
meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb:PNBLACKLIST[fontfo=
rge] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/De=
tails/130639/"
meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb:PNBLACKLIST[gegl] ?=3D "Fails t=
o build with RSS http://errors.yoctoproject.org/Errors/Details/130509/"
meta-oe/recipes-graphics/gimp/gimp_2.8.18.bb:PNBLACKLIST[gimp] ?=3D "Depend=
s on blacklisted poppler"
meta-oe/recipes-graphics/gimp/gimp_2.8.18.bb:PNBLACKLIST[gimp] ?=3D "Depend=
s on blacklisted gegl"
meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb:PNBLACKLIST[libsexy] ?=
=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/=
130607/"
meta-oe/recipes-graphics/slim/slim_1.3.2.bb:PNBLACKLIST[slim] ?=3D "does no=
t build with distroless qemuarm as reported in 'State of bitbake world' thr=
ead, nobody volunteered to fix them"
meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb:PNBLACKLIST[te=
rminus-font] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/E=
rrors/Details/130638/"
meta-oe/recipes-graphics/wayland/wayland-fits_git.bb:PNBLACKLIST[wayland-fi=
ts] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/Det=
ails/130632/"
meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.3.bb:PNBLACKLIST[xstdcmap] ?=
=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/=
130660/"
meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[xf8=
6-input-mtev] ?=3D "BROKEN: doesn't build with B!=3DS (Makefile without ${S=
} in sed call)"
meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:PNBLACKLIS=
T[xf86-video-geode] ?=3D "BROKEN, fails to build"
meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb:PNBLACKLIST[xf=
86-video-glamo] ?=3D "Fails to build with RSS http://errors.yoctoprdobe-100=
dpi_1.0.3.bb:PNBLACKLIST[font-adobe-100dpi] ?=3D "Fails to build with RSS h=
ttp://errors.yoctoproject.org/Errors/Details/130621/"
meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb:PNBLAC=
KLIST[font-adobe-utopia-100dpi] ?=3D "Fails to build with RSS http://errors=
=2Eyoctoproject.org/Errors/Details/130623/"
meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb:PNBLACKLIST[font=
-bh-100dpi] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Er=
rors/Details/130624/"
meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb=
:PNBLACKLIST[font-bh-lucidatypewriter-100dpi] ?=3D "Fails to build with RSS=
 http://errors.yoctoproject.org/Errors/Details/130625/"
meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb:PNBLACKLIST[font=
-misc-misc] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Er=
rors/Details/130628/"
meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb:PNBLACKLIST[xorg-fo=
nts-100dpi] ?=3D "Runtime depends on blacklisted font-adobe-100dpi"
meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb:PNBLACKLIST[xorg-fo=
nts-100dpi] ?=3D "Runtime depends on blacklisted xorg-fonts-100dpi"
meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb:PNBLACKLIST[xorg-fo=
nts-100dpi] ?=3D "Runtime depends on blacklisted font-bh-100dpi"
meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb:PNBLACKLIST[xorg-fo=
nts-100dpi] ?=3D "Runtime depends on blacklisted font-adobe-utopia-100dpi"
meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb:PNBLACKLIST[xorg-fo=
nts-100dpi] ?=3D "Runtime depends on blacklisted font-bh-lucidatypewriter-1=
00dpi"
meta-oe/recipes-kernel/crash/crash_7.1.5.bb:PNBLACKLIST[crash] ?=3D "Fails =
to build with RSS http://errors.yoctoproject.org/Errors/Details/130678/"
meta-oe/recipes-kernel/ktap/ktap-module_git.bb:PNBLACKLIST[ktap-module] ?=
=3D "Not compatible with 3.19 kernel"
meta-oe/recipes-kernel/ktap/ktap_git.bb:PNBLACKLIST[ktap] ?=3D "Depends on =
blacklisted kernel-module-ktapvm"
meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb:PNBLACKLIST[audiofi=
le] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/Det=
ails/130588/"
meta-oe/recipes-multimedia/esound/esound_0.2.36.bb:PNBLACKLIST[esound] ?=3D=
 "Depends on blacklisted audiofile"
meta-oe/recipes-multimedia/jack/a2jmidid_8.bb:PNBLACKLIST[a2jmidid] ?=3D "F=
ails to build with RSS http://errors.yoctoproject.org/Errors/Details/130646=
/"
meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb:PNBLACKLIST[=
libsdl-mixer] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/=
Errors/Details/130592/"
meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mixer_2.0.1.bb:PNBLACKLIST[=
libsdl2-mixer] ?=3D "Fails to build with RSS http://errors.yoctoproject.org=
/Errors/Details/130659/"
meta-oe/recipes-multimedia/minidlna/minidlna_1.1.5.bb:PNBLACKLIST[minidlna]=
 ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/Detail=
s/130630/"
meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb:PNBLACKLIST[mplayer2] ?=
=3D "Not compatible with currently used ffmpeg 3"
meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtr=
otgps] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conf=
licts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb:PNBLACKLIST[gdal] ?=3D "BROK=
EN: fails to build with gcc-5"
meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb:PNBLACKLIST[geoclue] ?=
=3D "Depends on blacklisted modemmanager"
meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=3D "${@bb.u=
tils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4and=
 bluez5 is selected in DISTRO_FEATURES', '', d)}"
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
meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb:PNBLACKLIST[sylpheed] ?=
=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/=
130651/"
meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd] ?=
=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?=3D "qemu: =
uncaught target signal 11 (Segmentation fault) - core dumped"
meta-oe/recipes-support/farsight/farsight2_0.0.22.bb:PNBLACKLIST[farsight2]=
 ?=3D "Depends on blacklisted gstreamer"
meta-oe/recipes-support/farsight/farsight2_0.0.22.bb:PNBLACKLIST[farsight2]=
 ?=3D "Depends on blacklisted libnice"
meta-oe/recipes-support/farsight/farsight2_0.0.22.bb:PNBLACKLIST[farsight2]=
 ?=3D "Depends on blacklisted gst-plugins-base"
meta-oe/recipes-support/farsight/libnice_0.0.13.bb:PNBLACKLIST[libnice] ?=
=3D "Depends on blacklisted gstreamer"
meta-oe/recipes-support/fftw/benchfft_3.1.bb:PNBLACKLIST[benchfft] ?=3D "do=
es not build with distroless qemuarm as reported in 'State of bitbake world=
' thread, nobody volunteered to fix them"
meta-oe/recipes-support/iksemel/iksemel_1.4.bb:PNBLACKLIST[iksemel] ?=3D "N=
ot compatible with gnutls version 3.4 currently in oe-core"
meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb:PNBLACKLIST[ipmiutil] ?=
=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/=
130641/"
meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb:PNBLACKLIST[libdbi=
-drivers] ?=3D "BROKEN: fails to build with gcc-5"
meta-oe/recipes-support/libetpan/libetpan_0.57.bb:PNBLACKLIST[libetpan] ?=
=3D "Not compatible with gnutls version 3.4 currently in oe-core"
meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.11.bb:PNBLACKLIST[libsdl-=
ttf] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/De=
tails/130598/"
meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.14.bb:PNBLACKLIST[libsdl=
2-ttf] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/=
Details/130656/"
meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb:PNBLACKLIST[=
multipath-tools] ?=3D "Fails to build with RSS http://errors.yoctoproject.o=
rg/Errors/Details/130529/"
meta-oe/recipes-support/ode/ode_0.13.bb:PNBLACKLIST[ode] ?=3D "Fails to bui=
ld with RSS http://errors.yoctoproject.org/Errors/Details/130599/"
meta-oe/recipes-support/ode/ode_0.13.bb:PNBLACKLIST[ode] ?=3D "Fails to bui=
ld with RSS http://errors.yoctoproject.org/Errors/Details/130620/"
meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.4.bb:PNBLACKLIST[open-v=
cdiff] ?=3D "BROKEN: fails to build with gcc-6"
meta-oe/recipes-support/opencv/opencv-samples_2.4.bb:PNBLACKLIST[opencv-sam=
ples] ?=3D "Depends on blacklisted opencv"
meta-oe/recipes-support/opencv/opencv_2.4.bb:PNBLACKLIST[opencv] ?=3D "Not =
compatible with currently used ffmpeg 3"
meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmotiil=
s/130631/"
meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529.bb:PNBL=
ACKLIST[usb-modeswitch-data] ?=3D "Runtime depends on blacklisted usb-modes=
witch"
meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529.bb:PNBL=
ACKLIST[usb-modeswitch-data] ?=3D "Runtime depends on blacklisted usb-modes=
witch-data"
meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb:PNBLACKLIST[=
usb-modeswitch] ?=3D "Fails to build with RSS http://errors.yoctoproject.or=
g/Errors/Details/130620/"
meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala=
-terminal] ?=3D "BROKEN: Doesn't work with B!=3DS, touch: cannot touch `src=
/.stamp': No such file or directory"
meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.36.bb:PNBLACK=
LIST[vboxguestdrivers] ?=3D "BROKEN: not compatible with default kernel ver=
sion 4.8"
meta-oe/recipes-support/xchat/xchat_2.8.8.bb:PNBLACKLIST[xchat] ?=3D "Depen=
ds on blacklisted libsexy"
meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.15.bb:PNBLACKLIST[xdg=
-user-dirs] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Er=
rors/Details/130635/"
meta-python/recipes-connectivity/gateone/gateone_git.bb:PNBLACKLIST[gateone=
] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/Detai=
ls/130642/"
meta-python/recipes-devtools/python/python-cryptography-vectors_1.6.bb:PNBL=
ACKLIST[python-cryptography-vectors] ?=3D "Fails to build with RSS http://e=
rrors.yoctoproject.org/Errors/Details/130664/"
meta-python/recipes-devtools/python/python-pbr_1.10.0.bb:PNBLACKLIST[python=
-pbr] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/D=
etails/130650/"
meta-python/recipes-devtools/python/python3-cryptography-vectors_1.6.bb:PNB=
LACKLIST[python3-cryptography-vectors] ?=3D "Fails to build with RSS http:/=
/errors.yoctoproject.org/Errors/Details/130626/"
meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.4.2.bb:PNBLAC=
KLIST[python3-ndg-httpsclient] ?=3D "Fails to build with RSS http://errors.=
yoctoproject.org/Errors/Details/130615/"
meta-python/recipes-devtools/python/python3-pymisp_2.4.54.bb:PNBLACKLIST[py=
thon3-pymisp] ?=3D "Runtime depends on blacklisted python3-pymisp"
meta-python/recipes-devtools/python/python3-pymisp_2.4.54.bb:PNBLACKLIST[py=
thon3-pymisp] ?=3D "Runtime depends on blacklisted python3-pymisp-dev"
meta-python/recipes-devtools/python/python3-requests_2.13.0.bb:PNBLACKLIST[=
python3-requests] ?=3D "Runtime depends on blacklisted python3-ndg-httpscli=
ent"
meta-python/recipes-devtools/python/python3-requests_2.13.0.bb:PNBLACKLIST[=
python3-requests] ?=3D "Runtime depends on blacklisted python3-requests-dev"
meta-ruby/recipes-devtools/ruby/bundler_git.bb:PNBLACKLIST[bundler] ?=3D "F=
ails to build with RSS http://errors.yoctoproject.org/Errors/Details/130640=
/"
meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb:PNBLACKLIST[nostrom=
o] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/Deta=
ils/130655/"
meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.0.bb:PNBLACKLIST[sthttpd]=
 ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/Detail=
s/130676/"
meta-webserver/recipes-webadmin/netdata/netdata_git.bb:PNBLACKLIST[netdata]=
 ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/Detail=
s/130636/"
meta-xfce/recipes-apps/menulibre/menulibre_2.1.3.bb:PNBLACKLIST[menulibre] =
?=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details=
/130617/"
meta-xfce/recipes-apps/mousepad/mousepad_0.4.0.bb:PNBLACKLIST[mousepad] ?=
=3D "Depends on blacklisted gtksourceview2"
meta-xfce/recipes-apps/ristretto/ristretto_0.8.1.bb:PNBLACKLIST[ristretto] =
?ds on blacklisted mpd"
meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.0.bb:PNB=
LACKLIST[xfce4-mpc-plugin] ?=3D "Runtime depends on blacklisted xfce4-mpc-p=
lugin"
meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.0.bb:PNB=
LACKLIST[xfce4-mpc-plugin] ?=3D "Runtime depends on blacklisted xfce4-mpc-p=
lugin-dev"
meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.3.bb:PNBLACKLIST[xfmpc] ?=3D "=
Runtime depends on blacklisted mpd"
meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.3.bb:PNBLACKLIST[xfmpc] ?=3D "=
Runtime depends on blacklisted xfmpc-dev"
meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.3.bb:PNBLACKLIST[xfmpc] ?=3D "=
Runtime depends on blacklisted xfmpc"
meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_1.1.0.bb:PNBLACKLI=
ST[xfce4-verve-plugin] ?=3D "Fails to build with RSS http://errors.yoctopro=
ject.org/Errors/Details/130622/"
meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.0.3.=
bb:PNBLACKLIST[xfce4-whiskermenu-plugin] ?=3D "Runtime depends on blacklist=
ed menulibre"
meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb:PNBLACKLIST[=
packagegroup-xfce-base] ?=3D "Runtime depends on blacklisted xfce4-notifyd"
meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb:PNBLACKL=
IST[packagegroup-xfce-extended] ?=3D "Runtime depends on blacklisted xfce4-=
mixer"
meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb:PNBLACKL=
IST[packagegroup-xfce-extended] ?=3D "Runtime depends on blacklisted xfce4-=
verve-plugin"
meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb:PNBLACKL=
IST[packagegroup-xfce-extended] ?=3D "Runtime depends on blacklisted ristre=
tto"
meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb:PNBLACKLIST[tumbler] ?=3D =
"Depends on blacklisted poppler"
meta-qt5:
meta-smartphone:
meta-fso/recipes-freesmartphone/freesmartphone/fso-gsm0710muxd_git.bb:PNBLA=
CKLIST[fso-gsm0710mux] ?=3D "Fails to build with RSS http://errors.yoctopro=
ject.org/Errors/Details/130517/"
meta-fso/recipes-freesmartphone/freesmartphone/libframeworkd-glib_git.bb:PN=
BLACKLIST[libframeworkd-glib] ?=3D "BROKEN: many errors when building with =
gcc-6"
meta-fso/recipes-freesmartphone/freesmartphone/opimd-utils_git.bb:PNBLACKLI=
ST[opimd-utils] ?=3D "Runtime depends on blacklisted ffphonelog"
meta-fso/recipes-freesmartphone/freesmartphone/zhone_git.bb:PNBLACKLIST[zho=
ne] ?=3D "rdepends on python-pycairo which was removed"
meta-shr/recipes-shr/3rdparty/advancedcaching_git.bb:PNBLACKLIST[advancedca=
ching] ?=3D "RDEPENDS on python-pygtk was removed from oe-core"
meta-shr/recipes-shr/3rdparty/atd-over-fso_0.70.bb:PNBLACKLIST[atd-over-fso=
] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/Detai=
ls/130540/"
meta-shr/recipes-shr/3rdparty/atrack_svn.bb:PNBLACKLIST[atrack] ?=3D "Runti=
me depends on blacklisted python-elementary"
meta-shr/recipes-shr/3rdparty/babiloo-efl_2.0.9-10.bb:PNBLACKLIST[babiloo-e=
fl] ?=3D "Runtime depends on blacklisted python-elementary"
meta-shr/recipes-shr/3rdparty/babiloo-efl_bzr.bb:PNBLACKLIST[babiloo-efl] ?=
=3D "Runtime depends on blacklisted python-elementary"
meta-shr/recipes-shr/3rdparty/babiloo-efl_bzr.bb:PNBLACKLIST[babiloo-efl] ?=
=3D "Runtime depends on blacklisted babiloo-efl"
meta-shr/recipes-shr/3rdparty/babiloo-efl_bzr.bb:PNBLACKLIST[babiloo-efl] ?=
=3D "Runtime depends on blacklisted babiloo-efl-dev"
meta-shr/recipes-shr/3rdparty/chroneo_svn.bb:PNBLACKLIST[chroneo] ?=3D "Run=
time depends on blacklisted python-elementary"
meta-shr/recipes-shr/3rdparty/ecalc_git.bb:PNBLACKLIST[ecalc] ?=3D "Runtime=
 depends on blacklisted python-edbus"
meta-shr/recipes-shr/3rdparty/ecalc_git.bb:PNBLACKLIST[ecaldbus"
meta-shr/recipes-shr/3rdparty/neolight_svn.bb:PNBLACKLIST[neolight] ?=3D "R=
untime depends on blacklisted python-elementary"
meta-shr/recipes-shr/3rdparty/neomis_svn.bb:PNBLACKLIST[neomis] ?=3D "Runti=
me depends on blacklisted python-elementary"
meta-shr/recipes-shr/3rdparty/numberx_svn.bb:PNBLACKLIST[numberx] ?=3D "Run=
time depends on blacklisted python-elementary"
meta-shr/recipes-shr/3rdparty/om-neon_svn.bb:PNBLACKLIST[om-neon] ?=3D "Run=
time depends on blacklisted python-evas"
meta-shr/recipes-shr/3rdparty/om-neon_svn.bb:PNBLACKLIST[om-neon] ?=3D "Run=
time depends on blacklisted om-neon-dev"
meta-shr/recipes-shr/3rdparty/om-neon_svn.bb:PNBLACKLIST[om-neon] ?=3D "Run=
time depends on blacklisted python-edje"
meta-shr/recipes-shr/3rdparty/om-neon_svn.bb:PNBLACKLIST[om-neon] ?=3D "Run=
time depends on blacklisted python-ecore"
meta-shr/recipes-shr/3rdparty/om-neon_svn.bb:PNBLACKLIST[om-neon] ?=3D "Run=
time depends on blacklisted om-neon"
meta-shr/recipes-shr/3rdparty/omext_0.2.bb:PNBLACKLIST[omext] ?=3D "Fails t=
o build with RSS http://errors.yoctoproject.org/Errors/Details/130539/"
meta-shr/recipes-shr/3rdparty/openmoko-gps_svn.bb:PNBLACKLIST[openmoko-gps]=
 ?=3D "RDEPENDS on python-pygtk which was removed from oe-core"
meta-shr/recipes-shr/3rdparty/pisi_0.5.3.bb:PNBLACKLIST[pisi] ?=3D "RDEPEND=
S on python-pygtk which was removed from oe-core"
meta-shr/recipes-shr/3rdparty/podboy_svn.bb:PNBLACKLIST[podboy] ?=3D "${@bb=
=2Eutils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez=
4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-shr/recipes-shr/3rdparty/rtmom_0.1.3.bb:PNBLACKLIST[rtmom] ?=3D "Depen=
ds on blacklisted python-elementary"
meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] =3D "Does=
n't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/spojegui_svn.bb:PNBLACKLIST[spojegui] ?=3D "R=
untime depends on blacklisted python-elementary"
meta-shr/recipes-shr/3rdparty/vagalume_0.8.5.bb:PNBLACKLIST[vagalume] ?=3D =
"Depends on blacklisted gstreamer"
meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompass] =
=3D "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/games/aceofpenguins_1.4.bb:PNBLACKLIST[aceofpenguins] =
?=3D "BROKEN: fails to build with new binutils-2.27"
meta-shr/recipes-shr/games/mokomaze_0.5.5.bb:PNBLACKLIST[mokomaze] ?=3D "De=
pends on blacklisted libsdl-ttf"
meta-shr/recipes-shr/games/mokomaze_0.5.5.bb:PNBLACKLIST[mokomaze] ?=3D "De=
pends on blacklisted ode"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D "Runtime depends on blacklisted mokomaze"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D "Runtime depends on blacklisted dates"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D "Runtime depends on blacklisted dbus-daemon-proxy"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D "Runtime depends on blacklisted guitartune"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D "Runtime depends on blacklisted illume-keyboard-de=
fault-numeric"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D "Runtime depends on blacklisted e-tasks"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D "Runtime depends on blacklisted enjoy"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D "Runtime deinimal.bb:PNBLACKLIST[packagegroup-shr-=
minimal] ?=3D "Runtime depends on blacklisted libphone-ui-shr"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-minimal.bb:PNBLACKLIST[=
packagegroup-shr-minimal] ?=3D "Runtime depends on blacklisted ffphonelog"
meta-shr/recipes-shr/packagegroups/packagegroup-shr.bb:PNBLACKLIST[packageg=
roup-shr] ?=3D "Runtime depends on blacklisted packagegroup-cli-tools-debug"
meta-shr/recipes-shr/packagegroups/packagegroup-shr.bb:PNBLACKLIST[packageg=
roup-shr] ?=3D "Runtime depends on blacklisted packagegroup-shr-minimal-cli"
meta-shr/recipes-shr/packagegroups/packagegroup-shr.bb:PNBLACKLIST[packageg=
roup-shr] ?=3D "Runtime depends on blacklisted packagegroup-cli-tools"
meta-shr/recipes-shr/packagegroups/packagegroup-shr.bb:PNBLACKLIST[packageg=
roup-shr] ?=3D "Runtime depends on blacklisted packagegroup-shr-minimal-app=
s"
meta-shr/recipes-shr/packagegroups/packagegroup-shr.bb:PNBLACKLIST[packageg=
roup-shr] ?=3D "Runtime depends on blacklisted vagalume"
meta-shr/recipes-shr/shr/e-wm-config-illume2-shr_git.bb:PNBLACKLIST[e-wm-co=
nfig-illume2-shr] ?=3D "Fails to build with RSS http://errors.yoctoproject.=
org/Errors/Details/130520/"
meta-shr/recipes-shr/shr/libphone-ui-shr_git.bb:PNBLACKLIST[libphone-ui-shr=
] ?=3D "Depends on blacklisted elementary"
meta-shr/recipes-shr/shr/shr-e-gadgets_git.bb:PNBLACKLIST[shr-e-gadgets] ?=
=3D "Depends on blacklisted elementary"
meta-shr/recipes-shr/shr/shr-installer_git.bb:PNBLACKLIST[shr-installer] ?=
=3D "Depends on blacklisted packagekit"
meta-shr/recipes-shr/shr/shr-settings_git.bb:PNBLACKLIST[shr-settings] ?=3D=
 "Runtime depends on blacklisted python-edbus"
meta-shr/recipes-shr/shr/shr-settings_git.bb:PNBLACKLIST[shr-settings] ?=3D=
 "Runtime depends on blacklisted python-elementary"
meta-shr/recipes-shr/shr/shr-wizard_git.bb:PNBLACKLIST[shr-wizard] ?=3D "De=
pends on blacklisted e-wm"
meta-shr/recipes-shr/themes/e-wm-theme-illume-neo_git.bb:PNBLACKLIST[e-wm-t=
heme-illume-neo] ?=3D "Runtime depends on blacklisted e-wm"
meta-shr/recipes-shr/themes/e-wm-theme-illume-neo_git.bb:PNBLACKLIST[e-wm-t=
heme-illume-neo] ?=3D "Runtime depends on blacklisted e-wm-theme-illume-neo=
-dev"
meta-shr/recipes-shr/themes/e-wm-theme-illume-neo_git.bb:PNBLACKLIST[e-wm-t=
heme-illume-neo] ?=3D "Runtime depends on blacklisted e-wm-theme-illume-neo"
meta-shr/recipes-shr/themes/gtk-theme-clearlooks-gtkrc.bb:PNBLACKLIST[gtk-t=
heme-clearlooks-gtkrc] ?=3D "Runtime depends on blacklisted gtk-theme-clear=
looks"
meta-shr/recipes-shr/themes/gtk-theme-clearlooks-gtkrc.bb:PNBLACKLIST[gtk-t=
heme-clearlooks-gtkrc] ?=3D "Runtime depends on blacklisted gtk-theme-clear=
looks-gtkrc-dev"
meta-shr/recipes-shr/themes/icon-theme-neo_git.bb:PNBLACKLIST[icon-theme-ne=
o] ?=3D "Runtime depends on blacklisted e-wm"
meta-shr/recipes-shr/themes/icon-theme-neo_git.bb:PNBLACKLIST[icon-theme-ne=
o] ?=3D "Runtime depends on blacklisted icon-theme-neo-dev"
meta-shr/recipes-shr/themes/phoneui-shr-theme-neo_git.bb:PNBLACKLIST[phoneu=
i-shr-theme-neo] ?=3D "Runtime depends on blacklisted libphone-ui-shr"
meta-shr/recipes-shr/themes/phoneui-shr-theme-neo_git.bb:PNBLACKLIST[phoneu=
i-shr-theme-neo] ?=3D "Runtime depends on blacklisted phoneui-shr-theme-neo=
-dev"
meta-shr/recipes-shr/themes/phoneui-shr-theme-niebiee_git.bb:PNBLACKLIST[ph=
oneui-shr-theme-niebiee] ?=3D "Runtime depends on blacklisted libphone-ui-s=
hr"
meta-shr/recipes-shr/themes/phoneui-shr-theme-o2_git.bb:PNBLACKLIST[phoneui=
-shr-theme-o2] ?=3D "Runtime depends on blacklisted libphone-ui-shr"
meta-shr/recipes-shr/themes/phoneui-shr-theme-sowka_git.bb:PNBLACKLIST[phon=
eui-shr-theme-sowka] ?=3D "Runtime depends on blacklisted libphone-ui-shr"
mto new qtwayland-5.7"
PNBLACKLIST[android-system] =3D "depends on lxc from meta-virtualiazation w=
hich isn't included in my world builds"
PNBLACKLIST[bigbuckbunny-1080p] =3D "big and doesn't really need to be test=
ed so much"
PNBLACKLIST[bigbuckbunny-480p] =3D "big and doesn't really need to be teste=
d so much"
PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be teste=
d so much"
PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be teste=
d so much"
PNBLACKLIST[tearsofsteel-1080p] =3D "big and doesn't really need to be test=
ed so much"
PNBLACKLIST[build-appliance-image] =3D "tries to include whole downloads di=
rectory in /home/builder/poky :/"
PNBLACKLIST[linux-yocto-tiny-kexecboot] =3D "does weird sh!t breaking other=
 kernels and modules - broken for years"
PNBLACKLIST[linux-yocto-tiny] =3D "does weird sh!t breaking other kernels a=
nd modules - broken for years"


QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 1	issue: textrel
corosync-2.4.0: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.4.0-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]


count: 0	issue: build-deps


count: 3	issue: file-rdeps
libmodule-build-perl-0.31: /usr/bin/config_data contained in package libmod=
ule-build-perl requires /tmp/work/core2-64-oe-linux/libmodule-build-perl/0.=
31-r0/recipe-sysroot-native/usr/bin/perl-native/perl.real, but no providers=
 found in RDEPENDS_libmodule-build-perl? [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert_all.sh containe=
d in package numptyphysics requires /bin/bash, but no providers found in RD=
EPENDS_numptyphysics? [file-rdeps]
ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: /usr/bin/memory-map.sh contained in=
 package ubx-utils requires /bin/bash, but no providers found in RDEPENDS_u=
bx-utils? [file-rdeps]


count: 455	issue: version-going-backwards
atkmm-2.24.2: Package version for package atkmm-dbg went backwards which wo=
uld break package feeds from (0:2.24.2-r0.1 to 0:2.24.2-r0.0) [version-goin=
g-backwards]
atkmm-2.24.2: Package version for package atkmm-dev went backwards which wo=
uld break package feeds from (0:2.24.2-r0.1 to 0:2.24.2-r0.0) [version-goin=
g-backwards]
atkmm-2.24.2: Package version for package atkmm-doc went backwards which wo=
uld break package feeds from (0:2.24.2-r0.1 to 0:2.24.2-r0.0) [version-goin=
g-backwards]
atkmm-2.24.2: Package version for package atkmm-locale went backwards which=
 would break package feeds from (0:2.24.2-r0.1 to 0:2.24.2-r0.0) [version-g=
oing-backwards]
atkmm-2.24.2: Package version for package atkmm-staticdev went backwards wh=
ich would break package feeds from (0:2.24.2-r0.1 to 0:2.24.2-r0.0) [versio=
n-going-backwards]
atkmm-2.24.2: Package version for package atkmm went backwards which would =
break package feeds from (0:2.24.2-r0.1 to 0:2.24.2-r0.0) [version-going-ba=
ckwards]
epiphany-3.22.3: Package version for package epiphany-dbg went backwards wh=
ich would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [versio=
n-going-backwards]
epiphany-3.22.3: Package version for package epiphany-dev went backwards wh=
ich would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [versio=
n-going-backwards]
epiphany-3.22.3: Package version for package epiphany-doc went backwards wh=
ich would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [versio=
n-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-am went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for packr0.7 to 0:3.22.3-r0.0) [version-go=
ing-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-br went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-bs went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-ca+valencia we=
nt backwards which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.=
3-r0.0) [version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-ca went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-cs went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-cy went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-da went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-de went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-dz went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-el went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-en-ca went bac=
kwards which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0=
) [version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-en-gb went bac=
kwards which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0=
) [version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-en+shaw went b=
ackwards which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0=
=2E0) [version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-eo went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-es went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-et went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-eu went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-fa went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-fi went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-fr went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3r0.7 to 0:3.22.3-r0.0) [version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-hy went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-id went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-ig went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-is went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-it went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-ja went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-ka went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-kk went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-km went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-kn went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-ko went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-ku went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-li went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-lt went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-lv went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-mai went backw=
ards which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) =
[version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-mg went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-mi went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-mk went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-ml went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version foing-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-or went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-pa went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-pl went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-ps went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-pt-br went bac=
kwards which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0=
) [version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-pt went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-ro went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-ru went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-rw went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-si went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-sk went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-sl went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-sq went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-sr+latin went =
backwards which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r=
0.0) [version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-sr went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-sv went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-ta went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-te went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-tg went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-th went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-localom (0:3.22.3-r0.=
7 to 0:3.22.3-r0.0) [version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-zh-cn went bac=
kwards which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0=
) [version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-zh-hk went bac=
kwards which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0=
) [version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-locale-zh-tw went bac=
kwards which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0=
) [version-going-backwards]
epiphany-3.22.3: Package version for package epiphany-staticdev went backwa=
rds which would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [=
version-going-backwards]
epiphany-3.22.3: Package version for package epiphany went backwards which =
would break package feeds from (0:3.22.3-r0.7 to 0:3.22.3-r0.0) [version-go=
ing-backwards]
glibmm-2.50.0: Package version for package glibmm-dbg went backwards which =
would break package feeds from (0:2.50.0-r0.1 to 0:2.50.0-r0.0) [version-go=
ing-backwards]
glibmm-2.50.0: Package version for package glibmm-dev went backwards which =
would break package feeds from (0:2.50.0-r0.1 to 0:2.50.0-r0.0) [version-go=
ing-backwards]
glibmm-2.50.0: Package version for package glibmm-doc went backwards which =
would break package feeds from (0:2.50.0-r0.1 to 0:2.50.0-r0.0) [version-go=
ing-backwards]
glibmm-2.50.0: Package version for package glibmm-locale went backwards whi=
ch would break package feeds from (0:2.50.0-r0.1 to 0:2.50.0-r0.0) [version=
-going-backwards]
glibmm-2.50.0: Package version for package glibmm-staticdev went backwards =
which would break package feeds from (0:2.50.0-r0.1 to 0:2.50.0-r0.0) [vers=
ion-going-backwards]
glibmm-2.50.0: Package version for package glibmm went backwards which woul=
d break package feeds from (0:2.50.0-r0.1 to 0:2.50.0-r0.0) [version-going-=
backwards]
gtkmm-2.24.5: Package version for package gtkmm-dbg went backwards which wo=
uld break package feeds from (0:2.24.5-r0.1 to 0:2.24.5-r0.0) [version-goin=
g-backwards]
gtkmm-2.24.5: Package version for package gtkmm-dev went backwards which wo=
uld break package feeds from (0:2.24.5-r0.1 to 0:2.24.5-r0.0) [version-goin=
g-backwards]
gtkmm-2.24.5: Package version for package gtkmm-doc went backwards which wo=
uld break package feeds from (0:2.24.5-r0.1 to 0:2.24.5-r0.0) [version-goin=
g-backwards]
gtkmm-2.24.5: Package version for package gtkmm-locale went backwards which=
 would break package feeds from (0:2.24.5-r0.1 to 0:2.24.5-r0.0) [version-g=
oing-backwards]
gtkmm-2.24.5: Package version for package gtkmm-staticdev went backwards wh=
ich would break package feeds from (0:2.24.5-r0.1 to 0:2.24.5-r0.0) [versio=
n-going-backwards]
gtkmm-2.24.5: Package version for package gtkmm went backwards which would =
break package feeds from (0:2.24.5-r0.1 to 0:2.24.5-r0.0) [version-going-ba=
ckwards]
gvfs-1.28.3: Package version for package gvfs-bash-completion went backward=
s which would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [v=
ersion-going-backwards]
gvfs-1.28.3: Package version for package gvfs-dbg went backwards which woul=
d break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version-going=
-backwards]
gvfs-1.28.3: Package version for package gvfs-dev went backwards which woul=
d break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version-going=
-backwards]
gvfs-1.28.3: Package version for package gvfsd-ftp went backwards which wou=
ld break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version-goin=
g-backwards]
gvfs-1.28 gvfs-locale-bg went backwards which would break package feeds fro=
m (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-bn-in went backwards w=
hich would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [vers=
ion-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-bn went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-bs went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-ca+valencia went backw=
ards which would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0)=
 [version-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-ca went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-cs went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-da went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-de went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-el went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-en-gb went backwards w=
hich would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [vers=
ion-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-en+shaw went backwards=
 which would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [ve=
rsion-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-eo went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-es went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-et went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-eu went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-fa went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-fi went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-fr went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-ga went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-gl went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-gu went backwards whic=
heeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-ku went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-lt went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-lv went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-mai went backwards whi=
ch would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [versio=
n-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-mk went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-ml went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-mr went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-nb went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-nds went backwards whi=
ch would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [versio=
n-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-nl went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-nn went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-oc went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-or went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-pa went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-pl went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-pt-br went backwards w=
hich would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [vers=
ion-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-pt went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-ro went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-ru went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-sk went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-sl went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [versio =
backwards which would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-=
r0.0) [version-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-uk went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-vi went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-zh-cn went backwards w=
hich would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [vers=
ion-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-zh-hk went backwards w=
hich would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [vers=
ion-going-backwards]
gvfs-1.28.3: Package version for package gvfs-locale-zh-tw went backwards w=
hich would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [vers=
ion-going-backwards]
gvfs-1.28.3: Package version for package gvfs-staticdev went backwards whic=
h would break package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version=
-going-backwards]
gvfs-1.28.3: Package version for package gvfs went backwards which would br=
eak package feeds from (0:1.28.3-r0.16 to 0:1.28.3-r0.0) [version-going-bac=
kwards]
libxml++-2.38.1: Package version for package libxml++-dbg went backwards wh=
ich would break package feeds from (0:2.38.1-r0.45 to 0:2.38.1-r0.0) [versi=
on-going-backwards]
libxml++-2.38.1: Package version for package libxml++-dbg went backwards wh=
ich would break package feeds from (0:2.38.1-r0.50 to 0:2.38.1-r0.0) [versi=
on-going-backwards]
libxml++-2.38.1: Package version for package libxml++-dev went backwards wh=
ich would break package feeds from (0:2.38.1-r0.45 to 0:2.38.1-r0.0) [versi=
on-going-backwards]
libxml++-2.38.1: Package version for package libxml++-dev went backwards wh=
ich would break package feeds from (0:2.38.1-r0.50 to 0:2.38.1-r0.0) [versi=
on-going-backwards]
libxml++-2.38.1: Package version for package libxml++-doc went backwards wh=
ich would break package feeds from (0:2.38.1-r0.45 to 0:2.38.1-r0.0) [versi=
on-going-backwards]
libxml++-2.38.1: Package version for package libxml++-doc went backwards wh=
ich would break package feeds from (0:2.38.1-r0.50 to 0:2.38.1-r0.0) [versi=
on-going-backwards]
libxml++-2.38.1: Package version for package libxml++-locale went backwards=
 which would break package feeds from (0:2.38.1-r0.45 to 0:2.38.1-r0.0) [ve=
rsion-going-backwards]
libxml++-2.38.1: Package version for package libxml++-locale went backwards=
 which would break package feeds from (0:2.38.1-r0.50 to 0:2.38.1-r0.0) [ve=
rsion-going-backwards]
libxml++-2.38.1: Package version for package libxml++-staticdev went backwa=
rds which would break package feeds from (0:2.38.1-r0.45 to 0:2.38.1-r0.0) =
[version-going-backwards]
libxml++-2.38.1: Package version for package libxml++-staticdev went backwa=
rds which would break package feeds from (0:2.38.1-r0.50 to 0:2.38.1-r0.0) =
[version-going-backwards]
libxml++-2.38.1: Package version for package libxml++ went backwards which =
would break package feeds from (0:2.38.1-r0.45 to 0:2.38.1-r0.0) [version-g=
oing-backwards]
libxml++-2.38.1: Package version for package libxml++ went backwards which =
would break package feeds from (0:2.38.1-r0.50 to 0:2.38.1-r0.0) [version-g=
oing-backwards]
pangomm-2.40.1: Package version for package pangomm-dbg went backwards whic=
h would break package feeds from (0:2.40.1-r0.1 to 0:2.40.1-r0.0) [version-=
going-backwards]
pangomm-2.40.1: Package version for package pangomm-dev went backwards whic=
h would bontrol-3.0: Package version for package pavucontrol-locale-as went=
 backwards which would break package feeds from (0:3.0-r0.65 to 0:3.0-r0.0)=
 [version-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-bn-in went =
backwards which would break package feeds from (0:3.0-r0.55 to 0:3.0-r0.0) =
[version-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-bn-in went =
backwards which would break package feeds from (0:3.0-r0.65 to 0:3.0-r0.0) =
[version-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-ca went bac=
kwards which would break package feeds from (0:3.0-r0.55 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-ca went bac=
kwards which would break package feeds from (0:3.0-r0.65 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-cs went bac=
kwards which would break package feeds from (0:3.0-r0.55 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-cs went bac=
kwards which would break package feeds from (0:3.0-r0.65 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-da went bac=
kwards which would break package feeds from (0:3.0-r0.55 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-da went bac=
kwards which would break package feeds from (0:3.0-r0.65 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-de went bac=
kwards which would break package feeds from (0:3.0-r0.55 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-de went bac=
kwards which would break package feeds from (0:3.0-r0.65 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-el went bac=
kwards which would break package feeds from (0:3.0-r0.55 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-el went bac=
kwards which would break package feeds from (0:3.0-r0.65 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-es went bac=
kwards which would break package feeds from (0:3.0-r0.55 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-es went bac=
kwards which would break package feeds from (0:3.0-r0.65 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-fi went bac=
kwards which would break package feeds from (0:3.0-r0.55 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-fi went bac=
kwards which would break package feeds from (0:3.0-r0.65 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-fr went bac=
kwards which would break package feeds from (0:3.0-r0.55 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-fr went bac=
kwards which would break package feeds from (0:3.0-r0.65 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-gu went bac=
kwards which would break package feeds from (0:3.0-r0.55 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-gu went bac=
kwards which would break package feeds from (0:30-r0.55 to 0:3.0-r0.0) [ver=
sion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-kn went bac=
kwards which would break package feeds from (0:3.0-r0.65 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-ml went bac=
kwards which would break package feeds from (0:3.0-r0.55 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-ml went bac=
kwards which would break package feeds from (0:3.0-r0.65 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-mr went bac=
kwards which would break package feeds from (0:3.0-r0.55 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-mr went bac=
kwards which would break package feeds from (0:3.0-r0.65 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-nl went bac=
kwards which would break package feeds from (0:3.0-r0.55 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-nl went bac=
kwards which would break package feeds from (0:3.0-r0.65 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-or went bac=
kwards which would break package feeds from (0:3.0-r0.55 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-or went bac=
kwards which would break package feeds from (0:3.0-r0.65 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-pa went bac=
kwards which would break package feeds from (0:3.0-r0.55 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-pa went bac=
kwards which would break package feeds from (0:3.0-r0.65 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-pl went bac=
kwards which would break package feeds from (0:3.0-r0.55 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-pl went bac=
kwards which would break package feeds from (0:3.0-r0.65 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-pt-br went =
backwards which would break package feeds from (0:3.0-r0.55 to 0:3.0-r0.0) =
[version-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-pt-br went =
backwards which would break package feeds from (0:3.0-r0.65 to 0:3.0-r0.0) =
[version-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-pt went bac=
kwards which would break package feeds from (0:3.0-r0.55 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-pt went bac=
kwards which would break package feeds from (0:3.0-r0.65 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-ru went bac=
kwards which would break package feeds from (0:3.0-r0.55 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-ru went bac=
kwards which would break package feeds from (0:3.0-r0.65 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-sk went bac=
kwards which would break package feeds from (0:3.0-r0.55 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-sk we.0-r0.=
65 to 0:3.0-r0.0) [version-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-te went bac=
kwards which would break package feeds from (0:3.0-r0.55 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-te went bac=
kwards which would break package feeds from (0:3.0-r0.65 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-th went bac=
kwards which would break package feeds from (0:3.0-r0.55 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-th went bac=
kwards which would break package feeds from (0:3.0-r0.65 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-tr went bac=
kwards which would break package feeds from (0:3.0-r0.55 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-tr went bac=
kwards which would break package feeds from (0:3.0-r0.65 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-uk went bac=
kwards which would break package feeds from (0:3.0-r0.55 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-uk went bac=
kwards which would break package feeds from (0:3.0-r0.65 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-zh-cn went =
backwards which would break package feeds from (0:3.0-r0.55 to 0:3.0-r0.0) =
[version-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-locale-zh-cn went =
backwards which would break package feeds from (0:3.0-r0.65 to 0:3.0-r0.0) =
[version-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-staticdev went bac=
kwards which would break package feeds from (0:3.0-r0.55 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol-staticdev went bac=
kwards which would break package feeds from (0:3.0-r0.65 to 0:3.0-r0.0) [ve=
rsion-going-backwards]
pavucontrol-3.0: Package version for package pavucontrol went backwards whi=
ch would break package feeds from (0:3.0-r0.55 to 0:3.0-r0.0) [version-goin=
g-backwards]
pavucontrol-3.0: Package version for package pavucontrol went backwards whi=
ch would break package feeds from (0:3.0-r0.65 to 0:3.0-r0.0) [version-goin=
g-backwards]
qt5-creator-3.5.1: Package version for package qt5-creator-dbg went backwar=
ds which would break package feeds from (0:3.5.1-r0.55 to 0:3.5.1-r0.0) [ve=
rsion-going-backwards]
qt5-creator-3.5.1: Package version for package qt5-creator-dbg went backwar=
ds which would break package feeds from (0:3.5.1-r0.62 to 0:3.5.1-r0.0) [ve=
rsion-going-backwards]
qt5-creator-3.5.1: Package version for package qt5-creator-dbg went backwar=
ds which would break package feeds from (0:3.5.1-r0.68 to 0:3.5.1-r0.0) [ve=
rsion-going-backwards]
qt5-creator-3.5.1: Package version for package qt5-creator-dev went backwar=
ds which would break package feeds from (0:3.5.1-r0.55 to 0:3.5.1-r0.0) [ve=
rsion-going-backwards]
qt5-creator-3.5.1: Package version for package qt5-creator-dev went backwar=
ds which would break package feeds from (0:3.5.1-r0.62 to 0:3.5.1-r0.0) [ve=
rsion-going-backwards]
qt5-creator-3.5.1: Package version for package qt5-creator-dev went backwar=
ds which would break package feeds from (0:3.5.1-r0.68 to 0:3.5.1-r0.0) [ve=
rsion-going-backwards]
qt5-creator-3.5.1: Package version for package qt5-creator-doc went backwar=
ds which wouleds from (0:3.5.1-r0.68 to 0:3.5.1-r0.0) [version-going-backwa=
rds]
qt5-creator-3.5.1: Package version for package qt5-creator went backwards w=
hich would break package feeds from (0:3.5.1-r0.55 to 0:3.5.1-r0.0) [versio=
n-going-backwards]
qt5-creator-3.5.1: Package version for package qt5-creator went backwards w=
hich would break package feeds from (0:3.5.1-r0.62 to 0:3.5.1-r0.0) [versio=
n-going-backwards]
qt5-creator-3.5.1: Package version for package qt5-creator went backwards w=
hich would break package feeds from (0:3.5.1-r0.68 to 0:3.5.1-r0.0) [versio=
n-going-backwards]
udisks-1.0.5: Package version for package udisks-dbg went backwards which w=
ould break package feeds from (0:1.0.5-r0.55 to 0:1.0.5-r0.0) [version-goin=
g-backwards]
udisks-1.0.5: Package version for package udisks-dev went backwards which w=
ould break package feeds from (0:1.0.5-r0.55 to 0:1.0.5-r0.0) [version-goin=
g-backwards]
udisks-1.0.5: Package version for package udisks-doc went backwards which w=
ould break package feeds from (0:1.0.5-r0.55 to 0:1.0.5-r0.0) [version-goin=
g-backwards]
udisks-1.0.5: Package version for package udisks-locale-da went backwards w=
hich would break package feeds from (0:1.0.5-r0.55 to 0:1.0.5-r0.0) [versio=
n-going-backwards]
udisks-1.0.5: Package version for package udisks-staticdev went backwards w=
hich would break package feeds from (0:1.0.5-r0.55 to 0:1.0.5-r0.0) [versio=
n-going-backwards]
udisks-1.0.5: Package version for package udisks went backwards which would=
 break package feeds from (0:1.0.5-r0.55 to 0:1.0.5-r0.0) [version-going-ba=
ckwards]
udisks2-2.1.7: Package version for package udisks2-dbg went backwards which=
 would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [version-go=
ing-backwards]
udisks2-2.1.7: Package version for package udisks2-dev went backwards which=
 would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [version-go=
ing-backwards]
udisks2-2.1.7: Package version for package udisks2-doc went backwards which=
 would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [version-go=
ing-backwards]
udisks2-2.1.7: Package version for package udisks2-libs went backwards whic=
h would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [version-g=
oing-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-ar went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-as went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-az went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-bg went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-bn-in went backwa=
rds which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [v=
ersion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-ca+valencia went =
backwards which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0=
=2E0) [version-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-ca went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-cs went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-:2.1.7-r0.26 to 0:2.1.7-r0.0) [version-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-fa went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-fi went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-fo went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-fr went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-ga went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-gl went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-gu went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-he went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-hi went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-hr went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-hu went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-ia went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-id went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-it went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-ja went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-ka went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-kk went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-kn went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-ko went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-lt went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-lv went backwards=
 which would break package feeds disks2-2.1.7: Package version for package =
udisks2-locale-pa went backwards which would break package feeds from (0:2.=
1.7-r0.26 to 0:2.1.7-r0.0) [version-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-pl went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-pt-br went backwa=
rds which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [v=
ersion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-pt went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-ro went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-ru went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-sk went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-sl went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-sq went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-sr+latin went bac=
kwards which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0)=
 [version-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-sr went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-sv went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-ta went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-te went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-th went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-tr went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-uk went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-vi went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-wa went backwards=
 which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [vers=
ion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-zh-cn went backwa=
rds which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [v=
ersion-going-backwards]
udisks2-2.1.7: Package version for package udisks2-locale-zh-hk went backwa=
rds which would break package feeds from (0:2.1.7-r0.26 to 0:2.1.7-r0.0) [v=
ersage version for package webkitgtk-locale-bg went backwards which would b=
reak package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0.0) [version-going-bac=
kwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-ca went back=
wards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0.0)=
 [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-cs went back=
wards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0.0)=
 [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-de went back=
wards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0.0)=
 [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-el went back=
wards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0.0)=
 [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-en-ca went b=
ackwards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0=
=2E0) [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-en-gb went b=
ackwards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0=
=2E0) [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-eo went back=
wards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0.0)=
 [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-es went back=
wards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0.0)=
 [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-et went back=
wards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0.0)=
 [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-eu went back=
wards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0.0)=
 [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-fi went back=
wards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0.0)=
 [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-fr went back=
wards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0.0)=
 [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-gl went back=
wards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0.0)=
 [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-gu went back=
wards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0.0)=
 [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-he went back=
wards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0.0)=
 [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-hi went back=
wards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0.0)=
 [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-hu went back=
wards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0.0)=
 [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-id went back=
wards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0.0)=
 [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-it went back=
wards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0.0)=
 [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locag-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-or went back=
wards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0.0)=
 [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-pa went back=
wards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0.0)=
 [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-pl went back=
wards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0.0)=
 [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-pt-br went b=
ackwards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0=
=2E0) [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-pt went back=
wards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0.0)=
 [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-ro went back=
wards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0.0)=
 [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-ru went back=
wards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0.0)=
 [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-sl went back=
wards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0.0)=
 [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-sr+latin wen=
t backwards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2=
-r0.0) [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-sr went back=
wards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0.0)=
 [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-sv went back=
wards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0.0)=
 [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-ta went back=
wards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0.0)=
 [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-te went back=
wards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0.0)=
 [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-tr went back=
wards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0.0)=
 [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-uk went back=
wards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0.0)=
 [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-vi went back=
wards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0.0)=
 [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-locale-zh-cn went b=
ackwards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0=
=2E0) [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk-staticdev went back=
wards which would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0.0)=
 [version-going-backwards]
webkitgtk-2.14.2: Package version for package webkitgtk went backwards whic=
h would break package feeds from (0:2.14.2-r0.7 to 0:2.14.2-r0.0) [version-=
going-backwards]


count: 0	issue: host-user-contaminated


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0: use atomic builtins to avoid race issue
1bf299b dibbler: fix SRC_URI from ${P} to ${BP}
afc2462 fwts: upgrade to 17.01.00 release
45c31b9 iscsitarget: fix inconsistent crash while login to iscsi target fro=
m initiator
6145650 iscsitarget: use upstream to build with linux kernel >=3D 4.3
2a9ea01 iscsitarget: update patch to contain changes required to build with=
 only linux v4.8 and above
f117ead picocom: Fix build
3acab90 onboard: initial add 1.3.0
82bcd5d nginx: update to version 1.11.8
41fe28f python-ipaddress: update to version 1.0.18
8b4e12d python-flask-bootstrap: update to version 3.3.7.1
2c7f35e python-netaddr: update to version 0.7.19
4d5f0d6 tremor: add (from oe-core)
bd1f6c6 wireshark: update package to 2.2.4
c4613fc xfce: add dbus-glib-native to DEPENDS to fix do_configure
e892f64 luajit: mips and mipsel are 32bit targets too
f283c55 libgphoto2: remove bash runtime dependency.
8be0bab python-selectors34: add new recipe for version 1.1
f4c84de python-serpent: add new recipe for version 1.16
388cf39 python-pyro4: update to version 4.53
6842b3d python-psutil: upgrade to version 5.0.1
6aa5835 python-click: update to version 6.7
ed61215 python-cffi: Fix build for per-recipe sysroot.
ae2d4b1 python-ndg-httpsclient: Fix build for per recipe sysroot.
cb4f0e2 python-pyopenssl: Fix build for per recipe sysroot.
46925db jack: add ARM NEON support for sample conversions
8c7ad81 nano: upgrade to 2.7.4
f5a5f06 remove some more True options to getVar calls
a2f66e3 inetutils: register hostname.1 man page as an alternate
2314fae multipath-tools: fix building of shared objects
6368c36 multipath-tools: update to 0.6.4
84bd006 opencv: Configure freetype via PACKAGECONFIG
c8bda25 libnet-ssleay-perl: fix build error
3bb0a55 python-cffi: Don't overwrite inherited dependencies
b48ea43 python-pyopenssl: Don't overwrite inherited dependencies
3fb3195 python3-multidict: make repeated builds work even without sphinx
83638d3 python-pyyaml: add dependency on python
cdb9eea python-pytz: update to 2016.10
ddff506 gst-instruments: add recipe
2dc8a3f vboxguestdrivers: upgrade to 5.1.14 to fix compatibility with 4.9 k=
ernel
4affb52 geoclue: add missing dependency on gobject-introspection-native
be3399f lldpd: Update to version 0.9.6
97d6b81 typing: add version 3.5.3.0
da6a45c m2crypto: depend on typing
425f667 udisks2: add libxslt-native to DEPENDS for xsltproc to be in sysroot
07e9fa6 python-idna: update to version 2.2
dc15d85 python-pybind11: Update to version 2.0.1
a0f05d0 python-pyudev: update to version 0.21.0
421075b python-cryptography-vectors: add to the DEPENDS rather than replace
debc216 python-ndg-httpsclient: add to the DEPENDS rather than replace
a52b37b python-requests: update to version 2.13.0
de52921 python-lxml: update to version 3.7.2
001fe9a python-pytest: update version to 3.0.6
1dfdcc4 nginx: handle systemd service file
949194c postgresgl: update to 9.4.10 and build fix
8d4dead wireshark: fix build issue
ffb0b60 libatasmart: unify the complier and CFLAGS for host build
d602c2f ipmiutil: fix build issue
f4c85ec iperf: remove depricated package
9cc369b python-pycrypto: add app to meta-python
705d31b libtdb: fix SRC_URI - http has gone
2634b9c libtevent: fix SRC_URI - http has gone
6b73685 lm_sensors: update SRC_URI
d56ee38 netkit-ruser: update SRC_URI
f7ded2a ipsec-tools: change SRC_URI fetcher.
f0f8914 udisks: add missing hard dependency
be5311a initramfs-kexecboot-image: disable runtime dependency on run-postin=
sts
b3f0963 linux-yocto-tiny-kexecboot: remove obsoleted recipe
ef42fb8 lvm2: remove unbuildable 2.02.138
1187ed1 fulacklisted recipes

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
8ba2814 qtwebkit: depends on gperf-native
not included in master yet:=20
efa8aaf qmake5_base.bbclass: set qt.conf by environment variable again

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
dac70ab chromium: split patch 'Remove hard coded values for CC and CXX'
not included in master yet:=20
7e31067 firefox*: add missing dependencies on zip-native and unzip-native
9808dd1 firefox-addon-webconverger: add also unzip-native dependency
2747754 chromium-wayland: fix compilation problem on non-X11 builds

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
b848230 luneos-package: inhibit default deps and limit do_deploy deps
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
a04ef72 android-system: restore mount for hal-droid
not included in master yet:=20
4203314 libhybris: add dependency on wayland-native
61ea5c2 fso-gsm0710muxd, atd-over-fso, omext, e-wm-config-illume2-shr: Blac=
klist
5a81a58 recipes: blacklist recipes depending on blacklisted recipes
168796f recipes: blacklist recipes runtime depending on blacklisted recipes

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWKGu4gAKCRA3VSO3ZXaA
HDpMAJ9fQR+v4TPTR7rVAKfunT9qvRuu8gCbBZBXKDs4LnSTIdi8+ubC/YXrJGE=
=w0SZ
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
