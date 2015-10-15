Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 38322769A7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 14:39:56 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Oct 2015 07:39:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,686,1437462000"; d="scan'208";a="827690435"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by fmsmga002.fm.intel.com with ESMTP; 15 Oct 2015 07:39:55 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Oct 2015 06:29:36 +0000
Message-Id: <cover.1444890026.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH 0/2] Fix setUp and tearDown for runtime tests
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
X-List-Received-Date: Thu, 15 Oct 2015 14:39:57 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Some runtime tests will overwrite the setUp and tearDown methods
and this will cause the parent's method to not run at all. These
changes will fix the setUp and tearDown methods for the child classes.
 
The following changes since commit d302c98822efe2cb78a63b620aed1b94b4ed4a68:

  bitbake: toaster: Fix missing tooltips from layers on project configuration page (2015-10-13 15:35:49 +0300)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug8465
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug8465

Mariano Lopez (2):
  oetest: Add tearDownLocal class
  oeqa/runtime: Fix setUp and tearDown methods

 meta/lib/oeqa/oetest.py               | 6 ++++++
 meta/lib/oeqa/runtime/_ptest.py       | 2 +-
 meta/lib/oeqa/runtime/date.py         | 4 ++--
 meta/lib/oeqa/runtime/kernelmodule.py | 4 ++--
 meta/lib/oeqa/runtime/scanelf.py      | 2 +-
 5 files changed, 12 insertions(+), 6 deletions(-)

-- 
1.8.4.5


