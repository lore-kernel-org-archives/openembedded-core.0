Return-Path: <amber.n.elliot@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8E075600BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 23:07:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Jan 2018 15:07:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,378,1511856000"; d="scan'208";a="20563370"
Received: from platypus.jf.intel.com ([10.54.77.40])
	by orsmga003.jf.intel.com with ESMTP; 18 Jan 2018 15:07:48 -0800
From: anelliot <amber.n.elliot@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jan 2018 07:42:22 -0800
Message-Id: <cover.1516289668.git.amber.n.elliot@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 0/1] wic: argparse now used for help functionality.
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
X-List-Received-Date: Thu, 18 Jan 2018 23:07:47 -0000

The wic help output formally consisted of manually created strings mixed with argparse,
which wasunformatted and unusable. This fix cleans up the help messages, rewrites help
functionality to use argparse, and adds functionality to show information for
plugins (similar to canned images).

Fixes [YOCTO #12205]


The following changes since commit cf75fd5ae07355951b1f90d13842552a99e61063:

  contrib/yocto-bsp-kernel-update.sh: remove this script (2018-01-18 13:05:56 +0000)

are available in the git repository at:

  git://push.yoctoproject.org/poky-contrib anelliot/bug12205

anelliot (1):
  wic: argparse now used for help functionality.

 meta/lib/oeqa/selftest/cases/wic.py |   58 +-
 scripts/lib/wic/engine.py           |   87 ++-
 scripts/lib/wic/help.py             | 1080 ++++-------------------------------
 scripts/wic                         |  168 ++----
 4 files changed, 269 insertions(+), 1124 deletions(-)

-- 
2.7.4


