Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 51318606A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 21:36:14 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 20 Jul 2016 14:36:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,396,1464678000"; d="scan'208";a="737410492"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 20 Jul 2016 14:36:13 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2016 13:29:39 +0000
Message-Id: <cover.1469021121.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCHv3 0/1] selftest: Add test to check imports from other layers
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
X-List-Received-Date: Wed, 20 Jul 2016 21:36:16 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This patch adds a test to check selftest itself, the
feature to import tests from other layers.

Changes in v2:

- Renamed tests based on Benjamin's comment

Changes in v3:

- Refactor test to not use oe-selftest within oe-selftest

The following changes since commit 1bf1e2c208ad137b9b91ca0687d6fb9486045dfd:

  bitbake: toaster-tests: add class SeleniumTestCaseBase for browser tests (2016-07-20 10:38:52 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug9770v3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug9770v3

Mariano Lopez (1):
  selftest/seltest.py: Add test to check imports from other layers

 meta-selftest/lib/oeqa/selftest/external-layer.py | 14 +++++++
 meta/lib/oeqa/selftest/selftest.py                | 50 +++++++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 meta-selftest/lib/oeqa/selftest/external-layer.py
 create mode 100644 meta/lib/oeqa/selftest/selftest.py

-- 
2.6.6


