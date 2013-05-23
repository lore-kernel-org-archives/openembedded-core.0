Return-Path: <nitin.a.kamble@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 79A286A378
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 23:10:17 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 23 May 2013 16:10:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,730,1363158000"; d="scan'208";a="307076554"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by azsmga001.ch.intel.com with ESMTP; 23 May 2013 16:10:14 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2013 16:09:16 +0000
Message-Id: <cover.1369324957.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 0/1] a x32 fix for dropbear hang
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
X-List-Received-Date: Thu, 23 May 2013 23:10:17 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Here is a single fix for a hang noticed in the dropbear, built for x32 abi target.

Thanks,
Nitin

The following changes since commit e8197722de1f6006ceae0d4266de91c1db7278e3:

  buildhistory: Sync with bitbake changes (2013-05-23 11:51:53 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib nitin/misc
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (1):
  dropbear: a fix for hang in dropbearkey, built for x32

 .../0007-dropbear-fix-for-x32-abi.patch            | 140 +++++++++++++++++++++
 meta/recipes-core/dropbear/dropbear.inc            |   3 +-
 2 files changed, 142 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/dropbear/dropbear-2013.58/0007-dropbear-fix-for-x32-abi.patch

-- 
1.8.1.4


