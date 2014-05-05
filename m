Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A171065F38
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 15:17:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 May 2014 08:17:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,988,1389772800"; d="scan'208";a="506136154"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 05 May 2014 08:17:20 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 May 2014 18:20:46 +0300
Message-Id: <cover.1399303211.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/2] Various PUs
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
X-List-Received-Date: Mon, 05 May 2014 15:17:30 -0000

The following changes since commit 7b78c364b7de901f97cd8dbe56d5e02f545bf3d3:

  cleanup-workdir: Fix crosssdk reference after addition of PN (2014-05-05 09:05:42 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PUs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PUs

Cristian Iorga (2):
  taglib: upgrade to 1.9.1
  linux-firmware: upgrade to commit
    dec41bce44e0dff6a2c3358a958fadf22bf58858

 .../linux-firmware/linux-firmware_git.bb           | 27 ++++++++++++++--------
 .../taglib/{taglib_1.8.bb => taglib_1.9.1.bb}      | 14 ++++-------
 2 files changed, 22 insertions(+), 19 deletions(-)
 rename meta/recipes-support/taglib/{taglib_1.8.bb => taglib_1.9.1.bb} (64%)

-- 
1.9.1


