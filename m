Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 94BF9780A1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 01:42:29 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga104.jf.intel.com with ESMTP; 29 May 2017 18:42:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,416,1491289200"; d="scan'208";a="108029686"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by fmsmga005.fm.intel.com with ESMTP; 29 May 2017 18:42:25 -0700
From: rebecca.swee.fun.chang@intel.com
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 30 May 2017 09:42:33 +0800
Message-Id: <cover.1496107463.git.rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: Internal Core dev Mailing List <core-dev@eclists.intel.com>
Subject: [PATCHv3 0/2] devshell: make sure toolchains are populated in sysroot
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
X-List-Received-Date: Tue, 30 May 2017 01:42:30 -0000

From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>

Rework on PATCHv2.
addtask do_prepare_recipe_sysroot is having the same effect on building
more dependencies for devshell.

The 2nd patch in series is to clean up some trailing whitespaces within
devshell.bbclass.

I have done some tests on random recipe to ensure this change is having the
same behavior as the previous implementation.

Thanks.

Regards,
Rebecca

The following changes since commit 27200a3afd606df7f8e592439a8dd403d714ea6f:

  bind: build with threads and update configure options (2017-05-29 15:15:20 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib rebeccas/11464-devshell
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rebeccas/11464-devshell

Chang Rebecca Swee Fun (2):
  devshell.bbclass: ensure toolchains available for do_devshell
  devshell.bbclass: clean up trailing whitespaces

 meta/classes/devshell.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.7.4


