Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0B9D472F21;
	Mon, 24 Apr 2017 08:56:06 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id r190so60996364wme.1;
	Mon, 24 Apr 2017 01:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=7BQqC4RU7eSIBAB02CR2/ax7fa2qMBv0Qy+3IgDShFc=;
	b=HJhCVJEBiq9RCr4YT7NNtld+lkebPoA1Ul0dK7X8OWdDMaZ2vFMejVLICcuK/nrp+X
	IbbDjfwaG/68fCHhVwAtL0894oyH0XjfCDdd5SNLK34XU+AvBebeEbNJFrt8GF3H71c8
	lW3ijkCWHk8gsR3xl05/In+IgS/jAbxIWif9y3rr8d8nnVYMmsYD0qjy8iHVsXRWsVJw
	926cuhfLa6wQWmZBZx+Y+41voQ/WfwiJWC+5PUw87QyN2Ch/NDnB/8+NXbTfYCcoj2qe
	aIWed/MN4d6bcJmrRzLZ7G2sgXnMIfPbx9KtFHnbu/p6W0nhbdg7WV8Gtoj0RsZ0BcNG
	p1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=7BQqC4RU7eSIBAB02CR2/ax7fa2qMBv0Qy+3IgDShFc=;
	b=tGRV1CGbO2GuO8G4p/TTlEStxUwYi+Cv/P4z375dtrac2UsRqL50EHGV+VJdTZziO7
	zWlyT9Xn5eZtujT11buM5yvhE2wQ4CPpedvT+Uq1uMPIG9c8A/r3jVvCXQIDGiZs3EOs
	7rxQBclfgYpV8RpwmovEW2WSzX5cSkfoXU/aVf7iWfJ5rV1Ky2J2HBqrRiv/F7XQuPrZ
	qt4wySH3pK9RWV0aGUFbrZfrA8lDKx8yfCDtsDiM1w+kY2STs6qfWbUDTi7EW3WW5cCv
	PmxrnEDQQRLX7sC7S7qG39LIlec66+/RgZYECz527VvwWOIEirc6Sk5x+55Gg4wXZbrp
	6G+g==
X-Gm-Message-State: AN3rC/5Z4awjpc+k6JHjAi2tVotMoqNrSCGsDEQZBBut02s+BuY35e0A
	dKHZCvXzabIoqAtd
X-Received: by 10.28.182.69 with SMTP id g66mr8984994wmf.112.1493024167168;
	Mon, 24 Apr 2017 01:56:07 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	l133sm4211978wmf.17.2017.04.24.01.56.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 24 Apr 2017 01:56:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 24 Apr 2017 10:56:20 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170424085620.GA3647@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.2 (2017-04-18)
Subject: State of bitbake world, Failed tasks 2017-04-21
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
X-List-Received-Date: Mon, 24 Apr 2017 08:56:07 -0000
X-Groupsio-MsgNum: 96602
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline

--sdtB3X0nJg68CQEu
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
||2017-04-21	||0	||0	||1	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||0		=
||4		||0		||0		||0		||3		||1		||0		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2017-04-21 =3D=3D

INFO: jenkins-job.sh-1.8.20 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20170422_215526.log

=3D=3D=3D common () =3D=3D=3D

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-smartphone/meta-shr/recipes-shr/shr/libshr-glib_git.bb:do_compile

=3D=3D=3D Number of failed tasks (1) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 0	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemuarm.20170420_081343.log/ ||=20
|-
|| qemux86 	|| 0	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemux86.20170420_081345.log/ ||=20
|-
|| qemux86_64 	|| 1	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.world.qemux86-64.20170421_103926.log/ || http://errors.yoctoproject.or=
g/Errors/Build/36359/
|}

=3D=3D=3D PNBLACKLISTs (434) =3D=3D=3D

=3D=3D=3D QA issues (8) =3D=3D=3D
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
||1	||installed-vs-shipped
|-
||3	||host-user-contaminated
|-
||4	||textrel
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20170421_064351.log/

No issues detected

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


count: 3	issue: host-user-contaminated
glibc-locale-2.25: glibc-locale: /glibc-binary-localedata-de-be+euro.iso-88=
59-15/usr/lib/locale/de_BE@euro.ISO-8859-15/LC_TELEPHONE is owned by uid 30=
04, which is the same as the user running bitbake. This may be due to host =
contamination [host-user-contaminated]
glibc-locale-2.25: glibc-locale: /glibc-binary-localedata-es-uy/usr/lib/loc=
ale/es_UY/LC_NUMERIC is owned by uid 3004, which is the same as the user ru=
nning bitbake. This may be due to host contamination [host-user-contaminate=
d]
lirc: /lirc-contrib/usr/share/lirc/contrib/lircrc/volume_alsa.lircrc is own=
ed by uid 3004, which is the same as the user running bitbake. This may be =
due to host contamination [host-user-contaminated]


count: 1	issue: installed-vs-shipped
lirc: 3 installed and not shipped files. [installed-vs-shipped]


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
b4da94a bitbake: Update version to 1.34.0 for stable release
not included in master yet:=20
f44de21 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
c6cd586 kexec-tools: Add again the x32 patch
not included in master yet:=20
804093b qemux86: Add identical qemux86copy variant for tests
0605055 sstate-sysroot-cruft.sh: Extend the whitelist
8a275dc recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
6456185 buildhistory.bbclass: metadata-revs show repo parent
a3d17a8 metadata-revs: provide more information
938cabe report-error: Allow to upload reports automatically
7ad3f51 Revert "mesa: Contain configure search for llvm"
efb3dfe sstate-diff-machines.sh: Replace MACHINE_ARCH only at the beginning=
 and separated with dash

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
444e1fb php: remove PNBLACKLIST
not included in master yet:=20
67886f8 dnsmasq: disable the service by default
9e26576 ctdb: Fix build with musl
77d199b libdnet: update SRC_URI
56fee45 wireless-regdb: fix crda failing from missing pubkey
3e017c8 ntp: update to 4.2.8.p10
a9841c0 netcat-openbsd: Fix build and whitelist
f20a1f5 squid: Update to 3.5.23
ee92739 libnfnetlink: Backport patches to fix musl build
7b808ee ebtables: Fix build with musl
1c968cc lowpan-tools: Fix build with musl
e26761f openl2tp: Fix build with musl
a1065c8 rp-pppoe: Fix build with musl
3c277f7 vsftpd: Fix build with musl
657bc99 dibbler: Upgrade to 1.0.2RC1
71531fb vpnc: Update to build from github SRC_URI
1b497d1 daq: Fix build with musl
10f5521 arptables: Upgrade to 0.0.4
35a5bb6 libnetfilter-log: Switch to git URI
1f8fc0f libnetfilter-queue: Update to git for SRC_URI
4be38ae snort: Fix build with musl
f52b5cb autofs: Patch to build on musl
731ad41 ntimed: Use adjtimex on musl
ebde31d uftp: Add recipe
e1b7d3e nfacct: fixed SRC_URI and dropped workdir statement
4eae490 postfix: do NOT create directory /var/spool/mail
3c646c8 waf-samba.bbclass: redefine WAF_CROSS_ANSWERS_PATH
444988a quagga: set ac_cv_path_PERL to '/usr/bin/env perl'
62f2aaf wireguard: add WireGuard kernel module and tools
3a919df openvpn: ensure ${sysconfdir}/tmpfiles.d is packaged
9daceb0 openvpn: remove duplicate attempt to create dir in ${localstatedir}
572b186 openvpn: openvpn-volatile.conf: avoid hardcoded localstatedir
cbabc23 openvpn: avoid packaging /run
f5c07b9 openvpn: avoid hardcoded path
f9d4836 openzone: make build and unblacklist
b7ec4d0 libsodium: Extend recipe for native and nativesdk usage
9d7a92e wireshark: update to 2.2.6
5ff522f gevent: update 0.13.8 -> 1.2.1
8d817b3 python-systemd, python3-systemd: add a new recipes
498816b florence: unblacklist - gstreamer is fine
7524bce devilspie2: add gettext to inherit and unblacklist
187b304 devilspie2: update 0.33 -> 0.42
644c41b mcelog: upgrade to 1.49 to support Denverton SoC
19060a0 python-can: add initial recipe for version 1.5.2
bab0a4c klibc: disable PARALLEL_MAKE
281675a hunspell: update 1.3.3 -> 1.6.1
62b7ad5 gimp: update 2.8.18 -> 2.8.20
5cc04ef samba: fix conflict between samba and sudo packages
186e4f2 python-gsocketpool: add new recipe
83bd6e5 python-mprpc: add new recipe
a012cb8 libmicrohttpd: update to version 0.9.53
3246451 autoconf-archive: drop m4files confliction with gnome-common
e1179ec lowpan-tools: Fix build with clang
88e852a ez-ipupdate: Fix formatting security warnings
1919438 libnetfilter-conntrack: Upgrade to 1.0.6
609e8a4 conntrack-tools: Upgrade to 1.4.4
059776e libnetfilter-acct: Fix build with clang
189e790 libnetfilter-queue: Fix symbol visibility bug found with clang
ff58736 libnetfilter-cthelper,libnetfilter-cttimeout: Backport patches to f=
ix symbol visibility
fdb4d1b libnftnl: Upgrade to 1.0.7
df2bcf7 nftables: Upgrade to 0.7
6c00d62 mtr: Upgrade 0.87+git
7d62293 ckermit: Fix build with musl
edbc236 fftw: Add -D_GNU_SOURCE to CFLAGS
5e9c5e1 tipcutils: Fix build with musl
f9ff134 lcdproc: Upgrade to 0.5.8
35891a4 evince: Upgrade to 3.24.0
e67e662 sharutils: Upgrade to 4.15.2
cee60ea avro-c: Fix build with clang
dd284a0 dash: Fix build with clang
8aa6027 xfce4-notes-plugin: Fix format string errors
3843433 dates: Fix buils with security flags
78b8e63 zeromq: Upgrade to 4.1.6
b0a6dab cdparanoia: Fix autoconf do it builds on new arches like aarch64
a2abbbf pngcheck: Fix cross build and format string errors
eec9c95 librcf: Fix build on aarch64
b4731c7 libutempter: Fix build with musl
5a72cef mosh: Upgrade to 1.3.0
bd20a60 dstat: Add missing dep on xmlto-native
fd5e1c6 mg: Upgrade to 20170401 release
ae0c4d8 lirc: update to 0.9.4d
2b822fc gtksourceview2: Fix build with clang
3b8e1b3 python-lxml,python3-lxml: Fix libxslt format warnings
58ec000 ne10: Fix build errors on cortex-a7 cpus
49de0a7 live555: Update from 20130430  to 20170410

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
5f837b4 qttools: add ptest
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
a0a78fb Merge pull request #32 from kraj/kraj/master
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
4d4ffcb packagegroup-luneos-extended: drop qtscenegraph-adaptation
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
d150b0a meta-openmoko: remove fbreader bbappend to drop meta-gpe dependency
not included in master yet:=20

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWP29swAKCRA3VSO3ZXaA
HPy4AJwIXdH2Z6Wv42PeNmsNQKNJobdrrwCdGyKTo5t3hM84Qh/7QE0PdMUmhqQ=
=mPr7
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
