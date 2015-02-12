Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C64CD72374
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 13:24:47 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 12 Feb 2015 05:19:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,565,1418112000"; d="scan'208";a="453678294"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Feb 2015 05:04:51 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Feb 2015 15:19:26 +0200
Message-Id: <cover.1423747110.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/2] Various comms PUs
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
X-List-Received-Date: Thu, 12 Feb 2015 13:24:54 -0000

The following changes since commit 231d4a9d3d89af4b1b5f6ea439c630e4cac82079:

  bitbake: bitbake-user-manual: Removed errant writer note line. (2015-02-10 23:09:32 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PU2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PU2

Cristian Iorga (2):
  bluez5: upgrade to 5.28
  ofono: upgrade to 1.16

 meta/recipes-connectivity/bluez5/{bluez5_5.27.bb => bluez5_5.28.bb} | 4 ++--
 meta/recipes-connectivity/ofono/{ofono_1.15.bb => ofono_1.16.bb}    | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.27.bb => bluez5_5.28.bb} (88%)
 rename meta/recipes-connectivity/ofono/{ofono_1.15.bb => ofono_1.16.bb} (59%)

-- 
2.1.0


