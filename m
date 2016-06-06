Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 51F5E77160;
	Mon,  6 Jun 2016 10:52:20 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id c74so39742530wme.0;
	Mon, 06 Jun 2016 03:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=wDj4lhIOIZxYG3CnIIkl814Cnb+Sr2ZOoo6zY16eoPk=;
	b=uRc85oVuydcfckfU5Vb5x58gUHbIkWbOXyoqm9DzPZxWG2TD3rLpwuwnm4vZ7eCVhr
	TuJQ1MwJju5abWRyMBpygJ907HEmxflUYNcB2N7K8TKLWJDedhKi35gYejnEwHW9jIOb
	17JiKmJY6aZ0IcLCNKuRpdueOUjR+51+sKnnK2ccUAhPvTPlJNmOfs61RRxv38f8HOjL
	0c3arCqVUb4Ejx7biI6zuVD1PXmqg1+WReHNEtKoKRjVoAKJZmonTDb/3saBA+sLxgJw
	2DzQEy9I1U0aEujynQRy63/lwJ34T3OYUFIGqRYXamtDTz7CuNB01dWe5YmfFfrbd+Os
	1aog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=wDj4lhIOIZxYG3CnIIkl814Cnb+Sr2ZOoo6zY16eoPk=;
	b=LKtq/gEgLg287W5zlf5jGpl4RM9c3WWJT4KdoqZcJU5Ft9VHqEkuftNNR0ci4fVPI+
	steY/U55AjnRUEAocd1S1sLqvKSVneFz7LHO0RCSHcKtesZOUn0TnYeadCRD+Cj3Kl6f
	/lYInu79cTsk2sRyQ1ETLgU41cHuS8ZYKwqsdg5NmoE6Hm5IT5Jc2veatgo9WQjAv0YY
	P/e5YbZuiUBrbWdIAvyoj6WDc+REjvPj4ABvHEorZN2+rrWmSPeeGPqGIRpadOh/3OJk
	cOTOnNbILe5uKo2/epo8lEf4REJpcujArihWLV2MNxiEuqXZqxghW8b96onXwcyZGtVq
	A8yw==
X-Gm-Message-State: ALyK8tLkSWNs1VKmFjf5mg0joi9fMswmP08dWduETN0lZf+lnYUoauuRsoAVI6K+468frw==
X-Received: by 10.194.71.80 with SMTP id s16mr17226957wju.157.1465210339441;
	Mon, 06 Jun 2016 03:52:19 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id l9sm19672917wjm.0.2016.06.06.03.52.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Jun 2016 03:52:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 6 Jun 2016 12:52:23 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20160606105223.GA2583@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.6.1 (2016-04-27)
Subject: State of bitbake world 2016-06-02
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
X-List-Received-Date: Mon, 06 Jun 2016 10:52:23 -0000
X-Groupsio-MsgNum: 83111
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline

--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This is first report with gcc 6.1, the number of failures more than tripled=
 :/
Next builds will also include python3 switch in oe-core, so expect even wor=
se
state next time I'm sending this report.

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
||2016-06-02	||32	||39	||38	||79	||36	||35	||90	||41	||41	||0	||0		||0		||1=
		||3		||16		||0		||0		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2016-06-02 =3D=3D

INFO: jenkins-job.sh-1.8.8 Complete log available at http://logs.nslu2-linu=
x.org/buildlogs/oe/world/log.report.20160605_200329.log

=3D=3D=3D common (30) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_38.7.1esr.bb, do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.=
2.bb, do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/gnome-session/gnome-sessio=
n_2.32.1.bb, do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/gtksourceview/gtksourcevie=
w2_2.10.5.bb, do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/gweather/libgweather_2.30.=
3.bb, do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.3=
=2Ebb, do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb, do_=
compile
    * meta-openembedded/meta-gnome/recipes-support/goffice/goffice_0.10.1.b=
b, do_compile
    * meta-openembedded/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.=
bb, do_compile
    * meta-openembedded/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git=
=2Ebb, do_compile
    * meta-openembedded/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19=
=2E10.bb, do_compile
    * meta-openembedded/meta-networking/recipes-connectivity/crda/crda_3.18=
=2Ebb, do_compile
    * meta-openembedded/meta-networking/recipes-connectivity/lftp/lftp_4.6.=
3a.bb, do_compile
    * meta-openembedded/meta-networking/recipes-support/curlpp/curlpp_0.7.3=
=2Ebb, do_compile
    * meta-openembedded/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb, d=
o_configure
    * meta-openembedded/meta-oe/recipes-connectivity/libqmi/libqmi_1.12.6.b=
b, do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb=
, do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1=
=2Ebb, do_compile
    * meta-openembedded/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb=
, do_compile
    * meta-openembedded/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8=
=2E0.bb, do_compile
    * meta-openembedded/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb, do_c=
ompile
    * meta-openembedded/meta-oe/recipes-graphics/glcompbench/glcompbench_20=
12.08.bb, do_configure
    * meta-openembedded/meta-oe/recipes-navigation/geos/geos_3.4.2.bb, do_c=
ompile
    * meta-openembedded/meta-oe/recipes-support/canonical-multitouch/grail_=
3.1.0.bb, do_compile
    * meta-openembedded/meta-oe/recipes-support/opencv/opencv_3.1.bb, do_co=
mpile
    * meta-openembedded/meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb,=
 do_compile
    * meta-openembedded/meta-oe/recipes-support/postgresql/postgresql_9.4.5=
=2Ebb, do_configure
    * meta-openembedded/meta-oe/recipes-test/fwts/fwts_git.bb, do_compile
    * meta-smartphone/meta-fso/recipes-freesmartphone/freesmartphone/libfra=
meworkd-glib_git.bb, do_compile
    * meta-webos-ports/meta-luneui/recipes-webos/librolegen/librolegen.bb, =
do_compile

=3D=3D=3D common-x86 (8) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/cef3_280796.bb, do_compile
    * meta-browser/recipes-browser/chromium/chromium_48.0.2548.0.bb, do_com=
pile
    * meta-openembedded/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb, d=
o_compile
    * meta-openembedded/meta-multimedia/recipes-multimedia/faac/faac_1.28.b=
b, do_compile
    * meta-openembedded/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb, do_=
compile
    * meta-openembedded/meta-oe/recipes-support/espeak/espeak_1.37.bb, do_c=
ompile
    * meta-openembedded/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8=
=2E4.bb, do_compile
    * openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb, do_comp=
ile

=3D=3D=3D qemuarm (2) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.1.3.bb, do_com=
pile
    * meta-openembedded/meta-oe/recipes-support/poppler/poppler_0.43.0.bb, =
do_compile

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-smartphone/meta-shr/recipes-shr/shr/libshr-glib_git.bb, do_compi=
le

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (109) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 32	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.wo=
rld.qemuarm.20160601_021916.log/ || http://errors.yoctoproject.org:80/Error=
s/Build/16910/
|-
|| qemux86 	|| 39	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.wo=
rld.qemux86.20160601_021753.log/ || http://errors.yoctoproject.org:80/Error=
s/Build/16911/
|-
|| qemux86_64 	|| 38	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log=
=2Eworld.qemux86-64.20160602_002045.log/ || http://errors.yoctoproject.org:=
80/Errors/Build/16991/
|}

=3D=3D=3D PNBLACKLISTs (90) =3D=3D=3D

=3D=3D=3D QA issues (20) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
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
||0	||version-going-backwards
|-
||16	||file-rdeps
|-
||1	||textrel
|-
||3	||build-deps
|}



=3D=3D=3D Failed dependencies for qemuarm (79) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20160601_230354.log/
Found differences:=20
    * WARN: samba: samba rdepends on libpam, but it isn't a build dependenc=
y?
    * WARN: libdrm: libdrm-tests rdepends on cunit, but it isn't a build de=
pendency?
    * WARN: libdrm: libdrm-tests rdepends on libdrm-amdgpu, but it isn't a =
build dependency?
    * WARN: jasper: jasper-bin rdepends on freeglut, but it isn't a build d=
ependency?
    * WARN: jasper: jasper-bin rdepends on libgl-mesa, but it isn't a build=
 dependency?
    * WARN: jasper: jasper-bin rdepends on libglu, but it isn't a build dep=
endency?
    * WARN: enchant: enchant rdepends on hunspell, but it isn't a build dep=
endency?
Found errors:=20
    * ERROR: 79 issues were found in these recipes: chkconfig-alternatives-=
native collectd crash crda curlpp enchant fbreader firefox fwts geos glcomp=
bench glmark2 gnome-session gnome-terminal goffice grail gtkmathview gtksou=
rceview2 jasper lftp libdrm libframeworkd-glib libgnomeui libgweather libqm=
i librolegen meta-world-pkgdata mpd netmap opencv openwbem poppler postgres=
ql proxy-libintl samba tasks tcsh thrift tvheadend wvstreams

=3D=3D=3D Recipes failing with maximal dependencies for qemuarm (36) =3D=3D=
=3D
    * chkconfig-alternatives-native -- http://logs.nslu2-linux.org/buildlog=
s/oe/world/log.dependencies.qemuarm.20160601_230354.log//2_max/failed/chkco=
nfig-alternatives-native.log
    * collectd -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemuarm.20160601_230354.log//2_max/failed/collectd.log
    * crash -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenc=
ies.qemuarm.20160601_230354.log//2_max/failed/crash.log
    * crda -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20160601_230354.log//2_max/failed/crda.log
    * curlpp -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemuarm.20160601_230354.log//2_max/failed/curlpp.log
    * fbreader -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemuarm.20160601_230354.log//2_max/failed/fbreader.log
    * firefox -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemuarm.20160601_230354.log//2_max/failed/firefox.log
    * fwts -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20160601_230354.log//2_max/failed/fwts.log
    * geos -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20160601_230354.log//2_max/failed/geos.log
    * glcompbench -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemuarm.20160601_230354.log//2_max/failed/glcompbench.log
    * glmark2 -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemuarm.20160601_230354.log//2_max/failed/glmark2.log
    * gnome-session -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.d=
ependencies.qemuarm.20160601_230354.log//2_max/failed/gnome-session.log
    * gnome-terminal -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.=
dependencies.qemuarm.20160601_230354.log//2_max/failed/gnome-terminal.log
    * goffice -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemuarm.20160601_230354.log//2_max/failed/goffice.log
    * grail -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenc=
ies.qemuarm.20160601_230354.log//2_max/failed/grail.log
    * gtkmathview -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemuarm.20160601_230354.log//2_max/failed/gtkmathview.log
    * gtksourceview2 -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.=
dependencies.qemuarm.20160601_230354.log//2_max/failed/gtksourceview2.log
    * lftp -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20160601_230354.log//2_max/failed/lftp.log
    * libframeworkd-glib -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
log.dependencies.qemuarm.20160601_230354.log//2_max/failed/libframeworkd-gl=
ib.log
    * libgnomeui -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depe=
ndencies.qemuarm.20160601_230354.log//2_max/failed/libgnomeui.log
    * libgweather -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemuarm.20160601_230354.log//2_max/failed/libgweather.log
    * libqmi -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemuarm.20160601_230354.log//2_max/failed/libqmi.log
    * librolegen -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depe=
ndencies.qemuarm.20160601_230354.log//2_max/failed/librolegen.log
    * meta-world-pkgdata -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
log.dependencies.qemuarm.20160601_230354.log//2_max/failed/meta-world-pkgda=
ta.log
    * mpd -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencie=
s.qemuarm.20160601_230354.log//2_max/failed/mpd.log
    * netmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemuarm.20160601_230354.log//2_max/failed/netmap.log
    * opencv -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemuarm.20160601_230354.log//2_max/failed/opencv.log
    * openwbem -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemuarm.20160601_230354.log//2_max/failed/openwbem.log
    * poppler -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemuarm.20160601_230354.log//2_max/failed/poppler.log
    * postgresql -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depe=
ndencies.qemuarm.20160601_230354.log//2_max/failed/postgresql.log
    * proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.d=
ependencies.qemuarm.20160601_230354.log//2_max/failed/proxy-libintl.log
    * tasks -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenc=
ies.qemuarm.20160601_230354.log//2_max/failed/tasks.log
    * tcsh -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20160601_230354.log//2_max/failed/tcsh.log
    * thrift -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemuarm.20160601_230354.log//2_max/failed/thrift.log
    * tvheadend -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemuarm.20160601_230354.log//2_max/failed/tvheadend.log
    * wvstreams -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemuarm.20160601_230354.log//2_max/failed/wvstreams.log

=3D=3D=3D Recipes failing with minimal dependencies for qemuarm (35) =3D=3D=
=3D
    * collectd -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemuarm.20160601_230354.log//3_min/failed/collectd.log
    * crash -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenc=
ies.qemuarm.20160601_230354.log//3_min/failed/crash.log
    * crda -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20160601_230354.log//3_min/failed/crda.log
    * curlpp -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemuarm.20160601_230354.log//3_min/failed/curlpp.log
    * fbreader -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemuarm.20160601_230354.log//3_min/failed/fbreader.log
    * firefox -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemuarm.20160601_230354.log//3_min/failed/firefox.log
    * fwts -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20160601_230354.log//3_min/failed/fwts.log
    * geos -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20160601_230354.log//3_min/failed/geos.log
    * glcompbench -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemuarm.20160601_230354.log//3_min/failed/glcompbench.log
    * glmark2 -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemuarm.20160601_230354.log//3_min/failed/glmark2.log
    * gnome-session -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.d=
ependencies.qemuarm.20160601_230354.log//3_min/failed/gnome-session.log
    * gnome-terminal -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.=
dependencies.qemuarm.20160601_230354.log//3_min/failed/gnome-terminal.log
    * goffice -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemuarm.20160601_230354.log//3_min/failed/goffice.log
    * grail -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenc=
ies.qemuarm.20160601_230354.log//3_min/failed/grail.log
    * gtkmathview -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemuarm.20160601_230354.log//3_min/failed/gtkmathview.log
    * gtksourceview2 -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.=
dependencies.qemuarm.20160601_230354.log//3_min/failed/gtksourceview2.log
    * lftp -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20160601_230354.log//3_min/failed/lftp.log
    * libframeworkd-glib -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
log.dependencies.qemuarm.20160601_230354.log//3_min/failed/libframeworkd-gl=
ib.log
    * libgnomeui -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depe=
ndencies.qemuarm.20160601_230354.log//3_min/failed/libgnomeui.log
    * libgweather -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemuarm.20160601_230354.log//3_min/failed/libgweather.log
    * libqmi -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemuarm.20160601_230354.log//3_min/failed/libqmi.log
    * librolegen -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depe=
ndencies.qemuarm.20160601_230354.log//3_min/failed/librolegen.log
    * meta-world-pkgdata -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
log.dependencies.qemuarm.20160601_230354.log//3_min/failed/meta-world-pkgda=
ta.log
    * mpd -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencie=
s.qemuarm.20160601_230354.log//3_min/failed/mpd.log
    * netmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemuarm.20160601_230354.log//3_min/failed/netmap.log
    * opencv -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemuarm.20160601_230354.log//3_min/failed/opencv.log
    * openwbem -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemuarm.20160601_230354.log//3_min/failed/openwbem.log
    * poppler -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemuarm.20160601_230354.log//3_min/failed/poppler.log
    * postgresql -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depe=
ndencies.qemuarm.20160601_230354.log//3_min/failed/postgresql.log
    * proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.d=
ependencies.qemuarm.20160601_230354.log//3_min/failed/proxy-libintl.log
    * tasks -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenc=
ies.qemuarm.20160601_230354.log//3_min/failed/tasks.log
    * tcsh -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20160601_230354.log//3_min/failed/tcsh.log
    * thrift -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemuarm.20160601_230354.log//3_min/failed/thrift.log
    * tvheadend -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemuarm.20160601_230354.log//3_min/failed/tvheadend.log
    * wvstreams -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemuarm.20160601_230354.log//3_min/failed/wvstreams.log

=3D=3D=3D Failed dependencies for qemux86 (90) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160602_214146.log/
Found differences:=20
    * WARN: jasper: jasper-bin rdepends on freeglut, but it isn't a build d=
ependency?
    * WARN: jasper: jasper-bin rdepends on libgl-mesa, but it isn't a build=
 dependency?
    * WARN: jasper: jasper-bin rdepends on libglu, but it isn't a build dep=
endency?
    * WARN: samba: samba rdepends on libpam, but it isn't a build dependenc=
y?
    * WARN: libdrm: libdrm-tests rdepends on cunit, but it isn't a build de=
pendency?
    * WARN: libdrm: libdrm-tests rdepends on libdrm-amdgpu, but it isn't a =
build dependency?
    * WARN: enchant: enchant rdepends on hunspell, but it isn't a build dep=
endency?
Found errors:=20
    * ERROR: 90 issues were found in these recipes: cef3 chkconfig-alternat=
ives-native chromium collectd crda curlpp enchant espeak evince faac fbread=
er firefox fwts geos glcompbench glmark2 gnome-session gnome-terminal goffi=
ce grail gtkmathview gtksourceview2 iperf jasper lftp libdrm libframeworkd-=
glib libgnomeui libgweather libqmi librolegen mpd netmap open-vcdiff opencv=
 openwbem perf piglit postgresql proxy-libintl samba tasks tcsh thrift tvhe=
adend wvstreams

=3D=3D=3D Recipes failing with maximal dependencies for qemux86 (41) =3D=3D=
=3D
    * cef3 -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160602_214146.log//2_max/failed/cef3.log
    * chkconfig-alternatives-native -- http://logs.nslu2-linux.org/buildlog=
s/oe/world/log.dependencies.qemux86.20160602_214146.log//2_max/failed/chkco=
nfig-alternatives-native.log
    * chromium -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemux86.20160602_214146.log//2_max/failed/chromium.log
    * collectd -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemux86.20160602_214146.log//2_max/failed/collectd.log
    * crda -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160602_214146.log//2_max/failed/crda.log
    * curlpp -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160602_214146.log//2_max/failed/curlpp.log
    * espeak -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160602_214146.log//2_max/failed/espeak.log
    * evince -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160602_214146.log//2_max/failed/evince.log
    * faac -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160602_214146.log//2_max/failed/faac.log
    * fbreader -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemux86.20160602_214146.log//2_max/failed/fbreader.log
    * firefox -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20160602_214146.log//2_max/failed/firefox.log
    * fwts -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160602_214146.log//2_max/failed/fwts.log
    * geos -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160602_214146.log//2_max/failed/geos.log
    * glcompbench -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemux86.20160602_214146.log//2_max/failed/glcompbench.log
    * glmark2 -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20160602_214146.log//2_max/failed/glmark2.log
    * gnome-session -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.d=
ependencies.qemux86.20160602_214146.log//2_max/failed/gnome-session.log
    * gnome-terminal -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.=
dependencies.qemux86.20160602_214146.log//2_max/failed/gnome-terminal.log
    * goffice -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20160602_214146.log//2_max/failed/goffice.log
    * grail -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenc=
ies.qemux86.20160602_214146.log//2_max/failed/grail.log
    * gtkmathview -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemux86.20160602_214146.log//2_max/failed/gtkmathview.log
    * gtksourceview2 -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.=
dependencies.qemux86.20160602_214146.log//2_max/failed/gtksourceview2.log
    * iperf -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenc=
ies.qemux86.20160602_214146.log//2_max/failed/iperf.log
    * lftp -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160602_214146.log//2_max/failed/lftp.log
    * libframeworkd-glib -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
log.dependencies.qemux86.20160602_214146.log//2_max/failed/libframeworkd-gl=
ib.log
    * libgnomeui -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depe=
ndencies.qemux86.20160602_214146.log//2_max/failed/libgnomeui.log
    * libgweather -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemux86.20160602_214146.log//2_max/failed/libgweather.log
    * libqmi -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160602_214146.log//2_max/failed/libqmi.log
    * librolegen -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depe=
ndencies.qemux86.20160602_214146.log//2_max/failed/librolegen.log
    * mpd -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencie=
s.qemux86.20160602_214146.log//2_max/failed/mpd.log
    * netmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160602_214146.log//2_max/failed/netmap.log
    * opencv -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160602_214146.log//2_max/failed/opencv.log
    * open-vcdiff -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemux86.20160602_214146.log//2_max/failed/open-vcdiff.log
    * openwbem -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemux86.20160602_214146.log//2_max/failed/openwbem.log
    * piglit -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160602_214146.log//2_max/failed/piglit.log
    * postgresql -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depe=
ndencies.qemux86.20160602_214146.log//2_max/failed/postgresql.log
    * proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.d=
ependencies.qemux86.20160602_214146.log//2_max/failed/proxy-libintl.log
    * tasks -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenc=
ies.qemux86.20160602_214146.log//2_max/failed/tasks.log
    * tcsh -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160602_214146.log//2_max/failed/tcsh.log
    * thrift -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160602_214146.log//2_max/failed/thrift.log
    * tvheadend -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemux86.20160602_214146.log//2_max/failed/tvheadend.log
    * wvstreams -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemux86.20160602_214146.log//2_max/failed/wvstreams.log

=3D=3D=3D Recipes failing with minimal dependencies for qemux86 (41) =3D=3D=
=3D
    * cef3 -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160602_214146.log//3_min/failed/cef3.log
    * chromium -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemux86.20160602_214146.log//3_min/failed/chromium.log
    * collectd -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemux86.20160602_214146.log//3_min/failed/collectd.log
    * crda -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160602_214146.log//3_min/failed/crda.log
    * curlpp -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160602_214146.log//3_min/failed/curlpp.log
    * espeak -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160602_214146.log//3_min/failed/espeak.log
    * evince -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160602_214146.log//3_min/failed/evince.log
    * faac -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160602_214146.log//3_min/failed/faac.log
    * fbreader -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemux86.20160602_214146.log//3_min/failed/fbreader.log
    * firefox -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20160602_214146.log//3_min/failed/firefox.log
    * fwts -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160602_214146.log//3_min/failed/fwts.log
    * geos -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160602_214146.log//3_min/failed/geos.log
    * glcompbench -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemux86.20160602_214146.log//3_min/failed/glcompbench.log
    * glmark2 -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20160602_214146.log//3_min/failed/glmark2.log
    * gnome-sessigs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qem=
ux86.20160602_214146.log//3_min/failed/libgweather.log
    * libqmi -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160602_214146.log//3_min/failed/libqmi.log
    * librolegen -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depe=
ndencies.qemux86.20160602_214146.log//3_min/failed/librolegen.log
    * mpd -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencie=
s.qemux86.20160602_214146.log//3_min/failed/mpd.log
    * netmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160602_214146.log//3_min/failed/netmap.log
    * opencv -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160602_214146.log//3_min/failed/opencv.log
    * open-vcdiff -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemux86.20160602_214146.log//3_min/failed/open-vcdiff.log
    * openwbem -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemux86.20160602_214146.log//3_min/failed/openwbem.log
    * perf -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160602_214146.log//3_min/failed/perf.log
    * piglit -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160602_214146.log//3_min/failed/piglit.log
    * postgresql -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depe=
ndencies.qemux86.20160602_214146.log//3_min/failed/postgresql.log
    * proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.d=
ependencies.qemux86.20160602_214146.log//3_min/failed/proxy-libintl.log
    * tasks -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenc=
ies.qemux86.20160602_214146.log//3_min/failed/tasks.log
    * tcsh -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160602_214146.log//3_min/failed/tcsh.log
    * thrift -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160602_214146.log//3_min/failed/thrift.log
    * tvheadend -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemux86.20160602_214146.log//3_min/failed/tvheadend.log
    * wvstreams -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemux86.20160602_214146.log//3_min/failed/wvstreams.log

=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatures=
=2E20160602_135949.log/

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
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
: switch to https://git.enlightenmeST[epdfview] ?=3D "BROKEN: images are no=
t displayed anymore"
meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gn=
ome-mplayer] ?=3D "rdepends on blacklisted mplayer"
meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb:PN=
BLACKLIST[gtk-theme-torturer] ?=3D "BROKEN: gmacros.h:182:53: error: size o=
f array '_GStaticAssertCompileTimeAssertion_2' is negative"
meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb:PNBLACKLIST[gcalctoo=
l] ?=3D "broken at least since April 2013 http://permalink.gmane.org/gmane.=
comp.handhelds.openembedded/57920 and nobody complained, it's also replaced=
 by gnome calculator"
meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLIST[=
gnome-keyring] ?=3D "This version conflicts with gcr from oe-core"
meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb:PNBLACKLIST[gno=
me-menus3] ?=3D "CONFLICT: 24 files are conflicting with gnome-menus"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnom=
e-panel3] ?=3D "CONFLICT: depends on libgweather3 which conflicts with libg=
weather"
meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb:=
PNBLACKLIST[gnome-power-manager] ?=3D "BROKEN: not compatible with current =
libnotify"
meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgwea=
ther3] ?=3D "CONFLICT: 876 files are conflicting with libgweather"
meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb:PNBLACKLIST[nautilus3]=
 ?=3D "BROKEN: fails to build, maybe missing dependency on gnome-desktop-ut=
ils.h provider"
meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb:PNBLA=
CKLIST[system-tools-backends] ?=3D "does not build with distroless qemuarm =
as reported in 'State of bitbake world' thread, nobody volunteered to fix t=
hem"
meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?=3D "=
BROKEN: doesn't build with B!=3DS"
meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:PNBLACKLIST[xbmc] ?=3D=
 "/usr/include/c++/ctime:70:11: error: '::gmtime' has not been declared"
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
meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb:PNBLACKLIST[sno=
rt] ?=3D "BROKEN: QA Issue: snort_preproc.pc, snort_output.pc, snort.pc"
meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb:PNBLACKLIST[dnrd] ?=3D =
"BROKEN: dnrd-2.20.3-r0 do_package: QA Issue: dnrd: Files/directories were =
installed but not shipped in any package:"
meta-networking/recipes-daemons/squid/squid_3.5.7.bb:PNBLACKLIST[squid] ?=
=3D "BROKEN: sysroots/qemuarm/usr/include/linux/in.h:28:16: error: redeclar=
ation of 'IPPROTO_IP'"
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:PNBLACK=
LIST[lksctp-tools] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gol=
d', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
meta-networking/recipes-support/niURES', '', d)}"
meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4] ?=3D=
 "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with =
bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:PNBLACKLIS=
T[gst-plugin-bluetooth] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'blue=
z5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURE=
S', '', d)}"
meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?=3D =
"BROKEN: depends on broken libftdi"
meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zeroc=
-ice] ?=3D "BROKEN: not compatible with default db version"
meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb:PNBLACKLIST[fakeroot] ?=3D=
 "BROKEN: QA Issue: -dev package contains non-symlink .so"
meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb:PNBLACKLIST[cloud9] ?=3D "Not=
 comatible with current nodejs 0.12, but upstream is working on it for v3"
meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb:PNBLACKLIST[ltp-ddt] ?=3D=
 "BROKEN: fails since last autotools.bbclass changes"
meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb:PNBLACKLIST[mpich] ?=3D "BROK=
EN: QA Issue: libmpi.la failed sanity test (workdir), QA Issue: mpich.pc fa=
iled sanity test (tmpdir)"
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
meta-oe/recipes-graphics/tesseract/tesseract_3.02.02.bb:PNBLACKLIST[tessera=
ct] ?=3D "BROKEN: QA Issue: tesseract.pc failed sanity test (tmpdir)"
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
tils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 ao=
e/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb:PNBLACKLIST[claws-plug=
in-rssyl] ?=3D "depends on blacklisted claws-mail"
meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd] ?=
=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?=3D "qemu: =
uncaught target signal 11 (Segmentation fault) - core dumped"
meta-oe/recipes-support/fftw/benchfft_3.1.bb:PNBLACKLIST[benchfft] ?=3D "do=
es not build with distroless qemuarm as reported in 'State of bitbake world=
' thread, nobody volunteered to fix them"
meta-oe/recipes-support/iksemel/iksemel_1.4.bb:PNBLACKLIST[iksemel] ?=3D "N=
ot compatible with gnutls version 3.4 currently in oe-core"
meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb:PNBLACKLIST[libdbi=
-drivers] ?=3D "BROKEN: fails to build with gcc-5"
meta-oe/recipes-support/libetpan/libetpan_0.57.bb:PNBLACKLIST[libetpan] ?=
=3D "Not compatible with gnutls version 3.4 currently in oe-core"
meta-oe/recipes-support/opencv/opencv-samples_2.4.bb:PNBLACKLIST[opencv-sam=
ples] ?=3D "Depends on blacklisted opencv"
meta-oe/recipes-support/opencv/opencv_2.4.bb:PNBLACKLIST[opencv] ?=3D "Not =
compatible with currently used ffmpeg 3"
meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmotif]=
 ?=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml] =
?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts w=
ith bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb:PNBLACKLIST[pidgin-otr] =
?=3D "depends on blacklisted pidgin"
meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala=
-terminal] ?=3D "BROKEN: Doesn't work with B!=3DS, touch: cannot touch `src=
/.stamp': No such file or directory"
meta-qt5:
meta-smartphone:
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
meta-shr/recipes-shr/shr/shr-installer_git.bb:PNBLACKLIST[shr-installer] ?=
=3D "Depends on blacklisted packagekit"
meta-webos-ports:
PNBpped


count: 0	issue: libdir


count: 1	issue: textrel
corosync-2.3.5: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.3.5-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]


count: 3	issue: build-deps
qtcharts-5.6.99+5.7.0-beta+gitAUTOINC+8a78184181: qtcharts-examples rdepend=
s on qtmultimedia, but it isn't a build dependency, missing qtmultimedia in=
 DEPENDS or PACKAGECONFIG? [build-deps]
qtwayland-5.6.99+5.7.0-beta+gitAUTOINC+d27075a3f9: qtwayland-plugins rdepen=
ds on libxcomposite, but it isn't a build dependency, missing libxcomposite=
 in DEPENDS or PACKAGECONFIG? [build-deps]
samba-4.4.2: samba rdepends on libpam, but it isn't a build dependency, mis=
sing libpam in DEPENDS or PACKAGECONFIG? [build-deps]


count: 16	issue: file-rdeps
chkconfig-1.3.58: /usr/sbin/ntsysv contained in package chkconfig requires =
libnewt.so()(64bit), but no providers found in RDEPENDS_chkconfig? [file-rd=
eps]
chkconfig-1.3.58: /usr/sbin/ntsysv contained in package chkconfig requires =
libnewt.so, but no providers found in RDEPENDS_chkconfig? [file-rdeps]
libmodule-build-perl-0.31: /usr/bin/config_data contained in package libmod=
ule-build-perl requires /tmp/sysroots/x86_64-linux/usr/bin/perl-native/perl=
=2Ereal, but no providers found in RDEPENDS_libmodule-build-perl? [file-rde=
ps]
libnewt-0.52.18: /usr/bin/whiptail contained in package whiptail requires l=
ibnewt.so()(64bit), but no providers found in RDEPENDS_whiptail? [file-rdep=
s]
libnewt-0.52.18: /usr/bin/whiptail contained in package whiptail requires l=
ibnewt.so, but no providers found in RDEPENDS_whiptail? [file-rdeps]
libnewt-python-0.52.18: /usr/lib/python2.7/site-packages/_snack.so containe=
d in package libnewt-python requires libnewt.so()(64bit), but no providers =
found in RDEPENDS_libnewt-python? [file-rdeps]
libnewt-python-0.52.18: /usr/lib/python2.7/site-packages/_snack.so containe=
d in package libnewt-python requires libnewt.so, but no providers found in =
RDEPENDS_libnewt-python? [file-rdeps]
networkmanager-1.0.10: /usr/bin/nmtui-connect contained in package networkm=
anager-nmtui requires libnewt.so()(64bit), but no providers found in RDEPEN=
DS_networkmanager-nmtui? [file-rdeps]
networkmanager-1.0.10: /usr/bin/nmtui-connect contained in package networkm=
anager-nmtui requires libnewt.so, but no providers found in RDEPENDS_networ=
kmanager-nmtui? [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert_all.sh containe=
d in package numptyphysics requires /bin/bash, but no providers found in RD=
EPENDS_numptyphysics? [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert.pl contained in=
 package numptyphysics requires /usr/bin/perl, but no providers found in RD=
EPENDS_numptyphysics? [file-rdeps]
ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: /usr/bin/memory-map.sh contained in=
 package ubx-utils requires /bin/bash, but no providers found in RDEPENDS_u=
bx-utils? [file-rdeps]
xfsprogs-3.2.3: /sbin/mkfs.xfs contained in package xfsprogs-mkfs requires =
libxfs.so.0()(64bit), but no providers found in RDEPENDS_xfsprogs-mkfs? [fi=
le-rdeps]
xfsprogs-3.2.3: /sbin/mkfs.xfs contained in package xfsprogs-mkfs requires =
libxfs.so.0, but no providers found in RDEPENDS_xfsprogs-mkfs? [file-rdeps]
xfsprogs-3.2.3: /usr/sbin/xfs_db contained in package xfsprogs requires lib=
xfs.so.0()(64bit), but no providers found in RDEPENDS_xfsprogs? [file-rdeps]
xfsprogs-3.2.3: /usr/sbin/xfs_db contained in package xfsprogs requires lib=
xfs.so.0, but no providers found in RDEPENDS_xfsprogs? [file-rdeps]


count: 0	issue: version-going-backwards


count: 0	issue: host-user-contaminated


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
d830dcc classes/base.bbclass: Fix missing getVarFlag parameter
not included in master yet:=20
d1ad882 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
b746223 linux-yocto/4.1: fix musb compilation error
not included in master yet:=20
73bc3c3 linux-yocto-rt, core-image-rt*: Explicitly skip when PREFERRED_PROV=
IDER_virtual/kernel isn't set to linux-yocto-rt
06da587 report-error: Allow to upload reports automatically
6b3463b qemux86: Add identical qemux86copy variant for tests
6ec642c sstate-sysroot-cruft.sh: Extend the whitelist
30333ea recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
3e54d7c buildhistory.bbclass: metadata-revs show repo parent
fc4142f metadata-revs: provide more information
829e10c insane: return line-feeds to qa.log
e5dfbba tcl: Only set BINCONFIG_GLOB for target builds
277329a libsdl2: Fix build with wayland 1.10

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
387824f openct: Fix rootfs creation errors
not included in master yet:=20
92fc375 android-tools: Fix, enhance and move from meta-shr
0a03b99 openconnect: add dependency to fix Makefile.am
194fb7e openconnect: fix do_compile failure
8727c4a ntp: avoid floating dependency on mdns (aka mDNSResponder)
638800b squid: CVE-2016-4553
8c901ed opensaf: update to 5.0.0
d4c261c netkit-rsh: fix build issue.
8ad5bf6 libass: add newer version
a83f4d5 mpv: Media Player
4b5c78b postfix: Fix rootfs creation errors
1b88275 esmtp: Fix rootfs creation errors
881ceb4 geany-plugins: fix build
bacfab4 netcat-openbsd: fix qa warning
07d3e22 dvd-apps: Fix several QA WARNINGS
65d7a39 python-simplejson: change to setuptools
9dc43c7 gnome-menus: Fix QA warnings.
bf443b2 cifs-utils: make samba conditional dependency
00a338c libtevent: add missing libaio dependency
66e8434 libtdb: add missing libaio dependency
81aeb93 libtalloc: add missing libaio dependency
8377744 libldb: add missing libaio dependency
8dfaa7f nodejs: update to 4.4.5
36aa232 efivar-native: fix compile failure with older host gcc (<=3D4.6)
b212b9c luajit: fix build issues, obey more vars
96e7dd9 plymouth: allow disabling the dracut dep
dfeaaae nano: fix license to GPLv3.

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
27617dd qtchooser: add new recipe
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
825ea93 chromium: Add workarounds for compiler errors
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream c
9d5058a u-boot-mkimage: Backport fix from upstream to fix build with gcc-5
81f156d linux-gta04: bump SRCREV to get fixes for build with gcc-5
46f572e linux-gta04: enable SGX530
9086db3 defaulttunes.inc: switch to hf, because SGX SDK for SGX530 is avail=
able only for hf
f68a25e om-gta04: drop u-boot from EXTRA_IMAGEDEPENDS
56f69af linux-gta04: upgrade to 4.4
2d312a0 shr: add wayland to DISTRO_FEATURES
62d8eb3 linux-gta04: include linux-dtb

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldVVYcACgkQN1Ujt2V2gBxDaACeJW21Ep5dyyj70rH2J9LKe8KB
Fw0AnRem+fdvdZ8NTCxkraEtbaEAySso
=EXKM
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
