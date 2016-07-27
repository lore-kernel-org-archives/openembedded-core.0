Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id ABF17607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 13:57:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Jul 2016 06:57:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,430,1464678000"; d="scan'208";a="1003519717"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by orsmga001.jf.intel.com with ESMTP; 27 Jul 2016 06:57:13 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2016 05:50:26 +0000
Message-Id: <cover.1469598413.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCHv2 0/1] Add runtime test for import test from other layers
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
X-List-Received-Date: Wed, 27 Jul 2016 13:57:14 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Changes in v2:

- Fix features needed for bitbake
- Use full-cmdline instead of sato
- Tested in local autobuilders before submitting the patch

The following changes since commit 039f47ad197a9a53109c9f3deadd9c35e62c056d:

  uclibc: remove meta-yocto-bsp append (2016-07-26 08:56:32 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug9764v2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug9764v2

Mariano Lopez (1):
  selftest/runtime-test.py: Add test for import test from other layers

 meta-selftest/lib/oeqa/runtime/selftest.json       |  6 +++++
 meta-selftest/lib/oeqa/runtime/selftest.py         | 31 ++++++++++++++++++++++
 .../selftest/{testexport.py => runtime-test.py}    | 20 ++++++++++++++
 3 files changed, 57 insertions(+)
 create mode 100644 meta-selftest/lib/oeqa/runtime/selftest.json
 create mode 100644 meta-selftest/lib/oeqa/runtime/selftest.py
 rename meta/lib/oeqa/selftest/{testexport.py => runtime-test.py} (74%)

-- 
2.6.6


