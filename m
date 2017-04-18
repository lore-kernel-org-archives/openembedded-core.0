Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id BBC3E6093F;
	Tue, 18 Apr 2017 11:45:58 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id c55so100602182wrc.3;
	Tue, 18 Apr 2017 04:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=R5V9Yj5Lx/5WjFSi6bFV4q4L0khIYl/HUXwaP31hQRs=;
	b=b6/6mEY213dJR25nPCnJ+5pcR/rjgd8k2gLcEoVTDrlNNQ/hTVKbjQcpilHGM89Hdl
	lerB8eZ01fUwjYsjMyMmHs95WxHEsbVYHBwAaVYDUPJNaUOpPE65Yx+G7ZGrNcAaaVKI
	bKG9Qo5im9VXNxr9hXVdJVPAt5UBqzb3y8ow+5sUTJONG8s476sqDQwDBFhuMkifG5jv
	FZENE4+p2SzYu5ap54QkIEl1D447A9oIK7cfCGYpUj/StZQbTtc90M7NeOq6zOXKuOA1
	jM5zHDdOfFCr2SUzWA1Hv3KiByx3gG0WQScm5GZrbdkOQOSyrlMcF8f1N3gsII88Xf+d
	jq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=R5V9Yj5Lx/5WjFSi6bFV4q4L0khIYl/HUXwaP31hQRs=;
	b=rSEL2f4rs/vXHGBhfTo8ITANrMRKUcgjfYDIsfXr+JHq1X88bp5JQVdu8yKOMNzmjy
	FW8Ib/HFAWGFgWCNzDjIU2PTmv6outfNLAGFHjzgjqOJbm3dekMYnV5fsPcsPTCpJH0r
	c64LVqPn4S5PLdojfgP+sZgyNJb5JJQra9ZorHSkdezyiq84W+J4EMDeqQntxOl/HiU8
	o8Xxfbz0qOz2+3QsDNzUV9+X3/68eiGHNwNpGWjXkJxwYJnL9zkGWZ7EedAdTIwD8kux
	y0aoasz6lIUcJvKBdMTTOUDI+aBpkz696DGJvPY36aAFzx6E9FQpXh/h4TJytA31h4gP
	JjZw==
X-Gm-Message-State: AN3rC/7xJeFIi/M1HwgbCji9ff3bDx1omXqLL7HU5jaL9FQRWwWHFUZZ
	o8vrM0/U90qUqD8H
X-Received: by 10.223.160.59 with SMTP id k56mr24877637wrk.0.1492515958854;
	Tue, 18 Apr 2017 04:45:58 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	g53sm18456329wrg.22.2017.04.18.04.45.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 18 Apr 2017 04:45:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 18 Apr 2017 13:46:01 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170418114601.GA3126@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.0 (2017-02-23)
Subject: State of bitbake world, Failed tasks 2017-04-14
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
X-List-Received-Date: Tue, 18 Apr 2017 11:46:01 -0000
X-Groupsio-MsgNum: 96368
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline

--ZGiS0Q5IWpPtfppv
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
||2017-04-14	||2	||1	||1	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||0		=
||4		||0		||0		||11		||0		||0		||0		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2017-04-14 =3D=3D

INFO: jenkins-job.sh-1.8.20 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20170415_220922.log

=3D=3D=3D common (1) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-kernel/netmap/netmap-module=
s_git.bb:do_install

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * meta-openembedded/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-task=
manager_1.2.0.bb:do_fetch

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (4) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemuarm.20170413_064054.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/36136/
|-
|| qemux86 	|| 1	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemux86.20170413_084501.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/36138/
|-
|| qemux86_64 	|| 1	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.world.qemux86-64.20170414_111731.log/ || http://errors.yoctoproject.or=
g/Errors/Build/36140/
|}

=3D=3D=3D PNBLACKLISTs (435) =3D=3D=3D

=3D=3D=3D QA issues (15) =3D=3D=3D
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
||11	||version-going-backwards
|-
||4	||textrel
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20170414_063413.log/

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


count: 11	issue: version-going-backwards
php-7.1.0: Package version for package php-cgi went backwards which would b=
reak package feeds from (0:7.1.0-r0.3 to 0:7.1.0-r0.0) [version-going-backw=
ards]
php-7.1.0: Package version for package php-cli went backwards which would b=
reak package feeds from (0:7.1.0-r0.3 to 0:7.1.0-r0.0) [version-going-backw=
ards]
php-7.1.0: Package version for package php-dbg went backwards which would b=
reak package feeds from (0:7.1.0-r0.3 to 0:7.1.0-r0.0) [version-going-backw=
ards]
php-7.1.0: Package version for package php-dev went backwards which would b=
reak package feeds from (0:7.1.0-r0.3 to 0:7.1.0-r0.0) [version-going-backw=
ards]
php-7.1.0: Package version for package php-doc went backwards which would b=
reak package feeds from (0:7.1.0-r0.3 to 0:7.1.0-r0.0) [version-going-backw=
ards]
php-7.1.0: Package version for package php-fpm-apache2 went backwards which=
 would break package feeds from (0:7.1.0-r0.3 to 0:7.1.0-r0.0) [version-goi=
ng-backwards]
php-7.1.0: Package version for package php-fpm went backwards which would b=
reak package feeds from (0:7.1.0-r0.3 to 0:7.1.0-r0.0) [version-going-backw=
ards]
php-7.1.0: Package version for package php-pear went backwards which would =
break package feeds from (0:7.1.0-r0.3 to 0:7.1.0-r0.0) [version-going-back=
wards]
php-7.1.0: Package version for package php-phar went backwards which would =
break package feeds from (0:7.1.0-r0.3 to 0:7.1.0-r0.0) [version-going-back=
wards]
php-7.1.0: Package version for package php-staticdev went backwards which w=
ould break package feeds from (0:7.1.0-r0.3 to 0:7.1.0-r0.0) [version-going=
-backwards]
php-7.1.0: Package version for package php went backwards which would break=
 package feeds from (0:7.1.0-r0.3 to 0:7.1.0-r0.0) [version-going-backwards]


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
4fca9a0 bitbake-layers: add signal hander to avoid exception
not included in master yet:=20
801b638 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
334020a oe-run-native: explicitly use bash
not included in master yet:=20
0cb27d2 qemux86: Add identical qemux86copy variant for tests
e6fd322 sstate-sysroot-cruft.sh: Extend the whitelist
87a09f7 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
01e2bc5 buildhistory.bbclass: metadata-revs show repo parent
85011d8 metadata-revs: provide more information
5df76b7 report-error: Allow to upload reports automatically
86dcb73 Revert "mesa: Contain configure search for llvm"
305b362 sstate-diff-machines.sh: Replace MACHINE_ARCH only at the beginning=
 and separated with dash

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
2cdea6c opencv: do not depend on swig.
not included in master yet:=20
58ab7e7 dnsmasq: disable the service by default
6f2211f ctdb: Fix build with musl
1b4faaa libdnet: update SRC_URI
71e87d2 wireless-regdb: fix crda failing from missing pubkey
111f5a1 ntp: update to 4.2.8.p10
f02bf65 netcat-openbsd: Fix build and whitelist
d10e553 squid: Update to 3.5.23
3a6d00d libnfnetlink: Backport patches to fix musl build
a6fdeb5 ebtables: Fix build with musl
ee50a62 lowpan-tools: Fix build with musl
c618865 openl2tp: Fix build with musl
42ae4be rp-pppoe: Fix build with musl
8b43571 vsftpd: Fix build with musl
b4be2cf dibbler: Upgrade to 1.0.2RC1
a1ea1e2 vpnc: Update to build from github SRC_URI
2a069d2 daq: Fix build with musl
344d12d arptables: Upgrade to 0.0.4
e5adeee libnetfilter-log: Switch to git URI
8a3bacd libnetfilter-queue: Update to git for SRC_URI
14940fb snort: Fix build with musl
6ba1224 autofs: Patch to build on musl
d128374 ntimed: Use adjtimex on musl
a42d2a5 python-gsocketpool: add new recipe
2e15792 python-mprpc: add new recipe
90edc47 f2fs-tools: Update to Version 1.8.0
b448257 uftp: Add recipe
1446151 gd : CVE-2016-10166
a7cfd07 python-paho-mqtt: make recipe available as python3 version
cf5df37 nfacct: fixed SRC_URI and dropped workdir statement
8e46904 librcf: install missing SF headers
bc2aa1b jack: remove (non-existing) package jack from dependencies of jack-=
dev
c5b556b gd : CVE-2016-10167, CVE-2016-10168
64f1a86 python-pyalsaaudio: Extend recipe to support Python 3
e465ee4 fbida: Fix compile-host-path error
e7edeac postfix: do NOT create directory /var/spool/mail
b30acfa waf-samba.bbclass: redefine WAF_CROSS_ANSWERS_PATH
83221cf gflags: correct S and update library install directory
8c22760 opencv: correct subpackage name for multilib
8bacd5c libnet-ssleay-perl: add openssl-native to DEPENDS
d568399 quagga: set ac_cv_path_PERL to '/usr/bin/env perl'
93e9895 crash: 7.1.5 -> 7.1.8
a7e0db0 wireguard: add WireGuard kernel module and tools
6b71b31 autoconf-archive: Upgrade to 2016.09.16
0d822fe openvpn: ensure ${sysconfdir}/tmpfiles.d is packaged
b606e02 openvpn: remove duplicate attempt to create dir in ${localstatedir}
43fb941 openvpn: openvpn-volatile.conf: avoid hardcoded localstatedir
c3078e5 fltk: rework completely
6c4b1cb jack: update to latest git-revision
f950337 thunar: update 1.6.10 -> 1.6.11
21d2fa4 geany: update 1.29 -> 1.30.1
473468e geany-plugins: update 1.29 -> 1.30
17e5257 xfce4-notifyd: update 0.3.4 -> 0.3.6
1cb9f42 xfce4-taskmanager: update 1.1.0 -> 1.2.0
5a68c0e xfce4-terminal: update 0.8.3 -> 0.8.4
2794aba xfce4-diskperf-plugin: update 2.6.0 -> 2.6.1
676011f xfwm4: 4.12.3 -> 4.12.4
9bbe73c xfce4-weather-plugin: update 0.8.8 -> 0.8.9
407806c xfce4-systemload-plugin: update 1.2.0 -> 1.2.1
7f1b2e4 xfce4-netload-plugin: update 1.3.0 -> 1.3.1
fa8f196 xfce4-equake-plugin: update 1.3.8 -> 1.3.8.1
8a859af xfce4-genmon-plugin: update 3.4.0 -> 4.0.0
38d8d62 xfce4-whiskermenu-plugin: update 2.1.0 -> 2.1.2
664f1b8 networkmanager: update 1.4.2 -> 1.4.4
5217b48 networkmanager-openvpn: add glib-2.0-native to DEPENDS and unblackl=
ist
1dc4ae7 networkmanager-openvpn: pack static libs properly
9986b15 networkmanager-openvpn: update 1.2.6 -> 1.2.8
d39b765 network-manager-applet: update 1.4.2 -> 1.4.4
f71d0c3 xfce4-mount-plugin: update 0.6.4 -> 1.1.2
e86a758 poppler: update 0.51.0 -> 0.53.0
6e0b846 libass: update 0.13.2 -> 0.13.6
218e362 mpv: update 0.15.0 -> 0.24.0
83b4811 mpv: add PACKAGECONFIG for drm/gbm/vdpau/wayland
3f9d999 xfce4-closebutton-plugin: Upstream clang-fix-patch
bd17787 xarchiver: Upstream printf-fix-patch
e2fbcd2 xfce4-sensors-plugin: update 1.2.6 -> 1.2.97
6e9a58c php: remove PNBLACKLIST
c4b1404 openvpn: avoid packaging /run
b182a55 openvpn: avoid hardcoded path
ea9d10e netmap: Update to tip and fix misc build issues

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
817fc2a qtchooser: respect LDFLAGS
not included in master yet:=20
5b0bb2b qtdeclarative: fix memory leaks
e03d290 qtwayland: fix initial window property values
5f837b4 qttools: add ptest

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
7c08bb1 Merge pull request #28 from twoerner/contrib/twoerner/chromium_54_p=
ush
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
4d4ffcb packagegroup-luneos-extended: drop qtscenegraph-adaptation
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
d150b0a meta-openmoko: remove fbreader bbappend to drop meta-gpe dependency
not included in master yet:=20

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWPX8eQAKCRA3VSO3ZXaA
HG/UAKCkjgA7nnsOswoQltEbQkvIaLvcywCfcgk5cPXjntGlSnEMKJvddG5o0/4=
=eIii
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
