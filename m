Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3B36C6E630
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 23:06:58 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Sep 2015 16:06:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,537,1437462000"; d="scan'208";a="790178830"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by fmsmga001.fm.intel.com with ESMTP; 15 Sep 2015 16:06:47 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Sep 2015 14:59:37 +0000
Message-Id: <cover.1442328203.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH 0/3] PRServer: Fixes daemon issues.
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
X-List-Received-Date: Tue, 15 Sep 2015 23:06:59 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

First two patches fix issues when using hostnames instead of IPs. Third patch
change the journal mode, allowing the DB to be hosted on a remote server and
network filesystems. Detail is given on each patch. Fixes 8258, 8560 and 8215

The following changes since commit 71b0568fa43285f0946fae93fb43cea5f3bbecec:

  rt-tests: drop unnecessary added-missing-dependencies.patch (2015-09-01 11:44:04 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lsandov1/Remote-PR-server-not-writing-PR-values-to-database
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lsandov1/Remote-PR-server-not-writing-PR-values-to-database

Leonardo Sandoval (3):
  prserv/serv: Start/Stop daemon using ip instead of host
  prserv/serv.py: Better messaging when starting/stopping the server
    with port=0
  prserv/db: Use DELETE instead of WAL journal mode

 bitbake/lib/prserv/db.py   |  2 +-
 bitbake/lib/prserv/serv.py | 36 +++++++++++++++++++++++++++++-------
 2 files changed, 30 insertions(+), 8 deletions(-)

-- 
1.8.4.5


