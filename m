Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U3b9w-0004NF-S6
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 00:45:41 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r17NTlo9026768
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2013 15:29:47 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 7 Feb 2013 15:29:46 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Feb 2013 17:56:27 -0600
Message-ID: <cover.1360270199.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [denzil 00/18] Various fixes for Denzil branch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Feb 2013 23:45:41 -0000
Content-Type: text/plain

This patchset includes a number of fixes, backports and related items that
we feel are necessary for Denzil.  (I'm not sure however if further versions
of Denzil are being created!)

(I don't believe any of these patches are applicable to master, a few are
backports from master...)

The following changes since commit 94c375a281378413d24a402ec6a59762d0eb5b85:

    libtasn1: Upgrade to 2.13

are available in the git repository at:

    git://git.yoctoproject.org/poky-contrib mhatle/wr-denzil

Jason Wessel (1):
  qemu-0.15.1: Add addition environment space to boot loader
    qemu-system-mips

Khem Raj (1):
  qemu: Fix illegal instruction errors on e500 emulation

Laurentiu Palcu (1):
  nativesdk-qemu: fix SDK relocation issue

Li Wang (3):
  qemu CVE-2012-3515
  lighttpd: fixing invalid read in valgrind
  lighttpd: CVE-2012-5533

Matthew McClintock (1):
  qemu-0.15.1: add patch to fix compilatation problems on powerpc

Roy.Li (1):
  qemu: backport patch to fix pl031 RTC

Wei Cai (2):
  Summary:Security Advisory - libtiff - CVE-2012-3401
  Summary: Security Advisory - boost - CVE-2012-2677

Yue Tao (6):
  Security Advisory - libexif - CVE-2012-2813
  Security Advisory - libexif - CVE-2012-2812
  Security Advisory - libexif - CVE-2012-2841
  Security Advisory - libexif - CVE-2012-2836
  Security Advisory - libexif - CVE-2012-2837
  Security Advisory - libexif - CVE-2012-2840

Zhai Edwin (1):
  qemu: Add an option to remove host sdl/gl checking

dhall (1):
  Patch ocf-linux.inc to work with the 2010 and 2012 versions

 meta/recipes-connectivity/openssl/ocf-linux.inc    |  11 +-
 .../qemu/qemu-0.15.1/dummy-gl-config.patch         |  31 ++
 .../qemu/qemu-0.15.1/extra_mips_env_space.patch    |  24 +
 .../qemu/qemu-0.15.1/glflags.patch                 |  40 +-
 ...-Actually-raise-interrupt-on-timer-expiry.patch |  41 ++
 .../qemu/qemu-0.15.1/opengl-disable-option.patch   | 137 +++++
 .../qemu-0.15.1/ppc-s500-set-invalid-mask.patch    | 610 +++++++++++++++++++++
 .../qemu/qemu-0.15.1/qemu-CVE-2012-3515.patch      | 129 +++++
 .../qemu/qemu-0.15.1/relocatable_sdk.patch         |  34 ++
 meta/recipes-devtools/qemu/qemu.inc                |  23 +-
 meta/recipes-devtools/qemu/qemu_0.15.1.bb          |   9 +-
 .../lighttpd/files/lighttpd-CVE-2012-5533.patch    | 120 ++++
 .../lighttpd-fixing-invalid-read-in-valgrind.patch |  33 ++
 meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb  |   4 +-
 .../libtiff/files/libtiff-CVE-2012-3401.patch      |  10 +
 meta/recipes-multimedia/libtiff/tiff_4.0.1.bb      |   3 +-
 meta/recipes-support/boost/boost_1.49.0.bb         |   5 +-
 .../boost/files/boost-CVE-2012-2677.patch          |  30 +
 .../libexif/0001-libexif-CVE-2012-2813.patch       |  33 ++
 .../libexif/0002-libexif-CVE-2012-2812.patch       |  87 +++
 .../libexif/0003-libexif-CVE-2012-2841.patch       |  47 ++
 .../libexif/0004-libexif-CVE-2012-2836.patch       | 140 +++++
 .../libexif/0005-libexif-CVE-2012-2837.patch       | 114 ++++
 .../libexif/0006-libexif-CVE-2012-2840.patch       |  17 +
 meta/recipes-support/libexif/libexif_0.6.20.bb     |  10 +-
 25 files changed, 1704 insertions(+), 38 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/dummy-gl-config.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/extra_mips_env_space.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/hw-pl031-Actually-raise-interrupt-on-timer-expiry.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/opengl-disable-option.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/ppc-s500-set-invalid-mask.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/qemu-CVE-2012-3515.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/relocatable_sdk.patch
 create mode 100644 meta/recipes-extended/lighttpd/files/lighttpd-CVE-2012-5533.patch
 create mode 100644 meta/recipes-extended/lighttpd/files/lighttpd-fixing-invalid-read-in-valgrind.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/libtiff-CVE-2012-3401.patch
 create mode 100644 meta/recipes-support/boost/files/boost-CVE-2012-2677.patch
 create mode 100644 meta/recipes-support/libexif/libexif/0001-libexif-CVE-2012-2813.patch
 create mode 100644 meta/recipes-support/libexif/libexif/0002-libexif-CVE-2012-2812.patch
 create mode 100644 meta/recipes-support/libexif/libexif/0003-libexif-CVE-2012-2841.patch
 create mode 100644 meta/recipes-support/libexif/libexif/0004-libexif-CVE-2012-2836.patch
 create mode 100644 meta/recipes-support/libexif/libexif/0005-libexif-CVE-2012-2837.patch
 create mode 100644 meta/recipes-support/libexif/libexif/0006-libexif-CVE-2012-2840.patch

-- 
1.8.1.2.545.g2f19ada



