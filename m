Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0D9A8728A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 11:55:05 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 28 Jan 2015 03:50:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,480,1418112000"; d="scan'208";a="518909994"
Received: from nnodonog-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.3.113])
	by orsmga003.jf.intel.com with ESMTP; 28 Jan 2015 03:47:54 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Jan 2015 11:54:39 +0000
Message-Id: <cover.1422445957.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/5] Fixes for image construction
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
X-List-Received-Date: Wed, 28 Jan 2015 11:55:08 -0000

The following changes since commit 2a775ebbb175dd70fc7228607c306d4ccb9e4ba4:

  net-tools: Fix rerunning of do_patch task (2015-01-23 14:32:40 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/imagefixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/imagefixes

Paul Eggleton (5):
  classes/image: drop unused default of MACHINE_POSTPROCESS_COMMAND
  lib/oe/rootfs.py: rename _uninstall_uneeded to fix spelling error
  classes/image: skip recipe on invalid IMAGE_FEATURES item
  classes/image: ensure uninstalled packages do not appear in manifests
  lib/oe/image.py: add error checking for missing IMAGE_CMD

 meta/classes/buildhistory.bbclass |  5 ++--
 meta/classes/image.bbclass        |  8 ++++--
 meta/lib/oe/image.py              |  6 +++-
 meta/lib/oe/rootfs.py             | 59 +++++++++++++++++++++------------------
 4 files changed, 45 insertions(+), 33 deletions(-)

-- 
1.9.3


