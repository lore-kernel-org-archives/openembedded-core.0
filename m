Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5BCFA75742
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jun 2015 10:05:16 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 08 Jun 2015 03:05:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,573,1427785200"; d="scan'208";a="504700531"
Received: from ewishar1-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.30.184])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Jun 2015 03:05:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jun 2015 11:04:50 +0100
Message-Id: <cover.1433757846.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/2] A couple of fixes for do_rootfs log checking
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
X-List-Received-Date: Mon, 08 Jun 2015 10:05:19 -0000

The following changes since commit 3b1d89a51445cf526ca84eb5b53de434f9585d6e:

  scripts/combo-layer: Fix exit codes and tty handling (2015-06-05 16:42:07 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/rootfs-warning
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/rootfs-warning

Paul Eggleton (2):
  lib/oe/rootfs: tidy up log warning reporting
  python-smartpm: change "already installed" warnings into info messages

 meta/lib/oe/rootfs.py                              | 13 +++---
 .../smart-already-installed-message.patch          | 54 ++++++++++++++++++++++
 .../python/python-smartpm_1.4.1.bb                 |  1 +
 3 files changed, 61 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-already-installed-message.patch

-- 
2.1.0


