Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C43BC770C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 20:23:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 14 Oct 2015 13:23:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,682,1437462000"; d="scan'208";a="792867471"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.25.92])
	by orsmga001.jf.intel.com with ESMTP; 14 Oct 2015 13:23:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Oct 2015 21:23:29 +0100
Message-Id: <cover.1444854089.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH v2 0/5] Extensible SDK fixes
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
X-List-Received-Date: Wed, 14 Oct 2015 20:23:52 -0000

Changes since v1:
 * Simplify "prevent do_rootfs from executing on install" fix to avoid
   creating a class that we don't need - just put the stubbing out of
   do_rootfs in each bbappend file.
 * Print a warning within the env setup script if the OE env setup
   script has previously been sourced, because things won't work as
   you might expect if that's been done.

The following changes since commit 10e5df3503632a6e1c54612055b19f7258c3ae2f:

  lib/oe/image.py: Fix dependency handling for compressed types (2015-10-14 18:08:22 +0300)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/extsdkfixes2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/extsdkfixes2

Paul Eggleton (5):
  classes/populate_sdk_ext: consistent indentation
  classes/populate_sdk_ext: prevent do_rootfs from executing on install
  classes/populate_sdk_ext: add note to env setup script
  classes/populate_sdk_ext: detect and warn if running in OE environment
  toolchain-shar-extract.sh: print full-length title underline

 meta/classes/populate_sdk_ext.bbclass | 18 +++++++++++++-----
 meta/files/ext-sdk-prepare.sh         | 16 ++++++++++++++++
 meta/files/toolchain-shar-extract.sh  |  5 +++--
 3 files changed, 32 insertions(+), 7 deletions(-)
 create mode 100644 meta/files/ext-sdk-prepare.sh

-- 
2.1.0


