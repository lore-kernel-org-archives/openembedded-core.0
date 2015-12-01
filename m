Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 71160605B3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 09:44:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tB19ilbH023198
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Dec 2015 01:44:47 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 1 Dec 2015 01:44:47 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Dec 2015 01:44:39 -0800
Message-ID: <cover.1448962573.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/8] [jethro] 8 patches for jethro
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
X-List-Received-Date: Tue, 01 Dec 2015 09:44:47 -0000
Content-Type: text/plain

Hello,

Here are 8 patches for jethro. There are still a few patches that are
requested but not included here because they have not been merged by
master by now.

All these patches have already been merged by master.

// Robert

The following changes since commit e44ed8c18e395b9c055aefee113b90708e8a8a2f:

  build-appliance-image: Update to jethro head revision (2015-11-03 14:02:57 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/jethro-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/HEAD

Alejandro del Castillo (1):
  opkg: add cache filename length fixes

Armin Kuster (2):
  libxslt: CVE-2015-7995
  libxml2: fix CVE-2015-7942 and CVE-2015-8035

Mark Hatle (1):
  binutils: Fix octeon3 disassembly patch

Maxin B. John (1):
  libsndfile: fix CVE-2014-9756

Ross Burton (3):
  libarchive: rename patch to reflect CVE
  readline: rename patch to contain CVE reference
  unzip: rename patch to reflect CVE fix

 meta/recipes-core/libxml/libxml2.inc               |    2 +
 .../libxml/libxml2/CVE-2015-7942.patch             |   55 +++++++++
 .../libxml/libxml2/CVE-2015-8035.patch             |   41 +++++++
 ...ne63-003.patch => readline-cve-2014-2524.patch} |    0
 meta/recipes-core/readline/readline_6.3.bb         |    2 +-
 .../binutils/binutils/binutils-octeon3.patch       |    2 +-
 ...ng_util-New-file-with-bin_to_hex-function.patch |  122 ++++++++++++++++++++
 .../opkg/0002-md5-Add-md5_to_string-function.patch |  110 ++++++++++++++++++
 ...0003-sha256-Add-sha256_to_string-function.patch |  110 ++++++++++++++++++
 ...4-opkg_download-Use-short-cache-file-name.patch |   85 ++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.3.0.bb           |    4 +
 ...option.patch => libarchive-CVE-2015-2304.patch} |    0
 .../libarchive/libarchive_3.1.2.bb                 |    2 +-
 ...nzip-6.0_overflow3.diff => cve-2014-9636.patch} |    0
 meta/recipes-extended/unzip/unzip_6.0.bb           |    2 +-
 .../files/libsndfile-fix-CVE-2014-9756.patch       |   24 ++++
 .../libsndfile/libsndfile1_1.0.25.bb               |    1 +
 .../libxslt/libxslt/CVE-2015-7995.patch            |   33 ++++++
 meta/recipes-support/libxslt/libxslt_1.1.28.bb     |    3 +-
 19 files changed, 593 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7942.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8035.patch
 rename meta/recipes-core/readline/readline-6.3/{readline63-003.patch => readline-cve-2014-2524.patch} (100%)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-string_util-New-file-with-bin_to_hex-function.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/0002-md5-Add-md5_to_string-function.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/0003-sha256-Add-sha256_to_string-function.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/0004-opkg_download-Use-short-cache-file-name.patch
 rename meta/recipes-extended/libarchive/libarchive/{0001-Add-ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS-option.patch => libarchive-CVE-2015-2304.patch} (100%)
 rename meta/recipes-extended/unzip/unzip/{unzip-6.0_overflow3.diff => cve-2014-9636.patch} (100%)
 create mode 100644 meta/recipes-multimedia/libsndfile/files/libsndfile-fix-CVE-2014-9756.patch
 create mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2015-7995.patch

-- 
1.7.9.5


