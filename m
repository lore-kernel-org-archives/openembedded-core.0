Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5D51077A54;
	Wed, 22 Mar 2017 12:51:13 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id v203so8528150wmg.0;
	Wed, 22 Mar 2017 05:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=RTs/yTsTAZrlRRNFbxW4d2sPpECkSn216rqasj2fZv4=;
	b=YM8DJtSX1IjRk1SFzd7RMFAPG032pG8oJLKfa+pACGdeCvRZMYU+2EDs4Oz7yuwm3/
	vpjds5iMNIhKdzfzu9TyKJty5YzObDTUCAZqxnYX5TX5ZLHX51Byr3Gov48NcLPkGvf8
	xTfcVHyiHy/+m0cJvTBdV4vn2kj8kZIYSZouh7/lKrNysMqNDb8eEiwjrk+tMx0Kfr3X
	uLvE3GYdVQX9g/QbqYpcyVB1QJ+w0Po9cMhbrG3Q1qBxDrHZNElEQqBTviSzJoSR1+0r
	CEnbRLcD6KS1zRWRFmOWsqJVwFXUrlxyZNpvQVb9zwKKgVQV5uhW7h+Arr6YnmiawR5o
	o+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=RTs/yTsTAZrlRRNFbxW4d2sPpECkSn216rqasj2fZv4=;
	b=gLHxc8hwoAZbmcQ4/mg3KPZs0U/df82zU3ZFlDaKEFKA1tkYF2tDTa5v6c3vQlw6J8
	d5aXjAt9dVzixxlnGYND3F7vRffsJnUKOQWYrLPzVN6OpQ9u+sXXe37xx3fl9pG/V/tm
	3mxmaMkluPA5yNfejV1uvb4foN/Om0bdihrHYVSFRZCXqC1Vmzzl9MmFMBEn2UBf9TMN
	9NVgqEPk+kG2jolU8CD8VWpf7R1lYE0JOumRZscZQEncS46YqAQtjbl7EYH0ysnK/Fj6
	aHAKmY5XJPKyAKCPVs0n98K9GCJJk1ROnqz+AURJzwrTmqmWC/N3cRLMdr4T6IPAwaWW
	lZVg==
X-Gm-Message-State: AFeK/H0MuC49yRWYPUuQgqPTK+kWd41/GDn+IhQzgCwtQZfwuTqvZhWZmVTCFQOu0p+fZA==
X-Received: by 10.28.36.84 with SMTP id k81mr7485367wmk.114.1490187074678;
	Wed, 22 Mar 2017 05:51:14 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	x133sm264946wme.22.2017.03.22.05.51.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 Mar 2017 05:51:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 22 Mar 2017 13:51:20 +0100
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170322125120.GB3293@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.0 (2017-02-23)
Subject: State of bitbake world, Failed tasks 2017-03-21
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
X-List-Received-Date: Wed, 22 Mar 2017 12:51:15 -0000
X-Groupsio-MsgNum: 95057
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZfOjI3PrQbgiZnxM"
Content-Disposition: inline

--ZfOjI3PrQbgiZnxM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This time executed without sstate-cache and downloads directory from
previous builds, so there is complete list of QA issues and couple
do_fetch failures.

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
||2017-03-21	||8	||9	||10	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||0	=
	||3		||0		||0		||0		||1		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2017-03-21 =3D=3D

INFO: jenkins-job.sh-1.8.19 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20170322_022728.log

=3D=3D=3D common (8) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-multimedia/alsa-equal/alsa-=
equal_0.6.bb:do_fetch
    * meta-openembedded/meta-oe/recipes-extended/libqb/libqb_0.17.2.bb:do_f=
etch
    * meta-openembedded/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_1=
=2E500.bb:do_fetch
    * meta-openembedded/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-s=
ans-narrow_1.07.4.bb:do_fetch
    * meta-openembedded/meta-oe/recipes-support/hwdata/hwdata_0.291.bb:do_f=
etch
    * meta-openembedded/meta-oe/recipes-support/mailcap/mailcap_2.1.46.bb:d=
o_fetch
    * meta-openembedded/meta-python/recipes-devtools/python/python-slip-dbu=
s_0.6.1.bb:do_fetch
    * virtual:native:meta-openembedded/meta-efl/recipes-efl/efl/efl_1.15.1.=
bb:do_compile

=3D=3D=3D common-x86 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxguestd=
rivers_5.1.14.bb:do_install

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-daemons/iscsi-initiator-uti=
ls/iscsi-initiator-utils_2.0.874.bb:do_compile

=3D=3D=3D Number of failed tasks (27) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 8	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemuarm.20170320_000751.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/34690/
|-
|| qemux86 	|| 9	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemux86.20170320_000755.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/34691/
|-
|| qemux86_64 	|| 10	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.world.qemux86-64.20170321_015544.log/ || http://errors.yoctoproject.o=
rg/Errors/Build/34766/
|}

=3D=3D=3D PNBLACKLISTs (351) =3D=3D=3D

=3D=3D=3D QA issues (4) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||file-rdeps
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
||1	||host-user-contaminated
|-
||3	||textrel
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20170320_230515.log/

No issues detected

QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 3	issue: textrel
chromium-52.0.2743.76: ELF binary '/tmp/work/i586-oe-linux/chromium/52.0.27=
43.76-r0/packages-split/chromium/usr/bin/chromium/chrome' has relocations i=
n .text [textrel]
chromium-wayland-53.0.2785.143: ELF binary '/tmp/work/i586-oe-linux/chromiu=
m-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium=
/chrome' has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/tmp/work/i586-oe-linux/x264/=
r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148' =
has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 0	issue: version-going-backwards


count: 1	issue: host-user-contaminated
glibc-locale-2.25: glibc-locale: /glibc-binary-localedata-sc-it/usr/lib/loc=
ale/sc_IT/LC_CTYPE is owned by uid 3004, which is the same as the user runn=
ing bitbake. This may be due to host contamination [host-user-contaminated]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
1ff9b3c tests/data: Add inactive remove override test
not included in master yet:=20
0de3f5c world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
6b9dd7a runqemu: add -h and --help
not included in master yet:=20
441c047 qemux86: Add identical qemux86copy variant for tests
aac7049 sstate-sysroot-cruft.sh: Extend the whitelist
4d1ea0b recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
1ed0cb8 buildhistory.bbclass: metadata-revs show repo parent
74759a5 metadata-revs: provide more information
f0edd16 report-error: Allow to upload reports automatically
6517c08 bitbake.conf: Add few more binaries to HOSTTOOLS_NONFATAL
6b20aff bitbake.conf: Temporary add few more binaries to HOSTTOOLS_NONFATAL
23ee4fc rm_work.bbclass: re-enable recursive do_rm_work_all
13345f3 file: update SRCREV for 5.30 to fix fetch fail on missing commit

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
6c58437 devmem2: use different filename to avoid checksum conflicts
not included in master yet:=20
905fbbb netcat-openbsd: fix implicit dependency on pkg-config
4c42ee8 inetutils: Move files only when src !=3D dst.
388a7c1 ebtables: Move files only when src !=3D dst.
7713250 netcf_git: Check if src !=3D dst while moving files.
cf03bb0 dnsmasq: add info for port setting
883b622 dnsmasq: disable the service by default
4dc46af ptpd: add pkgconfig to inherit
1ae1853 samba: update tevent_internal.h
a9633bc wireshark: update to 2.2.5
4039086 postfix: remove references to buildmachine paths in target makedefs=
=2Eout
c30223d chrony: fix build failure for arma9
f5044fb openflow: add dependency on openssl-native
c065bb3 libnet-ssleay-perl: Update to 1.80
486982a core-image-minimal-xfce: Drop ROOTFS_PKGMANAGE_BOOTSTRAP
2532fd0 inetutils: bump priority to avoid conflict issue
c9465fc eject: use update-alternatives for manpage
bb8bf6d inetutils: use update-alternatives for more manpages
df614fb efl: append -fPIC only for target builds

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
9927aac qtbase: PACKAGECONFIG[gtk] change gtk+ -> gtk+3 in dependencies
not included in master yet:=20
4f44a57 packagegroup-qt5-toolchain-target: Add QtSerialBus to meta-toolchai=
n-qt5.
abc89e9 qtbase-native; do not build qdbuscpp2xml and qdbusxml2cpp bootstrap=
ped
77a7558 qtwebengine: add commercial license
b72a117 packagegroup-qt5-toolchain-target: add qtquickcontrols2 package
c4e34aa qtwebengine: show progress for do_compile
ff073f0 nativesdk-qtbase: pass -no-icu for deterministic builds

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
021a954 chromium-browser: add missing dependency on gperf-native
not included in master yet:=20
a9dd704 chromium: disable generate_character_data for x86

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
4d4ffcb packagegroup-luneos-extended: drop qtscenegraph-adaptation
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
e39c265 android-system-image: fix builds that don't have overlay-libs
not included in master yet:=20

--ZfOjI3PrQbgiZnxM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWNJy8wAKCRA3VSO3ZXaA
HO9kAKCCnlB4p6dIiHR77Xq9e/Fl/hGWpQCgtgtbT6r2kjLPvRSRD25/Z388PnU=
=grVk
-----END PGP SIGNATURE-----

--ZfOjI3PrQbgiZnxM--
