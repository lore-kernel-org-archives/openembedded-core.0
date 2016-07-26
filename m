Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A1B2B606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 15:45:57 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 26 Jul 2016 08:45:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,425,1464678000"; d="scan'208";a="740010934"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Jul 2016 08:45:57 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2016 07:39:05 +0000
Message-Id: <cover.1469518569.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH 0/3] Allows to copy symlinks to DUTs with testimage
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
X-List-Received-Date: Tue, 26 Jul 2016 15:45:59 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Currently when using the install functionality in the DUT without package
manager, if you copy a symlink the function will fail.

These series will change the behaviour and will allow to recreate the
symlinks in the DUT.

[YOCTO #9932]


The following changes since commit 039f47ad197a9a53109c9f3deadd9c35e62c056d:

  uclibc: remove meta-yocto-bsp append (2016-07-26 08:56:32 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug9932
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug9932

Mariano Lopez (3):
  oeqa/utils/commands.py: Add oeqa_copy function
  oeqa/oetest.py: Allow to export packages using symlinks
  oeqa/utils/sshcontrol.py: Allows to copy symlinks to target

 meta/classes/testexport.bbclass   | 22 ++++------------------
 meta/lib/oeqa/oetest.py           | 16 ++++++++++++----
 meta/lib/oeqa/utils/commands.py   |  9 +++++++++
 meta/lib/oeqa/utils/sshcontrol.py |  9 +++++++--
 4 files changed, 32 insertions(+), 24 deletions(-)

-- 
2.6.6


