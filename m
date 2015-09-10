Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 079DE60132
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 14:26:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 10 Sep 2015 07:26:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,505,1437462000"; d="scan'208";a="801670737"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 10 Sep 2015 07:26:38 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id D93C96A4083
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 07:25:45 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Sep 2015 17:26:31 +0300
Message-Id: <cover.1441889095.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH 0/3] wic bugfix and improvements
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
X-List-Received-Date: Thu, 10 Sep 2015 14:26:39 -0000

Hi,

This patchset contains a changes suggested by QA team.
Daniel, thank you for suggestions!

The following changes since commit d4585fa23d56a58c583ee33db067a23177a936b1:

  bsps: update 3.14 SRCREVs (2015-09-09 14:27:57 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/misc
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/misc

Ed Bartosh (3):
  wic: add dependencies to wic-image-minimal recipe
  wic: use ext4 in wic-image-minimal.wks
  wic: fix partition size calculation

 meta-selftest/recipes-test/images/wic-image-minimal.bb  | 2 ++
 meta-selftest/recipes-test/images/wic-image-minimal.wks | 6 +++---
 scripts/lib/wic/imager/direct.py                        | 3 +--
 3 files changed, 6 insertions(+), 5 deletions(-)

--
Ed


