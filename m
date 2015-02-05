Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A7AD972701
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 18:24:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 05 Feb 2015 10:18:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,525,1418112000"; d="scan'208";a="647910861"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga001.jf.intel.com with ESMTP; 05 Feb 2015 10:24:58 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 20:24:51 +0200
Message-Id: <cover.1423160658.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/2] Various comms and multimedia PUs
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
X-List-Received-Date: Thu, 05 Feb 2015 18:25:04 -0000

The following changes since commit 1f53edeaf9ea59dd55459a6d5a93829fb4983839:

  libtool: avoid running automake/autoconf --version (2015-02-05 09:46:11 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib PUs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PUs

Cristian Iorga (2):
  flac: upgrade to 1.3.1
  neard: upgrade to 0.15

 meta/recipes-connectivity/neard/neard.inc          | 10 +++---
 .../neard/neard/parallel-build.patch               | 40 ----------------------
 meta/recipes-connectivity/neard/neard_0.14.bb      | 12 -------
 meta/recipes-connectivity/neard/neard_0.15.bb      |  9 +++++
 .../0001-Fix-Makefile.am-altivec-logic.patch       | 35 -------------------
 .../flac/{flac_1.3.0.bb => flac_1.3.1.bb}          | 18 ++++------
 6 files changed, 20 insertions(+), 104 deletions(-)
 delete mode 100644 meta/recipes-connectivity/neard/neard/parallel-build.patch
 delete mode 100644 meta/recipes-connectivity/neard/neard_0.14.bb
 create mode 100644 meta/recipes-connectivity/neard/neard_0.15.bb
 delete mode 100644 meta/recipes-multimedia/flac/flac-1.3.0/0001-Fix-Makefile.am-altivec-logic.patch
 rename meta/recipes-multimedia/flac/{flac_1.3.0.bb => flac_1.3.1.bb} (77%)

-- 
2.1.0


