Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 86C5876536
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 22:10:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 11 Aug 2015 15:10:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,656,1432623600"; d="scan'208";a="782256379"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga002.jf.intel.com with ESMTP; 11 Aug 2015 15:10:08 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Aug 2015 14:04:13 +0000
Message-Id: <cover.1439301278.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 0/1][RFC] devtool: Upgrade feature
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
X-List-Received-Date: Tue, 11 Aug 2015 22:10:09 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

There are several approaches when upgrading a recipe and on this patch
it was decided to reused the code from the auto-upgrade-helper [1] and ported it into
the devtool. There are several pending tasks as described in the patch's description. 
The progress of this feature is being track on [2].

[1] http://git.yoctoproject.org/cgit/cgit.cgi/auto-upgrade-helper/
[2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=7642

The following changes since commit 48b5ea6782ec7e9ab8f9a28438ef0ededa5fe224:

  sanity.bbclass: check /bin/sh is dash or bash (2015-06-26 09:28:53 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lsandov1/devtool-upgrade-functionality-7642
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lsandov1/devtool-upgrade-functionality-7642

Leonardo Sandoval (1):
  devtool: Upgrade feature

 scripts/lib/devtool/auto-upgrade-helper/bitbake.py | 102 +++++
 scripts/lib/devtool/auto-upgrade-helper/errors.py  |  87 +++++
 scripts/lib/devtool/auto-upgrade-helper/git.py     | 101 +++++
 .../lib/devtool/auto-upgrade-helper/gitrecipe.py   |  98 +++++
 scripts/lib/devtool/auto-upgrade-helper/recipe.py  | 428 +++++++++++++++++++++
 .../lib/devtool/auto-upgrade-helper/svnrecipe.py   |  28 ++
 .../devtool/auto-upgrade-helper/upgradehelper.py   | 150 ++++++++
 scripts/lib/devtool/standard.py                    | 119 ++++++
 8 files changed, 1113 insertions(+)
 create mode 100644 scripts/lib/devtool/auto-upgrade-helper/bitbake.py
 create mode 100644 scripts/lib/devtool/auto-upgrade-helper/errors.py
 create mode 100644 scripts/lib/devtool/auto-upgrade-helper/git.py
 create mode 100644 scripts/lib/devtool/auto-upgrade-helper/gitrecipe.py
 create mode 100644 scripts/lib/devtool/auto-upgrade-helper/recipe.py
 create mode 100644 scripts/lib/devtool/auto-upgrade-helper/svnrecipe.py
 create mode 100755 scripts/lib/devtool/auto-upgrade-helper/upgradehelper.py

-- 
1.8.4.5


