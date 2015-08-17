Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D89CF73E20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 15:16:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 17 Aug 2015 08:16:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,695,1432623600"; d="scan'208";a="785698481"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga002.jf.intel.com with ESMTP; 17 Aug 2015 08:16:18 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Aug 2015 07:10:11 +0000
Message-Id: <cover.1439794714.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH v2 0/2] Check invalid characters on some recipe metadata
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
X-List-Received-Date: Mon, 17 Aug 2015 15:16:24 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

* insane.bbclass: QA check for invalid chars
* package_deb.bbclass: Opens the control file allowing UTF-8 chars
and handles a string decoding exception, reported on [1]

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=6693

The following changes since commit a533776d6ff83b6e3e830137455b8382d002768b:

  perf: fix build breakage on kernels after 4.1 (2015-08-12 11:31:49 -0700)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lsandov1/package_deb-handle-non-ascii-6693-v2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lsandov1/package_deb-handle-non-ascii-6693-v2

Leonardo Sandoval (2):
  insane.bbclass: Check invalid characters (non UTF8) on recipe metadata
  package_deb.bbclass: Allow UTF-8 characters on control files

 meta/classes/insane.bbclass      | 24 +++++++++++++++++++++++-
 meta/classes/package_deb.bbclass | 18 +++++++++++-------
 2 files changed, 34 insertions(+), 8 deletions(-)

-- 
1.8.4.5


