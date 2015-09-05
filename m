Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 871B376FB8
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Sep 2015 18:26:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Sep 2015 11:26:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,475,1437462000"; d="scan'208";a="783526829"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by fmsmga001.fm.intel.com with ESMTP; 05 Sep 2015 11:26:26 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Sep 2015 10:17:25 +0000
Message-Id: <cover.1441448042.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH 0/1 v2] handle SIGTERM to conclude runqemu
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
X-List-Received-Date: Sat, 05 Sep 2015 18:26:26 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This is a rebase for the current master-next,
please ignore the previous patch.

This also provides a way to cherry pick the commit.


The following changes since commit 68e18e10aba819df576fcadfaa5c9e244d70d112:

  pseudo_1.7.3.bb: New version of pseudo (2015-09-05 06:29:22 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug8239v3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug8239v3

Mariano Lopez (1):
  testimage: handle SIGTERM to conclude runqemu

 meta/classes/testimage.bbclass | 12 +++++++++++-
 meta/lib/oeqa/oetest.py        |  6 +++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

-- 
1.8.4.5


