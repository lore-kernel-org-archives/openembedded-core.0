Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 2C27960797
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 12:43:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP; 11 Oct 2016 05:43:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,329,1473145200"; d="scan'208";a="1052292206"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 11 Oct 2016 05:43:30 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Oct 2016 15:43:27 +0300
Message-Id: <1476189809-24240-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH 0/2] More robust prerm and preinst scriptlets
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
X-List-Received-Date: Tue, 11 Oct 2016 12:43:31 -0000

These patches prevent package deinstallation and upgrade failures caused by
init script error on opkg-based systems. The problem was that init script
'stop' will likely return '1' if the daemon is not running. This, in turn
caused the scriptlet to error out preventing package (de-)installation.

Markus Lehtonen (2):
  update-rc.d.bbclass: ignore init script return code
  sysklogd and busybox: ignore return code from init script stop

 meta/classes/update-rc.d.bbclass            | 4 ++--
 meta/recipes-core/busybox/busybox.inc       | 2 +-
 meta/recipes-extended/sysklogd/sysklogd.inc | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.6.6


