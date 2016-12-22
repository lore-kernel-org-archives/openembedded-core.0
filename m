Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 77BDC774F2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 02:20:09 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 21 Dec 2016 18:20:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,386,1477983600"; d="scan'208";a="1102758786"
Received: from afzalahm-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.181.112])
	by fmsmga002.fm.intel.com with ESMTP; 21 Dec 2016 18:20:04 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2016 15:19:55 +1300
Message-Id: <cover.1482373109.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/4] Fixes for square brackets in installed filenames
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
X-List-Received-Date: Thu, 22 Dec 2016 02:20:10 -0000

When attempting to create a recipe for something that installs files
with square brackets in their name I stumbled across a couple of issues,
here are the fixes.


The following changes since commit 5e21afc9395060b489156d3f90505a372b713f37:

  Revert "selftest/wic: extending test coverage for WIC script options" (2016-12-20 17:06:01 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/bracket-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/bracket-fixes

Paul Eggleton (4):
  classes/package_rpm: handle square brackets in filenames
  lib/oe/path: add warning comment about oe.path.remove() with wildcarded filenames
  classes/sstate: handle filenames containing square brackets
  classes/sstate: fix file conflict message

 meta/classes/package_rpm.bbclass |  6 ++++++
 meta/classes/sstate.bbclass      | 24 +++++++++++++-----------
 meta/lib/oe/path.py              |  9 ++++++++-
 3 files changed, 27 insertions(+), 12 deletions(-)

-- 
2.5.5


