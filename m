Return-Path: <swee.aun.khor@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1913377CDB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 10:54:26 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Jul 2017 03:54:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,322,1496127600"; d="scan'208";a="876375110"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Jul 2017 03:54:26 -0700
From: swee.aun.khor@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 20:43:46 -0700
Message-Id: <cover.1499394173.git.swee.aun.khor@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2 0/7] Support combination of MUSL and x32 build
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
X-List-Received-Date: Fri, 07 Jul 2017 10:54:27 -0000

From: sweeaun <swee.aun.khor@intel.com>

Modified infrastructure (bbclass) and fixed bugs on multiple recipes to 
enable combination of MUSL and x32 build.

The following changes since commit 754c03006943a219ffd417c36ab909b464f57f67:

  local.conf.sample: drop image-swab reference (2017-07-06 15:03:10 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib sweeaun/muslx32_patch2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sweeaun/muslx32_patch2

sweeaun (7):
  insane.bbclass: Support musl-x32
  siteinfo.bbclass: Support musl-x32
  gnu-efi: Support musl-x32 build
  grub-efi: Support musl-x32
  openssl: Support musl-x32 build
  perl: Support musl-x32 build
  libffi: Support musl-x32 build

 meta/classes/insane.bbclass                        |  5 +++-
 meta/classes/siteinfo.bbclass                      |  2 ++
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb          |  1 +
 meta/recipes-bsp/grub/grub-efi_2.02.bb             |  2 ++
 meta/recipes-connectivity/openssl/openssl.inc      |  5 ++--
 meta/recipes-devtools/perl/perl_5.24.1.bb          |  2 +-
 .../0001-libffi-Support-musl-x32-build.patch       | 30 ++++++++++++++++++++++
 meta/recipes-support/libffi/libffi_3.2.1.bb        |  1 +
 8 files changed, 44 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-support/libffi/libffi/0001-libffi-Support-musl-x32-build.patch

-- 
2.7.4


