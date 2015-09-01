Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E8B1A76A51
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 14:20:36 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 01 Sep 2015 07:20:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,449,1437462000"; d="scan'208";a="795486714"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga002.jf.intel.com with ESMTP; 01 Sep 2015 07:20:18 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Sep 2015 06:13:40 +0000
Message-Id: <cover.1441087651.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 0/2] devtool build
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
X-List-Received-Date: Tue, 01 Sep 2015 14:20:38 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

First patch moves all the build related code from standard.py to build.py,
and second patch includes the --disable-parallel-make parameter, which
as the name indicates, removes parallelism on the make tool.

The following changes since commit 22afc047dd1b8f83e56c4a9862710776c509e3c5:

  oe-selftest: test devtool build-image plugin (2015-08-31 11:37:14 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lsandov1/devtool-disable-parallelism
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lsandov1/devtool-disable-parallelism

Leonardo Sandoval (2):
  devtool: Create a single file for the build devtool feature
  devtool: Allow disabling make parallelism on build command

 scripts/lib/devtool/build.py    | 75 +++++++++++++++++++++++++++++++++++++++++
 scripts/lib/devtool/standard.py | 22 ------------
 2 files changed, 75 insertions(+), 22 deletions(-)
 create mode 100644 scripts/lib/devtool/build.py

-- 
1.8.4.5


