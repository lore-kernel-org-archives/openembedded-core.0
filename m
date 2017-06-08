Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E0F677827F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 16:32:05 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jun 2017 09:32:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,315,1493708400"; d="scan'208";a="271875651"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.117])
	by fmsmga004.fm.intel.com with ESMTP; 08 Jun 2017 09:32:03 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 11:32:00 -0500
Message-Id: <cover.1496939387.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH 0/7] OEQA, devtool and YP compatible fixes
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
X-List-Received-Date: Thu, 08 Jun 2017 16:32:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 4a7612c7a12b9a381fb8343ba9586272b889fc15:

  buildhistory: skip tests if GitPython module is missing (2017-06-07 16:00:49 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib alimon/simple_patches
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/simple_patches

Aníbal Limón (7):
  devtool/standard: Fix lock in _prep_extract_operation
  scripts/yocto-compat-layer.py: Return non-zero when layer test fail
  scripts/yocto-compat-layer-wrapper: Use realpath of output_log
  oeqa: Change the order to logDetails and logSummary
  oeqa/core/loader: Allow unittest.TestCase's to be executed
  oeqa/cases/oelib: Change default case class to unittest.case.TestCase
  oeqa/core/loader: Fix filtering on test modules with submodules

 meta/classes/testimage.bbclass                |  2 +-
 meta/classes/testsdk.bbclass                  |  4 +-
 meta/lib/oeqa/core/context.py                 |  2 +-
 meta/lib/oeqa/core/loader.py                  | 82 +++++++++++++--------------
 meta/lib/oeqa/core/runner.py                  | 25 ++++----
 meta/lib/oeqa/selftest/cases/oelib/elf.py     |  4 +-
 meta/lib/oeqa/selftest/cases/oelib/license.py |  6 +-
 meta/lib/oeqa/selftest/cases/oelib/path.py    |  4 +-
 meta/lib/oeqa/selftest/cases/oelib/types.py   |  6 +-
 meta/lib/oeqa/selftest/cases/oelib/utils.py   |  6 +-
 meta/lib/oeqa/selftest/context.py             |  2 +-
 scripts/lib/devtool/standard.py               |  1 +
 scripts/yocto-compat-layer-wrapper            | 18 +++++-
 scripts/yocto-compat-layer.py                 |  5 +-
 14 files changed, 95 insertions(+), 72 deletions(-)

-- 
2.1.4


