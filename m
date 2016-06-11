Return-Path: <jianxun.zhang@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 949B26FFDA;
	Sat, 11 Jun 2016 00:04:53 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Jun 2016 17:04:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,452,1459839600"; d="scan'208";a="999624547"
Received: from jzhang80-mac02.jf.intel.com ([10.24.4.224])
	by fmsmga002.fm.intel.com with ESMTP; 10 Jun 2016 17:04:54 -0700
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Jianxun Zhang <jianxun.zhang@linux.intel.com>
In-Reply-To: <20160609070345.GA27764@jama>
Date: Fri, 10 Jun 2016 17:04:53 -0700
Message-Id: <D17ED517-A004-41BF-9C23-5877299F16C5@linux.intel.com>
References: <20160609070345.GA27764@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: State of bitbake world 2016-06-07
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
X-List-Received-Date: Sat, 11 Jun 2016 00:04:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Jun 9, 2016, at 12:03 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> This report includes python3 changes, there are few more failures, but
> it's hard to see what is new, so I've sent couple PNBLACKLISTs for
> recipes reported in previous 2 reports which are still failing with
> glibc-2.24 and gcc-6. Hopefully next report will show only "new" =
issues
> caused by python3 switch.
>=20
> =3D=3D Number of issues - stats =3D=3D
> {| class=3D'wikitable'
> !|Date		     !!colspan=3D'3'|Failed tasks			=
    !!colspan=3D'6'|Failed depencencies			 !!|Signatures		=
  !!colspan=3D'12'|QA !!Comment
> |-
> ||		||qemuarm	||qemux86	||qemux86_64	=
||qemuarm||max||min	||qemux86||max||min	||all 	=
||already-stripped	||libdir	||textrel	||build-deps	=
||file-rdeps	||version-going-backwards	||host-user-contaminated	=
||installed-vs-shipped	||unknown-configure-option	=
||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	||=09
> |-
> ||2016-06-07	||34	||40	||39	||84	||38	||37	||92	=
||42	||41	||0	||0		||0		||1		=
||3		||18		||0		||0		||0		=
||0		||0		||0		||0		||=09
> |}
>=20
> http://www.openembedded.org/wiki/Bitbake_World_Status
>=20
> =3D=3D Failed tasks 2016-06-07 =3D=3D
>=20
> INFO: jenkins-job.sh-1.8.10 Complete log available at =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.report.20160608_203844.=
log
>=20
> =3D=3D=3D common (31) =3D=3D=3D
>    * meta-browser/recipes-mozilla/firefox/firefox_38.7.1esr.bb, =
do_compile
>    * =
meta-openembedded/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb,=
 do_compile
>    * =
meta-openembedded/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.3=
2.1.bb, do_compile
>    * =
meta-openembedded/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.=
10.5.bb, do_compile
>    * =
meta-openembedded/meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb,=
 do_compile
>    * =
meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.3.bb, =
do_compile
>    * meta-openembedded/meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb, =
do_compile
>    * =
meta-openembedded/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb, =
do_compile
>    * =
meta-openembedded/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb, =
do_compile
>    * =
meta-openembedded/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb, =
do_compile
>    * =
meta-openembedded/meta-networking/recipes-connectivity/crda/crda_3.18.bb, =
do_compile
>    * =
meta-openembedded/meta-networking/recipes-connectivity/lftp/lftp_4.6.3a.bb=
, do_compile
>    * =
meta-openembedded/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb, =
do_compile
>    * =
meta-openembedded/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb, =
do_configure
>    * =
meta-openembedded/meta-oe/recipes-connectivity/libqmi/libqmi_1.12.6.bb, =
do_compile
>    * =
meta-openembedded/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb, =
do_compile
>    * =
meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb, =
do_compile
>    * =
meta-openembedded/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb, =
do_compile
>    * =
meta-openembedded/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb=
, do_compile
>    * meta-openembedded/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb, =
do_compile
>    * =
meta-openembedded/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08=
.bb, do_configure
>    * meta-openembedded/meta-oe/recipes-navigation/geos/geos_3.4.2.bb, =
do_compile
>    * =
meta-openembedded/meta-oe/recipes-support/canonical-multitouch/grail_3.1.0=
.bb, do_compile
>    * =
meta-openembedded/meta-oe/recipes-support/libjs/libjs-jquery_1.7.2.bb, =
do_unpack
>    * meta-openembedded/meta-oe/recipes-support/opencv/opencv_3.1.bb, =
do_compile
>    * =
meta-openembedded/meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb, =
do_compile
>    * =
meta-openembedded/meta-oe/recipes-support/postgresql/postgresql_9.4.5.bb, =
do_configure
>    * meta-openembedded/meta-oe/recipes-test/fwts/fwts_git.bb, =
do_compile
>    * meta-openembedded/meta-ruby/recipes-devtools/ruby/bundler_git.bb, =
do_fetch
>    * =
meta-smartphone/meta-fso/recipes-freesmartphone/freesmartphone/libframewor=
kd-glib_git.bb, do_compile
>    * =
meta-webos-ports/meta-luneui/recipes-webos/librolegen/librolegen.bb, =
do_compile
>=20
> =3D=3D=3D common-x86 (8) =3D=3D=3D
>    * meta-browser/recipes-browser/chromium/cef3_280796.bb, do_compile
>    * meta-browser/recipes-browser/chromium/chromium_48.0.2548.0.bb, =
do_compile
>    * =
meta-openembedded/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb, =
do_compile
>    * =
meta-openembedded/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb, =
do_compile
>    * meta-openembedded/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb, =
do_compile
>    * meta-openembedded/meta-oe/recipes-support/espeak/espeak_1.37.bb, =
do_compile
>    * =
meta-openembedded/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.4.bb=
, do_compile
>    * openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb, =
do_compile
>=20
> =3D=3D=3D qemuarm (3) =3D=3D=3D
>    * meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.1.3.bb, =
do_compile
>    * =
meta-openembedded/meta-oe/recipes-support/poppler/poppler_0.43.0.bb, =
do_compile
>    * openembedded-core/meta/recipes-bsp/systemd-boot/systemd-boot.bb, =
do_compile

Hi,
I don=E2=80=99t think systemd-boot (derived from gummiboot recipe) =
supports this arch. I will submit a patch to set COMPATIBLE_HOST as =
gummiboot does, so that it stops build properly for unsupported =
platforms. But I am not sure if such change will help to filter this =
error out at your side.

Thanks



>=20
> =3D=3D=3D qemux86 (1) =3D=3D=3D
>    * =
meta-openembedded/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb, =
do_compile
>=20
> =3D=3D=3D qemux86_64 (0) =3D=3D=3D
>=20
> =3D=3D=3D Number of failed tasks (113) =3D=3D=3D
> {| class=3Dwikitable
> |-
> || qemuarm 	|| 34	 || =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.world.qemuarm.20160606_=
013746.log/ ||=20
> |-
> || qemux86 	|| 40	 || =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.world.qemux86.20160606_=
044822.log/ ||=20
> |-
> || qemux86_64 	|| 39	 || =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.world.qemux86-64.201606=
07_035028.log/ ||=20
> |}
>=20
> =3D=3D=3D PNBLACKLISTs (91) =3D=3D=3D
>=20
> =3D=3D=3D QA issues (22) =3D=3D=3D
> {| class=3Dwikitable
> !| Count		||Issue
> |-
> ||0	||already-stripped
> |-
> ||0	||host-user-contaminated
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
> ||0	||version-going-backwards
> |-
> ||18	||file-rdeps
> |-
> ||1	||textrel
> |-
> ||3	||build-deps
> |}
>=20
>=20
>=20
> =3D=3D=3D Failed dependencies for qemuarm (84) =3D=3D=3D
>=20
> Complete log: =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log/
> Found differences:=20
>    * WARN: samba: samba rdepends on libpam, but it isn't a build =
dependency?
>    * WARN: libdrm: libdrm-tests rdepends on cunit, but it isn't a =
build dependency?
>    * WARN: libdrm: libdrm-tests rdepends on libdrm-amdgpu, but it =
isn't a build dependency?
>    * WARN: jasper: jasper-bin rdepends on freeglut, but it isn't a =
build dependency?
>    * WARN: jasper: jasper-bin rdepends on libgl-mesa, but it isn't a =
build dependency?
>    * WARN: jasper: jasper-bin rdepends on libglu, but it isn't a build =
dependency?
>    * WARN: enchant: enchant rdepends on hunspell, but it isn't a build =
dependency?
> Found errors:=20
>    * ERROR: 84 issues were found in these recipes: bundler =
chkconfig-alternatives-native collectd crash crda curlpp enchant =
fbreader firefox fwts geos glcompbench glmark2 gnome-session =
gnome-terminal goffice grail gtkmathview gtksourceview2 jasper lftp =
libdrm libframeworkd-glib libgnomeui libgweather libjs-jquery libqmi =
librolegen meta-world-pkgdata netmap opencv openwbem poppler postgresql =
proxy-libintl samba systemd-boot tasks tcsh thrift tvheadend wvstreams
>=20
> =3D=3D=3D Recipes failing with maximal dependencies for qemuarm (38) =
=3D=3D=3D
>    * bundler -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/bundler.log
>    * chkconfig-alternatives-native -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/chkconfig-alternatives-native.log
>    * collectd -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/collectd.log
>    * crash -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/crash.log
>    * crda -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/crda.log
>    * curlpp -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/curlpp.log
>    * fbreader -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/fbreader.log
>    * firefox -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/firefox.log
>    * fwts -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/fwts.log
>    * geos -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/geos.log
>    * glcompbench -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/glcompbench.log
>    * glmark2 -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/glmark2.log
>    * gnome-session -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/gnome-session.log
>    * gnome-terminal -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/gnome-terminal.log
>    * goffice -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/goffice.log
>    * grail -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/grail.log
>    * gtkmathview -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/gtkmathview.log
>    * gtksourceview2 -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/gtksourceview2.log
>    * lftp -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/lftp.log
>    * libframeworkd-glib -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/libframeworkd-glib.log
>    * libgnomeui -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/libgnomeui.log
>    * libgweather -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/libgweather.log
>    * libjs-jquery -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/libjs-jquery.log
>    * libqmi -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/libqmi.log
>    * librolegen -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/librolegen.log
>    * meta-world-pkgdata -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/meta-world-pkgdata.log
>    * netmap -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/netmap.log
>    * opencv -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/opencv.log
>    * openwbem -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/openwbem.log
>    * poppler -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/poppler.log
>    * postgresql -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/postgresql.log
>    * proxy-libintl -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/proxy-libintl.log
>    * systemd-boot -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/systemd-boot.log
>    * tasks -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/tasks.log
>    * tcsh -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/tcsh.log
>    * thrift -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/thrift.log
>    * tvheadend -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/tvheadend.log
>    * wvstreams -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//2_max/failed/wvstreams.log
>=20
> =3D=3D=3D Recipes failing with minimal dependencies for qemuarm (37) =
=3D=3D=3D
>    * bundler -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/bundler.log
>    * collectd -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/collectd.log
>    * crash -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/crash.log
>    * crda -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/crda.log
>    * curlpp -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/curlpp.log
>    * fbreader -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/fbreader.log
>    * firefox -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/firefox.log
>    * fwts -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/fwts.log
>    * geos -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/geos.log
>    * glcompbench -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/glcompbench.log
>    * glmark2 -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/glmark2.log
>    * gnome-session -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/gnome-session.log
>    * gnome-terminal -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/gnome-terminal.log
>    * goffice -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/goffice.log
>    * grail -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/grail.log
>    * gtkmathview -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/gtkmathview.log
>    * gtksourceview2 -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/gtksourceview2.log
>    * lftp -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/lftp.log
>    * libframeworkd-glib -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/libframeworkd-glib.log
>    * libgnomeui -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/libgnomeui.log
>    * libgweather -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/libgweather.log
>    * libjs-jquery -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/libjs-jquery.log
>    * libqmi -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/libqmi.log
>    * librolegen -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/librolegen.log
>    * meta-world-pkgdata -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/meta-world-pkgdata.log
>    * netmap -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/netmap.log
>    * opencv -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/opencv.log
>    * openwbem -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/openwbem.log
>    * poppler -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/poppler.log
>    * postgresql -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/postgresql.log
>    * proxy-libintl -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/proxy-libintl.log
>    * systemd-boot -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/systemd-boot.log
>    * tasks -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/tasks.log
>    * tcsh -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/tcsh.log
>    * thrift -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/thrift.log
>    * tvheadend -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/tvheadend.log
>    * wvstreams -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20=
160607_022128.log//3_min/failed/wvstreams.log
>=20
> =3D=3D=3D Failed dependencies for qemux86 (92) =3D=3D=3D
>=20
> Complete log: =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log/
> Found differences:=20
>    * WARN: jasper: jasper-bin rdepends on freeglut, but it isn't a =
build dependency?
>    * WARN: jasper: jasper-bin rdepends on libgl-mesa, but it isn't a =
build dependency?
>    * WARN: jasper: jasper-bin rdepends on libglu, but it isn't a build =
dependency?
>    * WARN: samba: samba rdepends on libpam, but it isn't a build =
dependency?
>    * WARN: libdrm: libdrm-tests rdepends on cunit, but it isn't a =
build dependency?
>    * WARN: libdrm: libdrm-tests rdepends on libdrm-amdgpu, but it =
isn't a build dependency?
>    * WARN: enchant: enchant rdepends on hunspell, but it isn't a build =
dependency?
> Found errors:=20
>    * ERROR: 92 issues were found in these recipes: bundler cef3 =
chkconfig-alternatives-native chromium collectd crda curlpp enchant =
espeak evince faac fbreader firefox fwts geos glcompbench glmark2 =
gnome-session gnome-terminal goffice grail gtkmathview gtksourceview2 =
iperf ipmiutil jasper lftp libdrm libframeworkd-glib libgnomeui =
libgweather libjs-jquery libqmi librolegen netmap opencv open-vcdiff =
openwbem piglit postgresql proxy-libintl samba tasks tcsh thrift =
tvheadend wvstreams
>=20
> =3D=3D=3D Recipes failing with maximal dependencies for qemux86 (42) =
=3D=3D=3D
>    * bundler -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/bundler.log
>    * cef3 -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/cef3.log
>    * chkconfig-alternatives-native -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/chkconfig-alternatives-native.log
>    * chromium -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/chromium.log
>    * collectd -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/collectd.log
>    * crda -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/crda.log
>    * curlpp -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/curlpp.log
>    * espeak -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/espeak.log
>    * evince -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/evince.log
>    * faac -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/faac.log
>    * fbreader -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/fbreader.log
>    * firefox -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/firefox.log
>    * fwts -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/fwts.log
>    * geos -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/geos.log
>    * glcompbench -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/glcompbench.log
>    * glmark2 -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/glmark2.log
>    * gnome-session -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/gnome-session.log
>    * gnome-terminal -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/gnome-terminal.log
>    * goffice -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/goffice.log
>    * grail -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/grail.log
>    * gtkmathview -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/gtkmathview.log
>    * gtksourceview2 -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/gtksourceview2.log
>    * iperf -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/iperf.log
>    * lftp -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/lftp.log
>    * libframeworkd-glib -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/libframeworkd-glib.log
>    * libgnomeui -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/libgnomeui.log
>    * libgweather -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/libgweather.log
>    * libjs-jquery -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/libjs-jquery.log
>    * libqmi -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/libqmi.log
>    * librolegen -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/librolegen.log
>    * netmap -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/netmap.log
>    * opencv -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/opencv.log
>    * open-vcdiff -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/open-vcdiff.log
>    * openwbem -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/openwbem.log
>    * piglit -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/piglit.log
>    * postgresql -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/postgresql.log
>    * proxy-libintl -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/proxy-libintl.log
>    * tasks -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/tasks.log
>    * tcsh -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/tcsh.log
>    * thrift -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/thrift.log
>    * tvheadend -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/tvheadend.log
>    * wvstreams -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//2_max/failed/wvstreams.log
>=20
> =3D=3D=3D Recipes failing with minimal dependencies for qemux86 (41) =
=3D=3D=3D
>    * bundler -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//3_min/failed/bundler.log
>    * cef3 -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//3_min/failed/cef3.log
>    * chromium -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//3_min/failed/chromium.log
>    * collectd -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//3_min/failed/collectd.log
>    * crda -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//3_min/failed/crda.log
>    * curlpp -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//3_min/failed/curlpp.log
>    * espeak -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//3_min/failed/espeak.log
>    * evince -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//3_min/failed/evince.log
>    * faac =
s.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20160608_003=
323.log//3_min/failed/firefox.log
>    * fwts -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//3_min/failed/fwts.log
>    * geos -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//3_min/failed/geos.log
>    * glcompbench -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//3_min/failed/glcompbench.log
>    * glmark2 -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//3_min/failed/glmark2.log
>    * gnome-session -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//3_min/failed/gnome-session.log
>    * gnome-terminal -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//3_min/failed/gnome-terminal.log
>    * goffice -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//3_min/failed/goffice.log
>    * grail -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//3_min/failed/grail.log
>    * gtkmathview -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//3_min/failed/gtkmathview.log
>    * gtksourceview2 -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//3_min/failed/gtksourceview2.log
>    * iperf -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//3_min/failed/iperf.log
>    * lftp -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//3_min/failed/lftp.log
>    * libframeworkd-glib -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//3_min/failed/libframeworkd-glib.log
>    * libgnomeui -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//3_min/failed/libgnomeui.log
>    * libgweather -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//3_min/failed/libgweather.log
>    * libjs-jquery -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//3_min/failed/libjs-jquery.log
>    * libqmi -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//3_min/failed/libqmi.log
>    * librolegen -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//3_min/failed/librolegen.log
>    * netmap -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//3_min/failed/netmap.log
>    * opencv -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//3_min/failed/opencv.log
>    * open-vcdiff -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//3_min/failed/open-vcdiff.log
>    * openwbem -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//3_min/failed/openwbem.log
>    * piglit -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//3_min/failed/piglit.log
>    * postgresql -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//3_min/failed/postgresql.log
>    * proxy-libintl -- =
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20=
160608_003323.log//3_min/failed/proxy-libintl.log qemux86copy in =
/home/jenkins/oe/world/shr-core/tmp-glibc/stamps
>    * ERROR: no sigdata files were generated for MACHINE qemux86 in =
/home/jenkins/oe/world/shr-core/tmp-glibc/stamps
>    * ERROR: no sigdata files were generated for MACHINE qemuarm in =
/home/jenkins/oe/world/shr-core/tmp-glibc/stamps
>=20
>=20
> PNBLACKLISTs:
> openembedded-core/:
> meta-browser:
> meta-openembedded:
> meta-efl/recipes-efl/e17/diskio_svn.bb:PNBLACKLIST[diskio] ?=3D =
"broken: switch to =
https://git.enlightenment.org/enlightenment/modules/diskio.git/ and fix =
0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58. =
invalid state name: 'off'. "default" state must always be first."
> meta-efl/recipes-efl/e17/elbow_git.bb:PNBLACKLIST[elbow] ?=3D "Depends =
on blacklisted webkit-efl"
> meta-efl/recipes-efl/e17/elmdentica_svn.bb:PNBLACKLIST[elmdentica] ?=3D =
"OLD and depends on broken azy"
> meta-efl/recipes-efl/e17/emprint_svn.bb:PNBLACKLIST[emprint] ?=3D "if =
you want to use these modules with E18, then you need to update it to =
git recipe fetching newer sources from =
http://git.enlightenment.org/apps/emprint.git/"
> meta-efl/recipes-efl/e17/news_svn.bb:PNBLACKLIST[news] ?=3D "if you =
want to use these modules with E18, then you need to update it to git =
recipe fetching newer sources from =
http://git.enlightenment.org/enlightenment/modules/news.git/"
> meta-efl/recipes-efl/e17/rage_svn.bb:PNBLACKLIST[rage] ?=3D "if you =
want to use these modules with E18, then you need to update it to git =
recipe fetching newer sources from  =
http://git.enlightenment.org/apps/rage.git/"
> meta-efl/recipes-efl/e17/screenshot_svn.bb:PNBLACKLIST[screenshot] ?=3D =
"depends on blacklisted emprint"
> meta-efl/recipes-efl/efl/azy_svn.bb:PNBLACKLIST[azy] ?=3D "OLD and =
doesn't build with gcc-5"
> meta-efl/recipes-efl/efl/engrave_svn.bb:PNBLACKLIST[engrave] ?=3D =
"BROKEN: fails to build with latest oe-core"
> meta-efl/recipes-efl/efl/entrance_svn.bb:PNBLACKLIST[entrance] ?=3D =
"broken: switch to https://git.enlightenment.org/misc/entrance.git and =
fix 0.0.4+svnr82070-r7/entrance/data/themes/old/default.edc:678. invalid =
state name: 'defaault'. "default" state must always be first."
> meta-efl/recipes-efl/webkit/webkit-efl.inc:PNBLACKLIST[webkit-efl] ?=3D =
"Old and unmaintaned fork with many security issues"
> meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb:PNBLACKLIST[mcnavi] =
?=3D "BROKEN: latest version 0.3.4 is 3 years old and now broken with =
more strict ejde_cc from efl-1.13"
> =
meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb:PNBLACKLIST[epdfview] =
?=3D "BROKEN: images are not displayed anymore"
> =
meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[g=
nome-mplayer] ?=3D "rdepends on blacklisted mplayer"
> =
meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb:P=
NBLACKLIST[gtk-theme-torturer] ?=3D "BROKEN: gmacros.h:182:53: error: =
size of array '_GStaticAssertCompileTimeAssertion_2' is negative"
> =
meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb:PNBLACKLIST[gcalcto=
ol] ?=3D "broken at least since April 2013 =
http://permalink.gmane.org/gmane.comp.handhelds.openembedded/57920 and =
nobody complained, it's also replaced by gnome calculator"
> =
meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLIST=
[gnome-keyring] ?=3D "This version conflicts with gcr from oe-core"
> =
meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb:PNBLACKLIST[gn=
ome-menus3] ?=3D "CONFLICT: 24 files are conflicting with gnome-menus"
> =
meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gno=
me-panel3] ?=3D "CONFLICT: depends on libgweather3 which conflicts with =
libgweather"
> meta-gnome/recipes-gnome/gnome-power-manager/g maybe missing =
dependency on gnome-desktop-utils.h provider"
> =
meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb:PNBL=
ACKLIST[system-tools-backends] ?=3D "does not build with distroless =
qemuarm as reported in 'State of bitbake world' thread, nobody =
volunteered to fix them"
> meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] =
?=3D "BROKEN: doesn't build with B!=3DS"
> meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:PNBLACKLIST[xbmc] =
?=3D "/usr/include/c++/ctime:70:11: error: '::gmtime' has not been =
declared"
> =
meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb:PNBLACKLIST[mkvto=
olnix] ?=3D "BROKEN: Failx to build with gcc-5"
> =
meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:PNBLACKLIS=
T[coriander] ?=3D "BROKEN: fails to use SDL probably because =
libsdl-config was removed, error: unknown type name 'SDL_Overlay'"
> =
meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb:P=
NBLACKLIST[renderer-service-upnp] ?=3D "BROKEN: doesn't build with B!=3DS =
(trying to install rendererconsole.py from ${B} instead of ${S})"
> =
meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg_0.10.13.bb:PN=
BLACKLIST[gst-ffmpeg] ?=3D "Not compatible with currently used ffmpeg 3"
> =
meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb:PNBLACKLIST[g=
st123] ?=3D "gst123 is still "sometimes" using wrong sysroot"
> =
meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb:PNBLACKLIST[sn=
ort] ?=3D "BROKEN: QA Issue: snort_preproc.pc, snort_output.pc, =
snort.pc"
> meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb:PNBLACKLIST[dnrd] =
?=3D "BROKEN: dnrd-2.20.3-r0 do_package: QA Issue: dnrd: =
Files/directories were installed but not shipped in any package:"
> =
meta-networking/recipes-daemons/squid/squid_3.5.7.bb:PNBLACKLIST[squid] =
?=3D "BROKEN: sysroots/qemuarm/usr/include/linux/in.h:28:16: error: =
redeclaration of 'IPPROTO_IP'"
> =
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:PNBLAC=
KLIST[lksctp-tools] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', =
'ld-is-gold', "BROKEN: fails to link against sctp_connectx symbol", '', =
d)}"
> =
meta-networking/recipes-support/nis/yp-tools_3.3.bb:PNBLACKLIST[yp-tools] =
?=3D "BROKEN: fails to build for qemuarm."
> =
meta-networking/recipes-support/nis/ypbind-mt_2.2.bb:PNBLACKLIST[ypbind-mt=
] ?=3D "BROKEN: Depends on broken yp-tools"
> =
meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNBLACKLIST[bluez-=
hcidump] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 =
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', =
d)}"
> meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4] =
?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 =
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', =
d)}"
> =
meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:PNBLACKLI=
ST[gst-plugin-bluetooth] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', =
'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in =
DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] =
?=3D "BROKEN: depends on broken libftdi"
> =
meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zero=
c-ice] ?=3D "BROKEN: not compatible with default db version"
> meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb:PNBLACKLIST[fakeroot] =
?=3D "BROKEN: QA Issue: -dev package contains non-symlink .so"
> meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb:PNBLACKLIST[cloud9] ?=3D =
"Not comatible with current nodejs 0.12, but upstream is working on it =
for v3"
> meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb:PNBLACKLIST[ltp-ddt] =
?=3D "BROKEN: fails since lKEN: depends on old deprecated libopkg which =
is currently disabled and will be removed soon"
> =
meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurfa=
ce] ?=3D "Needs to be upgraded for compatibility with new =
libdivecomputer"
> meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb:PNBLACKLIST[gtkextra] =
?=3D "BROKEN: Fails to build with gcc-5"
> =
meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-=
box2d] ?=3D "BROKEN: doesn't build with B!=3DS"
> meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?=3D =
"BROKEN: doesn't build with B!=3DS (flex: can't open lex.lex)"
> meta-oe/recipes-graphics/slim/slim_1.3.2.bb:PNBLACKLIST[slim] ?=3D =
"does not build with distroless qemuarm as reported in 'State of bitbake =
world' thread, nobody volunteered to fix them"
> =
meta-oe/recipes-graphics/tesseract/tesseract_3.02.02.bb:PNBLACKLIST[tesser=
act] ?=3D "BROKEN: QA Issue: tesseract.pc failed sanity test (tmpdir)"
> =
meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[xf=
86-input-mtev] ?=3D "BROKEN: doesn't build with B!=3DS (Makefile without =
${S} in sed call)"
> =
meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:PNBLACKLI=
ST[xf86-video-geode] ?=3D "BROKEN, fails to build"
> =
meta-oe/recipes-kernel/ktap/ktap-module_git.bb:PNBLACKLIST[ktap-module] =
?=3D "Not compatible with 3.19 kernel"
> meta-oe/recipes-kernel/ktap/ktap_git.bb:PNBLACKLIST[ktap] ?=3D =
"Depends on blacklisted kernel-module-ktapvm"
> =
meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb:PNBLACKLIST[mplayer2] =
?=3D "Not compatible with currently used ffmpeg 3"
> =
meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxt=
rotgps] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 =
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', =
d)}"
> meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb:PNBLACKLIST[gdal] ?=3D =
"BROKEN: fails to build with gcc-5"
> meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=3D =
"${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts =
with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=3D =
"${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts =
with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> =
meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb:PNBLACKLIST[claws-mail=
] ?=3D "depends on blacklisted libetpan"
> =
meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb:PNBLA=
CKLIST[claws-plugin-gtkhtml2-viewer] ?=3D "depends on blacklisted =
claws-mail"
> =
meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb:PNBLACKLIST[=
claws-plugin-mailmbox] ?=3D "depends on blacklisted claws-mail"
> =
meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb:PNBLACKLIST[cla=
ws-plugin-rssyl] ?=3D "depends on blacklisted claws-mail"
> =
meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd] =
?=3D "BROKEN: doesn't build with B!=3DS"
> meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?=3D =
"qemu: uncaught target signal 11 (Segmentation fault) - core dumped"
> meta-oe/recipes-support/fftw/benchfft_3.1.bb:PNBLACKLIST[benchfft] ?=3D =
"does not build with distroless qemuarm as reported in 'State of bitbake =
world' thread, nobody volunteered to fix them"
> meta-oe/recipes-support/iksemel/iksemel_1.4.bb:PNBLACKLIST[iksemel] ?=3D=
 "Not compatible with gnutls version 3.4 currently in oe-core"
> =
meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb:PNBLACKLIST[libdb=
i-drivers] ?=3D "BROKEN: fails to build with gcc-5"
> =
meta-oe/recipes-support/libetpan/libetpan_0.57.bb:PNBLACKLIST[libetpan] =
?=3D "Not compatible with gnuidgin-otr_4.0.0.bb:PNBLACKLIST[pidgin-otr] =
?=3D "depends on blacklisted pidgin"
> =
meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[val=
a-terminal] ?=3D "BROKEN: Doesn't work with B!=3DS, touch: cannot touch =
`src/.stamp': No such file or directory"
> meta-qt5:
> meta-smartphone:
> =
meta-fso/recipes-freesmartphone/freesmartphone/zhone_git.bb:PNBLACKLIST[zh=
one] ?=3D "rdepends on python-pycairo which was removed"
> =
meta-shr/recipes-shr/3rdparty/advancedcaching_git.bb:PNBLACKLIST[advancedc=
aching] ?=3D "RDEPENDS on python-pygtk was removed from oe-core"
> meta-shr/recipes-shr/3rdparty/emtooth2_svn.bb:PNBLACKLIST[emtooth2] ?=3D=
 "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts =
with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] =3D =
"Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/gwaterpas_0.3.bb:PNBLACKLIST[gwaterpas] =
?=3D "broken: depends on blacklisted fltk"
> meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] =3D =
"Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] =3D =
"rdepends on blacklisted mplayer2"
> meta-shr/recipes-shr/3rdparty/jefliks_git.bb:PNBLACKLIST[jefliks] ?=3D =
"depends on blacklisted iksemel"
> =
meta-shr/recipes-shr/3rdparty/openmoko-gps_svn.bb:PNBLACKLIST[openmoko-gps=
] ?=3D "RDEPENDS on python-pygtk which was removed from oe-core"
> meta-shr/recipes-shr/3rdparty/pisi_0.5.3.bb:PNBLACKLIST[pisi] ?=3D =
"RDEPENDS on python-pygtk which was removed from oe-core"
> meta-shr/recipes-shr/3rdparty/podboy_svn.bb:PNBLACKLIST[podboy] ?=3D =
"${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts =
with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] =3D =
"Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> =
meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompass] =
=3D "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> =
meta-shr/recipes-shr/shr/shr-installer_git.bb:PNBLACKLIST[shr-installer] =
?=3D "Depends on blacklisted packagekit"
> meta-webos-ports:
> PNBLACKLIST[android-system] =3D "depends on lxc from =
meta-virtualiazation which isn't included in my world builds"
> PNBLACKLIST[bigbuckbunny-1080p] =3D "big and doesn't really need to be =
tested so much"
> PNBLACKLIST[bigbuckbunny-480p] =3D "big and doesn't really need to be =
tested so much"
> PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be =
tested so much"
> PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be =
tested so much"
> PNBLACKLIST[tearsofsteel-1080p] =3D "big and doesn't really need to be =
tested so much"
> PNBLACKLIST[build-appliance-image] =3D "tries to include whole =
downloads directory in /home/builder/poky :/"
> PNBLACKLIST[linux-yocto-tiny-kexecboot] =3D "does weird sh!t breaking =
other kernels and modules - broken for years"
> PNBLACKLIST[linux-yocto-tiny] =3D "does weird sh!t breaking other =
kernels and modules - broken for years"
>=20
>=20
> QA issues by type:
> count: 0	issue: already-stripped
>=20
>=20
> count: 0	issue: libdir
>=20
>=20
> count: 1	issue: textrel
> corosync-2.3.5: ELF binary =
'/tmp/work/core2-64-oe-linux/corosync/2.3.5-r0/packages-split/corosync/usr=
/sbin/corosync' has relocations in .text [textrel]
>=20
>=20
> count: 3	issue: build-deps
> qtcharts-5.6.99+5.7.0-beta+gitAUTOINC+8a78184181: qtcharts-examples =
rdepends on qtmultimedia, but it isn't a build dependency, missing =
qtmultimedia in DEPENDS or PACKAGECONFIG? [build-deps]
> qtwayland-5.6.99+5.7.0-beta+gitAUTOINC+d27075a3f9: qtwayland-plugins =
rdepends ined in package whiptail requires libnewt.so()(64bit), but no =
providers found in RDEPENDS_whiptail? [file-rdeps]
> libnewt-0.52.18: /usr/bin/whiptail contained in package whiptail =
requires libnewt.so, but no providers found in RDEPENDS_whiptail? =
[file-rdeps]
> libnewt-python-0.52.18: /usr/lib/python3.5/site-packages/_snack.so =
contained in package libnewt-python requires libnewt.so()(64bit), but no =
providers found in RDEPENDS_libnewt-python? [file-rdeps]
> libnewt-python-0.52.18: /usr/lib/python3.5/site-packages/_snack.so =
contained in package libnewt-python requires libnewt.so, but no =
providers found in RDEPENDS_libnewt-python? [file-rdeps]
> networkmanager-1.0.10: /usr/bin/nmtui-connect contained in package =
networkmanager-nmtui requires libnewt.so, but no providers found in =
RDEPENDS_networkmanager-nmtui? [file-rdeps]
> networkmanager-1.0.10: /usr/bin/nmtui contained in package =
networkmanager-nmtui requires libnewt.so()(64bit), but no providers =
found in RDEPENDS_networkmanager-nmtui? [file-rdeps]
> networkmanager-1.0.10: /usr/bin/nmtui-hostname contained in package =
networkmanager-nmtui requires libnewt.so, but no providers found in =
RDEPENDS_networkmanager-nmtui? [file-rdeps]
> numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert_all.sh =
contained in package numptyphysics requires /bin/bash, but no providers =
found in RDEPENDS_numptyphysics? [file-rdeps]
> numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert.pl =
contained in package numptyphysics requires /usr/bin/perl, but no =
providers found in RDEPENDS_numptyphysics? [file-rdeps]
> ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: /usr/bin/memory-map.sh =
contained in package ubx-utils requires /bin/bash, but no providers =
found in RDEPENDS_ubx-utils? [file-rdeps]
> xfsprogs-3.2.3: /sbin/mkfs.xfs contained in package xfsprogs-mkfs =
requires libxfs.so.0()(64bit), but no providers found in =
RDEPENDS_xfsprogs-mkfs? [file-rdeps]
> xfsprogs-3.2.3: /sbin/mkfs.xfs contained in package xfsprogs-mkfs =
requires libxfs.so.0, but no providers found in RDEPENDS_xfsprogs-mkfs? =
[file-rdeps]
> xfsprogs-3.2.3: /sbin/xfs_repair contained in package xfsprogs =
requires libxlog.so.0()(64bit), but no providers found in =
RDEPENDS_xfsprogs? [file-rdeps]
> xfsprogs-3.2.3: /sbin/xfs_repair contained in package xfsprogs =
requires libxlog.so.0, but no providers found in RDEPENDS_xfsprogs? =
[file-rdeps]
> xfsprogs-3.2.3: /usr/sbin/xfs_db contained in package xfsprogs =
requires libxlog.so.0, but no providers found in RDEPENDS_xfsprogs? =
[file-rdeps]
>=20
>=20
> count: 0	issue: version-going-backwards
>=20
>=20
> count: 0	issue: host-user-contaminated
>=20
>=20
> count: 0	issue: installed-vs-shipped
>=20
>=20
> count: 0	issue: unknown-configure-option
>=20
>=20
> count: 0	issue: symlink-to-sysroot
>=20
>=20
> count: 0	issue: invalid-pkgconfig
>=20
>=20
> count: 0	issue: pkgname
>=20
>=20
>=20
> =3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
> latest upstream commit:=20
> 12d43cf codeparser: Use hashlib for hashing, not hash()
> not included in master yet:=20
> b24dc0c world-image: add extra target
>=20
> =3D=3D Tested changes (not included in master yet) - openembedded-core =
=3D=3D
> latest upstream commit:=20
> 554719e lib/oe/package_manager: adapt for Python 3
> not included in master yet:=20
> 657fe0b tcl: Only set BINCONFIG_GLOB for target builds
> e03021f qemux86: Add identical qemux86copy variant for tests
> 8b7c15c sstate-sysroot-cruft.sh: Extend the whitelist
> 0429a13 recipes: Replace "cp -a" with "cp -R --no-dereference =
--preserve=3Dmode,links"
> bf7ee9d buildhistory.bbclass: metadata-revs show repo parent
> 684b4c7 metadata-revs: provide more information
> 85f915a report-error: Allow to upload reports automatically
> 847b70f rm_work: exclude all kernel recipes
> b594181 report-error.bbclass: use urllib2 instead of httplib, urllib
>=20
> =3D=3D Tested changes (not included in master yet) - meta-openembedded =
=3D=3D
> latest upstream commit:=20
> 7be16bc libldb: add missing libaio dependency
> not included in master yet:=20
> d84a19b android-tools: Fix, enhance and move from meta-shr
> b6d7763 openconnect: add dependency to fix Makefile.am
> 3258564 openconnect: fix do_compile failure
> a9e0edc libass: add newer version
> fb9be15 mpv: Media Player
> e569471 geany-plugins: fix build
> edc72a8 dvd-apps: Fix several QA WARNINGS
> d6c6325 python-simplejson: change to setuptools
> fbd1928 gnome-menus: Fix QA warnings.
> 40529b3 nodejs: update to 4.4.5
> 36e9abb efivar-native: fix compile failure with older host gcc (<=3D4.6)=

> 59a10ea luajit: fix build issues, obey more vars
> 37f0591 plymouth: allow disabling the dracut dep
> 2166954 nano: fix license to GPLv3.
> ffba5cc Remove unnecessary exports of HOST_SYS and BUILD_SYS in =
python-based recipes
> 8fbc22f python-dbus: add a recipe
> cdd4cbb python-imaging: add a recipe
> 3da208d python-pyrex: add a recipe
> 30f6fe3 python-pygobject: add a recipe
> 5d94e83 cmpi-bindings: fix build with python 3
> 8917ac7 gnome-doc-utils-stub: add a recipe
> 709d54c gitkpkgv: Ensure files are closed
> e66e525 netmap-modules: Avoid type warning with python v3
> 2c7f6fd abiword, gnome-vfs: Use print as a function
> 3472b87 opencv: Make gphoto2 dep optional via PACKAGECONFIG
> 621e0ab opencv: Reorder PACKAGES variable
> caca303 syslog-ng: expand service file @variables@ earlier
> 588c4f2 python-backports-abc: initial recipe for version 0.4
> 39682b0 python-singledispatch: initial recipe for version 3.4.0.3
> 0f38acf python-tornado: add missing python2 runtime deps
> 232ca00 nginx: update stable version to 1.10.1
> 47b0d31 nginx: update to version 1.11.1
> 1cf0d1a libftdi: update to 1.3
> 38cb249 mpd: update to 0.19.15
> 6a47019 toybox: Upgrade to 0.7.1
> 0733b10 meta-oe: override SECURITY_CFLAGS for llvm3.3
>=20
> =3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
> latest upstream commit:=20
> 27617dd qtchooser: add new recipe
> not included in master yet:=20
>=20
> =3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D=

> latest upstream commit:=20
> 825ea93 chromium: Add workarounds for compiler errors
> not included in master yet:=20
>=20
> =3D=3D Tested changes (not included in master yet) - meta-webos-ports =
=3D=3D
> latest upstream commit:=20
> 59b9beb foundation-frameworks, mojoservicelauncher: Bump SRCREV
> not included in master yet:=20
> 65646b6 pulseaudio-distro-conf: update webos-system.pa from latest =
pulseaudio
> e241480 README: update to depend on master branches
> 219693e qtbase: enable fontconfig
> 129a0ed qtwayland, qtwebengine: use webOS-ports/master-next branch =
compatible with 5.7
> 0e0fd2b luna-next: Make compatible with Qt 5.7
> 8f17a93 qtwebengine: temporary drop bbappend
> 7a82386 luna-sysservice: Fix build with qt 5.7
> 4ebaaed glib-2.0: rename .bbappend to match new version from oe-core
> ad71866 connman: rename .bbappend to match new version from oe-core
> 7c080fc openssl,pmcertificatemgr: use openssl files from /etc
> 26e1de7 libsdl2: upgrade to 2.0.4 included in oe-core
> 48d8668 luna-next, luna-webappmanager: temporary drop from image
>=20
> =3D=3D Tested changes (not included in master yet) - meta-smartphone =
=3D=3D
> latest upstream commit:=20
> d6d9f42 tenderloin-bluetooth-utilities: Bump SRCREV
> not included in master yet:=20
> 9f56d52 u-boot-mkimage: Backport fix from upstream to fix bcklist =
because of python-pycairo runtime dependency
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


