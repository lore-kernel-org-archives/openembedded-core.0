Return-Path: <B28495@freescale.com>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe005.messaging.microsoft.com [216.32.180.31])
	by mail.openembedded.org (Postfix) with ESMTP id 5D7DC6CB97
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 03:45:27 +0000 (UTC)
Received: from mail97-va3-R.bigfish.com (10.7.14.228) by
	VA3EHSOBE008.bigfish.com (10.7.40.28) with Microsoft SMTP Server id
	14.1.225.22; Thu, 17 Oct 2013 03:45:28 +0000
Received: from mail97-va3 (localhost [127.0.0.1])	by mail97-va3-R.bigfish.com
	(Postfix) with ESMTP id 3A6E92008F;
	Thu, 17 Oct 2013 03:45:28 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(z551biz9371I936eId772h542I1432Izz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h17326ah8275dh1de097h186068hz2dh2a8h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e1dh1fe8h1ff5h21a6hbe9i1155h)
Received: from mail97-va3 (localhost.localdomain [127.0.0.1]) by mail97-va3
	(MessageSwitch) id 1381981526201231_10388;
	Thu, 17 Oct 2013 03:45:26 +0000 (UTC)
Received: from VA3EHSMHS011.bigfish.com (unknown [10.7.14.250])	by
	mail97-va3.bigfish.com (Postfix) with ESMTP id 21D6E3A0031;
	Thu, 17 Oct 2013 03:45:26 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS011.bigfish.com
	(10.7.99.21) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Thu, 17 Oct 2013 03:45:25 +0000
Received: from 039-SN2MPN1-013.039d.mgd.msft.net ([169.254.3.219]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.03.0158.002; Thu, 17 Oct 2013 03:45:24 +0000
From: Liu Ting-B28495 <B28495@freescale.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [CONSOLIDATED PULL 00/30]  Package Updated & Fixes
Thread-Index: AQHOypjDJzb0U4f8sE2E7gx4l/hU+Zn4QNkw
Date: Thu, 17 Oct 2013 03:45:23 +0000
Message-ID: <AF604684617F454390621992F367F1690BB5B43E@039-SN2MPN1-013.039d.mgd.msft.net>
References: <cover.1381944889.git.sgw@linux.intel.com>
In-Reply-To: <cover.1381944889.git.sgw@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.193.20.135]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 00/30] Package Updated & Fixes
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
X-List-Received-Date: Thu, 17 Oct 2013 03:45:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Saul Wold
> Sent: Thursday, October 17, 2013 1:54 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [CONSOLIDATED PULL 00/30] Package Updated & Fixes
>=20
> Richard,
>=20
> This is set of updates and fixes that I have reviewed and run through the
> autobuilder.
>=20
> I have included the kernel-grub.bbclass as it's a standalone class, right
> now it's RPM only it seems.
>=20
> Sau!
>=20
>=20
>=20
> The following changes since commit
> 2b179d90eacc58f0b217f64407782a9174362850:
>=20
>   update-rcd.bbclass: fix host/target test (2013-10-16 14:50:58 +0100)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-
> contrib/log/?h=3Dsgw/stage
>=20
> Chase Maupin (1):
>   udev: update local rules for new touchscreen device
>=20
> Hongxu Jia (1):
>   kernel-grub.bbclass: a method to install/update for bzImage
>=20
> Jack Mitchell (2):
>   grub: add patch to support 256 byte inodes
>   crond: remove UID check in init script
>=20
> Jeffrey C Honig (1):
>   initscripts: insure checkroot.sh runs before anything writing to the
>     file
>=20
> Laurentiu Palcu (10):
>   byacc: upgrade to 20130925
>   xkeyboard-config: upgrade to 2.10.1
>   xauth: upgrade to 1.0.8
>   xf86-input-evdev: upgrade to 2.8.2
>   libdrm: upgrade to 2.4.47
>   xset: upgrade to 1.2.3
>   xf86-video-intel: upgrade to 2.21.15
>   xinput: upgrade to 1.6.1
>   xprop: upgrade to 1.2.2
>   xf86-video-fbdev: upgrade to 0.4.4
>=20
> Ross Burton (4):
>   cairo: add explicit dependency on zlib
>   wayland: upgrade to 1.3.0
>   weston: upgrade to 1.3.0
>   weston-init: start weston on a new VT
>=20
> Saul Wold (9):
>   sysstat: upgrade to 10.1.7
>   xz: Add nativesdk for Python3 nativesdk dependency
>   kmod: Add patch to fix seperate build dir of ptest
>   kmod: Update to Rev 15 via git
>   check: add check recipe for kbd to use for creating unit tests
>   kbd: Update to 2.0.0
>   base-passwd: upgrade to 3.5.28
>   ca-certificates: Clarify in Description that certs are Debian based
>   packagegroup-core-basic: libuser has a hard depenency on libpam
>=20
> Ting Liu (2):
>   perf: flag __SANE_USERSPACE_TYPES__ to include int-ll64.h for
>     powerpc64
>   socat: add dependency on tcp-wrappers

Please ignore the socat patch. There is already a fix applied:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D7386dba5beb3a27=
db2a4e04a3a026a39151eab42

-Ting

>=20
>  meta/classes/kernel-grub.bbclass                   |  79
> ++++++++++++++++
>  .../grub-0.97/grub-support-256byte-inode.patch     | 101
> +++++++++++++++++++++
>  meta/recipes-bsp/grub/grub_0.97.bb                 |  11 ++-
>  meta/recipes-connectivity/socat/socat_1.7.2.2.bb   |   2 +-
>  .../add_shutdown.patch                             |   0
>  .../base-passwd-3.5.28/disable-docs.patch          |  24 +++++
>  .../input.patch                                    |   0
>  .../nobash.patch                                   |   0
>  ...base-passwd_3.5.26.bb =3D> base-passwd_3.5.28.bb} |  11 ++-
>  meta/recipes-core/initscripts/initscripts_1.0.bb   |   2 +-
>  .../kbd-1.15.2/Allow-resizecons-on-x86_64.patch    |  28 ------
>  .../kbd/{kbd_1.15.2.bb =3D> kbd_2.0.0.bb}            |  19 ++--
>  meta/recipes-core/udev/udev/local.rules            |   4 +-
>  .../byacc/{byacc_20130304.bb =3D> byacc_20130925.bb} |   4 +-
>  meta/recipes-extended/cronie/cronie/crond.init     |   8 --
>  .../packagegroups/packagegroup-core-basic.bb       |   2 +-
>  ...-Makefile-to-allow-for-parallel-execution.patch |  34 -------
>  meta/recipes-extended/sysstat/sysstat.inc          |   4 +-
>  .../{sysstat_10.1.6.bb =3D> sysstat_10.1.7.bb}       |   4 +-
>  meta/recipes-extended/xz/xz_5.1.2alpha.bb          |   2 +-
>  meta/recipes-graphics/cairo/cairo.inc              |   2 +-
>  .../drm/{libdrm_2.4.46.bb =3D> libdrm_2.4.47.bb}     |   4 +-
>  .../wayland/{wayland_1.1.0.bb =3D> wayland_1.3.0.bb} |  19 ++--
>  meta/recipes-graphics/wayland/weston-init.bb       |   2 +
>  meta/recipes-graphics/wayland/weston-init/init     |   2 +-
>  meta/recipes-graphics/wayland/weston/groups.patch  |  47 ----------
>  .../wayland/weston/install-examples.patch          |  18 ----
>  .../wayland/weston/weston-launch-shell.patch       |  74 ---------------
>  .../wayland/{weston_1.1.0.bb =3D> weston_1.3.0.bb}   |  17 ++--
>  .../xorg-app/{xauth_1.0.7.bb =3D> xauth_1.0.8.bb}    |   5 +-
>  .../xorg-app/{xinput_1.6.0.bb =3D> xinput_1.6.1.bb}  |   5 +-
>  .../xorg-app/{xprop_1.2.1.bb =3D> xprop_1.2.2.bb}    |   5 +-
>  .../xorg-app/{xset_1.2.2.bb =3D> xset_1.2.3.bb}      |   5 +-
>  ...ut-evdev_2.8.1.bb =3D> xf86-input-evdev_2.8.2.bb} |   4 +-
>  .../xf86-video-fbdev/Remove-mibstore.h.patch       |  35 -------
>  ...eo-fbdev_0.4.3.bb =3D> xf86-video-fbdev_0.4.4.bb} |   6 +-
>  ...ntel_2.21.13.bb =3D> xf86-video-intel_2.21.15.bb} |   4 +-
>  ...rd-config_2.9.bb =3D> xkeyboard-config_2.10.1.bb} |   4 +-
>  meta/recipes-kernel/kmod/kmod-native_git.bb        |   3 +-
>  meta/recipes-kernel/kmod/kmod.inc                  |  13 +--
>  .../kmod/kmod/fix-seperatebuilddir.patch           |  34 +++++++
>  meta/recipes-kernel/kmod/kmod_git.bb               |   6 +-
>  meta/recipes-kernel/perf/perf.bb                   |   6 ++
>  .../ca-certificates/ca-certificates_20130610.bb    |   3 +-
>  meta/recipes-support/check/check_0.9.10.bb         |  20 ++++
>  meta/recipes-support/check/files/ptest.patch       |  29 ++++++
>  meta/recipes-support/check/files/run-ptest         |   3 +
>  47 files changed, 382 insertions(+), 332 deletions(-)  create mode
> 100644 meta/classes/kernel-grub.bbclass  create mode 100644 meta/recipes-
> bsp/grub/grub-0.97/grub-support-256byte-inode.patch
>  rename meta/recipes-core/base-passwd/{base-passwd-3.5.26 =3D> base-passw=
d-
> 3.5.28}/add_shutdown.patch (100%)  create mode 100644 meta/recipes-
> core/base-passwd/base-passwd-3.5.28/disable-docs.patch
>  rename meta/recipes-core/base-passwd/{base-passwd-3.5.26 =3D> base-passw=
d-
> 3.5.28}/input.patch (100%)  rename meta/recipes-core/base-passwd/{base-
> passwd-3.5.26 =3D> base-passwd-3.5.28}/nobash.patch (100%)  rename
> meta/recipes-core/base-passwd/{base-passwd_3.5.26.bb =3D> base-
> passwd_3.5.28.bb} (92%)  delete mode 100644 meta/recipes-core/kbd/kbd-
> 1.15.2/Allow-resizecons-on-x86_64.patch
>  rename meta/recipes-core/kbd/{kbd_1.15.2.bb =3D> kbd_2.0.0.bb} (58%)
> rename meta/recipes-extended/byacc/{byacc_20130304.bb =3D>
> byacc_20130925.bb} (74%)  delete mode 100644 meta/recipes-
> extended/sysstat/files/0001-Update-Makefile-to-allow-for-parallel-
> execution.patch
>  rename meta/recipes-extended/sysstat/{sysstat_10.1.6.bb =3D>
> sysstat_10.1.7.bb} (40%)  rename meta/recipes-
> graphics/drm/{libdrm_2.4.46.bb =3D> libdrm_2.4.47.bb} (46%)  rename
> meta/recipes-graphics/wayland/{wayland_1.1.0.bb =3D> wayland_1.3.0.bb} (6=
3%)
> delete mode 100644 meta/recipes-graphics/wayland/weston/groups.patch
>  delete mode 100644 meta/recipes-graphics/wayland/weston/install-
> examples.patch
>  delete mode 100644 meta/recipes-graphics/wayland/weston/weston-launch-
> shell.patch
>  rename meta/recipes-graphics/wayland/{weston_1.1.0.bb =3D> weston_1.3.0.=
bb}
> (83%)  rename meta/recipes-graphics/xorg-app/{xauth_1.0.7.bb =3D>
> xauth_1.0.8.bb} (65%)  rename meta/recipes-graphics/xorg-
> app/{xinput_1.6.0.bb =3D> xinput_1.6.1.bb} (64%)  rename meta/recipes-
> graphics/xorg-app/{xprop_1.2.1.bb =3D> xprop_1.2.2.bb} (77%)  rename
> meta/recipes-graphics/xorg-app/{xset_1.2.2.bb =3D> xset_1.2.3.bb} (74%)
> rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.8.1.bb =3D>
> xf86-input-evdev_2.8.2.bb} (83%)  delete mode 100644 meta/recipes-
> graphics/xorg-driver/xf86-video-fbdev/Remove-mibstore.h.patch
>  rename meta/recipes-graphics/xorg-driver/{xf86-video-fbdev_0.4.3.bb =3D>
> xf86-video-fbdev_0.4.4.bb} (44%)  rename meta/recipes-graphics/xorg-
> driver/{xf86-video-intel_2.21.13.bb =3D> xf86-video-intel_2.21.15.bb} (88=
%)
> rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.9.bb =3D>
> xkeyboard-config_2.10.1.bb} (87%)  create mode 100644 meta/recipes-
> kernel/kmod/kmod/fix-seperatebuilddir.patch
>  create mode 100644 meta/recipes-support/check/check_0.9.10.bb
>  create mode 100644 meta/recipes-support/check/files/ptest.patch
>  create mode 100644 meta/recipes-support/check/files/run-ptest
>=20
> --
> 1.8.3.1
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



