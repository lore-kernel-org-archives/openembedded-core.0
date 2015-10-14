Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 20402770C9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 20:27:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Oct 2015 13:27:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,682,1437462000"; d="scan'208";a="826791013"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.25.92])
	by orsmga002.jf.intel.com with ESMTP; 14 Oct 2015 13:27:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Oct 2015 21:27:24 +0100
Message-Id: <cover.1444854425.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/2] A couple of fixes for devtool
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
X-List-Received-Date: Wed, 14 Oct 2015 20:27:32 -0000

The following changes since commit 10e5df3503632a6e1c54612055b19f7258c3ae2f:

  lib/oe/image.py: Fix dependency handling for compressed types (2015-10-14 18:08:22 +0300)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool-fixes8
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool-fixes8

Paul Eggleton (2):
  devtool: extract: fix error handling
  devtool: handle virtual providers

 meta/lib/oe/recipeutils.py        |  6 +++++-
 meta/lib/oeqa/selftest/devtool.py | 32 ++++++++++++++++++++++++++++++++
 scripts/lib/devtool/standard.py   | 32 ++++++++++++++++++++++++++------
 scripts/lib/devtool/upgrade.py    | 12 +++++++++---
 4 files changed, 72 insertions(+), 10 deletions(-)

-- 
2.1.0


