Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 49AE46E667
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 15:11:58 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 14 Jul 2016 08:11:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,363,1464678000"; d="scan'208";a="139215641"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by fmsmga004.fm.intel.com with ESMTP; 14 Jul 2016 08:11:41 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jul 2016 07:05:20 +0000
Message-Id: <cover.1468476610.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCHv2 0/1] selftest: Add test to check imports from other layers
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
X-List-Received-Date: Thu, 14 Jul 2016 15:12:00 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This patch adds a test to check selftest itself, the
feature to import tests from other layers.

Changes in v2:

- Renamed tests based on Benjamin's comment

The following changes since commit 6bb3069eeff76373041f8da08418386fe5ef5897:

  tune-ppce500mc.inc: pass -mcpu=e500mc for ppce500mc kernel compile (2016-07-10 14:12:17 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug9770v2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug9770v2

Mariano Lopez (1):
  selftest/seltest.py: Add test to check imports from other layers

 meta-selftest/lib/oeqa/selftest/external-layer.py | 14 ++++++++++++++
 meta/lib/oeqa/selftest/selftest.py                | 19 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta-selftest/lib/oeqa/selftest/external-layer.py
 create mode 100644 meta/lib/oeqa/selftest/selftest.py

-- 
2.6.6


