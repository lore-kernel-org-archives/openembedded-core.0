Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id EA67B77DAF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 03:24:29 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Aug 2017 20:24:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,385,1498546800"; d="scan'208";a="119889648"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by orsmga004.jf.intel.com with ESMTP; 16 Aug 2017 20:24:29 -0700
From: rebecca.swee.fun.chang@intel.com
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Aug 2017 11:25:15 +0800
Message-Id: <cover.1502939403.git.rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/1] devtool: upgrade: enable branch checking when revision is provided
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
X-List-Received-Date: Thu, 17 Aug 2017 03:24:30 -0000

From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>

This work has been similar to [YOCTO #11389] but this is mainly on
devtool 'upgrade' subcommand. This feature is important for devtool
as this will surely improve the usability of devtool and improve the
quality of the recipe being changed.

Users might have input a revision/ commit hash to 'devtool upgrade'
and the revision might not be on master branch. This will caused
bitbake to fail in source fetching.

Regards,
Rebecca

The following changes since commit 55bf88603927469de9aa9f6fd4d449230d2e61e3:

  poky: Add nios2 to list of qemu targets (2017-08-17 00:21:35 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib rebeccas/11484-wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rebeccas/11484-wip

Chang Rebecca Swee Fun (1):
  devtool: upgrade: enable branch checking when revision is provided

 scripts/lib/devtool/upgrade.py | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

-- 
2.7.4


