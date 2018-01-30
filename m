Return-Path: <amber.n.elliot@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0A9DC78886
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 01:49:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Jan 2018 17:49:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,437,1511856000"; d="scan'208";a="14192936"
Received: from platypus.jf.intel.com ([10.54.77.40])
	by fmsmga007.fm.intel.com with ESMTP; 30 Jan 2018 17:49:49 -0800
From: anelliot <amber.n.elliot@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jan 2018 10:24:34 -0800
Message-Id: <cover.1517336283.git.amber.n.elliot@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: paul.eggleton@linux.intel.com
Subject: [PATCHv2 0/1] wic: argparse now used for help functionality.
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
X-List-Received-Date: Wed, 31 Jan 2018 01:49:49 -0000

The wic help output formally consisted of manually created strings mixed with argparse,
which was unformatted and unusable. This fix cleans up the help messages, rewrites help
functionality to use argparse, and adds functionality to show information for
plugins (similar to canned images).

The following changes since commit e5e89cfb7bc2231ac4fcc16f4cb4f74d806136c4:

  pulseaudio: improve glibc 2.27 patch (2018-01-30 12:53:16 +0000)

are available in the git repository at:

  git://push.yoctoproject.org/poky-contrib anelliot/bug12205

anelliot (1):
  wic: argparse now used for help functionality.

 meta/lib/oeqa/selftest/cases/wic.py |   50 +-
 scripts/lib/wic/engine.py           |   87 ++-
 scripts/lib/wic/help.py             | 1080 ++++-------------------------------
 scripts/wic                         |  168 ++----
 4 files changed, 267 insertions(+), 1118 deletions(-)

-- 
2.7.4


