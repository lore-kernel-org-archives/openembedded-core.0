Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8676972376
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 19:33:14 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 05 May 2015 12:33:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,374,1427785200"; d="scan'208";a="721159117"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga002.fm.intel.com with ESMTP; 05 May 2015 12:33:14 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 May 2015 22:33:00 +0300
Message-Id: <cover.1430854134.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/3] Minor X protocol extension upgrades
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
X-List-Received-Date: Tue, 05 May 2015 19:33:15 -0000

The following changes since commit 7a8f37daa7b42905233c31366915b897886a957a:

  dev-manual: Updates to add Luna support for Eclipse (2015-05-03 11:49:35 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/xorg-proto
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/xorg-proto

Jussi Kukkonen (3):
  xproto: Upgrade 7.0.26 -> 7.0.27
  randrproto: Upgrade 1.4.0 -> 1.4.1
  kbproto: Upgrade 1.0.6 -> 1.0.7

 .../xorg-proto/{kbproto_1.0.6.bb => kbproto_1.0.7.bb}                | 4 ++--
 .../xorg-proto/{randrproto_1.4.0.bb => randrproto_1.4.1.bb}          | 4 ++--
 .../xorg-proto/{xproto_7.0.26.bb => xproto_7.0.27.bb}                | 5 ++---
 3 files changed, 6 insertions(+), 7 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{kbproto_1.0.6.bb => kbproto_1.0.7.bb} (77%)
 rename meta/recipes-graphics/xorg-proto/{randrproto_1.4.0.bb => randrproto_1.4.1.bb} (80%)
 rename meta/recipes-graphics/xorg-proto/{xproto_7.0.26.bb => xproto_7.0.27.bb} (73%)

-- 
2.1.4


