Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3D5146013D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 22:55:03 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 07 Jul 2016 15:55:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,325,1464678000"; d="scan'208";a="731145095"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Jul 2016 15:55:04 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2016 14:48:54 +0000
Message-Id: <cover.1467902737.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH 0/2] Add selftest to test testexport's SDK feature
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
X-List-Received-Date: Thu, 07 Jul 2016 22:55:05 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This adds a new selftest for testexport in the CI to avoid
breaking SDK functionality.

This depends on:

http://lists.openembedded.org/pipermail/openembedded-core/2016-June/122785.html

The following changes since commit 242d70bf0af2eb56ed6da83d4ec7dce2172ebe70:

  selftest/runtime-test.py: Add test for import test from other layers (2016-07-06 11:37:49 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug9765
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug9765

Mariano Lopez (2):
  lib/oeqa/utils/commands.py: Move updateEnv() from runexported.py
  selftest/runtime-test.py: Add test for testexport SDK feature

 meta/lib/oeqa/runexported.py           | 16 ++-------
 meta/lib/oeqa/selftest/runtime-test.py | 60 +++++++++++++++++++++++++++++++++-
 meta/lib/oeqa/utils/commands.py        | 31 ++++++++++++++++++
 3 files changed, 92 insertions(+), 15 deletions(-)

-- 
2.6.6


