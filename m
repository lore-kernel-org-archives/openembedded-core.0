Return-Path: <swee.aun.khor@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E13D17827F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 03:40:07 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jul 2017 20:40:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,382,1496127600"; d="scan'208";a="113344705"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by orsmga002.jf.intel.com with ESMTP; 19 Jul 2017 20:40:08 -0700
From: swee.aun.khor@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jul 2017 13:29:40 -0700
Message-Id: <cover.1500495522.git.swee.aun.khor@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/2] Support MUSL-x32 build for openssl and libffi
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
X-List-Received-Date: Thu, 20 Jul 2017 03:40:08 -0000

From: sweeaun <swee.aun.khor@intel.com>

Modification to enable MUSL-x32 build for openssl and libffi recipes.

The following changes since commit 57f606b12b339c82e6981d7ac32450c00d787085:

  libgcrypt: upgrade to 1.7.8 (2017-07-19 15:13:40 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib sweeaun/musl_x32_patch3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sweeaun/musl_x32_patch3

sweeaun (2):
  openssl: Support musl-x32 build
  libffi: Support musl-x32 build

 meta/recipes-connectivity/openssl/openssl.inc      |  5 ++--
 .../0001-libffi-Support-musl-x32-build.patch       | 30 ++++++++++++++++++++++
 meta/recipes-support/libffi/libffi_3.2.1.bb        |  1 +
 3 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libffi/libffi/0001-libffi-Support-musl-x32-build.patch

-- 
2.7.4


