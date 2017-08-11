Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F2D197821A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 10:52:01 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Aug 2017 03:52:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,357,1498546800"; d="scan'208";a="1002559034"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga003.jf.intel.com with ESMTP; 11 Aug 2017 03:52:01 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Aug 2017 13:51:54 +0300
Message-Id: <cover.1502447434.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH 0/5] Support signed RPM package feeds
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
X-List-Received-Date: Fri, 11 Aug 2017 10:52:02 -0000

This patchset re-enabled support for signed RPM package feeds, a feature that
was disabled in dnf transition. It also extends the dnf selftest to cover
signed package feeds (in addition to fixing the testcase which was not being
run at all because of invalid naming).

The second patch pulls in new dependencies. On core-image-minimal (qemux86) the
addition of gnupg also pulls 6 other packages, increasing the rootfs disk
footprint ca. 9MB.

The following changes since commit df7f5221a56118da7654476f072c37ae1e75dc50:

  libinput: Upgrade 1.7.3 -> 1.8.1 (2017-08-09 09:25:47 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/fixes-11209
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=marquiz/fixes-11209

Markus Lehtonen (5):
  lib/oe/package_manager: re-implement rpm feed signing
  dnf: rrecommend gnupg
  oeqa: fix dnf tests
  oeqa: fix temp file handling in dnf package feed test
  dnf: expand dnf selftest to test signed package feeds

 meta-selftest/files/signing/key.passphrase          |  1 +
 .../cases/{dnf-runtime.py => dnf_runtime.py}        | 21 ++++++++++++++++++---
 meta/lib/oe/package_manager.py                      | 14 +++++++++++++-
 meta/lib/oeqa/selftest/cases/runtime_test.py        | 15 +++++++++++++--
 meta/recipes-devtools/dnf/dnf_2.5.1.bb              |  2 ++
 5 files changed, 47 insertions(+), 6 deletions(-)
 create mode 100644 meta-selftest/files/signing/key.passphrase
 rename meta-selftest/lib/oeqa/runtime/cases/{dnf-runtime.py => dnf_runtime.py} (64%)

-- 
2.12.3


