Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id F2F63605C3;
	Sat, 12 Aug 2017 18:51:57 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id 26so7198285wrt.5;
	Sat, 12 Aug 2017 11:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=341XElmgLZYJnz2n5+vFXWjwAucLFcjDXNZnyYq7G6E=;
	b=aBkHg/IrLZrcEd4YoX6knEV1xK+0i/ue7lMtZjh+WAxO98rUHNz9kN4jRcvIOXlLQH
	hHHsHGgczY8gQC6iXqhB1Gp6IggWTZ+hUiEit5Mg8SxlOrRtxEvLbCgurL2bsSpVd8r3
	4NzGLG9XFeMk7OsCLYMTOs9kFLDMNBIRsFaMNrBGIc9pDB/7ipb+S3tAT4rd/Gdujv5D
	UE/uCJjvANlE78qwpXebHkW9EiWQyZJpsakiOu4S97Og1bdeLVnnE7fM/Q7pgEapobE2
	FIXKYR/OxMs25KZKvJnRM0vsZ/EI8C3KQMmKmDF7fJb2TN9yIezSgnTOYZmUtRZQPuqq
	XbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=341XElmgLZYJnz2n5+vFXWjwAucLFcjDXNZnyYq7G6E=;
	b=URtmRVDQWlBjoyPVEJZiCW0XLDir+I6sKfe38ClrBvk1lIzXeVXGAOrb96qqB9C8Aa
	8gIHMnir5ONh4SVqt5/iC2O7sPmIsLoM1RVJppGZNXirewNAJAJat5N/CPUpc4ld4OpB
	RZA6yxa2+7HJDsOT1q+qi6I4oU9vgXe84m7ueXFliEjDe4i1/HimEk0JAQjS8VupJ37s
	OK1cE1g7F41q6zqzi7CVU4JQaiVeLlmKvwyUYCVcy/iQbtWyHIwvlHymGSQ8qLiCJHDh
	zz3HI/pIlrBFf8JEKtmTp6pZiZYSc5p5sn2ZFQJ+3BT6+fxxJv5m01j2LqPNxr9UTOs4
	0mTg==
X-Gm-Message-State: AHYfb5iQAe2MoqS/u7ETfHMI3DBUF3QFVpbh8/lBd+ADj+9SDx5u/C4R
	OZhTf1IohSaXaN9I
X-Received: by 10.223.163.158 with SMTP id l30mr15434777wrb.203.1502563918368; 
	Sat, 12 Aug 2017 11:51:58 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	x14sm4835303wmd.19.2017.08.12.11.51.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 12 Aug 2017 11:51:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 12 Aug 2017 20:53:29 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170812185329.GB3337@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.3 (2017-05-23)
Subject: State of bitbake world, Failed tasks 2017-08-11
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
X-List-Received-Date: Sat, 12 Aug 2017 18:51:58 -0000
X-Groupsio-MsgNum: 101336
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VrqPEDrXMn8OVzN4"
Content-Disposition: inline

--VrqPEDrXMn8OVzN4
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
||2017-08-11	||3	||4	||2	||0	||0		||0		||4		||0		||0		||18		||2		||0		||0		=
||0		||0		||0		||0		||0		||=09
|}

=3D=3D Failed tasks 2017-08-11 =3D=3D

INFO: jenkins-job.sh-1.8.25 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/rocko/log.report.20170812_084847.log

=3D=3D=3D common (0) =3D=3D=3D

=3D=3D=3D common-x86 (1) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile

=3D=3D=3D qemuarm (3) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-support/imagemagick/imagemagick_7.0=
=2E6.bb:do_fetch
    * meta-openembedded/meta-oe/recipes-support/mysql/mariadb_5.5.55.bb:do_=
compile
    * openembedded-core/meta/recipes-devtools/llvm/llvm_git.bb:do_compile

=3D=3D=3D qemux86 (2) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb:do_c=
ompile
    * meta-qt5/recipes-qt/qt5/qtbase_git.bb:do_compile

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile

=3D=3D=3D Number of failed tasks (9) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 3	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/l=
og.world.qemuarm.20170810_220240.log/ || http://errors.yoctoproject.org/Err=
ors/Build/43325/
|-
|| qemux86 	|| 4	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/l=
og.world.qemux86.20170810_220240.log/ || http://errors.yoctoproject.org/Err=
ors/Build/43326/
|-
|| qemux86_64 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rock=
o/log.world.qemux86-64.20170811_230232.log/ || http://errors.yoctoproject.o=
rg/Errors/Build/43327/
|}

=3D=3D=3D PNBLACKLISTs (1) =3D=3D=3D

=3D=3D=3D QA issues (24) =3D=3D=3D
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
||18	||version-going-backwards
|-
||2	||host-user-contaminated
|-
||4	||textrel
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.sign=
atures.20170811_022738.log/

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


count: 4	issue: textrel
chromium-54.0.2810.2: ELF binary '/tmp/work/i586-oe-linux/chromium/54.0.281=
0.2-r0/packages-split/chromium/usr/bin/chromium/chrome' has relocations in =
=2Etext [textrel]
chromium-wayland-53.0.2785.143: ELF binary '/tmp/work/i586-oe-linux/chromiu=
m-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium=
/chrome' has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/tmp/work/i586-oe-linux/x264/=
r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264-bin/usr/bin/x264' has re=
locations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/tmp/work/i586-oe-linux/x264/=
r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148' =
has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 18	issue: version-going-backwards
logcheck-1.3.17: Package version for package logcheck-dbg went backwards wh=
ich would break package feeds from (0:1.3.18-r0.0 to 0:1.3.17-r0.12) [versi=
on-going-backwards]
logcheck-1.3.17: Package version for package logcheck-dbg went backwards wh=
ich would break package feeds from (0:1.3.18-r0.0 to 0:1.3.17-r0.9) [versio=
n-going-backwards]
logcheck-1.3.17: Package version for package logcheck-dbg went backwards wh=
ich would break package feeds from (0:1.3.18-r0.1 to 0:1.3.17-r0.12) [versi=
on-going-backwards]
logcheck-1.3.17: Package version for package logcheck-dev went backwards wh=
ich would break package feeds from (0:1.3.18-r0.0 to 0:1.3.17-r0.12) [versi=
on-going-backwards]
logcheck-1.3.17: Package version for package logcheck-dev went backwards wh=
ich would break package feeds from (0:1.3.18-r0.0 to 0:1.3.17-r0.9) [versio=
n-going-backwards]
logcheck-1.3.17: Package version for package logcheck-dev went backwards wh=
ich would break package feeds from (0:1.3.18-r0.1 to 0:1.3.17-r0.12) [versi=
on-going-backwards]
logcheck-1.3.17: Package version for package logcheck-doc went backwards wh=
ich would break package feeds from (0:1.3.18-r0.0 to 0:1.3.17-r0.12) [versi=
on-going-backwards]
logcheck-1.3.17: Package version for package logcheck-doc went backwards wh=
ich would break package feeds from (0:1.3.18-r0.0 to 0:1.3.17-r0.9) [versio=
n-going-backwards]
logcheck-1.3.17: Package version for package logcheck-doc went backwards wh=
ich would break package feeds from (0:1.3.18-r0.1 to 0:1.3.17-r0.12) [versi=
on-going-backwards]
logcheck-1.3.17: Package version for package logcheck-locale went backwards=
 which would break package feeds from (0:1.3.18-r0.0 to 0:1.3.17-r0.12) [ve=
rsion-going-backwards]
logcheck-1.3.17: Package version for package logcheck-locale went backwards=
 which would break package feeds from (0:1.3.18-r0.0 to 0:1.3.17-r0.9) [ver=
sion-going-backwards]
logcheck-1.3.17: Package version for package logcheck-locale went backwards=
 which would break package feeds from (0:1.3.18-r0.1 to 0:1.3.17-r0.12) [ve=
rsion-going-backwards]
logcheck-1.3.17: Package version for package logcheck-staticdev went backwa=
rds which would break package feeds from (0:1.3.18-r0.0 to 0:1.3.17-r0.12) =
[version-going-backwards]
logcheck-1.3.17: Package version for package logcheck-staticdev went backwa=
rds which would break package feeds from (0:1.3.18-r0.0 to 0:1.3.17-r0.9) [=
version-going-backwards]
logcheck-1.3.17: Package version for package logcheck-staticdev went backwa=
rds which would break package feeds from (0:1.3.18-r0.1 to 0:1.3.17-r0.12) =
[version-going-backwards]
logcheck-1.3.17: Package version for package logcheck went backwards which =
would break package feeds from (0:1.3.18-r0.0 to 0:1.3.17-r0.12) [version-g=
oing-backwards]
logcheck-1.3.17: Package version for package logcheck went backwards which =
would break package feeds from (0:1.3.18-r0.0 to 0:1.3.17-r0.9) [version-go=
ing-backwards]
logcheck-1.3.17: Package version for package logcheck went backwards which =
would break package feeds from (0:1.3.18-r0.1 to 0:1.3.17-r0.12) [version-g=
oing-backwards]


count: 2	issue: host-user-contaminated
glibc-locale-2.25.90: glibc-locale: /glibc-binary-localedata-nds-nl/usr/lib=
/locale/nds_NL/LC_NAME is owned by uid 3004, which is the same as the user =
running bitbake. This may be due to host contamination [host-user-contamina=
ted]
glibc-locale-2.25.90: glibc-locale: /glibc-binary-localedata-shs-ca/usr/lib=
/locale/shs_CA/LC_NAME is owned by uid 3004, which is the same as the user =
running bitbake. This may be due to host contamination [host-user-contamina=
ted]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
923d556 main: Handle BB_SERVER_TIMEOUT =3D -1 for no server timeout
not included in master yet:=20
a14f46f world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
df7f522 libinput: Upgrade 1.7.3 -> 1.8.1
not included in master yet:=20
1bdfba7 report-error: Allow to upload reports automatically
961c3f8 buildhistory.bbclass: metadata-revs show repo parent
48809ce metadata-revs: provide more information
f893927 qemux86: Add identical qemux86copy variant for tests

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
6ea350b c-ares: update 1.12.0 -> 1.13.0
be8a512 radvd: 2.14 -> 2.17
b482e5d pam-ssh-agent-auth: add new recipe
5b91085 libpwquality: add recipe 1.4.0
9fb3b71 libbytesize: add recipe 0.10
81cc44e libtimezonemap: add recipe 0.4.5
468d302 xmlrpc-c: add recipe 1.31.0
cfecae4 usermode: add recipe 1.111
f934668 syslog-ng: provide correct PID directory location to restart/stop s=
yslog-ng daemon
d778abd python-pyserial: update to version 3.4
ac277b5 python3-cassandra-driver: update to version 3.8.1
f51cb1c python-dateutil: update to version 2.6.1
46958cb python-cmd2: update to version 0.7.5
ef22f05 python-webencodings: update to version 0.5.1
e467826 python-simplejson: update to version 3.11.1
d15cffd python-serpent: update to version 1.23
adeca9e python-cython: update to version 0.26
7165137 python-evdev: update to version 0.7.0
e25df49 python-vobject: update to version 0.9.5
bc38b73 python-pbr: update to version 3.1.1
a5e670c python-pycparser: update to version 2.18
91a7dd7 python-pymisp: update to version 2.4.77
f1d73b5 python-urllib3: update to version 1.22
343f75a python-ldap: update to version 2.4.41
dd6fa5d openldap: 2.4.44 -> 2.4.45
dd6baf8 gvfs: Fix build regression from uprev
899c14f logcheck: update to 1.3.18
3bff079 minicoredumper: Initialize struct config
98de9d8 cherokee: Upgrade to 1.2.104+git
1256b31 libesmtp: Fix config.h define for snprintf detection
a8d3fb0 usermode: Link with libm for powl() API
87506b9 dbus-daemon-proxy: Fix return value from master_filter_cb()
bd5d616 ssiapi: Fix build errors found with clang
2520d9d flashrom: Fix build with clang
d531e73 glade: fix host contamination on centos7
2331029 tigervnc: add recipe 1.8.0
a533dd8 libreport: add recipe 2.9.1
5b506ac libblockdev: add recipe 2.10
9793e97 python3-blivet: add recipe 2.2.0
aa53387 python3-blivetgui: add recipe 2.1.5
0765fb5 drbd: Add recipe
7835635 net-snmp: fix engineBoots value on SIGHUP
e079ce3 assimp: remove recipe
f5234c1 openl2tp: add LGPL-2.1 license
792edb2 openl2tp: add init script and systemd support
b27397d ntop: add new recipe
638ca9a android-tools: fix issue with missing files in eSDK updates
b5dec68 autoconf-archive: move from meta-oe to OE-core
654f5b1 libebml: inherit dos2unix
1e9d03e Updated mpv to version 0.26.0.
d03a78a libqb: update 1.0.1 -> 1.0.2
c7c92e4 libtdb: update 1.3.12 -> 1.3.14
ef8f0f7 glmark2: Upgrade to 2017.07 release
eb173ef klibc: Fix build with clang
710946e ninja,re2c: Remove
ccf1fe1 ndisc6: Upgrade to 1.0.3
d35aed6 memcached: Update to 1.5.0
4516003 lvm2/libdevmapper: workaround build man failure
a7f4259 python-pyusb: make recipe available as python3 version
6cf8319 tcpdump: remove unnecessary patch
aade1a0 libcyusbserial: new recipe
64bffbe libftdi: update to 1.4
73e6476 nginx: update stable version to 1.12.1
c18e135 nginx: update development version to 1.13.3
050445c apache2: update to version 2.4.27
81b79e3 libxml-sax-writer-perl: update to version 0.57
af7b525 librole-tiny-perl: update to version 2.000005
5354586 libnet-ssleay-perl: update to version 1.81
15e81f5 libmoo-perl: update to version 2.003002
0405988 libextutils-parsexs-perl: update to version 3.35
e0346ba uim: Modified the order of package definition.
6360697 uim: add dependency on anthy
2ec7234 uim: Added glibc-utils and glibc-gconv-euc-jp to RDEPENDS_uim-anthy
18c9f9c uim: Removed pkg_postinst_uim-common/pkg_prerm_uim-common.
e4ced32 uim: Fixed pkg_postinst_*/pkg_prerm_* for uim-anthy and uim-skk.
10302b0 uim: Fixed a problem that an immodule.cache is not updated appropri=
ately when uim-gtk2.0 or uim-gtk3 was installed.
6b8a087 bluez4: remove bluez4-only recipes
e44e402 libotr: Upgrade from 4.0.0 to 4.1.1 and update patches
c6b759f pidgin: Update from 2.11.0 to 2.12.0
b074a42 exo: update 0.11.2 -> 0.11.5
1a14fe2 thunar: update 1.6.11 -> 1.6.12
b1cac4c xfce4-terminal: update 0.8.4 -> 0.8.6
c363146 xfce4-whiskermenu-plugin: update 2.1.2 -> 2.1.3
deaacde xfce4-clipman-plugin: update 1.4.1 -> 1.4.2
239f61d xfce4-xkb-plugin: update 0.7.1 -> 0.8.0
fe62a33 xfce4-screenshooter: update 1.8.2 -> 1.9.1
e5e4476 kodi: fix build with latest gcc
1282b46 poppler: update 0.53.0 -> 0.57.0
5bfb5db php7: upgrade to 7.1.7
9e900d0 llvm: Remove
4f4bf86 squid: Add missing dependencies on openssl expat and libxml2
635355b mongodb: Upgrade to 3.4.6
69edf28 python3-twisted: Fix build with clang
1ea9c2f python-grpcio: Do not hardcode compiler -std options
904b67c collectd: Fix build with clang
9fa4d37 fbida: Fix build with libjpeg-turbo
4cf9760 libblockdev: fix a clang compiling issue
11fef1e tigervnc: fix a clang compiling issue
db72227 opencv: update to version 3.3.
a3230d8 webmin: update to version 1.850
79ccc04 postfix: Upgrade to 3.2.2
2f6f835 python-idna: update to version 2.6
20705e1 python-typing: update to version 3.6.2
7e85ba6 python-certifi: update to version 2017.7.27.1
9a95357 python-decorator: update to version 4.1.2
1d97bb3 python-sdnotify: update to version 0.3.2
88d36f9 python-iso8601: update to version 0.1.11
d0e027f python-pymongo: update to version 3.5.0
4d57d04 python-pyasn1: update to version 0.3.2
95a5006 python-cryptography-vectors: update to version 2.0.3
bf2d119 python-cryptography: update to version 2.0.3
6f5f9c3 python-requests: update to version 2.18.3
340b971 python-django: update to version 1.11.4
7923ac1 python-prompt-toolkit: update to version 1.0.15
9bd4ada python-pytest: update to version 3.2.0
9036121 rapidjson: avoid dependency to non-existing package
e481d2f json-spirit: Add -latomic to LDFLAGS
e0b1c5e imagemagick: upgrade from 7.0.5 to 7.0.6p5
2290bdb recipes: remove blacklisted recipes
db91fbe Revert "logcheck: update to 1.3.18"
2050f0d Revert "autoconf-archive: move from meta-oe to OE-core"

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
8960831 qwt-qt5.inc: fix QA warning
not included in master yet:=20
6e9892a qtbase: add ptest
d53382f qt5-ptest: fix build with yocto < 2.3 (pyro)
9042969 qtbase: Fix ptests with clang
0b41b62 qtbase: Use sched_yield instead of pthread_yield
17d94b7 quazip: update to 0.7.3 and add missing metadata
3963daa qtwebkit: Backport a patch to fix build with icu-59
7efcea9 qt3d: Fix build with clang

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
e3c3aa0 Merge pull request #57 from kraj/kraj/master
not included in master yet:=20
e961581 gnome-settings-daemon: remove the bbappend for removed recipe

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
03f4072 alsa-lib: Remove 0001-ucm-fix-handling-of-config-files-when-file-ty=
pe-is-n.patch
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
1fe2b3b android-system-image-tenderloin: update Android image
not included in master yet:=20
e468a34 meta-shr, meta-fso: remove blacklisted recipes

--VrqPEDrXMn8OVzN4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWY9OogAKCRA3VSO3ZXaA
HF+BAJ41uxUX/Cl97UbicpfWMfkxFNHijwCguMMKecOamTn0Av1RSPwCeLOLXRk=
=qdoc
-----END PGP SIGNATURE-----

--VrqPEDrXMn8OVzN4--
