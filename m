Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9516673231
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Aug 2015 13:51:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Aug 2015 06:51:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,601,1432623600"; d="scan'208";a="776775034"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 03 Aug 2015 06:51:52 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id C70B46A4005;
	Mon,  3 Aug 2015 06:51:05 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Aug 2015 16:51:30 +0300
Message-Id: <cover.1438609723.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/6] wic: finalize 0.2.0
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
X-List-Received-Date: Mon, 03 Aug 2015 13:51:53 -0000

Hi,

This patchset includes small bugfixes, code cleanup and usability fixes
for wic release 0.2.0.

Please review.

The following changes since commit a8b723498c9a7106210db140452886894494b4d6:

  bitbake: cooker: Resolve file monitoring race issues when using memres bitbake (2015-08-03 07:36:25 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/0.2.0
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/0.2.0

Ed Bartosh (6):
  wic: improved usage text
  wic: Improve 'wic help overview' content
  wic: Report recipe name for native commands
  wic: code cleanup: remove unused code
  wic: code cleanup: pylint misc.py
  wic: release 0.2.0

 scripts/lib/image/help.py        | 45 ++++++++++++++--------
 scripts/lib/wic/utils/oe/misc.py | 82 +++++++++++++++++++++++-----------------
 scripts/wic                      |  2 +-
 3 files changed, 78 insertions(+), 51 deletions(-)

--
Regards,
Ed


