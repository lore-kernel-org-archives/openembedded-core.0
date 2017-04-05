Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id A235573081;
	Wed,  5 Apr 2017 09:23:38 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id t189so8332478wmt.1;
	Wed, 05 Apr 2017 02:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=B6PR899aeunGl0ZlLtvAUYZScGV++yw8CmXBiBxrn5M=;
	b=WMvmegjsvkW9wcUiaww0NToKo6KDdXp8etQ4rjrBayet6b54XSOL53QDtgDySAkRWf
	cM0geUhKB9MjS20j5dlNneYpt1FLI4EijbvDQN0cR6zQz9vMGKG5tRrI4pmbSxuPEVDu
	BEJiOn2nQHmYIaY0XV7SY5NNCTkjLwPbTkm5kLsbBdDPkiTjp9g7FQW1/426rAyTMEds
	NnCkaP3izLfRyeJ1FlP1jMwNJzjvW67QQmNn1xLcmCveYmnYYP/GuicXSAPuzQNU4+GX
	URG74fI/nyVea07ka5EbqJuv8pdDDuk1VL8T1z1md09dxLKnzM2ciDQGMmJydYlLihEP
	VNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=B6PR899aeunGl0ZlLtvAUYZScGV++yw8CmXBiBxrn5M=;
	b=O5iD+yqkazaYHHxPqNPvzPPGqobpPZqAwmj4DAw0ChJbxSms3v5E2m/RrHnBsrczjM
	kKcisJ2+WNtihRIUNomaC4PfbnStZUIRsV0O38rEc4/mUACZ1sr+Oy03ch7XEU741zb3
	RCizhJ7aG9PyZmyoXTykFQ3M+zpk/JA2noSZJx+7TGO7cDaorsPr2FdFZ+KXv1Lp4T6U
	KuEIExi1ENOmyDv9UKyn9suWnTGGFaI0d7vrohhqP9G74DOXWSsYWklYdC233uXQMkB2
	R1Md8r23yNzjVZsCZDuTyBlgwqetL9XiSWAjJXKH0ofqv2fE+9hFVH0dyLXb03AjimZu
	Y8FQ==
X-Gm-Message-State: AFeK/H3H/EbhBtFpvGFS9rwPpfumEw9yXYvjmbGDzCccBtUCpKNl+Y3E
	JxMeo3Gwc38IpkOC1RQcacg0fzJ3Gc4j
X-Received: by 10.28.157.140 with SMTP id g134mr18986748wme.81.1491384217560; 
	Wed, 05 Apr 2017 02:23:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Wed, 5 Apr 2017 02:23:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 5 Apr 2017 11:23:36 +0200
Message-ID: <CA+chaQct8fKjRucStuHcYfnym3092Mi2RAzcMKgE9SDT5V5ZGQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: State of bitbake world, Failed tasks 2017-04-04
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
X-List-Received-Date: Wed, 05 Apr 2017 09:23:39 -0000
Content-Type: multipart/alternative; boundary=001a114b41e482f0f9054c67f23a

--001a114b41e482f0f9054c67f23a
Content-Type: text/plain; charset=UTF-8

== Number of issues - stats ==
{| class='wikitable'
!|Date		     !!colspan='3'|Failed tasks			    !!colspan='6'|Failed
depencencies			 !!|Signatures		  !!colspan='14'|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||qemuarm||max||min	||qemux86||max||min	||all
	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	||ldflags	||compile-host-path	||
|-
||2017-04-04	||0	||0	||0	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||0		||1		||0		||0		||12		||0		||0		||0		||0		||0		||0		||0		||0		||
|}
http://www.openembedded.org/wiki/Bitbake_World_Status

== Failed tasks 2017-04-04 ==

INFO: jenkins-job.sh-1.8.20 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.report.20170404_201718.log

=== common () ===

=== common-x86 (0) ===

=== qemuarm (0) ===

=== qemux86 (0) ===

=== qemux86_64 (0) ===

=== Number of failed tasks (0) ===
{| class=wikitable
|-
|| qemuarm 	|| 0	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemuarm.20170404_030425.log/
||
|-
|| qemux86 	|| 0	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemux86.20170404_102249.log/
||
|-
|| qemux86_64 	|| 0	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemux86-64.20170404_120149.log/
||
|}

=== PNBLACKLISTs (443) ===

=== QA issues (13) ===
{| class=wikitable
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
||0	||unknown-configure-option
|-
||12	||version-going-backwards
|-
||1	||textrel
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signatures.20170403_105437.log/

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
recipes-browser/chromium/cef3_280796.bb:PNBLACKLIST[cef3] ?= "BROKEN:
fails to build with gcc-6"
meta-openembedded:
meta-efl/recipes-devtools/python/python-edbus_1.7.0.bb:PNBLACKLIST[python-edbus]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130600/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-devtools/python/python-efl_1.15.0.bb:PNBLACKLIST[python-efl]
?= "Depends on blacklisted elementary - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-efl/recipes-devtools/python/python-efl_git.bb:PNBLACKLIST[python-efl]
?= "Depends on blacklisted elementary - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/cpu_svn.bb:PNBLACKLIST[cpu] ?= "Depends on
blacklisted e-wm - the recipe will be removed on 2017-09-01 unless the
issue is fixed"
meta-efl/recipes-efl/e17/diskio_svn.bb:PNBLACKLIST[diskio] ?= "broken:
switch to https://git.enlightenment.org/enlightenment/modules/diskio.git/
and fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58.
invalid state name: 'off'. "default" state must always be first. - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/e-tasks_git.bb:PNBLACKLIST[e-tasks] ?=
"Depends on blacklisted elementary - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb:PNBLACKLIST[e-wm-theme-b-and-w]
?= "Runtime depends on blacklisted e-wm - the recipe will be removed
on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb:PNBLACKLIST[e-wm-theme-b-and-w]
?= "Runtime depends on blacklisted e-wm-theme-b-and-w - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb:PNBLACKLIST[e-wm-theme-b-and-w]
?= "Runtime depends on blacklisted e-wm-theme-b-and-w-dev - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb:PNBLACKLIST[e-wm-theme-illume-efenniht]
?= "Runtime depends on blacklisted e-wm - the recipe will be removed
on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb:PNBLACKLIST[e-wm-theme-illume-efenniht]
?= "Runtime depends on blacklisted e-wm-theme-illume-efenniht - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/e-wm_0.18.8.bb:PNBLACKLIST[e-wm] ?= "Depends
on blacklisted elementary - the recipe will be removed on 2017-09-01
unless the issue is fixed"
meta-efl/recipes-efl/e17/e-wm_0.19.10.bb:PNBLACKLIST[e-wm] ?= "Depends
on blacklisted elementary - the recipe will be removed on 2017-09-01
unless the issue is fixed"
meta-efl/recipes-efl/e17/e-wm_git.bb:PNBLACKLIST[e-wm] ?= "Depends on
blacklisted elementary - the recipe will be removed on 2017-09-01
unless the issue is fixed"
meta-efl/recipes-efl/e17/edje-viewer_svn.bb:PNBLACKLIST[edje-viewer]
?= "Depends on blacklisted elementary - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/elbow_git.bb:PNBLACKLIST[elbow] ?= "Depends
on blacklisted webkit-efl - the recipe will be removed on 2017-09-01
unless the issue is fixed"
meta-efl/recipes-efl/e17/elfe_git.bb:PNBLACKLIST[elfe] ?= "Depends on
blacklisted elementary - the recipe will be removed on 2017-09-01
unless the issue is fixed"
meta-efl/recipes-efl/e17/elmdentica_svn.bb:PNBLACKLIST[elmdentica] ?=
"OLD and depends on broken azy - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/emprint_svn.bb:PNBLACKLIST[emprint] ?= "if
you want to use these modules with E18, then you need to update it to
git recipe fetching newer sources from
http://git.enlightenment.org/apps/emprint.git/ - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/enjoy_git.bb:PNBLACKLIST[enjoy] ?= "Depends
on blacklisted elementary - the recipe will be removed on 2017-09-01
unless the issue is fixed"
meta-efl/recipes-efl/e17/ephoto_svn.bb:PNBLACKLIST[ephoto] ?= "Depends
on blacklisted elementary - the recipe will be removed on 2017-09-01
unless the issue is fixed"
meta-efl/recipes-efl/e17/exalt-client_svn.bb:PNBLACKLIST[exalt-client]
?= "Depends on blacklisted elementary - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/exalt_svn.bb:PNBLACKLIST[exalt] ?= "Depends
on blacklisted elementary - the recipe will be removed on 2017-09-01
unless the issue is fixed"
meta-efl/recipes-efl/e17/exquisite-theme-illume.bb:PNBLACKLIST[exquisite-theme-illume]
?= "Depends on blacklisted edje-native - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/exquisite-theme-illume.bb:PNBLACKLIST[exquisite-theme-illume]
?= "Runtime depends on blacklisted exquisite-theme-illume - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/exquisite-theme-illume.bb:PNBLACKLIST[exquisite-theme-illume]
?= "Runtime depends on blacklisted exquisite-theme-illume-dev - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/exquisite_svn.bb:PNBLACKLIST[exquisite] ?=
"Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130619/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/flame_svn.bb:PNBLACKLIST[flame] ?= "Depends
on blacklisted e-wm - the recipe will be removed on 2017-09-01 unless
the issue is fixed"
meta-efl/recipes-efl/e17/forecasts_svn.bb:PNBLACKLIST[forecasts] ?=
"Depends on blacklisted e-wm - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/news_svn.bb:PNBLACKLIST[news] ?= "if you want
to use these modules with E18, then you need to update it to git
recipe fetching newer sources from
http://git.enlightenment.org/enlightenment/modules/news.git/ - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/places_svn.bb:PNBLACKLIST[places] ?= "Depends
on blacklisted e-wm - the recipe will be removed on 2017-09-01 unless
the issue is fixed"
meta-efl/recipes-efl/e17/rage_svn.bb:PNBLACKLIST[rage] ?= "if you want
to use these modules with E18, then you need to update it to git
recipe fetching newer sources from
http://git.enlightenment.org/apps/rage.git/ - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/rain_svn.bb:PNBLACKLIST[rain] ?= "Depends on
blacklisted e-wm - the recipe will be removed on 2017-09-01 unless the
issue is fixed"
meta-efl/recipes-efl/e17/screenshot_svn.bb:PNBLACKLIST[screenshot] ?=
"depends on blacklisted emprint - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/terminology_0.9.1.bb:PNBLACKLIST[terminology]
?= "Depends on blacklisted elementary - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/e17/uptime_svn.bb:PNBLACKLIST[uptime] ?= "Depends
on blacklisted e-wm - the recipe will be removed on 2017-09-01 unless
the issue is fixed"
meta-efl/recipes-efl/efl/azy_svn.bb:PNBLACKLIST[azy] ?= "OLD and
doesn't build with gcc-5 - the recipe will be removed on 2017-09-01
unless the issue is fixed"
meta-efl/recipes-efl/efl/edbus_1.7.9.bb:PNBLACKLIST[edbus] ?= "Depends
on blacklisted ecore - the recipe will be removed on 2017-09-01 unless
the issue is fixed"
meta-efl/recipes-efl/efl/edbus_1.7.9.bb:PNBLACKLIST[edbus] ?= "Depends
on blacklisted eina - the recipe will be removed on 2017-09-01 unless
the issue is fixed"
meta-efl/recipes-efl/efl/edbus_1.7.9.bb:PNBLACKLIST[edbus] ?= "Runtime
depends on blacklisted edbus - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/edbus_1.7.9.bb:PNBLACKLIST[edbus] ?= "Runtime
depends on blacklisted edbus-dev - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/efl.inc:PNBLACKLIST[efl] ?= "Depends on
broken efl-native - the recipe will be removed on 2017-09-01 unless
the issue is fixed"
meta-efl/recipes-efl/efl/efl.inc:PNBLACKLIST[efl-native] ?= "Broken:
fails to build with
http://errors.yoctoproject.org/Errors/Details/138240/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb:PNBLACKLIST[elementary-theme-efenniht]
?= "Depends on blacklisted edje-native - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb:PNBLACKLIST[elementary-theme-efenniht]
?= "Runtime depends on blacklisted elementary-theme-efenniht - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb:PNBLACKLIST[elementary-theme-efenniht]
?= "Runtime depends on blacklisted elementary-theme-efenniht-dev - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/elementary_1.15.1.bb:PNBLACKLIST[elementary]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130584/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/emotion-generic-players_1.15.0.bb:PNBLACKLIST[emotion-generic-players]
?= "Depends on blacklisted emotion - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/emotion-generic-players_1.15.0.bb:PNBLACKLIST[emotion-generic-players]
?= "Runtime depends on blacklisted emotion-generic-players - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/emotion-generic-players_1.15.0.bb:PNBLACKLIST[emotion-generic-players]
?= "Runtime depends on blacklisted emotion-generic-players-dev - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/engrave_svn.bb:PNBLACKLIST[engrave] ?=
"BROKEN: fails to build with latest oe-core - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/entrance_svn.bb:PNBLACKLIST[entrance] ?=
"broken: switch to https://git.enlightenment.org/misc/entrance.git and
fix 0.0.4+svnr82070-r7/entrance/data/themes/old/default.edc:678.
invalid state name: 'defaault'. "default" state must always be first.
- the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/epdf_svn.bb:PNBLACKLIST[epdf] ?= "Depends on
blacklisted ecore - the recipe will be removed on 2017-09-01 unless
the issue is fixed"
meta-efl/recipes-efl/efl/epdf_svn.bb:PNBLACKLIST[epdf] ?= "Depends on
blacklisted evas - the recipe will be removed on 2017-09-01 unless the
issue is fixed"
meta-efl/recipes-efl/efl/epdf_svn.bb:PNBLACKLIST[epdf] ?= "Runtime
depends on blacklisted epdf-dev - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/epdf_svn.bb:PNBLACKLIST[epdf] ?= "Runtime
depends on blacklisted epdf - the recipe will be removed on 2017-09-01
unless the issue is fixed"
meta-efl/recipes-efl/efl/evas-generic-loaders_1.15.0.bb:PNBLACKLIST[evas-generic-loaders]
?= "Depends on blacklisted eina - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/evas-generic-loaders_1.15.0.bb:PNBLACKLIST[evas-generic-loaders]
?= "Runtime depends on blacklisted evas-generic-loaders - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/evas-generic-loaders_1.15.0.bb:PNBLACKLIST[evas-generic-loaders]
?= "Runtime depends on blacklisted evas-generic-loaders-dev - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_1.7.9.bb:PNBLACKLIST[expedite] ?=
"Depends on blacklisted eet - the recipe will be removed on 2017-09-01
unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_1.7.9.bb:PNBLACKLIST[expedite] ?=
"Depends on blacklisted evas - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_1.7.9.bb:PNBLACKLIST[expedite] ?=
"Runtime depends on blacklisted evas-loader-png - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_1.7.9.bb:PNBLACKLIST[expedite] ?=
"Runtime depends on blacklisted expedite - the recipe will be removed
on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_1.7.9.bb:PNBLACKLIST[expedite] ?=
"Runtime depends on blacklisted expedite-themes - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_1.7.9.bb:PNBLACKLIST[expedite] ?=
"Runtime depends on blacklisted evas-engine-gl-x11 - the recipe will
be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_1.7.9.bb:PNBLACKLIST[expedite] ?=
"Runtime depends on blacklisted evas-engine-software-generic - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_1.7.9.bb:PNBLACKLIST[expedite] ?=
"Runtime depends on blacklisted expedite-dev - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_1.7.9.bb:PNBLACKLIST[expedite] ?=
"Runtime depends on blacklisted evas-engine-software-x11 - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_1.7.9.bb:PNBLACKLIST[expedite] ?=
"Runtime depends on blacklisted evas-engine-fb - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_git.bb:PNBLACKLIST[expedite] ?=
"Depends on blacklisted eet - the recipe will be removed on 2017-09-01
unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_git.bb:PNBLACKLIST[expedite] ?=
"Depends on blacklisted evas - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_git.bb:PNBLACKLIST[expedite] ?=
"Runtime depends on blacklisted evas-loader-png - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_git.bb:PNBLACKLIST[expedite] ?=
"Runtime depends on blacklisted expedite - the recipe will be removed
on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_git.bb:PNBLACKLIST[expedite] ?=
"Runtime depends on blacklisted evas-engine-software-generic - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_git.bb:PNBLACKLIST[expedite] ?=
"Runtime depends on blacklisted evas-engine-fb - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_git.bb:PNBLACKLIST[expedite] ?=
"Runtime depends on blacklisted evas-engine-software-x11 - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_git.bb:PNBLACKLIST[expedite] ?=
"Runtime depends on blacklisted evas-engine-gl-x11 - the recipe will
be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_git.bb:PNBLACKLIST[expedite] ?=
"Runtime depends on blacklisted expedite-dev - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/expedite_git.bb:PNBLACKLIST[expedite] ?=
"Runtime depends on blacklisted expedite-themes - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/libeflvala_svn.bb:PNBLACKLIST[libeflvala] ?=
"Depends on blacklisted elementary - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/efl/libeweather_svn.bb:PNBLACKLIST[libeweather]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130649/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb:PNBLACKLIST[packagegroup-efl-sdk]
?= "Runtime depends on blacklisted elementary-dev - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.bb:PNBLACKLIST[packagegroup-efl-standalone-sdk-target]
?= "Runtime depends on blacklisted elementary-dev - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb:PNBLACKLIST[packagegroup-x11-illume]
?= "Runtime depends on blacklisted e-wm - the recipe will be removed
on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb:PNBLACKLIST[packagegroup-x11-illume]
?= "Runtime depends on blacklisted e-wm-config-mobile - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb:PNBLACKLIST[packagegroup-x11-illume]
?= "Runtime depends on blacklisted e-wm-theme-default - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-efl/webkit/webkit-efl.inc:PNBLACKLIST[webkit-efl] ?=
"Old and unmaintaned fork with many security issues - the recipe will
be removed on 2017-09-01 unless the issue is fixed"
meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb:PNBLACKLIST[mcnavi]
?= "BROKEN: latest version 0.3.4 is 3 years old and now broken with
more strict ejde_cc from efl-1.13 - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb:PNBLACKLIST[logfsprogs]
?= "Doesn't have proper PV, doesn't respect LDFLAGS - the recipe will
be removed on 2017-09-01 unless the issue is fixed"
meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb:PNBLACKLIST[smbnetfs]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/132827/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb:PNBLACKLIST[unionfs-fuse]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130648/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-filesystems/recipes-utils/dmapi/dmapi_2.2.12.bb:PNBLACKLIST[dmapi]
?= "Depends on broken xfsprogs - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb:PNBLACKLIST[xfsdump]
?= "Depends on broken xfsprogs - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb:PNBLACKLIST[cheese] ?=
"Depends on blacklisted gstreamer - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb:PNBLACKLIST[cheese] ?=
"Depends on blacklisted gnome-desktop - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb:PNBLACKLIST[epdfview]
?= "BROKEN: images are not displayed anymore - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb:PNBLACKLIST[gmtk]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130661/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gnome-mplayer]
?= "rdepends on blacklisted mplayer - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb:PNBLACKLIST[gtk-theme-torturer]
?= "BROKEN: gmacros.h:182:53: error: size of array
'_GStaticAssertCompileTimeAssertion_2' is negative - the recipe will
be removed on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/devilspie/devilspie2_0.33.bb:PNBLACKLIST[devilspie2]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130666/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb:PNBLACKLIST[gcalctool]
?= "broken at least since April 2013
http://permalink.gmane.org/gmane.comp.handhelds.openembedded/57920 and
nobody complained, it's also replaced by gnome calculator - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb:PNBLACKLIST[gdm] ?=
"Depends on broken gnome-panel - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb:PNBLACKLIST[gnome-backgrounds]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130647/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb:PNBLACKLIST[gnome-control-center]
?= "Depends on broken gnome-menus - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb:PNBLACKLIST[gnome-desktop]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130595/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb:PNBLACKLIST[gnome-disk-utility]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/132824/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLIST[gnome-keyring]
?= "This version conflicts with gcr from oe-core - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb:PNBLACKLIST[gnome-menus]
?= "BROKEN: fails to build because of python + conflicts with
gnome-menu3 - the recipe will be removed on 2017-09-01 unless the
issue is fixed"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnome-panel3]
?= "CONFLICT: depends on libgweather3 which conflicts with libgweather
- the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnome-panel3]
?= "Depends on broken gnome-menus - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb:PNBLACKLIST[gnome-panel]
?= "Depends on broken libgweather - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb:PNBLACKLIST[gnome-power-manager]
?= "BROKEN: not compatible with current libnotify - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb:PNBLACKLIST[gnome-session]
?= "BROKEN: fails to build with gcc-6 - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb:PNBLACKLIST[gnome-settings-daemon]
?= "Depends on blacklisted libgnomekbd - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb:PNBLACKLIST[gnome-settings-daemon]
?= "Depends on blacklisted gnome-desktop - the recipe will be removed
on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb:PNBLACKLIST[gnome-system-monitor]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/131635/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb:PNBLACKLIST[gnome-terminal]
?= "BROKEN: fails to build with gcc-6 - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb:PNBLACKLIST[libgnomecups]
?= "Depends on blacklisted libgnomeui - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb:PNBLACKLIST[libgnomeprint]
?= "Depends on broken libgnomecups - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb:PNBLACKLIST[gnumeric]
?= "Depends on broken libgnomeprint - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb:PNBLACKLIST[gthumb]
?= "Depends on blacklisted gstreamer - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgweather3]
?= "CONFLICT: 876 files are conflicting with libgweather - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb:PNBLACKLIST[libgweather]
?= "BROKEN: fails to build with gcc-6 - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb:PNBLACKLIST[libgnomekbd]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130608/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb:PNBLACKLIST[nautilus3]
?= "BROKEN: fails to build, maybe missing dependency on
gnome-desktop-utils.h provider - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb:PNBLACKLIST[nautilus]
?= "Depends on blacklisted gnome-desktop - the recipe will be removed
on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb:PNBLACKLIST[contacts]
?= "Fails to fetch, pimlico-project.org is gone
http://errors.yoctoproject.org/Errors/Details/132854/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/pimlico/contacts_git.bb:PNBLACKLIST[contacts]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/132826/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb:PNBLACKLIST[tasks] ?=
"Fails to build with gcc-6 - the recipe will be removed on 2017-09-01
unless the issue is fixed"
meta-gnome/recipes-gnome/pimlico/tasks_git.bb:PNBLACKLIST[tasks] ?=
"Fails to build with gcc-6 - the recipe will be removed on 2017-09-01
unless the issue is fixed"
meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb:PNBLACKLIST[system-tools-backends]
?= "does not build with distroless qemuarm as reported in 'State of
bitbake world' thread, nobody volunteered to fix them - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb:PNBLACKLIST[gnome-themes]
?= "Depends on blacklisted gtk-engines - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity]
?= "BROKEN: doesn't build with B!=S - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-gnome/recipes-support/florence/florence_0.5.4.bb:PNBLACKLIST[florence]
?= "Depends on blacklisted gstreamer - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-gnome/recipes-support/goffice/goffice_0.10.1.bb:PNBLACKLIST[goffice]
?= "BROKEN: fails to build with gcc-6 - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-gnome/recipes-support/tracker/tracker_0.14.2.bb:PNBLACKLIST[tracker]
?= "BROKEN: fails to build with new binutils-2.27 - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb:PNBLACKLIST[gpe-scap]
?= "Depends on blacklisted libgpewidget - the recipe will be removed
on 2017-09-01 unless the issue is fixed"
meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb:PNBLACKLIST[libgpewidget]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130594/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-gpe/recipes-graphics/minilite/minilite_0.50.bb:PNBLACKLIST[minilite]
?= "Depends on blacklisted libgpewidget - the recipe will be removed
on 2017-09-01 unless the issue is fixed"
meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb:PNBLACKLIST[fbreader]
?= "Depends on blacklisted libgpewidget - the recipe will be removed
on 2017-09-01 unless the issue is fixed"
meta-gpe/recipes-support/fbreader/fbreader_git.bb:PNBLACKLIST[fbreader]
?= "BROKEN: fails to build with gcc-6 - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb:PNBLACKLIST[gupnp-igd]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130645/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.10.bb:PNBLACKLIST[gupnp-tools]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130670/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb:PNBLACKLIST[dvb-apps]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130603/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb:PNBLACKLIST[tvheadend]
?= "Depends on blacklisted dvb-apps - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts_git.bb:PNBLACKLIST[kodi-addon-pvr-hts]
?= "Depends on blacklisted kodi - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-multimedia/recipes-mediacenter/kodi/kodi-platform_git.bb:PNBLACKLIST[kodi-platform]
?= "Depends on blacklisted kodi - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-multimedia/recipes-mediacenter/kodi/kodi-startup.bb:PNBLACKLIST[kodi-startup]
?= "Runtime depends on blacklisted kodi - the recipe will be removed
on 2017-09-01 unless the issue is fixed"
meta-multimedia/recipes-mediacenter/kodi/kodi-startup.bb:PNBLACKLIST[kodi-startup]
?= "Runtime depends on blacklisted kodi-startup-dev - the recipe will
be removed on 2017-09-01 unless the issue is fixed"
meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb:PNBLACKLIST[kodi]
?= "Depends on blacklisted libsdl-mixer - the recipe will be removed
on 2017-09-01 unless the issue is fixed"
meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb:PNBLACKLIST[mkvtoolnix]
?= "BROKEN: Failx to build with gcc-5 - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:PNBLACKLIST[coriander]
?= "BROKEN: fails to use SDL probably because libsdl-config was
removed, error: unknown type name 'SDL_Overlay' - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb:PNBLACKLIST[renderer-service-upnp]
?= "BROKEN: doesn't build with B!=S (trying to install
rendererconsole.py from ${B} instead of ${S}) - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg_0.10.13.bb:PNBLACKLIST[gst-ffmpeg]
?= "Not compatible with currently used ffmpeg 3 - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb:PNBLACKLIST[gst123]
?= "gst123 is still "sometimes" using wrong sysroot - the recipe will
be removed on 2017-09-01 unless the issue is fixed"
meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb:PNBLACKLIST[dnrd]
?= "BROKEN: dnrd-2.20.3-r0 do_package: QA Issue: dnrd:
Files/directories were installed but not shipped in any package: - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-networking/recipes-kernel/netmap/netmap-modules_git.bb:PNBLACKLIST[netmap-modules]
?= "BROKEN: not compatible with default kernel version 4.8 - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-networking/recipes-kernel/netmap/netmap_git.bb:PNBLACKLIST[netmap]
?= "BROKEN: Tries to build kernel module and fails, either it should
be disabled or there should be dependency on kernel like in
netmap-modules - the recipe will be removed on 2017-09-01 unless the
issue is fixed"
meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb:PNBLACKLIST[accel-ppp]
?= "BROKEN: fails to build with new binutils-2.27 - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACKLIST[lksctp-tools]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN:
fails to link against sctp_connectx symbol", '', d)} - the recipe will
be removed on 2017-09-01 unless the issue is fixed"
meta-networking/recipes-support/nis/ypbind-mt_2.2.bb:PNBLACKLIST[ypbind-mt]
?= "BROKEN: Depends on broken yp-tools - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_6.6.1.bb:PNBLACKLIST[phoronix-test-suite]
?= "Runtime depends on blacklisted php-cli - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-benchmark/pmbw/pmbw_git.bb:PNBLACKLIST[pmbw] ?= "Fails
to build with RSS
http://errors.yoctoproject.org/Errors/Details/130568/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNBLACKLIST[bluez-hcidump]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '',
d)} - the recipe will be removed on 2017-09-01 unless the issue is
fixed"
meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '',
d)} - the recipe will be removed on 2017-09-01 unless the issue is
fixed"
meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:PNBLACKLIST[gst-plugin-bluetooth]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '',
d)} - the recipe will be removed on 2017-09-01 unless the issue is
fixed"
meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb:PNBLACKLIST[gnokii]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130662/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.6.bb:PNBLACKLIST[networkmanager-openvpn]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130667/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66]
?= "BROKEN: depends on broken libftdi - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-oe/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb:PNBLACKLIST[libtelepathy]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130609/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.16.1.bb:PNBLACKLIST[telepathy-mission-control]
?= "Depends on blacklisted libtelepathy - the recipe will be removed
on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb:PNBLACKLIST[wvdial]
?= "Depends on broken wvstreams - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb:PNBLACKLIST[wvstreams]
?= "BROKEN: fails to build with gcc-6 - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zeroc-ice]
?= "BROKEN: not compatible with default db version - the recipe will
be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb:PNBLACKLIST[dbus-daemon-proxy]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130613/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb:PNBLACKLIST[libdbus-c++]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130644/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb:PNBLACKLIST[fakeroot]
?= "BROKEN: QA Issue: -dev package contains non-symlink .so - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb:PNBLACKLIST[packagegroup-cli-tools]
?= "Runtime depends on blacklisted dbus-daemon-proxy - the recipe will
be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb:PNBLACKLIST[packagegroup-cli-tools]
?= "Runtime depends on blacklisted packagegroup-cli-tools - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb:PNBLACKLIST[cloud9] ?=
"Not comatible with current nodejs 0.12, but upstream is working on it
for v3 - the recipe will be removed on 2017-09-01 unless the issue is
fixed"
meta-oe/recipes-devtools/dt/dt_18.32.bb:PNBLACKLIST[dt] ?= "Rdepends
on blacklisted tcsh - the recipe will be removed on 2017-09-01 unless
the issue is fixed"
meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb:PNBLACKLIST[ltp-ddt]
?= "BROKEN: fails since last autotools.bbclass changes - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb:PNBLACKLIST[packagekit]
?= "BROKEN: depends on old deprecated libopkg which is currently
disabled and will be removed soon - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-oe/recipes-devtools/php/php_5.6.26.bb:PNBLACKLIST[php] ?= "Fails
to build with RSS
http://errors.yoctoproject.org/Errors/Details/131630/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-devtools/php/php_7.1.0.bb:PNBLACKLIST[php] ?= "Fails
to build with RSS
http://errors.yoctoproject.org/Errors/Details/130601/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.0.bb:PNBLACKLIST[vala-dbus-binding-tool]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/131628/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb:PNBLACKLIST[vala-dbus-binding-tool]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130581/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-extended/openlmi/openlmi-networking_0.3.1.bb:PNBLACKLIST[openlmi-networking]
?= "Depends on blacklisted openlmi-providers - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-extended/openlmi/openlmi-providers_0.6.0.bb:PNBLACKLIST[openlmi-providers]
?= "Depends on blacklisted lmsensors - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-oe/recipes-extended/openlmi/openlmi-storage_0.8.1.bb:PNBLACKLIST[openlmi-storage]
?= "Depends on blacklisted pywbem - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurface]
?= "Needs to be upgraded for compatibility with new libdivecomputer -
the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb:PNBLACKLIST[gtkextra]
?= "BROKEN: Fails to build with gcc-5 - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb:PNBLACKLIST[gtkhtml2]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130633/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-box2d]
?= "BROKEN: doesn't build with B!=S - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-oe/recipes-graphics/fbida/fbida_2.10.bb:PNBLACKLIST[fbida] ?=
"Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130677/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?=
"BROKEN: doesn't build with B!=S (flex: can't open lex.lex) - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb:PNBLACKLIST[libsexy]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130607/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-graphics/slim/slim_1.3.2.bb:PNBLACKLIST[slim] ?= "does
not build with distroless qemuarm as reported in 'State of bitbake
world' thread, nobody volunteered to fix them - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb:PNBLACKLIST[terminus-font]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130638/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-graphics/wayland/wayland-fits_git.bb:PNBLACKLIST[wayland-fits]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130632/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.3.bb:PNBLACKLIST[xstdcmap]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130660/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[xf86-input-mtev]
?= "BROKEN: doesn't build with B!=S (Makefile without ${S} in sed
call) - the recipe will be removed on 2017-09-01 unless the issue is
fixed"
meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:PNBLACKLIST[xf86-video-geode]
?= "BROKEN, fails to build - the recipe will be removed on 2017-09-01
unless the issue is fixed"
meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb:PNBLACKLIST[xf86-video-glamo]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130629/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.12.bb:PNBLACKLIST[xf86-video-nouveau]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130657/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb:PNBLACKLIST[xorg-fonts-100dpi]
?= "Runtime depends on blacklisted font-adobe-100dpi - the recipe will
be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb:PNBLACKLIST[xorg-fonts-100dpi]
?= "Runtime depends on blacklisted xorg-fonts-100dpi - the recipe will
be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb:PNBLACKLIST[xorg-fonts-100dpi]
?= "Runtime depends on blacklisted font-bh-100dpi - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb:PNBLACKLIST[xorg-fonts-100dpi]
?= "Runtime depends on blacklisted font-adobe-utopia-100dpi - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb:PNBLACKLIST[xorg-fonts-100dpi]
?= "Runtime depends on blacklisted font-bh-lucidatypewriter-100dpi -
the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-kernel/crash/crash_7.1.5.bb:PNBLACKLIST[crash] ?=
"Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130678/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-kernel/ktap/ktap-module_git.bb:PNBLACKLIST[ktap-module]
?= "Not compatible with 3.19 kernel - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-oe/recipes-kernel/ktap/ktap_git.bb:PNBLACKLIST[ktap] ?= "Depends
on blacklisted kernel-module-ktapvm - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-oe/recipes-multimedia/minidlna/minidlna_1.1.5.bb:PNBLACKLIST[minidlna]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130630/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb:PNBLACKLIST[mplayer2]
?= "Not compatible with currently used ffmpeg 3 - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtrotgps]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '',
d)} - the recipe will be removed on 2017-09-01 unless the issue is
fixed"
meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb:PNBLACKLIST[gdal] ?=
"BROKEN: fails to build with gcc-5 - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=
"${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)} - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=
"${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)} - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb:PNBLACKLIST[claws-mail]
?= "depends on blacklisted libetpan - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb:PNBLACKLIST[claws-plugin-gtkhtml2-viewer]
?= "depends on blacklisted claws-mail - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb:PNBLACKLIST[claws-plugin-mailmbox]
?= "depends on blacklisted claws-mail - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb:PNBLACKLIST[claws-plugin-rssyl]
?= "depends on blacklisted claws-mail - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb:PNBLACKLIST[sylpheed]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130651/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd]
?= "BROKEN: doesn't build with B!=S - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?=
"qemu: uncaught target signal 11 (Segmentation fault) - core dumped -
the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-support/farsight/farsight2_0.0.22.bb:PNBLACKLIST[farsight2]
?= "Depends on blacklisted gstreamer - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-oe/recipes-support/farsight/farsight2_0.0.22.bb:PNBLACKLIST[farsight2]
?= "Depends on blacklisted libnice - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-oe/recipes-support/farsight/farsight2_0.0.22.bb:PNBLACKLIST[farsight2]
?= "Depends on blacklisted gst-plugins-base - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-support/fftw/benchfft_3.1.bb:PNBLACKLIST[benchfft] ?=
"does not build with distroless qemuarm as reported in 'State of
bitbake world' thread, nobody volunteered to fix them - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-support/flite/flite-alsa_1.3.bb:PNBLACKLIST[flite-alsa]
?= "OLD: wasn't updated in over 6 years, only navit was RSUGGESTing it
and doesn't respect LDFLAGS - the recipe will be removed on 2017-09-01
unless the issue is fixed"
meta-oe/recipes-support/iksemel/iksemel_1.4.bb:PNBLACKLIST[iksemel] ?=
"Not compatible with gnutls version 3.4 currently in oe-core - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb:PNBLACKLIST[libdbi-drivers]
?= "BROKEN: fails to build with gcc-5 - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-oe/recipes-support/libetpan/libetpan_0.57.bb:PNBLACKLIST[libetpan]
?= "Not compatible with gnutls version 3.4 currently in oe-core - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-support/ode/ode_0.13.bb:PNBLACKLIST[ode] ?= "Fails to
build with RSS http://errors.yoctoproject.org/Errors/Details/130599/ -
the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-support/ode/ode_0.13.bb:PNBLACKLIST[ode] ?= "Fails to
build with RSS http://errors.yoctoproject.org/Errors/Details/130620/ -
the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.4.bb:PNBLACKLIST[open-vcdiff]
?= "BROKEN: fails to build with gcc-6 - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-oe/recipes-support/opencv/opencv-samples_2.4.bb:PNBLACKLIST[opencv-samples]
?= "Depends on blacklisted opencv - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-oe/recipes-support/opencv/opencv_2.4.bb:PNBLACKLIST[opencv] ?=
"Not compatible with currently used ffmpeg 3 - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmotif]
?= "BROKEN: doesn't build with B!=S - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '',
d)} - the recipe will be removed on 2017-09-01 unless the issue is
fixed"
meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb:PNBLACKLIST[openwbem]
?= "BROKEN: fails to build with gcc-6 - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb:PNBLACKLIST[pidgin-otr]
?= "depends on blacklisted pidgin - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-oe/recipes-support/psqlodbc/psqlodbc_09.05.0300.bb:PNBLACKLIST[psqlodbc]
?= "Depends on blacklisted postgresql - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb:PNBLACKLIST[system-setup-keyboard]
?= "Depends on blacklisted system-config-keyboard-native - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala-terminal]
?= "BROKEN: Doesn't work with B!=S, touch: cannot touch `src/.stamp':
No such file or directory - the recipe will be removed on 2017-09-01
unless the issue is fixed"
meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.36.bb:PNBLACKLIST[vboxguestdrivers]
?= "BROKEN: not compatible with default kernel version 4.8 - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-support/xchat/xchat_2.8.8.bb:PNBLACKLIST[xchat] ?=
"Depends on blacklisted libsexy - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-ruby/recipes-devtools/ruby/bundler_git.bb:PNBLACKLIST[bundler] ?=
"Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130640/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-webserver/recipes-php/xdebug/xdebug_2.5.1.bb:PNBLACKLIST[xdebug]
?= "Depends on blacklisted php - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb:PNBLACKLIST[openzone]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130682/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-qt5:
meta-smartphone:
meta-fso/recipes-freesmartphone/cornucopia/fso-apm_git.bb:PNBLACKLIST[fso-apm]
?= "Depends on blacklisted libfso-glib - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/cornucopia/fsoaudiod_0.12.0.bb:PNBLACKLIST[fsoaudiod]
?= "Depends on blacklisted libfso-glib - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/cornucopia/fsoaudiod_git.bb:PNBLACKLIST[fsoaudiod]
?= "Depends on blacklisted libfso-glib - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/cornucopia/fsodatad_0.12.0.bb:PNBLACKLIST[fsodatad]
?= "Depends on blacklisted libfso-glib - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/cornucopia/fsodatad_git.bb:PNBLACKLIST[fsodatad]
?= "Depends on blacklisted libfso-glib - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/cornucopia/fsodeviced_0.12.0.bb:PNBLACKLIST[fsodeviced]
?= "Depends on blacklisted libfso-glib - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/cornucopia/fsodeviced_git.bb:PNBLACKLIST[fsodeviced]
?= "Depends on blacklisted libfso-glib - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/cornucopia/fsogsmd_0.12.0.bb:PNBLACKLIST[fsogsmd]
?= "Depends on blacklisted libfso-glib - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/cornucopia/fsogsmd_git.bb:PNBLACKLIST[fsogsmd]
?= "Depends on blacklisted libfso-glib - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/cornucopia/fsonetworkd_0.12.0.bb:PNBLACKLIST[fsonetworkd]
?= "Depends on blacklisted libfso-glib - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/cornucopia/fsonetworkd_git.bb:PNBLACKLIST[fsonetworkd]
?= "Depends on blacklisted libfso-glib - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/cornucopia/fsoraw_git.bb:PNBLACKLIST[fsoraw]
?= "Depends on blacklisted libfso-glib - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/cornucopia/fsotdld_0.12.0.bb:PNBLACKLIST[fsotdld]
?= "Depends on blacklisted libfso-glib - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/cornucopia/fsotdld_git.bb:PNBLACKLIST[fsotdld]
?= "Depends on blacklisted libfso-glib - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/cornucopia/fsousaged_0.12.0.bb:PNBLACKLIST[fsousaged]
?= "Depends on blacklisted libfso-glib - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/cornucopia/fsousaged_git.bb:PNBLACKLIST[fsousaged]
?= "Depends on blacklisted libfso-glib - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/cornucopia/libfsoframework_0.12.0.bb:PNBLACKLIST[libfsoframework]
?= "Depends on blacklisted libfso-glib - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/cornucopia/libfsoframework_git.bb:PNBLACKLIST[libfsoframework]
?= "Depends on blacklisted libfso-glib - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/cornucopia/mkdump_git.bb:PNBLACKLIST[mkdump]
?= "Depends on blacklisted libfsoframework - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/cornucopia/mterm2_git.bb:PNBLACKLIST[mterm2]
?= "Depends on blacklisted libfsoframework - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/freesmartphone/frameworkd_0.10.1.bb:PNBLACKLIST[frameworkd]
?= "Runtime depends on blacklisted fsousaged - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/freesmartphone/frameworkd_git.bb:PNBLACKLIST[frameworkd]
?= "Runtime depends on blacklisted fsousaged - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/freesmartphone/frameworkd_git.bb:PNBLACKLIST[frameworkd]
?= "Runtime depends on blacklisted frameworkd-dev - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/freesmartphone/fso-gpsd_git.bb:PNBLACKLIST[fso-gpsd]
?= "Runtime depends on blacklisted fso-gpsd-dev - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/freesmartphone/fso-gsm0710muxd_git.bb:PNBLACKLIST[fso-gsm0710muxd]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130517/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/freesmartphone/illume-theme-freesmartphone_git.bb:PNBLACKLIST[illume-theme-freesmartphone]
?= "Depends on blacklisted edje-native - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/freesmartphone/illume-theme-freesmartphone_git.bb:PNBLACKLIST[illume-theme-freesmartphone]
?= "Depends on blacklisted eet-native - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/freesmartphone/illume-theme-freesmartphone_git.bb:PNBLACKLIST[illume-theme-freesmartphone]
?= "Runtime depends on blacklisted illume-theme-freesmartphone - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/freesmartphone/illume-theme-freesmartphone_git.bb:PNBLACKLIST[illume-theme-freesmartphone]
?= "Runtime depends on blacklisted illume-theme-freesmartphone-dev -
the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/freesmartphone/libframeworkd-glib_git.bb:PNBLACKLIST[libframeworkd-glib]
?= "BROKEN: many errors when building with gcc-6 - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/freesmartphone/libfso-glib_2012.07.27.2.bb:PNBLACKLIST[libfso-glib]
?= "Depends on blacklisted vala-dbus-binding-tool - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/freesmartphone/libfso-glib_git.bb:PNBLACKLIST[libfso-glib]
?= "Depends on blacklisted vala-dbus-binding-tool - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/freesmartphone/mickeyterm_git.bb:PNBLACKLIST[mickeyterm]
?= "Runtime depends on blacklisted fso-gsm0710muxd - the recipe will
be removed on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/freesmartphone/opimd-utils_git.bb:PNBLACKLIST[opimd-utils]
?= "Runtime depends on blacklisted ffphonelog - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/freesmartphone/zhone_git.bb:PNBLACKLIST[zhone]
?= "rdepends on python-pycairo which was removed - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/packagegroups/packagegroup-fso2-compliance.bb:PNBLACKLIST[packagegroup-fso2-compliance]
?= "Runtime depends on blacklisted fsoaudiod-config - the recipe will
be removed on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/packagegroups/packagegroup-fso2-compliance.bb:PNBLACKLIST[packagegroup-fso2-compliance]
?= "Runtime depends on blacklisted mkdump - the recipe will be removed
on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/packagegroups/packagegroup-fso2-compliance.bb:PNBLACKLIST[packagegroup-fso2-compliance]
?= "Runtime depends on blacklisted fsonetworkd - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/packagegroups/packagegroup-fso2-compliance.bb:PNBLACKLIST[packagegroup-fso2-compliance]
?= "Runtime depends on blacklisted fso-apm - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/packagegroups/packagegroup-fso2-compliance.bb:PNBLACKLIST[packagegroup-fso2-compliance]
?= "Runtime depends on blacklisted fsodatad - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/packagegroups/packagegroup-fso2-compliance.bb:PNBLACKLIST[packagegroup-fso2-compliance]
?= "Runtime depends on blacklisted packagegroup-fso2-compliance - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/packagegroups/packagegroup-fso2-compliance.bb:PNBLACKLIST[packagegroup-fso2-compliance]
?= "Runtime depends on blacklisted fsogsmd - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/packagegroups/packagegroup-fso2-compliance.bb:PNBLACKLIST[packagegroup-fso2-compliance]
?= "Runtime depends on blacklisted mterm2 - the recipe will be removed
on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/packagegroups/packagegroup-fso2-compliance.bb:PNBLACKLIST[packagegroup-fso2-compliance]
?= "Runtime depends on blacklisted fsodeviced - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/packagegroups/packagegroup-fso2-compliance.bb:PNBLACKLIST[packagegroup-fso2-compliance]
?= "Runtime depends on blacklisted fsotdld - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-fso/recipes-freesmartphone/packagegroups/packagegroup-fso2-compliance.bb:PNBLACKLIST[packagegroup-fso2-compliance]
?= "Runtime depends on blacklisted fsousaged - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/advancedcaching_git.bb:PNBLACKLIST[advancedcaching]
?= "RDEPENDS on python-pygtk was removed from oe-core - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/atd-over-fso_0.70.bb:PNBLACKLIST[atd-over-fso]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130540/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/atrack_svn.bb:PNBLACKLIST[atrack] ?=
"Runtime depends on blacklisted python-elementary - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/babiloo-efl_2.0.9-10.bb:PNBLACKLIST[babiloo-efl]
?= "Runtime depends on blacklisted python-elementary - the recipe will
be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/babiloo-efl_bzr.bb:PNBLACKLIST[babiloo-efl]
?= "Runtime depends on blacklisted python-elementary - the recipe will
be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/babiloo-efl_bzr.bb:PNBLACKLIST[babiloo-efl]
?= "Runtime depends on blacklisted babiloo-efl - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/babiloo-efl_bzr.bb:PNBLACKLIST[babiloo-efl]
?= "Runtime depends on blacklisted babiloo-efl-dev - the recipe will
be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/chroneo_svn.bb:PNBLACKLIST[chroneo] ?=
"Runtime depends on blacklisted python-elementary - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/ecalc_git.bb:PNBLACKLIST[ecalc] ?=
"Runtime depends on blacklisted python-edbus - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/ecalc_git.bb:PNBLACKLIST[ecalc] ?=
"Runtime depends on blacklisted python-elementary - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/emtooth2_svn.bb:PNBLACKLIST[emtooth2] ?=
"${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)} - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/estardict_0.7.bb:PNBLACKLIST[estardict]
?= "Depends on blacklisted elementary - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] =
"Doesn't build after vala upgrade from 0.24.0 to 0.26.1 - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/ffphonelog_git.bb:PNBLACKLIST[ffphonelog]
?= "Depends on blacklisted libeflvala - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/guitartune_svn.bb:PNBLACKLIST[guitartune]
?= "Depends on blacklisted libglade - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/gwaterpas_0.3.bb:PNBLACKLIST[gwaterpas]
?= "broken: depends on blacklisted fltk - the recipe will be removed
on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] =
"Doesn't build after vala upgrade from 0.24.0 to 0.26.1 - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] =
"rdepends on blacklisted mplayer2 - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/jefliks_git.bb:PNBLACKLIST[jefliks] ?=
"depends on blacklisted iksemel - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/minneo_svn.bb:PNBLACKLIST[minneo] ?=
"Runtime depends on blacklisted python-elementary - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/mokojeweled_git.bb:PNBLACKLIST[mokojeweled]
?= "Depends on blacklisted elementary - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/neolight_svn.bb:PNBLACKLIST[neolight] ?=
"Runtime depends on blacklisted python-edbus - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/neolight_svn.bb:PNBLACKLIST[neolight] ?=
"Runtime depends on blacklisted python-elementary - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/neomis_svn.bb:PNBLACKLIST[neomis] ?=
"Runtime depends on blacklisted python-elementary - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/numberx_svn.bb:PNBLACKLIST[numberx] ?=
"Runtime depends on blacklisted python-elementary - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/om-neon_svn.bb:PNBLACKLIST[om-neon] ?=
"Runtime depends on blacklisted python-evas - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/om-neon_svn.bb:PNBLACKLIST[om-neon] ?=
"Runtime depends on blacklisted om-neon-dev - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/om-neon_svn.bb:PNBLACKLIST[om-neon] ?=
"Runtime depends on blacklisted python-edje - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/om-neon_svn.bb:PNBLACKLIST[om-neon] ?=
"Runtime depends on blacklisted python-ecore - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/om-neon_svn.bb:PNBLACKLIST[om-neon] ?=
"Runtime depends on blacklisted om-neon - the recipe will be removed
on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/omext_0.2.bb:PNBLACKLIST[omext] ?=
"Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130539/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/openmoko-gps_svn.bb:PNBLACKLIST[openmoko-gps]
?= "RDEPENDS on python-pygtk which was removed from oe-core - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/pisi_0.5.3.bb:PNBLACKLIST[pisi] ?=
"RDEPENDS on python-pygtk which was removed from oe-core - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/podboy_svn.bb:PNBLACKLIST[podboy] ?=
"${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)} - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/rtmom_0.1.3.bb:PNBLACKLIST[rtmom] ?=
"Depends on blacklisted python-elementary - the recipe will be removed
on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] =
"Doesn't build after vala upgrade from 0.24.0 to 0.26.1 - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/spojegui_svn.bb:PNBLACKLIST[spojegui] ?=
"Runtime depends on blacklisted python-elementary - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/vagalume_0.8.5.bb:PNBLACKLIST[vagalume]
?= "Depends on blacklisted gstreamer - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompass]
= "Doesn't build after vala upgrade from 0.24.0 to 0.26.1 - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/games/aceofpenguins_1.4.bb:PNBLACKLIST[aceofpenguins]
?= "BROKEN: fails to build with new binutils-2.27 - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/games/mokoeightball_svn.bb:PNBLACKLIST[mokoeightball]
?= "Depends on blacklisted edje-native - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/games/mokoeightball_svn.bb:PNBLACKLIST[mokoeightball]
?= "Runtime depends on blacklisted mokoeightball-dev - the recipe will
be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/games/mokoeightball_svn.bb:PNBLACKLIST[mokoeightball]
?= "Runtime depends on blacklisted mokoeightball - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/games/mokomaze_0.5.5.bb:PNBLACKLIST[mokomaze] ?=
"Depends on blacklisted libsdl-ttf - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/games/mokomaze_0.5.5.bb:PNBLACKLIST[mokomaze] ?=
"Depends on blacklisted ode - the recipe will be removed on 2017-09-01
unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
?= "Runtime depends on blacklisted mokomaze - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
?= "Runtime depends on blacklisted dates - the recipe will be removed
on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
?= "Runtime depends on blacklisted dbus-daemon-proxy - the recipe will
be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
?= "Runtime depends on blacklisted guitartune - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
?= "Runtime depends on blacklisted illume-keyboard-default-numeric -
the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
?= "Runtime depends on blacklisted e-tasks - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
?= "Runtime depends on blacklisted enjoy - the recipe will be removed
on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
?= "Runtime depends on blacklisted mokojeweled - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
?= "Runtime depends on blacklisted estardict - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
?= "Runtime depends on blacklisted gpe-scap - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
?= "Runtime depends on blacklisted ffphonelog - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
?= "Runtime depends on blacklisted om-neon - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
?= "Runtime depends on blacklisted python-elementary - the recipe will
be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
?= "Runtime depends on blacklisted elfe - the recipe will be removed
on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
?= "Runtime depends on blacklisted vagalume - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-minimal.bb:PNBLACKLIST[packagegroup-shr-minimal]
?= "Runtime depends on blacklisted shr-wizard - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-minimal.bb:PNBLACKLIST[packagegroup-shr-minimal]
?= "Runtime depends on blacklisted terminology - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-minimal.bb:PNBLACKLIST[packagegroup-shr-minimal]
?= "Runtime depends on blacklisted packagegroup-shr-minimal - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-minimal.bb:PNBLACKLIST[packagegroup-shr-minimal]
?= "Runtime depends on blacklisted libphone-ui-shr - the recipe will
be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr-minimal.bb:PNBLACKLIST[packagegroup-shr-minimal]
?= "Runtime depends on blacklisted ffphonelog - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr.bb:PNBLACKLIST[packagegroup-shr]
?= "Runtime depends on blacklisted packagegroup-cli-tools-debug - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr.bb:PNBLACKLIST[packagegroup-shr]
?= "Runtime depends on blacklisted packagegroup-shr-minimal-cli - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr.bb:PNBLACKLIST[packagegroup-shr]
?= "Runtime depends on blacklisted packagegroup-cli-tools - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr.bb:PNBLACKLIST[packagegroup-shr]
?= "Runtime depends on blacklisted packagegroup-shr-minimal-apps - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/packagegroups/packagegroup-shr.bb:PNBLACKLIST[packagegroup-shr]
?= "Runtime depends on blacklisted vagalume - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/shr/e-wm-config-illume2-shr_git.bb:PNBLACKLIST[e-wm-config-illume2-shr]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130520/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/shr/libphone-ui-shr_git.bb:PNBLACKLIST[libphone-ui-shr]
?= "Depends on blacklisted elementary - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/shr/libphone-ui_git.bb:PNBLACKLIST[libphone-ui]
?= "Depends on blacklisted libfso-glib - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/shr/phonefsod_git.bb:PNBLACKLIST[phonefsod] ?=
"Depends on blacklisted libfso-glib - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/shr/phoneuid_git.bb:PNBLACKLIST[phoneuid] ?=
"Depends on blacklisted libfso-glib - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/shr/shr-e-gadgets_git.bb:PNBLACKLIST[shr-e-gadgets]
?= "Depends on blacklisted elementary - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/shr/shr-installer_git.bb:PNBLACKLIST[shr-installer]
?= "Depends on blacklisted packagekit - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/shr/shr-settings_git.bb:PNBLACKLIST[shr-settings]
?= "Runtime depends on blacklisted python-edbus - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/shr/shr-settings_git.bb:PNBLACKLIST[shr-settings]
?= "Runtime depends on blacklisted python-elementary - the recipe will
be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/shr/shr-wizard_git.bb:PNBLACKLIST[shr-wizard] ?=
"Depends on blacklisted e-wm - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/e-wm-theme-illume-gry_git.bb:PNBLACKLIST[e-wm-theme-illume-gry]
?= "Depends on blacklisted edje-native - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/e-wm-theme-illume-gry_git.bb:PNBLACKLIST[e-wm-theme-illume-gry]
?= "Runtime depends on blacklisted e-wm-theme-illume-gry - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/e-wm-theme-illume-gry_git.bb:PNBLACKLIST[e-wm-theme-illume-gry]
?= "Runtime depends on blacklisted e-wm-theme-illume-gry-dev - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/e-wm-theme-illume-gry_git.bb:PNBLACKLIST[e-wm-theme-illume-gry]
?= "Runtime depends on blacklisted elementary-theme-gry - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/e-wm-theme-illume-neo_git.bb:PNBLACKLIST[e-wm-theme-illume-neo]
?= "Runtime depends on blacklisted e-wm - the recipe will be removed
on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/e-wm-theme-illume-neo_git.bb:PNBLACKLIST[e-wm-theme-illume-neo]
?= "Runtime depends on blacklisted e-wm-theme-illume-neo-dev - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/e-wm-theme-illume-neo_git.bb:PNBLACKLIST[e-wm-theme-illume-neo]
?= "Runtime depends on blacklisted e-wm-theme-illume-neo - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/e-wm-theme-illume-niebiee_git.bb:PNBLACKLIST[e-wm-theme-illume-niebiee]
?= "Depends on blacklisted edje-native - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/e-wm-theme-illume-niebiee_git.bb:PNBLACKLIST[e-wm-theme-illume-niebiee]
?= "Runtime depends on blacklisted e-wm-theme-illume-niebiee - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/e-wm-theme-illume-niebiee_git.bb:PNBLACKLIST[e-wm-theme-illume-niebiee]
?= "Runtime depends on blacklisted e-wm-theme-illume-niebiee-dev - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/e-wm-theme-illume-shr_git.bb:PNBLACKLIST[e-wm-theme-illume-shr]
?= "Depends on blacklisted edje-native - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/e-wm-theme-illume-shr_git.bb:PNBLACKLIST[e-wm-theme-illume-shr]
?= "Runtime depends on blacklisted e-wm-theme-illume-shr-dev - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/e-wm-theme-illume-shr_git.bb:PNBLACKLIST[e-wm-theme-illume-shr]
?= "Runtime depends on blacklisted e-wm-theme-illume-shr - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/e-wm-theme-illume-sixteen_git.bb:PNBLACKLIST[e-wm-theme-illume-sixteen]
?= "Depends on blacklisted edje-native - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/e-wm-theme-illume-sixteen_git.bb:PNBLACKLIST[e-wm-theme-illume-sixteen]
?= "Runtime depends on blacklisted e-wm-theme-illume-sixteen - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/e-wm-theme-illume-sixteen_git.bb:PNBLACKLIST[e-wm-theme-illume-sixteen]
?= "Runtime depends on blacklisted e-wm-theme-illume-sixteen-dev - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/e-wm-theme-sowka_git.bb:PNBLACKLIST[e-wm-theme-sowka]
?= "Depends on blacklisted edje-native - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/e-wm-theme-sowka_git.bb:PNBLACKLIST[e-wm-theme-sowka]
?= "Runtime depends on blacklisted e-wm-theme-sowka-dev - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/e-wm-theme-sowka_git.bb:PNBLACKLIST[e-wm-theme-sowka]
?= "Runtime depends on blacklisted e-wm-theme-sowka - the recipe will
be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/elementary-theme-gry_git.bb:PNBLACKLIST[elementary-theme-gry]
?= "Depends on blacklisted edje-native - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/elementary-theme-gry_git.bb:PNBLACKLIST[elementary-theme-gry]
?= "Runtime depends on blacklisted elementary-theme-gry-dev - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/elementary-theme-gry_git.bb:PNBLACKLIST[elementary-theme-gry]
?= "Runtime depends on blacklisted e-wm-theme-illume-gry - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/elementary-theme-gry_git.bb:PNBLACKLIST[elementary-theme-gry]
?= "Runtime depends on blacklisted elementary-theme-gry - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/elementary-theme-neo_git.bb:PNBLACKLIST[elementary-theme-neo]
?= "Depends on blacklisted edje-native - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/elementary-theme-neo_git.bb:PNBLACKLIST[elementary-theme-neo]
?= "Runtime depends on blacklisted elementary-theme-neo - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/elementary-theme-neo_git.bb:PNBLACKLIST[elementary-theme-neo]
?= "Runtime depends on blacklisted elementary-theme-neo-dev - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/elementary-theme-niebiee_git.bb:PNBLACKLIST[elementary-theme-niebiee]
?= "Depends on blacklisted edje-native - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/elementary-theme-niebiee_git.bb:PNBLACKLIST[elementary-theme-niebiee]
?= "Runtime depends on blacklisted elementary-theme-niebiee - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/elementary-theme-niebiee_git.bb:PNBLACKLIST[elementary-theme-niebiee]
?= "Runtime depends on blacklisted elementary-theme-niebiee-dev - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/elementary-theme-o2_git.bb:PNBLACKLIST[elementary-theme-o2]
?= "Depends on blacklisted edje-native - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/elementary-theme-o2_git.bb:PNBLACKLIST[elementary-theme-o2]
?= "Runtime depends on blacklisted elementary-theme-o2-dev - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/elementary-theme-o2_git.bb:PNBLACKLIST[elementary-theme-o2]
?= "Runtime depends on blacklisted elementary-theme-o2 - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/elementary-theme-sixteen_git.bb:PNBLACKLIST[elementary-theme-sixteen]
?= "Depends on blacklisted edje-native - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/elementary-theme-sixteen_git.bb:PNBLACKLIST[elementary-theme-sixteen]
?= "Runtime depends on blacklisted elementary-theme-sixteen-dev - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/elementary-theme-sixteen_git.bb:PNBLACKLIST[elementary-theme-sixteen]
?= "Runtime depends on blacklisted elementary-theme-sixteen - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/elementary-theme-sowka_git.bb:PNBLACKLIST[elementary-theme-sowka]
?= "Depends on blacklisted edje-native - the recipe will be removed on
2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/elementary-theme-sowka_git.bb:PNBLACKLIST[elementary-theme-sowka]
?= "Runtime depends on blacklisted elementary-theme-sowka-dev - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/elementary-theme-sowka_git.bb:PNBLACKLIST[elementary-theme-sowka]
?= "Runtime depends on blacklisted elementary-theme-sowka - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/gtk-theme-clearlooks-gtkrc.bb:PNBLACKLIST[gtk-theme-clearlooks-gtkrc]
?= "Runtime depends on blacklisted gtk-theme-clearlooks - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/gtk-theme-clearlooks-gtkrc.bb:PNBLACKLIST[gtk-theme-clearlooks-gtkrc]
?= "Runtime depends on blacklisted gtk-theme-clearlooks-gtkrc-dev -
the recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/icon-theme-neo_git.bb:PNBLACKLIST[icon-theme-neo]
?= "Runtime depends on blacklisted e-wm - the recipe will be removed
on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/icon-theme-neo_git.bb:PNBLACKLIST[icon-theme-neo]
?= "Runtime depends on blacklisted icon-theme-neo-dev - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/phoneui-shr-theme-neo_git.bb:PNBLACKLIST[phoneui-shr-theme-neo]
?= "Runtime depends on blacklisted libphone-ui-shr - the recipe will
be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/phoneui-shr-theme-neo_git.bb:PNBLACKLIST[phoneui-shr-theme-neo]
?= "Runtime depends on blacklisted phoneui-shr-theme-neo-dev - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/phoneui-shr-theme-niebiee_git.bb:PNBLACKLIST[phoneui-shr-theme-niebiee]
?= "Runtime depends on blacklisted libphone-ui-shr - the recipe will
be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/phoneui-shr-theme-o2_git.bb:PNBLACKLIST[phoneui-shr-theme-o2]
?= "Runtime depends on blacklisted libphone-ui-shr - the recipe will
be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/phoneui-shr-theme-sowka_git.bb:PNBLACKLIST[phoneui-shr-theme-sowka]
?= "Runtime depends on blacklisted libphone-ui-shr - the recipe will
be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/shr-theme-efenniht.bb:PNBLACKLIST[shr-theme-efenniht]
?= "Runtime depends on blacklisted e-wm-theme-illume-efenniht - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/shr-theme-gry.bb:PNBLACKLIST[shr-theme-gry]
?= "Runtime depends on blacklisted e-wm-theme-illume-gry - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/shr-theme-gry.bb:PNBLACKLIST[shr-theme-gry]
?= "Runtime depends on blacklisted elementary-theme-gry - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/shr-theme-neo.bb:PNBLACKLIST[shr-theme-neo]
?= "Runtime depends on blacklisted shr-theme-neo-dev - the recipe will
be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/shr-theme-neo.bb:PNBLACKLIST[shr-theme-neo]
?= "Runtime depends on blacklisted shr-theme-neo - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/shr-theme-neo.bb:PNBLACKLIST[shr-theme-neo]
?= "Runtime depends on blacklisted e-wm-theme-illume-neo - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/shr-theme-niebiee.bb:PNBLACKLIST[shr-theme-niebiee]
?= "Runtime depends on blacklisted phoneui-shr-theme-niebiee - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/shr-theme-niebiee.bb:PNBLACKLIST[shr-theme-niebiee]
?= "Runtime depends on blacklisted shr-theme-niebiee - the recipe will
be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/shr-theme-niebiee.bb:PNBLACKLIST[shr-theme-niebiee]
?= "Runtime depends on blacklisted shr-theme-niebiee-dev - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/shr-theme-o2.bb:PNBLACKLIST[shr-theme-o2]
?= "Runtime depends on blacklisted phoneui-shr-theme-o2 - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/shr-theme-o2.bb:PNBLACKLIST[shr-theme-o2]
?= "Runtime depends on blacklisted shr-theme-o2 - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/shr-theme-o2.bb:PNBLACKLIST[shr-theme-o2]
?= "Runtime depends on blacklisted shr-theme-o2-dev - the recipe will
be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/shr-theme-sixteen.bb:PNBLACKLIST[shr-theme-sixteen]
?= "Runtime depends on blacklisted e-wm-theme-illume-sixteen - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/shr-theme-sixteen.bb:PNBLACKLIST[shr-theme-sixteen]
?= "Runtime depends on blacklisted shr-theme-sixteen-dev - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/shr-theme-sixteen.bb:PNBLACKLIST[shr-theme-sixteen]
?= "Runtime depends on blacklisted shr-theme-sixteen - the recipe will
be removed on 2017-09-01 unless the issue is fixed"
meta-shr/recipes-shr/themes/shr-theme-sixteen.bb:PNBLACKLIST[shr-theme-sixteen]
?= "Runtime depends on blacklisted elementary-theme-sixteen - the
recipe will be removed on 2017-09-01 unless the issue is fixed"
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


count: 1	issue: textrel
corosync-2.4.0: ELF binary
'/tmp/work/core2-64-oe-linux/corosync/2.4.0-r0/packages-split/corosync/usr/sbin/corosync'
has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 12	issue: version-going-backwards
gpm-1.99.7: Package version for package gpm-dbg went backwards which
would break package feeds from
(0:1.99.7+git1fd19417b8a4dd9945347e98dfa97e4cfd798d77-r2.1 to
0:1.99.7-r2.14) [version-going-backwards]
gpm-1.99.7: Package version for package gpm-dev went backwards which
would break package feeds from
(0:1.99.7+git1fd19417b8a4dd9945347e98dfa97e4cfd798d77-r2.1 to
0:1.99.7-r2.14) [version-going-backwards]
gpm-1.99.7: Package version for package gpm-doc went backwards which
would break package feeds from
(0:1.99.7+git1fd19417b8a4dd9945347e98dfa97e4cfd798d77-r2.1 to
0:1.99.7-r2.14) [version-going-backwards]
gpm-1.99.7: Package version for package gpm-locale went backwards
which would break package feeds from
(0:1.99.7+git1fd19417b8a4dd9945347e98dfa97e4cfd798d77-r2.1 to
0:1.99.7-r2.14) [version-going-backwards]
gpm-1.99.7: Package version for package gpm-staticdev went backwards
which would break package feeds from
(0:1.99.7+git1fd19417b8a4dd9945347e98dfa97e4cfd798d77-r2.1 to
0:1.99.7-r2.14) [version-going-backwards]
gpm-1.99.7: Package version for package gpm went backwards which would
break package feeds from
(0:1.99.7+git1fd19417b8a4dd9945347e98dfa97e4cfd798d77-r2.1 to
0:1.99.7-r2.14) [version-going-backwards]
libqb-0.17.2+gitAUTOINC+bd2c587f6c: Package version for package
libqb-dbg went backwards which would break package feeds from
(0:1.0.1+git0+0a329683a7-r0.0 to 0:0.17.2+git0+bd2c587f6c-r0.1)
[version-going-backwards]
libqb-0.17.2+gitAUTOINC+bd2c587f6c: Package version for package
libqb-dev went backwards which would break package feeds from
(0:1.0.1+git0+0a329683a7-r0.0 to 0:0.17.2+git0+bd2c587f6c-r0.1)
[version-going-backwards]
libqb-0.17.2+gitAUTOINC+bd2c587f6c: Package version for package
libqb-doc went backwards which would break package feeds from
(0:1.0.1+git0+0a329683a7-r0.0 to 0:0.17.2+git0+bd2c587f6c-r0.1)
[version-going-backwards]
libqb-0.17.2+gitAUTOINC+bd2c587f6c: Package version for package
libqb-locale went backwards which would break package feeds from
(0:1.0.1+git0+0a329683a7-r0.0 to 0:0.17.2+git0+bd2c587f6c-r0.1)
[version-going-backwards]
libqb-0.17.2+gitAUTOINC+bd2c587f6c: Package version for package
libqb-staticdev went backwards which would break package feeds from
(0:1.0.1+git0+0a329683a7-r0.0 to 0:0.17.2+git0+bd2c587f6c-r0.1)
[version-going-backwards]
libqb-0.17.2+gitAUTOINC+bd2c587f6c: Package version for package libqb
went backwards which would break package feeds from
(0:1.0.1+git0+0a329683a7-r0.0 to 0:0.17.2+git0+bd2c587f6c-r0.1)
[version-going-backwards]


count: 0	issue: host-user-contaminated


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path



== Tested changes (not included in master yet) - bitbake ==
latest upstream commit:
58a0353 fetch2: Do not fail to create symbolic links if they already exist
not included in master yet:
223b8cb world-image: add extra target

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
3b7111b automake: Adjust shebang lines to remove interpreter path hardcode
not included in master yet:
96827a3 qemux86: Add identical qemux86copy variant for tests
029268a sstate-sysroot-cruft.sh: Extend the whitelist
f375076 recipes: Replace "cp -a" with "cp -R --no-dereference
--preserve=mode,links"
50aaf6c buildhistory.bbclass: metadata-revs show repo parent
bf5c6c0 metadata-revs: provide more information
12412b6 report-error: Allow to upload reports automatically
34bd10c Revert "mesa: Contain configure search for llvm"
c6b7628 sstate-diff-machines.sh: Replace MACHINE_ARCH only at the
beginning and separated with dash
c76772d x86-base.inc, qemuarm.conf: prefer 4.10 version of linux-yocto

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
56c233b meta-efl: blacklist efl-native and dependent recipes
not included in master yet:
48fe7d3 dnsmasq: disable the service by default
4fc0aaf ctdb: Fix build with musl
b906176 libdnet: update SRC_URI
6f1d95f wireless-regdb: fix crda failing from missing pubkey
9146958 ntp: update to 4.2.8.p10
305c802 netcat-openbsd: Fix build and whitelist
f37cbbb v4l-utils: Depend on argp-standalone for musl
9bf6a50 caps: Use c99 int types
0956842 lvm2: Fix patch errors found with musl
a713300 squid: Update to 3.5.23
497babe xfce4-closebutton-plugin: Fix build with clang
a8f34fc xfce4-timer-plugin: Fix build when security flags are enabled with clang
a2f6b7f tcsh: Update to 6.20.00 release
37cf3b7 libnfnetlink: Backport patches to fix musl build
c079900 ebtables: Fix build with musl
3b265a7 poco: Upgrade to 1.7.8
0abe3f0 mariadb: Do not use ucontext_* APIs with musl
932afe3 lowpan-tools: Fix build with musl
2e9f4c1 usb-modeswitch-data: Add dep on native tcl
9122654 aufs-util: Define HOSTCC
2ba6384 libraw1394: Update to 2.1.2 release
bc26ab1 libdc1394: Update to 2.2.5+
f14de54 ntfs-3g-ntfsprogs: Upgrade to 2017.3.23
55857ba openl2tp: Fix build with musl
361a4d8 rp-pppoe: Fix build with musl
5c10c68 vsftpd: Fix build with musl
279058d faac: Fix with with security flags and on musl
81f131d dibbler: Upgrade to 1.0.2RC1
fe83470 live555: Do not use XLOCALE on musl
f36dca7 libgxim: Fix build with security flags turned on
ec86e26 vpnc: Update to build from github SRC_URI
3f41479 daq: Fix build with musl
24b911e utouch: Fix build on musl
bb08df7 libavc1394: Add libargp on musl
a6573b3 picocom: Upgrade to 2.2
20ce8ae libexecinfo: Add recipe
338ed98 arptables: Upgrade to 0.0.4
35c14c7 libnetfilter-log: Switch to git URI
de59d4b lxdm: Find libexecinfo if its on platform
5a91fcc libnetfilter-queue: Update to git for SRC_URI
8c898b9 libunique: Fix build with secutiy flags on
8f41510 snort: Fix build with musl
74b43dc pavucontrol: Backport patches to build with c++11 std
7460779 networkmanager: Fix build on musl
10aa746 autofs: Patch to build on musl
9116fa3 jsonrpc: Backport and create patches to build with musl
fe78924 xdebug: 2.2.6 -> 2.5.1
e9690ad python-smbus: upgrade to 3.1.2
4d9e107 opencv: remove redundant build dependency on python2
0c20c4a flite-alsa: Blacklist as old and unmaintained
cf19ea3 logfsprogs: Blacklist, doesn't have proper PV, doesn't respect LDFLAGS
5089798 pngcheck: respect LDFLAGS
7a04e2a uml-utilities: respect LDFLAGS not only for mconsole but for
other binaries as well
f3e0c03 xdotool: prevent compile-host-path QA issues
4633a7f recipes: add removal date to PNBLACKLIST messages
82d426c dlm: fix ldflags QA warning

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
ff073f0 nativesdk-qtbase: pass -no-icu for deterministic builds
not included in master yet:
b35dc32 qtbase-native: create empty oe-device-extra.pri
aa45f48 qtwayland: update build without xkbcommon-evdev
a126a5a Revert "qtbase-native: create empty oe-device-extra.pri"
d3ea645 qtbase-native: create empty oe-device-extra.pri
dad7fae qtchooser: respect LDFLAGS

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
021a954 chromium-browser: add missing dependency on gperf-native
not included in master yet:
a9dd704 chromium: disable generate_character_data for x86

== Tested changes (not included in master yet) - meta-webos-ports ==
latest upstream commit:
4d4ffcb packagegroup-luneos-extended: drop qtscenegraph-adaptation
not included in master yet:

== Tested changes (not included in master yet) - meta-smartphone ==
latest upstream commit:
e39c265 android-system-image: fix builds that don't have overlay-libs
not included in master yet:
4fa2b8b meta-shr, meta-fso: blacklist recipes depending on blacklisted
efl-native
e779eff pycd: respect LDFLAGS
30f1d87 suspend-blocker: respect LDFLAGS
683371b recipes: add removal date to PNBLACKLIST messages
76e0d38 meta-openmoko: remove fbreader bbappend to drop meta-gpe dependency

--001a114b41e482f0f9054c67f23a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre class=3D"gmail-console-output" style=3D"box-sizing:bo=
rder-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bo=
ttom:0px;color:rgb(51,51,51);font-size:14px">=3D=3D Number of issues - stat=
s =3D=3D
{| class=3D&#39;wikitable&#39;
!|Date		     !!colspan=3D&#39;3&#39;|Failed tasks			    !!colspan=3D&#39;6&=
#39;|Failed depencencies			 !!|Signatures		  !!colspan=3D&#39;14&#39;|QA !!=
Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||qemuarm||max||min	||qemux86||max||mi=
n	||all 	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||=
version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||u=
nknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	=
||ldflags	||compile-host-path	||=09
|-
||2017-04-04	||0	||0	||0	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||0		=
||1		||0		||0		||12		||0		||0		||0		||0		||0		||0		||0		||0		||=09
|}

<a href=3D"http://www.openembedded.org/wiki/Bitbake_World_Status" style=3D"=
box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://www=
.openembedded.org/wiki/Bitbake_World_Status</a>

=3D=3D Failed tasks 2017-04-04 =3D=3D

INFO: jenkins-job.sh-1.8.20 Complete log available at <a href=3D"http://log=
s.nslu2-linux.org/buildlogs/oe/world/pyro/log.report.20170404_201718.log" s=
tyle=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">ht=
tp://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.report.20170404_20171=
8.log</a>

=3D=3D=3D common () =3D=3D=3D

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (0) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 0	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/pyro/log.world.qemuarm.20170404_030425.log/" style=3D"box-sizing:border=
-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.org=
/buildlogs/oe/world/pyro/log.world.qemuarm.20170404_030425.log/</a> ||=20
|-
|| qemux86 	|| 0	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/pyro/log.world.qemux86.20170404_102249.log/" style=3D"box-sizing:border=
-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.org=
/buildlogs/oe/world/pyro/log.world.qemux86.20170404_102249.log/</a> ||=20
|-
|| qemux86_64 	|| 0	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe=
/world/pyro/log.world.qemux86-64.20170404_120149.log/" style=3D"box-sizing:=
border-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.world.qemux86-64.20170404_120149.log/</a=
> ||=20
|}

=3D=3D=3D PNBLACKLISTs (443) =3D=3D=3D

=3D=3D=3D QA issues (13) =3D=3D=3D
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
||0	||unknown-configure-option
|-
||12	||version-going-backwards
|-
||1	||textrel
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.signatures.20170403_105437.log/" style=3D"box-sizing:border-box;word-=
wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.org/buildlogs=
/oe/world/pyro/log.signatures.20170403_105437.log/</a>

No issues detected
</pre><div><br></div><div><pre class=3D"gmail-console-output" style=3D"box-=
sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;=
margin-bottom:0px;color:rgb(51,51,51);font-size:14px">PNBLACKLISTs:
openembedded-core/:
meta-browser:
recipes-browser/chromium/cef3_280796.bb:PNBLACKLIST[cef3] ?=3D &quot;BROKEN=
: fails to build with gcc-6&quot;
meta-openembedded:
meta-efl/recipes-devtools/python/python-edbus_1.7.0.bb:PNBLACKLIST[python-e=
dbus] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproj=
ect.org/Errors/Details/130600/" style=3D"box-sizing:border-box;word-wrap:br=
eak-word;color:rgb(92,53,102)">http://errors.yoctoproject.org/Errors/Detail=
s/130600/</a> - the recipe will be removed on 2017-09-01 unless the issue i=
s fixed&quot;
meta-efl/recipes-devtools/python/python-efl_1.15.0.bb:PNBLACKLIST[python-ef=
l] ?=3D &quot;Depends on blacklisted elementary - the recipe will be remove=
d on 2017-09-01 unless the issue is fixed&quot;
meta-efl/recipes-devtools/python/python-efl_git.bb:PNBLACKLIST[python-efl] =
?=3D &quot;Depends on blacklisted elementary - the recipe will be removed o=
n 2017-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/e17/cpu_svn.bb:PNBLACKLIST[cpu] ?=3D &quot;Depends on =
blacklisted e-wm - the recipe will be removed on 2017-09-01 unless the issu=
e is fixed&quot;
meta-efl/recipes-efl/e17/diskio_svn.bb:PNBLACKLIST[diskio] ?=3D &quot;broke=
n: switch to <a href=3D"https://git.enlightenment.org/enlightenment/modules=
/diskio.git/" style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb=
(92,53,102)">https://git.enlightenment.org/enlightenment/modules/diskio.git=
/</a> and fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.e=
dc:58. invalid state name: &#39;off&#39;. &quot;default&quot; state must al=
ways be first. - the recipe will be removed on 2017-09-01 unless the issue =
is fixed&quot;
meta-efl/recipes-efl/e17/e-tasks_git.bb:PNBLACKLIST[e-tasks] ?=3D &quot;Dep=
ends on blacklisted elementary - the recipe will be removed on 2017-09-01 u=
nless the issue is fixed&quot;
meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb:PNBLACKLIST[e-wm-theme-b=
-and-w] ?=3D &quot;Runtime depends on blacklisted e-wm - the recipe will be=
 removed on 2017-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb:PNBLACKLIST[e-wm-theme-b=
-and-w] ?=3D &quot;Runtime depends on blacklisted e-wm-theme-b-and-w - the =
recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb:PNBLACKLIST[e-wm-theme-b=
-and-w] ?=3D &quot;Runtime depends on blacklisted e-wm-theme-b-and-w-dev - =
the recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb:PNBLACKLIST[e-wm=
-theme-illume-efenniht] ?=3D &quot;Runtime depends on blacklisted e-wm - th=
e recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb:PNBLACKLIST[e-wm=
-theme-illume-efenniht] ?=3D &quot;Runtime depends on blacklisted e-wm-them=
e-illume-efenniht - the recipe will be removed on 2017-09-01 unless the iss=
ue is fixed&quot;
meta-efl/recipes-efl/e17/e-wm_0.18.8.bb:PNBLACKLIST[e-wm] ?=3D &quot;Depend=
s on blacklisted elementary - the recipe will be removed on 2017-09-01 unle=
ss the issue is fixed&quot;
meta-efl/recipes-efl/e17/e-wm_0.19.10.bb:PNBLACKLIST[e-wm] ?=3D &quot;Depen=
ds on blacklisted elementary - the recipe will be removed on 2017-09-01 unl=
ess the issue is fixed&quot;
meta-efl/recipes-efl/e17/e-wm_git.bb:PNBLACKLIST[e-wm] ?=3D &quot;Depends o=
n blacklisted elementary - the recipe will be removed on 2017-09-01 unless =
the issue is fixed&quot;
meta-efl/recipes-efl/e17/edje-viewer_svn.bb:PNBLACKLIST[edje-viewer] ?=3D &=
quot;Depends on blacklisted elementary - the recipe will be removed on 2017=
-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/e17/elbow_git.bb:PNBLACKLIST[elbow] ?=3D &quot;Depends=
 on blacklisted webkit-efl - the recipe will be removed on 2017-09-01 unles=
s the issue is fixed&quot;
meta-efl/recipes-efl/e17/elfe_git.bb:PNBLACKLIST[elfe] ?=3D &quot;Depends o=
n blacklisted elementary - the recipe will be removed on 2017-09-01 unless =
the issue is fixed&quot;
meta-efl/recipes-efl/e17/elmdentica_svn.bb:PNBLACKLIST[elmdentica] ?=3D &qu=
ot;OLD and depends on broken azy - the recipe will be removed on 2017-09-01=
 unless the issue is fixed&quot;
meta-efl/recipes-efl/e17/emprint_svn.bb:PNBLACKLIST[emprint] ?=3D &quot;if =
you want to use these modules with E18, then you need to update it to git r=
ecipe fetching newer sources from <a href=3D"http://git.enlightenment.org/a=
pps/emprint.git/" style=3D"box-sizing:border-box;word-wrap:break-word;color=
:rgb(92,53,102)">http://git.enlightenment.org/apps/emprint.git/</a> - the r=
ecipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/e17/enjoy_git.bb:PNBLACKLIST[enjoy] ?=3D &quot;Depends=
 on blacklisted elementary - the recipe will be removed on 2017-09-01 unles=
s the issue is fixed&quot;
meta-efl/recipes-efl/e17/ephoto_svn.bb:PNBLACKLIST[ephoto] ?=3D &quot;Depen=
ds on blacklisted elementary - the recipe will be removed on 2017-09-01 unl=
ess the issue is fixed&quot;
meta-efl/recipes-efl/e17/exalt-client_svn.bb:PNBLACKLIST[exalt-client] ?=3D=
 &quot;Depends on blacklisted elementary - the recipe will be removed on 20=
17-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/e17/exalt_svn.bb:PNBLACKLIST[exalt] ?=3D &quot;Depends=
 on blacklisted elementary - the recipe will be removed on 2017-09-01 unles=
s the issue is fixed&quot;
meta-efl/recipes-efl/e17/exquisite-theme-illume.bb:PNBLACKLIST[exquisite-th=
eme-illume] ?=3D &quot;Depends on blacklisted edje-native - the recipe will=
 be removed on 2017-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/e17/exquisite-theme-illume.bb:PNBLACKLIST[exquisite-th=
eme-illume] ?=3D &quot;Runtime depends on blacklisted exquisite-theme-illum=
e - the recipe will be removed on 2017-09-01 unless the issue is fixed&quot=
;
meta-efl/recipes-efl/e17/exquisite-theme-illume.bb:PNBLACKLIST[exquisite-th=
eme-illume] ?=3D &quot;Runtime depends on blacklisted exquisite-theme-illum=
e-dev - the recipe will be removed on 2017-09-01 unless the issue is fixed&=
quot;
meta-efl/recipes-efl/e17/exquisite_svn.bb:PNBLACKLIST[exquisite] ?=3D &quot=
;Fails to build with RSS <a href=3D"http://errors.yoctoproject.org/Errors/D=
etails/130619/" style=3D"box-sizing:border-box;word-wrap:break-word;color:r=
gb(92,53,102)">http://errors.yoctoproject.org/Errors/Details/130619/</a> - =
the recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/e17/flame_svn.bb:PNBLACKLIST[flame] ?=3D &quot;Depends=
 on blacklisted e-wm - the recipe will be removed on 2017-09-01 unless the =
issue is fixed&quot;
meta-efl/recipes-efl/e17/forecasts_svn.bb:PNBLACKLIST[forecasts] ?=3D &quot=
;Depends on blacklisted e-wm - the recipe will be removed on 2017-09-01 unl=
ess the issue is fixed&quot;
meta-efl/recipes-efl/e17/news_svn.bb:PNBLACKLIST[news] ?=3D &quot;if you wa=
nt to use these modules with E18, then you need to update it to git recipe =
fetching newer sources from <a href=3D"http://git.enlightenment.org/enlight=
enment/modules/news.git/" style=3D"box-sizing:border-box;word-wrap:break-wo=
rd;color:rgb(92,53,102)">http://git.enlightenment.org/enlightenment/modules=
/news.git/</a> - the recipe will be removed on 2017-09-01 unless the issue =
is fixed&quot;
meta-efl/recipes-efl/e17/places_svn.bb:PNBLACKLIST[places] ?=3D &quot;Depen=
ds on blacklisted e-wm - the recipe will be removed on 2017-09-01 unless th=
e issue is fixed&quot;
meta-efl/recipes-efl/e17/rage_svn.bb:PNBLACKLIST[rage] ?=3D &quot;if you wa=
nt to use these modules with E18, then you need to update it to git recipe =
fetching newer sources from  <a href=3D"http://git.enlightenment.org/apps/r=
age.git/" style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,=
53,102)">http://git.enlightenment.org/apps/rage.git/</a> - the recipe will =
be removed on 2017-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/e17/rain_svn.bb:PNBLACKLIST[rain] ?=3D &quot;Depends o=
n blacklisted e-wm - the recipe will be removed on 2017-09-01 unless the is=
sue is fixed&quot;
meta-efl/recipes-efl/e17/screenshot_svn.bb:PNBLACKLIST[screenshot] ?=3D &qu=
ot;depends on blacklisted emprint - the recipe will be removed on 2017-09-0=
1 unless the issue is fixed&quot;
meta-efl/recipes-efl/e17/terminology_0.9.1.bb:PNBLACKLIST[terminology] ?=3D=
 &quot;Depends on blacklisted elementary - the recipe will be removed on 20=
17-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/e17/uptime_svn.bb:PNBLACKLIST[uptime] ?=3D &quot;Depen=
ds on blacklisted e-wm - the recipe will be removed on 2017-09-01 unless th=
e issue is fixed&quot;
meta-efl/recipes-efl/efl/azy_svn.bb:PNBLACKLIST[azy] ?=3D &quot;OLD and doe=
sn&#39;t build with gcc-5 - the recipe will be removed on 2017-09-01 unless=
 the issue is fixed&quot;
meta-efl/recipes-efl/efl/edbus_1.7.9.bb:PNBLACKLIST[edbus] ?=3D &quot;Depen=
ds on blacklisted ecore - the recipe will be removed on 2017-09-01 unless t=
he issue is fixed&quot;
meta-efl/recipes-efl/efl/edbus_1.7.9.bb:PNBLACKLIST[edbus] ?=3D &quot;Depen=
ds on blacklisted eina - the recipe will be removed on 2017-09-01 unless th=
e issue is fixed&quot;
meta-efl/recipes-efl/efl/edbus_1.7.9.bb:PNBLACKLIST[edbus] ?=3D &quot;Runti=
me depends on blacklisted edbus - the recipe will be removed on 2017-09-01 =
unless the issue is fixed&quot;
meta-efl/recipes-efl/efl/edbus_1.7.9.bb:PNBLACKLIST[edbus] ?=3D &quot;Runti=
me depends on blacklisted edbus-dev - the recipe will be removed on 2017-09=
-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/efl/efl.inc:PNBLACKLIST[efl] ?=3D &quot;Depends on bro=
ken efl-native - the recipe will be removed on 2017-09-01 unless the issue =
is fixed&quot;
meta-efl/recipes-efl/efl/efl.inc:PNBLACKLIST[efl-native] ?=3D &quot;Broken:=
 fails to build with <a href=3D"http://errors.yoctoproject.org/Errors/Detai=
ls/138240/" style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(9=
2,53,102)">http://errors.yoctoproject.org/Errors/Details/138240/</a> - the =
recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb:PNBLACKLIST[eleme=
ntary-theme-efenniht] ?=3D &quot;Depends on blacklisted edje-native - the r=
ecipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb:PNBLACKLIST[eleme=
ntary-theme-efenniht] ?=3D &quot;Runtime depends on blacklisted elementary-=
theme-efenniht - the recipe will be removed on 2017-09-01 unless the issue =
is fixed&quot;
meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb:PNBLACKLIST[eleme=
ntary-theme-efenniht] ?=3D &quot;Runtime depends on blacklisted elementary-=
theme-efenniht-dev - the recipe will be removed on 2017-09-01 unless the is=
sue is fixed&quot;
meta-efl/recipes-efl/efl/elementary_1.15.1.bb:PNBLACKLIST[elementary] ?=3D =
&quot;Fails to build with RSS <a href=3D"http://errors.yoctoproject.org/Err=
ors/Details/130584/" style=3D"box-sizing:border-box;word-wrap:break-word;co=
lor:rgb(92,53,102)">http://errors.yoctoproject.org/Errors/Details/130584/</=
a> - the recipe will be removed on 2017-09-01 unless the issue is fixed&quo=
t;
meta-efl/recipes-efl/efl/emotion-generic-players_1.15.0.bb:PNBLACKLIST[emot=
ion-generic-players] ?=3D &quot;Depends on blacklisted emotion - the recipe=
 will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/efl/emotion-generic-players_1.15.0.bb:PNBLACKLIST[emot=
ion-generic-players] ?=3D &quot;Runtime depends on blacklisted emotion-gene=
ric-players - the recipe will be removed on 2017-09-01 unless the issue is =
fixed&quot;
meta-efl/recipes-efl/efl/emotion-generic-players_1.15.0.bb:PNBLACKLIST[emot=
ion-generic-players] ?=3D &quot;Runtime depends on blacklisted emotion-gene=
ric-players-dev - the recipe will be removed on 2017-09-01 unless the issue=
 is fixed&quot;
meta-efl/recipes-efl/efl/engrave_svn.bb:PNBLACKLIST[engrave] ?=3D &quot;BRO=
KEN: fails to build with latest oe-core - the recipe will be removed on 201=
7-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/efl/entrance_svn.bb:PNBLACKLIST[entrance] ?=3D &quot;b=
roken: switch to <a href=3D"https://git.enlightenment.org/misc/entrance.git=
" style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)"=
>https://git.enlightenment.org/misc/entrance.git</a> and fix 0.0.4+svnr8207=
0-r7/entrance/data/themes/old/default.edc:678. invalid state name: &#39;def=
aault&#39;. &quot;default&quot; state must always be first. - the recipe wi=
ll be removed on 2017-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/efl/epdf_svn.bb:PNBLACKLIST[epdf] ?=3D &quot;Depends o=
n blacklisted ecore - the recipe will be removed on 2017-09-01 unless the i=
ssue is fixed&quot;
meta-efl/recipes-efl/efl/epdf_svn.bb:PNBLACKLIST[epdf] ?=3D &quot;Depends o=
n blacklisted evas - the recipe will be removed on 2017-09-01 unless the is=
sue is fixed&quot;
meta-efl/recipes-efl/efl/epdf_svn.bb:PNBLACKLIST[epdf] ?=3D &quot;Runtime d=
epends on blacklisted epdf-dev - the recipe will be removed on 2017-09-01 u=
nless the issue is fixed&quot;
meta-efl/recipes-efl/efl/epdf_svn.bb:PNBLACKLIST[epdf] ?=3D &quot;Runtime d=
epends on blacklisted epdf - the recipe will be removed on 2017-09-01 unles=
s the issue is fixed&quot;
meta-efl/recipes-efl/efl/evas-generic-loaders_1.15.0.bb:PNBLACKLIST[evas-ge=
neric-loaders] ?=3D &quot;Depends on blacklisted eina - the recipe will be =
removed on 2017-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/efl/evas-generic-loaders_1.15.0.bb:PNBLACKLIST[evas-ge=
neric-loaders] ?=3D &quot;Runtime depends on blacklisted evas-generic-loade=
rs - the recipe will be removed on 2017-09-01 unless the issue is fixed&quo=
t;
meta-efl/recipes-efl/efl/evas-generic-loaders_1.15.0.bb:PNBLACKLIST[evas-ge=
neric-loaders] ?=3D &quot;Runtime depends on blacklisted evas-generic-loade=
rs-dev - the recipe will be removed on 2017-09-01 unless the issue is fixed=
&quot;
meta-efl/recipes-efl/efl/expedite_1.7.9.bb:PNBLACKLIST[expedite] ?=3D &quot=
;Depends on blacklisted eet - the recipe will be removed on 2017-09-01 unle=
ss the issue is fixed&quot;
meta-efl/recipes-efl/efl/expedite_1.7.9.bb:PNBLACKLIST[expedite] ?=3D &quot=
;Depends on blacklisted evas - the recipe will be removed on 2017-09-01 unl=
ess the issue is fixed&quot;
meta-efl/recipes-efl/efl/expedite_1.7.9.bb:PNBLACKLIST[expedite] ?=3D &quot=
;Runtime depends on blacklisted evas-loader-png - the recipe will be remove=
d on 2017-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/efl/expedite_1.7.9.bb:PNBLACKLIST[expedite] ?=3D &quot=
;Runtime depends on blacklisted expedite - the recipe will be removed on 20=
17-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/efl/expedite_1.7.9.bb:PNBLACKLIST[expedite] ?=3D &quot=
;Runtime depends on blacklisted expedite-themes - the recipe will be remove=
d on 2017-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/efl/expedite_1.7.9.bb:PNBLACKLIST[expedite] ?=3D &quot=
;Runtime depends on blacklisted evas-engine-gl-x11 - the recipe will be rem=
oved on 2017-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/efl/expedite_1.7.9.bb:PNBLACKLIST[expedite] ?=3D &quot=
;Runtime depends on blacklisted evas-engine-software-generic - the recipe w=
ill be removed on 2017-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/efl/expedite_1.7.9.bb:PNBLACKLIST[expedite] ?=3D &quot=
;Runtime depends on blacklisted expedite-dev - the recipe will be removed o=
n 2017-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/efl/expedite_1.7.9.bb:PNBLACKLIST[expedite] ?=3D &quot=
;Runtime depends on blacklisted evas-engine-software-x11 - the recipe will =
be removed on 2017-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/efl/expedite_1.7.9.bb:PNBLACKLIST[expedite] ?=3D &quot=
;Runtime depends on blacklisted evas-engine-fb - the recipe will be removed=
 on 2017-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/efl/expedite_git.bb:PNBLACKLIST[expedite] ?=3D &quot;D=
epends on blacklisted eet - the recipe will be removed on 2017-09-01 unless=
 the issue is fixed&quot;
meta-efl/recipes-efl/efl/expedite_git.bb:PNBLACKLIST[expedite] ?=3D &quot;D=
epends on blacklisted evas - the recipe will be removed on 2017-09-01 unles=
s the issue is fixed&quot;
meta-efl/recipes-efl/efl/expedite_git.bb:PNBLACKLIST[expedite] ?=3D &quot;R=
untime depends on blacklisted evas-loader-png - the recipe will be removed =
on 2017-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/efl/expedite_git.bb:PNBLACKLIST[expedite] ?=3D &quot;R=
untime depends on blacklisted expedite - the recipe will be removed on 2017=
-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/efl/expedite_git.bb:PNBLACKLIST[expedite] ?=3D &quot;R=
untime depends on blacklisted evas-engine-software-generic - the recipe wil=
l be removed on 2017-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/efl/expedite_git.bb:PNBLACKLIST[expedite] ?=3D &quot;R=
untime depends on blacklisted evas-engine-fb - the recipe will be removed o=
n 2017-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/efl/expedite_git.bb:PNBLACKLIST[expedite] ?=3D &quot;R=
untime depends on blacklisted evas-engine-software-x11 - the recipe will be=
 removed on 2017-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/efl/expedite_git.bb:PNBLACKLIST[expedite] ?=3D &quot;R=
untime depends on blacklisted evas-engine-gl-x11 - the recipe will be remov=
ed on 2017-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/efl/expedite_git.bb:PNBLACKLIST[expedite] ?=3D &quot;R=
untime depends on blacklisted expedite-dev - the recipe will be removed on =
2017-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/efl/expedite_git.bb:PNBLACKLIST[expedite] ?=3D &quot;R=
untime depends on blacklisted expedite-themes - the recipe will be removed =
on 2017-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/efl/libeflvala_svn.bb:PNBLACKLIST[libeflvala] ?=3D &qu=
ot;Depends on blacklisted elementary - the recipe will be removed on 2017-0=
9-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/efl/libeweather_svn.bb:PNBLACKLIST[libeweather] ?=3D &=
quot;Fails to build with RSS <a href=3D"http://errors.yoctoproject.org/Erro=
rs/Details/130649/" style=3D"box-sizing:border-box;word-wrap:break-word;col=
or:rgb(92,53,102)">http://errors.yoctoproject.org/Errors/Details/130649/</a=
> - the recipe will be removed on 2017-09-01 unless the issue is fixed&quot=
;
meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb:PNBLACKLIST[pack=
agegroup-efl-sdk] ?=3D &quot;Runtime depends on blacklisted elementary-dev =
- the recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.b=
b:PNBLACKLIST[packagegroup-efl-standalone-sdk-target] ?=3D &quot;Runtime de=
pends on blacklisted elementary-dev - the recipe will be removed on 2017-09=
-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb:PNBLACKLIST[p=
ackagegroup-x11-illume] ?=3D &quot;Runtime depends on blacklisted e-wm - th=
e recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb:PNBLACKLIST[p=
ackagegroup-x11-illume] ?=3D &quot;Runtime depends on blacklisted e-wm-conf=
ig-mobile - the recipe will be removed on 2017-09-01 unless the issue is fi=
xed&quot;
meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb:PNBLACKLIST[p=
ackagegroup-x11-illume] ?=3D &quot;Runtime depends on blacklisted e-wm-them=
e-default - the recipe will be removed on 2017-09-01 unless the issue is fi=
xed&quot;
meta-efl/recipes-efl/webkit/webkit-efl.inc:PNBLACKLIST[webkit-efl] ?=3D &qu=
ot;Old and unmaintaned fork with many security issues - the recipe will be =
removed on 2017-09-01 unless the issue is fixed&quot;
meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb:PNBLACKLIST[mcnavi] ?=3D=
 &quot;BROKEN: latest version 0.3.4 is 3 years old and now broken with more=
 strict ejde_cc from efl-1.13 - the recipe will be removed on 2017-09-01 un=
less the issue is fixed&quot;
meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb:PNBLACKLI=
ST[logfsprogs] ?=3D &quot;Doesn&#39;t have proper PV, doesn&#39;t respect L=
DFLAGS - the recipe will be removed on 2017-09-01 unless the issue is fixed=
&quot;
meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb:PNBLACKLIST[s=
mbnetfs] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctop=
roject.org/Errors/Details/132827/" style=3D"box-sizing:border-box;word-wrap=
:break-word;color:rgb(92,53,102)">http://errors.yoctoproject.org/Errors/Det=
ails/132827/</a> - the recipe will be removed on 2017-09-01 unless the issu=
e is fixed&quot;
meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb:PNBL=
ACKLIST[unionfs-fuse] ?=3D &quot;Fails to build with RSS <a href=3D"http://=
errors.yoctoproject.org/Errors/Details/130648/" style=3D"box-sizing:border-=
box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.yoctoproject.o=
rg/Errors/Details/130648/</a> - the recipe will be removed on 2017-09-01 un=
less the issue is fixed&quot;
meta-filesystems/recipes-utils/dmapi/dmapi_2.2.12.bb:PNBLACKLIST[dmapi] ?=
=3D &quot;Depends on broken xfsprogs - the recipe will be removed on 2017-0=
9-01 unless the issue is fixed&quot;
meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb:PNBLACKLIST[xfsdump=
] ?=3D &quot;Depends on broken xfsprogs - the recipe will be removed on 201=
7-09-01 unless the issue is fixed&quot;
meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb:PNBLACKLIST[cheese] ?=3D &q=
uot;Depends on blacklisted gstreamer - the recipe will be removed on 2017-0=
9-01 unless the issue is fixed&quot;
meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb:PNBLACKLIST[cheese] ?=3D &q=
uot;Depends on blacklisted gnome-desktop - the recipe will be removed on 20=
17-09-01 unless the issue is fixed&quot;
meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb:PNBLACKLIST[epdfview] ?=
=3D &quot;BROKEN: images are not displayed anymore - the recipe will be rem=
oved on 2017-09-01 unless the issue is fixed&quot;
meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb:PNBLACKLIST[gmtk] ?=3D =
&quot;Fails to build with RSS <a href=3D"http://errors.yoctoproject.org/Err=
ors/Details/130661/" style=3D"box-sizing:border-box;word-wrap:break-word;co=
lor:rgb(92,53,102)">http://errors.yoctoproject.org/Errors/Details/130661/</=
a> - the recipe will be removed on 2017-09-01 unless the issue is fixed&quo=
t;
meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gn=
ome-mplayer] ?=3D &quot;rdepends on blacklisted mplayer - the recipe will b=
e removed on 2017-09-01 unless the issue is fixed&quot;
meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb:PN=
BLACKLIST[gtk-theme-torturer] ?=3D &quot;BROKEN: gmacros.h:182:53: error: s=
ize of array &#39;_GStaticAssertCompileTimeAssertion_2&#39; is negative - t=
he recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-gnome/recipes-gnome/devilspie/devilspie2_0.33.bb:PNBLACKLIST[devilspie=
2] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproject=
.org/Errors/Details/130666/" style=3D"box-sizing:border-box;word-wrap:break=
-word;color:rgb(92,53,102)">http://errors.yoctoproject.org/Errors/Details/1=
30666/</a> - the recipe will be removed on 2017-09-01 unless the issue is f=
ixed&quot;
meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb:PNBLACKLIST[gcalctoo=
l] ?=3D &quot;broken at least since April 2013 <a href=3D"http://permalink.=
gmane.org/gmane.comp.handhelds.openembedded/57920" style=3D"box-sizing:bord=
er-box;word-wrap:break-word;color:rgb(92,53,102)">http://permalink.gmane.or=
g/gmane.comp.handhelds.openembedded/57920</a> and nobody complained, it&#39=
;s also replaced by gnome calculator - the recipe will be removed on 2017-0=
9-01 unless the issue is fixed&quot;
meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb:PNBLACKLIST[gdm] ?=3D &quot;Depe=
nds on broken gnome-panel - the recipe will be removed on 2017-09-01 unless=
 the issue is fixed&quot;
meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb:PNBL=
ACKLIST[gnome-backgrounds] ?=3D &quot;Fails to build with RSS <a href=3D"ht=
tp://errors.yoctoproject.org/Errors/Details/130647/" style=3D"box-sizing:bo=
rder-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.yoctoproj=
ect.org/Errors/Details/130647/</a> - the recipe will be removed on 2017-09-=
01 unless the issue is fixed&quot;
meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.b=
b:PNBLACKLIST[gnome-control-center] ?=3D &quot;Depends on broken gnome-menu=
s - the recipe will be removed on 2017-09-01 unless the issue is fixed&quot=
;
meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb:PNBLACKLIST[=
gnome-desktop] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.=
yoctoproject.org/Errors/Details/130595/" style=3D"box-sizing:border-box;wor=
d-wrap:break-word;color:rgb(92,53,102)">http://errors.yoctoproject.org/Erro=
rs/Details/130595/</a> - the recipe will be removed on 2017-09-01 unless th=
e issue is fixed&quot;
meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb:PN=
BLACKLIST[gnome-disk-utility] ?=3D &quot;Fails to build with RSS <a href=3D=
"http://errors.yoctoproject.org/Errors/Details/132824/" style=3D"box-sizing=
:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.yoctop=
roject.org/Errors/Details/132824/</a> - the recipe will be removed on 2017-=
09-01 unless the issue is fixed&quot;
meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLIST[=
gnome-keyring] ?=3D &quot;This version conflicts with gcr from oe-core - th=
e recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb:PNBLACKLIST[gnom=
e-menus] ?=3D &quot;BROKEN: fails to build because of python + conflicts wi=
th gnome-menu3 - the recipe will be removed on 2017-09-01 unless the issue =
is fixed&quot;
meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnom=
e-panel3] ?=3D &quot;CONFLICT: depends on libgweather3 which conflicts with=
 libgweather - the recipe will be removed on 2017-09-01 unless the issue is=
 fixed&quot;
meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnom=
e-panel3] ?=3D &quot;Depends on broken gnome-menus - the recipe will be rem=
oved on 2017-09-01 unless the issue is fixed&quot;
meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb:PNBLACKLIST[gnom=
e-panel] ?=3D &quot;Depends on broken libgweather - the recipe will be remo=
ved on 2017-09-01 unless the issue is fixed&quot;
meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb:=
PNBLACKLIST[gnome-power-manager] ?=3D &quot;BROKEN: not compatible with cur=
rent libnotify - the recipe will be removed on 2017-09-01 unless the issue =
is fixed&quot;
meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb:PNBLACKLIST[=
gnome-session] ?=3D &quot;BROKEN: fails to build with gcc-6 - the recipe wi=
ll be removed on 2017-09-01 unless the issue is fixed&quot;
meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1=
.bb:PNBLACKLIST[gnome-settings-daemon] ?=3D &quot;Depends on blacklisted li=
bgnomekbd - the recipe will be removed on 2017-09-01 unless the issue is fi=
xed&quot;
meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1=
.bb:PNBLACKLIST[gnome-settings-daemon] ?=3D &quot;Depends on blacklisted gn=
ome-desktop - the recipe will be removed on 2017-09-01 unless the issue is =
fixed&quot;
meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.b=
b:PNBLACKLIST[gnome-system-monitor] ?=3D &quot;Fails to build with RSS <a h=
ref=3D"http://errors.yoctoproject.org/Errors/Details/131635/" style=3D"box-=
sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.=
yoctoproject.org/Errors/Details/131635/</a> - the recipe will be removed on=
 2017-09-01 unless the issue is fixed&quot;
meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb:PNBLACKLIST[gnome-t=
erminal] ?=3D &quot;BROKEN: fails to build with gcc-6 - the recipe will be =
removed on 2017-09-01 unless the issue is fixed&quot;
meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb:PNBLACKLIST[libgnomecu=
ps] ?=3D &quot;Depends on blacklisted libgnomeui - the recipe will be remov=
ed on 2017-09-01 unless the issue is fixed&quot;
meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb:PNBLACKLIST[libgnome=
print] ?=3D &quot;Depends on broken libgnomecups - the recipe will be remov=
ed on 2017-09-01 unless the issue is fixed&quot;
meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb:PNBLACKLIST[gnumeric] =
?=3D &quot;Depends on broken libgnomeprint - the recipe will be removed on =
2017-09-01 unless the issue is fixed&quot;
meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb:PNBLACKLIST[gthumb] ?=3D &=
quot;Depends on blacklisted gstreamer - the recipe will be removed on 2017-=
09-01 unless the issue is fixed&quot;
meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgwea=
ther3] ?=3D &quot;CONFLICT: 876 files are conflicting with libgweather - th=
e recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb:PNBLACKLIST[libgwea=
ther] ?=3D &quot;BROKEN: fails to build with gcc-6 - the recipe will be rem=
oved on 2017-09-01 unless the issue is fixed&quot;
meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb:PNBLACKLIST[libgnom=
ekbd] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproj=
ect.org/Errors/Details/130608/" style=3D"box-sizing:border-box;word-wrap:br=
eak-word;color:rgb(92,53,102)">http://errors.yoctoproject.org/Errors/Detail=
s/130608/</a> - the recipe will be removed on 2017-09-01 unless the issue i=
s fixed&quot;
meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb:PNBLACKLIST[nautilus3]=
 ?=3D &quot;BROKEN: fails to build, maybe missing dependency on gnome-deskt=
op-utils.h provider - the recipe will be removed on 2017-09-01 unless the i=
ssue is fixed&quot;
meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb:PNBLACKLIST[nautilus] =
?=3D &quot;Depends on blacklisted gnome-desktop - the recipe will be remove=
d on 2017-09-01 unless the issue is fixed&quot;
meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb:PNBLACKLIST[contacts] ?=3D=
 &quot;Fails to fetch, <a href=3D"http://pimlico-project.org">pimlico-proje=
ct.org</a> is gone <a href=3D"http://errors.yoctoproject.org/Errors/Details=
/132854/" style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,=
53,102)">http://errors.yoctoproject.org/Errors/Details/132854/</a> - the re=
cipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-gnome/recipes-gnome/pimlico/contacts_git.bb:PNBLACKLIST[contacts] ?=3D=
 &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproject.org/Er=
rors/Details/132826/" style=3D"box-sizing:border-box;word-wrap:break-word;c=
olor:rgb(92,53,102)">http://errors.yoctoproject.org/Errors/Details/132826/<=
/a> - the recipe will be removed on 2017-09-01 unless the issue is fixed&qu=
ot;
meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb:PNBLACKLIST[tasks] ?=3D &quo=
t;Fails to build with gcc-6 - the recipe will be removed on 2017-09-01 unle=
ss the issue is fixed&quot;
meta-gnome/recipes-gnome/pimlico/tasks_git.bb:PNBLACKLIST[tasks] ?=3D &quot=
;Fails to build with gcc-6 - the recipe will be removed on 2017-09-01 unles=
s the issue is fixed&quot;
meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb:PNBLA=
CKLIST[system-tools-backends] ?=3D &quot;does not build with distroless qem=
uarm as reported in &#39;State of bitbake world&#39; thread, nobody volunte=
ered to fix them - the recipe will be removed on 2017-09-01 unless the issu=
e is fixed&quot;
meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb:PNBLACKLIST[gnome-th=
emes] ?=3D &quot;Depends on blacklisted gtk-engines - the recipe will be re=
moved on 2017-09-01 unless the issue is fixed&quot;
meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?=3D &=
quot;BROKEN: doesn&#39;t build with B!=3DS - the recipe will be removed on =
2017-09-01 unless the issue is fixed&quot;
meta-gnome/recipes-support/florence/florence_0.5.4.bb:PNBLACKLIST[florence]=
 ?=3D &quot;Depends on blacklisted gstreamer - the recipe will be removed o=
n 2017-09-01 unless the issue is fixed&quot;
meta-gnome/recipes-support/goffice/goffice_0.10.1.bb:PNBLACKLIST[goffice] ?=
=3D &quot;BROKEN: fails to build with gcc-6 - the recipe will be removed on=
 2017-09-01 unless the issue is fixed&quot;
meta-gnome/recipes-support/tracker/tracker_0.14.2.bb:PNBLACKLIST[tracker] ?=
=3D &quot;BROKEN: fails to build with new binutils-2.27 - the recipe will b=
e removed on 2017-09-01 unless the issue is fixed&quot;
meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb:PNBLACKLIST[gpe-scap] ?=
=3D &quot;Depends on blacklisted libgpewidget - the recipe will be removed =
on 2017-09-01 unless the issue is fixed&quot;
meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb:PNBLACKLIST[li=
bgpewidget] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoc=
toproject.org/Errors/Details/130594/" style=3D"box-sizing:border-box;word-w=
rap:break-word;color:rgb(92,53,102)">http://errors.yoctoproject.org/Errors/=
Details/130594/</a> - the recipe will be removed on 2017-09-01 unless the i=
ssue is fixed&quot;
meta-gpe/recipes-graphics/minilite/minilite_0.50.bb:PNBLACKLIST[minilite] ?=
=3D &quot;Depends on blacklisted libgpewidget - the recipe will be removed =
on 2017-09-01 unless the issue is fixed&quot;
meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb:PNBLACKLIST[fbreader]=
 ?=3D &quot;Depends on blacklisted libgpewidget - the recipe will be remove=
d on 2017-09-01 unless the issue is fixed&quot;
meta-gpe/recipes-support/fbreader/fbreader_git.bb:PNBLACKLIST[fbreader] ?=
=3D &quot;BROKEN: fails to build with gcc-6 - the recipe will be removed on=
 2017-09-01 unless the issue is fixed&quot;
meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb:PNBLACKLIST[g=
upnp-igd] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yocto=
project.org/Errors/Details/130645/" style=3D"box-sizing:border-box;word-wra=
p:break-word;color:rgb(92,53,102)">http://errors.yoctoproject.org/Errors/De=
tails/130645/</a> - the recipe will be removed on 2017-09-01 unless the iss=
ue is fixed&quot;
meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.10.bb:PNBLACKLIS=
T[gupnp-tools] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.=
yoctoproject.org/Errors/Details/130670/" style=3D"box-sizing:border-box;wor=
d-wrap:break-word;color:rgb(92,53,102)">http://errors.yoctoproject.org/Erro=
rs/Details/130670/</a> - the recipe will be removed on 2017-09-01 unless th=
e issue is fixed&quot;
meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb:PNBLACKLIST[dvb-apps=
] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproject.=
org/Errors/Details/130603/" style=3D"box-sizing:border-box;word-wrap:break-=
word;color:rgb(92,53,102)">http://errors.yoctoproject.org/Errors/Details/13=
0603/</a> - the recipe will be removed on 2017-09-01 unless the issue is fi=
xed&quot;
meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb:PNBLACKLIST[tvheaden=
d] ?=3D &quot;Depends on blacklisted dvb-apps - the recipe will be removed =
on 2017-09-01 unless the issue is fixed&quot;
meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts_git.bb:PNBLACKL=
IST[kodi-addon-pvr-hts] ?=3D &quot;Depends on blacklisted kodi - the recipe=
 will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-multimedia/recipes-mediacenter/kodi/kodi-platform_git.bb:PNBLACKLIST[k=
odi-platform] ?=3D &quot;Depends on blacklisted kodi - the recipe will be r=
emoved on 2017-09-01 unless the issue is fixed&quot;
meta-multimedia/recipes-mediacenter/kodi/kodi-startup.bb:PNBLACKLIST[kodi-s=
tartup] ?=3D &quot;Runtime depends on blacklisted kodi - the recipe will be=
 removed on 2017-09-01 unless the issue is fixed&quot;
meta-multimedia/recipes-mediacenter/kodi/kodi-startup.bb:PNBLACKLIST[kodi-s=
tartup] ?=3D &quot;Runtime depends on blacklisted kodi-startup-dev - the re=
cipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb:PNBLACKLIST[kodi] ?=3D =
&quot;Depends on blacklisted libsdl-mixer - the recipe will be removed on 2=
017-09-01 unless the issue is fixed&quot;
meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb:PNBLACKLIST[mkvtoo=
lnix] ?=3D &quot;BROKEN: Failx to build with gcc-5 - the recipe will be rem=
oved on 2017-09-01 unless the issue is fixed&quot;
meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:PNBLACKLIST=
[coriander] ?=3D &quot;BROKEN: fails to use SDL probably because libsdl-con=
fig was removed, error: unknown type name &#39;SDL_Overlay&#39; - the recip=
e will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb:PN=
BLACKLIST[renderer-service-upnp] ?=3D &quot;BROKEN: doesn&#39;t build with =
B!=3DS (trying to install rendererconsole.py from ${B} instead of ${S}) - t=
he recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg_0.10.13.bb:PNB=
LACKLIST[gst-ffmpeg] ?=3D &quot;Not compatible with currently used ffmpeg 3=
 - the recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb:PNBLACKLIST[gs=
t123] ?=3D &quot;gst123 is still &quot;sometimes&quot; using wrong sysroot =
- the recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb:PNBLACKLIST[dnrd] ?=3D =
&quot;BROKEN: dnrd-2.20.3-r0 do_package: QA Issue: dnrd: Files/directories =
were installed but not shipped in any package: - the recipe will be removed=
 on 2017-09-01 unless the issue is fixed&quot;
meta-networking/recipes-kernel/netmap/netmap-modules_git.bb:PNBLACKLIST[net=
map-modules] ?=3D &quot;BROKEN: not compatible with default kernel version =
4.8 - the recipe will be removed on 2017-09-01 unless the issue is fixed&qu=
ot;
meta-networking/recipes-kernel/netmap/netmap_git.bb:PNBLACKLIST[netmap] ?=
=3D &quot;BROKEN: Tries to build kernel module and fails, either it should =
be disabled or there should be dependency on kernel like in netmap-modules =
- the recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb:PNBLACKLIST[ac=
cel-ppp] ?=3D &quot;BROKEN: fails to build with new binutils-2.27 - the rec=
ipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACK=
LIST[lksctp-tools] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39=
;, &#39;ld-is-gold&#39;, &quot;BROKEN: fails to link against sctp_connectx =
symbol&quot;, &#39;&#39;, d)} - the recipe will be removed on 2017-09-01 un=
less the issue is fixed&quot;
meta-networking/recipes-support/nis/ypbind-mt_2.2.bb:PNBLACKLIST[ypbind-mt]=
 ?=3D &quot;BROKEN: Depends on broken yp-tools - the recipe will be removed=
 on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_6.6.1.bb:=
PNBLACKLIST[phoronix-test-suite] ?=3D &quot;Runtime depends on blacklisted =
php-cli - the recipe will be removed on 2017-09-01 unless the issue is fixe=
d&quot;
meta-oe/recipes-benchmark/pmbw/pmbw_git.bb:PNBLACKLIST[pmbw] ?=3D &quot;Fai=
ls to build with RSS <a href=3D"http://errors.yoctoproject.org/Errors/Detai=
ls/130568/" style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(9=
2,53,102)">http://errors.yoctoproject.org/Errors/Details/130568/</a> - the =
recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNBLACKLIST[bluez-h=
cidump] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;blu=
ez5&#39;, &#39;bluez5 conflicts with bluez4 and bluez5 is selected in DISTR=
O_FEATURES&#39;, &#39;&#39;, d)} - the recipe will be removed on 2017-09-01=
 unless the issue is fixed&quot;
meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4] ?=3D=
 &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bluez5&#39;, &#=
39;bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES&#=
39;, &#39;&#39;, d)} - the recipe will be removed on 2017-09-01 unless the =
issue is fixed&quot;
meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:PNBLACKLIS=
T[gst-plugin-bluetooth] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURE=
S&#39;, &#39;bluez5&#39;, &#39;bluez5 conflicts with bluez4 and bluez5 is s=
elected in DISTRO_FEATURES&#39;, &#39;&#39;, d)} - the recipe will be remov=
ed on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb:PNBLACKLIST[gnokii] ?=
=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproject.org=
/Errors/Details/130662/" style=3D"box-sizing:border-box;word-wrap:break-wor=
d;color:rgb(92,53,102)">http://errors.yoctoproject.org/Errors/Details/13066=
2/</a> - the recipe will be removed on 2017-09-01 unless the issue is fixed=
&quot;
meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.6.bb=
:PNBLACKLIST[networkmanager-openvpn] ?=3D &quot;Fails to build with RSS <a =
href=3D"http://errors.yoctoproject.org/Errors/Details/130667/" style=3D"box=
-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors=
.yoctoproject.org/Errors/Details/130667/</a> - the recipe will be removed o=
n 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?=3D =
&quot;BROKEN: depends on broken libftdi - the recipe will be removed on 201=
7-09-01 unless the issue is fixed&quot;
meta-oe/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb:PNBLACKLIST[li=
btelepathy] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoc=
toproject.org/Errors/Details/130609/" style=3D"box-sizing:border-box;word-w=
rap:break-word;color:rgb(92,53,102)">http://errors.yoctoproject.org/Errors/=
Details/130609/</a> - the recipe will be removed on 2017-09-01 unless the i=
ssue is fixed&quot;
meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.16.1.bb:=
PNBLACKLIST[telepathy-mission-control] ?=3D &quot;Depends on blacklisted li=
btelepathy - the recipe will be removed on 2017-09-01 unless the issue is f=
ixed&quot;
meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb:PNBLACKLIST[wvdial] ?=3D=
 &quot;Depends on broken wvstreams - the recipe will be removed on 2017-09-=
01 unless the issue is fixed&quot;
meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb:PNBLACKLIST[wvstream=
s] ?=3D &quot;BROKEN: fails to build with gcc-6 - the recipe will be remove=
d on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zeroc=
-ice] ?=3D &quot;BROKEN: not compatible with default db version - the recip=
e will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb:PNBLACKLIST[dbus-daemon-=
proxy] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctopro=
ject.org/Errors/Details/130613/" style=3D"box-sizing:border-box;word-wrap:b=
reak-word;color:rgb(92,53,102)">http://errors.yoctoproject.org/Errors/Detai=
ls/130613/</a> - the recipe will be removed on 2017-09-01 unless the issue =
is fixed&quot;
meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb:PNBLACKLIST[libdbus-c++] ?=
=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproject.org=
/Errors/Details/130644/" style=3D"box-sizing:border-box;word-wrap:break-wor=
d;color:rgb(92,53,102)">http://errors.yoctoproject.org/Errors/Details/13064=
4/</a> - the recipe will be removed on 2017-09-01 unless the issue is fixed=
&quot;
meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb:PNBLACKLIST[fakeroot] ?=3D=
 &quot;BROKEN: QA Issue: -dev package contains non-symlink .so - the recipe=
 will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb:PNBLACKLIST[pa=
ckagegroup-cli-tools] ?=3D &quot;Runtime depends on blacklisted dbus-daemon=
-proxy - the recipe will be removed on 2017-09-01 unless the issue is fixed=
&quot;
meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb:PNBLACKLIST[pa=
ckagegroup-cli-tools] ?=3D &quot;Runtime depends on blacklisted packagegrou=
p-cli-tools - the recipe will be removed on 2017-09-01 unless the issue is =
fixed&quot;
meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb:PNBLACKLIST[cloud9] ?=3D &quo=
t;Not comatible with current nodejs 0.12, but upstream is working on it for=
 v3 - the recipe will be removed on 2017-09-01 unless the issue is fixed&qu=
ot;
meta-oe/recipes-devtools/dt/dt_18.32.bb:PNBLACKLIST[dt] ?=3D &quot;Rdepends=
 on blacklisted tcsh - the recipe will be removed on 2017-09-01 unless the =
issue is fixed&quot;
meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb:PNBLACKLIST[ltp-ddt] ?=3D=
 &quot;BROKEN: fails since last autotools.bbclass changes - the recipe will=
 be removed on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb:PNBLACKLIST[package=
kit] ?=3D &quot;BROKEN: depends on old deprecated libopkg which is currentl=
y disabled and will be removed soon - the recipe will be removed on 2017-09=
-01 unless the issue is fixed&quot;
meta-oe/recipes-devtools/php/php_5.6.26.bb:PNBLACKLIST[php] ?=3D &quot;Fail=
s to build with RSS <a href=3D"http://errors.yoctoproject.org/Errors/Detail=
s/131630/" style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92=
,53,102)">http://errors.yoctoproject.org/Errors/Details/131630/</a> - the r=
ecipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-devtools/php/php_7.1.0.bb:PNBLACKLIST[php] ?=3D &quot;Fails=
 to build with RSS <a href=3D"http://errors.yoctoproject.org/Errors/Details=
/130601/" style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,=
53,102)">http://errors.yoctoproject.org/Errors/Details/130601/</a> - the re=
cipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.=
0.bb:PNBLACKLIST[vala-dbus-binding-tool] ?=3D &quot;Fails to build with RSS=
 <a href=3D"http://errors.yoctoproject.org/Errors/Details/131628/" style=3D=
"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://er=
rors.yoctoproject.org/Errors/Details/131628/</a> - the recipe will be remov=
ed on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.=
bb:PNBLACKLIST[vala-dbus-binding-tool] ?=3D &quot;Fails to build with RSS <=
a href=3D"http://errors.yoctoproject.org/Errors/Details/130581/" style=3D"b=
ox-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://erro=
rs.yoctoproject.org/Errors/Details/130581/</a> - the recipe will be removed=
 on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-extended/openlmi/openlmi-networking_0.3.1.bb:PNBLACKLIST[op=
enlmi-networking] ?=3D &quot;Depends on blacklisted openlmi-providers - the=
 recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-extended/openlmi/openlmi-providers_0.6.0.bb:PNBLACKLIST[ope=
nlmi-providers] ?=3D &quot;Depends on blacklisted lmsensors - the recipe wi=
ll be removed on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-extended/openlmi/openlmi-storage_0.8.1.bb:PNBLACKLIST[openl=
mi-storage] ?=3D &quot;Depends on blacklisted pywbem - the recipe will be r=
emoved on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurfac=
e] ?=3D &quot;Needs to be upgraded for compatibility with new libdivecomput=
er - the recipe will be removed on 2017-09-01 unless the issue is fixed&quo=
t;
meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb:PNBLACKLIST[gtkextra] ?=3D=
 &quot;BROKEN: Fails to build with gcc-5 - the recipe will be removed on 20=
17-09-01 unless the issue is fixed&quot;
meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb:PNBLACKLIST[gtkhtml2] ?=3D &=
quot;Fails to build with RSS <a href=3D"http://errors.yoctoproject.org/Erro=
rs/Details/130633/" style=3D"box-sizing:border-box;word-wrap:break-word;col=
or:rgb(92,53,102)">http://errors.yoctoproject.org/Errors/Details/130633/</a=
> - the recipe will be removed on 2017-09-01 unless the issue is fixed&quot=
;
meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-b=
ox2d] ?=3D &quot;BROKEN: doesn&#39;t build with B!=3DS - the recipe will be=
 removed on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-graphics/fbida/fbida_2.10.bb:PNBLACKLIST[fbida] ?=3D &quot;=
Fails to build with RSS <a href=3D"http://errors.yoctoproject.org/Errors/De=
tails/130677/" style=3D"box-sizing:border-box;word-wrap:break-word;color:rg=
b(92,53,102)">http://errors.yoctoproject.org/Errors/Details/130677/</a> - t=
he recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?=3D &quot;BRO=
KEN: doesn&#39;t build with B!=3DS (flex: can&#39;t open lex.lex) - the rec=
ipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb:PNBLACKLIST[libsexy] ?=
=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproject.org=
/Errors/Details/130607/" style=3D"box-sizing:border-box;word-wrap:break-wor=
d;color:rgb(92,53,102)">http://errors.yoctoproject.org/Errors/Details/13060=
7/</a> - the recipe will be removed on 2017-09-01 unless the issue is fixed=
&quot;
meta-oe/recipes-graphics/slim/slim_1.3.2.bb:PNBLACKLIST[slim] ?=3D &quot;do=
es not build with distroless qemuarm as reported in &#39;State of bitbake w=
orld&#39; thread, nobody volunteered to fix them - the recipe will be remov=
ed on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb:PNBLACKLIST[te=
rminus-font] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yo=
ctoproject.org/Errors/Details/130638/" style=3D"box-sizing:border-box;word-=
wrap:break-word;color:rgb(92,53,102)">http://errors.yoctoproject.org/Errors=
/Details/130638/</a> - the recipe will be removed on 2017-09-01 unless the =
issue is fixed&quot;
meta-oe/recipes-graphics/wayland/wayland-fits_git.bb:PNBLACKLIST[wayland-fi=
ts] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoprojec=
t.org/Errors/Details/130632/" style=3D"box-sizing:border-box;word-wrap:brea=
k-word;color:rgb(92,53,102)">http://errors.yoctoproject.org/Errors/Details/=
130632/</a> - the recipe will be removed on 2017-09-01 unless the issue is =
fixed&quot;
meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.3.bb:PNBLACKLIST[xstdcmap] ?=
=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproject.org=
/Errors/Details/130660/" style=3D"box-sizing:border-box;word-wrap:break-wor=
d;color:rgb(92,53,102)">http://errors.yoctoproject.org/Errors/Details/13066=
0/</a> - the recipe will be removed on 2017-09-01 unless the issue is fixed=
&quot;
meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[xf8=
6-input-mtev] ?=3D &quot;BROKEN: doesn&#39;t build with B!=3DS (Makefile wi=
thout ${S} in sed call) - the recipe will be removed on 2017-09-01 unless t=
he issue is fixed&quot;
meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:PNBLACKLIS=
T[xf86-video-geode] ?=3D &quot;BROKEN, fails to build - the recipe will be =
removed on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb:PNBLACKLIST[xf=
86-video-glamo] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors=
.yoctoproject.org/Errors/Details/130629/" style=3D"box-sizing:border-box;wo=
rd-wrap:break-word;color:rgb(92,53,102)">http://errors.yoctoproject.org/Err=
ors/Details/130629/</a> - the recipe will be removed on 2017-09-01 unless t=
he issue is fixed&quot;
meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.12.bb:PNBLACKLI=
ST[xf86-video-nouveau] ?=3D &quot;Fails to build with RSS <a href=3D"http:/=
/errors.yoctoproject.org/Errors/Details/130657/" style=3D"box-sizing:border=
-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.yoctoproject.=
org/Errors/Details/130657/</a> - the recipe will be removed on 2017-09-01 u=
nless the issue is fixed&quot;
meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb:PNBLACKLIST[xorg-fo=
nts-100dpi] ?=3D &quot;Runtime depends on blacklisted font-adobe-100dpi - t=
he recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb:PNBLACKLIST[xorg-fo=
nts-100dpi] ?=3D &quot;Runtime depends on blacklisted xorg-fonts-100dpi - t=
he recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb:PNBLACKLIST[xorg-fo=
nts-100dpi] ?=3D &quot;Runtime depends on blacklisted font-bh-100dpi - the =
recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb:PNBLACKLIST[xorg-fo=
nts-100dpi] ?=3D &quot;Runtime depends on blacklisted font-adobe-utopia-100=
dpi - the recipe will be removed on 2017-09-01 unless the issue is fixed&qu=
ot;
meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb:PNBLACKLIST[xorg-fo=
nts-100dpi] ?=3D &quot;Runtime depends on blacklisted font-bh-lucidatypewri=
ter-100dpi - the recipe will be removed on 2017-09-01 unless the issue is f=
ixed&quot;
meta-oe/recipes-kernel/crash/crash_7.1.5.bb:PNBLACKLIST[crash] ?=3D &quot;F=
ails to build with RSS <a href=3D"http://errors.yoctoproject.org/Errors/Det=
ails/130678/" style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb=
(92,53,102)">http://errors.yoctoproject.org/Errors/Details/130678/</a> - th=
e recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-kernel/ktap/ktap-module_git.bb:PNBLACKLIST[ktap-module] ?=
=3D &quot;Not compatible with 3.19 kernel - the recipe will be removed on 2=
017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-kernel/ktap/ktap_git.bb:PNBLACKLIST[ktap] ?=3D &quot;Depend=
s on blacklisted kernel-module-ktapvm - the recipe will be removed on 2017-=
09-01 unless the issue is fixed&quot;
meta-oe/recipes-multimedia/minidlna/minidlna_1.1.5.bb:PNBLACKLIST[minidlna]=
 ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproject.o=
rg/Errors/Details/130630/" style=3D"box-sizing:border-box;word-wrap:break-w=
ord;color:rgb(92,53,102)">http://errors.yoctoproject.org/Errors/Details/130=
630/</a> - the recipe will be removed on 2017-09-01 unless the issue is fix=
ed&quot;
meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb:PNBLACKLIST[mplayer2] ?=
=3D &quot;Not compatible with currently used ffmpeg 3 - the recipe will be =
removed on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtr=
otgps] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;blue=
z5&#39;, &#39;bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO=
_FEATURES&#39;, &#39;&#39;, d)} - the recipe will be removed on 2017-09-01 =
unless the issue is fixed&quot;
meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb:PNBLACKLIST[gdal] ?=3D &quot=
;BROKEN: fails to build with gcc-5 - the recipe will be removed on 2017-09-=
01 unless the issue is fixed&quot;
meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=3D &quot;${=
@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bluez5&#39;, &#39;bluez5=
 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES&#39;, &#39=
;&#39;, d)} - the recipe will be removed on 2017-09-01 unless the issue is =
fixed&quot;
meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=3D &quot;${=
@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bluez5&#39;, &#39;bluez5=
 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES&#39;, &#39=
;&#39;, d)} - the recipe will be removed on 2017-09-01 unless the issue is =
fixed&quot;
meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb:PNBLACKLIST[claws-mail]=
 ?=3D &quot;depends on blacklisted libetpan - the recipe will be removed on=
 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb:PNBLAC=
KLIST[claws-plugin-gtkhtml2-viewer] ?=3D &quot;depends on blacklisted claws=
-mail - the recipe will be removed on 2017-09-01 unless the issue is fixed&=
quot;
meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb:PNBLACKLIST[c=
laws-plugin-mailmbox] ?=3D &quot;depends on blacklisted claws-mail - the re=
cipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb:PNBLACKLIST[claw=
s-plugin-rssyl] ?=3D &quot;depends on blacklisted claws-mail - the recipe w=
ill be removed on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb:PNBLACKLIST[sylpheed] ?=
=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproject.org=
/Errors/Details/130651/" style=3D"box-sizing:border-box;word-wrap:break-wor=
d;color:rgb(92,53,102)">http://errors.yoctoproject.org/Errors/Details/13065=
1/</a> - the recipe will be removed on 2017-09-01 unless the issue is fixed=
&quot;
meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd] ?=
=3D &quot;BROKEN: doesn&#39;t build with B!=3DS - the recipe will be remove=
d on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?=3D &quot;q=
emu: uncaught target signal 11 (Segmentation fault) - core dumped - the rec=
ipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-support/farsight/farsight2_0.0.22.bb:PNBLACKLIST[farsight2]=
 ?=3D &quot;Depends on blacklisted gstreamer - the recipe will be removed o=
n 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-support/farsight/farsight2_0.0.22.bb:PNBLACKLIST[farsight2]=
 ?=3D &quot;Depends on blacklisted libnice - the recipe will be removed on =
2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-support/farsight/farsight2_0.0.22.bb:PNBLACKLIST[farsight2]=
 ?=3D &quot;Depends on blacklisted gst-plugins-base - the recipe will be re=
moved on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-support/fftw/benchfft_3.1.bb:PNBLACKLIST[benchfft] ?=3D &qu=
ot;does not build with distroless qemuarm as reported in &#39;State of bitb=
ake world&#39; thread, nobody volunteered to fix them - the recipe will be =
removed on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-support/flite/flite-alsa_1.3.bb:PNBLACKLIST[flite-alsa] ?=
=3D &quot;OLD: wasn&#39;t updated in over 6 years, only navit was RSUGGESTi=
ng it and doesn&#39;t respect LDFLAGS - the recipe will be removed on 2017-=
09-01 unless the issue is fixed&quot;
meta-oe/recipes-support/iksemel/iksemel_1.4.bb:PNBLACKLIST[iksemel] ?=3D &q=
uot;Not compatible with gnutls version 3.4 currently in oe-core - the recip=
e will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb:PNBLACKLIST[libdbi=
-drivers] ?=3D &quot;BROKEN: fails to build with gcc-5 - the recipe will be=
 removed on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-support/libetpan/libetpan_0.57.bb:PNBLACKLIST[libetpan] ?=
=3D &quot;Not compatible with gnutls version 3.4 currently in oe-core - the=
 recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-support/ode/ode_0.13.bb:PNBLACKLIST[ode] ?=3D &quot;Fails t=
o build with RSS <a href=3D"http://errors.yoctoproject.org/Errors/Details/1=
30599/" style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53=
,102)">http://errors.yoctoproject.org/Errors/Details/130599/</a> - the reci=
pe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-support/ode/ode_0.13.bb:PNBLACKLIST[ode] ?=3D &quot;Fails t=
o build with RSS <a href=3D"http://errors.yoctoproject.org/Errors/Details/1=
30620/" style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53=
,102)">http://errors.yoctoproject.org/Errors/Details/130620/</a> - the reci=
pe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.4.bb:PNBLACKLIST[open-v=
cdiff] ?=3D &quot;BROKEN: fails to build with gcc-6 - the recipe will be re=
moved on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-support/opencv/opencv-samples_2.4.bb:PNBLACKLIST[opencv-sam=
ples] ?=3D &quot;Depends on blacklisted opencv - the recipe will be removed=
 on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-support/opencv/opencv_2.4.bb:PNBLACKLIST[opencv] ?=3D &quot=
;Not compatible with currently used ffmpeg 3 - the recipe will be removed o=
n 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmotif]=
 ?=3D &quot;BROKEN: doesn&#39;t build with B!=3DS - the recipe will be remo=
ved on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml] =
?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bluez5&#39;=
, &#39;bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATUR=
ES&#39;, &#39;&#39;, d)} - the recipe will be removed on 2017-09-01 unless =
the issue is fixed&quot;
meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb:PNBLACKLIST[openwbem] ?=
=3D &quot;BROKEN: fails to build with gcc-6 - the recipe will be removed on=
 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb:PNBLACKLIST[pidgin-otr] =
?=3D &quot;depends on blacklisted pidgin - the recipe will be removed on 20=
17-09-01 unless the issue is fixed&quot;
meta-oe/recipes-support/psqlodbc/psqlodbc_09.05.0300.bb:PNBLACKLIST[psqlodb=
c] ?=3D &quot;Depends on blacklisted postgresql - the recipe will be remove=
d on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.b=
b:PNBLACKLIST[system-setup-keyboard] ?=3D &quot;Depends on blacklisted syst=
em-config-keyboard-native - the recipe will be removed on 2017-09-01 unless=
 the issue is fixed&quot;
meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala=
-terminal] ?=3D &quot;BROKEN: Doesn&#39;t work with B!=3DS, touch: cannot t=
ouch `src/.stamp&#39;: No such file or directory - the recipe will be remov=
ed on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.36.bb:PNBLACK=
LIST[vboxguestdrivers] ?=3D &quot;BROKEN: not compatible with default kerne=
l version 4.8 - the recipe will be removed on 2017-09-01 unless the issue i=
s fixed&quot;
meta-oe/recipes-support/xchat/xchat_2.8.8.bb:PNBLACKLIST[xchat] ?=3D &quot;=
Depends on blacklisted libsexy - the recipe will be removed on 2017-09-01 u=
nless the issue is fixed&quot;
meta-ruby/recipes-devtools/ruby/bundler_git.bb:PNBLACKLIST[bundler] ?=3D &q=
uot;Fails to build with RSS <a href=3D"http://errors.yoctoproject.org/Error=
s/Details/130640/" style=3D"box-sizing:border-box;word-wrap:break-word;colo=
r:rgb(92,53,102)">http://errors.yoctoproject.org/Errors/Details/130640/</a>=
 - the recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-webserver/recipes-php/xdebug/xdebug_2.5.1.bb:PNBLACKLIST[xdebug] ?=3D =
&quot;Depends on blacklisted php - the recipe will be removed on 2017-09-01=
 unless the issue is fixed&quot;
meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb:PNBLACKLIST[openzone]=
 ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproject.o=
rg/Errors/Details/130682/" style=3D"box-sizing:border-box;word-wrap:break-w=
ord;color:rgb(92,53,102)">http://errors.yoctoproject.org/Errors/Details/130=
682/</a> - the recipe will be removed on 2017-09-01 unless the issue is fix=
ed&quot;
meta-qt5:
meta-smartphone:
meta-fso/recipes-freesmartphone/cornucopia/fso-apm_git.bb:PNBLACKLIST[fso-a=
pm] ?=3D &quot;Depends on blacklisted libfso-glib - the recipe will be remo=
ved on 2017-09-01 unless the issue is fixed&quot;
meta-fso/recipes-freesmartphone/cornucopia/fsoaudiod_0.12.0.bb:PNBLACKLIST[=
fsoaudiod] ?=3D &quot;Depends on blacklisted libfso-glib - the recipe will =
be removed on 2017-09-01 unless the issue is fixed&quot;
meta-fso/recipes-freesmartphone/cornucopia/fsoaudiod_git.bb:PNBLACKLIST[fso=
audiod] ?=3D &quot;Depends on blacklisted libfso-glib - the recipe will be =
removed on 2017-09-01 unless the issue is fixed&quot;
meta-fso/recipes-freesmartphone/cornucopia/fsodatad_0.12.0.bb:PNBLACKLIST[f=
sodatad] ?=3D &quot;Depends on blacklisted libfso-glib - the recipe will be=
 removed on 2017-09-01 unless the issue is fixed&quot;
meta-fso/recipes-freesmartphone/cornucopia/fsodatad_git.bb:PNBLACKLIST[fsod=
atad] ?=3D &quot;Depends on blacklisted libfso-glib - the recipe will be re=
moved on 2017-09-01 unless the issue is fixed&quot;
meta-fso/recipes-freesmartphone/cornucopia/fsodeviced_0.12.0.bb:PNBLACKLIST=
[fsodeviced] ?=3D &quot;Depends on blacklisted libfso-glib - the recipe wil=
l be removed on 2017-09-01 unless the issue is fixed&quot;
meta-fso/recipes-freesmartphone/cornucopia/fsodeviced_git.bb:PNBLACKLIST[fs=
odeviced] ?=3D &quot;Depends on blacklisted libfso-glib - the recipe will b=
e removed on 2017-09-01 unless the issue is fixed&quot;
meta-fso/recipes-freesmartphone/cornucopia/fsogsmd_0.12.0.bb:PNBLACKLIST[fs=
ogsmd] ?=3D &quot;Depends on blacklisted libfso-glib - the recipe will be r=
emoved on 2017-09-01 unless the issue is fixed&quot;
meta-fso/recipes-freesmartphone/cornucopia/fsogsmd_git.bb:PNBLACKLIST[fsogs=
md] ?=3D &quot;Depends on blacklisted libfso-glib - the recipe will be remo=
ved on 2017-09-01 unless the issue is fixed&quot;
meta-fso/recipes-freesmartphone/cornucopia/fsonetworkd_0.12.0.bb:PNBLACKLIS=
T[fsonetworkd] ?=3D &quot;Depends on blacklisted libfso-glib - the recipe w=
ill be removed on 2017-09-01 unless the issue is fixed&quot;
meta-fso/recipes-freesmartphone/cornucopia/fsonetworkd_git.bb:PNBLACKLIST[f=
sonetworkd] ?=3D &quot;Depends on blacklisted libfso-glib - the recipe will=
 be removed on 2017-09-01 unless the issue is fixed&quot;
meta-fso/recipes-freesmartphone/cornucopia/fsoraw_git.bb:PNBLACKLIST[fsoraw=
] ?=3D &quot;Depends on blacklisted libfso-glib - the recipe will be remove=
d on 2017-09-01 unless the issue is fixed&quot;
meta-fso/recipes-freesmartphone/cornucopia/fsotdld_0.12.0.bb:PNBLACKLIST[fs=
otdld] ?=3D &quot;Depends on blacklisted libfso-glib - the recipe will be r=
emoved on 2017-09-01 unless the issue is fixed&quot;
meta-fso/recipes-freesmartphone/cornucopia/fsotdld_git.bb:PNBLACKLIST[fsotd=
ld] ?=3D &quot;Depends on blacklisted libfso-glib - the recipe will be remo=
ved on 2017-09-01 unless the issue is fixed&quot;
meta-fso/recipes-freesmartphone/cornucopia/fsousaged_0.12.0.bb:PNBLACKLIST[=
fsousaged] ?=3D &quot;Depends on blacklisted libfso-glib - the recipe will =
be removed on 2017-09-01 unless the issue is fixed&quot;
meta-fso/recipes-freesmartphone/cornucopia/fsousaged_git.bb:PNBLACKLIST[fso=
usaged] ?=3D &quot;Depends on blacklisted libfso-glib - the recipe will be =
removed on 2017-09-01 unless the issue is fixed&quot;
meta-fso/recipes-freesmartphone/cornucopia/libfsoframework_0.12.0.bb:PNBLAC=
KLIST[libfsoframework] ?=3D &quot;Depends on blacklisted libfso-glib - the =
recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-fso/recipes-freesmartphone/cornucopia/libfsoframework_git.bb:PNBLACKLI=
ST[libfsoframework] ?=3D &quot;Depends on blacklisted libfso-glib - the rec=
ipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-fso/recipes-freesmartphone/cornucopia/mkdump_git.bb:PNBLACKLIST[mkdump=
] ?=3D &quot;Depends on blacklisted libfsoframework - the recipe will be re=
moved on 2017-09-01 unless the issue is fixed&quot;
meta-fso/recipes-freesmartphone/cornucopia/mterm2_git.bb:PNBLACKLIST[mterm2=
] ?=3D &quot;Depends on blacklisted libfsoframework - the recipe will be re=
moved on 2017-09-01 unless the issue is fixed&quot;
meta-fso/recipes-freesmartphone/freesmartphone/frameworkd_0.10.1.bb:PNBLACK=
LIST[frameworkd] ?=3D &quot;Runtime depends on blacklisted fsousaged - the =
recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-fso/recipes-freesmartphone/freesmartphone/frameworkd_git.bb:PNBLACKLIS=
T[frameworkd] ?=3D &quot;Runtime depends on blacklisted fsousaged - the rec=
ipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-fso/recipes-freesmartphone/freesmartphone/frameworkd_git.bb:PNBLACKLIS=
T[frameworkd] ?=3D &quot;Runtime depends on blacklisted frameworkd-dev - th=
e recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-fso/recipes-freesmartphone/freesmartphone/fso-gpsd_git.bb:PNBLACKLIST[=
fso-gpsd] ?=3D &quot;Runtime depends on blacklisted fso-gpsd-dev - the reci=
pe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-fso/recipes-freesmartphone/freesmartphone/fso-gsm0710muxd_git.bb:PNBLA=
CKLIST[fso-gsm0710muxd] ?=3D &quot;Fails to build with RSS <a href=3D"http:=
//errors.yoctoproject.org/Errors/Details/130517/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.yoctoproject=
.org/Errors/Details/130517/</a> - the recipe will be removed on 2017-09-01 =
unless the issue is fixed&quot;
meta-fso/recipes-freesmartphone/freesmartphone/illume-theme-freesmartphone_=
git.bb:PNBLACKLIST[illume-theme-freesmartphone] ?=3D &quot;Depends on black=
listed edje-native - the recipe will be removed on 2017-09-01 unless the is=
sue is fixed&quot;
meta-fso/recipes-freesmartphone/freesmartphone/illume-theme-freesmartphone_=
git.bb:PNBLACKLIST[illume-theme-freesmartphone] ?=3D &quot;Depends on black=
listed eet-native - the recipe will be removed on 2017-09-01 unless the iss=
ue is fixed&quot;
meta-fso/recipes-freesmartphone/freesmartphone/illume-theme-freesmartphone_=
git.bb:PNBLACKLIST[illume-theme-freesmartphone] ?=3D &quot;Runtime depends =
on blacklisted illume-theme-freesmartphone - the recipe will be removed on =
2017-09-01 unless the issue is fixed&quot;
meta-fso/recipes-freesmartphone/freesmartphone/illume-theme-freesmartphone_=
git.bb:PNBLACKLIST[illume-theme-freesmartphone] ?=3D &quot;Runtime depends =
on blacklisted illume-theme-freesmartphone-dev - the recipe will be removed=
 on 2017-09-01 unless the issue is fixed&quot;
meta-fso/recipes-freesmartphone/freesmartphone/libframeworkd-glib_git.bb:PN=
BLACKLIST[libframeworkd-glib] ?=3D &quot;BROKEN: many errors when building =
with gcc-6 - the recipe will be removed on 2017-09-01 unless the issue is f=
ixed&quot;
meta-fso/recipes-freesmartphone/freesmartphone/libfso-glib_2012.07.27.2.bb:=
PNBLACKLIST[libfso-glib] ?=3D &quot;Depends on blacklisted vala-dbus-bindin=
g-tool - the recipe will be removed on 2017-09-01 unless the issue is fixed=
&quot;
meta-fso/recipes-freesmartphone/freesmartphone/libfso-glib_git.bb:PNBLACKLI=
ST[libfso-glib] ?=3D &quot;Depends on blacklisted vala-dbus-binding-tool - =
the recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-fso/recipes-freesmartphone/freesmartphone/mickeyterm_git.bb:PNBLACKLIS=
T[mickeyterm] ?=3D &quot;Runtime depends on blacklisted fso-gsm0710muxd - t=
he recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-fso/recipes-freesmartphone/freesmartphone/opimd-utils_git.bb:PNBLACKLI=
ST[opimd-utils] ?=3D &quot;Runtime depends on blacklisted ffphonelog - the =
recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-fso/recipes-freesmartphone/freesmartphone/zhone_git.bb:PNBLACKLIST[zho=
ne] ?=3D &quot;rdepends on python-pycairo which was removed - the recipe wi=
ll be removed on 2017-09-01 unless the issue is fixed&quot;
meta-fso/recipes-freesmartphone/packagegroups/packagegroup-fso2-compliance.=
bb:PNBLACKLIST[packagegroup-fso2-compliance] ?=3D &quot;Runtime depends on =
blacklisted fsoaudiod-config - the recipe will be removed on 2017-09-01 unl=
ess the issue is fixed&quot;
meta-fso/recipes-freesmartphone/packagegroups/packagegroup-fso2-compliance.=
bb:PNBLACKLIST[packagegroup-fso2-compliance] ?=3D &quot;Runtime depends on =
blacklisted mkdump - the recipe will be removed on 2017-09-01 unless the is=
sue is fixed&quot;
meta-fso/recipes-freesmartphone/packagegroups/packagegroup-fso2-compliance.=
bb:PNBLACKLIST[packagegroup-fso2-compliance] ?=3D &quot;Runtime depends on =
blacklisted fsonetworkd - the recipe will be removed on 2017-09-01 unless t=
he issue is fixed&quot;
meta-fso/recipes-freesmartphone/packagegroups/packagegroup-fso2-compliance.=
bb:PNBLACKLIST[packagegroup-fso2-compliance] ?=3D &quot;Runtime depends on =
blacklisted fso-apm - the recipe will be removed on 2017-09-01 unless the i=
ssue is fixed&quot;
meta-fso/recipes-freesmartphone/packagegroups/packagegroup-fso2-compliance.=
bb:PNBLACKLIST[packagegroup-fso2-compliance] ?=3D &quot;Runtime depends on =
blacklisted fsodatad - the recipe will be removed on 2017-09-01 unless the =
issue is fixed&quot;
meta-fso/recipes-freesmartphone/packagegroups/packagegroup-fso2-compliance.=
bb:PNBLACKLIST[packagegroup-fso2-compliance] ?=3D &quot;Runtime depends on =
blacklisted packagegroup-fso2-compliance - the recipe will be removed on 20=
17-09-01 unless the issue is fixed&quot;
meta-fso/recipes-freesmartphone/packagegroups/packagegroup-fso2-compliance.=
bb:PNBLACKLIST[packagegroup-fso2-compliance] ?=3D &quot;Runtime depends on =
blacklisted fsogsmd - the recipe will be removed on 2017-09-01 unless the i=
ssue is fixed&quot;
meta-fso/recipes-freesmartphone/packagegroups/packagegroup-fso2-compliance.=
bb:PNBLACKLIST[packagegroup-fso2-compliance] ?=3D &quot;Runtime depends on =
blacklisted mterm2 - the recipe will be removed on 2017-09-01 unless the is=
sue is fixed&quot;
meta-fso/recipes-freesmartphone/packagegroups/packagegroup-fso2-compliance.=
bb:PNBLACKLIST[packagegroup-fso2-compliance] ?=3D &quot;Runtime depends on =
blacklisted fsodeviced - the recipe will be removed on 2017-09-01 unless th=
e issue is fixed&quot;
meta-fso/recipes-freesmartphone/packagegroups/packagegroup-fso2-compliance.=
bb:PNBLACKLIST[packagegroup-fso2-compliance] ?=3D &quot;Runtime depends on =
blacklisted fsotdld - the recipe will be removed on 2017-09-01 unless the i=
ssue is fixed&quot;
meta-fso/recipes-freesmartphone/packagegroups/packagegroup-fso2-compliance.=
bb:PNBLACKLIST[packagegroup-fso2-compliance] ?=3D &quot;Runtime depends on =
blacklisted fsousaged - the recipe will be removed on 2017-09-01 unless the=
 issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/advancedcaching_git.bb:PNBLACKLIST[advancedca=
ching] ?=3D &quot;RDEPENDS on python-pygtk was removed from oe-core - the r=
ecipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/atd-over-fso_0.70.bb:PNBLACKLIST[atd-over-fso=
] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproject.=
org/Errors/Details/130540/" style=3D"box-sizing:border-box;word-wrap:break-=
word;color:rgb(92,53,102)">http://errors.yoctoproject.org/Errors/Details/13=
0540/</a> - the recipe will be removed on 2017-09-01 unless the issue is fi=
xed&quot;
meta-shr/recipes-shr/3rdparty/atrack_svn.bb:PNBLACKLIST[atrack] ?=3D &quot;=
Runtime depends on blacklisted python-elementary - the recipe will be remov=
ed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/babiloo-efl_2.0.9-10.bb:PNBLACKLIST[babiloo-e=
fl] ?=3D &quot;Runtime depends on blacklisted python-elementary - the recip=
e will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/babiloo-efl_bzr.bb:PNBLACKLIST[babiloo-efl] ?=
=3D &quot;Runtime depends on blacklisted python-elementary - the recipe wil=
l be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/babiloo-efl_bzr.bb:PNBLACKLIST[babiloo-efl] ?=
=3D &quot;Runtime depends on blacklisted babiloo-efl - the recipe will be r=
emoved on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/babiloo-efl_bzr.bb:PNBLACKLIST[babiloo-efl] ?=
=3D &quot;Runtime depends on blacklisted babiloo-efl-dev - the recipe will =
be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/chroneo_svn.bb:PNBLACKLIST[chroneo] ?=3D &quo=
t;Runtime depends on blacklisted python-elementary - the recipe will be rem=
oved on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/ecalc_git.bb:PNBLACKLIST[ecalc] ?=3D &quot;Ru=
ntime depends on blacklisted python-edbus - the recipe will be removed on 2=
017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/ecalc_git.bb:PNBLACKLIST[ecalc] ?=3D &quot;Ru=
ntime depends on blacklisted python-elementary - the recipe will be removed=
 on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/emtooth2_svn.bb:PNBLACKLIST[emtooth2] ?=3D &q=
uot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bluez5&#39;, &#39;=
bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES&#39;=
, &#39;&#39;, d)} - the recipe will be removed on 2017-09-01 unless the iss=
ue is fixed&quot;
meta-shr/recipes-shr/3rdparty/estardict_0.7.bb:PNBLACKLIST[estardict] ?=3D =
&quot;Depends on blacklisted elementary - the recipe will be removed on 201=
7-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] =3D &qu=
ot;Doesn&#39;t build after vala upgrade from 0.24.0 to 0.26.1 - the recipe =
will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/ffphonelog_git.bb:PNBLACKLIST[ffphonelog] ?=
=3D &quot;Depends on blacklisted libeflvala - the recipe will be removed on=
 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/guitartune_svn.bb:PNBLACKLIST[guitartune] ?=
=3D &quot;Depends on blacklisted libglade - the recipe will be removed on 2=
017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/gwaterpas_0.3.bb:PNBLACKLIST[gwaterpas] ?=3D =
&quot;broken: depends on blacklisted fltk - the recipe will be removed on 2=
017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] =3D &quot;Doe=
sn&#39;t build after vala upgrade from 0.24.0 to 0.26.1 - the recipe will b=
e removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] =3D &quot;r=
depends on blacklisted mplayer2 - the recipe will be removed on 2017-09-01 =
unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/jefliks_git.bb:PNBLACKLIST[jefliks] ?=3D &quo=
t;depends on blacklisted iksemel - the recipe will be removed on 2017-09-01=
 unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/minneo_svn.bb:PNBLACKLIST[minneo] ?=3D &quot;=
Runtime depends on blacklisted python-elementary - the recipe will be remov=
ed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/mokojeweled_git.bb:PNBLACKLIST[mokojeweled] ?=
=3D &quot;Depends on blacklisted elementary - the recipe will be removed on=
 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/neolight_svn.bb:PNBLACKLIST[neolight] ?=3D &q=
uot;Runtime depends on blacklisted python-edbus - the recipe will be remove=
d on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/neolight_svn.bb:PNBLACKLIST[neolight] ?=3D &q=
uot;Runtime depends on blacklisted python-elementary - the recipe will be r=
emoved on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/neomis_svn.bb:PNBLACKLIST[neomis] ?=3D &quot;=
Runtime depends on blacklisted python-elementary - the recipe will be remov=
ed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/numberx_svn.bb:PNBLACKLIST[numberx] ?=3D &quo=
t;Runtime depends on blacklisted python-elementary - the recipe will be rem=
oved on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/om-neon_svn.bb:PNBLACKLIST[om-neon] ?=3D &quo=
t;Runtime depends on blacklisted python-evas - the recipe will be removed o=
n 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/om-neon_svn.bb:PNBLACKLIST[om-neon] ?=3D &quo=
t;Runtime depends on blacklisted om-neon-dev - the recipe will be removed o=
n 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/om-neon_svn.bb:PNBLACKLIST[om-neon] ?=3D &quo=
t;Runtime depends on blacklisted python-edje - the recipe will be removed o=
n 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/om-neon_svn.bb:PNBLACKLIST[om-neon] ?=3D &quo=
t;Runtime depends on blacklisted python-ecore - the recipe will be removed =
on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/om-neon_svn.bb:PNBLACKLIST[om-neon] ?=3D &quo=
t;Runtime depends on blacklisted om-neon - the recipe will be removed on 20=
17-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/omext_0.2.bb:PNBLACKLIST[omext] ?=3D &quot;Fa=
ils to build with RSS <a href=3D"http://errors.yoctoproject.org/Errors/Deta=
ils/130539/" style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(=
92,53,102)">http://errors.yoctoproject.org/Errors/Details/130539/</a> - the=
 recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/openmoko-gps_svn.bb:PNBLACKLIST[openmoko-gps]=
 ?=3D &quot;RDEPENDS on python-pygtk which was removed from oe-core - the r=
ecipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/pisi_0.5.3.bb:PNBLACKLIST[pisi] ?=3D &quot;RD=
EPENDS on python-pygtk which was removed from oe-core - the recipe will be =
removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/podboy_svn.bb:PNBLACKLIST[podboy] ?=3D &quot;=
${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bluez5&#39;, &#39;blue=
z5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES&#39;, &#=
39;&#39;, d)} - the recipe will be removed on 2017-09-01 unless the issue i=
s fixed&quot;
meta-shr/recipes-shr/3rdparty/rtmom_0.1.3.bb:PNBLACKLIST[rtmom] ?=3D &quot;=
Depends on blacklisted python-elementary - the recipe will be removed on 20=
17-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] =3D &quot=
;Doesn&#39;t build after vala upgrade from 0.24.0 to 0.26.1 - the recipe wi=
ll be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/spojegui_svn.bb:PNBLACKLIST[spojegui] ?=3D &q=
uot;Runtime depends on blacklisted python-elementary - the recipe will be r=
emoved on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/vagalume_0.8.5.bb:PNBLACKLIST[vagalume] ?=3D =
&quot;Depends on blacklisted gstreamer - the recipe will be removed on 2017=
-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompass] =
=3D &quot;Doesn&#39;t build after vala upgrade from 0.24.0 to 0.26.1 - the =
recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/games/aceofpenguins_1.4.bb:PNBLACKLIST[aceofpenguins] =
?=3D &quot;BROKEN: fails to build with new binutils-2.27 - the recipe will =
be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/games/mokoeightball_svn.bb:PNBLACKLIST[mokoeightball] =
?=3D &quot;Depends on blacklisted edje-native - the recipe will be removed =
on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/games/mokoeightball_svn.bb:PNBLACKLIST[mokoeightball] =
?=3D &quot;Runtime depends on blacklisted mokoeightball-dev - the recipe wi=
ll be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/games/mokoeightball_svn.bb:PNBLACKLIST[mokoeightball] =
?=3D &quot;Runtime depends on blacklisted mokoeightball - the recipe will b=
e removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/games/mokomaze_0.5.5.bb:PNBLACKLIST[mokomaze] ?=3D &qu=
ot;Depends on blacklisted libsdl-ttf - the recipe will be removed on 2017-0=
9-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/games/mokomaze_0.5.5.bb:PNBLACKLIST[mokomaze] ?=3D &qu=
ot;Depends on blacklisted ode - the recipe will be removed on 2017-09-01 un=
less the issue is fixed&quot;
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D &quot;Runtime depends on blacklisted mokomaze - th=
e recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D &quot;Runtime depends on blacklisted dates - the r=
ecipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D &quot;Runtime depends on blacklisted dbus-daemon-p=
roxy - the recipe will be removed on 2017-09-01 unless the issue is fixed&q=
uot;
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D &quot;Runtime depends on blacklisted guitartune - =
the recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D &quot;Runtime depends on blacklisted illume-keyboa=
rd-default-numeric - the recipe will be removed on 2017-09-01 unless the is=
sue is fixed&quot;
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D &quot;Runtime depends on blacklisted e-tasks - the=
 recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D &quot;Runtime depends on blacklisted enjoy - the r=
ecipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D &quot;Runtime depends on blacklisted mokojeweled -=
 the recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D &quot;Runtime depends on blacklisted estardict - t=
he recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D &quot;Runtime depends on blacklisted gpe-scap - th=
e recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D &quot;Runtime depends on blacklisted ffphonelog - =
the recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D &quot;Runtime depends on blacklisted om-neon - the=
 recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D &quot;Runtime depends on blacklisted python-elemen=
tary - the recipe will be removed on 2017-09-01 unless the issue is fixed&q=
uot;
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D &quot;Runtime depends on blacklisted elfe - the re=
cipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[pac=
kagegroup-shr-feed] ?=3D &quot;Runtime depends on blacklisted vagalume - th=
e recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/packagegroups/packagegroup-shr-minimal.bb:PNBLACKLIST[=
packagegroup-shr-minimal] ?=3D &quot;Runtime depends on blacklisted shr-wiz=
ard - the recipe will be removed on 2017-09-01 unless the issue is fixed&qu=
ot;
meta-shr/recipes-shr/packagegroups/packagegroup-shr-minimal.bb:PNBLACKLIST[=
packagegroup-shr-minimal] ?=3D &quot;Runtime depends on blacklisted termino=
logy - the recipe will be removed on 2017-09-01 unless the issue is fixed&q=
uot;
meta-shr/recipes-shr/packagegroups/packagegroup-shr-minimal.bb:PNBLACKLIST[=
packagegroup-shr-minimal] ?=3D &quot;Runtime depends on blacklisted package=
group-shr-minimal - the recipe will be removed on 2017-09-01 unless the iss=
ue is fixed&quot;
meta-shr/recipes-shr/packagegroups/packagegroup-shr-minimal.bb:PNBLACKLIST[=
packagegroup-shr-minimal] ?=3D &quot;Runtime depends on blacklisted libphon=
e-ui-shr - the recipe will be removed on 2017-09-01 unless the issue is fix=
ed&quot;
meta-shr/recipes-shr/packagegroups/packagegroup-shr-minimal.bb:PNBLACKLIST[=
packagegroup-shr-minimal] ?=3D &quot;Runtime depends on blacklisted ffphone=
log - the recipe will be removed on 2017-09-01 unless the issue is fixed&qu=
ot;
meta-shr/recipes-shr/packagegroups/packagegroup-shr.bb:PNBLACKLIST[packageg=
roup-shr] ?=3D &quot;Runtime depends on blacklisted packagegroup-cli-tools-=
debug - the recipe will be removed on 2017-09-01 unless the issue is fixed&=
quot;
meta-shr/recipes-shr/packagegroups/packagegroup-shr.bb:PNBLACKLIST[packageg=
roup-shr] ?=3D &quot;Runtime depends on blacklisted packagegroup-shr-minima=
l-cli - the recipe will be removed on 2017-09-01 unless the issue is fixed&=
quot;
meta-shr/recipes-shr/packagegroups/packagegroup-shr.bb:PNBLACKLIST[packageg=
roup-shr] ?=3D &quot;Runtime depends on blacklisted packagegroup-cli-tools =
- the recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/packagegroups/packagegroup-shr.bb:PNBLACKLIST[packageg=
roup-shr] ?=3D &quot;Runtime depends on blacklisted packagegroup-shr-minima=
l-apps - the recipe will be removed on 2017-09-01 unless the issue is fixed=
&quot;
meta-shr/recipes-shr/packagegroups/packagegroup-shr.bb:PNBLACKLIST[packageg=
roup-shr] ?=3D &quot;Runtime depends on blacklisted vagalume - the recipe w=
ill be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/shr/e-wm-config-illume2-shr_git.bb:PNBLACKLIST[e-wm-co=
nfig-illume2-shr] ?=3D &quot;Fails to build with RSS <a href=3D"http://erro=
rs.yoctoproject.org/Errors/Details/130520/" style=3D"box-sizing:border-box;=
word-wrap:break-word;color:rgb(92,53,102)">http://errors.yoctoproject.org/E=
rrors/Details/130520/</a> - the recipe will be removed on 2017-09-01 unless=
 the issue is fixed&quot;
meta-shr/recipes-shr/shr/libphone-ui-shr_git.bb:PNBLACKLIST[libphone-ui-shr=
] ?=3D &quot;Depends on blacklisted elementary - the recipe will be removed=
 on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/shr/libphone-ui_git.bb:PNBLACKLIST[libphone-ui] ?=3D &=
quot;Depends on blacklisted libfso-glib - the recipe will be removed on 201=
7-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/shr/phonefsod_git.bb:PNBLACKLIST[phonefsod] ?=3D &quot=
;Depends on blacklisted libfso-glib - the recipe will be removed on 2017-09=
-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/shr/phoneuid_git.bb:PNBLACKLIST[phoneuid] ?=3D &quot;D=
epends on blacklisted libfso-glib - the recipe will be removed on 2017-09-0=
1 unless the issue is fixed&quot;
meta-shr/recipes-shr/shr/shr-e-gadgets_git.bb:PNBLACKLIST[shr-e-gadgets] ?=
=3D &quot;Depends on blacklisted elementary - the recipe will be removed on=
 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/shr/shr-installer_git.bb:PNBLACKLIST[shr-installer] ?=
=3D &quot;Depends on blacklisted packagekit - the recipe will be removed on=
 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/shr/shr-settings_git.bb:PNBLACKLIST[shr-settings] ?=3D=
 &quot;Runtime depends on blacklisted python-edbus - the recipe will be rem=
oved on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/shr/shr-settings_git.bb:PNBLACKLIST[shr-settings] ?=3D=
 &quot;Runtime depends on blacklisted python-elementary - the recipe will b=
e removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/shr/shr-wizard_git.bb:PNBLACKLIST[shr-wizard] ?=3D &qu=
ot;Depends on blacklisted e-wm - the recipe will be removed on 2017-09-01 u=
nless the issue is fixed&quot;
meta-shr/recipes-shr/themes/e-wm-theme-illume-gry_git.bb:PNBLACKLIST[e-wm-t=
heme-illume-gry] ?=3D &quot;Depends on blacklisted edje-native - the recipe=
 will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/themes/e-wm-theme-illume-gry_git.bb:PNBLACKLIST[e-wm-t=
heme-illume-gry] ?=3D &quot;Runtime depends on blacklisted e-wm-theme-illum=
e-gry - the recipe will be removed on 2017-09-01 unless the issue is fixed&=
quot;
meta-shr/recipes-shr/themes/e-wm-theme-illume-gry_git.bb:PNBLACKLIST[e-wm-t=
heme-illume-gry] ?=3D &quot;Runtime depends on blacklisted e-wm-theme-illum=
e-gry-dev - the recipe will be removed on 2017-09-01 unless the issue is fi=
xed&quot;
meta-shr/recipes-shr/themes/e-wm-theme-illume-gry_git.bb:PNBLACKLIST[e-wm-t=
heme-illume-gry] ?=3D &quot;Runtime depends on blacklisted elementary-theme=
-gry - the recipe will be removed on 2017-09-01 unless the issue is fixed&q=
uot;
meta-shr/recipes-shr/themes/e-wm-theme-illume-neo_git.bb:PNBLACKLIST[e-wm-t=
heme-illume-neo] ?=3D &quot;Runtime depends on blacklisted e-wm - the recip=
e will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/themes/e-wm-theme-illume-neo_git.bb:PNBLACKLIST[e-wm-t=
heme-illume-neo] ?=3D &quot;Runtime depends on blacklisted e-wm-theme-illum=
e-neo-dev - the recipe will be removed on 2017-09-01 unless the issue is fi=
xed&quot;
meta-shr/recipes-shr/themes/e-wm-theme-illume-neo_git.bb:PNBLACKLIST[e-wm-t=
heme-illume-neo] ?=3D &quot;Runtime depends on blacklisted e-wm-theme-illum=
e-neo - the recipe will be removed on 2017-09-01 unless the issue is fixed&=
quot;
meta-shr/recipes-shr/themes/e-wm-theme-illume-niebiee_git.bb:PNBLACKLIST[e-=
wm-theme-illume-niebiee] ?=3D &quot;Depends on blacklisted edje-native - th=
e recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/themes/e-wm-theme-illume-niebiee_git.bb:PNBLACKLIST[e-=
wm-theme-illume-niebiee] ?=3D &quot;Runtime depends on blacklisted e-wm-the=
me-illume-niebiee - the recipe will be removed on 2017-09-01 unless the iss=
ue is fixed&quot;
meta-shr/recipes-shr/themes/e-wm-theme-illume-niebiee_git.bb:PNBLACKLIST[e-=
wm-theme-illume-niebiee] ?=3D &quot;Runtime depends on blacklisted e-wm-the=
me-illume-niebiee-dev - the recipe will be removed on 2017-09-01 unless the=
 issue is fixed&quot;
meta-shr/recipes-shr/themes/e-wm-theme-illume-shr_git.bb:PNBLACKLIST[e-wm-t=
heme-illume-shr] ?=3D &quot;Depends on blacklisted edje-native - the recipe=
 will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/themes/e-wm-theme-illume-shr_git.bb:PNBLACKLIST[e-wm-t=
heme-illume-shr] ?=3D &quot;Runtime depends on blacklisted e-wm-theme-illum=
e-shr-dev - the recipe will be removed on 2017-09-01 unless the issue is fi=
xed&quot;
meta-shr/recipes-shr/themes/e-wm-theme-illume-shr_git.bb:PNBLACKLIST[e-wm-t=
heme-illume-shr] ?=3D &quot;Runtime depends on blacklisted e-wm-theme-illum=
e-shr - the recipe will be removed on 2017-09-01 unless the issue is fixed&=
quot;
meta-shr/recipes-shr/themes/e-wm-theme-illume-sixteen_git.bb:PNBLACKLIST[e-=
wm-theme-illume-sixteen] ?=3D &quot;Depends on blacklisted edje-native - th=
e recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/themes/e-wm-theme-illume-sixteen_git.bb:PNBLACKLIST[e-=
wm-theme-illume-sixteen] ?=3D &quot;Runtime depends on blacklisted e-wm-the=
me-illume-sixteen - the recipe will be removed on 2017-09-01 unless the iss=
ue is fixed&quot;
meta-shr/recipes-shr/themes/e-wm-theme-illume-sixteen_git.bb:PNBLACKLIST[e-=
wm-theme-illume-sixteen] ?=3D &quot;Runtime depends on blacklisted e-wm-the=
me-illume-sixteen-dev - the recipe will be removed on 2017-09-01 unless the=
 issue is fixed&quot;
meta-shr/recipes-shr/themes/e-wm-theme-sowka_git.bb:PNBLACKLIST[e-wm-theme-=
sowka] ?=3D &quot;Depends on blacklisted edje-native - the recipe will be r=
emoved on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/themes/e-wm-theme-sowka_git.bb:PNBLACKLIST[e-wm-theme-=
sowka] ?=3D &quot;Runtime depends on blacklisted e-wm-theme-sowka-dev - the=
 recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/themes/e-wm-theme-sowka_git.bb:PNBLACKLIST[e-wm-theme-=
sowka] ?=3D &quot;Runtime depends on blacklisted e-wm-theme-sowka - the rec=
ipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/themes/elementary-theme-gry_git.bb:PNBLACKLIST[element=
ary-theme-gry] ?=3D &quot;Depends on blacklisted edje-native - the recipe w=
ill be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/themes/elementary-theme-gry_git.bb:PNBLACKLIST[element=
ary-theme-gry] ?=3D &quot;Runtime depends on blacklisted elementary-theme-g=
ry-dev - the recipe will be removed on 2017-09-01 unless the issue is fixed=
&quot;
meta-shr/recipes-shr/themes/elementary-theme-gry_git.bb:PNBLACKLIST[element=
ary-theme-gry] ?=3D &quot;Runtime depends on blacklisted e-wm-theme-illume-=
gry - the recipe will be removed on 2017-09-01 unless the issue is fixed&qu=
ot;
meta-shr/recipes-shr/themes/elementary-theme-gry_git.bb:PNBLACKLIST[element=
ary-theme-gry] ?=3D &quot;Runtime depends on blacklisted elementary-theme-g=
ry - the recipe will be removed on 2017-09-01 unless the issue is fixed&quo=
t;
meta-shr/recipes-shr/themes/elementary-theme-neo_git.bb:PNBLACKLIST[element=
ary-theme-neo] ?=3D &quot;Depends on blacklisted edje-native - the recipe w=
ill be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/themes/elementary-theme-neo_git.bb:PNBLACKLIST[element=
ary-theme-neo] ?=3D &quot;Runtime depends on blacklisted elementary-theme-n=
eo - the recipe will be removed on 2017-09-01 unless the issue is fixed&quo=
t;
meta-shr/recipes-shr/themes/elementary-theme-neo_git.bb:PNBLACKLIST[element=
ary-theme-neo] ?=3D &quot;Runtime depends on blacklisted elementary-theme-n=
eo-dev - the recipe will be removed on 2017-09-01 unless the issue is fixed=
&quot;
meta-shr/recipes-shr/themes/elementary-theme-niebiee_git.bb:PNBLACKLIST[ele=
mentary-theme-niebiee] ?=3D &quot;Depends on blacklisted edje-native - the =
recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/themes/elementary-theme-niebiee_git.bb:PNBLACKLIST[ele=
mentary-theme-niebiee] ?=3D &quot;Runtime depends on blacklisted elementary=
-theme-niebiee - the recipe will be removed on 2017-09-01 unless the issue =
is fixed&quot;
meta-shr/recipes-shr/themes/elementary-theme-niebiee_git.bb:PNBLACKLIST[ele=
mentary-theme-niebiee] ?=3D &quot;Runtime depends on blacklisted elementary=
-theme-niebiee-dev - the recipe will be removed on 2017-09-01 unless the is=
sue is fixed&quot;
meta-shr/recipes-shr/themes/elementary-theme-o2_git.bb:PNBLACKLIST[elementa=
ry-theme-o2] ?=3D &quot;Depends on blacklisted edje-native - the recipe wil=
l be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/themes/elementary-theme-o2_git.bb:PNBLACKLIST[elementa=
ry-theme-o2] ?=3D &quot;Runtime depends on blacklisted elementary-theme-o2-=
dev - the recipe will be removed on 2017-09-01 unless the issue is fixed&qu=
ot;
meta-shr/recipes-shr/themes/elementary-theme-o2_git.bb:PNBLACKLIST[elementa=
ry-theme-o2] ?=3D &quot;Runtime depends on blacklisted elementary-theme-o2 =
- the recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/themes/elementary-theme-sixteen_git.bb:PNBLACKLIST[ele=
mentary-theme-sixteen] ?=3D &quot;Depends on blacklisted edje-native - the =
recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/themes/elementary-theme-sixteen_git.bb:PNBLACKLIST[ele=
mentary-theme-sixteen] ?=3D &quot;Runtime depends on blacklisted elementary=
-theme-sixteen-dev - the recipe will be removed on 2017-09-01 unless the is=
sue is fixed&quot;
meta-shr/recipes-shr/themes/elementary-theme-sixteen_git.bb:PNBLACKLIST[ele=
mentary-theme-sixteen] ?=3D &quot;Runtime depends on blacklisted elementary=
-theme-sixteen - the recipe will be removed on 2017-09-01 unless the issue =
is fixed&quot;
meta-shr/recipes-shr/themes/elementary-theme-sowka_git.bb:PNBLACKLIST[eleme=
ntary-theme-sowka] ?=3D &quot;Depends on blacklisted edje-native - the reci=
pe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/themes/elementary-theme-sowka_git.bb:PNBLACKLIST[eleme=
ntary-theme-sowka] ?=3D &quot;Runtime depends on blacklisted elementary-the=
me-sowka-dev - the recipe will be removed on 2017-09-01 unless the issue is=
 fixed&quot;
meta-shr/recipes-shr/themes/elementary-theme-sowka_git.bb:PNBLACKLIST[eleme=
ntary-theme-sowka] ?=3D &quot;Runtime depends on blacklisted elementary-the=
me-sowka - the recipe will be removed on 2017-09-01 unless the issue is fix=
ed&quot;
meta-shr/recipes-shr/themes/gtk-theme-clearlooks-gtkrc.bb:PNBLACKLIST[gtk-t=
heme-clearlooks-gtkrc] ?=3D &quot;Runtime depends on blacklisted gtk-theme-=
clearlooks - the recipe will be removed on 2017-09-01 unless the issue is f=
ixed&quot;
meta-shr/recipes-shr/themes/gtk-theme-clearlooks-gtkrc.bb:PNBLACKLIST[gtk-t=
heme-clearlooks-gtkrc] ?=3D &quot;Runtime depends on blacklisted gtk-theme-=
clearlooks-gtkrc-dev - the recipe will be removed on 2017-09-01 unless the =
issue is fixed&quot;
meta-shr/recipes-shr/themes/icon-theme-neo_git.bb:PNBLACKLIST[icon-theme-ne=
o] ?=3D &quot;Runtime depends on blacklisted e-wm - the recipe will be remo=
ved on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/themes/icon-theme-neo_git.bb:PNBLACKLIST[icon-theme-ne=
o] ?=3D &quot;Runtime depends on blacklisted icon-theme-neo-dev - the recip=
e will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/themes/phoneui-shr-theme-neo_git.bb:PNBLACKLIST[phoneu=
i-shr-theme-neo] ?=3D &quot;Runtime depends on blacklisted libphone-ui-shr =
- the recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/themes/phoneui-shr-theme-neo_git.bb:PNBLACKLIST[phoneu=
i-shr-theme-neo] ?=3D &quot;Runtime depends on blacklisted phoneui-shr-them=
e-neo-dev - the recipe will be removed on 2017-09-01 unless the issue is fi=
xed&quot;
meta-shr/recipes-shr/themes/phoneui-shr-theme-niebiee_git.bb:PNBLACKLIST[ph=
oneui-shr-theme-niebiee] ?=3D &quot;Runtime depends on blacklisted libphone=
-ui-shr - the recipe will be removed on 2017-09-01 unless the issue is fixe=
d&quot;
meta-shr/recipes-shr/themes/phoneui-shr-theme-o2_git.bb:PNBLACKLIST[phoneui=
-shr-theme-o2] ?=3D &quot;Runtime depends on blacklisted libphone-ui-shr - =
the recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/themes/phoneui-shr-theme-sowka_git.bb:PNBLACKLIST[phon=
eui-shr-theme-sowka] ?=3D &quot;Runtime depends on blacklisted libphone-ui-=
shr - the recipe will be removed on 2017-09-01 unless the issue is fixed&qu=
ot;
meta-shr/recipes-shr/themes/shr-theme-efenniht.bb:PNBLACKLIST[shr-theme-efe=
nniht] ?=3D &quot;Runtime depends on blacklisted e-wm-theme-illume-efenniht=
 - the recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/themes/shr-theme-gry.bb:PNBLACKLIST[shr-theme-gry] ?=
=3D &quot;Runtime depends on blacklisted e-wm-theme-illume-gry - the recipe=
 will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/themes/shr-theme-gry.bb:PNBLACKLIST[shr-theme-gry] ?=
=3D &quot;Runtime depends on blacklisted elementary-theme-gry - the recipe =
will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/themes/shr-theme-neo.bb:PNBLACKLIST[shr-theme-neo] ?=
=3D &quot;Runtime depends on blacklisted shr-theme-neo-dev - the recipe wil=
l be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/themes/shr-theme-neo.bb:PNBLACKLIST[shr-theme-neo] ?=
=3D &quot;Runtime depends on blacklisted shr-theme-neo - the recipe will be=
 removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/themes/shr-theme-neo.bb:PNBLACKLIST[shr-theme-neo] ?=
=3D &quot;Runtime depends on blacklisted e-wm-theme-illume-neo - the recipe=
 will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/themes/shr-theme-niebiee.bb:PNBLACKLIST[shr-theme-nieb=
iee] ?=3D &quot;Runtime depends on blacklisted phoneui-shr-theme-niebiee - =
the recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/themes/shr-theme-niebiee.bb:PNBLACKLIST[shr-theme-nieb=
iee] ?=3D &quot;Runtime depends on blacklisted shr-theme-niebiee - the reci=
pe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/themes/shr-theme-niebiee.bb:PNBLACKLIST[shr-theme-nieb=
iee] ?=3D &quot;Runtime depends on blacklisted shr-theme-niebiee-dev - the =
recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/themes/shr-theme-o2.bb:PNBLACKLIST[shr-theme-o2] ?=3D =
&quot;Runtime depends on blacklisted phoneui-shr-theme-o2 - the recipe will=
 be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/themes/shr-theme-o2.bb:PNBLACKLIST[shr-theme-o2] ?=3D =
&quot;Runtime depends on blacklisted shr-theme-o2 - the recipe will be remo=
ved on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/themes/shr-theme-o2.bb:PNBLACKLIST[shr-theme-o2] ?=3D =
&quot;Runtime depends on blacklisted shr-theme-o2-dev - the recipe will be =
removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/themes/shr-theme-sixteen.bb:PNBLACKLIST[shr-theme-sixt=
een] ?=3D &quot;Runtime depends on blacklisted e-wm-theme-illume-sixteen - =
the recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/themes/shr-theme-sixteen.bb:PNBLACKLIST[shr-theme-sixt=
een] ?=3D &quot;Runtime depends on blacklisted shr-theme-sixteen-dev - the =
recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/themes/shr-theme-sixteen.bb:PNBLACKLIST[shr-theme-sixt=
een] ?=3D &quot;Runtime depends on blacklisted shr-theme-sixteen - the reci=
pe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-shr/recipes-shr/themes/shr-theme-sixteen.bb:PNBLACKLIST[shr-theme-sixt=
een] ?=3D &quot;Runtime depends on blacklisted elementary-theme-sixteen - t=
he recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
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
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 1	issue: textrel
corosync-2.4.0: ELF binary &#39;/tmp/work/core2-64-oe-linux/corosync/2.4.0-=
r0/packages-split/corosync/usr/sbin/corosync&#39; has relocations in .text =
[textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 12	issue: version-going-backwards
gpm-1.99.7: Package version for package gpm-dbg went backwards which would =
break package feeds from (0:1.99.7+git1fd19417b8a4dd9945347e98dfa97e4cfd798=
d77-r2.1 to 0:1.99.7-r2.14) [version-going-backwards]
gpm-1.99.7: Package version for package gpm-dev went backwards which would =
break package feeds from (0:1.99.7+git1fd19417b8a4dd9945347e98dfa97e4cfd798=
d77-r2.1 to 0:1.99.7-r2.14) [version-going-backwards]
gpm-1.99.7: Package version for package gpm-doc went backwards which would =
break package feeds from (0:1.99.7+git1fd19417b8a4dd9945347e98dfa97e4cfd798=
d77-r2.1 to 0:1.99.7-r2.14) [version-going-backwards]
gpm-1.99.7: Package version for package gpm-locale went backwards which wou=
ld break package feeds from (0:1.99.7+git1fd19417b8a4dd9945347e98dfa97e4cfd=
798d77-r2.1 to 0:1.99.7-r2.14) [version-going-backwards]
gpm-1.99.7: Package version for package gpm-staticdev went backwards which =
would break package feeds from (0:1.99.7+git1fd19417b8a4dd9945347e98dfa97e4=
cfd798d77-r2.1 to 0:1.99.7-r2.14) [version-going-backwards]
gpm-1.99.7: Package version for package gpm went backwards which would brea=
k package feeds from (0:1.99.7+git1fd19417b8a4dd9945347e98dfa97e4cfd798d77-=
r2.1 to 0:1.99.7-r2.14) [version-going-backwards]
libqb-0.17.2+gitAUTOINC+bd2c587f6c: Package version for package libqb-dbg w=
ent backwards which would break package feeds from (0:1.0.1+git0+0a329683a7=
-r0.0 to 0:0.17.2+git0+bd2c587f6c-r0.1) [version-going-backwards]
libqb-0.17.2+gitAUTOINC+bd2c587f6c: Package version for package libqb-dev w=
ent backwards which would break package feeds from (0:1.0.1+git0+0a329683a7=
-r0.0 to 0:0.17.2+git0+bd2c587f6c-r0.1) [version-going-backwards]
libqb-0.17.2+gitAUTOINC+bd2c587f6c: Package version for package libqb-doc w=
ent backwards which would break package feeds from (0:1.0.1+git0+0a329683a7=
-r0.0 to 0:0.17.2+git0+bd2c587f6c-r0.1) [version-going-backwards]
libqb-0.17.2+gitAUTOINC+bd2c587f6c: Package version for package libqb-local=
e went backwards which would break package feeds from (0:1.0.1+git0+0a32968=
3a7-r0.0 to 0:0.17.2+git0+bd2c587f6c-r0.1) [version-going-backwards]
libqb-0.17.2+gitAUTOINC+bd2c587f6c: Package version for package libqb-stati=
cdev went backwards which would break package feeds from (0:1.0.1+git0+0a32=
9683a7-r0.0 to 0:0.17.2+git0+bd2c587f6c-r0.1) [version-going-backwards]
libqb-0.17.2+gitAUTOINC+bd2c587f6c: Package version for package libqb went =
backwards which would break package feeds from (0:1.0.1+git0+0a329683a7-r0.=
0 to 0:0.17.2+git0+bd2c587f6c-r0.1) [version-going-backwards]


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
58a0353 fetch2: Do not fail to create symbolic links if they already exist
not included in master yet:=20
223b8cb world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
3b7111b automake: Adjust shebang lines to remove interpreter path hardcode
not included in master yet:=20
96827a3 qemux86: Add identical qemux86copy variant for tests
029268a sstate-sysroot-cruft.sh: Extend the whitelist
f375076 recipes: Replace &quot;cp -a&quot; with &quot;cp -R --no-dereferenc=
e --preserve=3Dmode,links&quot;
50aaf6c buildhistory.bbclass: metadata-revs show repo parent
bf5c6c0 metadata-revs: provide more information
12412b6 report-error: Allow to upload reports automatically
34bd10c Revert &quot;mesa: Contain configure search for llvm&quot;
c6b7628 sstate-diff-machines.sh: Replace MACHINE_ARCH only at the beginning=
 and separated with dash
c76772d x86-base.inc, qemuarm.conf: prefer 4.10 version of linux-yocto

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
56c233b meta-efl: blacklist efl-native and dependent recipes
not included in master yet:=20
48fe7d3 dnsmasq: disable the service by default
4fc0aaf ctdb: Fix build with musl
b906176 libdnet: update SRC_URI
6f1d95f wireless-regdb: fix crda failing from missing pubkey
9146958 ntp: update to 4.2.8.p10
305c802 netcat-openbsd: Fix build and whitelist
f37cbbb v4l-utils: Depend on argp-standalone for musl
9bf6a50 caps: Use c99 int types
0956842 lvm2: Fix patch errors found with musl
a713300 squid: Update to 3.5.23
497babe xfce4-closebutton-plugin: Fix build with clang
a8f34fc xfce4-timer-plugin: Fix build when security flags are enabled with =
clang
a2f6b7f tcsh: Update to 6.20.00 release
37cf3b7 libnfnetlink: Backport patches to fix musl build
c079900 ebtables: Fix build with musl
3b265a7 poco: Upgrade to 1.7.8
0abe3f0 mariadb: Do not use ucontext_* APIs with musl
932afe3 lowpan-tools: Fix build with musl
2e9f4c1 usb-modeswitch-data: Add dep on native tcl
9122654 aufs-util: Define HOSTCC
2ba6384 libraw1394: Update to 2.1.2 release
bc26ab1 libdc1394: Update to 2.2.5+
f14de54 ntfs-3g-ntfsprogs: Upgrade to 2017.3.23
55857ba openl2tp: Fix build with musl
361a4d8 rp-pppoe: Fix build with musl
5c10c68 vsftpd: Fix build with musl
279058d faac: Fix with with security flags and on musl
81f131d dibbler: Upgrade to 1.0.2RC1
fe83470 live555: Do not use XLOCALE on musl
f36dca7 libgxim: Fix build with security flags turned on
ec86e26 vpnc: Update to build from github SRC_URI
3f41479 daq: Fix build with musl
24b911e utouch: Fix build on musl
bb08df7 libavc1394: Add libargp on musl
a6573b3 picocom: Upgrade to 2.2
20ce8ae libexecinfo: Add recipe
338ed98 arptables: Upgrade to 0.0.4
35c14c7 libnetfilter-log: Switch to git URI
de59d4b lxdm: Find libexecinfo if its on platform
5a91fcc libnetfilter-queue: Update to git for SRC_URI
8c898b9 libunique: Fix build with secutiy flags on
8f41510 snort: Fix build with musl
74b43dc pavucontrol: Backport patches to build with c++11 std
7460779 networkmanager: Fix build on musl
10aa746 autofs: Patch to build on musl
9116fa3 jsonrpc: Backport and create patches to build with musl
fe78924 xdebug: 2.2.6 -&gt; 2.5.1
e9690ad python-smbus: upgrade to 3.1.2
4d9e107 opencv: remove redundant build dependency on python2
0c20c4a flite-alsa: Blacklist as old and unmaintained
cf19ea3 logfsprogs: Blacklist, doesn&#39;t have proper PV, doesn&#39;t resp=
ect LDFLAGS
5089798 pngcheck: respect LDFLAGS
7a04e2a uml-utilities: respect LDFLAGS not only for mconsole but for other =
binaries as well
f3e0c03 xdotool: prevent compile-host-path QA issues
4633a7f recipes: add removal date to PNBLACKLIST messages
82d426c dlm: fix ldflags QA warning

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
ff073f0 nativesdk-qtbase: pass -no-icu for deterministic builds
not included in master yet:=20
b35dc32 qtbase-native: create empty oe-device-extra.pri
aa45f48 qtwayland: update build without xkbcommon-evdev
a126a5a Revert &quot;qtbase-native: create empty oe-device-extra.pri&quot;
d3ea645 qtbase-native: create empty oe-device-extra.pri
dad7fae qtchooser: respect LDFLAGS

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
021a954 chromium-browser: add missing dependency on gperf-native
not included in master yet:=20
a9dd704 chromium: disable generate_character_data for x86

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=
=3D
latest upstream commit:=20
4d4ffcb packagegroup-luneos-extended: drop qtscenegraph-adaptation
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
e39c265 android-system-image: fix builds that don&#39;t have overlay-libs
not included in master yet:=20
4fa2b8b meta-shr, meta-fso: blacklist recipes depending on blacklisted efl-=
native
e779eff pycd: respect LDFLAGS
30f1d87 suspend-blocker: respect LDFLAGS
683371b recipes: add removal date to PNBLACKLIST messages
76e0d38 meta-openmoko: remove fbreader bbappend to drop meta-gpe dependency=
</pre></div></div>

--001a114b41e482f0f9054c67f23a--
