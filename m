Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f196.google.com (mail-wj0-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id C692071DD9;
	Wed, 25 Jan 2017 14:51:37 +0000 (UTC)
Received: by mail-wj0-f196.google.com with SMTP id ip10so3390378wjb.1;
	Wed, 25 Jan 2017 06:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=EH9MhKxf8Vzyi91EujZuQThGSEj5zriv97Xd7fRU4o8=;
	b=lspDy71orK86HBXrvNpUds+++ynokW4xZTVfb/5n5crn8vQpx1dJdrk2/Mn3Dxrmnn
	jz2GwOY8SQul95aB2SQ3hfLYJXS3eZ6LiFhUgLH7dP6enqQJYAaWyQfphbFZ95JTN+UX
	vy3NRuPSbXyCrhZT7KNflMxeMKlhklgDVhqFO6tDvuULKFjmS0PjyDlucmyLynqkhzAA
	QNY3RKvwMmb9A9aEH4UMdH1KLkvQaCrZt2Kgd5kCz/n3ft12b+3Z7Zow2IkraLtiQW+D
	ptf40Osh/PepIrLoXZkTTtSio2DbXNPSHVC6Jg2F+nHVxso8X89MkXMbrbaPkssZAlJR
	cBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=EH9MhKxf8Vzyi91EujZuQThGSEj5zriv97Xd7fRU4o8=;
	b=RaPuLDJrwkA2Jb5SIPqfpuGXUuw4HgfLh+NnnZVLXpYWJDRJpYA73hoGfqw1AUJu50
	KjPmqxKcOQFXa1O3AV14XDbMAfgOkjYGl4VxISO5gESi1E7vDLBrYLA8urVxchrDrhar
	O++3nMCCjuo6qcpHpotxxurCg4PmmRM0VUpZ38kzjNhsh1CLW52fShNSnpLQtuusBD0j
	gvfpda0qhJAycWR8F/ZmBoD/+ZhKji8eHFEFG45TPeosGiQZEAUPg969G6oQ53zkWhYz
	IQH7cmbcGFJvV2xG1jou2aipkTCGiN6bTF6tmuyJMIK+1lQQO9d5LIp/7cP3dF2UVWXo
	ItVA==
X-Gm-Message-State: AIkVDXIIrGCs63JmFhoh7VxbBDWT2jNfx5JbPUifjdCSjwJO2Y9vU1Xy/JysulKeO1GoLg==
X-Received: by 10.223.176.210 with SMTP id j18mr39493438wra.8.1485355896820;
	Wed, 25 Jan 2017 06:51:36 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	y30sm25405276wrc.23.2017.01.25.06.51.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Jan 2017 06:51:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 25 Jan 2017 15:51:38 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20170125145138.GA3260@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: State of bitbake world, Failed tasks 2017-01-20
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
X-List-Received-Date: Wed, 25 Jan 2017 14:51:38 -0000
X-Groupsio-MsgNum: 92368
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cWoXeonUoKmBZSoM"
Content-Disposition: inline

--cWoXeonUoKmBZSoM
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
||2017-01-20	||17	||20	||18	||35	||17	||17	||39	||19	||19	||0	||0		||0		||3=
		||1		||6		||51		||0		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2017-01-20 =3D=3D

INFO: jenkins-job.sh-1.8.12 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20170125_044020.log

=3D=3D=3D common (16) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_16.bb=
:do_configure
    * meta-openembedded/meta-networking/recipes-connectivity/crda/crda_3.18=
=2Ebb:do_compile
    * meta-openembedded/meta-oe/recipes-devtools/chromium-utils/chromium-ut=
ils.bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/acpica/acpica_20150515.bb:=
do_compile
    * meta-openembedded/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb:do_=
compile
    * meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-gla=
mo_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/opencv/opencv_3.2.bb:do_com=
pile
    * meta-openembedded/meta-python/recipes-devtools/python/python3-lxml_3.=
7.0.bb:do_fetch
    * meta-openembedded/meta-python/recipes-devtools/python/python3-py_1.4.=
31.bb:do_fetch
    * meta-openembedded/meta-python/recipes-devtools/python/python3-pytest_=
3.0.4.bb:do_fetch
    * meta-openembedded/meta-python/recipes-devtools/python/python3-pytz_20=
16.7.bb:do_fetch
    * meta-openembedded/meta-python/recipes-devtools/python/python3-request=
s_2.12.0.bb:do_fetch
    * meta-openembedded/meta-python/recipes-devtools/python/python3-werkzeu=
g_0.11.11.bb:do_fetch
    * meta-openembedded/meta-webserver/recipes-php/xdebug/xdebug_2.2.6.bb:d=
o_compile
    * meta-qt5/recipes-qt/qt5/qtwayland_git.bb:do_configure
    * meta-qt5/recipes-qt/qt5/qtwebkit_git.bb:do_compile

=3D=3D=3D common-x86 (2) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-nou=
veau_1.0.12.bb:do_compile
    * meta-openembedded/meta-oe/recipes-test/fwts/fwts_git.bb:do_compile

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-benchmark/pmbw/pmbw_git.bb:do_compi=
le

=3D=3D=3D qemux86 (2) =3D=3D=3D
    * meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc_2.0.4.b=
b:do_compile
    * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (55) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 17	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/l=
og.world.qemuarm.20170119_013959.log/ || http://errors.yoctoproject.org/Err=
ors/Build/29136/
|-
|| qemux86 	|| 20	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/l=
og.world.qemux86.20170119_013936.log/ || http://errors.yoctoproject.org/Err=
ors/Build/29137/
|-
|| qemux86_64 	|| 18	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.world.qemux86-64.20170120_021711.log/ || http://errors.yoctoproject.o=
rg/Errors/Build/29258/
|}

=3D=3D=3D PNBLACKLISTs (115) =3D=3D=3D

=3D=3D=3D QA issues (61) =3D=3D=3D
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
||1	||build-deps
|-
||3	||textrel
|-
||51	||version-going-backwards
|-
||6	||file-rdeps
|}



=3D=3D=3D Failed dependencies for qemuarm (35) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20170120_010640.log/
Found differences:=20
Found errors:=20
    * ERROR: 35 issues were found in these recipes: acpica chromium-utils c=
rda kodi opencv pmbw python3-lxml python3-py python3-pytest python3-pytz py=
thon3-requests python3-werkzeug pywbem qtwayland qtwebkit xdebug xf86-video=
-glamo

=3D=3D=3D Recipes failing with maximal dependencies for qemuarm (17) =3D=3D=
=3D
    * acpica -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemuarm.20170120_010640.log//2_max/failed/acpica.log
    * chromium-utils -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.dependencies.qemuarm.20170120_010640.log//2_max/failed/chromium-utils.=
log
    * crda -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20170120_010640.log//2_max/failed/crda.log
    * kodi -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20170120_010640.log//2_max/failed/kodi.log
    * opencv -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemuarm.20170120_010640.log//2_max/failed/opencv.log
    * pmbw -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20170120_010640.log//2_max/failed/pmbw.log
    * python3-lxml -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/l=
og.dependencies.qemuarm.20170120_010640.log//2_max/failed/python3-lxml.log
    * python3-py -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log=
=2Edependencies.qemuarm.20170120_010640.log//2_max/failed/python3-py.log
    * python3-pytest -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.dependencies.qemuarm.20170120_010640.log//2_max/failed/python3-pytest.=
log
    * python3-pytz -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/l=
og.dependencies.qemuarm.20170120_010640.log//2_max/failed/python3-pytz.log
    * python3-requests -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemuarm.20170120_010640.log//2_max/failed/python3-reque=
sts.log
    * python3-werkzeug -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemuarm.20170120_010640.log//2_max/failed/python3-werkz=
eug.log
    * pywbem -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemuarm.20170120_010640.log//2_max/failed/pywbem.log
    * qtwayland -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20170120_010640.log//2_max/failed/qtwayland.log
    * qtwebkit -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemuarm.20170120_010640.log//2_max/failed/qtwebkit.log
    * xdebug -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemuarm.20170120_010640.log//2_max/failed/xdebug.log
    * xf86-video-glamo -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemuarm.20170120_010640.log//2_max/failed/xf86-video-gl=
amo.log

=3D=3D=3D Recipes failing with minimal dependencies for qemuarm (17) =3D=3D=
=3D
    * acpica -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemuarm.20170120_010640.log//3_min/failed/acpica.log
    * chromium-utils -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.dependencies.qemuarm.20170120_010640.log//3_min/failed/chromium-utils.=
log
    * crda -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20170120_010640.log//3_min/failed/crda.log
    * kodi -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20170120_010640.log//3_min/failed/kodi.log
    * opencv -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemuarm.20170120_010640.log//3_min/failed/opencv.log
    * pmbw -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20170120_010640.log//3_min/failed/pmbw.log
    * python3-lxml -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/l=
og.dependencies.qemuarm.20170120_010640.log//3_min/failed/python3-lxml.log
    * python3-py -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log=
=2Edependencies.qemuarm.20170120_010640.log//3_min/failed/python3-py.log
    * python3-pytest -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.dependencies.qemuarm.20170120_010640.log//3_min/failed/python3-pytest.=
log
    * python3-pytz -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/l=
og.dependencies.qemuarm.20170120_010640.log//3_min/failed/python3-pytz.log
    * python3-requests -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemuarm.20170120_010640.log//3_min/failed/python3-reque=
sts.log
    * python3-werkzeug -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemuarm.20170120_010640.log//3_min/failed/python3-werkz=
eug.log
    * pywbem -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemuarm.20170120_010640.log//3_min/failed/pywbem.log
    * qtwayland -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20170120_010640.log//3_min/failed/qtwayland.log
    * qtwebkit -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemuarm.20170120_010640.log//3_min/failed/qtwebkit.log
    * xdebug -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemuarm.20170120_010640.log//3_min/failed/xdebug.log
    * xf86-video-glamo -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemuarm.20170120_010640.log//3_min/failed/xf86-video-gl=
amo.log

=3D=3D=3D Failed dependencies for qemux86 (39) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemux86.20170121_014618.log/
Found differences:=20
Found errors:=20
    * ERROR: 39 issues were found in these recipes: acpica chromium-utils c=
rda fwts kodi opencv python3-lxml python3-py python3-pytest python3-pytz py=
thon3-requests python3-werkzeug pywbem qtwayland qtwebengine qtwebkit xdebu=
g xf86-video-glamo xf86-video-nouveau

=3D=3D=3D Recipes failing with maximal dependencies for qemux86 (19) =3D=3D=
=3D
    * acpica -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemux86.20170121_014618.log//2_max/failed/acpica.log
    * chromium-utils -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.dependencies.qemux86.20170121_014618.log//2_max/failed/chromium-utils.=
log
    * crda -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemux86.20170121_014618.log//2_max/failed/crda.log
    * fwts -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemux86.20170121_014618.log//2_max/failed/fwts.log
    * kodi -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemux86.20170121_014618.log//2_max/failed/kodi.log
    * opencv -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemux86.20170121_014618.log//2_max/failed/opencv.log
    * python3-lxml -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/l=
og.dependencies.qemux86.20170121_014618.log//2_max/failed/python3-lxml.log
    * python3-py -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log=
=2Edependencies.qemux86.20170121_014618.log//2_max/failed/python3-py.log
    * python3-pytest -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.dependencies.qemux86.20170121_014618.log//2_max/failed/python3-pytest.=
log
    * python3-pytz -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/l=
og.dependencies.qemux86.20170121_014618.log//2_max/failed/python3-pytz.log
    * python3-requests -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemux86.20170121_014618.log//2_max/failed/python3-reque=
sts.log
    * python3-werkzeug -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemux86.20170121_014618.log//2_max/failed/python3-werkz=
eug.log
    * pywbem -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemux86.20170121_014618.log//2_max/failed/pywbem.log
    * qtwayland -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemux86.20170121_014618.log//2_max/failed/qtwayland.log
    * qtwebengine -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.dependencies.qemux86.20170121_014618.log//2_max/failed/qtwebengine.log
    * qtwebkit -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemux86.20170121_014618.log//2_max/failed/qtwebkit.log
    * xdebug -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemux86.20170121_014618.log//2_max/failed/xdebug.log
    * xf86-video-glamo -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemux86.20170121_014618.log//2_max/failed/xf86-video-gl=
amo.log
    * xf86-video-nouveau -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemux86.20170121_014618.log//2_max/failed/xf86-video-=
nouveau.log

=3D=3D=3D Recipes failing with minimal dependencies for qemux86 (19) =3D=3D=
=3D
    * acpica -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemux86.20170121_014618.log//3_min/failed/acpica.log
    * chromium-utils -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.dependencies.qemux86.20170121_014618.log//3_min/failed/chromium-utils.=
log
    * crda -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemux86.20170121_014618.log//3_min/failed/crda.log
    * fwts -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemux86.20170121_014618.log//3_min/failed/fwts.log
    * kodi -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemux86.20170121_014618.log//3_min/failed/kodi.log
    * opencv -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemux86.20170121_014618.log//3_min/failed/opencv.log
    * python3-lxml -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/l=
og.dependencies.qemux86.20170121_014618.log//3_min/failed/python3-lxml.log
    * python3-py -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log=
=2Edependencies.qemux86.20170121_014618.log//3_min/failed/python3-py.log
    * python3-pytest -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.dependencies.qemux86.20170121_014618.log//3_min/failed/python3-pytest.=
log
    * python3-pytz -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/l=
og.dependencies.qemux86.20170121_014618.log//3_min/failed/python3-pytz.log
    * python3-requests -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemux86.20170121_014618.log//3_min/failed/python3-reque=
sts.log
    * python3-werkzeug -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemux86.20170121_014618.log//3_min/failed/python3-werkz=
eug.log
    * pywbem -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemux86.20170121_014618.log//3_min/failed/pywbem.log
    * qtwayland -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemux86.20170121_014618.log//3_min/failed/qtwayland.log
    * qtwebengine -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.dependencies.qemux86.20170121_014618.log//3_min/failed/qtwebengine.log
    * qtwebkit -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemux86.20170121_014618.log//3_min/failed/qtwebkit.log
    * xdebug -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemux86.20170121_014618.log//3_min/failed/xdebug.log
    * xf86-video-glamo -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemux86.20170121_014618.log//3_min/failed/xf86-video-gl=
amo.log
    * xf86-video-nouveau -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemux86.20170121_014618.log//3_min/failed/xf86-video-=
nouveau.log

=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20170120_060219.log/

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
z5', 'bluez5 conflicts wit"BROKEN: doesn't build with B!=3DS"
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
meta-oe/recipes-support/fftw/benchfft_3.1.bb:PNBLACKLIST[benchfft] ?=3D "do=
es not build with distroless qemuarm as reported in 'State of bitbake world=
' thread, nobody volunteered to fix them"
meta-oe/recipes-support/iksemel/iksemel_1.4.bb:PNBLACKLIST[iksemel] ?=3D "N=
ot compatible with gnutls version 3.4 currently in oe-core"
meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb:PNBLACKLIST[libdbi=
-drivers] ?=3D "BROKEN: fails to build with gcc-5"
meta-oe/recipes-support/libetpan/libetpan_0.57.bb:PNBLACKLIST[libetpan] ?=
=3D "Not compatible with gnutls version 3.4 currently in oe-core"
meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.4.bb:PNBLACKLIST[open-v=
cdiff] ?=3D "BROKEN: fails to build with gcc-6"
meta-oe/recipes-support/opencv/opencv-samples_2.4.bb:PNBLACKLIST[opencv-sam=
ples] ?=3D "Depends on blacklisted opencv"
meta-oe/recipes-support/opencv/opencv_2.4.bb:PNBLACKLIST[opencv] ?=3D "Not =
compatible with currently used ffmpeg 3"
meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmotif]=
 ?=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml] =
ATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in =
DISTRO_FEATURES', '', d)}"
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


count: 3	issue: textrel
chromium-52.0.2743.76: ELF binary '/tmp/work/i586-oe-linux/chromium/52.0.27=
43.76-r0/packages-split/chromium/usr/bin/chromium/chrome' has relocations i=
n .text [textrel]
corosync-2.4.0: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.4.0-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]
x264-r2491+gitAUTOINC+86b71982e1: ELF binary '/tmp/work/i586-oe-linux/x264/=
r2491+gitAUTOINC+86b71982e1-r0/packages-split/x264/usr/lib/libx264.so.148' =
has relocations in .text [textrel]


count: 1	issue: build-deps
nano-2.7.4: nano rdepends on file, but it isn't a build dependency, missing=
 file in DEPENDS or PACKAGECONFIG? [build-deps]


count: 6	issue: file-rdeps
firefox-45.6.0esr: /ires libsmime3.so, but no providers found in RDEPENDS_f=
irefox? [file-rdeps]
libmodule-build-perl-0.31: /usr/bin/config_data contained in package libmod=
ule-build-perl requires /tmp/sysroots/x86_64-linux/usr/bin/perl-native/perl=
=2Ereal, but no providers found in RDEPENDS_libmodule-build-perl? [file-rde=
ps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert.pl contained in=
 package numptyphysics requires /usr/bin/perl, but no providers found in RD=
EPENDS_numptyphysics? [file-rdeps]
ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: /usr/bin/memory-map.sh contained in=
 package ubx-utils requires /bin/bash, but no providers found in RDEPENDS_u=
bx-utils? [file-rdeps]


count: 51	issue: version-going-backwards
cppzmq-4.1.5+gitAUTOINC+68a7b09cfc: Package version for package cppzmq-dev =
went backwards which would break package feeds from (0:git-r0.48 to 0:4.1.5=
+git0+68a7b09cfc-r0.0) [version-going-backwards]
cppzmq-4.1.5+gitAUTOINC+68a7b09cfc: Package version for package cppzmq-dev =
went backwards which would break package feeds from (0:git-r0.51 to 0:4.1.5=
+git0+68a7b09cfc-r0.0) [version-going-backwards]
cppzmq-4.1.5+gitAUTOINC+68a7b09cfc: Package version for package cppzmq-dev =
went backwards which would break package feeds from (0:git-r0.54 to 0:4.1.5=
+git0+68a7b09cfc-r0.0) [version-going-backwards]
libubox-1.0.1+gitAUTOINC+155bf39896: Package version for package libubox-db=
g went backwards which would break package feeds from (0:git-r0.48 to 0:1.0=
=2E1+git0+155bf39896-r0.0) [version-going-backwards]
libubox-1.0.1+gitAUTOINC+155bf39896: Package version for package libubox-db=
g went backwards which would break package feeds from (0:git-r0.53 to 0:1.0=
=2E1+git0+155bf39896-r0.0) [version-going-backwards]
libubox-1.0.1+gitAUTOINC+155bf39896: Package version for package libubox-db=
g went backwards which would break package feeds from (0:git-r0.55 to 0:1.0=
=2E1+git0+155bf39896-r0.0) [version-going-backwards]
libubox-1.0.1+gitAUTOINC+155bf39896: Package version for package libubox-de=
v went backwards which would break package feeds from (0:git-r0.48 to 0:1.0=
=2E1+git0+155bf39896-r0.0) [version-going-backwards]
libubox-1.0.1+gitAUTOINC+155bf39896: Package version for package libubox-de=
v went backwards which would break package feeds from (0:git-r0.53 to 0:1.0=
=2E1+git0+155bf39896-r0.0) [version-going-backwards]
libubox-1.0.1+gitAUTOINC+155bf39896: Package version for package libubox-de=
v went backwards which would break package feeds from (0:git-r0.55 to 0:1.0=
=2E1+git0+155bf39896-r0.0) [version-going-backwards]
libubox-1.0.1+gitAUTOINC+155bf39896: Package version for package libubox-do=
c went backwards which would break package feeds from (0:git-r0.48 to 0:1.0=
=2E1+git0+155bf39896-r0.0) [version-going-backwards]
libubox-1.0.1+gitAUTOINC+155bf39896: Package version for package libubox-do=
c went backwards which would break package feeds from (0:git-r0.53 to 0:1.0=
=2E1+git0+155bf39896-r0.0) [version-going-backwards]
libubox-1.0.1+gitAUTOINC+155bf39896: Package version for package libubox-do=
c went backwards which would break package feeds from (0:git-r0.55 to 0:1.0=
=2E1+git0+155bf39896-r0.0) [version-going-backwards]
libubox-1.0.1+gitAUTOINC+155bf39896: Package version for package libubox-lo=
cale went backwards which would break package feeds from (0:git-r0.48 to 0:=
1.0.1+git0+155bf39896-r0.0) [version-going-backwards]
libubox-1.0.1+gitAUTOINC+155bf39896: Package version for package libubox-lo=
cale went backwards which would break package feeds from (0:git-r0.53 to 0:=
1.0.1+git0+155bf39896-r0.0) [version-going-backwards]
libubox-1.0.1+gitAUTOINC+155bf39896: Package version for package lon for pa=
ckage libubox went backwards which would break package feeds from (0:git-r0=
=2E55 to 0:1.0.1+git0+155bf39896-r0.0) [version-going-backwards]
netdata-1.0.1+gitAUTOINC+36c1304e37: Package version for package netdata-db=
g went backwards which would break package feeds from (0:git-r0.41 to 0:1.0=
=2E1+git0+36c1304e37-r0.0) [version-going-backwards]
netdata-1.0.1+gitAUTOINC+36c1304e37: Package version for package netdata-db=
g went backwards which would break package feeds from (0:git-r0.45 to 0:1.0=
=2E1+git0+36c1304e37-r0.0) [version-going-backwards]
netdata-1.0.1+gitAUTOINC+36c1304e37: Package version for package netdata-de=
v went backwards which would break package feeds from (0:git-r0.41 to 0:1.0=
=2E1+git0+36c1304e37-r0.0) [version-going-backwards]
netdata-1.0.1+gitAUTOINC+36c1304e37: Package version for package netdata-de=
v went backwards which would break package feeds from (0:git-r0.45 to 0:1.0=
=2E1+git0+36c1304e37-r0.0) [version-going-backwards]
netdata-1.0.1+gitAUTOINC+36c1304e37: Package version for package netdata-do=
c went backwards which would break package feeds from (0:git-r0.41 to 0:1.0=
=2E1+git0+36c1304e37-r0.0) [version-going-backwards]
netdata-1.0.1+gitAUTOINC+36c1304e37: Package version for package netdata-do=
c went backwards which would break package feeds from (0:git-r0.45 to 0:1.0=
=2E1+git0+36c1304e37-r0.0) [version-going-backwards]
netdata-1.0.1+gitAUTOINC+36c1304e37: Package version for package netdata-lo=
cale went backwards which would break package feeds from (0:git-r0.41 to 0:=
1.0.1+git0+36c1304e37-r0.0) [version-going-backwards]
netdata-1.0.1+gitAUTOINC+36c1304e37: Package version for package netdata-lo=
cale went backwards which would break package feeds from (0:git-r0.45 to 0:=
1.0.1+git0+36c1304e37-r0.0) [version-going-backwards]
netdata-1.0.1+gitAUTOINC+36c1304e37: Package version for package netdata-st=
aticdev went backwards which would break package feeds from (0:git-r0.41 to=
 0:1.0.1+git0+36c1304e37-r0.0) [version-going-backwards]
netdata-1.0.1+gitAUTOINC+36c1304e37: Package version for package netdata-st=
aticdev went backwards which would break package feeds from (0:git-r0.45 to=
 0:1.0.1+git0+36c1304e37-r0.0) [version-going-backwards]
netdata-1.0.1+gitAUTOINC+36c1304e37: Package version for package netdata we=
nt backwards which would break package feeds from (0:git-r0.41 to 0:1.0.1+g=
it0+36c1304e37-r0.0) [version-going-backwards]
netdata-1.0.1+gitAUTOINC+36c1304e37: Package version for package netdata we=
nt backwards which would break package feeds from (0:git-r0.45 to 0:1.0.1+g=
it0+36c1304e37-r0.0) [version-going-backwards]
relayd-0.0.1+gitAUTOINC+2970ff60ba: Package version for package relayd-dbg =
went backwards which would break package feeds from (0:git-r0.48 to 0:0.0.1=
+git0+2970ff60ba-r0.0) [version-going-backwards]
relayd-0.0.1+gitAUTOINC+2970ff60ba: Package version for package relayd-dbg =
went backwards which would break package feeds from (0:git-r0.53 to 0:0.0.1=
+git0+2970ff60ba-r0.0) [version-going-backwards]
relayd-0.0.1+gitAUTOINC+2970ff60ba: Package version for package relayd-dbg =
went backwards which would break package feeds from (0:git-r0.55 to 0:0.0.1=
+git0+2970ff60ba-r0.0) [version-going-backwards]
relayd-0.0.1+gitAUTOINC+2970ff60ba: Package version for package relayd-dev =
went backwards which would break package feeds from (0:git-r0.48 to 0:0.0.1=
+git0+2970ff60ba-r0.0) [version-going-backwards]
relayd-0.0.1+gitAUTOINC+2970ff60ba: Package version for package relayd-dev =
went backwards which would break package feeds from (0:git-r0.53 to 0:0.0.1=
+git0+2970ff60ba-r0.0) [version-going-backwards]
relayd-0.0.1+gitAUTO0:0.0.1+git0+2970ff60ba-r0.0) [version-going-backwards]
relayd-0.0.1+gitAUTOINC+2970ff60ba: Package version for package relayd-stat=
icdev went backwards which would break package feeds from (0:git-r0.48 to 0=
:0.0.1+git0+2970ff60ba-r0.0) [version-going-backwards]
relayd-0.0.1+gitAUTOINC+2970ff60ba: Package version for package relayd-stat=
icdev went backwards which would break package feeds from (0:git-r0.53 to 0=
:0.0.1+git0+2970ff60ba-r0.0) [version-going-backwards]
relayd-0.0.1+gitAUTOINC+2970ff60ba: Package version for package relayd-stat=
icdev went backwards which would break package feeds from (0:git-r0.55 to 0=
:0.0.1+git0+2970ff60ba-r0.0) [version-going-backwards]
relayd-0.0.1+gitAUTOINC+2970ff60ba: Package version for package relayd went=
 backwards which would break package feeds from (0:git-r0.48 to 0:0.0.1+git=
0+2970ff60ba-r0.0) [version-going-backwards]
relayd-0.0.1+gitAUTOINC+2970ff60ba: Package version for package relayd went=
 backwards which would break package feeds from (0:git-r0.53 to 0:0.0.1+git=
0+2970ff60ba-r0.0) [version-going-backwards]
relayd-0.0.1+gitAUTOINC+2970ff60ba: Package version for package relayd went=
 backwards which would break package feeds from (0:git-r0.55 to 0:0.0.1+git=
0+2970ff60ba-r0.0) [version-going-backwards]


count: 0	issue: host-user-contaminated


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
518b901 cookerdata: Convert multiconfig to use BB_CURRENT_MC
not included in master yet:=20
2cb8091 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
a7cb408 sanity.bbclass: Improved error message
not included in master yet:=20
73358d3 qemux86: Add identical qemux86copy variant for tests
20d9bcd sstate-sysroot-cruft.sh: Extend the whitelist
3d80a75 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
6b3dc29 buildhistory.bbclass: metadata-revs show repo parent
717445a metadata-revs: provide more information
d0f10c1 report-error: Allow to upload reports automatically

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
def2483 usrsctp: Add recipe
not included in master yet:=20
f9a7ce4 kodi: Add krypton/17.x Jarvis/16.x recipes
9e50755 kodi: Fix build with pic on x86_64
7964534 kodi-17: Add packageconfig for lcms support
5610447 kodi-17: Fix build with musl
c479b98 kodi-17: Update to latest
8eaee16 kodi-17: Fix build for qemuarm and update to latest
4141b4a opensaf: 5.0.0 -> 5.1.0
cace937 lcov: fix env command argument pass issue
6fa479f mm-common: update 0.9.8 -> 0.9.10
1c80694 libsigc++-2.0: update 2.2.11 -> 2.10.0
cf93daf glibmm: update 2.44.0 -> 2.50.0
ecac202 cairomm: update 1.11.2 -> 1.12.0
33b6725 pangomm: update 2.36.0 -> 2.40.1
34d666c atkmm: update 2.22.7 -> 2.24.2
36197a7 gtkmm: update 2.24.3 -> 2.24.5
9ad997c gnome-system-monitor: fix build after update of gnome c++ bindings
24af41b python-chardet: provide both python2 and python3 packages
bc241ce python-pytz: provide both python2 and python3 packages
d97bf80 python-yaml: provide both python2 and python3 package
ea5a964 python3-multidict: add package for multidict
a566611 raptor2: initial add 2.0.15
62b6779 makedumpfile: update to 1.6.1
b2a5ca0 Chromium-utils: add recipe for Chromium Embedded Controller utiliti=
es
0044d64 sip: re-add 4.19
a7c6d2a python-pytz: provide native and nativesdk veCONFIG for opus - disab=
led by default
4af3041 poppler: update to 0.51.0

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
c0ba8ab qtbase: Remove comments about ICU and QtWebKit
not included in master yet:=20
8aa8260 Upgrade to Qt 5.8
eb28660 qtwayland: fix typo

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
5d155da Merge pull request #24 from ashie/firefox-45.6.0-2
not included in master yet:=20
319fe89 firefox: fix configure with oe-core master - there is no nss-config
3c74e38 firefox: use pkg-config to find nspr
3d896d5 firefox: do not link against crmf library - it is not there
26eb308 chromium: add i586 (qemux86) support

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
29361e4 libqofono: use the recipe from meta-qt5
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
ce9bd59 maguro: use kernel source from shr repo.
not included in master yet:=20

--cWoXeonUoKmBZSoM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWIi7QAAKCRA3VSO3ZXaA
HMsUAJ9kILZi3rUy8TXpeGUap632RzoOnQCeOL/sDVBLvPUWT60ggHhB4LwC6ZY=
=LJVB
-----END PGP SIGNATURE-----

--cWoXeonUoKmBZSoM--
