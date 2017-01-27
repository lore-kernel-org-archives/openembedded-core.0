Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B953A77456
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 20:14:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jan 2017 12:14:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,297,1477983600"; d="scan'208";a="36462707"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by orsmga002.jf.intel.com with ESMTP; 27 Jan 2017 12:14:43 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 12:10:37 +0000
Message-Id: <cover.1485515180.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
MIME-Version: 1.0
Subject: [PATCHv2 0/5] Fix bugs found within runtime testing
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
X-List-Received-Date: Fri, 27 Jan 2017 20:14:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This will fix some bugs found in testimage when executing tests
from images downloaded from the autobuilders.

Changes in v2:

- Fix some test cases that were changed during the migration.
- Add createrepo-native as dependency of test image.
- Fix TEST_SUITES in core-image-sato-sdk and core-image-lsb-sdk.
- Renamed syslog test to oe_syslog to make it run on debian/ubuntu.

The following changes since commit 0150dddeaf901c91d32be093efd0348a344fb545:

  sanity.conf: Update minimum bitbake version requirements to 1.33.0 (2017-01-27 10:42:39 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug10964
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug10964

Aníbal Limón (2):
  oeqa/core/context.py: Add validation for run-tests option
  oeqa/runtime/cases: Rename syslog module to oe_syslog

Mariano Lopez (3):
  runtime/cases: Fix case numbers, missing cases and unused classes
  runtime/cases/smart.py: Check for IMAGE_PKGTYPE instead of
    PACKAGE_CLASSES
  testimage.bbclass: Allow to run tests on autobuilder's images

 meta/classes/testimage.bbclass                       | 20 ++++++++++++--------
 meta/lib/oeqa/core/context.py                        |  6 +++++-
 meta/lib/oeqa/core/utils/misc.py                     |  7 +++++++
 meta/lib/oeqa/runtime/cases/connman.py               |  2 +-
 meta/lib/oeqa/runtime/cases/gcc.py                   |  3 ---
 meta/lib/oeqa/runtime/cases/multilib.py              |  2 +-
 .../oeqa/runtime/cases/{syslog.py => oe_syslog.py}   | 13 +++++++++++--
 meta/lib/oeqa/runtime/cases/smart.py                 |  2 +-
 8 files changed, 38 insertions(+), 17 deletions(-)
 rename meta/lib/oeqa/runtime/cases/{syslog.py => oe_syslog.py} (82%)

-- 
2.6.6


