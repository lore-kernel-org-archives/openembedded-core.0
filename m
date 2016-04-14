Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 644A16011B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 08:24:53 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 14 Apr 2016 01:24:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,484,1455004800"; d="scan'208";a="686084988"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.255.145.9])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Apr 2016 01:24:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Apr 2016 20:24:17 +1200
Message-Id: <cover.1460622215.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
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
X-List-Received-Date: Thu, 14 Apr 2016 08:24:55 -0000

The following changes since commit 0e306a53c460302ec20192fc35930983781b7a2e:

  archiver: Improve debug output (2016-04-13 20:58:35 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool16-oe
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool16-oe

Paul Eggleton (2):
  devtool: update-recipe: handle where SRC_URI is appended to with +=
  devtool: upgrade: handle recipes where source is not first entry in
    SRC_URI

 meta/lib/oe/recipeutils.py     |  7 ++++---
 scripts/lib/devtool/upgrade.py | 10 +++++++++-
 2 files changed, 13 insertions(+), 4 deletions(-)

-- 
2.5.5


