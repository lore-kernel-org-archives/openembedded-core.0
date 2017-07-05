Return-Path: <swee.aun.khor@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E23DD6FEFE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 07:07:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jul 2017 00:07:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,315,1496127600"; d="scan'208";a="1148285518"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by orsmga001.jf.intel.com with ESMTP; 06 Jul 2017 00:07:17 -0700
From: swee.aun.khor@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Jul 2017 16:56:31 -0700
Message-Id: <cover.1499127835.git.swee.aun.khor@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/7] Support combination of MUSL and x32 build
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
X-List-Received-Date: Thu, 06 Jul 2017 07:07:17 -0000

From: sweeaun <swee.aun.khor@intel.com>

Modified infrastructure (bbclass) and fixed bugs on multiple recipes to 
enable combination of MUSL and x32 build.

The following changes since commit 98099349e358a9caaec8ec81f0d4abe588909cfe:

  bitbake: npm fetcher: fix unknown variable name. (2017-06-29 14:33:42 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib sweeaun/musl_x32_support
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sweeaun/musl_x32_support

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
 meta/recipes-connectivity/openssl/openssl.inc      |  6 +++--
 meta/recipes-devtools/perl/perl_5.24.1.bb          |  2 +-
 .../0001-libffi-Support-musl-x32-build.patch       | 29 ++++++++++++++++++++++
 meta/recipes-support/libffi/libffi_3.2.1.bb        |  1 +
 8 files changed, 44 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-support/libffi/libffi/0001-libffi-Support-musl-x32-build.patch

-- 
2.7.4


