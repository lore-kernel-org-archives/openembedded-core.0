Return-Path: <Muhammad_Shakeel@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 995CF605F3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 10:20:40 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Uot1l-0006Ei-2u from Muhammad_Shakeel@mentor.com ;
	Tue, 18 Jun 2013 03:20:41 -0700
Received: from SVR-IES-FEM-02.mgc.mentorg.com ([137.202.0.106]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 18 Jun 2013 03:20:41 -0700
Received: from EU-MBX-04.mgc.mentorg.com ([169.254.4.127]) by
	SVR-IES-FEM-02.mgc.mentorg.com ([137.202.0.106]) with mapi id
	14.02.0247.003; Tue, 18 Jun 2013 11:20:39 +0100
From: "Shakeel, Muhammad" <Muhammad_Shakeel@mentor.com>
To: Saul Wold <sgw@linux.intel.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [CONSOLIDATED PULL 00/37] Updates and some fixes
Thread-Index: AQHOaFHYQdao4bRDU0Wi0RpWLfxKxpk7R0m+
Date: Tue, 18 Jun 2013 10:20:38 +0000
Message-ID: <A8A2F4C5E3D3D0468DDA3544476725F8AE1F3457@EU-MBX-04.mgc.mentorg.com>
References: <cover.1371140186.git.sgw@linux.intel.com>
In-Reply-To: <cover.1371140186.git.sgw@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
X-OriginalArrivalTime: 18 Jun 2013 10:20:41.0133 (UTC)
	FILETIME=[7C03EDD0:01CE6C0D]
Subject: Re: [CONSOLIDATED PULL 00/37] Updates and some fixes
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
X-List-Received-Date: Tue, 18 Jun 2013 10:20:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,=0A=
=0A=
Could you please consider following commits for dylan branch? =0A=
=0A=
Muhammad Shakeel (1):=0A=
  ofono: Add run time dependency for ofono test scripts=0A=
=0A=
 meta/recipes-connectivity/ofono/ofono.inc          |   2 +-=0A=
=0A=
Without this patch we will see run time error while executing some of the o=
fono tests and this can be considered as bug fix.=0A=
=0A=
Muhammad Shakeel (1):=0A=
  openssl: Add fix for cipher des-ede3-cfb1=0A=
=0A=
.../openssl-1.0.1e/fix-cipher-des-ede3-cfb1.patch  |  22 ++=0A=
.../recipes-connectivity/openssl/openssl_1.0.1e.bb |   1 +=0A=
=0A=
Without this patch we will see functional error if this cipher is used.=0A=
=0A=
Sorry for not mentioning it on initial subject line.=0A=
=0A=
Best Regards,=0A=
Shakeel=0A=
________________________________________=0A=
From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-b=
ounces@lists.openembedded.org] on behalf of Saul Wold [sgw@linux.intel.com]=
=0A=
Sent: Thursday, June 13, 2013 9:19 PM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Subject: [OE-core] [CONSOLIDATED PULL 00/37] Updates and some fixes=0A=
=0A=
Richard,=0A=
=0A=
This is a group of updates and some patches that have been=0A=
pulled together and built on the Autobuilder=0A=
=0A=
There's a Chris patch to sstate.bbclass that needs your eyes.=0A=
=0A=
Thanks=0A=
        Sau!=0A=
=0A=
The following changes since commit 74158c2e99c6d8631800ae80025d1cc9f19336d2=
:=0A=
=0A=
  tune-cortexa*.inc: fix tunings for cortex a5, a7, a8, a9, a15 machines. (=
2013-06-12 17:54:28 +0100)=0A=
=0A=
are available in the git repository at:=0A=
=0A=
  git://git.openembedded.org/openembedded-core-contrib sgw/stage=0A=
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3D=
sgw/stage=0A=
=0A=
Andrei Dinu (1):=0A=
  gzip : upgrade to 1.6=0A=
=0A=
Christopher Larson (2):=0A=
  sstate.bbclass: brute force silence fetch errors=0A=
  libnewt: split python module into libnewt-python=0A=
=0A=
Felipe F. Tonello (1):=0A=
  qt: update qmake2 class to export qconfig.pri mkspec=0A=
=0A=
Jonathan Liu (2):=0A=
  util-linux: update to 2.23.1=0A=
  classes/qmake_base: allow parallel make=0A=
=0A=
Khem Raj (1):=0A=
  gcc: Upgrade to 4.8.1=0A=
=0A=
Laurentiu Palcu (7):=0A=
  xf86-input-synaptics: upgrade to 1.7.1=0A=
  xkeyboard-config: upgrade to 2.9=0A=
  xdpyinfo: upgrade to 1.3.1=0A=
  xf86-video-intel: upgrade to 2.21.9=0A=
  xwininfo: upgrade to 1.1.3=0A=
  libdrm: upgrade to 2.4.45=0A=
  libxt: upgrade to 1.1.4=0A=
=0A=
Muhammad Shakeel (1):=0A=
  ofono: Add run time dependency for ofono test scripts=0A=
=0A=
Riku Voipio (1):=0A=
  qemu: update to 1.5.0=0A=
=0A=
Ross Burton (6):=0A=
  runqemu: when tunctl can't be found, say what package builds it=0A=
  site: add more alignment values for at-spi2-core=0A=
  dpkg: drop the usage of create_wrapper=0A=
  python-native: add nativepython symlink=0A=
  createrepo: drop the usage of create_wrapper=0A=
  gnome-doc-utils: drop the usage of create_wrapper=0A=
=0A=
Roy.Li (2):=0A=
  wpa-supplicant: Enable EXTRA_CFLAGS=0A=
  latencytop: Deprecate tracing_enabled for tracing_on=0A=
=0A=
Saul Wold (11):=0A=
  socat: Update to 1.7.2.2=0A=
  cmake: Update to 2.8.11.1=0A=
  help2man: Update to 1.43.2=0A=
  cracklib: Update to 2.9.0=0A=
  cups: Update to 1.6.2=0A=
  libidn: Update to 1.27=0A=
  lsbinitscripts: Update to 9.47=0A=
  sysstat: Update to 10.1.6=0A=
  libxkbcommon: Update to 0.3.1=0A=
  libusb: Update tp 0.1.5=0A=
  nspr: Update to 4.10=0A=
=0A=
Stefan Stanacar (2):=0A=
  scripts/contrib/build-perf-test.sh: add branch name and sizes to=0A=
    results=0A=
  scripts/contrib/build-perf-test.sh: fix passing arguments=0A=
=0A=
 meta/classes/qmake2.bbclass                        |   1 +=0A=
 meta/classes/qmake_base.bbclass                    |   2 +-=0A=
 meta/classes/sstate.bbclass                        |   5 +=0A=
 meta/conf/distro/include/tcmode-default.inc        |   2 +-=0A=
 meta/recipes-connectivity/ofono/ofono.inc          |   2 +-=0A=
 .../socat/{socat_1.7.2.1.bb =3D> socat_1.7.2.2.bb}   |  11 +-=0A=
 .../wpa-supplicant/wpa-supplicant-2.0.inc          |   1 +=0A=
 ...-fix-loopcxt_check_size-to-work-with-blkd.patch |  60 ------=0A=
 ...etup-use-warn_size-for-regular-files-only.patch |  29 ---=0A=
 .../{util-linux_2.23.bb =3D> util-linux_2.23.1.bb}   |   7 +-=0A=
 .../cmake/cmake-native_2.8.11.1.bb                 |   5 +=0A=
 meta/recipes-devtools/cmake/cmake-native_2.8.11.bb |   5 -=0A=
 .../cmake/{cmake_2.8.11.bb =3D> cmake_2.8.11.1.bb}   |   4 +-=0A=
 meta/recipes-devtools/dpkg/dpkg.inc                |  10 +-=0A=
 meta/recipes-devtools/gcc/gcc-4.8.inc              |   8 +-=0A=
 ...-native_1.41.2.bb =3D> help2man-native_1.43.2.bb} |   5 +-=0A=
 .../recipes-devtools/python/python-native_2.7.3.bb |   6 +=0A=
 ...x-texinfo-table-markup-in-qemu-options.hx.patch | 213 -----------------=
----=0A=
 ...x-generating-qemu-doc.html-with-texinfo-5.patch |  54 ------=0A=
 ...re_vga-Add-back-some-info-in-local-state-.patch | 114 -----------=0A=
 meta/recipes-devtools/qemu/files/arm-bgr.patch     |  30 ---=0A=
 .../files/fallback-to-safe-mmap_min_addr.patch     |  39 ----=0A=
 .../recipes-devtools/qemu/files/linker-flags.patch |  25 ---=0A=
 meta/recipes-devtools/qemu/qemu.inc                |   7 +-=0A=
 .../qemu/{qemu_1.4.1.bb =3D> qemu_1.5.0.bb}          |   4 +-=0A=
 .../{cracklib_2.8.22.bb =3D> cracklib_2.9.0.bb}      |   5 +-=0A=
 meta/recipes-extended/cups/cups16.inc              |   2 +-=0A=
 .../cups/{cups_1.6.1.bb =3D> cups_1.6.2.bb}          |   4 +-=0A=
 .../gzip/{gzip_1.5.bb =3D> gzip_1.6.bb}              |   6 +-=0A=
 .../libidn/{libidn_1.26.bb =3D> libidn_1.27.bb}      |  11 +-=0A=
 ...binitscripts_9.46.bb =3D> lsbinitscripts_9.47.bb} |   6 +-=0A=
 .../newt/libnewt-python_0.52.14.bb                 |  26 +++=0A=
 meta/recipes-extended/newt/libnewt_0.52.14.bb      |  15 +-=0A=
 meta/recipes-extended/sysstat/sysstat.inc          |   1 -=0A=
 meta/recipes-extended/sysstat/sysstat_10.1.5.bb    |   8 -=0A=
 meta/recipes-extended/sysstat/sysstat_10.1.6.bb    |   6 +=0A=
 meta/recipes-gnome/gnome/gnome-doc-utils.inc       |   2 +-=0A=
 .../drm/{libdrm_2.4.44.bb =3D> libdrm_2.4.45.bb}     |   4 +-=0A=
 .../{xdpyinfo_1.3.0.bb =3D> xdpyinfo_1.3.1.bb}       |   5 +-=0A=
 .../{xwininfo_1.1.2.bb =3D> xwininfo_1.1.3.bb}       |   5 +-=0A=
 ...tics_1.7.0.bb =3D> xf86-input-synaptics_1.7.1.bb} |   4 +-=0A=
 ...-intel_2.21.6.bb =3D> xf86-video-intel_2.21.9.bb} |   4 +-=0A=
 ...libxkbcommon_0.3.0.bb =3D> libxkbcommon_0.3.1.bb} |   4 +-=0A=
 .../xorg-lib/{libxt_1.1.3.bb =3D> libxt_1.1.4.bb}    |   7 +-=0A=
 ...board-config_2.8.bb =3D> xkeyboard-config_2.9.bb} |   5 +-=0A=
 .../latencytop-0.5/latencytop-fsync.patch          |  49 +++++=0A=
 meta/recipes-kernel/latencytop/latencytop_0.5.bb   |   3 +-=0A=
 .../createrepo/createrepo_0.4.11.bb                |   2 +-=0A=
 .../0.1.0-beta1-gcc3.4-fix.patch                   |  15 --=0A=
 .../obsolete_automake_macros.patch                 |  15 --=0A=
 ...busb-compat_0.1.4.bb =3D> libusb-compat_0.1.5.bb} |  10 +-=0A=
 .../nspr/{nspr_4.9.6.bb =3D> nspr_4.10.bb}           |  10 +-=0A=
 meta/site/arm-common                               |  10 +=0A=
 meta/site/ix86-common                              |   2 +-=0A=
 meta/site/mips-common                              |  10 +=0A=
 meta/site/powerpc-common                           |   9 +=0A=
 meta/site/x86_64-linux                             |   3 +-=0A=
 scripts/contrib/build-perf-test.sh                 |  60 +++---=0A=
 scripts/runqemu-ifdown                             |   2 +-=0A=
 59 files changed, 239 insertions(+), 740 deletions(-)=0A=
 rename meta/recipes-connectivity/socat/{socat_1.7.2.1.bb =3D> socat_1.7.2.=
2.bb} (79%)=0A=
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-lib-loopde=
v-fix-loopcxt_check_size-to-work-with-blkd.patch=0A=
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-losetup-us=
e-warn_size-for-regular-files-only.patch=0A=
 rename meta/recipes-core/util-linux/{util-linux_2.23.bb =3D> util-linux_2.=
23.1.bb} (70%)=0A=
 create mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.11.1.bb=0A=
 delete mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.11.bb=0A=
 rename meta/recipes-devtools/cmake/{cmake_2.8.11.bb =3D> cmake_2.8.11.1.bb=
} (88%)=0A=
 rename meta/recipes-devtools/help2man/{help2man-native_1.41.2.bb =3D> help=
2man-native_1.43.2.bb} (79%)=0A=
 delete mode 100644 meta/recipes-devtools/qemu/files/0001-doc-Fix-texinfo-t=
able-markup-in-qemu-options.hx.patch=0A=
 delete mode 100644 meta/recipes-devtools/qemu/files/0002-docs-Fix-generati=
ng-qemu-doc.html-with-texinfo-5.patch=0A=
 delete mode 100644 meta/recipes-devtools/qemu/files/Revert-vmware_vga-Add-=
back-some-info-in-local-state-.patch=0A=
 delete mode 100644 meta/recipes-devtools/qemu/files/arm-bgr.patch=0A=
 delete mode 100644 meta/recipes-devtools/qemu/files/fallback-to-safe-mmap_=
min_addr.patch=0A=
 delete mode 100644 meta/recipes-devtools/qemu/files/linker-flags.patch=0A=
 rename meta/recipes-devtools/qemu/{qemu_1.4.1.bb =3D> qemu_1.5.0.bb} (67%)=
=0A=
 rename meta/recipes-extended/cracklib/{cracklib_2.8.22.bb =3D> cracklib_2.=
9.0.bb} (83%)=0A=
 rename meta/recipes-extended/cups/{cups_1.6.1.bb =3D> cups_1.6.2.bb} (80%)=
=0A=
 rename meta/recipes-extended/gzip/{gzip_1.5.bb =3D> gzip_1.6.bb} (48%)=0A=
 rename meta/recipes-extended/libidn/{libidn_1.26.bb =3D> libidn_1.27.bb} (=
75%)=0A=
 rename meta/recipes-extended/lsb/{lsbinitscripts_9.46.bb =3D> lsbinitscrip=
ts_9.47.bb} (78%)=0A=
 create mode 100644 meta/recipes-extended/newt/libnewt-python_0.52.14.bb=0A=
 delete mode 100644 meta/recipes-extended/sysstat/sysstat_10.1.5.bb=0A=
 create mode 100644 meta/recipes-extended/sysstat/sysstat_10.1.6.bb=0A=
 rename meta/recipes-graphics/drm/{libdrm_2.4.44.bb =3D> libdrm_2.4.45.bb} =
(46%)=0A=
 rename meta/recipes-graphics/xorg-app/{xdpyinfo_1.3.0.bb =3D> xdpyinfo_1.3=
.1.bb} (80%)=0A=
 rename meta/recipes-graphics/xorg-app/{xwininfo_1.1.2.bb =3D> xwininfo_1.1=
.3.bb} (69%)=0A=
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.7.0.bb =
=3D> xf86-input-synaptics_1.7.1.bb} (81%)=0A=
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.21.6.bb =3D> =
xf86-video-intel_2.21.9.bb} (85%)=0A=
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_0.3.0.bb =3D> libxkbco=
mmon_0.3.1.bb} (78%)=0A=
 rename meta/recipes-graphics/xorg-lib/{libxt_1.1.3.bb =3D> libxt_1.1.4.bb}=
 (85%)=0A=
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.8.bb =3D> xkeybo=
ard-config_2.9.bb} (87%)=0A=
 create mode 100644 meta/recipes-kernel/latencytop/latencytop-0.5/latencyto=
p-fsync.patch=0A=
 delete mode 100644 meta/recipes-support/libusb/libusb-compat-0.1.4/0.1.0-b=
eta1-gcc3.4-fix.patch=0A=
 delete mode 100644 meta/recipes-support/libusb/libusb-compat-0.1.4/obsolet=
e_automake_macros.patch=0A=
 rename meta/recipes-support/libusb/{libusb-compat_0.1.4.bb =3D> libusb-com=
pat_0.1.5.bb} (78%)=0A=
 rename meta/recipes-support/nspr/{nspr_4.9.6.bb =3D> nspr_4.10.bb} (94%)=
=0A=
=0A=
--=0A=
1.8.1.4=0A=
=0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=

