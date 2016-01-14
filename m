Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B6FE8731D2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 22:25:22 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 14 Jan 2016 14:25:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,296,1449561600"; d="scan'208";a="881619226"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.151])
	by fmsmga001.fm.intel.com with ESMTP; 14 Jan 2016 14:25:22 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: poky@yoctoproject.org
Date: Thu, 14 Jan 2016 16:27:01 -0600
Message-Id: <cover.1452808370.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org,
	georgex.l.musat@intel.com, benjamin.esquivel@intel.com
Subject: [PATCH 0/3] ptest-runner2 C implementation
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
X-List-Received-Date: Thu, 14 Jan 2016 22:25:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is the changes that adds new ptest-runner2 C implementation a detail
description exists in the recipe adding.

You can review the ptest-runner2 code on [1], i wrote unit tests for all
the code using check framework also i used mtrace for found possible memory leaks.

Finally i tested the new runner on qemux86, qemuarm, qemumips, qemuppc using
core-image-minimal and qemux86/poky-tiny/core-image-minimal.

[YOCTO #8021]

[1] https://github.com/alimon/ptest-runner2

The following changes since commit 92cc02fe517bad0af4e493fda3331738cbcc9a26:

  linux-yocto: Update Genericx86* BSPs to 4.1.15 (2016-01-14 15:18:46 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib alimon/ptest-runner2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/ptest-runner2

Aníbal Limón (3):
  ptest-runner2: Add new ptest-runner2 recipe.
  ptests: Update references to new ptest-runner2.
  Update dev-manual to point to the new ptest-runner2.

 .../dev-manual/dev-manual-common-tasks.xml         |  4 ++--
 meta/classes/ptest.bbclass                         |  2 +-
 meta/lib/oeqa/runtime/_ptest.py                    |  4 ++--
 .../ptest-runner2/ptest-runner2_0.1.bb             | 24 ++++++++++++++++++++++
 4 files changed, 29 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-support/ptest-runner2/ptest-runner2_0.1.bb

-- 
2.1.4


