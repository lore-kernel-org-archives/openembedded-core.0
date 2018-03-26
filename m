Return-Path: <nir.geller@servotronix.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0134.outbound.protection.outlook.com [104.47.2.134])
	by mail.openembedded.org (Postfix) with ESMTP id BF08578558
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 12:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=servotronix1008982.onmicrosoft.com; s=selector1-servotronix-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=jBmNND0ZGykP0uQW0U4zPIPJrLAzNwfbNKHz29d0TAo=;
	b=GGavV61UQpPybVHBzNy6Tnkiv1SStmDKkRQ8+Ya8K9+aiBP0NdGixFP0kkfKi3n+aXDBnac2XiwqBntSi5QnlENPLJmUmPkxzPYSK+BI4KweTggIOaYOoNTxj34yhkfoGt+T/A72SiEmHK5gvslYygRKYuPRIWfAutQI3ARKh9I=
Received: from VI1PR0701MB2814.eurprd07.prod.outlook.com (10.173.71.22) by
	VI1PR0701MB1901.eurprd07.prod.outlook.com (10.167.197.25) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.631.5; Mon, 26 Mar 2018 12:13:40 +0000
Received: from VI1PR0701MB2814.eurprd07.prod.outlook.com
	([fe80::5d0:8b2a:d1a3:ca51]) by
	VI1PR0701MB2814.eurprd07.prod.outlook.com
	([fe80::5d0:8b2a:d1a3:ca51%3]) with mapi id 15.20.0631.009;
	Mon, 26 Mar 2018 12:13:40 +0000
From: "Geller, Nir" <nir.geller@servotronix.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: multilib - python3 vs. lib32-python3  -  bitbake
	core-image-minimal fails
Thread-Index: AQHTxPusjCiQSAw0S0ec66GizdSgzg==
Date: Mon, 26 Mar 2018 12:13:40 +0000
Message-ID: <VI1PR0701MB2814A5F3C7A991BC9861668990AD0@VI1PR0701MB2814.eurprd07.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [79.181.62.184]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR0701MB1901;
	7:F+AO6DgCn2d0SXUynWlSQn3YDT8nLXOVDA4/P8oXnzvJtAOui+SHGW57yoAwIGvrqfYw85HsPqOCNZffXMccdGHFxvgKS1MGWzuuVAfA77ARLxF1ycdJR0HVHeSf/lm5nqUtfZa4jZlIod2veE26RNHj3Q0xR15pjmEpgG17xNtZh52sxi42zzNsyZeQB5LsBSmbVWneFVaPoMTlPFPg5bgJRq+jjHrvOQY/o+w+2hq+eHvLnbwXdusq8QSX1jfu
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 5ab495c5-f792-48af-e850-08d5931302eb
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(7021125)(5600026)(4604075)(3008032)(4534165)(7022125)(4603075)(4627221)(201702281549075)(7048125)(7024125)(7027125)(7028125)(7023125)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR0701MB1901; 
x-ms-traffictypediagnostic: VI1PR0701MB1901:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=nir.geller@servotronix.com; 
x-microsoft-antispam-prvs: <VI1PR0701MB1901727AD6DE22D67676604490AD0@VI1PR0701MB1901.eurprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(21748063052155);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3002001)(10201501046)(3231221)(944501327)(52105095)(6041310)(20161123560045)(20161123558120)(20161123564045)(2016111802025)(20161123562045)(6043046)(6072148)(201708071742011);
	SRVR:VI1PR0701MB1901; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR0701MB1901; 
x-forefront-prvs: 06237E4555
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39850400004)(396003)(39380400002)(376002)(366004)(346002)(189003)(199004)(106356001)(575784001)(81156014)(81166006)(6116002)(86362001)(2906002)(33656002)(5660300001)(105586002)(74316002)(3660700001)(3280700002)(7736002)(6916009)(53946003)(55016002)(5640700003)(551934003)(6436002)(2351001)(5250100002)(3846002)(66066001)(16200700003)(6306002)(54896002)(9686003)(2900100001)(8676002)(2501003)(97736004)(186003)(6506007)(102836004)(14454004)(26005)(316002)(551544002)(99286004)(478600001)(59450400001)(53936002)(8936002)(9326002)(25786009)(68736007)(7696005)(579004)(559001)(569006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0701MB1901;
	H:VI1PR0701MB2814.eurprd07.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: servotronix.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: MSr02UiYIvLKq6SvOkGGWIg0xWsr9amJ9PF5XdPz48DeScBywBHhl6jqiJfs3pRvVR9OegHruUtiIBo7NXUhBTndyHLSDzbpSVHGXDSD89G4rYYZGxFSE6lxQq85aDsdQH8yLGqC+WJvhuaVJXq93nT1IE3OYwdnxr6ame6PIfxLCMAaJatSxvc22Fz5KfJAFl0YOtyQuo+eyjFSt4ZLJ623SmqlvPXMinsCJodY0eoAYhKO7S0K5NwdaVnOOo+xLypHtSnIzjltKBi2uwa1xeh0N/buzzKH7rD/VeTsAWoF06GyHIt0agfgSUc6kaQkYkUkNGFsK0x671hGOSBwGQ==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: servotronix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ab495c5-f792-48af-e850-08d5931302eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2018 12:13:40.4528 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c4bfc7d-fde6-4201-a2d6-2a396cc790f7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB1901
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
X-List-Received-Date: Mon, 26 Mar 2018 12:47:06 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_VI1PR0701MB2814A5F3C7A991BC9861668990AD0VI1PR0701MB2814_"

--_000_VI1PR0701MB2814A5F3C7A991BC9861668990AD0VI1PR0701MB2814_
Content-Type: text/plain; charset="us-ascii"
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


--_000_VI1PR0701MB2814A5F3C7A991BC9861668990AD0VI1PR0701MB2814_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p><span style=3D"font-size:12.0pt;color:black">Hello,<o:p></o:p></span></p=
>
<p><span style=3D"font-size:12.0pt;color:black"><o:p>&nbsp;</o:p></span></p=
>
<p><span style=3D"font-size:12.0pt;color:black">I'm trying to build the lat=
est Yocto project for a x86-64 machine, and add a few packages that are bui=
lt with 32 bit configuration using the multilib mechanism.<o:p></o:p></span=
></p>
<p><span style=3D"font-size:12.0pt;color:black"><o:p>&nbsp;</o:p></span></p=
>
<p><span style=3D"font-size:12.0pt;color:black">I pulled rocko 2.4.2 and se=
t up my local.conf:<o:p></o:p></span></p>
<p><span style=3D"font-size:12.0pt;color:black"><o:p>&nbsp;</o:p></span></p=
>
<p><span style=3D"font-size:12.0pt;color:black"><o:p>&nbsp;</o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"># This =
sets the default machine to be qemux86 if no other machine is selected:<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">MACHINE=
 ??=3D &quot;genericx86-64&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"># Enabl=
e multilib to allow 32 bit build of some&nbsp;packages<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">require=
 conf/multilib.conf<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">MULTILI=
BS =3D &quot;multilib:lib32&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">DEFAULT=
TUNE_virtclass-multilib-lib32 =3D &quot;x86&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">When I =
bitbake core-image-minimal all the packages are built successfully, but&nbs=
p;core-image-minimal.bb:do_rootfs fails and<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">I get t=
he following error:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">/opt/po=
ky/build$ bitbake core-image-minimal<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Loading=
 cache: 100% |#############################################################=
###########################################################################=
################################| Time:
 0:00:02<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Loaded =
4608 entries from dependency cache.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Parsing=
 recipes: 100% |###########################################################=
###########################################################################=
################################| Time:
 0:00:04<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Parsing=
 of 1914 .bb files complete (1909 cached, 5 parsed). 4617 targets, 240 skip=
ped, 0 masked, 0 errors.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">NOTE: R=
esolving any missing task queue dependencies<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Build C=
onfiguration:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">BB_VERS=
ION&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D &quot;1.36.0&quot;<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">BUILD_S=
YS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D &quot;x86_64-linux&quot;<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">NATIVEL=
SBSTRING&nbsp; &nbsp; &nbsp; =3D &quot;universal&quot;<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">TARGET_=
SYS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D &quot;x86_64-poky-linux&quo=
t;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">MACHINE=
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D &quot;genericx86-64&qu=
ot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">DISTRO&=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D &quot;poky&quot;<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">DISTRO_=
VERSION&nbsp; &nbsp; &nbsp; &nbsp;=3D &quot;2.4.2&quot;<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">TUNE_FE=
ATURES&nbsp; &nbsp; &nbsp; &nbsp; =3D &quot;m64 core2&quot;<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">TARGET_=
FPU&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D &quot;&quot;<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">meta&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">meta-po=
ky&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">meta-yo=
cto-bsp&nbsp; &nbsp; &nbsp; &nbsp;=3D &quot;stx-rocko:26de16bef191f5122e26c=
84f2596ea49c0bd8b1a&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">meta-oe=
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">meta-py=
thon&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">meta-ne=
tworking&nbsp; &nbsp; &nbsp; =3D &quot;rocko:dacfa2b1920e285531bec55cd2f087=
43390aaf57&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">meta-st=
x-mc&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D &quot;stx-rocko:26de16bef191f512=
2e26c84f2596ea49c0bd8b1a&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Initial=
ising tasks: 100% |########################################################=
###########################################################################=
################################| Time:
 0:00:10<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">NOTE: E=
xecuting SetScene Tasks<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">NOTE: E=
xecuting RunQueue Tasks<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">ERROR: =
core-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. Command '/opt/po=
ky/build/tmp/work/genericx86_64-poky-linux/core-image-minimal/1.0-r0/recipe=
-sysroot-native/usr/bin/dnf -y -c /opt/poky/build/tmp/work/genericx86_64-po=
ky-linux/core-image-minimal/1.0-r0/rootfs/etc/dnf/dnf.conf
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
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Added o=
e-repo repo from /opt/poky/build/tmp/work/genericx86_64-poky-linux/core-ima=
ge-minimal/1.0-r0/oe-rootfs-repo<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Last me=
tadata expiration check: 0:00:01 ago on Mon 26 Mar 2018 11:57:38 AM UTC.<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Depende=
ncies resolved.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;P=
ackage&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Arch&nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; Version&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Repository<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Size<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Install=
ing:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;a=
top&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cor=
e2_64&nbsp; &nbsp; &nbsp; 2.2.3-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 79 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;b=
ase-passwd&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &=
nbsp; 3.5.29-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;oe-repo 6.8 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;b=
ash&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cor=
e2_64&nbsp; &nbsp; &nbsp; 4.4-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 426 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;c=
an-utils&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nb=
sp; &nbsp; 0.0&#43;gitr0&#43;4c8fb05cb4-r0&nbsp; &nbsp; &nbsp;oe-repo&nbsp;=
 81 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;c=
oreutils&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nb=
sp; &nbsp; 8.27-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;oe-repo 846 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;c=
ronie&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64=
&nbsp; &nbsp; &nbsp; 1.5.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 44 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;d=
hcp-client&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &=
nbsp; 4.3.6-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; oe-repo 160 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;d=
nf&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; cor=
e2_64&nbsp; &nbsp; &nbsp; 2.6.3-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 163 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;e=
2fsprogs-e2fsck&nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 1.43=
.5-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o=
e-repo 116 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;e=
therlab&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp=
; &nbsp; &nbsp; 1.5.2.5-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; oe-repo 149 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;e=
thtool&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp=
; &nbsp; &nbsp; 4.11-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 89 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;f=
ile&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cor=
e2_64&nbsp; &nbsp; &nbsp; 5.31-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 241 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;g=
nupg&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64=
&nbsp; &nbsp; &nbsp; 2.2.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; oe-repo 1.1 M<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;h=
top&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cor=
e2_64&nbsp; &nbsp; &nbsp; 1.0.3-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 61 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;i=
notify-tools&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp;=
 3.14&#43;git0&#43;1df9af4d6c-r0&nbsp; &nbsp; &nbsp;oe-repo&nbsp; 20 k<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;i=
otop&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64=
&nbsp; &nbsp; &nbsp; 0.6-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 38 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;i=
proute2&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp=
; &nbsp; &nbsp; 4.11.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;oe-repo 199 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;k=
ernel-module-can-3.18.48-rt54-yocto-standard<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; genericx86_64 3.18.48&#43;git0&#43;00ca696e63-r0&nbsp; oe-repo&nbsp; 15 k=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;k=
ernel-module-can-dev-3.18.48-rt54-yocto-standard<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; genericx86_64 3.18.48&#43;git0&#43;00ca696e63-r0&nbsp; oe-repo&nbsp; 13 k=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;k=
ernel-module-can-raw-3.18.48-rt54-yocto-standard<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; genericx86_64 3.18.48&#43;git0&#43;00ca696e63-r0&nbsp; oe-repo&nbsp; 12 k=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;k=
ernel-module-ec-master-3.18.48-rt54-yocto-standard<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; genericx86_64 3.18.48&#43;git0&#43;00ca696e63-r0&nbsp; oe-repo 107 k<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;k=
ernel-module-ecatmc-3.18.48-rt54-yocto-standard<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; genericx86_64 3.18.48&#43;git0&#43;00ca696e63-r0&nbsp; oe-repo&nbsp; 14 k=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;k=
ernel-module-igb-3.18.48-rt54-yocto-standard<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; genericx86_64 3.18.48&#43;git0&#43;00ca696e63-r0&nbsp; oe-repo&nbsp; 71 k=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;k=
ernel-module-peak-pci-3.18.48-rt54-yocto-standard<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; genericx86_64 3.18.48&#43;git0&#43;00ca696e63-r0&nbsp; oe-repo&nbsp; 10 k=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;k=
ernel-module-r8169-3.18.48-rt54-yocto-standard<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; genericx86_64 3.18.48&#43;git0&#43;00ca696e63-r0&nbsp; oe-repo&nbsp; 36 k=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;k=
ernel-module-sja1000-3.18.48-rt54-yocto-standard<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; genericx86_64 3.18.48&#43;git0&#43;00ca696e63-r0&nbsp; oe-repo&nbsp; 12 k=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
dd&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; cor=
e2_64&nbsp; &nbsp; &nbsp; 2.26-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 8.3 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-stx-mc-dev&nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;multibus&#43;git0&#43;1827c3da42-r0 oe-repo 6.3 k<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-stx-mc&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;multibus&#43;git0&#43;1827c3da42-r0 oe-repo 9.7 M<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibxml2&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp=
; &nbsp; &nbsp; 2.9.4-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; oe-repo 525 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ighttpd&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp=
; &nbsp; &nbsp; 1.4.45-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;oe-repo 107 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
sof&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cor=
e2_64&nbsp; &nbsp; &nbsp; 4.89-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 71 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;m=
c-console&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nb=
sp; &nbsp; HEAD&#43;git0&#43;98047e1427-r1&nbsp; &nbsp; &nbsp;oe-repo&nbsp;=
 14 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;n=
ano&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cor=
e2_64&nbsp; &nbsp; &nbsp; 2.7.4-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 114 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;o=
penssh&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp=
; &nbsp; &nbsp; 7.5p1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; oe-repo 5.7 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ackagegroup-core-boot genericx86_64 1.0-r17&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 5.5 k<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ackagegroup-core-tools-debug<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; noarch&nbsp; &nbsp; &nbsp; &nbsp; 1.0-r3&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 5.4 k<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ciutils&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp=
; &nbsp; &nbsp; 3.5.5-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; oe-repo&nbsp; 43 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
rocps&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64=
&nbsp; &nbsp; &nbsp; 3.3.12-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;oe-repo 162 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;r=
c-once&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp=
; &nbsp; &nbsp; HEAD&#43;git0&#43;98047e1427-r1&nbsp; &nbsp; &nbsp;oe-repo =
8.2 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;r=
pm&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; cor=
e2_64&nbsp; &nbsp; &nbsp; 1:4.13.90&#43;git0&#43;a8e51b3bb0-r0<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; o=
e-repo 407 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;r=
un-postinsts&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; noarch&nbsp; &nbsp; &nbsp; &=
nbsp; 1.0-r9&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; oe-repo 8.3 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;s=
hadow&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64=
&nbsp; &nbsp; &nbsp; 4.2.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; oe-repo 212 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;s=
tx-corepattern&nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp; HEAD=
&#43;git0&#43;8c76eeee8a-r0&nbsp; &nbsp; &nbsp;oe-repo 8.1 k<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;s=
udo&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cor=
e2_64&nbsp; &nbsp; &nbsp; 1.8.20p2-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;oe-repo 458 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;t=
cpdump&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp=
; &nbsp; &nbsp; 4.9.2-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; oe-repo 317 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;u=
dev-extraconf&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp;=
 1.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; oe-repo 9.4 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;u=
sbutils&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp=
; &nbsp; &nbsp; 008-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 61 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;u=
seradd-mc&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nb=
sp; &nbsp; 1.0-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; oe-repo&nbsp; 11 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;u=
til-linux&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nb=
sp; &nbsp; 2.30-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;oe-repo 361 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;u=
til-linux-fsck&nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 2.30=
-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;oe-repo&nbsp; 25 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;v=
sftpd&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64=
&nbsp; &nbsp; &nbsp; 3.0.3-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 67 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Install=
ing dependencies:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;b=
ase-files&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;genericx86_64 3.0.=
14-r89&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-rep=
o&nbsp; 12 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;b=
ind&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cor=
e2_64&nbsp; &nbsp; &nbsp; 9.10.5&#43;P3-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; oe-repo 1.3 M<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;b=
usybox&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp=
; &nbsp; &nbsp; 1.24.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;oe-repo 311 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;b=
usybox-hwclock&nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 1.24=
.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o=
e-repo 8.6 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;d=
b&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;core2_64&nbsp; &nbsp; &nbsp; 1:5.3.28-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 461 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;d=
hcp-libs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nb=
sp; &nbsp; 4.3.6-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; oe-repo&nbsp; 55 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;e=
udev&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64=
&nbsp; &nbsp; &nbsp; 3.2.2-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; oe-repo 221 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;g=
db&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; cor=
e2_64&nbsp; &nbsp; &nbsp; 8.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 1.9 M<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;g=
dbserver&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nb=
sp; &nbsp; 8.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; oe-repo 150 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;g=
libc-mtrace&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &=
nbsp; 2.26-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;oe-repo 8.2 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;g=
pgme&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64=
&nbsp; &nbsp; &nbsp; 1.9.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; oe-repo 130 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;i=
nit-ifupdown&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp;=
 1.0-r7&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; oe-repo 9.4 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;i=
nitscripts&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &=
nbsp; 1.0-r155&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; oe-repo&nbsp; 21 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;i=
nitscripts-functions&nbsp; core2_64&nbsp; &nbsp; &nbsp; 1.0-r155&nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 7.3 k<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;k=
bd&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; cor=
e2_64&nbsp; &nbsp; &nbsp; 2.0.4-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 108 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;k=
ernel-3.18.48-rt54-yocto-standard<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; genericx86_64 3.18.48&#43;git0&#43;00ca696e63-r0&nbsp; oe-repo 8.4 k<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;k=
ernel-image-3.18.48-rt54-yocto-standard<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; genericx86_64 3.18.48&#43;git0&#43;00ca696e63-r0&nbsp; oe-repo 5.5 k<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;k=
ernel-image-bzimage-3.18.48-rt54-yocto-standard<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; genericx86_64 3.18.48&#43;git0&#43;00ca696e63-r0&nbsp; oe-repo 4.0 M<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;k=
ernel-module-mii-3.18.48-rt54-yocto-standard<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; genericx86_64 3.18.48&#43;git0&#43;00ca696e63-r0&nbsp; oe-repo&nbsp; 10 k=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;k=
ernel-module-pps-core-3.18.48-rt54-yocto-standard<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; genericx86_64 3.18.48&#43;git0&#43;00ca696e63-r0&nbsp; oe-repo&nbsp; 12 k=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;k=
ernel-module-ptp-3.18.48-rt54-yocto-standard<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; genericx86_64 3.18.48&#43;git0&#43;00ca696e63-r0&nbsp; oe-repo&nbsp; 14 k=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;k=
eymaps&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; genericx86_64=
 1.0-r31&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;oe-repo 7.4 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-base-files&nbsp; &nbsp; &nbsp; &nbsp;genericx86_64 3.0.14-r89&nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 12 k<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-bash&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;4.4-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 436 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-bc&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;1.06-r3&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 48 k<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-bzip2&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;1.0.6-r5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 26 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-cryptodev-linux&nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1.9-=
r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; oe-repo 5.4 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-db&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;1:5.3.28-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 501 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-diffutils&nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;3.6-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; oe-repo 135 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-etherlab&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;1.5.2.5-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; oe-repo 147 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-flex&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;2.6.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 105 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-gawk&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;4.1.4-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 295 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libbz2-1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;1.0.6-r5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; oe-repo&nbsp; 33 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libc6&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;2.26-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 1.3 M<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libc6-extra-nss&nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2.26=
-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;oe-repo&nbsp; 52 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libc6-thread-db&nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2.26=
-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;oe-repo&nbsp; 17 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libcidn1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;2.26-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 40 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libcrypto1.0.2&nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;1.0.2n-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;oe-repo 665 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libffi6&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;3.2.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; oe-repo&nbsp; 20 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libform5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;oe-repo&nbsp; 30 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libformw5&nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;oe-repo&nbsp; 34 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libgcc1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;7.3.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; oe-repo&nbsp; 50 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libgdbm-compat4&nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1.13=
-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;oe-repo&nbsp; 11 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libgdbm4&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;1.13-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 31 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-liblzma5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;5.2.3-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; oe-repo&nbsp; 83 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libmenu5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;oe-repo&nbsp; 20 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libmenuw5&nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;oe-repo&nbsp; 20 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libncurses5&nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe=
-repo&nbsp; 68 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libncursesw5&nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe=
-repo&nbsp; 89 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libpanel5&nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;oe-repo&nbsp; 11 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libpanelw5&nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;oe-repo&nbsp; 11 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libperl5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;5.24.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;oe-repo 762 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libpython3.5m1.0 x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;3.5.3-r1.=
0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 797=
 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libreadline7&nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;7.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; oe-repo 123 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libsqlite3-0&nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;3:3.20.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;oe-repo 413 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libssl1.0.2&nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;1.0.2n-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;oe-repo 155 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libssp0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;7.3.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; oe-repo 9.9 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libstdc&#43;&#43;6&nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;7.3.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; oe-repo 381 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libtic5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;oe-repo&nbsp; 33 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libticw5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;oe-repo&nbsp; 33 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libtinfo5&nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;oe-repo&nbsp; 52 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libxml2&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;2.9.4-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; oe-repo 560 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libz1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;1.2.11-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 51 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-m4&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;1.4.18-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 104 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-make&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;4.2.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 98 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-ncurses&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;oe-repo&nbsp; 19 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-openssl&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;1.0.2n-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;oe-repo 212 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-openssl-conf&nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;1.0.2n-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;oe-repo 9.6 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-perl&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;5.24.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 23 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-python3-codecs&nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; o=
e-repo 727 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-python3-core&nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; oe-repo 217 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-python3-crypt&nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; o=
e-repo&nbsp; 30 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-python3-importlib<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;3.5.3-r1.0&nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 67 k<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-python3-io&nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; oe-repo 187 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-python3-lang&nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; oe-repo 195 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-python3-math&nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; oe-repo&nbsp; 48 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-python3-re&nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; oe-repo&nbsp; 38 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-python3-reprlib&nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;3.5.=
3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-rep=
o 7.6 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-sed&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;4.2.2-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 70 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-update-alternatives-opkg<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0.3.5-r0&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 8.2 k<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-xz&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;5.2.3-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 48 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibacl1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp=
; &nbsp; &nbsp; 2.2.52-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;oe-repo&nbsp; 19 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibarchive&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nb=
sp; &nbsp; 3.3.2-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; oe-repo 266 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibassuan0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nb=
sp; &nbsp; 2.4.3-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; oe-repo&nbsp; 36 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibattr1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp=
; &nbsp; &nbsp; 2.4.47-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;oe-repo&nbsp; 13 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibblkid1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nb=
sp; &nbsp; 2.30-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;oe-repo 115 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibbz2-1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp=
; &nbsp; &nbsp; 1.0.6-r5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; oe-repo&nbsp; 33 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibc6&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64=
&nbsp; &nbsp; &nbsp; 2.26-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 1.4 M<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibcap2&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp=
; &nbsp; &nbsp; 2.25-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 14 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibcom-err2&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &=
nbsp; 1.43.5-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;oe-repo&nbsp; 11 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibcomps0.1.8&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp;=
 0.1.8&#43;git0&#43;01a4759894-r0&nbsp; &nbsp; oe-repo&nbsp; 88 k<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibcrypto1.0.2&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp;=
 1.0.2n-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;oe-repo 826 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibcurl4&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp=
; &nbsp; &nbsp; 7.54.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;oe-repo 149 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibdbus-1-3&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &=
nbsp; 1.10.20-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; oe-repo 118 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibdmc-error0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp;=
 1.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; oe-repo 205 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibdnf1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp=
; &nbsp; &nbsp; 0.9.3-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; oe-repo 126 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibdw1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64=
&nbsp; &nbsp; &nbsp; 0.170-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; oe-repo 195 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibe2p2&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp=
; &nbsp; &nbsp; 1.43.5-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;oe-repo&nbsp; 18 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibelf1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp=
; &nbsp; &nbsp; 0.170-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; oe-repo&nbsp; 44 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibexpat1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nb=
sp; &nbsp; 2.2.3-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; oe-repo&nbsp; 64 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibext2fs2&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nb=
sp; &nbsp; 1.43.5-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;oe-repo 142 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibfdisk1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nb=
sp; &nbsp; 2.30-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;oe-repo 151 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibffi6&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp=
; &nbsp; &nbsp; 3.2.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; oe-repo&nbsp; 21 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibgcc1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp=
; &nbsp; &nbsp; 7.3.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; oe-repo&nbsp; 43 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibgcrypt&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nb=
sp; &nbsp; 1.8.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; oe-repo 383 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibglib-2.0-0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp;=
 1:2.52.3-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o=
e-repo 949 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibgmp10&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp=
; &nbsp; &nbsp; 6.1.2-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; oe-repo 216 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibgnutls30&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &=
nbsp; 3.5.13-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;oe-repo 486 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibgomp1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp=
; &nbsp; &nbsp; 7.3.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; oe-repo&nbsp; 76 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibgpg-error0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp;=
 1.27-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;oe-repo&nbsp; 36 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibidn11&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp=
; &nbsp; &nbsp; 1.33-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 45 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibinotifytools0&nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 3.14=
&#43;git0&#43;1df9af4d6c-r0&nbsp; &nbsp; &nbsp;oe-repo&nbsp; 19 k<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibkmod2&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp=
; &nbsp; &nbsp; 24&#43;git0&#43;ef4257b59c-r0&nbsp; &nbsp; &nbsp; &nbsp;oe-=
repo&nbsp; 37 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibksba8&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp=
; &nbsp; &nbsp; 1.3.5-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; oe-repo&nbsp; 88 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
iblzma5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp=
; &nbsp; &nbsp; 5.2.3-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; oe-repo&nbsp; 77 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
iblzo2-2&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nb=
sp; &nbsp; 2.10-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;oe-repo&nbsp; 46 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibmount1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nb=
sp; &nbsp; 2.30-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;oe-repo 127 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibncurses5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &=
nbsp; 6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe=
-repo&nbsp; 64 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibncursesw5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &=
nbsp; 6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe=
-repo&nbsp; 83 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibnpth0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp=
; &nbsp; &nbsp; 1.5-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 11 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibpanel5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nb=
sp; &nbsp; 6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;oe-repo&nbsp; 11 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibpanelw5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nb=
sp; &nbsp; 6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;oe-repo&nbsp; 11 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibpcap1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp=
; &nbsp; &nbsp; 1.8.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; oe-repo&nbsp; 98 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibpci3&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp=
; &nbsp; &nbsp; 3.5.5-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; oe-repo&nbsp; 26 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibpcre1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp=
; &nbsp; &nbsp; 8.41-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 90 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibperl5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp=
; &nbsp; &nbsp; 5.24.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;oe-repo 713 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibpopt0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp=
; &nbsp; &nbsp; 1.16-r3&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 27 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibpython2.7-1.0&nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 2.7.=
13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o=
e-repo 564 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibpython3.5m1.0&nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 3.5.=
3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-rep=
o 754 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibreadline7&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &=
nbsp; 7.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; oe-repo 119 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibrepo0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp=
; &nbsp; &nbsp; 1.7.20&#43;git0&#43;e1137cbbda-r0&nbsp; &nbsp;oe-repo&nbsp;=
 84 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibsmartcols1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp;=
 2.30-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;oe-repo&nbsp; 75 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibsolv0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp=
; &nbsp; &nbsp; 0.6.28-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;oe-repo 242 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibsolvext0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &=
nbsp; 0.6.28-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;oe-repo&nbsp; 65 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibsqlite3-0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &=
nbsp; 3:3.20.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;oe-repo 389 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibssl1.0.2&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &=
nbsp; 1.0.2n-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;oe-repo 144 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibstdc&#43;&#43;6&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&n=
bsp; &nbsp; &nbsp; 7.3.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; oe-repo 352 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibtinfo5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nb=
sp; &nbsp; 6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;oe-repo&nbsp; 53 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibudev1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp=
; &nbsp; &nbsp; 3.2.2-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; oe-repo&nbsp; 62 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibunistring2&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp;=
 0.9.7-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; oe-repo 368 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibusb-1.0-0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &=
nbsp; 1.0.21-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;oe-repo&nbsp; 44 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibuuid1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp=
; &nbsp; &nbsp; 2.30-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 13 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibwrap0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp=
; &nbsp; &nbsp; 7.6-r10&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 19 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibx11-6&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp=
; &nbsp; &nbsp; 1:1.6.5-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; oe-repo 551 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibxau6&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp=
; &nbsp; &nbsp; 1:1.0.8-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; oe-repo&nbsp; 10 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibxcb1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp=
; &nbsp; &nbsp; 1.12-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 43 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibxdmcp6&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nb=
sp; &nbsp; 1:1.1.2-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; oe-repo&nbsp; 14 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibz1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64=
&nbsp; &nbsp; &nbsp; 1.2.11-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 49 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ighttpd-module-dirlisting<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; core2_64&nbsp; &nbsp; &nbsp; 1.4.45-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 15 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ighttpd-module-indexfile<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; core2_64&nbsp; &nbsp; &nbsp; 1.4.45-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 9.4 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ighttpd-module-staticfile<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; core2_64&nbsp; &nbsp; &nbsp; 1.4.45-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 9.1 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;m=
odutils-initscripts&nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 1.0-r7&nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-rep=
o 7.9 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;n=
curses-terminfo&nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 6.0&=
#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 446 =
k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;n=
curses-terminfo-base&nbsp; core2_64&nbsp; &nbsp; &nbsp; 6.0&#43;20170715-r0=
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 13 k<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;n=
etbase&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp=
; &nbsp; &nbsp; 1:5.4-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; oe-repo&nbsp; 15 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;n=
ettle&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64=
&nbsp; &nbsp; &nbsp; 3.3-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 232 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;n=
spr&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cor=
e2_64&nbsp; &nbsp; &nbsp; 4.16-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 119 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;n=
ss&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; cor=
e2_64&nbsp; &nbsp; &nbsp; 3.31.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 1.9 M<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;o=
penssh-keygen&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp;=
 7.5p1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; oe-repo 147 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;o=
penssh-scp&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &=
nbsp; 7.5p1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; oe-repo&nbsp; 40 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;o=
penssh-ssh&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &=
nbsp; 7.5p1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; oe-repo 268 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;o=
penssh-sshd&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &=
nbsp; 7.5p1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; oe-repo 294 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;o=
penssl&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp=
; &nbsp; &nbsp; 1.0.2n-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;oe-repo 199 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;o=
penssl-conf&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &=
nbsp; 1.0.2n-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;oe-repo 9.6 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ciutils-ids&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &=
nbsp; 3.5.5-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; oe-repo 251 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
erl&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cor=
e2_64&nbsp; &nbsp; &nbsp; 5.24.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 23 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython-codecs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp;=
 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;oe-repo 644 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython-contextlib&nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 2.7.13-r1=
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-rep=
o 8.8 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython-core&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &=
nbsp; 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;oe-repo 176 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython-crypt&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &=
nbsp; 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;oe-repo&nbsp; 20 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython-ctypes&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp;=
 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;oe-repo 169 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython-curses&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp;=
 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;oe-repo&nbsp; 40 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython-datetime&nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 2.7.=
13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o=
e-repo&nbsp; 61 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython-io&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nb=
sp; &nbsp; 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;oe-repo 187 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython-lang&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &=
nbsp; 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;oe-repo 165 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython-logging&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp;=
 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;oe-repo&nbsp; 61 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython-math&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &=
nbsp; 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;oe-repo&nbsp; 62 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython-mime&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &=
nbsp; 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;oe-repo&nbsp; 36 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython-netclient&nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 2.7.=
13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o=
e-repo 198 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython-pickle&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp;=
 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;oe-repo&nbsp; 81 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython-pprint&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp;=
 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;oe-repo&nbsp; 12 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython-re&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nb=
sp; &nbsp; 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;oe-repo&nbsp; 36 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython-shell&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &=
nbsp; 2.7.13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;oe-repo&nbsp; 37 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython-stringold&nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 2.7.=
13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o=
e-repo&nbsp; 28 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython-textutils&nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 2.7.=
13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o=
e-repo&nbsp; 56 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-argparse&nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 3.5.=
3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-rep=
o&nbsp; 44 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-audio&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp;=
 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; o=
e-repo&nbsp; 48 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-codecs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp;=
 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; o=
e-repo 730 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-compression&nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 3.5.3-r1.0&nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 106 k<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-core&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &=
nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; oe-repo 215 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-crypt&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp;=
 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; o=
e-repo&nbsp; 30 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-curses&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp;=
 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; o=
e-repo&nbsp; 43 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-datetime&nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 3.5.=
3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-rep=
o&nbsp; 87 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-distutils&nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 3.5.3-r1.=
0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 992=
 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-email&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp;=
 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; o=
e-repo 193 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-enum&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &=
nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; oe-repo&nbsp; 18 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-fcntl&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp;=
 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; o=
e-repo&nbsp; 12 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-gpg&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &=
nbsp; 1.9.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; oe-repo 187 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-html&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &=
nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; oe-repo&nbsp; 59 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-image&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp;=
 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; o=
e-repo&nbsp; 12 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-importlib&nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 3.5.3-r1.=
0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbs=
p; 67 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-iniparse&nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 0.4-=
r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; oe-repo&nbsp; 28 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-io&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nb=
sp; &nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; oe-repo 184 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-json&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &=
nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; oe-repo&nbsp; 41 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-lang&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &=
nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; oe-repo 193 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-logging&nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 3.5.=
3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-rep=
o&nbsp; 75 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-math&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &=
nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; oe-repo&nbsp; 47 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-mime&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &=
nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; oe-repo&nbsp; 16 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-misc&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &=
nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; oe-repo 2.2 M<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-netclient&nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 3.5.3-r1.=
0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 268=
 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-pickle&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp;=
 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; o=
e-repo&nbsp; 72 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-re&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nb=
sp; &nbsp; 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; oe-repo&nbsp; 38 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-reprlib&nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 3.5.=
3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-rep=
o 7.6 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-rpm&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &=
nbsp; 1:4.13.90&#43;git0&#43;a8e51b3bb0-r0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; o=
e-repo&nbsp; 49 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-selectors&nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 3.5.3-r1.=
0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbs=
p; 15 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-shell&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp;=
 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; o=
e-repo&nbsp; 44 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-signal&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp;=
 3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; o=
e-repo 8.3 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-six&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &=
nbsp; 1.10.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;oe-repo&nbsp; 22 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-sqlite3&nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 3.5.=
3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-rep=
o&nbsp; 35 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-stringold&nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 3.5.3-r1.=
0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbs=
p; 13 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-subprocess&nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 3.5.3-r1.=
0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbs=
p; 37 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-textutils&nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 3.5.3-r1.=
0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbs=
p; 62 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-threading&nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 3.5.3-r1.=
0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbs=
p; 38 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-unixadmin&nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 3.5.3-r1.=
0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbs=
p; 18 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;s=
hadow-base&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &=
nbsp; 4.2.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; oe-repo&nbsp; 54 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;s=
hadow-securetty&nbsp; &nbsp; &nbsp; &nbsp;genericx86_64 4.2.1-r3&nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 6.5 k<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;s=
trace&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64=
&nbsp; &nbsp; &nbsp; 4.18-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 162 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;s=
ysvinit&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp=
; &nbsp; &nbsp; 2.88dsf-r14&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;oe-repo&nbsp; 58 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;s=
ysvinit-inittab&nbsp; &nbsp; &nbsp; &nbsp;genericx86_64 2.88dsf-r10&nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 8.0 k<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;s=
ysvinit-pidof&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp;=
 2.88dsf-r14&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o=
e-repo&nbsp; 14 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;u=
pdate-alternatives-opkg<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; core2_64&nbsp; &nbsp; &nbsp; 0.3.5-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 8.2 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;u=
til-linux-losetup&nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 2.30-r0&n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o=
e-repo&nbsp; 36 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;u=
til-linux-lsblk&nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 2.30=
-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;oe-repo&nbsp; 33 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;u=
til-linux-sulogin&nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 2.30-r0&n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o=
e-repo&nbsp; 23 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;u=
til-linux-swaponoff&nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 2.30-r0&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-rep=
o&nbsp; 27 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;u=
til-linux-umount&nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 2.30-r0&n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o=
e-repo&nbsp; 16 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Install=
ing weak dependencies:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;b=
usybox-syslog&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp;=
 1.24.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;oe-repo 9.2 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;b=
usybox-udhcpc&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp;=
 1.24.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;oe-repo 7.7 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;c=
a-certificates&nbsp; &nbsp; &nbsp; &nbsp; noarch&nbsp; &nbsp; &nbsp; &nbsp;=
 20170717-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o=
e-repo 155 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;d=
bus-1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64=
&nbsp; &nbsp; &nbsp; 1.10.20-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; oe-repo 124 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;e=
udev-hwdb&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nb=
sp; &nbsp; 3.2.2-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; oe-repo 683 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-base-files-dev&nbsp; &nbsp;genericx86_64 3.0.14-r89&nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 5.6 k<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-bash-dev&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;4.4-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 64 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-bc-dev&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;1.06-r3&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 5.6 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-bzip2-dev&nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;1.0.6-r5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; oe-repo 8.3 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-cryptodev-linux-dev<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1.9-r0&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo 9.0 k<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-db-dev&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;1:5.3.28-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;oe-repo&nbsp; 41 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-diffutils-dev&nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;3.6-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; oe-repo 5.8 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-etherlab-dev&nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;1.5.2.5-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; oe-repo 5.6 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-flex-dev&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;2.6.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; oe-repo 9.0 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-gawk-dev&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;4.1.4-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; oe-repo&nbsp; 15 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libc6-dev&nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;2.26-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;oe-repo 455 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libffi-dev&nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;3.2.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; oe-repo&nbsp; 12 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libgcc-s-dev&nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;7.3.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; oe-repo 2.8 M<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libgdbm-dev&nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;1.13-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;oe-repo&nbsp; 11 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libreadline-dev&nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;7.0-=
r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; oe-repo&nbsp; 23 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libsqlite3-dev&nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;3:3.20.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o=
e-repo 116 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libssp-dev&nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;7.3.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; oe-repo&nbsp; 11 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libstdc&#43;&#43;-dev&nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;7.3.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; oe-repo 901 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libxml2-dev&nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;2.9.4-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; oe-repo&nbsp; 78 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-libz-dev&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;1.2.11-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;oe-repo&nbsp; 33 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-linux-libc-headers-dev<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;4.12-r0&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 971 k<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-m4-dev&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;1.4.18-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;oe-repo 5.8 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-make-dev&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;4.2.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; oe-repo 7.8 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-ncurses-dev&nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;6.0&#43;20170715-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe=
-repo&nbsp; 65 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-ncurses-terminfo-base<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;6.0&#43;20170715-r0&nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 13 k<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-openssl-dev&nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;1.0.2n-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;oe-repo 227 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-perl-dev&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;5.24.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;oe-repo 387 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-python3-dev&nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;3.5.3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; oe-repo 143 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-python3-readline x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;3.5.3-r1.=
0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-repo&nbs=
p; 20 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-sed-dev&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; x86&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;4.2.2-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; oe-repo 5.6 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ib32-xz-dev&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;x86&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;5.2.3-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; oe-repo&nbsp; 41 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ibc6-thread-db&nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 2.26=
-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;oe-repo&nbsp; 17 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ighttpd-module-access core2_64&nbsp; &nbsp; &nbsp; 1.4.45-r0&nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo 9.1 k<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;l=
ighttpd-module-accesslog<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; core2_64&nbsp; &nbsp; &nbsp; 1.4.45-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 14 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
inentry&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp=
; &nbsp; &nbsp; 1.0.0-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; oe-repo&nbsp; 31 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython-readline&nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 2.7.=
13-r1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o=
e-repo&nbsp; 17 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ython3-readline&nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 3.5.=
3-r1.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; oe-rep=
o&nbsp; 19 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;s=
hared-mime-info&nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 1.8-=
r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; oe-repo 362 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;u=
pdate-rc.d&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; noarch&nbsp; &nbsp; &nb=
sp; &nbsp; 0.7-r5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; oe-repo 8.0 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;u=
til-linux-cfdisk&nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 2.30-r0&n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o=
e-repo&nbsp; 38 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;u=
til-linux-fdisk&nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 2.30=
-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;oe-repo&nbsp; 47 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;u=
til-linux-ionice&nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 2.30-r0&n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o=
e-repo&nbsp; 15 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;u=
til-linux-mkfs&nbsp; &nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 2.30=
-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;oe-repo 9.7 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;u=
til-linux-mount&nbsp; &nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 2.30=
-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;oe-repo&nbsp; 18 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;u=
til-linux-mountpoint&nbsp; core2_64&nbsp; &nbsp; &nbsp; 2.30-r0&nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbs=
p; 11 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;u=
til-linux-prlimit&nbsp; &nbsp; &nbsp;core2_64&nbsp; &nbsp; &nbsp; 2.30-r0&n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o=
e-repo&nbsp; 17 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;u=
til-linux-readprofile core2_64&nbsp; &nbsp; &nbsp; 2.30-r0&nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 12=
 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;u=
til-linux-sfdisk&nbsp; &nbsp; &nbsp; core2_64&nbsp; &nbsp; &nbsp; 2.30-r0&n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o=
e-repo&nbsp; 43 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;u=
til-linux-switch-root core2_64&nbsp; &nbsp; &nbsp; 2.30-r0&nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe-repo&nbsp; 10=
 k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Transac=
tion Summary<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Install=
&nbsp; 342 Packages<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Total s=
ize: 67 M<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Install=
ed size: 218 M<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Downloa=
ding Packages:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Running=
 transaction check<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Transac=
tion check succeeded.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Running=
 transaction test<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Error: =
Transaction check error:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
file /usr/bin/python3.5m-config conflicts between attempted installs of lib=
32-python3-core-3.5.3-r1.0.x86 and python3-core-3.5.3-r1.0.core2_64<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Error S=
ummary<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">-------=
------<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">ERROR: =
core-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">ERROR: =
Logfile of failure stored in: /opt/poky/build/tmp/work/genericx86_64-poky-l=
inux/core-image-minimal/1.0-r0/temp/log.do_rootfs.28954<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">ERROR: =
Task (/opt/poky/meta/recipes-core/images/core-image-minimal.bb:do_rootfs) f=
ailed with exit code '1'<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">NOTE: T=
asks Summary: Attempted 3898 tasks of which 3836 didn't need to be rerun an=
d 1 failed.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Summary=
: 1 task failed:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
/opt/poky/meta/recipes-core/images/core-image-minimal.bb:do_rootfs<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Summary=
: There were 2 ERROR messages shown, returning a non-zero exit code.<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">I under=
stand that there's a conflict regarding the installation of&nbsp;/usr/bin/p=
ython3.5m-config between python3 and lib32-python3, but I have no idea how =
to solve it.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Any poi=
nters?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Thanks =
a lot,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Nir.<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_VI1PR0701MB2814A5F3C7A991BC9861668990AD0VI1PR0701MB2814_--
