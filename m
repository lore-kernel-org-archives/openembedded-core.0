Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5F791784B9;
	Fri, 18 Aug 2017 19:09:59 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id z91so65288378wrc.4;
	Fri, 18 Aug 2017 12:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=sjvPg2D6l+ZLu1x/S5RVYOurVsRC5PXIW0QGLhEyCCQ=;
	b=LJgjLuy7CDaLbCik+8psJTpbNODaDaQv8nl6iFQSN8lYCK/WWySWDyF3FybdI2efdk
	BbpfSw2QEDIwRTbhsBYNql2mpmFt2+bd0UM4guperg8FsY6wrMNN0KHK8jSW2lVY+l4a
	p46Ex7XBxbUaDm6OMkIsKBFWdhn+jYKByrSS91+0pRtUfxZKRxJEVkyPW3Pf986izQxD
	ABiUGLYenchkMuuYhgOJW+6ZlHJwDwDG0z0FoOabbf3zWq/R771JNEDwW3QAVCKDcZpr
	+UkIaG353hb2Z07LQ1GoDyGdNQJcau43N4Y51x7KutK8TQIGKhmMX4vuh6zwDISSJspz
	KR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=sjvPg2D6l+ZLu1x/S5RVYOurVsRC5PXIW0QGLhEyCCQ=;
	b=n+Bg2HAU1jO+AulCQZPWAOddhUqK84qyMfZ2NhU2BHASPZLwAuOkUaFTKJPHpEjBPc
	s+r5nQyFvHjjLvha1t85ACWu2Fp2qBoYv1aAbzJGsINXc+Wn9WEQvyfVKI1LSE2fAOJO
	kys7tbcbpH/+8mjAxzJCCgjxRKWWBdIrf4SkeWPv/Lw2qiDJ1wtFovwoHDEFuqBQk5qo
	koXN5RRdmhlTmTOMxwpyqhgUYqT0GJ+SiwPkbVlNoE3bCSINPmLv/NBKFlM/ZoBYBzvY
	W0oAwLFF37F+9qCu9jI2vxH81LJXhDZAk8kQXVgyZs3fZRd7FTcdftuTHby+fwSrzBzW
	Z0Sg==
X-Gm-Message-State: AHYfb5iU1x7CK7MLF8wqvUf0pP0tdpGeqddoNEWowgZhwIcYBQnTZNTN
	DrifR+8JyS9dJHgW
X-Received: by 10.223.135.225 with SMTP id c30mr5707718wrc.10.1503083399679;
	Fri, 18 Aug 2017 12:09:59 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	y36sm8396504wrb.53.2017.08.18.12.09.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 18 Aug 2017 12:09:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 18 Aug 2017 21:11:38 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170818191138.GB3298@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.3 (2017-05-23)
Subject: State of bitbake world, Failed tasks 2017-08-17
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
X-List-Received-Date: Fri, 18 Aug 2017 19:10:00 -0000
X-Groupsio-MsgNum: 101655
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cvVnyQ+4j833TQvp"
Content-Disposition: inline

--cvVnyQ+4j833TQvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Another build with openssl-1.1.

Next build will use openssl-1.0 again.

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
||2017-08-17	||42	||43	||43	||0	||0		||0		||5		||0		||0		||0		||1		||0		||0=
		||0		||0		||0		||0		||0		||=09
|}

=3D=3D Failed tasks 2017-08-17 =3D=3D

INFO: jenkins-job.sh-1.8.25 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/rocko/log.report.20170818_090627.log

=3D=3D=3D common (40) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
    * meta-openembedded/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb:do_c=
ompile
    * meta-openembedded/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdum=
p_2.4.bb:do_compile
    * meta-openembedded/meta-networking/recipes-connectivity/lftp/lftp_4.7.=
7.bb:do_compile
    * meta-openembedded/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sa=
sl_2.1.26.bb:do_compile
    * meta-openembedded/meta-networking/recipes-irc/znc/znc_git.bb:do_compi=
le
    * meta-openembedded/meta-networking/recipes-protocols/net-snmp/net-snmp=
_5.7.3.bb:do_compile
    * meta-openembedded/meta-networking/recipes-protocols/nopoll/nopoll_0.4=
=2E2.b297.bb:do_compile
    * meta-openembedded/meta-networking/recipes-support/fetchmail/fetchmail=
_6.3.26.bb:do_compile
    * meta-openembedded/meta-networking/recipes-support/ipsec-tools/ipsec-t=
ools_0.8.2.bb:do_compile
    * meta-openembedded/meta-networking/recipes-support/openvpn/openvpn_2.4=
=2E2.bb:do_compile
    * meta-openembedded/meta-networking/recipes-support/uftp/uftp_4.9.3.bb:=
do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libim=
obiledevice_1.1.4.bb:do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/libtorrent/libtorrent_=
git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb=
:do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/umip/umip_1.0.bb:do_co=
mpile
    * meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1=
=2Ebb:do_compile
    * meta-openembedded/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb:d=
o_compile
    * meta-openembedded/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb:d=
o_compile
    * meta-openembedded/meta-oe/recipes-extended/boinc/boinc-client_7.6.33.=
bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/cfengine/cfengine_3.9.0.bb=
:do_compile
    * meta-openembedded/meta-oe/recipes-extended/openwsman/openwsman_2.6.2.=
bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.1=
0.3.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/asio/asio_1.10.6.bb:do_comp=
ile
    * meta-openembedded/meta-oe/recipes-support/freerdp/freerdp_git.bb:do_c=
ompile
    * meta-openembedded/meta-oe/recipes-support/ipmitool/ipmitool_1.8.18.bb=
:do_compile
    * meta-openembedded/meta-oe/recipes-support/libgit2/libgit2_0.24.3.bb:d=
o_compile
    * meta-openembedded/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb:=
do_compile
    * meta-openembedded/meta-oe/recipes-support/libp11/libp11_0.4.0.bb:do_c=
ompile
    * meta-openembedded/meta-oe/recipes-support/links/links_2.7.bb:do_compi=
le
    * meta-openembedded/meta-oe/recipes-support/links/links-x11_2.7.bb:do_c=
ompile
    * meta-openembedded/meta-oe/recipes-support/opensc/opensc_0.16.0.bb:do_=
compile
    * meta-openembedded/meta-oe/recipes-support/pkcs11-helper/pkcs11-helper=
_1.11.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/postgresql/postgresql_9.4.1=
1.bb:do_configure
    * meta-openembedded/meta-oe/recipes-support/synergy/synergy_git.bb:do_c=
ompile
    * meta-openembedded/meta-oe/recipes-support/syslog-ng/syslog-ng_3.8.1.b=
b:do_compile
    * meta-openembedded/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rs=
a-perl_0.28.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python-m2crypto=
_0.26.0.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python-matplotl=
ib_1.1.0.bb:do_compile
    * virtual:native:meta-openembedded/meta-python/recipes-devtools/python/=
python-m2crypto_0.26.0.bb:do_compile

=3D=3D=3D common-x86 (2) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs_4.8.3.bb:do_=
compile
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb:do_c=
ompile

=3D=3D=3D qemuarm (2) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-support/mysql/mariadb_5.5.55.bb:do_=
compile
    * meta-qt5/recipes-qt/qt5/qtbase_git.bb:do_compile

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-qt5/recipes-qt/qt5/qtbase_git.bb:do_prepare_recipe_sysroot

=3D=3D=3D Number of failed tasks (128) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 42	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/=
log.world.qemuarm.20170816_060204.log/ || http://errors.yoctoproject.org/Er=
rors/Build/44164/
|-
|| qemux86 	|| 43	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/=
log.world.qemux86.20170816_060204.log/ || http://errors.yoctoproject.org/Er=
rors/Build/44200/
|-
|| qemux86_64 	|| 43	 || http://logs.nslu2-linux.org/buildlogs/oe/world/roc=
ko/log.world.qemux86-64.20170817_074229.log/ || http://errors.yoctoproject.=
org/Errors/Build/44411/
|}

=3D=3D=3D PNBLACKLISTs (1) =3D=3D=3D

=3D=3D=3D QA issues (6) =3D=3D=3D
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
||0	||version-going-backwards
|-
||1	||host-user-contaminated
|-
||5	||textrel
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.sign=
atures.20170817_040706.log/

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


count: 0	issue: version-going-backwards


count: 1	issue: host-user-contaminated
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-lij-it/usr/lib/lo=
cale/lij_IT/LC_NAME is owned by uid 3004, which is the same as the user run=
ning bitbake. This may be due to host contamination [host-user-contaminated]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
8d4c120 process: Increase server startup timeout
not included in master yet:=20
98712f3 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
4d65421 dnf: expand dnf selftest to test signed package feeds
not included in master yet:=20
7dea7d9 report-error: Allow to upload reports automatically
100fc5b buildhistory.bbclass: metadata-revs show repo parent
ace9780 metadata-revs: provide more information
a57818e qemux86: Add identical qemux86copy variant for tests
ef44b0e gcc: Upgrade to 7.2.0 release
667c237 llvm: Swith to ARM ISA on armv5 and armv4t

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
ac2a6d2 json-spirit: Add -latomic to LDFLAGS
not included in master yet:=20
6ff499b dnsmasq: disable the service by default
ca0e943 rdate: Fix build with hardening
7e3d8e4 strongswan: Include stdint.h for uintptr_t
217431e netkit-rpc: Fix build with hardening flags
f3819cc netkit-telnet: Fix build with hardening
048e071 ncftp: Upgrade to 3.2.6
61495a9 autofs: Add build dependency on libnsl2
96e606d openhpi: Fix build on 64bit platforms e.g. aarch64
7feddb1 security_flags.inc: Delete
a4723a6 pptp-linux: Upgrade to 1.9.0
ab4774e ebtables: replace ebtables-save perl script with bash rewrite
3a96b76 pimd: Upgrade to 2.3.2
aa43496 igmpproxy: Include missing sys/tupes.h and define _GNU_SOURCE
92bc7d2 rdate: Define logwtmp if libc !=3D glibc
a04b53f netkit-ftp: Include sys/types.h for u_long definition
feb1653 postfix: Disable nis support on musl
93ee634 zeroconf: Fix build with musl
163c868 netperf: change SRC_URI to git repository
4c2b4c4 ippool: Fix build errors found with hardening flags
5ebba48 openflow: Fix build with musl
610e392 xl2tpd: Update to 1.3.9
53982a0 c-ares: update 1.12.0 -> 1.13.0
b101101 radvd: 2.14 -> 2.17
9a7309d libesmtp: Fix config.h define for snprintf detection
b9b2b01 drbd: Add recipe
b7b27a5 net-snmp: fix engineBoots value on SIGHUP
f8559af openl2tp: add LGPL-2.1 license
ce8ed9a openl2tp: add init script and systemd support
4f97a6c ntop: add new recipe
21479a9 libtdb: update 1.3.12 -> 1.3.14
d946a42 ndisc6: Upgrade to 1.0.3
f3dd13e memcached: Update to 1.5.0
3436c8e tcpdump: remove unnecessary patch
209a90c squid: Add missing dependencies on openssl expat and libxml2
5061e4f postfix: Upgrade to 3.2.2
33dff9b mpv: Update to version 0.26.0.
cc37aef python3-blivet: add recipe 2.2.0
ad94afe python3-blivetgui: add recipe 2.1.5
47fb79b librcf: Add -latomic to LDFLAGS
6599b98 upower: update 0.99.4 -> 0.99.5
b720216 geany: update 1.30.1 -> 1.31
29805cb geany-plugins: update 1.30 -> 1.31
c94d8e7 python-wrapt: update to version 1.10.11
69a7670 python-cmd2: update to version 0.7.6
353a2ab python-sqlalchemy: update to version 1.1.13
363c33c python-pytest: update to version 3.2.1
38c6ecb python-pyro4: update to version 4.61
07c7d83 php: move to version 7.1.8 from 7.1.7
03eaf98 gsoap: Upgrade to 2.8.51
16a43c3 caps: Mark ARCH empty
f6b5f24 python-m2crypto: Upgrade to 0.26.0
c125af6 mailcap: upgrade to 2.1.48
31795c0 mailx: Force mailx to build with openssl10
c02dc52 php: disable this version by default
8191d01 recipes: remove blacklisted recipes

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
08576b0 Merge pull request #58 from kraj/kraj/master
not included in master yet:=20
f9c357c gnome-settings-daemon: remove the bbappend for removed recipe

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
8b71446 alsa-lib: Remove 0001-ucm-fix-handling-of-config-files-when-file-ty=
pe-is-n.patch
not included in master yet:=20
b344ec0 bluez: switch from bluez4 to bluez5

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
1fe2b3b android-system-image-tenderloin: update Android image
not included in master yet:=20
e468a34 meta-shr, meta-fso: remove blacklisted recipes

--cvVnyQ+4j833TQvp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWZc76QAKCRA3VSO3ZXaA
HHevAJ43j7uTYXaRvbc+HBaoRlNpo6dHJgCdFuvlHLPBGssm3m3K6ol6GlWvzWI=
=fmsj
-----END PGP SIGNATURE-----

--cvVnyQ+4j833TQvp--
