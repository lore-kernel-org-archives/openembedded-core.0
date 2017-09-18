Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6A00F77DAF;
	Mon, 18 Sep 2017 08:10:44 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id m18so5498082wrm.2;
	Mon, 18 Sep 2017 01:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=Pp7zFq6CfBoGDLTv0j7GWf3fuLz9OYvZK64yYapg77Q=;
	b=i5HoojUwp+MwDZ7+xPHOoFO/GYQsAhzFVTD5VMnxEDNQuSa33piCJrn0mqPepHx84M
	FPaJOc3VNMtLoXI6g5XORkbPP2s3OQ5c+Mn5KonYNeycI+uSAuR3OOTkKyETrQoai0D3
	SY1ldmKrtAEAd3XFwHm8MZOEQ9oPFV7kTz8yrJejzS3hc6kglpN9GmcIo8kmihlZzcvm
	n1UL8ZASgPE0aTFYmv4CmFZ2wJfQ9HzW9u8l2kiRE6BZd8RoWDTeEezpDEV1fzyDwJF4
	xSxiyZWG/v//uEKHMZ3ACr+IqaVdz7NoVMIfpuIdxVsoJXCRp4hmv4P+SqqpLwjAYFhe
	Tzng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=Pp7zFq6CfBoGDLTv0j7GWf3fuLz9OYvZK64yYapg77Q=;
	b=NbAW/EzapBj/CA3wjeSnTnMtCIYlQZOGE6wvOJdgFPNbNLLNGl68pA/01wZuBG6IwF
	X/UJzeyWrTFin9ijNKDnI80JstI/w7wUu3QYpYt5pfPgDdUcTpt1IBnPPCuawJUuPTOI
	DU0kt+b8fY3nkXzLMKO1ag7X0CkWV82ha6YwNFL0r4C0ji2ZF5v5CAMeLAhHdwNYpqJi
	tRAZtS/QjSBN0zH3iJgtLi9oirrcigEcFXhzWE+kXdTZJFXc0J5BLIk9e1+0tg+FZKBg
	pM/aLnoqonWOGH/D3Q6HgXoqR+GqsjoX4a3nqBG3YO13AW/s7wO7DNh/v+4IAFLi0av6
	fBtA==
X-Gm-Message-State: AHPjjUiAvoOHUSLhCZt0aQgJsRlb3eP75u8etrsEiDov9sVtYz/r9x8s
	JaKyV4WOliX/yIB1
X-Google-Smtp-Source: ADKCNb56OZr7AZYFPSxmQcfOI07a4gqb3jIgqPkSA8aWHp06IXjNB+dYpQAdmMDve/+dpsUI+8ppQg==
X-Received: by 10.223.142.73 with SMTP id n67mr25651785wrb.278.1505722244548; 
	Mon, 18 Sep 2017 01:10:44 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	a19sm6924734wra.64.2017.09.18.01.10.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Sep 2017 01:10:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 18 Sep 2017 10:13:10 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170918081310.GA3340@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.9.0 (2017-09-02)
Subject: State of bitbake world, Failed tasks 2017-09-16
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
X-List-Received-Date: Mon, 18 Sep 2017 08:10:45 -0000
X-Groupsio-MsgNum: 103038
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline

--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Number of issues - stats =3D=3D
{| class=3D'wikitable'
!|Date		     !!colspan=3D'3'|Failed tasks			    !!|Signatures		  !!colspan=
=3D'14'|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||all 	||already-stripped	||libdir	||t=
extrel	||build-deps	||file-rdeps	||version-going-backwards	||host-user-cont=
aminated	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sys=
root	||invalid-pkgconfig	||pkgname	||ldflags	||compile-host-path	||=09
|-
||2017-09-16	||3	||3	||2	||0	||0		||0		||4		||0		||0		||85		||3		||0		||0		=
||0		||0		||0		||0		||0		||=09
|}

=3D=3D Failed tasks 2017-09-16 =3D=3D

INFO: jenkins-job.sh-1.8.29 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/rocko/log.report.20170917_105055.log

=3D=3D=3D common (2) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
    * meta-openembedded/meta-oe/recipes-devtools/breakpad/breakpad_git.bb:d=
o_compile

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tool=
s_5.1.1.r37.bb:do_compile

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-support/spice/spice_git.bb:=
do_compile

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (8) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 3	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/l=
og.world.qemuarm.20170915_121016.log/ || http://errors.yoctoproject.org/Err=
ors/Build/46793/
|-
|| qemux86 	|| 3	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/l=
og.world.qemux86.20170915_121016.log/ ||=20
|-
|| qemux86_64 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rock=
o/log.world.qemux86-64.20170916_165103.log/ || http://errors.yoctoproject.o=
rg/Errors/Build/46803/
|}

=3D=3D=3D PNBLACKLISTs (1) =3D=3D=3D

=3D=3D=3D QA issues (92) =3D=3D=3D
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
||3	||host-user-contaminated
|-
||4	||textrel
|-
||85	||version-going-backwards
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.sign=
atures.20170916_004526.log/


    * ERROR: Nothing PROVIDES 'spice' (but /home/jenkins/oe/world/shr-core/=
openembedded-core/meta/recipes-devtools/qemu/qemu_2.10.0.bb DEPENDS on or o=
therwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable pr=
oviders.


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACK=
LIST[lksctp-tools] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gol=
d', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
meta-qt5:
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


QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 4	issue: textrel
corosync-2.4.2: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]
go-dep-0.3.0: ELF binary '/tmp/work/i586-oe-linux/go-dep/0.3.0-r0/packages-=
split/go-dep/usr/bin/dep' has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/tmp/work/i586-oe-linux/x264/=
r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264-bin/usr/bin/x264' has re=
locations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/tmp/work/i586-oe-linux/x264/=
r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148' =
has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 85	issue: version-going-backwards
gnome-keyring-2.32.1: Package version for package gnome-keyring-dbg went ba=
ckwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.32.1-r=
12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-dev went ba=
ckwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.32.1-r=
12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-doc went ba=
ckwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.32.1-r=
12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ar w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ast =
went backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2=
=2E32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-as w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-az w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-be+l=
atin went backwards which would break package feeds from (0:2.32.1-r12.42 t=
o 0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-be w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-bg w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-bn-i=
n went backwards which would break package feeds from (0:2.32.1-r12.42 to 0=
:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-bn w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-bs w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ca+v=
alencia went backwards which would break package feeds from (0:2.32.1-r12.4=
2 to 0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ca w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-cs w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-cy w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-da w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-de w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-dz w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-el w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-en-c=
a went backwards which would break package feeds from (0:2.32.1-r12.42 to 0=
:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-en-g=
b went backwards which would break package feeds from (0:2.32.1-r12.42 to 0=
:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-en+s=
haw went backwards which would break package feeds from (0:2.32.1-r12.42 to=
 0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-es w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-et w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-eu w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-fa w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-fi w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-fr w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ga w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-gl w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-gu w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-he w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-hi w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-hr w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-hu w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-id w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-is w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-it w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ja w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ka w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-kn w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ko w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-lt w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-lv w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-mai =
went backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2=
=2E32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-mg w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-mk w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ml w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-mn w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-mr w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ms w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-nb w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ne w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-nl w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-nn w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-oc w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-or w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-pa w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-pl w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-pt-b=
r went backwards which would break package feeds from (0:2.32.1-r12.42 to 0=
:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-pt w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ro w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ru w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-rw w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-si w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-sk w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-sl w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-sq w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-sr+l=
atin went backwards which would break package feeds from (0:2.32.1-r12.42 t=
o 0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-sr w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-sv w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ta w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-te w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-th w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-tr w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-uk w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-vi w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-xh w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-zh-c=
n went backwards which would break package feeds from (0:2.32.1-r12.42 to 0=
:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-zh-h=
k went backwards which would break package feeds from (0:2.32.1-r12.42 to 0=
:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-zh-t=
w went backwards which would break package feeds from (0:2.32.1-r12.42 to 0=
:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-staticdev w=
ent backwards which would break package feeds from (0:2.32.1-r12.42 to 0:2.=
32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring went backwa=
rds which would break package feeds from (0:2.32.1-r12.42 to 0:2.32.1-r12.0=
) [version-going-backwards]


count: 3	issue: host-user-contaminated
libqofono-0.87+gitrAUTOINC+54435de3be: libqofono: /libqofono-tests/usr/lib/=
libqofono-qt5/tests/tst_qofonocallbarring is owned by uid 3004, which is th=
e same as the user running bitbake. This may be due to host contamination [=
host-user-contaminated]
qtenginio-5.9.2+gitAUTOINC+0555cf73c8: qtenginio: /qtenginio-mkspecs/usr/li=
b/qt5/mkspecs/modules/qt_lib_enginio_private.pri is owned by uid 3004, whic=
h is the same as the user running bitbake. This may be due to host contamin=
ation [host-user-contaminated]
qtwebkit-examples-5.9.2+gitAUTOINC+a24c780b60: qtwebkit-examples: /qtwebkit=
-examples-examples/usr/share/qt5/examples/webkitwidgets/imageanalyzer/image=
analyzer.pro is owned by uid 3004, which is the same as the user running bi=
tbake. This may be due to host contamination [host-user-contaminated]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
567f2cf server/process: ensure server failure log is limited to current ses=
sion
not included in master yet:=20
3ec2af2 world-image: add extra target
8eebabe fetch2: Allow Fetch.download() to warn instead of error

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
8fe9fb4 python*native.bbclass: suppress user site dirs
not included in master yet:=20
0d7ac07 report-error: Allow to upload reports automatically
20d6101 buildhistory.bbclass: metadata-revs show repo parent
202fb4c metadata-revs: provide more information
b3500a7 qemux86: Add identical qemux86copy variant for tests
0de46b0 reproducible_build.bbclass: initial support for binary reproducibil=
ity
d407a03 cpio: provide cpio-replacement-native
c872fa6 image_types.bbclass: improve cpio image reproducibility
3fcc641 rootfs-postcommands.bbclass: support binary reproducibility
a132f03 sstate.bbclass: Do not cause build failures due to setscene errors
198ea0e insane.bbclass: Add do_qa_pseudo function to check for common error=
s listed in pseudo.log
3283a1c insane.bbclass: do_qa_pseudo: don't trigger error from '^inode mism=
atch'
beb394d insane.bbclass: do_qa_pseudo: show parts of pseudo.log in console
a7fade6 libsdl2: allow to build native and nativesdk
9109a3c libdrm: allow to build native and nativesdk
d5de2c8 nativesdk-mesa,mesa-native: add new recipe to build small part of m=
esa
dbfdced libepoxy: add support for native(sdk)
68f3ea7 libjpeg-turbo: provide nativesdk version
f8c8b3e virglrenderer: add new recipe
a72f13e virglrenderer: fix target build
ea8e866 qemu: add PACKAGECONFIG for virtglrenderer, sdl2 and spice
bdcbb16 WIP: qemu: enable sdl2 virglrenderer gtk+ spice
d30dc76 useradd: don't override pseudo environment

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
4a45235 opencv: Fix build with clang
not included in master yet:=20
df98f41 dnsmasq: disable the service by default
fb19f49 openconnect: fix parallel compilation failure
9dafbb4 autofs: Fix build with musl
6e742d3 yp-tools: Upgrade to 4.2.2
ef15059 vim: Remove xfce vim bbappend
6fff604 leveldb: Fix build with clang
2864d93 klibc: Edit out gcc hardcoding in do_compile
d20ab2d klibc.bbclass: Use forcevariable override to define flags
dceaa50 klibc.bbclass: Add -mfloat-abi on arm
2e68338 smbnetfs: delete blacklisted
3f06336 system-setup-keyboard: delete blacklisted
14a15c0 python-jsonschema, python3-jsonschema: add vcversioner-native depen=
dency
a9n master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
743b3b9 qtbase-native: Force use of built-in pcre
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
972cab7 gnome-settings-daemon: remove the bbappend for removed recipe
not included in master yet:=20
5fcf848 chromium: hide textrel QA issues which are there for ages
e2a7c50 Revert "firefox: Pave ways to remove gcc specific compiler flags"
b7c4b3c Revert "firefox: Fix host library contamination on x86_64"
ae65831 Revert "firefox: Fix build with x86_64/musl"

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWb+AFQAKCRA3VSO3ZXaA
HDEkAKCnMSr60zA3Wdi5C0LLtHBMiW9SZwCfQG1o2J/uuj5TVVuq49R5Gz8JCmg=
=+XBb
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
