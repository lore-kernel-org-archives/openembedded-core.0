Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 6DE05719F7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 15:37:32 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 01 Dec 2016 07:37:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,282,1477983600"; d="scan'208";a="36222164"
Received: from unknown (HELO mlopezva-MOBL2.zpn.intel.com) ([10.219.25.91])
	by orsmga004.jf.intel.com with ESMTP; 01 Dec 2016 07:37:33 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2016 09:37:34 -0600
Message-Id: <cover.1480525452.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.7.3
Subject: [PATCHv2 0/3] Add communication mechanism for sending test results
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
X-List-Received-Date: Thu, 01 Dec 2016 15:37:33 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

These changes add a mechanism for sending test result to a remote
repository for later consumption of the data from other clients.

These patches were tested in our local autobuilders.

Changes in v2:

- Give more priority to local branches, because it would be difficult
  to match a branch name (because it includes the hostname).
- Instead of throwing an execption when a push fails, log the error
  and return 1 to the caller.
- Instead to call 3 times bitbake -e, just call it one time to get
  needed variables.

The following changes since commit 9e63f81c78e284c9b325fe04a1b59e61c7ad8a1a:

  bitbake: ast: remove BBVERSIONS support (2016-11-30 15:48:10 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug9954v2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug9954v2

Mariano Lopez (3):
  oeqa/utils/commands.py: Make a copy of variables in get_bb_vars
  oeqa/utils/metadata.py: Add metadata library
  oe-selftest: Add option to submit test result to a git repository.

 meta/lib/oeqa/utils/commands.py |   1 +
 meta/lib/oeqa/utils/metadata.py |  83 ++++++++++++++++++++++++++++++++
 scripts/oe-selftest             | 102 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 186 insertions(+)
 create mode 100644 meta/lib/oeqa/utils/metadata.py

-- 
2.7.3


