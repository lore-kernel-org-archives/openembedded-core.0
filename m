Return-Path: <brian.avery@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id AB929719D5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 23:57:55 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 25 Oct 2016 16:57:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,548,1473145200"; d="scan'208";a="893967992"
Received: from bavery-ws-desk.jf.intel.com ([10.7.198.85])
	by orsmga003.jf.intel.com with ESMTP; 25 Oct 2016 16:57:55 -0700
From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Oct 2016 16:59:23 -0700
Message-Id: <cover.1477439714.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] [Krogoth] base-files: fix tty resize check
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
X-List-Received-Date: Tue, 25 Oct 2016 23:57:55 -0000

This backports the 2 changes to base-files /etc/profile that addressed
problems with the way the tty was being checked to decide whether to run
resize or not.  When the tty check has errors, it prevents Eclipse debugging
from working.

-brian avery


The following changes since commit 40f4a6d075236265086cc79400dea3c14720383a:

  bsp-guide: Updated the yocto-bsp create selections in the example. (2016-10-13 23:16:56 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib bavery/krogoth/basefiles-tty
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=bavery/krogoth/basefiles-tty

Jussi Kukkonen (1):
  This is a backport from master of 2 consecutive fixes.

 meta/recipes-core/base-files/base-files/profile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

--
1.9.1

