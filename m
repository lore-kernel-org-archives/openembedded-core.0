Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id ED64178433
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 11:34:58 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 15 Aug 2017 04:35:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,377,1498546800"; d="scan'208";a="1205843427"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 15 Aug 2017 04:34:59 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Aug 2017 14:34:49 +0300
Message-Id: <cover.1502795847.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH v4 0/8] Support signed RPM package feeds
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
X-List-Received-Date: Tue, 15 Aug 2017 11:34:59 -0000

Fourth iteration of the patchset enabling signed RPM package feeds.
Changes since v3:
- new patch for the 'signing-keys' recipe, fixing a likely failure in the dnf
  package feed selftest
- one comment line added in "dnf: expand dnf selftest to test signed package feeds"
  patch

The following changes since commit 5a25ed1071f0d9b7d95edcc2b5b4545f960d5f95:

  image-prelink: Disable for musl images (2017-08-11 08:14:19 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/fixes-11209
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=marquiz/fixes-11209

Markus Lehtonen (8):
  lib/oe/package_manager: re-implement rpm feed signing
  dnf: rrecommend gnupg
  signing-keys: delete unused tasks
  sign_package_feed.bbclass: install signing key into rootfs
  package_manager.py: enable dnf's repo_gpgcheck if feed signing is
    enabled
  oeqa: fix dnf tests
  oeqa: fix temp file handling in dnf package feed test
  dnf: expand dnf selftest to test signed package feeds

 meta-selftest/files/signing/key.passphrase         |  1 +
 .../cases/{dnf-runtime.py => dnf_runtime.py}       | 13 ++++++++----
 meta/classes/sign_package_feed.bbclass             |  3 +++
 meta/lib/oe/package_manager.py                     | 24 +++++++++++++++++++---
 meta/lib/oeqa/selftest/cases/runtime_test.py       | 14 +++++++++++--
 meta/recipes-core/meta/signing-keys.bb             |  8 ++++++++
 meta/recipes-devtools/dnf/dnf_2.6.3.bb             |  2 ++
 7 files changed, 56 insertions(+), 9 deletions(-)
 create mode 100644 meta-selftest/files/signing/key.passphrase
 rename meta-selftest/lib/oeqa/runtime/cases/{dnf-runtime.py => dnf_runtime.py} (77%)

-- 
2.12.3


