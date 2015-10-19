Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 365917704A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 16:33:19 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 Oct 2015 09:33:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,702,1437462000"; d="scan'208";a="830460963"
Received: from ggwalsh-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.6.253])
	by fmsmga002.fm.intel.com with ESMTP; 19 Oct 2015 09:33:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 17:33:07 +0100
Message-Id: <cover.1445272352.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH v3 0/5] Extensible SDK fixes
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
X-List-Received-Date: Mon, 19 Oct 2015 16:33:21 -0000

Changes since v2:
 * Fix patch 2/5 to disable do_bootimg, do_bootdirectdisk and do_vmimg
   as well as do_rootfs
 * Add a proper commit message for patch 1/5


The following changes since commit 10e5df3503632a6e1c54612055b19f7258c3ae2f:

  lib/oe/image.py: Fix dependency handling for compressed types (2015-10-14 18:08:22 +0300)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/extsdkfixes2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/extsdkfixes2

Paul Eggleton (5):
  classes/populate_sdk_ext: consistent indentation
  classes/populate_sdk_ext: prevent image construction from executing on
    install
  classes/populate_sdk_ext: add note to env setup script
  classes/populate_sdk_ext: detect and warn if running in OE environment
  toolchain-shar-extract.sh: print full-length title underline

 meta/classes/populate_sdk_ext.bbclass | 18 +++++++++++++-----
 meta/files/ext-sdk-prepare.sh         | 20 ++++++++++++++++++++
 meta/files/toolchain-shar-extract.sh  |  5 +++--
 3 files changed, 36 insertions(+), 7 deletions(-)
 create mode 100644 meta/files/ext-sdk-prepare.sh

-- 
2.1.0


