Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SfC89-0000s6-35
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 17:38:41 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Jun 2012 08:28:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="112132902"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.138])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Jun 2012 08:28:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jun 2012 08:27:55 -0700
Message-Id: <cover.1339687522.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH 0/6] Various bug fixes some are 1.2.1 eligible
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Jun 2012 15:38:41 -0000

Richard, Scott

There are various fixes that have been tested and could be include
in both 1.2.1 and possible an m1 rc2.

The quilt, eglibc and gcc-target and beecrypt are 1.2.1 material

Sau!

The following changes since commit c4d0b1c5438039dab07103c151c0c5a76a4c9499:

  connman: bump PR and add some comments (2012-06-13 13:11:11 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fixes

Saul Wold (6):
  busybox: Add check for wifi/bluetooth to enable rfkill
  curl: enable ssl support
  quilt: added ac_cv_path_BASH to CACHED_CONFIGUREVARS
  eglibc: added ac_cv_path_ to CACHED_CONFIGUREVARS
  gcc-target: ensure target packages have the correct virtual package
    names
  beecrypt: add patch for build issue on Fedora 17

 meta/recipes-core/busybox/busybox.inc              |    2 ++
 meta/recipes-core/eglibc/eglibc.inc                |    2 ++
 meta/recipes-core/eglibc/eglibc_2.13.bb            |    2 +-
 meta/recipes-core/eglibc/eglibc_2.15.bb            |    2 +-
 meta/recipes-devtools/gcc/gcc-4.7.inc              |    2 +-
 meta/recipes-devtools/gcc/gcc-package-runtime.inc  |    4 ++++
 meta/recipes-devtools/quilt/quilt_0.60.bb          |    5 ++++-
 .../beecrypt/beecrypt/fix-for-gcc-4.7.patch        |   13 +++++++++++++
 meta/recipes-support/beecrypt/beecrypt_4.2.1.bb    |    5 +++--
 meta/recipes-support/curl/curl_7.24.0.bb           |   10 +++++-----
 10 files changed, 36 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-support/beecrypt/beecrypt/fix-for-gcc-4.7.patch

-- 
1.7.7.6



