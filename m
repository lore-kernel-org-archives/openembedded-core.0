Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id D212965CCC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 15:16:43 +0000 (UTC)
Received: by padck2 with SMTP id ck2so76597583pad.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 08:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=uSZgSE/XW6sT3gOkCkJncO7m7puyRWpYvdTUYe6cBYk=;
	b=DSm6XWSIXlp9PSPSfuKYPQpOoiMiqVM+LA+TMHZeSBQMpKN+aJzCagLR9LRzOEksUd
	W16olXTsd+Hnf3o4L2GW08Ubqv3ak+5/1d/ZZO487L+/hLnlDNR2Qu9ZYYbMPp0TsHqF
	MbbnHJKZgpbrWEtX7xJXSzMIcFy+aUZKTvb3a/Bk7XsoFjC7YGW3JxTwWrBIFEm58OF6
	0F219riH81fT7pgwB/tjhY5+C6yGGXbyfcdB9r4OHcWcPeUxKAiTBNelxZUh1sGlY8YY
	4Q/13i/CyT7IaC2FlroEWU38fsI21E2/UU1HhS2LNssHbvS2sgW1HSqN5P1gm3IiFntN
	gDkg==
X-Received: by 10.66.249.101 with SMTP id yt5mr40311149pac.116.1437232603885; 
	Sat, 18 Jul 2015 08:16:43 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	a10sm14627311pdn.57.2015.07.18.08.16.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jul 2015 08:16:42 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 1638EFC12E8; Sat, 18 Jul 2015 08:16:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jul 2015 08:16:07 -0700
Message-Id: <cover.1437232180.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 00/25] Dizzy next for .3
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
X-List-Received-Date: Sat, 18 Jul 2015 15:16:45 -0000

Please consider these for the 1.7.3 release

The following changes since commit 5f0d25152bac2d3798663a4ebfdd2df24060f153:

  openssl: upgrade to 1.0.1p (2015-07-15 15:25:43 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/dizzy-next
  http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/dizzy-nex

Andre McCurdy (1):
  mesa: update --with-llvm-shared-libs configure option

Armin Kuster (3):
  tzcode: update to 2015d
  tzdata: update to 2015d
  curl: add a few missing security fixes

Cristian Iorga (1):
  neard: fix the install path in init scripts

Haris Okanovic (1):
  glibc: CVE-2015-1781: resolv/nss_dns/dns-host.c buffer overflow

Jonathan Liu (1):
  qt4: add patch for BMP denial-of-service vulnerability

Jussi Kukkonen (1):
  dbus: CVE-2015-0245: prevent forged ActivationFailure

Kai Kang (2):
  qemu: fix CVE-2015-3456
  gpgme: fix CVE-2014-3564

Leonardo Sandoval (2):
  rpm: Fix CVE-2014-8118
  rpm: Fix CVE-2013-6435

Martin Jansa (3):
  squashfs-tools: build and install unsquashfs as well
  e2fsprogs: install populate-extfs.sh
  test-dependencies.sh: strip only .bb suffix

Maxin B. John (1):
  curl: several security fixes

Ng Wei Tee (1):
  linux-firmware: Package Marvell pci8897 and usb8897 firmware

Robert Yang (2):
  perf: add LIBNUMA_DEFINES
  license.bbclass: set dirs for do_populate_lic_setscene

Roy Li (4):
  ppp: Security Advisory - CVE-2015-3310
  unzip: Security Advisory -CVE-2014-9636 and CVE-2015-1315
  unzip: fix four CVE defects
  unzip: drop 12-cve-2014-9636-test-compr-eb.patch

Yue Tao (2):
  libsndfile: Security Advisory - libsndfile - CVE-2014-9496
  libxml2: Security Advisory - libxml2 - CVE-2015-1819

 meta/classes/license.bbclass                       |   2 +
 meta/recipes-connectivity/neard/neard.inc          |   2 +-
 .../ppp/ppp/fix-CVE-2015-3310.patch                |  29 ++
 meta/recipes-connectivity/ppp/ppp_2.4.6.bb         |   1 +
 meta/recipes-core/dbus/dbus.inc                    |   1 +
 ...015-0245-prevent-forged-ActivationFailure.patch |  48 +++
 ...81-resolv-nss_dns-dns-host.c-buffer-overf.patch |  43 +++
 meta/recipes-core/glibc/glibc_2.20.bb              |   3 +
 meta/recipes-core/libxml/libxml2.inc               |   1 +
 ...19-Enforce-the-reader-to-run-in-constant-.patch | 181 +++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb |   2 +
 .../qemu/qemu/qemu-CVE-2015-3456.patch             |  92 +++++
 meta/recipes-devtools/qemu/qemu_2.1.0.bb           |   1 +
 .../rpm/rpm/rpm-CVE-2013-6435.patch                | 109 ++++++
 .../rpm/rpm/rpm-CVE-2014-8118.patch                |  43 +++
 meta/recipes-devtools/rpm/rpm_4.11.2.bb            |   2 +
 .../squashfs-tools/squashfs-tools_4.3.bb           |   3 +-
 .../recipes-extended/tzcode/tzcode-native_2015d.bb |  11 +
 meta/recipes-extended/tzdata/tzdata_2015d.bb       |   6 +
 .../06-unzip60-alt-iconv-utf8_CVE-2015-1315.patch  | 402 ++++++++++++++++++++
 .../unzip/09-cve-2014-8139-crc-overflow.patch      |  52 +++
 .../unzip/10-cve-2014-8140-test-compr-eb.patch     |  33 ++
 .../unzip/11-cve-2014-8141-getzip64data.patch      | 144 +++++++
 .../unzip/unzip/unzip-6.0_overflow3.diff           |  45 +++
 meta/recipes-extended/unzip/unzip_6.0.bb           |   8 +-
 meta/recipes-graphics/mesa/mesa.inc                |   2 +-
 .../linux-firmware/linux-firmware_git.bb           |  19 +-
 meta/recipes-kernel/perf/perf.bb                   |   4 +-
 ...src-sd2.c-Fix-segfault-in-SD2-RSRC-parser.patch | 211 +++++++++++
 ...c-Fix-two-potential-buffer-read-overflows.patch |  49 +++
 .../libsndfile/libsndfile1_1.0.25.bb               |   5 +-
 meta/recipes-qt/qt4/qt4-4.8.6.inc                  |   1 +
 ...ion-by-zero-when-processing-malformed-BMP.patch |  44 +++
 meta/recipes-support/curl/curl/CVE-2014-3707.patch | 416 +++++++++++++++++++++
 meta/recipes-support/curl/curl/CVE-2014-8150.patch |  29 ++
 meta/recipes-support/curl/curl/CVE-2015-3143.patch |  38 ++
 meta/recipes-support/curl/curl/CVE-2015-3144.patch |  45 +++
 meta/recipes-support/curl/curl/CVE-2015-3145.patch |  70 ++++
 meta/recipes-support/curl/curl/CVE-2015-3153.patch |  90 +++++
 meta/recipes-support/curl/curl_7.37.1.bb           |   6 +
 .../gpgme-1.4.3/gpgme-fix-CVE-2014-3564.patch      |  56 +++
 meta/recipes-support/gpgme/gpgme_1.4.3.bb          |   4 +-
 scripts/test-dependencies.sh                       |   4 +-
 43 files changed, 2345 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/fix-CVE-2015-3310.patch
 create mode 100644 meta/recipes-core/dbus/dbus/CVE-2015-0245-prevent-forged-ActivationFailure.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-1781-resolv-nss_dns-dns-host.c-buffer-overf.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015-1819-Enforce-the-reader-to-run-in-constant-.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-CVE-2015-3456.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-CVE-2013-6435.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-CVE-2014-8118.patch
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2015d.bb
 create mode 100644 meta/recipes-extended/tzdata/tzdata_2015d.bb
 create mode 100644 meta/recipes-extended/unzip/unzip/06-unzip60-alt-iconv-utf8_CVE-2015-1315.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/09-cve-2014-8139-crc-overflow.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/10-cve-2014-8140-test-compr-eb.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/11-cve-2014-8141-getzip64data.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/unzip-6.0_overflow3.diff
 create mode 100644 meta/recipes-multimedia/libsndfile/files/0001-src-sd2.c-Fix-segfault-in-SD2-RSRC-parser.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/files/0001-src-sd2.c-Fix-two-potential-buffer-read-overflows.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0034-Fix-a-division-by-zero-when-processing-malformed-BMP.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2014-3707.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2014-8150.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2015-3143.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2015-3144.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2015-3145.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2015-3153.patch
 create mode 100644 meta/recipes-support/gpgme/gpgme-1.4.3/gpgme-fix-CVE-2014-3564.patch

-- 
1.9.1


