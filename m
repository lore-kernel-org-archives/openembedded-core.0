Return-Path: <tom.zanussi@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B732B606E8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 20:14:00 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 20 Feb 2015 12:08:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,616,1418112000"; d="scan'208";a="669257957"
Received: from rhamler-mobl2.amr.corp.intel.com (HELO localhost)
	([10.254.47.47])
	by fmsmga001.fm.intel.com with ESMTP; 20 Feb 2015 12:13:59 -0800
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Feb 2015 14:13:59 -0600
Message-Id: <cover.1424462781.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/1] wic bugfix
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
X-List-Received-Date: Fri, 20 Feb 2015 20:14:01 -0000

This fixes [Yocto Bug 7307 - wic create mkefidisk/mkgummidisk images fails].

Tested directdisk/mkefidisk/mkgummidisk image generation with
core-image-minimal for nuc, which all now work again with this patch.

The following changes since commit 5db6a27f4847e51c6434a968f81d3ceffcc54952:

  bitbake: toaster: importlayer Remove description input field (2015-02-20 12:58:20 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/wic-bug-7307
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/wic-bug-7307

Tom Zanussi (1):
  wic: Fix kernel dir location

 scripts/lib/image/engine.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
1.9.3


