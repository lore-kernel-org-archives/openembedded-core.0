Return-Path: <jukka.rissanen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id E48A661883
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 15:01:42 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 01 Aug 2013 08:01:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,795,1367996400"; d="scan'208";a="276321832"
Received: from sorvi.fi.intel.com ([10.237.72.152])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Aug 2013 08:01:42 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Aug 2013 18:01:36 +0300
Message-Id: <1375369300-13471-1-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH v2 0/4] ofono fixes
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
X-List-Received-Date: Thu, 01 Aug 2013 15:01:43 -0000

Hi,

v2:
- removed sysvinit check from patch 1 as it is no longer needed
  because of commit 3b9b8d571da6bb3652427e8ccc7948cbcec0e517
- added patch 4 so that ofono.inc can be re-used by separate
  ofono recipe that does not have or use ofono initscript
- fixed the commit message in patch 2

v1:
Patch 1 enables systemd support which was missing from the ofono
recipe.

Patch 2 moves bluetooth enabling from .bb file into ofono.inc so
it needs to be done in only one place.

Patch 3 enables test scripts which are very useful for getting
cellular contexts up and running.

Cheers,
Jukka


Jukka Rissanen (4):
  ofono: Add systemd support
  ofono: Move bluetooth enabling to .inc file
  ofono: Enable test scripts by default
  ofono: Move do_install() to ofono recipe file

 meta/recipes-connectivity/ofono/ofono.inc     | 14 ++++++++------
 meta/recipes-connectivity/ofono/ofono_1.12.bb |  9 +++++----
 meta/recipes-connectivity/ofono/ofono_git.bb  |  4 ----
 3 files changed, 13 insertions(+), 14 deletions(-)

-- 
1.7.11.7


