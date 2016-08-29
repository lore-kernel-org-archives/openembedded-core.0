Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4C5A96FF78
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 08:41:52 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 29 Aug 2016 01:41:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,595,1464678000"; d="scan'208";a="1032568764"
Received: from aupadhy1-mobl4.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.181.46])
	by fmsmga001.fm.intel.com with ESMTP; 29 Aug 2016 01:41:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 20:40:37 +1200
Message-Id: <cover.1472459569.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/1] lib/oe/patch: commit with a dummy user/email when PATCHTOOL=git
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
X-List-Received-Date: Mon, 29 Aug 2016 08:41:53 -0000

The following changes since commit 00027aee12f4bbc9a4ba607c91fcc1e0e8257fa2:

  core-image-kernel-dev.bb: Standardize use of _append and leading space. (2016-08-25 23:03:26 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/patch-git
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/patch-git

Paul Eggleton (1):
  lib/oe/patch: commit with a dummy user/email when PATCHTOOL=git

 meta/classes/patch.bbclass      |  3 +++
 meta/lib/oe/patch.py            | 24 ++++++++++++++++++++----
 scripts/lib/devtool/__init__.py |  7 +++++--
 scripts/lib/devtool/standard.py | 19 +++++++++++--------
 scripts/lib/devtool/upgrade.py  |  4 +++-
 5 files changed, 42 insertions(+), 15 deletions(-)

-- 
2.5.5


