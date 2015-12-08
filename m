Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6E3266612D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 09:56:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tB89uiTo017880
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Dec 2015 01:56:44 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 8 Dec 2015 01:56:43 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Dec 2015 01:56:28 -0800
Message-ID: <cover.1449568553.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 00/15] [jethro] Consolidated pull
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
X-List-Received-Date: Tue, 08 Dec 2015 09:56:47 -0000
Content-Type: text/plain

The following changes since commit e44ed8c18e395b9c055aefee113b90708e8a8a2f:

  build-appliance-image: Update to jethro head revision (2015-11-03 14:02:57 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/jethro-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/jethro-next

Alejandro del Castillo (1):
  opkg: add cache filename length fixes

Armin Kuster (1):
  libxslt: CVE-2015-7995

Bhuvanchandra DV (1):
  linux-firmware: rtl8192cx: Add latest available firmware

Jussi Kukkonen (1):
  pulseaudio: Fix HDMI profile selection

Li Zhou (1):
  rpcbind: Security Advisory - rpcbind - CVE-2015-7236

Mark Hatle (1):
  binutils: Fix octeon3 disassembly patch

Maxin B. John (1):
  libsndfile: fix CVE-2014-9756

Mike Crowe (1):
  allarch: Force TARGET_*FLAGS variable values

Ng, Mei Yeen (2):
  init-install-efi: fix script for eMMC installation
  init-install-efi: fix script for gummiboot loader

Ross Burton (3):
  libarchive: rename patch to reflect CVE
  readline: rename patch to contain CVE reference
  unzip: rename patch to reflect CVE fix

Wenzong Fan (2):
  subversion: fix CVE-2015-3184
  subversion: fix CVE-2015-3187

 meta/classes/allarch.bbclass                       |    4 +
 .../initrdscripts/files/init-install-efi.sh        |    9 +-
 ...ne63-003.patch => readline-cve-2014-2524.patch} |    0
 meta/recipes-core/readline/readline_6.3.bb         |    2 +-
 .../binutils/binutils/binutils-octeon3.patch       |    2 +-
 ...ng_util-New-file-with-bin_to_hex-function.patch |  122 ++
 .../opkg/0002-md5-Add-md5_to_string-function.patch |  110 +
 ...0003-sha256-Add-sha256_to_string-function.patch |  110 +
 ...4-opkg_download-Use-short-cache-file-name.patch |   85 +
 meta/recipes-devtools/opkg/opkg_0.3.0.bb           |    4 +
 .../subversion-CVE-2015-3184.patch                 | 2094 ++++++++++++++++++++
 .../subversion-CVE-2015-3187.patch                 |  346 ++++
 .../subversion/subversion_1.8.13.bb                |    2 +
 ...option.patch => libarchive-CVE-2015-2304.patch} |    0
 .../libarchive/libarchive_3.1.2.bb                 |    2 +-
 .../rpcbind/rpcbind/cve-2015-7236.patch            |   83 +
 meta/recipes-extended/rpcbind/rpcbind_0.2.3.bb     |    1 +
 ...nzip-6.0_overflow3.diff => cve-2014-9636.patch} |    0
 meta/recipes-extended/unzip/unzip_6.0.bb           |    2 +-
 .../linux-firmware/linux-firmware_git.bb           |    4 +-
 .../files/libsndfile-fix-CVE-2014-9756.patch       |   24 +
 .../libsndfile/libsndfile1_1.0.25.bb               |    1 +
 .../0001-card-add-pa_card_profile.ports.patch      |  245 +++
 ...oth-fail-if-user-requested-profile-doesn-.patch |   60 +
 ...-move-profile-selection-after-pa_card_new.patch |  363 ++++
 ...vailability-for-some-unavailable-profiles.patch |   75 +
 .../pulseaudio/pulseaudio_6.0.bb                   |    4 +
 .../libxslt/libxslt/CVE-2015-7995.patch            |   33 +
 meta/recipes-support/libxslt/libxslt_1.1.28.bb     |    3 +-
 29 files changed, 3779 insertions(+), 11 deletions(-)
 rename meta/recipes-core/readline/readline-6.3/{readline63-003.patch => readline-cve-2014-2524.patch} (100%)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-string_util-New-file-with-bin_to_hex-function.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/0002-md5-Add-md5_to_string-function.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/0003-sha256-Add-sha256_to_string-function.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/0004-opkg_download-Use-short-cache-file-name.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.8.13/subversion-CVE-2015-3184.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.8.13/subversion-CVE-2015-3187.patch
 rename meta/recipes-extended/libarchive/libarchive/{0001-Add-ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS-option.patch => libarchive-CVE-2015-2304.patch} (100%)
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/cve-2015-7236.patch
 rename meta/recipes-extended/unzip/unzip/{unzip-6.0_overflow3.diff => cve-2014-9636.patch} (100%)
 create mode 100644 meta/recipes-multimedia/libsndfile/files/libsndfile-fix-CVE-2014-9756.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-card-add-pa_card_profile.ports.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0002-alsa-bluetooth-fail-if-user-requested-profile-doesn-.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0003-card-move-profile-selection-after-pa_card_new.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0004-alsa-set-availability-for-some-unavailable-profiles.patch
 create mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2015-7995.patch

-- 
1.7.9.5


