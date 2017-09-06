Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id AD11D7199E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Sep 2017 09:49:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 06 Sep 2017 02:49:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,483,1498546800"; d="scan'208";a="132258037"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 06 Sep 2017 02:49:11 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 185EB58038F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Sep 2017 02:49:10 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Sep 2017 12:48:22 +0300
Message-Id: <cover.1504691079.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.13.5
Subject: [PATCH 0/3] #11891 - Port bmaptools to Python 3
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
X-List-Received-Date: Wed, 06 Sep 2017 09:49:10 -0000

Hi,

This patchset switches bmap-tools to usage of native Python 3.
As bmap-tools is the only recipe in oe-core that uses Python 2
this change should help to stop building native Python 2.

The following changes since commit 7a5d997dc264ca8913c5ea57a2c5120a2dc41528:

  wic: selftest: add test_wic_rm_ext test case (2017-09-05 14:28:41 +0300)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wip

Ed Bartosh (3):
  bmap-tools: upgrade to v3.4
  bmap-tools: switch to Python 3
  wic: run bmaptool with native Python3

 .../bmap-tools/{bmap-tools_3.2.bb => bmap-tools_3.4.bb}          | 9 +++------
 scripts/lib/wic/plugins/imager/direct.py                         | 6 ++++--
 2 files changed, 7 insertions(+), 8 deletions(-)
 rename meta/recipes-support/bmap-tools/{bmap-tools_3.2.bb => bmap-tools_3.4.bb} (79%)

--
Regards,
Ed


