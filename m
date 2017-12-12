Return-Path: <amber.n.elliot@intel.com>
X-Greylist: delayed 572 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 12 Dec 2017 19:24:50 UTC
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 6F79578448
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 19:24:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Dec 2017 11:15:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,395,1508828400"; d="scan'208";a="15431148"
Received: from platypus.jf.intel.com ([10.54.77.151])
	by orsmga001.jf.intel.com with ESMTP; 12 Dec 2017 11:15:19 -0800
From: anelliot <amber.n.elliot@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Dec 2017 03:53:44 -0800
Message-Id: <cover.1512998169.git.amber.n.elliot@intel.com>
X-Mailer: git-send-email 2.7.4
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
X-List-Received-Date: Tue, 12 Dec 2017 19:24:50 -0000

The wic help output formally consisted of manually created strings mixed with argparse,
which was unformatted and unusable. This fix cleans up the help messages, rewrites help
functionality to use argparse, and adds functionality to show information for
plugins (similar to canned images).

The following changes since commit 58e05020e09971f05effb79f8f1eb2012df4f0db:

  bitbake: providers: Fix determinism issue (2017-12-10 22:45:21 +0000)

are available in the git repository at:

  git://push.yoctoproject.org/poky-contrib anelliot/bug12205

anelliot (1):
  wic: argparse now used for help functionality.

 scripts/lib/wic/engine.py |   87 +++-
 scripts/lib/wic/help.py   | 1072 +++++----------------------------------------
 scripts/wic               |  169 +++----
 3 files changed, 243 insertions(+), 1085 deletions(-)

-- 
2.7.4


