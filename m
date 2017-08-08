Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4985671A39;
	Tue,  8 Aug 2017 19:39:39 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id t138so8723303wmt.1;
	Tue, 08 Aug 2017 12:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=jH+oJu14NE34c2xs3Jps4foV0eGaBuL4SGg3Q7zOfh4=;
	b=tOQhQk/RDI+V0IokPm8Zzfx0T08VEvWGvNzyDLbhm/F8hEZdtGeVUx0lc8es2p6Snh
	JLCKE2bND0aN+JSs4ullBiVGrnzsaDel19hBjAjH4EmRQT1sZL94ZQl9cyXEjn5lK5ux
	A+DxJrqn0fkJga4+xl/kpNKXxh/dqGr7i53nRQp3ExWQOfxH96txb+xCTjF3jHGXY59H
	d4lPJOA3ScJTuX2ZyWuCwLdF4UfY8iGIzHLqDngB58GLzy/tiEaSLP5bp5Icqh8E2xK4
	bXb2PNRwtNpMeA/0v+QtEB4mQEvxINqyJLNLLCqxrRwKBPE3AFmaeln4cNMh1c9FAmU+
	2qsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=jH+oJu14NE34c2xs3Jps4foV0eGaBuL4SGg3Q7zOfh4=;
	b=QWkQV+gUmcPm7JIxRjpJfYA7E/vDtz+INwTr+J3Q7GWU0StKnKAXnSyMHEaS0hVbI6
	BWFbnX/sb6uvsQrTSBdcfIKoCsmQL4pjeqSm5K8cDENR9dWa3TkmiDEwZ+Z6oipTAYpA
	of8woyzbi0itpWKjCA+p+zzGbGbJyBzToJ65HKdS6/8X100KuvesH1PR5xS1OAo9HdnP
	C8yRkFA0GFu92P0G7aTLnfwpL33O/dGTDHS5v2URdIk/mhNfwdh+nVG2zUwDTu2B17Ts
	ennd/AUIQ8BpDXpUTM9Eimss/M4+4zCyQ6dSsvc4efH2bf4GcbnNhv8wg6aXAxyrjr1Q
	Plcg==
X-Gm-Message-State: AHYfb5jhAa8ABoN16ncNuALRkWiW7S1lDy0YHManakppYtT8NfQRVaDe
	oE79eZRDcFbnfjGp
X-Received: by 10.28.65.138 with SMTP id o132mr4130414wma.81.1502221180553;
	Tue, 08 Aug 2017 12:39:40 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id z9sm1923866wrz.0.2017.08.08.12.39.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 08 Aug 2017 12:39:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 8 Aug 2017 21:41:08 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170808194108.GA3018@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.3 (2017-05-23)
Subject: State of bitbake world, Failed tasks 2017-08-07
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
X-List-Received-Date: Tue, 08 Aug 2017 19:39:40 -0000
X-Groupsio-MsgNum: 101157
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline

--fdj2RfSjLxBAspz7
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
||2017-08-07	||2	||2	||5	||0	||0		||0		||5		||0		||0		||5		||0		||0		||0		|=
|0		||0		||0		||0		||0		||=09
|}

=3D=3D Failed tasks 2017-08-07 =3D=3D

INFO: jenkins-job.sh-1.8.25 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/rocko/log.report.20170808_093147.log

=3D=3D=3D common (0) =3D=3D=3D

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (2) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/mysql/mariadb_5.5.55.bb:do_=
compile

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile

=3D=3D=3D qemux86_64 (3) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-daemons/squid/squid_3.5.26.=
bb:do_configure
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb:do_c=
ompile
    * openembedded-core/meta/recipes-graphics/mesa/mesa_17.1.5.bb:do_config=
ure

=3D=3D=3D Number of failed tasks (9) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/l=
og.world.qemuarm.20170806_111543.log/ || http://errors.yoctoproject.org/Err=
ors/Build/43150/
|-
|| qemux86 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/l=
og.world.qemux86.20170806_111546.log/ || http://errors.yoctoproject.org/Err=
ors/Build/43153/
|-
|| qemux86_64 	|| 5	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rock=
o/log.world.qemux86-64.20170807_125222.log/ || http://errors.yoctoproject.o=
rg/Errors/Build/43156/
http://errors.yoctoproject.org/Errors/Build/43172/
|}

=3D=3D=3D PNBLACKLISTs (1) =3D=3D=3D

=3D=3D=3D QA issues (10) =3D=3D=3D
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
||5	||textrel
|-
||5	||version-going-backwards
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.sign=
atures.20170807_093247.log/

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACK=
LIST[lksctp-tools] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gol=
d', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
meta-qt5:
meta-smartphone:
meta-webos-ports:
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


count: 5	issue: textrel
chromium-54.0.2810.2: ELF binary '/tmp/work/i586-oe-linux/chromium/54.0.281=
0.2-r0/packages-split/chromium/usr/bin/chromium/chrome' has relocations in =
=2Etext [textrel]
chromium-wayland-53.0.2785.143: ELF binary '/tmp/work/i586-oe-linux/chromiu=
m-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium=
/chrome' has relocations in .text [textrel]
corosync-2.4.2: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/tmp/work/i586-oe-linux/x264/=
r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264-bin/usr/bin/x264' has re=
locations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/tmp/work/i586-oe-linux/x264/=
r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148' =
has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 5	issue: version-going-backwards
initramfs-framework-1.0: Package version for package initramfs-framework-ba=
se went backwards which would break package feeds from (0:1.0-r2.27 to 0:1.=
0-r2.0) [version-going-backwards]
initramfs-framework-1.0: Package version for package initramfs-module-debug=
 went backwards which would break package feeds from (0:1.0-r2.27 to 0:1.0-=
r2.0) [version-going-backwards]
initramfs-framework-1.0: Package version for package initramfs-module-e2fs =
went backwards which would break package feeds from (0:1.0-r2.27 to 0:1.0-r=
2.0) [version-going-backwards]
initramfs-framework-1.0: Package version for package initramfs-module-mdev =
went backwards which would break package feeds from (0:1.0-r2.27 to 0:1.0-r=
2.0) [version-going-backwards]
initramfs-framework-1.0: Package version for package initramfs-module-udev =
went backwards which would break package feeds from (0:1.0-r2.27 to 0:1.0-r=
2.0) [version-going-backwards]


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
1b14f11 fetch2/__init__.py: replace stray logger.warn() with logger.warning=
()
not included in master yet:=20
d239cc4 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
51b3ee2 gnome-themes-standard: Fix packages so dev-pkgs image generation wo=
rks
not included in master yet:=20
851a6ad report-error: Allow to upload reports automatically
d13e96c buildhistory.bbclass: metadata-revs show repo parent
7426b87 metadata-revs: provide more information
03583df qemux86: Add identical qemux86copy variant for tests

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
a8b54e3 pidgin-otr: unblacklist
not included in master yet:=20
627c0da dnsmasq: disable the service by default
1c0b20d rdate: Fix build with hardening
812b1de strongswan: Include stdint.h for uintptr_t
e887307 netkit-rpc: Fix build with hardening flags
25bab80 netkit-telnet: Fix build with hardening
d053851 ncftp: Upgrade to 3.2.6
ef1f2d3 autofs: Add build dependency on libnsl2
45cb3ea openhpi: Fix build on 64bit platforms e.g. aarch64
0ca1629 security_flags.inc: Delete
908965b pptp-linux: Upgrade to 1.9.0
ac540aa ebtables: replace ebtables-save perl script with bash rewrite
ed3f7a2 pimd: Upgrade to 2.3.2
156dc7d igmpproxy: Include missing sys/tupes.h and define _GNU_SOURCE
2019e68 rdate: Define logwtmp if libc !=3D glibc
469326a netkit-ftp: Include sys/types.h for u_long definition
4e5a633 postfix: Disable nis support on musl
55cd330 zeroconf: Fix build with musl
6f5c1da netperf: change SRC_URI to git repository
78d47b6 ippool: Fix build errors found with hardening flags
1635d50 openflow: Fix build with musl
dc71c92 xl2tpd: Update to 1.3.9
c688bd7 wvstreams: Fix build with musl
2e691cd meson: set needs_exe_wrapper
ce6c02b gperftools: Upgrade to 2.6.1
97b7e8f c-ares: update 1.12.0 -> 1.13.0
11537f3 radvd: 2.14 -> 2.17
ea2a594 pam-ssh-agent-auth: add new recipe
18666bd libpwquality: add recipe 1.4.0
b4d181c libbytesize: add recipe 0.10
bbdebb3 libtimezonemap: add recipe 0.4.5
a519ff1 xmlrpc-c: add recipe 1.31.0
a3f5ca2 usermode: add recipe 1.111
af2ed39 syslog-ng: provide correct PID directory location to restart/stop s=
yslog-ng daemon
4e132a3 python-pyserial: update to version 3.4
4ac7a9c recipes: remove blacklisted recipes
1bb205c bluez4: remove bluez4-only recipes
c905fdf libotr: Upgrade from 4.0.0 to 4.1.1 and update patches
c8456c6 pidgin: Update from 2.11.0 to 2.12.0
32feeb8 Revert "c-ares: update 1.12.0 -> 1.13.0"

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
8960831 qwt-qt5.inc: fix QA warning
not included in master yet:=20
e16a165 qtbase: add ptest
4cf5a0e Revert "qtbase: add ptest"

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
6c063d6 Merge pull request #53 from kraj/kraj/master
not included in master yet:=20
8ca260e gnome-settings-daemon: remove the bbappend for removed recipe

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
ed77d4f alsa-lib: Remove 0001-ucm-fix-handling-of-config-files-when-file-ty=
pe-is-n.patch
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
1fe2b3b android-system-image-tenderloin: update Android image
not included in master yet:=20
e468a34 meta-shr, meta-fso: remove blacklisted recipes

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWYoT0wAKCRA3VSO3ZXaA
HLatAJ43ntlwLffvaA/FBHOtUHywkhD4BgCfRq2DQ3npu/udplTNxtL7p3V0WkU=
=UAdx
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
