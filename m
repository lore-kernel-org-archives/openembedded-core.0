Return-Path: <nir.geller@servotronix.com>
X-Greylist: delayed 946 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 26 Mar 2018 12:20:21 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0109.outbound.protection.outlook.com [104.47.2.109])
	by mail.openembedded.org (Postfix) with ESMTP id 975FF77E88
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 12:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=servotronix1008982.onmicrosoft.com; s=selector1-servotronix-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=NIRXK/IVqBGze5Dm/KdqoA/BR8GSWH/YCdWG4Jhtes4=;
	b=CPB+IZxYj0r930lk9b5LI9TMqjEGzRjgqLCQrwGF1wSLKeNSKkoTOqj9leusJTghdaQXbBgcsJZoc+FzF24qiQCp7guDFUHgn8/DWQdrciC1no6/NsFM2Bk9et4SxN9XjAViUPvzw+JETDZUkQaZSgG0kUVh/VOi7ZeHrVljl6w=
Received: from VI1PR0701MB2814.eurprd07.prod.outlook.com (10.173.71.22) by
	VI1PR0701MB1790.eurprd07.prod.outlook.com (10.167.196.148) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.631.5; Mon, 26 Mar 2018 12:04:34 +0000
Received: from VI1PR0701MB2814.eurprd07.prod.outlook.com
	([fe80::5d0:8b2a:d1a3:ca51]) by
	VI1PR0701MB2814.eurprd07.prod.outlook.com
	([fe80::5d0:8b2a:d1a3:ca51%3]) with mapi id 15.20.0631.009;
	Mon, 26 Mar 2018 12:04:34 +0000
From: "Geller, Nir" <nir.geller@servotronix.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: multilib - python3 vs. lib32-python3  -  bitbake
	core-image-minimal fails
Thread-Index: AQHTxPqZEKUTZxkkwUiLY9fZJ3PyvQ==
Date: Mon, 26 Mar 2018 12:04:34 +0000
Message-ID: <VI1PR0701MB2814121932475233E7F689C890AD0@VI1PR0701MB2814.eurprd07.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [79.181.62.184]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR0701MB1790;
	7:9HeVX8X16jzgpT2/a9YTiI18RuIBm1vhMetwyIeTt4uMDw9SGpjTSwn1ESwPTmjCF/HlbSW4gnTfaHP44DbEFxld8BJ0Bsfn/DCG40D/vHISMhajUwq5Xl2hx59kiTSl4b6yoXn4yLIepsNSsJMKurG/R4ZyxLIHnTGOW3qr0+gbFGPp9csMELlqj1Xrs1zkt+KS6VEJaLdvH5vuO0AQFbf21sHlcsMh6DoA2z6ez6hxzPAHzRV3VGN1xwvi7vTb
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 0148bebf-6255-46ce-09d0-08d59311bd4c
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(7021125)(5600026)(4604075)(3008032)(4534165)(7022125)(4603075)(4627221)(201702281549075)(7048125)(7024125)(7027125)(7028125)(7023125)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR0701MB1790; 
x-ms-traffictypediagnostic: VI1PR0701MB1790:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=nir.geller@servotronix.com; 
x-microsoft-antispam-prvs: <VI1PR0701MB1790CF257913726B2666BF5990AD0@VI1PR0701MB1790.eurprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3231221)(944501327)(52105095)(93006095)(93001095)(3002001)(10201501046)(6041310)(20161123562045)(2016111802025)(20161123560045)(20161123558120)(20161123564045)(6043046)(6072148)(201708071742011);
	SRVR:VI1PR0701MB1790; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR0701MB1790; 
x-forefront-prvs: 06237E4555
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(39380400002)(39850400004)(346002)(366004)(396003)(199004)(189003)(6916009)(8936002)(105586002)(3280700002)(3846002)(3660700001)(81156014)(81166006)(6116002)(8676002)(97736004)(86362001)(16200700003)(53946003)(99286004)(5250100002)(575784001)(54896002)(66066001)(53936002)(2501003)(2906002)(9686003)(7736002)(74316002)(102836004)(55016002)(19627405001)(2351001)(186003)(6606003)(53336002)(478600001)(316002)(551934003)(7696005)(6436002)(68736007)(551544002)(2900100001)(59450400001)(5660300001)(26005)(5640700003)(14454004)(25786009)(6506007)(106356001)(33656002)(579004)(569006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0701MB1790;
	H:VI1PR0701MB2814.eurprd07.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: servotronix.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: NojtnThJoGExjm16fKN65IxyMX6cQ+56pyHyatyVBr50uR0Z4EYguEZyCW0Cb8pGSDKOLQd81lwU5jWakFkIgUKkGuPBsCxRM8tQr6jaoXOsv+03PG+zu2D50WS4g/a1WSL0lujFmlTKFnZGGydeZPBzzbE2oD61WowvfGyH+cxydiitF5uB7MekKnLGcht0APiAC37XczpEPqdPHGz0sGY1ybCbLTGR6SZrF5wXe9q8d8niidumWvyknxIEey4LgMe1rmgm6vmqveHiwBEJC2zZtjaRXlZlJJrR44k4qB6BM36XNOJ4tKzuO1U41yahV+X8PWXpxPNHyDNns8mx1Q==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: servotronix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0148bebf-6255-46ce-09d0-08d59311bd4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2018 12:04:34.1316 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c4bfc7d-fde6-4201-a2d6-2a396cc790f7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB1790
Subject: multilib - python3 vs. lib32-python3 - bitbake core-image-minimal fails
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
X-List-Received-Date: Mon, 26 Mar 2018 12:20:22 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_VI1PR0701MB2814121932475233E7F689C890AD0VI1PR0701MB2814_"

--_000_VI1PR0701MB2814121932475233E7F689C890AD0VI1PR0701MB2814_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,


I'm trying to build the latest Yocto project for a x86-64 machine, and add =
a few packages that are built with 32 bit configuration using the multilib =
mechanism.


I pulled rocko 2.4.2 and set up my local.conf:



# This sets the default machine to be qemux86 if no other machine is select=
ed:
MACHINE ??=3D "genericx86-64"

# Enable multilib to allow 32 bit build of some packages
require conf/multilib.conf
MULTILIBS =3D "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 =3D "x86"

When I bitbake core-image-minimal all the packages are built successfully, =
but core-image-minimal.bb:do_rootfs fails and
I get the following error:


/opt/poky/build$ bitbake core-image-minimal
Loading cache: 100% |######################################################=
###########################################################################=
#######################################| Time: 0:00:02
Loaded 4608 entries from dependency cache.
Parsing recipes: 100% |####################################################=
###########################################################################=
#######################################| Time: 0:00:04
Parsing of 1914 .bb files complete (1909 cached, 5 parsed). 4617 targets, 2=
40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           =3D "1.36.0"
BUILD_SYS            =3D "x86_64-linux"
NATIVELSBSTRING      =3D "universal"
TARGET_SYS           =3D "x86_64-poky-linux"
MACHINE              =3D "genericx86-64"
DISTRO               =3D "poky"
DISTRO_VERSION       =3D "2.4.2"
TUNE_FEATURES        =3D "m64 core2"
TARGET_FPU           =3D ""
meta
meta-poky
meta-yocto-bsp       =3D "stx-rocko:26de16bef191f5122e26c84f2596ea49c0bd8b1=
a"
meta-oe
meta-python
meta-networking      =3D "rocko:dacfa2b1920e285531bec55cd2f08743390aaf57"
meta-stx-mc          =3D "stx-rocko:26de16bef191f5122e26c84f2596ea49c0bd8b1=
a"

Initialising tasks: 100% |#################################################=
###########################################################################=
#######################################| Time: 0:00:10
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: core-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. Command '=
/opt/poky/build/tmp/work/genericx86_64-poky-linux/core-image-minimal/1.0-r0=
/recipe-sysroot-native/usr/bin/dnf -y -c /opt/poky/build/tmp/work/genericx8=
6_64-poky-linux/core-image-minimal/1.0-r0/rootfs/etc/dnf/dnf.conf --setopt=
=3Dreposdir=3D/opt/poky/build/tmp/work/genericx86_64-poky-linux/core-image-=
minimal/1.0-r0/rootfs/etc/yum.repos.d --repofrompath=3Doe-repo,/opt/poky/bu=
ild/tmp/work/genericx86_64-poky-linux/core-image-minimal/1.0-r0/oe-rootfs-r=
epo --installroot=3D/opt/poky/build/tmp/work/genericx86_64-poky-linux/core-=
image-minimal/1.0-r0/rootfs --setopt=3Dlogdir=3D/opt/poky/build/tmp/work/ge=
nericx86_64-poky-linux/core-image-minimal/1.0-r0/temp --nogpgcheck install =
cronie rpm useradd-mc stx-corepattern inotify-tools iotop packagegroup-core=
-tools-debug lighttpd ldd iproute2 kernel-module-can-raw can-utils procps k=
ernel-module-igb util-linux bash util-linux-fsck etherlab vsftpd atop htop =
sudo tcpdump kernel-module-sja1000 pciutils kernel-module-can kernel-module=
-peak-pci gnupg dhcp-client base-passwd udev-extraconf usbutils kernel-modu=
le-ec-master libxml2 shadow packagegroup-core-boot rc-once openssh mc-conso=
le lsof kernel-module-can-dev kernel-module-r8169 dnf e2fsprogs-e2fsck kern=
el-module-ecatmc ethtool run-postinsts coreutils file nano lib32-stx-mc lib=
32-stx-mc-dev' returned 1:
Added oe-repo repo from /opt/poky/build/tmp/work/genericx86_64-poky-linux/c=
ore-image-minimal/1.0-r0/oe-rootfs-repo
Last metadata expiration check: 0:00:01 ago on Mon 26 Mar 2018 11:57:38 AM =
UTC.
Dependencies resolved.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
 Package                Arch          Version                     Repositor=
y
                                                                           =
Size
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
Installing:
 atop                   core2_64      2.2.3-r0                    oe-repo  =
79 k
 base-passwd            core2_64      3.5.29-r0                   oe-repo 6=
.8 k
 bash                   core2_64      4.4-r0                      oe-repo 4=
26 k
 can-utils              core2_64      0.0+gitr0+4c8fb05cb4-r0     oe-repo  =
81 k
 coreutils              core2_64      8.27-r0                     oe-repo 8=
46 k
 cronie                 core2_64      1.5.1-r0                    oe-repo  =
44 k
 dhcp-client            core2_64      4.3.6-r0                    oe-repo 1=
60 k
 dnf                    core2_64      2.6.3-r0                    oe-repo 1=
63 k
 e2fsprogs-e2fsck       core2_64      1.43.5-r0                   oe-repo 1=
16 k
 etherlab               core2_64      1.5.2.5-r1                  oe-repo 1=
49 k
 ethtool                core2_64      4.11-r0                     oe-repo  =
89 k
 file                   core2_64      5.31-r0                     oe-repo 2=
41 k
 gnupg                  core2_64      2.2.0-r0                    oe-repo 1=
.1 M
 htop                   core2_64      1.0.3-r0                    oe-repo  =
61 k
 inotify-tools          core2_64      3.14+git0+1df9af4d6c-r0     oe-repo  =
20 k
 iotop                  core2_64      0.6-r0                      oe-repo  =
38 k
 iproute2               core2_64      4.11.0-r0                   oe-repo 1=
99 k
 kernel-module-can-3.18.48-rt54-yocto-standard
                        genericx86_64 3.18.48+git0+00ca696e63-r0  oe-repo  =
15 k
 kernel-module-can-dev-3.18.48-rt54-yocto-standard
                        genericx86_64 3.18.48+git0+00ca696e63-r0  oe-repo  =
13 k
 kernel-module-can-raw-3.18.48-rt54-yocto-standard
                        genericx86_64 3.18.48+git0+00ca696e63-r0  oe-repo  =
12 k
 kernel-module-ec-master-3.18.48-rt54-yocto-standard
                        genericx86_64 3.18.48+git0+00ca696e63-r0  oe-repo 1=
07 k
 kernel-module-ecatmc-3.18.48-rt54-yocto-standard
                        genericx86_64 3.18.48+git0+00ca696e63-r0  oe-repo  =
14 k
 kernel-module-igb-3.18.48-rt54-yocto-standard
                        genericx86_64 3.18.48+git0+00ca696e63-r0  oe-repo  =
71 k
 kernel-module-peak-pci-3.18.48-rt54-yocto-standard
                        genericx86_64 3.18.48+git0+00ca696e63-r0  oe-repo  =
10 k
 kernel-module-r8169-3.18.48-rt54-yocto-standard
                        genericx86_64 3.18.48+git0+00ca696e63-r0  oe-repo  =
36 k
 kernel-module-sja1000-3.18.48-rt54-yocto-standard
                        genericx86_64 3.18.48+git0+00ca696e63-r0  oe-repo  =
12 k
 ldd                    core2_64      2.26-r0                     oe-repo 8=
.3 k
 lib32-stx-mc-dev       x86           multibus+git0+1827c3da42-r0 oe-repo 6=
.3 k
 lib32-stx-mc           x86           multibus+git0+1827c3da42-r0 oe-repo 9=
.7 M
 libxml2                core2_64      2.9.4-r0                    oe-repo 5=
25 k
 lighttpd               core2_64      1.4.45-r0                   oe-repo 1=
07 k
 lsof                   core2_64      4.89-r0                     oe-repo  =
71 k
 mc-console             core2_64      HEAD+git0+98047e1427-r1     oe-repo  =
14 k
 nano                   core2_64      2.7.4-r0                    oe-repo 1=
14 k
 openssh                core2_64      7.5p1-r0                    oe-repo 5=
.7 k
 packagegroup-core-boot genericx86_64 1.0-r17                     oe-repo 5=
.5 k
 packagegroup-core-tools-debug
                        noarch        1.0-r3                      oe-repo 5=
.4 k
 pciutils               core2_64      3.5.5-r0                    oe-repo  =
43 k
 procps                 core2_64      3.3.12-r0                   oe-repo 1=
62 k
 rc-once                core2_64      HEAD+git0+98047e1427-r1     oe-repo 8=
.2 k
 rpm                    core2_64      1:4.13.90+git0+a8e51b3bb0-r0
                                                                  oe-repo 4=
07 k
 run-postinsts          noarch        1.0-r9                      oe-repo 8=
.3 k
 shadow                 core2_64      4.2.1-r0                    oe-repo 2=
12 k
 stx-corepattern        core2_64      HEAD+git0+8c76eeee8a-r0     oe-repo 8=
.1 k
 sudo                   core2_64      1.8.20p2-r0                 oe-repo 4=
58 k
 tcpdump                core2_64      4.9.2-r0                    oe-repo 3=
17 k
 udev-extraconf         core2_64      1.1-r0                      oe-repo 9=
.4 k
 usbutils               core2_64      008-r0                      oe-repo  =
61 k
 useradd-mc             core2_64      1.0-r1                      oe-repo  =
11 k
 util-linux             core2_64      2.30-r0                     oe-repo 3=
61 k
 util-linux-fsck        core2_64      2.30-r0                     oe-repo  =
25 k
 vsftpd                 core2_64      3.0.3-r0                    oe-repo  =
67 k
Installing dependencies:
 base-files             genericx86_64 3.0.14-r89                  oe-repo  =
12 k
 bind                   core2_64      9.10.5+P3-r0                oe-repo 1=
.3 M
 busybox                core2_64      1.24.1-r0                   oe-repo 3=
11 k
 busybox-hwclock        core2_64      1.24.1-r0                   oe-repo 8=
.6 k
 db                     core2_64      1:5.3.28-r1                 oe-repo 4=
61 k
 dhcp-libs              core2_64      4.3.6-r0                    oe-repo  =
55 k
 eudev                  core2_64      3.2.2-r0                    oe-repo 2=
21 k
 gdb                    core2_64      8.0-r0                      oe-repo 1=
.9 M
 gdbserver              core2_64      8.0-r0                      oe-repo 1=
50 k
 glibc-mtrace           core2_64      2.26-r0                     oe-repo 8=
.2 k
 gpgme                  core2_64      1.9.0-r0                    oe-repo 1=
30 k
 init-ifupdown          core2_64      1.0-r7                      oe-repo 9=
.4 k
 initscripts            core2_64      1.0-r155                    oe-repo  =
21 k
 initscripts-functions  core2_64      1.0-r155                    oe-repo 7=
.3 k
 kbd                    core2_64      2.0.4-r0                    oe-repo 1=
08 k
 kernel-3.18.48-rt54-yocto-standard
                        genericx86_64 3.18.48+git0+00ca696e63-r0  oe-repo 8=
.4 k
 kernel-image-3.18.48-rt54-yocto-standard
                        genericx86_64 3.18.48+git0+00ca696e63-r0  oe-repo 5=
.5 k
 kernel-image-bzimage-3.18.48-rt54-yocto-standard
                        genericx86_64 3.18.48+git0+00ca696e63-r0  oe-repo 4=
.0 M
 kernel-module-mii-3.18.48-rt54-yocto-standard
                        genericx86_64 3.18.48+git0+00ca696e63-r0  oe-repo  =
10 k
 kernel-module-pps-core-3.18.48-rt54-yocto-standard
                        genericx86_64 3.18.48+git0+00ca696e63-r0  oe-repo  =
12 k
 kernel-module-ptp-3.18.48-rt54-yocto-standard
                        genericx86_64 3.18.48+git0+00ca696e63-r0  oe-repo  =
14 k
 keymaps                genericx86_64 1.0-r31                     oe-repo 7=
.4 k
 lib32-base-files       genericx86_64 3.0.14-r89                  oe-repo  =
12 k
 lib32-bash             x86           4.4-r0                      oe-repo 4=
36 k
 lib32-bc               x86           1.06-r3                     oe-repo  =
48 k
 lib32-bzip2            x86           1.0.6-r5                    oe-repo  =
26 k
 lib32-cryptodev-linux  x86           1.9-r0                      oe-repo 5=
.4 k
 lib32-db               x86           1:5.3.28-r1                 oe-repo 5=
01 k
 lib32-diffutils        x86           3.6-r0                      oe-repo 1=
35 k
 lib32-etherlab         x86           1.5.2.5-r1                  oe-repo 1=
47 k
 lib32-flex             x86           2.6.0-r0                    oe-repo 1=
05 k
 lib32-gawk             x86           4.1.4-r0                    oe-repo 2=
95 k
 lib32-libbz2-1         x86           1.0.6-r5                    oe-repo  =
33 k
 lib32-libc6            x86           2.26-r0                     oe-repo 1=
.3 M
 lib32-libc6-extra-nss  x86           2.26-r0                     oe-repo  =
52 k
 lib32-libc6-thread-db  x86           2.26-r0                     oe-repo  =
17 k
 lib32-libcidn1         x86           2.26-r0                     oe-repo  =
40 k
 lib32-libcrypto1.0.2   x86           1.0.2n-r0                   oe-repo 6=
65 k
 lib32-libffi6          x86           3.2.1-r0                    oe-repo  =
20 k
 lib32-libform5         x86           6.0+20170715-r0             oe-repo  =
30 k
 lib32-libformw5        x86           6.0+20170715-r0             oe-repo  =
34 k
 lib32-libgcc1          x86           7.3.0-r0                    oe-repo  =
50 k
 lib32-libgdbm-compat4  x86           1.13-r0                     oe-repo  =
11 k
 lib32-libgdbm4         x86           1.13-r0                     oe-repo  =
31 k
 lib32-liblzma5         x86           5.2.3-r0                    oe-repo  =
83 k
 lib32-libmenu5         x86           6.0+20170715-r0             oe-repo  =
20 k
 lib32-libmenuw5        x86           6.0+20170715-r0             oe-repo  =
20 k
 lib32-libncurses5      x86           6.0+20170715-r0             oe-repo  =
68 k
 lib32-libncursesw5     x86           6.0+20170715-r0             oe-repo  =
89 k
 lib32-libpanel5        x86           6.0+20170715-r0             oe-repo  =
11 k
 lib32-libpanelw5       x86           6.0+20170715-r0             oe-repo  =
11 k
 lib32-libperl5         x86           5.24.1-r0                   oe-repo 7=
62 k
 lib32-libpython3.5m1.0 x86           3.5.3-r1.0                  oe-repo 7=
97 k
 lib32-libreadline7     x86           7.0-r0                      oe-repo 1=
23 k
 lib32-libsqlite3-0     x86           3:3.20.0-r0                 oe-repo 4=
13 k
 lib32-libssl1.0.2      x86           1.0.2n-r0                   oe-repo 1=
55 k
 lib32-libssp0          x86           7.3.0-r0                    oe-repo 9=
.9 k
 lib32-libstdc++6       x86           7.3.0-r0                    oe-repo 3=
81 k
 lib32-libtic5          x86           6.0+20170715-r0             oe-repo  =
33 k
 lib32-libticw5         x86           6.0+20170715-r0             oe-repo  =
33 k
 lib32-libtinfo5        x86           6.0+20170715-r0             oe-repo  =
52 k
 lib32-libxml2          x86           2.9.4-r0                    oe-repo 5=
60 k
 lib32-libz1            x86           1.2.11-r0                   oe-repo  =
51 k
 lib32-m4               x86           1.4.18-r0                   oe-repo 1=
04 k
 lib32-make             x86           4.2.1-r0                    oe-repo  =
98 k
 lib32-ncurses          x86           6.0+20170715-r0             oe-repo  =
19 k
 lib32-openssl          x86           1.0.2n-r0                   oe-repo 2=
12 k
 lib32-openssl-conf     x86           1.0.2n-r0                   oe-repo 9=
.6 k
 lib32-perl             x86           5.24.1-r0                   oe-repo  =
23 k
 lib32-python3-codecs   x86           3.5.3-r1.0                  oe-repo 7=
27 k
 lib32-python3-core     x86           3.5.3-r1.0                  oe-repo 2=
17 k
 lib32-python3-crypt    x86           3.5.3-r1.0                  oe-repo  =
30 k
 lib32-python3-importlib
                        x86           3.5.3-r1.0                  oe-repo  =
67 k
 lib32-python3-io       x86           3.5.3-r1.0                  oe-repo 1=
87 k
 lib32-python3-lang     x86           3.5.3-r1.0                  oe-repo 1=
95 k
 lib32-python3-math     x86           3.5.3-r1.0                  oe-repo  =
48 k
 lib32-python3-re       x86           3.5.3-r1.0                  oe-repo  =
38 k
 lib32-python3-reprlib  x86           3.5.3-r1.0                  oe-repo 7=
.6 k
 lib32-sed              x86           4.2.2-r0                    oe-repo  =
70 k
 lib32-update-alternatives-opkg
                        x86           0.3.5-r0                    oe-repo 8=
.2 k
 lib32-xz               x86           5.2.3-r0                    oe-repo  =
48 k
 libacl1                core2_64      2.2.52-r0                   oe-repo  =
19 k
 libarchive             core2_64      3.3.2-r0                    oe-repo 2=
66 k
 libassuan0             core2_64      2.4.3-r0                    oe-repo  =
36 k
 libattr1               core2_64      2.4.47-r0                   oe-repo  =
13 k
 libblkid1              core2_64      2.30-r0                     oe-repo 1=
15 k
 libbz2-1               core2_64      1.0.6-r5                    oe-repo  =
33 k
 libc6                  core2_64      2.26-r0                     oe-repo 1=
.4 M
 libcap2                core2_64      2.25-r0                     oe-repo  =
14 k
 libcom-err2            core2_64      1.43.5-r0                   oe-repo  =
11 k
 libcomps0.1.8          core2_64      0.1.8+git0+01a4759894-r0    oe-repo  =
88 k
 libcrypto1.0.2         core2_64      1.0.2n-r0                   oe-repo 8=
26 k
 libcurl4               core2_64      7.54.1-r0                   oe-repo 1=
49 k
 libdbus-1-3            core2_64      1.10.20-r0                  oe-repo 1=
18 k
 libdmc-error0          core2_64      1.0-r0                      oe-repo 2=
05 k
 libdnf1                core2_64      0.9.3-r0                    oe-repo 1=
26 k
 libdw1                 core2_64      0.170-r0                    oe-repo 1=
95 k
 libe2p2                core2_64      1.43.5-r0                   oe-repo  =
18 k
 libelf1                core2_64      0.170-r0                    oe-repo  =
44 k
 libexpat1              core2_64      2.2.3-r0                    oe-repo  =
64 k
 libext2fs2             core2_64      1.43.5-r0                   oe-repo 1=
42 k
 libfdisk1              core2_64      2.30-r0                     oe-repo 1=
51 k
 libffi6                core2_64      3.2.1-r0                    oe-repo  =
21 k
 libgcc1                core2_64      7.3.0-r0                    oe-repo  =
43 k
 libgcrypt              core2_64      1.8.0-r0                    oe-repo 3=
83 k
 libglib-2.0-0          core2_64      1:2.52.3-r0                 oe-repo 9=
49 k
 libgmp10               core2_64      6.1.2-r0                    oe-repo 2=
16 k
 libgnutls30            core2_64      3.5.13-r0                   oe-repo 4=
86 k
 libgomp1               core2_64      7.3.0-r0                    oe-repo  =
76 k
 libgpg-error0          core2_64      1.27-r0                     oe-repo  =
36 k
 libidn11               core2_64      1.33-r0                     oe-repo  =
45 k
 libinotifytools0       core2_64      3.14+git0+1df9af4d6c-r0     oe-repo  =
19 k
 libkmod2               core2_64      24+git0+ef4257b59c-r0       oe-repo  =
37 k
 libksba8               core2_64      1.3.5-r0                    oe-repo  =
88 k
 liblzma5               core2_64      5.2.3-r0                    oe-repo  =
77 k
 liblzo2-2              core2_64      2.10-r0                     oe-repo  =
46 k
 libmount1              core2_64      2.30-r0                     oe-repo 1=
27 k
 libncurses5            core2_64      6.0+20170715-r0             oe-repo  =
64 k
 libncursesw5           core2_64      6.0+20170715-r0             oe-repo  =
83 k
 libnpth0               core2_64      1.5-r0                      oe-repo  =
11 k
 libpanel5              core2_64      6.0+20170715-r0             oe-repo  =
11 k
 libpanelw5             core2_64      6.0+20170715-r0             oe-repo  =
11 k
 libpcap1               core2_64      1.8.1-r0                    oe-repo  =
98 k
 libpci3                core2_64      3.5.5-r0                    oe-repo  =
26 k
 libpcre1               core2_64      8.41-r0                     oe-repo  =
90 k
 libperl5               core2_64      5.24.1-r0                   oe-repo 7=
13 k
 libpopt0               core2_64      1.16-r3                     oe-repo  =
27 k
 libpython2.7-1.0       core2_64      2.7.13-r1                   oe-repo 5=
64 k
 libpython3.5m1.0       core2_64      3.5.3-r1.0                  oe-repo 7=
54 k
 libreadline7           core2_64      7.0-r0                      oe-repo 1=
19 k
 librepo0               core2_64      1.7.20+git0+e1137cbbda-r0   oe-repo  =
84 k
 libsmartcols1          core2_64      2.30-r0                     oe-repo  =
75 k
 libsolv0               core2_64      0.6.28-r0                   oe-repo 2=
42 k
 libsolvext0            core2_64      0.6.28-r0                   oe-repo  =
65 k
 libsqlite3-0           core2_64      3:3.20.0-r0                 oe-repo 3=
89 k
 libssl1.0.2            core2_64      1.0.2n-r0                   oe-repo 1=
44 k
 libstdc++6             core2_64      7.3.0-r0                    oe-repo 3=
52 k
 libtinfo5              core2_64      6.0+20170715-r0             oe-repo  =
53 k
 libudev1               core2_64      3.2.2-r0                    oe-repo  =
62 k
 libunistring2          core2_64      0.9.7-r0                    oe-repo 3=
68 k
 libusb-1.0-0           core2_64      1.0.21-r0                   oe-repo  =
44 k
 libuuid1               core2_64      2.30-r0                     oe-repo  =
13 k
 libwrap0               core2_64      7.6-r10                     oe-repo  =
19 k
 libx11-6               core2_64      1:1.6.5-r0                  oe-repo 5=
51 k
 libxau6                core2_64      1:1.0.8-r0                  oe-repo  =
10 k
 libxcb1                core2_64      1.12-r0                     oe-repo  =
43 k
 libxdmcp6              core2_64      1:1.1.2-r0                  oe-repo  =
14 k
 libz1                  core2_64      1.2.11-r0                   oe-repo  =
49 k
 lighttpd-module-dirlisting
                        core2_64      1.4.45-r0                   oe-repo  =
15 k
 lighttpd-module-indexfile
                        core2_64      1.4.45-r0                   oe-repo 9=
.4 k
 lighttpd-module-staticfile
                        core2_64      1.4.45-r0                   oe-repo 9=
.1 k
 modutils-initscripts   core2_64      1.0-r7                      oe-repo 7=
.9 k
 ncurses-terminfo       core2_64      6.0+20170715-r0             oe-repo 4=
46 k
 ncurses-terminfo-base  core2_64      6.0+20170715-r0             oe-repo  =
13 k
 netbase                core2_64      1:5.4-r0                    oe-repo  =
15 k
 nettle                 core2_64      3.3-r0                      oe-repo 2=
32 k
 nspr                   core2_64      4.16-r0                     oe-repo 1=
19 k
 nss                    core2_64      3.31.1-r0                   oe-repo 1=
.9 M
 openssh-keygen         core2_64      7.5p1-r0                    oe-repo 1=
47 k
 openssh-scp            core2_64      7.5p1-r0                    oe-repo  =
40 k
 openssh-ssh            core2_64      7.5p1-r0                    oe-repo 2=
68 k
 openssh-sshd           core2_64      7.5p1-r0                    oe-repo 2=
94 k
 openssl                core2_64      1.0.2n-r0                   oe-repo 1=
99 k
 openssl-conf           core2_64      1.0.2n-r0                   oe-repo 9=
.6 k
 pciutils-ids           core2_64      3.5.5-r0                    oe-repo 2=
51 k
 perl                   core2_64      5.24.1-r0                   oe-repo  =
23 k
 python-codecs          core2_64      2.7.13-r1                   oe-repo 6=
44 k
 python-contextlib      core2_64      2.7.13-r1                   oe-repo 8=
.8 k
 python-core            core2_64      2.7.13-r1                   oe-repo 1=
76 k
 python-crypt           core2_64      2.7.13-r1                   oe-repo  =
20 k
 python-ctypes          core2_64      2.7.13-r1                   oe-repo 1=
69 k
 python-curses          core2_64      2.7.13-r1                   oe-repo  =
40 k
 python-datetime        core2_64      2.7.13-r1                   oe-repo  =
61 k
 python-io              core2_64      2.7.13-r1                   oe-repo 1=
87 k
 python-lang            core2_64      2.7.13-r1                   oe-repo 1=
65 k
 python-logging         core2_64      2.7.13-r1                   oe-repo  =
61 k
 python-math            core2_64      2.7.13-r1                   oe-repo  =
62 k
 python-mime            core2_64      2.7.13-r1                   oe-repo  =
36 k
 python-netclient       core2_64      2.7.13-r1                   oe-repo 1=
98 k
 python-pickle          core2_64      2.7.13-r1                   oe-repo  =
81 k
 python-pprint          core2_64      2.7.13-r1                   oe-repo  =
12 k
 python-re              core2_64      2.7.13-r1                   oe-repo  =
36 k
 python-shell           core2_64      2.7.13-r1                   oe-repo  =
37 k
 python-stringold       core2_64      2.7.13-r1                   oe-repo  =
28 k
 python-textutils       core2_64      2.7.13-r1                   oe-repo  =
56 k
 python3-argparse       core2_64      3.5.3-r1.0                  oe-repo  =
44 k
 python3-audio          core2_64      3.5.3-r1.0                  oe-repo  =
48 k
 python3-codecs         core2_64      3.5.3-r1.0                  oe-repo 7=
30 k
 python3-compression    core2_64      3.5.3-r1.0                  oe-repo 1=
06 k
 python3-core           core2_64      3.5.3-r1.0                  oe-repo 2=
15 k
 python3-crypt          core2_64      3.5.3-r1.0                  oe-repo  =
30 k
 python3-curses         core2_64      3.5.3-r1.0                  oe-repo  =
43 k
 python3-datetime       core2_64      3.5.3-r1.0                  oe-repo  =
87 k
 python3-distutils      core2_64      3.5.3-r1.0                  oe-repo 9=
92 k
 python3-email          core2_64      3.5.3-r1.0                  oe-repo 1=
93 k
 python3-enum           core2_64      3.5.3-r1.0                  oe-repo  =
18 k
 python3-fcntl          core2_64      3.5.3-r1.0                  oe-repo  =
12 k
 python3-gpg            core2_64      1.9.0-r0                    oe-repo 1=
87 k
 python3-html           core2_64      3.5.3-r1.0                  oe-repo  =
59 k
 python3-image          core2_64      3.5.3-r1.0                  oe-repo  =
12 k
 python3-importlib      core2_64      3.5.3-r1.0                  oe-repo  =
67 k
 python3-iniparse       core2_64      0.4-r0                      oe-repo  =
28 k
 python3-io             core2_64      3.5.3-r1.0                  oe-repo 1=
84 k
 python3-json           core2_64      3.5.3-r1.0                  oe-repo  =
41 k
 python3-lang           core2_64      3.5.3-r1.0                  oe-repo 1=
93 k
 python3-logging        core2_64      3.5.3-r1.0                  oe-repo  =
75 k
 python3-math           core2_64      3.5.3-r1.0                  oe-repo  =
47 k
 python3-mime           core2_64      3.5.3-r1.0                  oe-repo  =
16 k
 python3-misc           core2_64      3.5.3-r1.0                  oe-repo 2=
.2 M
 python3-netclient      core2_64      3.5.3-r1.0                  oe-repo 2=
68 k
 python3-pickle         core2_64      3.5.3-r1.0                  oe-repo  =
72 k
 python3-re             core2_64      3.5.3-r1.0                  oe-repo  =
38 k
 python3-reprlib        core2_64      3.5.3-r1.0                  oe-repo 7=
.6 k
 python3-rpm            core2_64      1:4.13.90+git0+a8e51b3bb0-r0
                                                                  oe-repo  =
49 k
 python3-selectors      core2_64      3.5.3-r1.0                  oe-repo  =
15 k
 python3-shell          core2_64      3.5.3-r1.0                  oe-repo  =
44 k
 python3-signal         core2_64      3.5.3-r1.0                  oe-repo 8=
.3 k
 python3-six            core2_64      1.10.0-r0                   oe-repo  =
22 k
 python3-sqlite3        core2_64      3.5.3-r1.0                  oe-repo  =
35 k
 python3-stringold      core2_64      3.5.3-r1.0                  oe-repo  =
13 k
 python3-subprocess     core2_64      3.5.3-r1.0                  oe-repo  =
37 k
 python3-textutils      core2_64      3.5.3-r1.0                  oe-repo  =
62 k
 python3-threading      core2_64      3.5.3-r1.0                  oe-repo  =
38 k
 python3-unixadmin      core2_64      3.5.3-r1.0                  oe-repo  =
18 k
 shadow-base            core2_64      4.2.1-r0                    oe-repo  =
54 k
 shadow-securetty       genericx86_64 4.2.1-r3                    oe-repo 6=
.5 k
 strace                 core2_64      4.18-r0                     oe-repo 1=
62 k
 sysvinit               core2_64      2.88dsf-r14                 oe-repo  =
58 k
 sysvinit-inittab       genericx86_64 2.88dsf-r10                 oe-repo 8=
.0 k
 sysvinit-pidof         core2_64      2.88dsf-r14                 oe-repo  =
14 k
 update-alternatives-opkg
                        core2_64      0.3.5-r0                    oe-repo 8=
.2 k
 util-linux-losetup     core2_64      2.30-r0                     oe-repo  =
36 k
 util-linux-lsblk       core2_64      2.30-r0                     oe-repo  =
33 k
 util-linux-sulogin     core2_64      2.30-r0                     oe-repo  =
23 k
 util-linux-swaponoff   core2_64      2.30-r0                     oe-repo  =
27 k
 util-linux-umount      core2_64      2.30-r0                     oe-repo  =
16 k
Installing weak dependencies:
 busybox-syslog         core2_64      1.24.1-r0                   oe-repo 9=
.2 k
 busybox-udhcpc         core2_64      1.24.1-r0                   oe-repo 7=
.7 k
 ca-certificates        noarch        20170717-r0                 oe-repo 1=
55 k
 dbus-1                 core2_64      1.10.20-r0                  oe-repo 1=
24 k
 eudev-hwdb             core2_64      3.2.2-r0                    oe-repo 6=
83 k
 lib32-base-files-dev   genericx86_64 3.0.14-r89                  oe-repo 5=
.6 k
 lib32-bash-dev         x86           4.4-r0                      oe-repo  =
64 k
 lib32-bc-dev           x86           1.06-r3                     oe-repo 5=
.6 k
 lib32-bzip2-dev        x86           1.0.6-r5                    oe-repo 8=
.3 k
 lib32-cryptodev-linux-dev
                        x86           1.9-r0                      oe-repo 9=
.0 k
 lib32-db-dev           x86           1:5.3.28-r1                 oe-repo  =
41 k
 lib32-diffutils-dev    x86           3.6-r0                      oe-repo 5=
.8 k
 lib32-etherlab-dev     x86           1.5.2.5-r1                  oe-repo 5=
.6 k
 lib32-flex-dev         x86           2.6.0-r0                    oe-repo 9=
.0 k
 lib32-gawk-dev         x86           4.1.4-r0                    oe-repo  =
15 k
 lib32-libc6-dev        x86           2.26-r0                     oe-repo 4=
55 k
 lib32-libffi-dev       x86           3.2.1-r0                    oe-repo  =
12 k
 lib32-libgcc-s-dev     x86           7.3.0-r0                    oe-repo 2=
.8 M
 lib32-libgdbm-dev      x86           1.13-r0                     oe-repo  =
11 k
 lib32-libreadline-dev  x86           7.0-r0                      oe-repo  =
23 k
 lib32-libsqlite3-dev   x86           3:3.20.0-r0                 oe-repo 1=
16 k
 lib32-libssp-dev       x86           7.3.0-r0                    oe-repo  =
11 k
 lib32-libstdc++-dev    x86           7.3.0-r0                    oe-repo 9=
01 k
 lib32-libxml2-dev      x86           2.9.4-r0                    oe-repo  =
78 k
 lib32-libz-dev         x86           1.2.11-r0                   oe-repo  =
33 k
 lib32-linux-libc-headers-dev
                        x86           4.12-r0                     oe-repo 9=
71 k
 lib32-m4-dev           x86           1.4.18-r0                   oe-repo 5=
.8 k
 lib32-make-dev         x86           4.2.1-r0                    oe-repo 7=
.8 k
 lib32-ncurses-dev      x86           6.0+20170715-r0             oe-repo  =
65 k
 lib32-ncurses-terminfo-base
                        x86           6.0+20170715-r0             oe-repo  =
13 k
 lib32-openssl-dev      x86           1.0.2n-r0                   oe-repo 2=
27 k
 lib32-perl-dev         x86           5.24.1-r0                   oe-repo 3=
87 k
 lib32-python3-dev      x86           3.5.3-r1.0                  oe-repo 1=
43 k
 lib32-python3-readline x86           3.5.3-r1.0                  oe-repo  =
20 k
 lib32-sed-dev          x86           4.2.2-r0                    oe-repo 5=
.6 k
 lib32-xz-dev           x86           5.2.3-r0                    oe-repo  =
41 k
 libc6-thread-db        core2_64      2.26-r0                     oe-repo  =
17 k
 lighttpd-module-access core2_64      1.4.45-r0                   oe-repo 9=
.1 k
 lighttpd-module-accesslog
                        core2_64      1.4.45-r0                   oe-repo  =
14 k
 pinentry               core2_64      1.0.0-r0                    oe-repo  =
31 k
 python-readline        core2_64      2.7.13-r1                   oe-repo  =
17 k
 python3-readline       core2_64      3.5.3-r1.0                  oe-repo  =
19 k
 shared-mime-info       core2_64      1.8-r0                      oe-repo 3=
62 k
 update-rc.d            noarch        0.7-r5                      oe-repo 8=
.0 k
 util-linux-cfdisk      core2_64      2.30-r0                     oe-repo  =
38 k
 util-linux-fdisk       core2_64      2.30-r0                     oe-repo  =
47 k
 util-linux-ionice      core2_64      2.30-r0                     oe-repo  =
15 k
 util-linux-mkfs        core2_64      2.30-r0                     oe-repo 9=
.7 k
 util-linux-mount       core2_64      2.30-r0                     oe-repo  =
18 k
 util-linux-mountpoint  core2_64      2.30-r0                     oe-repo  =
11 k
 util-linux-prlimit     core2_64      2.30-r0                     oe-repo  =
17 k
 util-linux-readprofile core2_64      2.30-r0                     oe-repo  =
12 k
 util-linux-sfdisk      core2_64      2.30-r0                     oe-repo  =
43 k
 util-linux-switch-root core2_64      2.30-r0                     oe-repo  =
10 k

Transaction Summary
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
Install  342 Packages

Total size: 67 M
Installed size: 218 M
Downloading Packages:
Running transaction check
Transaction check succeeded.
Running transaction test
Error: Transaction check error:
  file /usr/bin/python3.5m-config conflicts between attempted installs of l=
ib32-python3-core-3.5.3-r1.0.x86 and python3-core-3.5.3-r1.0.core2_64

Error Summary
-------------


ERROR: core-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs
ERROR: Logfile of failure stored in: /opt/poky/build/tmp/work/genericx86_64=
-poky-linux/core-image-minimal/1.0-r0/temp/log.do_rootfs.28954
ERROR: Task (/opt/poky/meta/recipes-core/images/core-image-minimal.bb:do_ro=
otfs) failed with exit code '1'
NOTE: Tasks Summary: Attempted 3898 tasks of which 3836 didn't need to be r=
erun and 1 failed.

Summary: 1 task failed:
  /opt/poky/meta/recipes-core/images/core-image-minimal.bb:do_rootfs
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.



I understand that there's a conflict regarding the installation of /usr/bin=
/python3.5m-config between python3 and lib32-python3, but I have no idea ho=
w to solve it.

Any pointers?

Thanks a lot,

Nir.



--_000_VI1PR0701MB2814121932475233E7F689C890AD0VI1PR0701MB2814_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0">Hello,</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">I'm trying to build the latest Yo=
cto project for a x86-64 machine, and add a few packages that are built wit=
h 32 bit configuration using the multilib mechanism.</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">I pulled rocko 2.4.2 and set up m=
y local.conf:</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0"></p>
<div># This sets the default machine to be qemux86 if no other machine is s=
elected:</div>
<div>MACHINE ??=3D &quot;genericx86-64&quot;</div>
<div><br>
</div>
<div># Enable multilib to allow 32 bit build of some&nbsp;packages</div>
<div>require conf/multilib.conf</div>
<div>MULTILIBS =3D &quot;multilib:lib32&quot;</div>
<div>DEFAULTTUNE_virtclass-multilib-lib32 =3D &quot;x86&quot;</div>
<div><br>
</div>
<div>When I bitbake core-image-minimal all the packages are built successfu=
lly, but&nbsp;<span>core-image-minimal.bb:do_rootfs fails and</span></div>
<div><span></span>I get the following error:</div>
<div><br>
</div>
<div><br>
</div>
<div>
<div>/opt/poky/build$ bitbake core-image-minimal</div>
<div>Loading cache: 100% |#################################################=
###########################################################################=
############################################| Time: 0:00:02</div>
<div>Loaded 4608 entries from dependency cache.</div>
<div>Parsing recipes: 100% |###############################################=
###########################################################################=
############################################| Time: 0:00:04</div>
<div>Parsing of 1914 .bb files complete (1909 cached, 5 parsed). 4617 targe=
ts, 240 skipped, 0 masked, 0 errors.</div>
<div>NOTE: Resolving any missing task queue dependencies</div>
<div><br>
</div>
<div>Build Configuration:</div>
<div>BB_VERSION&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D &quot;1.36.0&qu=
ot;</div>
<div>BUILD_SYS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D &quot;x86_64-li=
nux&quot;</div>
<div>NATIVELSBSTRING&nbsp; &nbsp; &nbsp; =3D &quot;universal&quot;</div>
<div>TARGET_SYS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D &quot;x86_64-po=
ky-linux&quot;</div>
<div>MACHINE&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D &quot;gene=
ricx86-64&quot;</div>
<div>DISTRO&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D &quot=
;poky&quot;</div>
<div>DISTRO_VERSION&nbsp; &nbsp; &nbsp; &nbsp;=3D &quot;2.4.2&quot;</div>
<div>TUNE_FEATURES&nbsp; &nbsp; &nbsp; &nbsp; =3D &quot;m64 core2&quot;</di=
v>
<div>TARGET_FPU&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D &quot;&quot;</d=
iv>
<div>meta&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</di=
v>
<div>meta-poky&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div>
<div>meta-yocto-bsp&nbsp; &nbsp; &nbsp; &nbsp;=3D &quot;stx-rocko:26de16bef=
191f5122e26c84f2596ea49c0bd8b1a&quot;</div>
<div>meta-oe&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div>
<div>meta-python&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div>
<div>meta-networking&nbsp; &nbsp; &nbsp; =3D &quot;rocko:dacfa2b1920e285531=
bec55cd2f08743390aaf57&quot;</div>
<div>meta-stx-mc&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D &quot;stx-rocko:26de=
16bef191f5122e26c84f2596ea49c0bd8b1a&quot;</div>
<div><br>
</div>
<div>Initialising tasks: 100% |############################################=
###########################################################################=
############################################| Time: 0:00:10</div>
<div>NOTE: Executing SetScene Tasks</div>
<div>NOTE: Executing RunQueue Tasks</div>
<div>ERROR: core-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. Comm=
and '/opt/poky/build/tmp/work/genericx86_64-poky-linux/core-image-minimal/1=
.0-r0/recipe-sysroot-native/usr/bin/dnf -y -c /opt/poky/build/tmp/work/gene=
ricx86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/etc/dnf/dnf.conf
 --setopt=3Dreposdir=3D/opt/poky/build/tmp/work/genericx86_64-poky-linux/co=
re-image-minimal/1.0-r0/rootfs/etc/yum.repos.d --repofrompath=3Doe-repo,/op=
t/poky/build/tmp/work/genericx86_64-poky-linux/core-image-minimal/1.0-r0/oe=
-rootfs-repo --installroot=3D/opt/poky/build/tmp/work/genericx86_64-poky-li=
nux/core-image-minimal/1.0-r0/rootfs
 --setopt=3Dlogdir=3D/opt/poky/build/tmp/work/genericx86_64-poky-linux/core=
-image-minimal/1.0-r0/temp --nogpgcheck install cronie rpm useradd-mc stx-c=
orepattern inotify-tools iotop packagegroup-core-tools-debug lighttpd ldd i=
proute2 kernel-module-can-raw can-utils
 procps kernel-module-igb util-linux bash util-linux-fsck etherlab vsftpd a=
top htop sudo tcpdump kernel-module-sja1000 pciutils kernel-module-can kern=
el-module-peak-pci gnupg dhcp-client base-passwd udev-extraconf usbutils ke=
rnel-module-ec-master libxml2 shadow
 packagegroup-core-boot rc-once openssh mc-console lsof kernel-module-can-d=
ev kernel-module-r8169 dnf e2fsprogs-e2fsck kernel-module-ecatmc ethtool ru=
n-postinsts coreutils file nano lib32-stx-mc lib32-stx-mc-dev' returned 1:<=
/div>
<div>Added oe-repo repo from /opt/poky/build/tmp/work/genericx86_64-poky-li=
nux/core-image-minimal/1.0-r0/oe-rootfs-repo</div>
<div>Last metadata expiration check: 0:00:01 ago on Mon 26 Mar 2018 11:57:3=
8 AM UTC.</div>
<div>Dependencies resolved.</div>
<div>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D</div>
<div>&nbsp;Package&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; A=
rch&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Version&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Repository</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Size</div>
<div>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D</div>
<div>Installing:</div>
<div>&nbsp;atop&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 2.2.3-r0&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 79 k</div>
<div>&nbsp;base-passwd&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nb=
sp; &nbsp; &nbsp; 3.5.29-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;oe-repo 6.8 k</div>
<div>&nbsp;bash&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 4.4-r0&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 426 k</div>
<div>&nbsp;can-utils&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_=
64&nbsp; &nbsp; &nbsp; 0.0&#43;gitr0&#43;4c8fb05cb4-r0&nbsp; &nbsp; &nbsp;o=
e-repo&nbsp; 81 k</div>
<div>&nbsp;coreutils&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_=
64&nbsp; &nbsp; &nbsp; 8.27-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 846 k</div>
<div>&nbsp;cronie&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;core2_64&nbsp; &nbsp; &nbsp; 1.5.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 44 k</div>
<div>&nbsp;dhcp-client&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nb=
sp; &nbsp; &nbsp; 4.3.6-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; oe-repo 160 k</div>
<div>&nbsp;dnf&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 2.6.3-r0&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 163 k</div>
<div>&nbsp;e2fsprogs-e2fsck&nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp;=
 &nbsp; 1.43.5-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;oe-repo 116 k</div>
<div>&nbsp;etherlab&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c=
ore2_64&nbsp; &nbsp; &nbsp; 1.5.2.5-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; oe-repo 149 k</div>
<div>&nbsp;ethtool&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; c=
ore2_64&nbsp; &nbsp; &nbsp; 4.11-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 89 k</div>
<div>&nbsp;file&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 5.31-r0&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 241 k</div>
<div>&nbsp;gnupg&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; core2_64&nbsp; &nbsp; &nbsp; 2.2.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 1.1 M</div>
<div>&nbsp;htop&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 1.0.3-r0&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 61 k</div>
<div>&nbsp;inotify-tools&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &=
nbsp; &nbsp; 3.14&#43;git0&#43;1df9af4d6c-r0&nbsp; &nbsp; &nbsp;oe-repo&nbs=
p; 20 k</div>
<div>&nbsp;iotop&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; core2_64&nbsp; &nbsp; &nbsp; 0.6-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 38 k</div>
<div>&nbsp;iproute2&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c=
ore2_64&nbsp; &nbsp; &nbsp; 4.11.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 199 k</div>
<div>&nbsp;kernel-module-can-3.18.48-rt54-yocto-standard</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; genericx86_64 3.18.48&#43;git0&#43;00ca696e63-r0&nbsp; oe-rep=
o&nbsp; 15 k</div>
<div>&nbsp;kernel-module-can-dev-3.18.48-rt54-yocto-standard</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; genericx86_64 3.18.48&#43;git0&#43;00ca696e63-r0&nbsp; oe-rep=
o&nbsp; 13 k</div>
<div>&nbsp;kernel-module-can-raw-3.18.48-rt54-yocto-standard</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; genericx86_64 3.18.48&#43;git0&#43;00ca696e63-r0&nbsp; oe-rep=
o&nbsp; 12 k</div>
<div>&nbsp;kernel-module-ec-master-3.18.48-rt54-yocto-standard</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; genericx86_64 3.18.48&#43;git0&#43;00ca696e63-r0&nbsp; oe-rep=
o 107 k</div>
<div>&nbsp;kernel-module-ecatmc-3.18.48-rt54-yocto-standard</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; genericx86_64 3.18.48&#43;git0&#43;00ca696e63-r0&nbsp; oe-rep=
o&nbsp; 14 k</div>
<div>&nbsp;kernel-module-igb-3.18.48-rt54-yocto-standard</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; genericx86_64 3.18.48&#43;git0&#43;00ca696e63-r0&nbsp; oe-rep=
o&nbsp; 71 k</div>
<div>&nbsp;kernel-module-peak-pci-3.18.48-rt54-yocto-standard</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; genericx86_64 3.18.48&#43;git0&#43;00ca696e63-r0&nbsp; oe-rep=
o&nbsp; 10 k</div>
<div>&nbsp;kernel-module-r8169-3.18.48-rt54-yocto-standard</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; genericx86_64 3.18.48&#43;git0&#43;00ca696e63-r0&nbsp; oe-rep=
o&nbsp; 36 k</div>
<div>&nbsp;kernel-module-sja1000-3.18.48-rt54-yocto-standard</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; genericx86_64 3.18.48&#43;git0&#43;00ca696e63-r0&nbsp; oe-rep=
o&nbsp; 12 k</div>
<div>&nbsp;ldd&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 2.26-r0&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 8.3 k</div>
<div>&nbsp;lib32-stx-mc-dev&nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;multibus&#43;git0&#43;1827c3da42-r0 oe-repo 6.3 k</d=
iv>
<div>&nbsp;lib32-stx-mc&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;multibus&#43;git0&#43;1827c3da42-r0 oe-rep=
o 9.7 M</div>
<div>&nbsp;libxml2&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; c=
ore2_64&nbsp; &nbsp; &nbsp; 2.9.4-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 525 k</div>
<div>&nbsp;lighttpd&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c=
ore2_64&nbsp; &nbsp; &nbsp; 1.4.45-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 107 k</div>
<div>&nbsp;lsof&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 4.89-r0&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 71 k</div>
<div>&nbsp;mc-console&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_=
64&nbsp; &nbsp; &nbsp; HEAD&#43;git0&#43;98047e1427-r1&nbsp; &nbsp; &nbsp;o=
e-repo&nbsp; 14 k</div>
<div>&nbsp;nano&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 2.7.4-r0&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 114 k</div>
<div>&nbsp;openssh&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; c=
ore2_64&nbsp; &nbsp; &nbsp; 7.5p1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 5.7 k</div>
<div>&nbsp;packagegroup-core-boot genericx86_64 1.0-r17&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 5.5 k</div>
<div>&nbsp;packagegroup-core-tools-debug</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; noarch&nbsp; &nbsp; &nbsp; &nbsp; 1.0-r3&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 5.4 k</div>
<div>&nbsp;pciutils&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c=
ore2_64&nbsp; &nbsp; &nbsp; 3.5.5-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 43 k</div>
<div>&nbsp;procps&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;core2_64&nbsp; &nbsp; &nbsp; 3.3.12-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 162 k</div>
<div>&nbsp;rc-once&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; c=
ore2_64&nbsp; &nbsp; &nbsp; HEAD&#43;git0&#43;98047e1427-r1&nbsp; &nbsp; &n=
bsp;oe-repo 8.2 k</div>
<div>&nbsp;rpm&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 1:4.13.90&#43;git0&#43;a8e51b3bb0-r0<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; oe-repo 407 k</div>
<div>&nbsp;run-postinsts&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; noarch&nbsp; &nb=
sp; &nbsp; &nbsp; 1.0-r9&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; oe-repo 8.3 k</div>
<div>&nbsp;shadow&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;core2_64&nbsp; &nbsp; &nbsp; 4.2.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 212 k</div>
<div>&nbsp;stx-corepattern&nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp;=
 &nbsp; HEAD&#43;git0&#43;8c76eeee8a-r0&nbsp; &nbsp; &nbsp;oe-repo 8.1 k</d=
iv>
<div>&nbsp;sudo&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 1.8.20p2-r0&nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 458 k</div>
<div>&nbsp;tcpdump&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; c=
ore2_64&nbsp; &nbsp; &nbsp; 4.9.2-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 317 k</div>
<div>&nbsp;udev-extraconf&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &=
nbsp; &nbsp; 1.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; oe-repo 9.4 k</div>
<div>&nbsp;usbutils&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c=
ore2_64&nbsp; &nbsp; &nbsp; 008-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 61 k</div>
<div>&nbsp;useradd-mc&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_=
64&nbsp; &nbsp; &nbsp; 1.0-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 11 k</div>
<div>&nbsp;util-linux&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_=
64&nbsp; &nbsp; &nbsp; 2.30-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 361 k</div>
<div>&nbsp;util-linux-fsck&nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp;=
 &nbsp; 2.30-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;oe-repo&nbsp; 25 k</div>
<div>&nbsp;vsftpd&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;core2_64&nbsp; &nbsp; &nbsp; 3.0.3-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 67 k</div>
<div>Installing dependencies:</div>
<div>&nbsp;base-files&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;generi=
cx86_64 3.0.14-r89&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; oe-repo&nbsp; 12 k</div>
<div>&nbsp;bind&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 9.10.5&#43;P3-r0&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 1.3 M</div>
<div>&nbsp;busybox&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; c=
ore2_64&nbsp; &nbsp; &nbsp; 1.24.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 311 k</div>
<div>&nbsp;busybox-hwclock&nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp;=
 &nbsp; 1.24.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;oe-repo 8.6 k</div>
<div>&nbsp;db&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 1:5.3.28-r1&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 461 k</div>
<div>&nbsp;dhcp-libs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_=
64&nbsp; &nbsp; &nbsp; 4.3.6-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 55 k</div>
<div>&nbsp;eudev&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; core2_64&nbsp; &nbsp; &nbsp; 3.2.2-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 221 k</div>
<div>&nbsp;gdb&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 8.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 1.9 M</div>
<div>&nbsp;gdbserver&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_=
64&nbsp; &nbsp; &nbsp; 8.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 150 k</div>
<div>&nbsp;glibc-mtrace&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nb=
sp; &nbsp; &nbsp; 2.26-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;oe-repo 8.2 k</div>
<div>&nbsp;gpgme&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; core2_64&nbsp; &nbsp; &nbsp; 1.9.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 130 k</div>
<div>&nbsp;init-ifupdown&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &=
nbsp; &nbsp; 1.0-r7&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; oe-repo 9.4 k</div>
<div>&nbsp;initscripts&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nb=
sp; &nbsp; &nbsp; 1.0-r155&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; oe-repo&nbsp; 21 k</div>
<div>&nbsp;initscripts-functions&nbsp; core2_64&nbsp; &nbsp; &nbsp; 1.0-r15=
5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-r=
epo 7.3 k</div>
<div>&nbsp;kbd&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 2.0.4-r0&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 108 k</div>
<div>&nbsp;kernel-3.18.48-rt54-yocto-standard</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; genericx86_64 3.18.48&#43;git0&#43;00ca696e63-r0&nbsp; oe-rep=
o 8.4 k</div>
<div>&nbsp;kernel-image-3.18.48-rt54-yocto-standard</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; genericx86_64 3.18.48&#43;git0&#43;00ca696e63-r0&nbsp; oe-rep=
o 5.5 k</div>
<div>&nbsp;kernel-image-bzimage-3.18.48-rt54-yocto-standard</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; genericx86_64 3.18.48&#43;git0&#43;00ca696e63-r0&nbsp; oe-rep=
o 4.0 M</div>
<div>&nbsp;kernel-module-mii-3.18.48-rt54-yocto-standard</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; genericx86_64 3.18.48&#43;git0&#43;00ca696e63-r0&nbsp; oe-rep=
o&nbsp; 10 k</div>
<div>&nbsp;kernel-module-pps-core-3.18.48-rt54-yocto-standard</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; genericx86_64 3.18.48&#43;git0&#43;00ca696e63-r0&nbsp; oe-rep=
o&nbsp; 12 k</div>
<div>&nbsp;kernel-module-ptp-3.18.48-rt54-yocto-standard</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; genericx86_64 3.18.48&#43;git0&#43;00ca696e63-r0&nbsp; oe-rep=
o&nbsp; 14 k</div>
<div>&nbsp;keymaps&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; g=
enericx86_64 1.0-r31&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;oe-repo 7.4 k</div>
<div>&nbsp;lib32-base-files&nbsp; &nbsp; &nbsp; &nbsp;genericx86_64 3.0.14-=
r89&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&n=
bsp; 12 k</div>
<div>&nbsp;lib32-bash&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;4.4-r0&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 436 k</div>
<div>&nbsp;lib32-bc&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x=
86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1.06-r3&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 48 k</div>
<div>&nbsp;lib32-bzip2&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1.0.6-r5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 26 k</div>
<div>&nbsp;lib32-cryptodev-linux&nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;1.9-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; oe-repo 5.4 k</div>
<div>&nbsp;lib32-db&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x=
86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1:5.3.28-r1&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 501 k</div>
<div>&nbsp;lib32-diffutils&nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;3.6-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 135 k</div>
<div>&nbsp;lib32-etherlab&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;1.5.2.5-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; oe-repo 147 k</div>
<div>&nbsp;lib32-flex&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2.6.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 105 k</div>
<div>&nbsp;lib32-gawk&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;4.1.4-r0&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 295 k</div>
<div>&nbsp;lib32-libbz2-1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;1.0.6-r5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 33 k</div>
<div>&nbsp;lib32-libc6&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2.26-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 1.3 M</div>
<div>&nbsp;lib32-libc6-extra-nss&nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;2.26-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;oe-repo&nbsp; 52 k</div>
<div>&nbsp;lib32-libc6-thread-db&nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;2.26-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;oe-repo&nbsp; 17 k</div>
<div>&nbsp;lib32-libcidn1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;2.26-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 40 k</div>
<div>&nbsp;lib32-libcrypto1.0.2&nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;1.0.2n-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;oe-repo 665 k</div>
<div>&nbsp;lib32-libffi6&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;3.2.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 20 k</div>
<div>&nbsp;lib32-libform5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;oe-repo&nbsp; 30 k</div>
<div>&nbsp;lib32-libformw5&nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;oe-repo&nbsp; 34 k</div>
<div>&nbsp;lib32-libgcc1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;7.3.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 50 k</div>
<div>&nbsp;lib32-libgdbm-compat4&nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;1.13-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;oe-repo&nbsp; 11 k</div>
<div>&nbsp;lib32-libgdbm4&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;1.13-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 31 k</div>
<div>&nbsp;lib32-liblzma5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;5.2.3-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 83 k</div>
<div>&nbsp;lib32-libmenu5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;oe-repo&nbsp; 20 k</div>
<div>&nbsp;lib32-libmenuw5&nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;oe-repo&nbsp; 20 k</div>
<div>&nbsp;lib32-libncurses5&nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;oe-repo&nbsp; 68 k</div>
<div>&nbsp;lib32-libncursesw5&nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;oe-repo&nbsp; 89 k</div>
<div>&nbsp;lib32-libpanel5&nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;oe-repo&nbsp; 11 k</div>
<div>&nbsp;lib32-libpanelw5&nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;oe-repo&nbsp; 11 k</div>
<div>&nbsp;lib32-libperl5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;5.24.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 762 k</div>
<div>&nbsp;lib32-libpython3.5m1.0 x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 oe-repo 797 k</div>
<div>&nbsp;lib32-libreadline7&nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;7.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; oe-repo 123 k</div>
<div>&nbsp;lib32-libsqlite3-0&nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;3:3.20.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;oe-repo 413 k</div>
<div>&nbsp;lib32-libssl1.0.2&nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;1.0.2n-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;oe-repo 155 k</div>
<div>&nbsp;lib32-libssp0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;7.3.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 9.9 k</div>
<div>&nbsp;lib32-libstdc&#43;&#43;6&nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;7.3.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 381 k</div>
<div>&nbsp;lib32-libtic5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;oe-repo&nbsp; 33 k</div>
<div>&nbsp;lib32-libticw5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;oe-repo&nbsp; 33 k</div>
<div>&nbsp;lib32-libtinfo5&nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;oe-repo&nbsp; 52 k</div>
<div>&nbsp;lib32-libxml2&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;2.9.4-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 560 k</div>
<div>&nbsp;lib32-libz1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1.2.11-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 51 k</div>
<div>&nbsp;lib32-m4&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x=
86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1.4.18-r0&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 104 k</div>
<div>&nbsp;lib32-make&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;4.2.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 98 k</div>
<div>&nbsp;lib32-ncurses&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;oe-repo&nbsp; 19 k</div>
<div>&nbsp;lib32-openssl&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;1.0.2n-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 212 k</div>
<div>&nbsp;lib32-openssl-conf&nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;1.0.2n-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;oe-repo 9.6 k</div>
<div>&nbsp;lib32-perl&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;5.24.1-r0&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 23 k</div>
<div>&nbsp;lib32-python3-codecs&nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; oe-repo 727 k</div>
<div>&nbsp;lib32-python3-core&nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; oe-repo 217 k</div>
<div>&nbsp;lib32-python3-crypt&nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; oe-repo&nbsp; 30 k</div>
<div>&nbsp;lib32-python3-importlib</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;3.5.3-r1.0&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 67 k<=
/div>
<div>&nbsp;lib32-python3-io&nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; oe-repo 187 k</div>
<div>&nbsp;lib32-python3-lang&nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; oe-repo 195 k</div>
<div>&nbsp;lib32-python3-math&nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; oe-repo&nbsp; 48 k</div>
<div>&nbsp;lib32-python3-re&nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; oe-repo&nbsp; 38 k</div>
<div>&nbsp;lib32-python3-reprlib&nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; oe-repo 7.6 k</div>
<div>&nbsp;lib32-sed&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; x86&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;4.2.2-r0&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 70 k</div>
<div>&nbsp;lib32-update-alternatives-opkg</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0.3.5-r0&nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 8.2 k<=
/div>
<div>&nbsp;lib32-xz&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x=
86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;5.2.3-r0&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 48 k</div>
<div>&nbsp;libacl1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; c=
ore2_64&nbsp; &nbsp; &nbsp; 2.2.52-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 19 k</div>
<div>&nbsp;libarchive&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_=
64&nbsp; &nbsp; &nbsp; 3.3.2-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; oe-repo 266 k</div>
<div>&nbsp;libassuan0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_=
64&nbsp; &nbsp; &nbsp; 2.4.3-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 36 k</div>
<div>&nbsp;libattr1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c=
ore2_64&nbsp; &nbsp; &nbsp; 2.4.47-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 13 k</div>
<div>&nbsp;libblkid1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_=
64&nbsp; &nbsp; &nbsp; 2.30-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 115 k</div>
<div>&nbsp;libbz2-1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c=
ore2_64&nbsp; &nbsp; &nbsp; 1.0.6-r5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 33 k</div>
<div>&nbsp;libc6&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; core2_64&nbsp; &nbsp; &nbsp; 2.26-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 1.4 M</div>
<div>&nbsp;libcap2&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; c=
ore2_64&nbsp; &nbsp; &nbsp; 2.25-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 14 k</div>
<div>&nbsp;libcom-err2&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nb=
sp; &nbsp; &nbsp; 1.43.5-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 11 k</div>
<div>&nbsp;libcomps0.1.8&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &=
nbsp; &nbsp; 0.1.8&#43;git0&#43;01a4759894-r0&nbsp; &nbsp; oe-repo&nbsp; 88=
 k</div>
<div>&nbsp;libcrypto1.0.2&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &=
nbsp; &nbsp; 1.0.2n-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;oe-repo 826 k</div>
<div>&nbsp;libcurl4&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c=
ore2_64&nbsp; &nbsp; &nbsp; 7.54.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 149 k</div>
<div>&nbsp;libdbus-1-3&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nb=
sp; &nbsp; &nbsp; 1.10.20-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; oe-repo 118 k</div>
<div>&nbsp;libdmc-error0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &=
nbsp; &nbsp; 1.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; oe-repo 205 k</div>
<div>&nbsp;libdnf1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; c=
ore2_64&nbsp; &nbsp; &nbsp; 0.9.3-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 126 k</div>
<div>&nbsp;libdw1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;core2_64&nbsp; &nbsp; &nbsp; 0.170-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 195 k</div>
<div>&nbsp;libe2p2&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; c=
ore2_64&nbsp; &nbsp; &nbsp; 1.43.5-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 18 k</div>
<div>&nbsp;libelf1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; c=
ore2_64&nbsp; &nbsp; &nbsp; 0.170-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 44 k</div>
<div>&nbsp;libexpat1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_=
64&nbsp; &nbsp; &nbsp; 2.2.3-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 64 k</div>
<div>&nbsp;libext2fs2&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_=
64&nbsp; &nbsp; &nbsp; 1.43.5-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;oe-repo 142 k</div>
<div>&nbsp;libfdisk1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_=
64&nbsp; &nbsp; &nbsp; 2.30-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 151 k</div>
<div>&nbsp;libffi6&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; c=
ore2_64&nbsp; &nbsp; &nbsp; 3.2.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 21 k</div>
<div>&nbsp;libgcc1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; c=
ore2_64&nbsp; &nbsp; &nbsp; 7.3.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 43 k</div>
<div>&nbsp;libgcrypt&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_=
64&nbsp; &nbsp; &nbsp; 1.8.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; oe-repo 383 k</div>
<div>&nbsp;libglib-2.0-0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &=
nbsp; &nbsp; 1:2.52.3-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;oe-repo 949 k</div>
<div>&nbsp;libgmp10&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c=
ore2_64&nbsp; &nbsp; &nbsp; 6.1.2-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 216 k</div>
<div>&nbsp;libgnutls30&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nb=
sp; &nbsp; &nbsp; 3.5.13-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;oe-repo 486 k</div>
<div>&nbsp;libgomp1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c=
ore2_64&nbsp; &nbsp; &nbsp; 7.3.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 76 k</div>
<div>&nbsp;libgpg-error0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &=
nbsp; &nbsp; 1.27-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 36 k</div>
<div>&nbsp;libidn11&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c=
ore2_64&nbsp; &nbsp; &nbsp; 1.33-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 45 k</div>
<div>&nbsp;libinotifytools0&nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp;=
 &nbsp; 3.14&#43;git0&#43;1df9af4d6c-r0&nbsp; &nbsp; &nbsp;oe-repo&nbsp; 19=
 k</div>
<div>&nbsp;libkmod2&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c=
ore2_64&nbsp; &nbsp; &nbsp; 24&#43;git0&#43;ef4257b59c-r0&nbsp; &nbsp; &nbs=
p; &nbsp;oe-repo&nbsp; 37 k</div>
<div>&nbsp;libksba8&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c=
ore2_64&nbsp; &nbsp; &nbsp; 1.3.5-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 88 k</div>
<div>&nbsp;liblzma5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c=
ore2_64&nbsp; &nbsp; &nbsp; 5.2.3-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 77 k</div>
<div>&nbsp;liblzo2-2&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_=
64&nbsp; &nbsp; &nbsp; 2.10-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 46 k</div>
<div>&nbsp;libmount1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_=
64&nbsp; &nbsp; &nbsp; 2.30-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 127 k</div>
<div>&nbsp;libncurses5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nb=
sp; &nbsp; &nbsp; 6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;oe-repo&nbsp; 64 k</div>
<div>&nbsp;libncursesw5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nb=
sp; &nbsp; &nbsp; 6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;oe-repo&nbsp; 83 k</div>
<div>&nbsp;libnpth0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c=
ore2_64&nbsp; &nbsp; &nbsp; 1.5-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 11 k</div>
<div>&nbsp;libpanel5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_=
64&nbsp; &nbsp; &nbsp; 6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;oe-repo&nbsp; 11 k</div>
<div>&nbsp;libpanelw5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_=
64&nbsp; &nbsp; &nbsp; 6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;oe-repo&nbsp; 11 k</div>
<div>&nbsp;libpcap1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c=
ore2_64&nbsp; &nbsp; &nbsp; 1.8.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 98 k</div>
<div>&nbsp;libpci3&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; c=
ore2_64&nbsp; &nbsp; &nbsp; 3.5.5-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 26 k</div>
<div>&nbsp;libpcre1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c=
ore2_64&nbsp; &nbsp; &nbsp; 8.41-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 90 k</div>
<div>&nbsp;libperl5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c=
ore2_64&nbsp; &nbsp; &nbsp; 5.24.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 713 k</div>
<div>&nbsp;libpopt0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c=
ore2_64&nbsp; &nbsp; &nbsp; 1.16-r3&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 27 k</div>
<div>&nbsp;libpython2.7-1.0&nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp;=
 &nbsp; 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;oe-repo 564 k</div>
<div>&nbsp;libpython3.5m1.0&nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp;=
 &nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; oe-repo 754 k</div>
<div>&nbsp;libreadline7&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nb=
sp; &nbsp; &nbsp; 7.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; oe-repo 119 k</div>
<div>&nbsp;librepo0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c=
ore2_64&nbsp; &nbsp; &nbsp; 1.7.20&#43;git0&#43;e1137cbbda-r0&nbsp; &nbsp;o=
e-repo&nbsp; 84 k</div>
<div>&nbsp;libsmartcols1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &=
nbsp; &nbsp; 2.30-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 75 k</div>
<div>&nbsp;libsolv0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c=
ore2_64&nbsp; &nbsp; &nbsp; 0.6.28-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 242 k</div>
<div>&nbsp;libsolvext0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nb=
sp; &nbsp; &nbsp; 0.6.28-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 65 k</div>
<div>&nbsp;libsqlite3-0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nb=
sp; &nbsp; &nbsp; 3:3.20.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;oe-repo 389 k</div>
<div>&nbsp;libssl1.0.2&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nb=
sp; &nbsp; &nbsp; 1.0.2n-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;oe-repo 144 k</div>
<div>&nbsp;libstdc&#43;&#43;6&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;core2_64&nbsp; &nbsp; &nbsp; 7.3.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 352 k</div>
<div>&nbsp;libtinfo5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_=
64&nbsp; &nbsp; &nbsp; 6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;oe-repo&nbsp; 53 k</div>
<div>&nbsp;libudev1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c=
ore2_64&nbsp; &nbsp; &nbsp; 3.2.2-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 62 k</div>
<div>&nbsp;libunistring2&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &=
nbsp; &nbsp; 0.9.7-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; oe-repo 368 k</div>
<div>&nbsp;libusb-1.0-0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nb=
sp; &nbsp; &nbsp; 1.0.21-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 44 k</div>
<div>&nbsp;libuuid1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c=
ore2_64&nbsp; &nbsp; &nbsp; 2.30-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 13 k</div>
<div>&nbsp;libwrap0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c=
ore2_64&nbsp; &nbsp; &nbsp; 7.6-r10&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 19 k</div>
<div>&nbsp;libx11-6&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c=
ore2_64&nbsp; &nbsp; &nbsp; 1:1.6.5-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; oe-repo 551 k</div>
<div>&nbsp;libxau6&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; c=
ore2_64&nbsp; &nbsp; &nbsp; 1:1.0.8-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 10 k</div>
<div>&nbsp;libxcb1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; c=
ore2_64&nbsp; &nbsp; &nbsp; 1.12-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 43 k</div>
<div>&nbsp;libxdmcp6&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_=
64&nbsp; &nbsp; &nbsp; 1:1.1.2-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; oe-repo&nbsp; 14 k</div>
<div>&nbsp;libz1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; core2_64&nbsp; &nbsp; &nbsp; 1.2.11-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 49 k</div>
<div>&nbsp;lighttpd-module-dirlisting</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 1.4.45-r0&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 15 k</div>
<div>&nbsp;lighttpd-module-indexfile</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 1.4.45-r0&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 9.4 k</div>
<div>&nbsp;lighttpd-module-staticfile</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 1.4.45-r0&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 9.1 k</div>
<div>&nbsp;modutils-initscripts&nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 1.=
0-r7&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; oe-repo 7.9 k</div>
<div>&nbsp;ncurses-terminfo&nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp;=
 &nbsp; 6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
oe-repo 446 k</div>
<div>&nbsp;ncurses-terminfo-base&nbsp; core2_64&nbsp; &nbsp; &nbsp; 6.0&#43=
;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 1=
3 k</div>
<div>&nbsp;netbase&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; c=
ore2_64&nbsp; &nbsp; &nbsp; 1:5.4-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 15 k</div>
<div>&nbsp;nettle&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;core2_64&nbsp; &nbsp; &nbsp; 3.3-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 232 k</div>
<div>&nbsp;nspr&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 4.16-r0&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 119 k</div>
<div>&nbsp;nss&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 3.31.1-r0&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 1.9 M</div>
<div>&nbsp;openssh-keygen&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &=
nbsp; &nbsp; 7.5p1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; oe-repo 147 k</div>
<div>&nbsp;openssh-scp&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nb=
sp; &nbsp; &nbsp; 7.5p1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; oe-repo&nbsp; 40 k</div>
<div>&nbsp;openssh-ssh&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nb=
sp; &nbsp; &nbsp; 7.5p1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; oe-repo 268 k</div>
<div>&nbsp;openssh-sshd&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nb=
sp; &nbsp; &nbsp; 7.5p1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; oe-repo 294 k</div>
<div>&nbsp;openssl&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; c=
ore2_64&nbsp; &nbsp; &nbsp; 1.0.2n-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 199 k</div>
<div>&nbsp;openssl-conf&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nb=
sp; &nbsp; &nbsp; 1.0.2n-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;oe-repo 9.6 k</div>
<div>&nbsp;pciutils-ids&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nb=
sp; &nbsp; &nbsp; 3.5.5-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; oe-repo 251 k</div>
<div>&nbsp;perl&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 5.24.1-r0&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 23 k</div>
<div>&nbsp;python-codecs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &=
nbsp; &nbsp; 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;oe-repo 644 k</div>
<div>&nbsp;python-contextlib&nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbs=
p; 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;oe-repo 8.8 k</div>
<div>&nbsp;python-core&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nb=
sp; &nbsp; &nbsp; 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;oe-repo 176 k</div>
<div>&nbsp;python-crypt&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nb=
sp; &nbsp; &nbsp; 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 20 k</div>
<div>&nbsp;python-ctypes&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &=
nbsp; &nbsp; 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;oe-repo 169 k</div>
<div>&nbsp;python-curses&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &=
nbsp; &nbsp; 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;oe-repo&nbsp; 40 k</div>
<div>&nbsp;python-datetime&nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp;=
 &nbsp; 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;oe-repo&nbsp; 61 k</div>
<div>&nbsp;python-io&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_=
64&nbsp; &nbsp; &nbsp; 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;oe-repo 187 k</div>
<div>&nbsp;python-lang&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nb=
sp; &nbsp; &nbsp; 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;oe-repo 165 k</div>
<div>&nbsp;python-logging&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &=
nbsp; &nbsp; 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;oe-repo&nbsp; 61 k</div>
<div>&nbsp;python-math&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nb=
sp; &nbsp; &nbsp; 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 62 k</div>
<div>&nbsp;python-mime&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nb=
sp; &nbsp; &nbsp; 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 36 k</div>
<div>&nbsp;python-netclient&nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp;=
 &nbsp; 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;oe-repo 198 k</div>
<div>&nbsp;python-pickle&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &=
nbsp; &nbsp; 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;oe-repo&nbsp; 81 k</div>
<div>&nbsp;python-pprint&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &=
nbsp; &nbsp; 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;oe-repo&nbsp; 12 k</div>
<div>&nbsp;python-re&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_=
64&nbsp; &nbsp; &nbsp; 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 36 k</div>
<div>&nbsp;python-shell&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nb=
sp; &nbsp; &nbsp; 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 37 k</div>
<div>&nbsp;python-stringold&nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp;=
 &nbsp; 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;oe-repo&nbsp; 28 k</div>
<div>&nbsp;python-textutils&nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp;=
 &nbsp; 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;oe-repo&nbsp; 56 k</div>
<div>&nbsp;python3-argparse&nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp;=
 &nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; oe-repo&nbsp; 44 k</div>
<div>&nbsp;python3-audio&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &=
nbsp; &nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; oe-repo&nbsp; 48 k</div>
<div>&nbsp;python3-codecs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &=
nbsp; &nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; oe-repo 730 k</div>
<div>&nbsp;python3-compression&nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 3.=
5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-r=
epo 106 k</div>
<div>&nbsp;python3-core&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nb=
sp; &nbsp; &nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; oe-repo 215 k</div>
<div>&nbsp;python3-crypt&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &=
nbsp; &nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; oe-repo&nbsp; 30 k</div>
<div>&nbsp;python3-curses&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &=
nbsp; &nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; oe-repo&nbsp; 43 k</div>
<div>&nbsp;python3-datetime&nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp;=
 &nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; oe-repo&nbsp; 87 k</div>
<div>&nbsp;python3-distutils&nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbs=
p; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 oe-repo 992 k</div>
<div>&nbsp;python3-email&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &=
nbsp; &nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; oe-repo 193 k</div>
<div>&nbsp;python3-enum&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nb=
sp; &nbsp; &nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; oe-repo&nbsp; 18 k</div>
<div>&nbsp;python3-fcntl&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &=
nbsp; &nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; oe-repo&nbsp; 12 k</div>
<div>&nbsp;python3-gpg&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nb=
sp; &nbsp; &nbsp; 1.9.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; oe-repo 187 k</div>
<div>&nbsp;python3-html&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nb=
sp; &nbsp; &nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; oe-repo&nbsp; 59 k</div>
<div>&nbsp;python3-image&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &=
nbsp; &nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; oe-repo&nbsp; 12 k</div>
<div>&nbsp;python3-importlib&nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbs=
p; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 oe-repo&nbsp; 67 k</div>
<div>&nbsp;python3-iniparse&nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp;=
 &nbsp; 0.4-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; oe-repo&nbsp; 28 k</div>
<div>&nbsp;python3-io&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_=
64&nbsp; &nbsp; &nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; oe-repo 184 k</div>
<div>&nbsp;python3-json&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nb=
sp; &nbsp; &nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; oe-repo&nbsp; 41 k</div>
<div>&nbsp;python3-lang&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nb=
sp; &nbsp; &nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; oe-repo 193 k</div>
<div>&nbsp;python3-logging&nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp;=
 &nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; oe-repo&nbsp; 75 k</div>
<div>&nbsp;python3-math&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nb=
sp; &nbsp; &nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; oe-repo&nbsp; 47 k</div>
<div>&nbsp;python3-mime&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nb=
sp; &nbsp; &nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; oe-repo&nbsp; 16 k</div>
<div>&nbsp;python3-misc&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nb=
sp; &nbsp; &nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; oe-repo 2.2 M</div>
<div>&nbsp;python3-netclient&nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbs=
p; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 oe-repo 268 k</div>
<div>&nbsp;python3-pickle&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &=
nbsp; &nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; oe-repo&nbsp; 72 k</div>
<div>&nbsp;python3-re&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_=
64&nbsp; &nbsp; &nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; oe-repo&nbsp; 38 k</div>
<div>&nbsp;python3-reprlib&nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp;=
 &nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; oe-repo 7.6 k</div>
<div>&nbsp;python3-rpm&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nb=
sp; &nbsp; &nbsp; 1:4.13.90&#43;git0&#43;a8e51b3bb0-r0</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; oe-repo&nbsp; 49 k</div>
<div>&nbsp;python3-selectors&nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbs=
p; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 oe-repo&nbsp; 15 k</div>
<div>&nbsp;python3-shell&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &=
nbsp; &nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; oe-repo&nbsp; 44 k</div>
<div>&nbsp;python3-signal&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &=
nbsp; &nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; oe-repo 8.3 k</div>
<div>&nbsp;python3-six&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nb=
sp; &nbsp; &nbsp; 1.10.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 22 k</div>
<div>&nbsp;python3-sqlite3&nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp;=
 &nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; oe-repo&nbsp; 35 k</div>
<div>&nbsp;python3-stringold&nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbs=
p; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 oe-repo&nbsp; 13 k</div>
<div>&nbsp;python3-subprocess&nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbs=
p; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 oe-repo&nbsp; 37 k</div>
<div>&nbsp;python3-textutils&nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbs=
p; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 oe-repo&nbsp; 62 k</div>
<div>&nbsp;python3-threading&nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbs=
p; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 oe-repo&nbsp; 38 k</div>
<div>&nbsp;python3-unixadmin&nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbs=
p; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 oe-repo&nbsp; 18 k</div>
<div>&nbsp;shadow-base&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nb=
sp; &nbsp; &nbsp; 4.2.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; oe-repo&nbsp; 54 k</div>
<div>&nbsp;shadow-securetty&nbsp; &nbsp; &nbsp; &nbsp;genericx86_64 4.2.1-r=
3&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-r=
epo 6.5 k</div>
<div>&nbsp;strace&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;core2_64&nbsp; &nbsp; &nbsp; 4.18-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 162 k</div>
<div>&nbsp;sysvinit&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c=
ore2_64&nbsp; &nbsp; &nbsp; 2.88dsf-r14&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 58 k</div>
<div>&nbsp;sysvinit-inittab&nbsp; &nbsp; &nbsp; &nbsp;genericx86_64 2.88dsf=
-r10&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 8=
.0 k</div>
<div>&nbsp;sysvinit-pidof&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &=
nbsp; &nbsp; 2.88dsf-r14&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;oe-repo&nbsp; 14 k</div>
<div>&nbsp;update-alternatives-opkg</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 0.3.5-r0&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 8.2 k</div>
<div>&nbsp;util-linux-losetup&nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbs=
p; 2.30-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;oe-repo&nbsp; 36 k</div>
<div>&nbsp;util-linux-lsblk&nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp;=
 &nbsp; 2.30-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;oe-repo&nbsp; 33 k</div>
<div>&nbsp;util-linux-sulogin&nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbs=
p; 2.30-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;oe-repo&nbsp; 23 k</div>
<div>&nbsp;util-linux-swaponoff&nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 2.=
30-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;oe-repo&nbsp; 27 k</div>
<div>&nbsp;util-linux-umount&nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbs=
p; 2.30-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;oe-repo&nbsp; 16 k</div>
<div>Installing weak dependencies:</div>
<div>&nbsp;busybox-syslog&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &=
nbsp; &nbsp; 1.24.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;oe-repo 9.2 k</div>
<div>&nbsp;busybox-udhcpc&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &=
nbsp; &nbsp; 1.24.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;oe-repo 7.7 k</div>
<div>&nbsp;ca-certificates&nbsp; &nbsp; &nbsp; &nbsp; noarch&nbsp; &nbsp; &=
nbsp; &nbsp; 20170717-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;oe-repo 155 k</div>
<div>&nbsp;dbus-1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;core2_64&nbsp; &nbsp; &nbsp; 1.10.20-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 124 k</div>
<div>&nbsp;eudev-hwdb&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_=
64&nbsp; &nbsp; &nbsp; 3.2.2-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; oe-repo 683 k</div>
<div>&nbsp;lib32-base-files-dev&nbsp; &nbsp;genericx86_64 3.0.14-r89&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 5.6 k</div>
<div>&nbsp;lib32-bash-dev&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;4.4-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 64 k</div>
<div>&nbsp;lib32-bc-dev&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1.06-r3&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 5.6 k</div>
<div>&nbsp;lib32-bzip2-dev&nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;1.0.6-r5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; oe-repo 8.3 k</div>
<div>&nbsp;lib32-cryptodev-linux-dev</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1.9-r0&nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 9=
.0 k</div>
<div>&nbsp;lib32-db-dev&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1:5.3.28-r1&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 41 k</div>
<div>&nbsp;lib32-diffutils-dev&nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;3.6-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; oe-repo 5.8 k</div>
<div>&nbsp;lib32-etherlab-dev&nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;1.5.2.5-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; oe-repo 5.6 k</div>
<div>&nbsp;lib32-flex-dev&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;2.6.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 9.0 k</div>
<div>&nbsp;lib32-gawk-dev&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;4.1.4-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 15 k</div>
<div>&nbsp;lib32-libc6-dev&nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;2.26-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 455 k</div>
<div>&nbsp;lib32-libffi-dev&nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;3.2.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 12 k</div>
<div>&nbsp;lib32-libgcc-s-dev&nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;7.3.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; oe-repo 2.8 M</div>
<div>&nbsp;lib32-libgdbm-dev&nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;1.13-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 11 k</div>
<div>&nbsp;lib32-libreadline-dev&nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;7.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; oe-repo&nbsp; 23 k</div>
<div>&nbsp;lib32-libsqlite3-dev&nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;3:3.20.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;oe-repo 116 k</div>
<div>&nbsp;lib32-libssp-dev&nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;7.3.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 11 k</div>
<div>&nbsp;lib32-libstdc&#43;&#43;-dev&nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;7.3.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; oe-repo 901 k</div>
<div>&nbsp;lib32-libxml2-dev&nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;2.9.4-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; oe-repo&nbsp; 78 k</div>
<div>&nbsp;lib32-libz-dev&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;1.2.11-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 33 k</div>
<div>&nbsp;lib32-linux-libc-headers-dev</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;4.12-r0&nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 9=
71 k</div>
<div>&nbsp;lib32-m4-dev&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1.4.18-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 5.8 k</div>
<div>&nbsp;lib32-make-dev&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;4.2.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 7.8 k</div>
<div>&nbsp;lib32-ncurses-dev&nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;oe-repo&nbsp; 65 k</div>
<div>&nbsp;lib32-ncurses-terminfo-base</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;6.0&#43;20170715-=
r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 13 k</div>
<div>&nbsp;lib32-openssl-dev&nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;1.0.2n-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;oe-repo 227 k</div>
<div>&nbsp;lib32-perl-dev&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;5.24.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 387 k</div>
<div>&nbsp;lib32-python3-dev&nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; oe-repo 143 k</div>
<div>&nbsp;lib32-python3-readline x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 oe-repo&nbsp; 20 k</div>
<div>&nbsp;lib32-sed-dev&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;4.2.2-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 5.6 k</div>
<div>&nbsp;lib32-xz-dev&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;5.2.3-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 41 k</div>
<div>&nbsp;libc6-thread-db&nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp;=
 &nbsp; 2.26-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;oe-repo&nbsp; 17 k</div>
<div>&nbsp;lighttpd-module-access core2_64&nbsp; &nbsp; &nbsp; 1.4.45-r0&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 9=
.1 k</div>
<div>&nbsp;lighttpd-module-accesslog</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 1.4.45-r0&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 14 k</div>
<div>&nbsp;pinentry&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c=
ore2_64&nbsp; &nbsp; &nbsp; 1.0.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 31 k</div>
<div>&nbsp;python-readline&nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp;=
 &nbsp; 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;oe-repo&nbsp; 17 k</div>
<div>&nbsp;python3-readline&nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp;=
 &nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; oe-repo&nbsp; 19 k</div>
<div>&nbsp;shared-mime-info&nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp;=
 &nbsp; 1.8-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; oe-repo 362 k</div>
<div>&nbsp;update-rc.d&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; noarch&nbsp=
; &nbsp; &nbsp; &nbsp; 0.7-r5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 8.0 k</div>
<div>&nbsp;util-linux-cfdisk&nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbs=
p; 2.30-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;oe-repo&nbsp; 38 k</div>
<div>&nbsp;util-linux-fdisk&nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp;=
 &nbsp; 2.30-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;oe-repo&nbsp; 47 k</div>
<div>&nbsp;util-linux-ionice&nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbs=
p; 2.30-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;oe-repo&nbsp; 15 k</div>
<div>&nbsp;util-linux-mkfs&nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp;=
 &nbsp; 2.30-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;oe-repo 9.7 k</div>
<div>&nbsp;util-linux-mount&nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp;=
 &nbsp; 2.30-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;oe-repo&nbsp; 18 k</div>
<div>&nbsp;util-linux-mountpoint&nbsp; core2_64&nbsp; &nbsp; &nbsp; 2.30-r0=
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;oe-repo&nbsp; 11 k</div>
<div>&nbsp;util-linux-prlimit&nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbs=
p; 2.30-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;oe-repo&nbsp; 17 k</div>
<div>&nbsp;util-linux-readprofile core2_64&nbsp; &nbsp; &nbsp; 2.30-r0&nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-r=
epo&nbsp; 12 k</div>
<div>&nbsp;util-linux-sfdisk&nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbs=
p; 2.30-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;oe-repo&nbsp; 43 k</div>
<div>&nbsp;util-linux-switch-root core2_64&nbsp; &nbsp; &nbsp; 2.30-r0&nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-r=
epo&nbsp; 10 k</div>
<div><br>
</div>
<div>Transaction Summary</div>
<div>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D</div>
<div>Install&nbsp; 342 Packages</div>
<div><br>
</div>
<div>Total size: 67 M</div>
<div>Installed size: 218 M</div>
<div>Downloading Packages:</div>
<div>Running transaction check</div>
<div>Transaction check succeeded.</div>
<div>Running transaction test</div>
<div>Error: Transaction check error:</div>
<div>&nbsp; file /usr/bin/python3.5m-config conflicts between attempted ins=
talls of lib32-python3-core-3.5.3-r1.0.x86 and python3-core-3.5.3-r1.0.core=
2_64</div>
<div><br>
</div>
<div>Error Summary</div>
<div>-------------</div>
<div><br>
</div>
<div><br>
</div>
<div>ERROR: core-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs=
</div>
<div>ERROR: Logfile of failure stored in: /opt/poky/build/tmp/work/genericx=
86_64-poky-linux/core-image-minimal/1.0-r0/temp/log.do_rootfs.28954</div>
<div>ERROR: Task (/opt/poky/meta/recipes-core/images/core-image-minimal.bb:=
do_rootfs) failed with exit code '1'</div>
<div>NOTE: Tasks Summary: Attempted 3898 tasks of which 3836 didn't need to=
 be rerun and 1 failed.</div>
<div><br>
</div>
<div>Summary: 1 task failed:</div>
<div>&nbsp; /opt/poky/meta/recipes-core/images/core-image-minimal.bb:do_roo=
tfs</div>
<div>Summary: There were 2 ERROR messages shown, returning a non-zero exit =
code.</div>
<br>
</div>
<div><br>
</div>
<div><br>
</div>
<div>I understand that there's a conflict regarding the installation of&nbs=
p;<span>/usr/bin/python3.5m-config between python3 and lib32-python3, but I=
 have no idea how to solve it.</span></div>
<div><span><br>
</span></div>
<div><span>Any pointers?</span></div>
<div><span><br>
</span></div>
<div><span>Thanks a lot,</span></div>
<div><span><br>
</span></div>
<div><span>Nir.</span></div>
<div><br>
</div>
<br>
<p></p>
</div>
</body>
</html>

--_000_VI1PR0701MB2814121932475233E7F689C890AD0VI1PR0701MB2814_--
