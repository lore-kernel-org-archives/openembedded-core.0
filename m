Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F02D76B669
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 17:05:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 15 Aug 2013 10:04:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,886,1367996400"; d="scan'208";a="381478953"
Received: from timevans-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.206])
	by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2013 10:04:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 18:04:33 +0100
Message-Id: <cover.1376585082.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/7] Buildhistory improvements
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
X-List-Received-Date: Thu, 15 Aug 2013 17:05:26 -0000

This includes a revised version of Martin's patch to use the real
package content size rather than the archive size (it now avoids
the double collection of installed packages, works with multilib and
I also made a few other minor tweaks). I've already run the revised
version past him before sending this out.

Also included are a few other improvements to complete items from my
todo list.


The following changes since commit 57662d4f813d5795cac1529633db80a09efdb089:

  meta-skeleton: Add busybox config fragment example (2013-08-13 23:03:44 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-8
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory-8

Martin Jansa (1):
  classes/buildhistory: record size of installed package not compressed
    archive

Paul Eggleton (6):
  classes/buildhistory: remove default of BUILDHISTORY_CHECKVERBACKWARDS
  classes/buildhistory: show command line in commit message
  classes/buildhistory: tag last 3 build revisions
  classes/buildhistory: avoid mangling names in dot graphs for images
  buildhistory-diff: improve command-line handling
  buildhistory-collect-srcrevs: match new buildhistory-diff command line
    parsing

 meta/classes/buildhistory.bbclass     | 42 ++++++++++++++++---------
 meta/classes/package_rpm.bbclass      |  2 ++
 meta/classes/populate_sdk_deb.bbclass |  6 ++--
 meta/classes/populate_sdk_ipk.bbclass |  6 ++--
 meta/classes/populate_sdk_rpm.bbclass |  2 +-
 scripts/buildhistory-collect-srcrevs  | 17 ++++++----
 scripts/buildhistory-diff             | 54 +++++++++++++++++++++++---------
 scripts/oe-pkgdata-util               | 59 ++++++++++++++++++++++++++++++++---
 scripts/opkg-query-helper.py          |  2 +-
 9 files changed, 143 insertions(+), 47 deletions(-)

-- 
1.8.1.2


