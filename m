Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id EB97E73081;
	Wed, 26 Apr 2017 18:01:19 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id m123so12279781wma.0;
	Wed, 26 Apr 2017 11:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=1ndEFBs2AiRu7xwTdhkHqdkImDG1cDIjRqxZzNHC/+U=;
	b=X6/I/Jvt/ZxTLgfaEtcCeCo+Yh6o4xWM3ZSyCGiflshIpvU6Vk4jlDjI6t7BD438ry
	0k40x3J5s9UZQVzvIDLYasnJbVZxXytOcUYaljB0DzauLy1fFNGLjmYpPk7N6k/pmx24
	i4MBHy7XiWzwTAtegG5GHbNCuQBvXZpndMpXvDVy8Khl6IbWqlBNWI7mOxb7CTorpPMe
	n4nvoSn5af1/nhtzI5aSZpTUdDe7aBjO49kcykU+lONtu/gdtGbXtK1aTFzshmNS/OLu
	yKl9d16zMRbdy98D79oZ1kqae4TujtHuLsIQKajzYUOZe6T/53Wey8uHpvV1XoMzWlsm
	qLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=1ndEFBs2AiRu7xwTdhkHqdkImDG1cDIjRqxZzNHC/+U=;
	b=py2sj2XzokbddB+VJfA5b5cgkYoTXZdaIiqbOky8KMO9qPDbjlqRRAEnFgMBjjpHk/
	sfUvObkTDGrDyjbABAP7AxOXAeC8Lz1Q18GgHM26GKG79/lphv+8BqXoFPeJb4d750+/
	joGjnz9jegwQk3XTrjHa+w+D1nao+deo6+WPOWhBYZLpDQRpMi9azUQw7G28O12sNeuv
	c8bLspghz6J+xwlnV4pLrZ5GMBb/xS9JB1AMgNxT9FXNKvv+X9n0jZAoCS3BKkI2+SoN
	12cU7RI+a6h51eCdZyo3iR9tClVImItq86iS+nCsfoqXq9jx1Wm4rDLa/S0oaHWZPXMh
	wB3A==
X-Gm-Message-State: AN3rC/4hXo5jUe6DjajKn1VsnyP4ZOwtdxkzwyTlvd1ChB9k+yWB5p4x
	Xx0qoG8tRst1Sb/d
X-Received: by 10.28.39.7 with SMTP id n7mr1786314wmn.129.1493229679083;
	Wed, 26 Apr 2017 11:01:19 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	y63sm10233307wme.31.2017.04.26.11.01.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 26 Apr 2017 11:01:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 26 Apr 2017 20:01:35 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170426180135.GC3258@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.2 (2017-04-18)
Subject: State of bitbake world, Failed tasks 2017-04-26
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
X-List-Received-Date: Wed, 26 Apr 2017 18:01:20 -0000
X-Groupsio-MsgNum: 96721
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5QAgd0e35j3NYeGe"
Content-Disposition: inline

--5QAgd0e35j3NYeGe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=3D=3D Number of issues - stats =3D=3D
{| class=3D'wikitable'
!|Date		     !!colspan=3D'3'|Failed tasks			    !!colspan=3D'6'|Failed depe=
ncencies			 !!|Signatures		  !!colspan=3D'14'|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||qemuarm||max||min	||qemux86||max||mi=
n	||all 	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||=
version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||u=
nknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	=
||ldflags	||compile-host-path	||=09
|-
||2017-04-26	||1	||1	||1	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||0		=
||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2017-04-26 =3D=3D

INFO: jenkins-job.sh-1.8.20 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20170426_075850.log

=3D=3D=3D common (1) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb=
:do_configure

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (3) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 1	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemuarm.20170426_012603.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/36763/
|-
|| qemux86 	|| 1	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemux86.20170426_012607.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/36764/
|-
|| qemux86_64 	|| 1	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.world.qemux86-64.20170426_035801.log/ || http://errors.yoctoproject.or=
g/Errors/Build/36765/
|}

=3D=3D=3D PNBLACKLISTs (433) =3D=3D=3D

=3D=3D=3D QA issues (0) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||compile-host-path
|-
||0	||file-rdeps
|-
||0	||host-user-contaminated
|-
||0	||installed-vs-shipped
|-
||0	||invalid-pkgconfig
|-
||0	||ldflags
|-
||0	||libdir
|-
||0	||pkgname
|-
||0	||symlink-to-sysroot
|-
||0	||textrel
|-
||0	||unknown-configure-option
|-
||0	||version-going-backwards
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20170426_035546.log/

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
recipes-browser/chromium/cef3_280796.bb:PNBLACKLIST[cef3] ?=3D "BROKEN: fai=
ls to build with gcc-6"
meta-openembedded:
meta-efl/recipes-devtools/python/python-edbus_1.7.0.bb:PNBLACKLIST[python-e=
dbus] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/D=
etails/130600/ - the recipe will be removed on 2017-09-01 unless the issue =
is fixed"
meta-efl/recipes-devtools/python/python-efl_1.15.0.bb:PNBLACKLIST[python-ef=
l] ?=3D "Depends on blacklisted elementary - the recipe will be removed on =
2017-09-01 unless the issue is fixed"
meta-efl/recipes-devtools/python/python-efl_git.bb:PNBLACKLIST[python-efl] =
?=3D "Depends on blacklisted elementary - the recipe will be removed on 201=
7-09-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/cpu_svn.bb:PNBLACKLIST[cpu] ?=3D "Depends on black=
listed e-wm - the recipe will be removed on 2017-09-01 unless the issue is =
fixed"
meta-efl/recipes-efl/e17/diskio_svn.bb:PNBLACKLIST[diskio] ?=3D "broken: sw=
itch to https://git.enlightenment.org/enlightenment/modules/diskio.git/ and=
 fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58. in=
valid state name: 'off'. "default" state must always be first. - the recipe=
 will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/e-tasks_git.bb:PNBLACKLIST[e-tasks] ?=3D "Depends =
on blacklisted elementary - the recipe will be removed on 2017-09-01 unless=
 the issue is fixed"
meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb:PNBLACKLIST[e-wm-theme-b=
-and-w] ?=3D "Runtime depends on blacklisted e-wm - the recipe will be remo=
ved on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb:PNBLACKLIST[e-wm-theme-b=
-and-w] ?=3D "Runtime depends on blacklisted e-wm-theme-b-and-w - the recip=
e will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb:PNBLACKLIST[e-wm-theme-b=
-and-w] ?=3D "Runtime depends on blacklisted e-wm-theme-b-and-w-dev - the r=
ecipe will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb:PNBLACKLIST[e-wm=
-theme-illume-efenniht] ?=3D "Runtime depends on blacklisted e-wm - the rec=
ipe will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb:PNBLACKLIST[e-wm=
-theme-illume-efenniht] ?=3D "Runtime depends on blacklisted e-wm-theme-ill=
ume-efenniht - the recipe will be removed on 2017-09-01 unless the issue is=
 fixed"
meta-efl/recipes-efl/e17/e-wm_0.18.8.bb:PNBLACKLIST[e-wm] ?=3D "Depends on =
blacklisted elementary - the recipe will be removed on 2017-09-01 unless th=
e issue is fixed"
meta-efl/recipes-efl/e17/e-wm_0.19.10.bb:PNBLACKLIST[e-wm] ?=3D "Depends on=
 blacklisted elementary - the recipe will be removed on 2017-09-01 unless t=
he issue is fixed"
meta-efl/recipes-efl/e17/e-wm_git.bb:PNBLACKLIST[e-wm] ?=3D "Depends on bla=
cklisted elementary - the recipe will be removed on 2017-09-01 unless the i=
ssue is fixed"
meta-efl/recipes-efl/e17/edje-viewer_svn.bb:PNBLACKLIST[edje-viewer] ?=3D "=
Depends on blacklisted elementary - the recipe will be removed on 2017-09-0=
1 unless the issue is fixed"
meta-efl/recipes-efl/e17/elbow_git.bb:PNBLACKLIST[elbow] ?=3D "Depends on b=
lacklisted webkit-efl - the recipe will be removed on 2017-09-01 unless the=
 issue is fixed"
meta-efl/recipes-efl/e17/elfe_git.bb:PNBLACKLIST[elfe] ?=3D "Depends on bla=
cklisted elementary - the recipe will be removed on 2017-09-01 unless the i=
ssue is fixed"
meta-efl/recipes-efl/e17/elmdentica_svn.bb:PNBLACKLIST[elmdentica] ?=3D "OL=
D and depends on broken azy - the recipe will be removed on 2017-09-01 unle=
ss the issue is fixed"
meta-efl/recipes-efl/e17/emprint_svn.bb:PNBLACKLIST[emprint] ?=3D "if you w=
ant to use these modules with E18, then you need to update it to git recipe=
 fetching newer sources from http://git.enlightenment.org/apps/emprint.git/=
 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/enjoy_git.bb:PNBLACKLIST[enjoy] ?=3D "Depends on b=
lacklisted elementary - the recipe will be removed on 2017-09-01 unless the=
 issue is fixed"
meta-efl/recipes-efl/e17/ephoto_svn.bb:PNBLACKLIST[ephoto] ?=3D "Depends on=
 blacklisted elementary - the recipe will be removed on 2017-09-01 unless t=
he issue is fixed"
meta-efl/recipes-efl/e17/exalt-client_svn.bb:PNBLACKLIST[exalt-client] ?=3D=
 "Depends on blacklisted elementary - the recipe will be removed on 2017-09=
-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/exalt_svn.bb:PNBLACKLIST[exalt] ?=3D "Depends on b=
lacklisted elementary - the recipe will be removed on 2017-09-01 unless the=
 issue is fixed"
meta-efl/recipes-efl/e17/exquisite-theme-illume.bb:PNBLACKLIST[exquisite-th=
eme-illume] ?=3D "Depends on blacklisted edje-native - the recipe will be r=
emoved on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/exquisite-theme-illume.bb:PNBLACKLIST[exquisite-th=
eme-illume] ?=3D "Runtime depends on blacklisted exquisite-theme-illume - t=
he recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/exquisite-theme-illume.bb:PNBLACKLIST[exquisite-th=
eme-illume] ?=3D "Runtime depends on blacklisted exquisite-theme-illume-dev=
 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/exquisite_svn.bb:PNBLACKLIST[exquisite] ?=3D "Fail=
s to build with RSS http://errors.yoctoproject.org/Errors/Details/130619/ -=
 the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/flame_svn.bb:PNBLACKLIST[flame] ?=3D "Depends on b=
lacklisted e-wm - the recipe will be removed on 2017-09-01 unless the issue=
 is fixed"
meta-efl/recipes-efl/e17/forecasts_svn.bb:PNBLACKLIST[forecasts] ?=3D "Depe=
nds on blacklisted e-wm - the recipe will be removed on 2017-09-01 unless t=
he issue is fixed"
meta-efl/recipes-efl/e17/news_svn.bb:PNBLACKLIST[news] ?=3D "if you want to=
 use these modules with E18, then you need to update it to git recipe fetch=
ing newer sources from http://git.enlightenment.org/enlightenment/modules/n=
ews.git/ - the recipe will be removed on 2017-09-01 unless the issue is fix=
ed"
meta-efl/recipes-efl/e17/places_svn.bb:PNBLACKLIST[places] ?=3D "Depends on=
 blacklisted e-wm - the recipe will be removed on 2017-09-01 unless the iss=
ue is fixed"
meta-efl/recipes-efl/e17/rage_svn.bb:PNBLACKLIST[rage] ?=3D "if you want to=
 use these modules with E18, then you need to update it to git recipe fetch=
ing newer sources from  http://git.enlightenment.org/apps/rage.git/ - the r=
ecipe will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/rain_svn.bb:PNBLACKLIST[rain] ?=3D "Depends on bla=
cklisted e-wm - the recipe will be removed on 2017-09-01 unless the issue i=
s fixed"
meta-efl/recipes-efl/e17/screenshot_svn.bb:PNBLACKLIST[screenshot] ?=3D "de=
pends on blacklisted emprint - the recipe will be removed on 2017-09-01 unl=
ess the issue is fixed"
meta-efl/recipes-efl/e17/terminology_0.9.1.bb:PNBLACKLIST[terminology] ?=3D=
 "Depends on blacklisted elementary - the recipe will be removed on 2017-09=
-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/uptime_svn.bb:PNBLACKLIST[uptime] ?=3D "Depends on=
 blacklisted e-wm - the recipe will be removed on 2017-09-01 unless the iss=
ue is fixed"
meta-efl/recipes-efl/efl/azy_svn.bb:PNBLACKLIST[azy] ?=3D "OLD and doesn't =
build with gcc-5 - the recipe will be removed on 2017-09-01 unless the issu=
e is fixed"
meta-efl/recipes-efl/efl/edbus_1.7.9.bb:PNBLACKLIST[edbus] ?=3D "Depends on=
 blacklisted ecore - the recipe will be removed on 2017-09-01 unless the is=
sue is fixed"
meta-efl/recipes-efl/efl/edbus_1.7.9.bb:PNBLACKLIST[edbus] ?=3D "Depends on=
 blacklisted eina - the recipe will be removed on 2017-09-01 unless the iss=
ue is fixed"
meta-efl/recipes-efl/efl/edbus_1.7.9.bb:PNBLACKLIST[edbus] ?=3D "Runtime de=
pends on blacklisted edbus - the recipe will be removed on 2017-09-01 unles=
s the issue is fixed"
meta-efl/recipes-efl/efl/edbus_1.7.9.bb:PNBLACKLIST[edbus] ?=3D "Runtime de=
pends on blacklisted edbus-dev - the recipe will be removed on 2017-09-01 u=
nless the issue is fixed"
meta-efl/recipes-efl/efl/efl.inc:PNBLACKLIST[efl] ?=3D "Depends on broken e=
fl-native - the recipe will be removed on 2017-09-01 unless the issue is fi=
xed"
meta-efl/recipes-efl/efl/efl.inc:PNBLACKLIST[efl-native] ?=3D "Broken: fail=
s to build with http://errors.yoctoproject.org/Errors/Details/138240/ - the=
 recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb:PNBLACKLIST[eleme=
ntary-theme-efenniht] ?=3D "Depends on blacklisted edje-native - the recipe=
 will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb:PNBLACKLIST[eleme=
ntary-theme-efenniht] ?=3D "Runtime depends on blacklisted elementary-theme=
-efenniht - the recipe will be removed on 2017-09-01 unless the issue is fi=
xed"
meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb:PNBLACKLIST[eleme=
ntary-theme-efenniht] ?=3D "Runtime depends on blacklisted elementary-theme=
-efenniht-dev - the recipe will be removed on 2017-09-01 unless the issue i=
s fixed"
meta-efl/recipes-efl/efl/elementary_1.15.1.bb:PNBLACKLIST[elementary] ?=3D =
"Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/1305=
84/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/emotion-generic-players_1.15.0.bb:PNBLACKLIST[emot=
ion-generic-players] ?=3D "Depends on blacklisted emotion - the recipe will=
 be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/emotion-generic-players_1.15.0.bb:PNBLACKLIST[emot=
ion-generic-players] ?=3D "Runtime depends on blacklisted emotion-generic-p=
layers - the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/emotion-generic-players_1.15.0.bb:PNBLACKLIST[emot=
ion-generic-players] ?=3D "Runtime depends on blacklisted emotion-generic-p=
layers-dev - the recipe will be removed on 2017-09-01 unless the issue is f=
ixed"
meta-efl/recipes-efl/efl/engrave_svn.bb:PNBLACKLIST[engrave] ?=3D "BROKEN: =
fails to build with latest oe-core - the recipe will be removed on 2017-09-=
01 unless the issue is fixed"
meta-efl/recipes-efl/efl/entrance_svn.bb:PNBLACKLIST[entrance] ?=3D "broken=
: switch to https://git.enlightenment.org/misc/entrance.git and fix 0.0.4+s=
vnr82070-r7/entrance/data/themes/old/default.edc:678. invalid state name: '=
defaault'. "default" state must always be first. - the recipe will be remov=
ed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/epdf_svn.bb:PNBLACKLIST[epdf] ?=3D "Depends on bla=
cklisted ecore - the recipe will be removed on 2017-09-01 unless the issue =
is fixed"
meta-efl/recipes-efl/efl/epdf_svn.bb:PNBLACKLIST[epdf] ?=3D "Depends on bla=
cklisted evas - the recipe will be removed on 2017-09-01 unless the issue i=
s fixed"
meta-efl/recipes-efl/efl/epdf_svn.bb:PNBLACKLIST[epdf] ?=3D "Runtime depend=
s on blacklisted epdf-dev - the recipe will be removed on 2017-09-01 unless=
 the issue is fixed"
meta-efl/recipes-efl/efl/epdf_svn.bb:PNBLACKLIST[epdf] ?=3D "Runtime depend=
s on blacklisted epdf - the recipe will be removed on 2017-09-01 unless the=
 issue is fixed"
meta-efl/recipes-efl/efl/evas-generic-loaders_1.15.0.bb:PNBLACKLIST[evas-ge=
neric-loaders] ?=3D "Depends on blacklisted eina - the recipe will be remov=
ed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/evas-generic-loaders_1.15.0.bb:PNBLACKLIST[evas-ge=
neric-loaders] ?=3D "Runtime depends on blacklisted evas-generic-loaders - =
the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/evas-generic-loaders_1.15.0.bb:PNBLACKLIST[evas-ge=
neric-loaders] ?=3D "Runtime depends on blacklisted evas-generic-loaders-de=
v - the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_1.7.9.bb:PNBLACKLIST[expedite] ?=3D "Depe=
nds on blacklisted eet - the recipe will be removed on 2017-09-01 unless th=
e issue is fixed"
meta-efl/recipes-efl/efl/expedite_1.7.9.bb:PNBLACKLIST[expedite] ?=3D "Depe=
nds on blacklisted evas - the recipe will be removed on 2017-09-01 unless t=
he issue is fixed"
meta-efl/recipes-efl/efl/expedite_1.7.9.bb:PNBLACKLIST[expedite] ?=3D "Runt=
ime depends on blacklisted evas-loader-png - the recipe will be removed on =
2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_1.7.9.bb:PNBLACKLIST[expedite] ?=3D "Runt=
ime depends on blacklisted expedite - the recipe will be removed on 2017-09=
-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_1.7.9.bb:PNBLACKLIST[expedite] ?=3D "Runt=
ime depends on blacklisted expedite-themes - the recipe will be removed on =
2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_1.7.9.bb:PNBLACKLIST[expedite] ?=3D "Runt=
ime depends on blacklisted evas-engine-gl-x11 - the recipe will be removed =
on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_1.7.9.bb:PNBLACKLIST[expedite] ?=3D "Runt=
ime depends on blacklisted evas-engine-software-generic - the recipe will b=
e removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_1.7.9.bb:PNBLACKLIST[expedite] ?=3D "Runt=
ime depends on blacklisted expedite-dev - the recipe will be removed on 201=
7-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_1.7.9.bb:PNBLACKLIST[expedite] ?=3D "Runt=
ime depends on blacklisted evas-engine-software-x11 - the recipe will be re=
moved on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_1.7.9.bb:PNBLACKLIST[expedite] ?=3D "Runt=
ime depends on blacklisted evas-engine-fb - the recipe will be removed on 2=
017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_git.bb:PNBLACKLIST[expedite] ?=3D "Depend=
s on blacklisted eet - the recipe will be removed on 2017-09-01 unless the =
issue is fixed"
meta-efl/recipes-efl/efl/expedite_git.bb:PNBLACKLIST[expedite] ?=3D "Depend=
s on blacklisted evas - the recipe will be removed on 2017-09-01 unless the=
 issue is fixed"
meta-efl/recipes-efl/efl/expedite_git.bb:PNBLACKLIST[expedite] ?=3D "Runtim=
e depends on blacklisted evas-loader-png - the recipe will be removed on 20=
17-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_git.bb:PNBLACKLIST[expedite] ?=3D "Runtim=
e depends on blacklisted expedite - the recipe will be removed on 2017-09-0=
1 unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_git.bb:PNBLACKLIST[expedite] ?=3D "Runtim=
e depends on blacklisted evas-engine-software-generic - the recipe will be =
removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_git.bb:PNBLACKLIST[expedite] ?=3D "Runtim=
e depends on blacklisted evas-engine-fb - the recipe will be removed on 201=
7-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_git.bb:PNBLACKLIST[expedite] ?=3D "Runtim=
e depends on blacklisted evas-engine-software-x11 - the recipe will be remo=
ved on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_git.bb:PNBLACKLIST[expedite] ?=3D "Runtim=
e depends on blacklisted evas-engine-gl-x11 - the recipe will be removed on=
 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_git.bb:PNBLACKLIST[expedite] ?=3D "Runtim=
e depends on blacklisted expedite-dev - the recipe will be removed on 2017-=
09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_git.bb:PNBLACKLIST[expedite] ?=3D "Runtim=
e depends on blacklisted expedite-themes - the recipe will be removed on 20=
17-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/libeflvala_svn.bb:PNBLACKLIST[libeflvala] ?=3D "De=
pends on blacklisted elementary - the recipe will be removed on 2017-09-01 =
unless the issue is fixed"
meta-efl/recipes-efl/efl/libeweather_svn.bb:PNBLACKLIST[libeweather] ?=3D "=
Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/13064=
9/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb:PNBLACKLIST[pack=
agegroup-efl-sdk] ?=3D "Runtime depends on blacklisted elementary-dev - the=
 recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.b=
b:PNBLACKLIST[packagegroup-efl-standalone-sdk-target] ?=3D "Runtime depends=
 on blacklisted elementary-dev - the recipe will be removed on 2017-09-01 u=
nless the issue is fixed"
meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb:PNBLACKLIST[p=
ackagegroup-x11-illume] ?=3D "Runtime depends on blacklisted e-wm - the rec=
ipe will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb:PNBLACKLIST[p=
ackagegroup-x11-illume] ?=3D "Runtime depends on blacklisted e-wm-config-mo=
bile - the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb:PNBLACKLIST[p=
ackagegroup-x11-illume] ?=3D "Runtime depends on blacklisted e-wm-theme-def=
ault - the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/webkit/webkit-efl.inc:PNBLACKLIST[webkit-efl] ?=3D "Ol=
d and unmaintaned fork with many security issues - the recipe will be remov=
ed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb:PNBLACKLIST[mcnavi] ?=3D=
 "BROKEN: latest version 0.3.4 is 3 years old and now broken with more stri=
ct ejde_cc from efl-1.13 - the recipe will be removed on 2017-09-01 unless =
the issue is fixed"
meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb:PNBLACKLIST[s=
mbnetfs] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Error=
s/Details/132827/ - the recipe will be removed on 2017-09-01 unless the iss=
ue is fixed"
meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb:PNBL=
ACKLIST[unionfs-fuse] ?=3D "Fails to build with RSS http://errors.yoctoproj=
ect.org/Errors/Details/130648/ - the recipe will be removed on 2017-09-01 u=
nless the issue is fixed"
meta-filesystems/recipes-utils/dmapi/dmapi_2.2.12.bb:PNBLACKLIST[dmapi] ?=
=3D "Depends on broken xfsprogs - the recipe will be removed on 2017-09-01 =
unless the issue is fixed"
meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb:PNBLACKLIST[xfsdump=
] ?=3D "Depends on broken xfsprogs - the recipe will be removed on 2017-09-=
01 unless the issue is fixed"
meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb:PNBLACKLIST[cheese] ?=3D "D=
epends on blacklisted gstreamer - the recipe will be removed on 2017-09-01 =
unless the issue is fixed"
meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb:PNBLACKLIST[cheese] ?=3D "D=
epends on blacklisted gnome-desktop - the recipe will be removed on 2017-09=
-01 unless the issue is fixed"
meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb:PNBLACKLIST[epdfview] ?=
=3D "BROKEN: images are not displayed anymore - the recipe will be removed =
on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb:PNBLACKLIST[gmtk] ?=3D =
"Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/1306=
61/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gn=
ome-mplayer] ?=3D "rdepends on blacklisted mplayer - the recipe will be rem=
oved on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb:PN=
BLACKLIST[gtk-theme-torturer] ?=3D "BROKEN: gmacros.h:182:53: error: size o=
f array '_GStaticAssertCompileTimeAssertion_2' is negative - the recipe wil=
l be removed on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb:PNBLACKLIST[gcalctoo=
l] ?=3D "broken at least since April 2013 http://permalink.gmane.org/gmane.=
comp.handhelds.openembedded/57920 and nobody complained, it's also replaced=
 by gnome calculator - the recipe will be removed on 2017-09-01 unless the =
issue is fixed"
meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb:PNBLACKLIST[gdm] ?=3D "Depends o=
n broken gnome-panel - the recipe will be removed on 2017-09-01 unless the =
issue is fixed"
meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb:PNBL=
ACKLIST[gnome-backgrounds] ?=3D "Fails to build with RSS http://errors.yoct=
oproject.org/Errors/Details/130647/ - the recipe will be removed on 2017-09=
-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.b=
b:PNBLACKLIST[gnome-control-center] ?=3D "Depends on broken gnome-menus - t=
he recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb:PNBLACKLIST[=
gnome-desktop] ?=3D "Fails to build with RSS http://errors.yoctoproject.org=
/Errors/Details/130595/ - the recipe will be removed on 2017-09-01 unless t=
he issue is fixed"
meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb:PN=
BLACKLIST[gnome-disk-utility] ?=3D "Fails to build with RSS http://errors.y=
octoproject.org/Errors/Details/132824/ - the recipe will be removed on 2017=
-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLIST[=
gnome-keyring] ?=3D "This version conflicts with gcr from oe-core - the rec=
ipe will be removed on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb:PNBLACKLIST[gnom=
e-menus] ?=3D "BROKEN: fails to build because of python + conflicts with gn=
ome-menu3 - the recipe will be removed on 2017-09-01 unless the issue is fi=
xed"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnom=
e-panel3] ?=3D "CONFLICT: depends on libgweather3 which conflicts with libg=
weather - the recipe will be removed on 2017-09-01 unless the issue is fixe=
d"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnom=
e-panel3] ?=3D "Depends on broken gnome-menus - the recipe will be removed =
on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1ipes-gnome/gnome-set=
tings-daemon/gnome-settings-daemon_2.32.1.bb:PNBLACKLIST[gnome-settings-dae=
mon] ?=3D "Depends on blacklisted libgnomekbd - the recipe will be removed =
on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1=
=2Ebb:PNBLACKLIST[gnome-settings-daemon] ?=3D "Depends on blacklisted gnome=
-desktop - the recipe will be removed on 2017-09-01 unless the issue is fix=
ed"
meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.b=
b:PNBLACKLIST[gnome-system-monitor] ?=3D "Fails to build with RSS http://er=
rors.yoctoproject.org/Errors/Details/131635/ - the recipe will be removed o=
n 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb:PNBLACKLIST[gnome-t=
erminal] ?=3D "BROKEN: fails to build with gcc-6 - the recipe will be remov=
ed on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb:PNBLACKLIST[libgnomecu=
ps] ?=3D "Depends on blacklisted libgnomeui - the recipe will be removed on=
 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb:PNBLACKLIST[libgnome=
print] ?=3D "Depends on broken libgnomecups - the recipe will be removed on=
 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb:PNBLACKLIST[gnumeric] =
?=3D "Depends on broken libgnomeprint - the recipe will be removed on 2017-=
09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb:PNBLACKLIST[gthumb] ?=3D "=
Depends on blacklisted gstreamer - the recipe will be removed on 2017-09-01=
 unless the issue is fixed"
meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgwea=
ther3] ?=3D "CONFLICT: 876 files are conflicting with libgweather - the rec=
ipe will be removed on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb:PNBLACKLIST[libgwea=
ther] ?=3D "BROKEN: fails to build with gcc-6 - the recipe will be removed =
on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb:PNBLACKLIST[libgnom=
ekbd] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/D=
etails/130608/ - the recipe will be removed on 2017-09-01 unless the issue =
is fixed"
meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb:PNBLACKLIST[nautilus3]=
 ?=3D "BROKEN: fails to build, maybe missing dependency on gnome-desktop-ut=
ils.h provider - the recipe will be removed on 2017-09-01 unless the issue =
is fixed"
meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb:PNBLACKLIST[nautilus] =
?=3D "Depends on blacklisted gnome-desktop - the recipe will be removed on =
2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb:PNBLACKLIST[contacts] ?=3D=
 "Fails to fetch, pimlico-project.org is gone http://errors.yoctoproject.or=
g/Errors/Details/132854/ - the recipe will be removed on 2017-09-01 unless =
the issue is fixed"
meta-gnome/recipes-gnome/pimlico/contacts_git.bb:PNBLACKLIST[contacts] ?=3D=
 "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/132=
826/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb:PNBLACKLIST[tasks] ?=3D "Fai=
ls to build with gcc-6 - the recipe will be removed on 2017-09-01 unless th=
e issue is fixed"
meta-gnome/recipes-gnome/pimlico/tasks_git.bb:PNBLACKLIST[tasks] ?=3D "Fail=
s to build with gcc-6 - the recipe will be removed on 2017-09-01 unless the=
 issue is fixed"
meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb:PNBLA=
CKLIST[system-tools-backends] ?=3D "does notes-support/tracker/tracker_0.14=
=2E2.bb:PNBLACKLIST[tracker] ?=3D "BROKEN: fails to build with new binutils=
-2.27 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb:PNBLACKLIST[gpe-scap] ?=
=3D "Depends on blacklisted libgpewidget - the recipe will be removed on 20=
17-09-01 unless the issue is fixed"
meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb:PNBLACKLIST[li=
bgpewidget] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Er=
rors/Details/130594/ - the recipe will be removed on 2017-09-01 unless the =
issue is fixed"
meta-gpe/recipes-graphics/minilite/minilite_0.50.bb:PNBLACKLIST[minilite] ?=
=3D "Depends on blacklisted libgpewidget - the recipe will be removed on 20=
17-09-01 unless the issue is fixed"
meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb:PNBLACKLIST[fbreader]=
 ?=3D "Depends on blacklisted libgpewidget - the recipe will be removed on =
2017-09-01 unless the issue is fixed"
meta-gpe/recipes-support/fbreader/fbreader_git.bb:PNBLACKLIST[fbreader] ?=
=3D "BROKEN: fails to build with gcc-6 - the recipe will be removed on 2017=
-09-01 unless the issue is fixed"
meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb:PNBLACKLIST[g=
upnp-igd] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Erro=
rs/Details/130645/ - the recipe will be removed on 2017-09-01 unless the is=
sue is fixed"
meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.10.bb:PNBLACKLIS=
T[gupnp-tools] ?=3D "Fails to build with RSS http://errors.yoctoproject.org=
/Errors/Details/130670/ - the recipe will be removed on 2017-09-01 unless t=
he issue is fixed"
meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb:PNBLACKLIST[dvb-apps=
] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/Detai=
ls/130603/ - the recipe will be removed on 2017-09-01 unless the issue is f=
ixed"
meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb:PNBLACKLIST[tvheaden=
d] ?=3D "Depends on blacklisted dvb-apps - the recipe will be removed on 20=
17-09-01 unless the issue is fixed"
meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts_git.bb:PNBLACKL=
IST[kodi-addon-pvr-hts] ?=3D "Depends on blacklisted kodi - the recipe will=
 be removed on 2017-09-01 unless the issue is fixed"
meta-multimedia/recipes-mediacenter/kodi/kodi-platform_git.bb:PNBLACKLIST[k=
odi-platform] ?=3D "Depends on blacklisted kodi - the recipe will be remove=
d on 2017-09-01 unless the issue is fixed"
meta-multimedia/recipes-mediacenter/kodi/kodi-startup.bb:PNBLACKLIST[kodi-s=
tartup] ?=3D "Runtime depends on blacklisted kodi - the recipe will be remo=
ved on 2017-09-01 unless the issue is fixed"
meta-multimedia/recipes-mediacenter/kodi/kodi-startup.bb:PNBLACKLIST[kodi-s=
tartup] ?=3D "Runtime depends on blacklisted kodi-startup-dev - the recipe =
will be removed on 2017-09-01 unless the issue is fixed"
meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb:PNBLACKLIST[mkvtoo=
lnix] ?=3D "BROKEN: Failx to build with gcc-5 - the recipe will be removed =
on 2017-09-01 unless the issue is fixed"
meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:PNBLACKLIST=
[coriander] ?=3D "BROKEN: fails to use SDL probably because libsdl-config w=
as removed, error: unknown type name 'SDL_Overlay' - the recipe will be rem=
oved on 2017-09-01 unless the issue is fixed"
meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb:PN=
BLACKLIST[renderer-service-upnp] ?=3D "BROKEN: doesn't build with B!=3DS (t=
rying to install rendererconsole.py from ${B} instead of ${S}) - the recipe=
 will be removed on 2017-09-01 unless the issue is fixed"
meta-multimedia"
meta-networking/recipes-kernel/netmap/netmap_git.bb:PNBLACKLIST[netmap] ?=
=3D "BROKEN: Tries to build kernel module and fails, either it should be di=
sabled or there should be dependency on kernel like in netmap-modules - the=
 recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb:PNBLACKLIST[ac=
cel-ppp] ?=3D "BROKEN: fails to build with new binutils-2.27 - the recipe w=
ill be removed on 2017-09-01 unless the issue is fixed"
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACK=
LIST[lksctp-tools] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gol=
d', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
meta-networking/recipes-support/nis/ypbind-mt_2.2.bb:PNBLACKLIST[ypbind-mt]=
 ?=3D "BROKEN: Depends on broken yp-tools - the recipe will be removed on 2=
017-09-01 unless the issue is fixed"
meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_6.6.1.bb:=
PNBLACKLIST[phoronix-test-suite] ?=3D "Runtime depends on blacklisted php-c=
li - the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-benchmark/pmbw/pmbw_git.bb:PNBLACKLIST[pmbw] ?=3D "Fails to=
 build with RSS http://errors.yoctoproject.org/Errors/Details/130568/ - the=
 recipe will be removed on 2017-09-01 unless the issue is fixed"
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
meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb:PNBLACKLIST[gnokii] ?=
=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/=
130662/ - the recipe will be removed on 2017-09-01 unless the issue is fixe=
d"
meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?=3D =
"BROKEN: depends on broken libftdi - the recipe will be removed on 2017-09-=
01 unless the issue is fixed"
meta-oe/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb:PNBLACKLIST[li=
btelepathy] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Er=
rors/Details/130609/ - the recipe will be removed on 2017-09-01 unless the =
issue is fixed"
meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.16.1.bb:=
PNBLACKLIST[telepathy-mission-control] ?=3D "Depends on blacklisted libtele=
pathy - the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb:PNBLACKLIST[wvdial] ?=3D=
 "Depends on broken wvstreams - the recipe will be removed on 2017-09-01 un=
less the issue is fixed"
meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb:PNBLACKLIST[wvstream=
s] ?=3D "BROKEN: fails to build with gcc-6 - the recipe will be removed on =
2017-09-01 unless the issue is fixed"
meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zeroc=
-ice] ?=3D "BROKEN: not compatible with default db version - the recipe wil=
l be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb:PNBLACKLIST[dbus-daemon-=
proxy] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/=
Details/130613/ - td9] ?=3D "Not comatible with current nodejs 0.12, but up=
stream is working on it for v3 - the recipe will be removed on 2017-09-01 u=
nless the issue is fixed"
meta-oe/recipes-devtools/dt/dt_18.32.bb:PNBLACKLIST[dt] ?=3D "Rdepends on b=
lacklisted tcsh - the recipe will be removed on 2017-09-01 unless the issue=
 is fixed"
meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb:PNBLACKLIST[ltp-ddt] ?=3D=
 "BROKEN: fails since last autotools.bbclass changes - the recipe will be r=
emoved on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb:PNBLACKLIST[package=
kit] ?=3D "BROKEN: depends on old deprecated libopkg which is currently dis=
abled and will be removed soon - the recipe will be removed on 2017-09-01 u=
nless the issue is fixed"
meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.=
0.bb:PNBLACKLIST[vala-dbus-binding-tool] ?=3D "Fails to build with RSS http=
://errors.yoctoproject.org/Errors/Details/131628/ - the recipe will be remo=
ved on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.=
bb:PNBLACKLIST[vala-dbus-binding-tool] ?=3D "Fails to build with RSS http:/=
/errors.yoctoproject.org/Errors/Details/130581/ - the recipe will be remove=
d on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-extended/openlmi/openlmi-networking_0.3.1.bb:PNBLACKLIST[op=
enlmi-networking] ?=3D "Depends on blacklisted openlmi-providers - the reci=
pe will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-extended/openlmi/openlmi-providers_0.6.0.bb:PNBLACKLIST[ope=
nlmi-providers] ?=3D "Depends on blacklisted lmsensors - the recipe will be=
 removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-extended/openlmi/openlmi-storage_0.8.1.bb:PNBLACKLIST[openl=
mi-storage] ?=3D "Depends on blacklisted pywbem - the recipe will be remove=
d on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurfac=
e] ?=3D "Needs to be upgraded for compatibility with new libdivecomputer - =
the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb:PNBLACKLIST[gtkextra] ?=3D=
 "BROKEN: Fails to build with gcc-5 - the recipe will be removed on 2017-09=
-01 unless the issue is fixed"
meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb:PNBLACKLIST[gtkhtml2] ?=3D "=
Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/13063=
3/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-b=
ox2d] ?=3D "BROKEN: doesn't build with B!=3DS - the recipe will be removed =
on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-graphics/fbida/fbida_2.10.bb:PNBLACKLIST[fbida] ?=3D "Fails=
 to build with RSS http://errors.yoctoproject.org/Errors/Details/130677/ - =
the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?=3D "BROKEN: =
doesn't build with B!=3DS (flex: can't open lex.lex) - the recipe will be r=
emoved on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb:PNBLACKLIST[libsexy] ?=
=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/=
130607/ - the recipe will be removed on 2017-09-01 unless the issue is fixe=
d"
meta-oe/recipes-graphics/slim/slim_1.3.2.bb:PNBLACKLIST[slim] ?=3D "does no=
t build with distroless qemuarm as reported in 'State of bitbake world' thr=
ead, nobody volunteered to fix them - the recipe will be removed on 2017-09=
-01 unless the issue is fixed"
mete-100dpi - the recipe will be removed on 2017-09-01 unless the issue is =
fixed"
meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb:PNBLACKLIST[xorg-fo=
nts-100dpi] ?=3D "Runtime depends on blacklisted xorg-fonts-100dpi - the re=
cipe will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb:PNBLACKLIST[xorg-fo=
nts-100dpi] ?=3D "Runtime depends on blacklisted font-bh-100dpi - the recip=
e will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb:PNBLACKLIST[xorg-fo=
nts-100dpi] ?=3D "Runtime depends on blacklisted font-adobe-utopia-100dpi -=
 the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb:PNBLACKLIST[xorg-fo=
nts-100dpi] ?=3D "Runtime depends on blacklisted font-bh-lucidatypewriter-1=
00dpi - the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-kernel/ktap/ktap-module_git.bb:PNBLACKLIST[ktap-module] ?=
=3D "Not compatible with 3.19 kernel - the recipe will be removed on 2017-0=
9-01 unless the issue is fixed"
meta-oe/recipes-kernel/ktap/ktap_git.bb:PNBLACKLIST[ktap] ?=3D "Depends on =
blacklisted kernel-module-ktapvm - the recipe will be removed on 2017-09-01=
 unless the issue is fixed"
meta-oe/recipes-multimedia/minidlna/minidlna_1.1.5.bb:PNBLACKLIST[minidlna]=
 ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/Detail=
s/130630/ - the recipe will be removed on 2017-09-01 unless the issue is fi=
xed"
meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb:PNBLACKLIST[mplayer2] ?=
=3D "Not compatible with currently used ffmpeg 3 - the recipe will be remov=
ed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtr=
otgps] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conf=
licts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb:PNBLACKLIST[gdal] ?=3D "BROK=
EN: fails to build with gcc-5 - the recipe will be removed on 2017-09-01 un=
less the issue is fixed"
meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=3D "${@bb.u=
tils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 an=
d bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=3D "${@bb.u=
tils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 an=
d bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb:PNBLACKLIST[claws-mail]=
 ?=3D "depends on blacklisted libetpan - the recipe will be removed on 2017=
-09-01 unless the issue is fixed"
meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb:PNBLAC=
KLIST[claws-plugin-gtkhtml2-viewer] ?=3D "depends on blacklisted claws-mail=
 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb:PNBLACKLIST[c=
laws-plugin-mailmbox] ?=3D "depends on blacklisted claws-mail - the recipe =
will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb:PNBLACKLIST[claw=
s-plugin-rssyl] ?=3D "depends on blacklisted claws-mail - the recipe will b=
e removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb:PNBLACKLIST[sylpheed] ?=
=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/=
130651/ - the recipe will be removed on 2017-09-01 unless the issue is fixe=
d"
meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLon 2017-09-01 unless=
 the issue is fixed"
meta-oe/recipes-support/libetpan/libetpan_0.57.bb:PNBLACKLIST[libetpan] ?=
=3D "Not compatible with gnutls version 3.4 currently in oe-core - the reci=
pe will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-support/ode/ode_0.13.bb:PNBLACKLIST[ode] ?=3D "Fails to bui=
ld with RSS http://errors.yoctoproject.org/Errors/Details/130599/ - the rec=
ipe will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-support/ode/ode_0.13.bb:PNBLACKLIST[ode] ?=3D "Fails to bui=
ld with RSS http://errors.yoctoproject.org/Errors/Details/130620/ - the rec=
ipe will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.4.bb:PNBLACKLIST[open-v=
cdiff] ?=3D "BROKEN: fails to build with gcc-6 - the recipe will be removed=
 on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-support/opencv/opencv-samples_2.4.bb:PNBLACKLIST[opencv-sam=
ples] ?=3D "Depends on blacklisted opencv - the recipe will be removed on 2=
017-09-01 unless the issue is fixed"
meta-oe/recipes-support/opencv/opencv_2.4.bb:PNBLACKLIST[opencv] ?=3D "Not =
compatible with currently used ffmpeg 3 - the recipe will be removed on 201=
7-09-01 unless the issue is fixed"
meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmotif]=
 ?=3D "BROKEN: doesn't build with B!=3DS - the recipe will be removed on 20=
17-09-01 unless the issue is fixed"
meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml] =
?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts w=
ith bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb:PNBLACKLIST[openwbem] ?=
=3D "BROKEN: fails to build with gcc-6 - the recipe will be removed on 2017=
-09-01 unless the issue is fixed"
meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb:PNBLACKLIST[pidgin-otr] =
?=3D "depends on blacklisted pidgin - the recipe will be removed on 2017-09=
-01 unless the issue is fixed"
meta-oe/recipes-support/psqlodbc/psqlodbc_09.05.0300.bb:PNBLACKLIST[psqlodb=
c] ?=3D "Depends on blacklisted postgresql - the recipe will be removed on =
2017-09-01 unless the issue is fixed"
meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.b=
b:PNBLACKLIST[system-setup-keyboard] ?=3D "Depends on blacklisted system-co=
nfig-keyboard-native - the recipe will be removed on 2017-09-01 unless the =
issue is fixed"
meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala=
-terminal] ?=3D "BROKEN: Doesn't work with B!=3DS, touch: cannot touch `src=
/.stamp': No such file or directory - the recipe will be removed on 2017-09=
-01 unless the issue is fixed"
meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.36.bb:PNBLACK=
LIST[vboxguestdrivers] ?=3D "BROKEN: not compatible with default kernel ver=
sion 4.8 - the recipe will be removed on 2017-09-01 unless the issue is fix=
ed"
meta-oe/recipes-support/xchat/xchat_2.8.8.bb:PNBLACKLIST[xchat] ?=3D "Depen=
ds on blacklisted libsexy - the recipe will be removed on 2017-09-01 unless=
 the issue is fixed"
meta-ruby/recipes-devtools/ruby/bundler_git.bb:PNBLACKLIST[bundler] ?=3D "F=
ails to build with RSS http://errors.yoctoproject.org/Errors/Details/130640=
/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-qt5:
meta-smartphone:
meta-fso/recipes-freesmartphone/cornucopia/fso-apm_git.bb:PNBLACKLIST[fso-a=
pm] ?=3D "Depends on blacklisted libfso-glib - the recipe will be removed o=
n 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/cornucopia/fsoaudiod_0.12.0.bb:PNBLACKLIST[=
fsoaudiod] ?=3D "Depends oopia/fsonetworkd_git.bb:PNBLACKLIST[fsonetworkd] =
?=3D "Depends on blacklisted libfso-glib - the recipe will be removed on 20=
17-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/cornucopia/fsoraw_git.bb:PNBLACKLIST[fsoraw=
] ?=3D "Depends on blacklisted libfso-glib - the recipe will be removed on =
2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/cornucopia/fsotdld_0.12.0.bb:PNBLACKLIST[fs=
otdld] ?=3D "Depends on blacklisted libfso-glib - the recipe will be remove=
d on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/cornucopia/fsotdld_git.bb:PNBLACKLIST[fsotd=
ld] ?=3D "Depends on blacklisted libfso-glib - the recipe will be removed o=
n 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/cornucopia/fsousaged_0.12.0.bb:PNBLACKLIST[=
fsousaged] ?=3D "Depends on blacklisted libfso-glib - the recipe will be re=
moved on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/cornucopia/fsousaged_git.bb:PNBLACKLIST[fso=
usaged] ?=3D "Depends on blacklisted libfso-glib - the recipe will be remov=
ed on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/cornucopia/libfsoframework_0.12.0.bb:PNBLAC=
KLIST[libfsoframework] ?=3D "Depends on blacklisted libfso-glib - the recip=
e will be removed on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/cornucopia/libfsoframework_git.bb:PNBLACKLI=
ST[libfsoframework] ?=3D "Depends on blacklisted libfso-glib - the recipe w=
ill be removed on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/cornucopia/mkdump_git.bb:PNBLACKLIST[mkdump=
] ?=3D "Depends on blacklisted libfsoframework - the recipe will be removed=
 on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/cornucopia/mterm2_git.bb:PNBLACKLIST[mterm2=
] ?=3D "Depends on blacklisted libfsoframework - the recipe will be removed=
 on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/freesmartphone/frameworkd_0.10.1.bb:PNBLACK=
LIST[frameworkd] ?=3D "Runtime depends on blacklisted fsousaged - the recip=
e will be removed on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/freesmartphone/frameworkd_git.bb:PNBLACKLIS=
T[frameworkd] ?=3D "Runtime depends on blacklisted fsousaged - the recipe w=
ill be removed on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/freesmartphone/frameworkd_git.bb:PNBLACKLIS=
T[frameworkd] ?=3D "Runtime depends on blacklisted frameworkd-dev - the rec=
ipe will be removed on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/freesmartphone/fso-gpsd_git.bb:PNBLACKLIST[=
fso-gpsd] ?=3D "Runtime depends on blacklisted fso-gpsd-dev - the recipe wi=
ll be removed on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/freesmartphone/fso-gsm0710muxd_git.bb:PNBLA=
CKLIST[fso-gsm0710muxd] ?=3D "Fails to build with RSS http://errors.yoctopr=
oject.org/Errors/Details/130517/ - the recipe will be removed on 2017-09-01=
 unless the issue is fixed"
meta-fso/recipes-freesmartphone/freesmartphone/illume-theme-freesmartphone_=
git.bb:PNBLACKLIST[illume-theme-freesmartphone] ?=3D "Depends on blackliste=
d edje-native - the recipe will be removed on 2017-09-01 unless the issue i=
s fixed"
meta-fso/recipes-freesmartphone/freesmartphone/illume-theme-freesmartphone_=
git.bb:PNBLACKLIST[illume-theme-freesmartphone] ?=3D "Depends on blackliste=
d eet-native - the recipe will be removed on 2017-09-01 unless the issue is=
 fixed"
meta-fso/recipes-freesmartphone/freesmartphone/illume-theme-freesmartphone_=
git.bb:PNBLACKLIST[illume-theme-freesmartphone] ?=3D "Runtime depends on on=
-pycairo which was removed - the recipe will be removed on 2017-09-01 unles=
s the issue is fixed"
meta-fso/recipes-freesmartphone/packagegroups/packagegroup-fso2-compliance.=
bb:PNBLACKLIST[packagegroup-fso2-compliance] ?=3D "Runtime depends on black=
listed fsoaudiod-config - the recipe will be removed on 2017-09-01 unless t=
he issue is fixed"
meta-fso/recipes-freesmartphone/packagegroups/packagegroup-fso2-compliance.=
bb:PNBLACKLIST[packagegroup-fso2-compliance] ?=3D "Runtime depends on black=
listed mkdump - the recipe will be removed on 2017-09-01 unless the issue i=
s fixed"
meta-fso/recipes-freesmartphone/packagegroups/packagegroup-fso2-compliance.=
bb:PNBLACKLIST[packagegroup-fso2-compliance] ?=3D "Runtime depends on black=
listed fsonetworkd - the recipe will be removed on 2017-09-01 unless the is=
sue is fixed"
meta-fso/recipes-freesmartphone/packagegroups/packagegroup-fso2-compliance.=
bb:PNBLACKLIST[packagegroup-fso2-compliance] ?=3D "Runtime depends on black=
listed fso-apm - the recipe will be removed on 2017-09-01 unless the issue =
is fixed"
meta-fso/recipes-freesmartphone/packagegroups/packagegroup-fso2-compliance.=
bb:PNBLACKLIST[packagegroup-fso2-compliance] ?=3D "Runtime depends on black=
listed fsodatad - the recipe will be removed on 2017-09-01 unless the issue=
 is fixed"
meta-fso/recipes-freesmartphone/packagegroups/packagegroup-fso2-compliance.=
bb:PNBLACKLIST[packagegroup-fso2-compliance] ?=3D "Runtime depends on black=
listed packagegroup-fso2-compliance - the recipe will be removed on 2017-09=
-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/packagegroups/packagegroup-fso2-compliance.=
bb:PNBLACKLIST[packagegroup-fso2-compliance] ?=3D "Runtime depends on black=
listed fsogsmd - the recipe will be removed on 2017-09-01 unless the issue =
is fixed"
meta-fso/recipes-freesmartphone/packagegroups/packagegroup-fso2-compliance.=
bb:PNBLACKLIST[packagegroup-fso2-compliance] ?=3D "Runtime depends on black=
listed mterm2 - the recipe will be removed on 2017-09-01 unless the issue i=
s fixed"
meta-fso/recipes-freesmartphone/packagegroups/packagegroup-fso2-compliance.=
bb:PNBLACKLIST[packagegroup-fso2-compliance] ?=3D "Runtime depends on black=
listed fsodeviced - the recipe will be removed on 2017-09-01 unless the iss=
ue is fixed"
meta-fso/recipes-freesmartphone/packagegroups/packagegroup-fso2-compliance.=
bb:PNBLACKLIST[packagegroup-fso2-compliance] ?=3D "Runtime depends on black=
listed fsotdld - the recipe will be removed on 2017-09-01 unless the issue =
is fixed"
meta-fso/recipes-freesmartphone/packagegroups/packagegroup-fso2-compliance.=
bb:PNBLACKLIST[packagegroup-fso2-compliance] ?=3D "Runtime depends on black=
listed fsousaged - the recipe will be removed on 2017-09-01 unless the issu=
e is fixed"
meta-shr/recipes-shr/3rdparty/advancedcaching_git.bb:PNBLACKLIST[advancedca=
ching] ?=3D "RDEPENDS on python-pygtk was removed from oe-core - the recipe=
 will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/atd-over-fso_0.70.bb:PNBLACKLIST[atd-over-fso=
] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/Detai=
ls/130540/ - the recipe will be removed on 2017-09-01 unless the issue is f=
ixed"
meta-shr/recipes-shr/3rdparty/atrack_svn.bb:PNBLACKLIST[atrack] ?=3D "Runti=
me depends on blacklisted python-elementary - the recipe will be removed on=
 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/babiloo-efl_2.0.9-10.bb:PNBLACKLIST[babiloo-e=
fl] ?=3D "Runtime depends on blacklisted python-elementary - the recipe wil=
l be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/babiloo-efl_bzr.bb:PNBLACKLISTrecipe will be =
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/guitartune_svn.bb:PNBLACKLIST[guitartune] ?=
=3D "Depends on blacklisted libglade - the recipe will be removed on 2017-0=
9-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/gwaterpas_0.3.bb:PNBLACKLIST[gwaterpas] ?=3D =
"broken: depends on blacklisted fltk - the recipe will be removed on 2017-0=
9-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] =3D "Doesn't =
build after vala upgrade from 0.24.0 to 0.26.1 - the recipe will be removed=
 on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] =3D "rdepen=
ds on blacklisted mplayer2 - the recipe will be removed on 2017-09-01 unles=
s the issue is fixed"
meta-shr/recipes-shr/3rdparty/jefliks_git.bb:PNBLACKLIST[jefliks] ?=3D "dep=
ends on blacklisted iksemel - the recipe will be removed on 2017-09-01 unle=
ss the issue is fixed"
meta-shr/recipes-shr/3rdparty/minneo_svn.bb:PNBLACKLIST[minneo] ?=3D "Runti=
me depends on blacklisted python-elementary - the recipe will be removed on=
 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/mokojeweled_git.bb:PNBLACKLIST[mokojeweled] ?=
=3D "Depends on blacklisted elementary - the recipe will be removed on 2017=
-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/neolight_svn.bb:PNBLACKLIST[neolight] ?=3D "R=
untime depends on blacklisted python-edbus - the recipe will be removed on =
2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/neolight_svn.bb:PNBLACKLIST[neolight] ?=3D "R=
untime depends on blacklisted python-elementary - the recipe will be remove=
d on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/neomis_svn.bb:PNBLACKLIST[neomis] ?=3D "Runti=
me depends on blacklisted python-elementary - the recipe will be removed on=
 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/numberx_svn.bb:PNBLACKLIST[numberx] ?=3D "Run=
time depends on blacklisted python-elementary - the recipe will be removed =
on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/om-neon_svn.bb:PNBLACKLIST[om-neon] ?=3D "Run=
time depends on blacklisted python-evas - the recipe will be removed on 201=
7-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/om-neon_svn.bb:PNBLACKLIST[om-neon] ?=3D "Run=
time depends on blacklisted om-neon-dev - the recipe will be removed on 201=
7-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/om-neon_svn.bb:PNBLACKLIST[om-neon] ?=3D "Run=
time depends on blacklisted python-edje - the recipe will be removed on 201=
7-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/om-neon_svn.bb:PNBLACKLIST[om-neon] ?=3D "Run=
time depends on blacklisted python-ecore - the recipe will be removed on 20=
17-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/om-neon_svn.bb:PNBLACKLIST[om-neon] ?=3D "Run=
time depends on blacklisted om-neon - the recipe will be removed on 2017-09=
-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/omext_0.2.bb:PNBLACKLIST[omext] ?=3D "Fails t=
o build with RSS http://errors.yoctoproject.org/Errors/Details/130539/ - th=
e recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/openmoko-gps_svn.bb:PNBLACKLIST[openmoko-gps]=
 ?=3D "RDEPENDS on python-pygtk which was removed from oe-core - the recipe=
 will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/pisi_0.5.3.bb:PNBLACKLIST[pisi] ?=3D "RDEPEND=
S on python-pygtk which was removed from oe-core - the recipe will be remov=
ed on 2017-09-01 unless the isue is fixed"
meta-shr/recipes-shr/games/mokoeightball_svn.bb:PNBLACKLIST[mokoeightball] =
?=3D "Runtime depends on blacklisted mokoeightball - the recipe will be rem=
oved on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/games/mokomaze_0.5.5.bb:PNBLACKLIST[mokomaze] ?=3D "De=
pends on blacklisted libsdl-ttf - the recipe will be removed on 2017-09-01 =
unless the issue is fixed"
meta-shr/recipes-shr/games/mokomaze_0.5.5.bb:PNBLACKLIST[mokomaze] ?=3D "De=
pends on blacklisted ode - the recipe will be removed on 2017-09-01 unless =
the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D "Runtime depends on blacklisted mokomaze - the rec=
ipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D "Runtime depends on blacklisted dates - the recipe=
 will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D "Runtime depends on blacklisted dbus-daemon-proxy =
- the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D "Runtime depends on blacklisted guitartune - the r=
ecipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D "Runtime depends on blacklisted illume-keyboard-de=
fault-numeric - the recipe will be removed on 2017-09-01 unless the issue i=
s fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D "Runtime depends on blacklisted e-tasks - the reci=
pe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D "Runtime depends on blacklisted enjoy - the recipe=
 will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D "Runtime depends on blacklisted mokojeweled - the =
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D "Runtime depends on blacklisted estardict - the re=
cipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D "Runtime depends on blacklisted gpe-scap - the rec=
ipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D "Runtime depends on blacklisted ffphonelog - the r=
ecipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D "Runtime depends on blacklisted om-neon - the reci=
pe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D "Runtime depends on blacklisted python-elementary =
- the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D "Runtime depends on blacklisted elfe - the recipe =
will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLISess t=
he issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr.bb:PNBLACKLIST[packageg=
roup-shr] ?=3D "Runtime depends on blacklisted packagegroup-shr-minimal-cli=
 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr.bb:PNBLACKLIST[packageg=
roup-shr] ?=3D "Runtime depends on blacklisted packagegroup-cli-tools - the=
 recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr.bb:PNBLACKLIST[packageg=
roup-shr] ?=3D "Runtime depends on blacklisted packagegroup-shr-minimal-app=
s - the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr.bb:PNBLACKLIST[packageg=
roup-shr] ?=3D "Runtime depends on blacklisted vagalume - the recipe will b=
e removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/shr/e-wm-config-illume2-shr_git.bb:PNBLACKLIST[e-wm-co=
nfig-illume2-shr] ?=3D "Fails to build with RSS http://errors.yoctoproject.=
org/Errors/Details/130520/ - the recipe will be removed on 2017-09-01 unles=
s the issue is fixed"
meta-shr/recipes-shr/shr/libphone-ui-shr_git.bb:PNBLACKLIST[libphone-ui-shr=
] ?=3D "Depends on blacklisted elementary - the recipe will be removed on 2=
017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/shr/libphone-ui_git.bb:PNBLACKLIST[libphone-ui] ?=3D "=
Depends on blacklisted libfso-glib - the recipe will be removed on 2017-09-=
01 unless the issue is fixed"
meta-shr/recipes-shr/shr/phonefsod_git.bb:PNBLACKLIST[phonefsod] ?=3D "Depe=
nds on blacklisted libfso-glib - the recipe will be removed on 2017-09-01 u=
nless the issue is fixed"
meta-shr/recipes-shr/shr/phoneuid_git.bb:PNBLACKLIST[phoneuid] ?=3D "Depend=
s on blacklisted libfso-glib - the recipe will be removed on 2017-09-01 unl=
ess the issue is fixed"
meta-shr/recipes-shr/shr/shr-e-gadgets_git.bb:PNBLACKLIST[shr-e-gadgets] ?=
=3D "Depends on blacklisted elementary - the recipe will be removed on 2017=
-09-01 unless the issue is fixed"
meta-shr/recipes-shr/shr/shr-installer_git.bb:PNBLACKLIST[shr-installer] ?=
=3D "Depends on blacklisted packagekit - the recipe will be removed on 2017=
-09-01 unless the issue is fixed"
meta-shr/recipes-shr/shr/shr-settings_git.bb:PNBLACKLIST[shr-settings] ?=3D=
 "Runtime depends on blacklisted python-edbus - the recipe will be removed =
on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/shr/shr-settings_git.bb:PNBLACKLIST[shr-settings] ?=3D=
 "Runtime depends on blacklisted python-elementary - the recipe will be rem=
oved on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/shr/shr-wizard_git.bb:PNBLACKLIST[shr-wizard] ?=3D "De=
pends on blacklisted e-wm - the recipe will be removed on 2017-09-01 unless=
 the issue is fixed"
meta-shr/recipes-shr/themes/e-wm-theme-illume-gry_git.bb:PNBLACKLIST[e-wm-t=
heme-illume-gry] ?=3D "Depends on blacklisted edje-native - the recipe will=
 be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/e-wm-theme-illume-gry_git.bb:PNBLACKLIST[e-wm-t=
heme-illume-gry] ?=3D "Runtime depends on blacklisted e-wm-theme-illume-gry=
 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/e-wm-theme-illume-gry_git.bb:PNBLACKLIST[e-wm-t=
heme-illume-gry] ?=3D "Runtime depends on blacklisted e-wm-theme-illume-gry=
-dev - the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/e-wm-theme-illume-gry_git.bb:PNBLACKLIST[e-wm-t=
heme-illume-gry] ?=3D "Runtime depends on blacklisted elementary-theme-gry =
- the recipe will be removed on 2017-09-01 unless shr-dev - the recipe will=
 be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/e-wm-theme-illume-shr_git.bb:PNBLACKLIST[e-wm-t=
heme-illume-shr] ?=3D "Runtime depends on blacklisted e-wm-theme-illume-shr=
 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/e-wm-theme-illume-sixteen_git.bb:PNBLACKLIST[e-=
wm-theme-illume-sixteen] ?=3D "Depends on blacklisted edje-native - the rec=
ipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/e-wm-theme-illume-sixteen_git.bb:PNBLACKLIST[e-=
wm-theme-illume-sixteen] ?=3D "Runtime depends on blacklisted e-wm-theme-il=
lume-sixteen - the recipe will be removed on 2017-09-01 unless the issue is=
 fixed"
meta-shr/recipes-shr/themes/e-wm-theme-illume-sixteen_git.bb:PNBLACKLIST[e-=
wm-theme-illume-sixteen] ?=3D "Runtime depends on blacklisted e-wm-theme-il=
lume-sixteen-dev - the recipe will be removed on 2017-09-01 unless the issu=
e is fixed"
meta-shr/recipes-shr/themes/e-wm-theme-sowka_git.bb:PNBLACKLIST[e-wm-theme-=
sowka] ?=3D "Depends on blacklisted edje-native - the recipe will be remove=
d on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/e-wm-theme-sowka_git.bb:PNBLACKLIST[e-wm-theme-=
sowka] ?=3D "Runtime depends on blacklisted e-wm-theme-sowka-dev - the reci=
pe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/e-wm-theme-sowka_git.bb:PNBLACKLIST[e-wm-theme-=
sowka] ?=3D "Runtime depends on blacklisted e-wm-theme-sowka - the recipe w=
ill be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/elementary-theme-gry_git.bb:PNBLACKLIST[element=
ary-theme-gry] ?=3D "Depends on blacklisted edje-native - the recipe will b=
e removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/elementary-theme-gry_git.bb:PNBLACKLIST[element=
ary-theme-gry] ?=3D "Runtime depends on blacklisted elementary-theme-gry-de=
v - the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/elementary-theme-gry_git.bb:PNBLACKLIST[element=
ary-theme-gry] ?=3D "Runtime depends on blacklisted e-wm-theme-illume-gry -=
 the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/elementary-theme-gry_git.bb:PNBLACKLIST[element=
ary-theme-gry] ?=3D "Runtime depends on blacklisted elementary-theme-gry - =
the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/elementary-theme-neo_git.bb:PNBLACKLIST[element=
ary-theme-neo] ?=3D "Depends on blacklisted edje-native - the recipe will b=
e removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/elementary-theme-neo_git.bb:PNBLACKLIST[element=
ary-theme-neo] ?=3D "Runtime depends on blacklisted elementary-theme-neo - =
the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/elementary-theme-neo_git.bb:PNBLACKLIST[element=
ary-theme-neo] ?=3D "Runtime depends on blacklisted elementary-theme-neo-de=
v - the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/elementary-theme-niebiee_git.bb:PNBLACKLIST[ele=
mentary-theme-niebiee] ?=3D "Depends on blacklisted edje-native - the recip=
e will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/elementary-theme-niebiee_git.bb:PNBLACKLIST[ele=
mentary-theme-niebiee] ?=3D "Runtime depends on blacklisted elementary-them=
e-niebiee - the recipe will be removed on 2017-09-01 unless the issue is fi=
xed"
meta-shr/recipes-shr/themes/elementary-theme-niebiee_git.bb:PNBLACKLIST[ele=
mentary-themends on blacklisted elementary-theme-sowka-dev - the recipe wil=
l be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/elementary-theme-sowka_git.bb:PNBLACKLIST[eleme=
ntary-theme-sowka] ?=3D "Runtime depends on blacklisted elementary-theme-so=
wka - the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/gtk-theme-clearlooks-gtkrc.bb:PNBLACKLIST[gtk-t=
heme-clearlooks-gtkrc] ?=3D "Runtime depends on blacklisted gtk-theme-clear=
looks - the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/gtk-theme-clearlooks-gtkrc.bb:PNBLACKLIST[gtk-t=
heme-clearlooks-gtkrc] ?=3D "Runtime depends on blacklisted gtk-theme-clear=
looks-gtkrc-dev - the recipe will be removed on 2017-09-01 unless the issue=
 is fixed"
meta-shr/recipes-shr/themes/icon-theme-neo_git.bb:PNBLACKLIST[icon-theme-ne=
o] ?=3D "Runtime depends on blacklisted e-wm - the recipe will be removed o=
n 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/icon-theme-neo_git.bb:PNBLACKLIST[icon-theme-ne=
o] ?=3D "Runtime depends on blacklisted icon-theme-neo-dev - the recipe wil=
l be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/phoneui-shr-theme-neo_git.bb:PNBLACKLIST[phoneu=
i-shr-theme-neo] ?=3D "Runtime depends on blacklisted libphone-ui-shr - the=
 recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/phoneui-shr-theme-neo_git.bb:PNBLACKLIST[phoneu=
i-shr-theme-neo] ?=3D "Runtime depends on blacklisted phoneui-shr-theme-neo=
-dev - the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/phoneui-shr-theme-niebiee_git.bb:PNBLACKLIST[ph=
oneui-shr-theme-niebiee] ?=3D "Runtime depends on blacklisted libphone-ui-s=
hr - the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/phoneui-shr-theme-o2_git.bb:PNBLACKLIST[phoneui=
-shr-theme-o2] ?=3D "Runtime depends on blacklisted libphone-ui-shr - the r=
ecipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/phoneui-shr-theme-sowka_git.bb:PNBLACKLIST[phon=
eui-shr-theme-sowka] ?=3D "Runtime depends on blacklisted libphone-ui-shr -=
 the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/shr-theme-efenniht.bb:PNBLACKLIST[shr-theme-efe=
nniht] ?=3D "Runtime depends on blacklisted e-wm-theme-illume-efenniht - th=
e recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/shr-theme-gry.bb:PNBLACKLIST[shr-theme-gry] ?=
=3D "Runtime depends on blacklisted e-wm-theme-illume-gry - the recipe will=
 be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/shr-theme-gry.bb:PNBLACKLIST[shr-theme-gry] ?=
=3D "Runtime depends on blacklisted elementary-theme-gry - the recipe will =
be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/shr-theme-neo.bb:PNBLACKLIST[shr-theme-neo] ?=
=3D "Runtime depends on blacklisted shr-theme-neo-dev - the recipe will be =
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/shr-theme-neo.bb:PNBLACKLIST[shr-theme-neo] ?=
=3D "Runtime depends on blacklisted shr-theme-neo - the recipe will be remo=
ved on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/shr-theme-neo.bb:PNBLACKLIST[shr-theme-neo] ?=
=3D "Runtime depends on blacklisted e-wm-theme-illume-neo - the recipe will=
 be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/shr-theme-niebiee.bb:PNBLACKLIST[shr-theme-nieb=
iee] ?=3D "Runtime depends on blacklisted p9-01 unless the issue is fixed"
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


count: 0	issue: textrel


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 0	issue: version-going-backwards


count: 0	issue: host-user-contaminated


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
21d9631 toaster: move release lookup from morty to pyro
not included in master yet:=20
c4b1613 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
e584be7 build-appliance-image: Update to master head revision
not included in master yet:=20
67114ad qemux86: Add identical qemux86copy variant for tests
63e9e9d sstate-sysroot-cruft.sh: Extend the whitelist
fe744e8 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
1b4ca51 buildhistory.bbclass: metadata-revs show repo parent
0b100a7 metadata-revs: provide more information
ef84c55 report-error: Allow to upload reports automatically
a43df23 Revert "mesa: Contain configure search for llvm"
d559619 sstate-diff-machines.sh: Replace MACHINE_ARCH only at the beginning=
 and separated with dash
fe46c11 kernel-yocto/kern-tools: fix do_validate_branches clean stage

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
50c15c5 autofs: Upgrade to 5.1.2 release
not included in master yet:=20
09afed5 dnsmasq: disable the service by default
74d70f8 postfix: do NOT create directory /var/spool/mail
be11747 waf-samba.bbclass: redefine WAF_CROSS_ANSWERS_PATH
69c4420 wireguard: add WireGuard kernel module and tools
1d4a476 strongswan: Split plugins
50f6d9d multipath-tools: don't blindly assume base_sbindir to be /sbin.
07ce1b3 python-ply: add new recipe
dcaf4ca python-pysmi: add new recipe
76fb01a python-pysnmp: add new recipe
ad784a3 python-snimpy: add new recipe
e1cd4e8 python3-setuptools-scm: make version available for both Python 2 & 3
122731c python3-pytest-runner: make available for both Python 2 & 3
a263bc7 jack2: Fix build errors found with gcc7
b29b1af lirc: update to 0.9.4d
f882600 ltrace: Fix FTBFS due to invalid code in ARM support
ed508a8 msgpack-c: Upgrade to 2.1.1
0987126 fluentbit: Upgrade to 0.11.3 release
9dcf563 collectd: Upgrade to 5.7.1
c1aeba1 libsigc++: Disable PIE in SECURITY_FLAGS
7a21040 glibmm: Upgrade to 2.50.1
61ed890 glcompbench: Fix build with gcc7
2d585df mariadb: Upgrade to 5.5.55
6db36f5 efivar: Fix multiple definition of `efi_set_variable'
eda136e krb5: 1.13.6 -> 1.15.1
8709d45 lvm2: separate libdevmapper to avoid circular dependency
aaf8bfb cryptsetup: DEPENDS on libdevmapper instead of lvm2
cac954f multipath-tools: depend on libdevmapper instead of lvm2
75e2a37 nodejs: update to 4.8.2
9ca8f79 python-chardet, python3-chardet: update to 3.0.2
c405288 python-sqlalchemy, python3-sqlalchemy: update to 1.1.9
4d18d0c python-pytz, python3-pytz: update to 2017.2
a8b3edd ntfs-3g-ntfsprogs: fix install failed while host dir not exist
327b84b musicbrainz: Upgrade to 5.1.0
6884b50 libmusicbrainz: Add missing dep on libxml2
7420f53 mpv: Add libxkbcommon when configuring with wayland
36e3e89 msgpack-c: Drop unused patch
56bdb63 python-unidiff: Upgrade to 0.5.3
fdd177b efivar: Backport patches to remove double const decls
4525ec0 efibootmgr: Fix build with gcc 7
1890ca1 mozjs: Fix build with gcc7
4a92f05 geis: Fix build with gcc7
baea31f frame,grail: Disable PIE in SECURITY_FLAGS
ea65e57 mozjs: prevent target CFLAGS etc being passed to the host
b724f0c opensaf: Upgrade to 5.2.0
3de4543 libedit: 20160903-3.1 -> 20170329-3.1
e539f78 hostapd: 2.5 -> 2.6
5709aa0 kodi: Make it build again and upgrade to 17.1
4ef230b openhpi: add new recipe
676df07 freeradius: add new recipe
01ddb56 libnet-ldap-perl: add new recipe
a84d440 libdata-hexdump-perl: add new recipe
d08176a libnet-telnet-perl: add new recipe
baaff05 libauthen-radius-perl: add new recipe
fbf1f5f openipmi: add new recipe
f702be3 ipmitool: add new recipe

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
5f837b4 qttools: add ptest
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
4ed7feb Merge pull request #35 from schnitzeltony/chrome-progress
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
c325204 packagegroup-luneos-extended: drop qtscenegraph-adaptation
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
d150b0a meta-openmoko: remove fbreader bbappend to drop meta-gpe dependency
not included in master yet:=20

--5QAgd0e35j3NYeGe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWQDgfwAKCRA3VSO3ZXaA
HNC0AJ9c31Q9g1+N/HjcHe+M5denOUh29QCfadse4b0DLbFb7xth/yEpHqpBDvQ=
=8vOp
-----END PGP SIGNATURE-----

--5QAgd0e35j3NYeGe--
