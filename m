Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id DFC686612D;
	Wed,  3 May 2017 17:17:18 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id w50so113883006wrc.0;
	Wed, 03 May 2017 10:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=KYCpS5mZIa2/yk90MVNQjqS6vDpAv0ECpDabQh7dHt0=;
	b=NeaN0Eyb+3TbDBGVVaSGcDRb7I0jONDwAmo6Pj13NpmPqzCUpQYQNd/VoTiie3tg5A
	3Q/uvWY4S2qttmonDopuoFcOjAnVmiPkx5J/Cr5I0aGjasi/X7Fm3R5UpD3bBauBL0Dx
	TwGtudi2HKjOmcP26VwohHZfEVgJlAsHjA8glJv3hOUoJ7wfijwKtn1Ppbrwrs2qhVFk
	I8r1wgiuWDKGDOmgIXS0uXnryDPQwHHbF1lbg1malWdrNNAoH3NXHw/aRxGEpitISjcc
	+zkpR7jcINQinBroaXBOs1r6V+aKMSAo2j7d9vh3gHiCMWTljXpj8qi/VprVGDvFUmdk
	Yl6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=KYCpS5mZIa2/yk90MVNQjqS6vDpAv0ECpDabQh7dHt0=;
	b=dU/9+wkH69XOKMhXPPC4OO6bP3bTSXiSaf8m7mho/aKhd1wJu703HJsKidlZEwBGAa
	YLJcbyIPn0gJ1BxfL9W6PDlFApUsJ8MI5fWgkpJW76iHBIPzRxyg1ZsPoG67Fa7bHkyM
	wZ31Jx0JQQ0CHOC2PRqgTYm2YukAu7ovqBDtigsX7nUwZNQrDTB/5GkMzWqtmFl34Vsi
	hBfWz+Jhmt3CTsSBm5DQ42YOLf/CEfmDX420wf6bQ61tYlRu7wVCie4F6goCp9kpdE1f
	CvO80kmrFhQTpLRtVYizf+ellAc531mXHeUOJUdjiYHpZZKK5GaeoP7c3l8PybzWRPAv
	0QXg==
X-Gm-Message-State: AN3rC/4jSNqZ3ufMqwg5XKa3Yqz1QaX3oALB64nd80xEsFtpotV6gdgx
	mhK4H2NcKDPlUk1X
X-Received: by 10.223.178.236 with SMTP id g99mr23391982wrd.126.1493831839182; 
	Wed, 03 May 2017 10:17:19 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id b80sm5472596wma.5.2017.05.03.10.17.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 03 May 2017 10:17:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 3 May 2017 19:17:46 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170503171746.GB3037@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.2 (2017-04-18)
Subject: State of bitbake world, Failed tasks 2017-05-02
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
X-List-Received-Date: Wed, 03 May 2017 17:17:19 -0000
X-Groupsio-MsgNum: 96886
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PmA2V3Z32TCmWXqI"
Content-Disposition: inline

--PmA2V3Z32TCmWXqI
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
||2017-05-02	||2	||1	||1	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||0		=
||4		||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2017-05-02 =3D=3D

INFO: jenkins-job.sh-1.8.20 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20170503_071555.log

=3D=3D=3D common (1) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-kernel/wireguard/wireguard-=
module_0.0.20170421.bb:do_compile

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * meta-qt5/recipes-qt/maliit/maliit-framework-qt5_git.bb:do_compile

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (4) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemuarm.20170430_231747.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/36942/
|-
|| qemux86 	|| 1	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemux86.20170430_231746.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/36947/
|-
|| qemux86_64 	|| 1	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.world.qemux86-64.20170502_013719.log/ || http://errors.yoctoproject.or=
g/Errors/Build/37003/
|}

=3D=3D=3D PNBLACKLISTs (12) =3D=3D=3D

=3D=3D=3D QA issues (4) =3D=3D=3D
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
||0	||version-going-backwards
|-
||4	||textrel
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20170501_212115.log/

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
recipes-browser/chromium/cef3_280796.bb:PNBLACKLIST[cef3] ?=3D "BROKEN: fai=
ls to build with gcc-6"
meta-openembedded:
meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb:PNBLACKLIST[xfsdump=
] ?=3D "Depends on broken xfsprogs - the recipe will be removed on 2017-09-=
01 unless the issue is fixed"
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACK=
LIST[lksctp-tools] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gol=
d', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
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
meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtr=
otgps] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conf=
licts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=3D "${@bb.u=
tils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 an=
d bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=3D "${@bb.u=
tils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 an=
d bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml] =
?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts w=
ith bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-qt5:
meta-smartphone:
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


count: 4	issue: textrel
chromium-54.0.2810.2: ELF binary '/tmp/work/i586-oe-linux/chromium/54.0.281=
0.2-r0/packages-split/chromium/usr/bin/chromium/chrome' has relocations in =
=2Etext [textrel]
chromium-wayland-53.0.2785.143: ELF binary '/tmp/work/i586-oe-linux/chromiu=
m-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium=
/chrome' has relocations in .text [textrel]
corosync-2.4.2: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/tmp/work/i586-oe-linux/x264/=
r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148' =
has relocations in .text [textrel]


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
1239620 build-appliance-image: Update to master head revision
not included in master yet:=20
694ad36 qemux86: Add identical qemux86copy variant for tests
ed35bdb sstate-sysroot-cruft.sh: Extend the whitelist
28afd80 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
5189c80 buildhistory.bbclass: metadata-revs show repo parent
671c350 metadata-revs: provide more information
0ce4192 report-error: Allow to upload reports automatically
ffdb51c Revert "mesa: Contain configure search for llvm"
258fcce sstate-diff-machines.sh: Replace MACHINE_ARCH only at the beginning=
 and separated with dash
dfd46cc v86d,qemuboot-x86.inc: use KERNEL_MODULE_AUTOLOAD+KERNEL_MODULE_PRO=
BECONF for uvesafb instead of fbsetup init script

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
e7ad92d evince: fix do_install problem
not included in master yet:=20
a4d905f dnsmasq: disable the service by default
fa1f548 freeradius: add new recipe
8b8125b recipes: remove blacklisted recipes

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
5f837b4 qttools: add ptest
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
4ed7feb Merge pull request #35 from schnitzeltony/chrome-progress
not included in master yet:=20
08c4293 gnome-settings-daemon: remove the bbappend for removed recipe

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
c325204 packagegroup-luneos-extended: drop qtscenegraph-adaptation
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
d150b0a meta-openmoko: remove fbreader bbappend to drop meta-gpe dependency
not included in master yet:=20
582db78 libshr-glib: blacklist because of random failures
a08ea69 meta-shr, meta-fso: remove blacklisted recipes

--PmA2V3Z32TCmWXqI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWQoQugAKCRA3VSO3ZXaA
HCEFAJ9ZpqV/CGh2FNcGujfzop7nw5podQCfSH7rXO0Fp/bi5P/KNEKsC+qlVOA=
=6yTX
-----END PGP SIGNATURE-----

--PmA2V3Z32TCmWXqI--
