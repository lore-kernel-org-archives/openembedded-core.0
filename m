Return-Path: <jukka.rissanen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 75BF26B3C7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 12:35:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 26 Jul 2013 05:32:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,751,1367996400"; d="scan'208";a="371689139"
Received: from sorvi.fi.intel.com ([10.237.72.152])
	by fmsmga001.fm.intel.com with ESMTP; 26 Jul 2013 05:35:18 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jul 2013 15:35:14 +0300
Message-Id: <1374842117-24504-1-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH 0/3] ofono fixes
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
X-List-Received-Date: Fri, 26 Jul 2013 12:35:18 -0000

Hi,

Patch 1 enables systemd support which was missing from the ofono
recipe.

Patch 2 moves bluetooth enabling from .bb file into ofono.inc so
it needs to be done in only one place.

Patch 3 enables test scripts which are very useful for getting
cellular contexts up and running.

Cheers,
Jukka


Jukka Rissanen (3):
  ofono: Add systemd support
  ofono: Enable bluetooth automatically
  ofono: Enable test scripts by default

 meta/recipes-connectivity/ofono/ofono.inc     | 17 +++++++++++++----
 meta/recipes-connectivity/ofono/ofono_1.12.bb |  4 ----
 meta/recipes-connectivity/ofono/ofono_git.bb  |  4 ----
 3 files changed, 13 insertions(+), 12 deletions(-)

-- 
1.7.11.7


