Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7F0D6734DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 17:00:44 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 24 Sep 2015 10:00:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,582,1437462000"; d="scan'208";a="651615523"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga003.jf.intel.com with ESMTP; 24 Sep 2015 10:00:22 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Sep 2015 08:52:50 +0000
Message-Id: <cover.1443072637.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH v2 0/3] PRServer: Fixes daemon issues
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
X-List-Received-Date: Thu, 24 Sep 2015 17:00:44 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

First two patches fix issues when using hostnames instead of IPs. Third patch
disconnect the DB manually, not relaying on this task into a __del__ function.
Detail is given on each patch. Fixes 8258, 8560 and 8215

Changes from v1:
	* First patch: No changes
	* Second patch: outputs the message into stdout instead of stderr. Also
	removes the 'WARNING' string.
	* Third patch: Instead of changing the journal, this patch closes
	the DB connection explicitly, instead of relying on the __del__
        function

The following changes since commit 71b0568fa43285f0946fae93fb43cea5f3bbecec:

  rt-tests: drop unnecessary added-missing-dependencies.patch (2015-09-01 11:44:04 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lsandov1/prserver
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lsandov1/prserver

Leonardo Sandoval (3):
  prserv/serv: Start/Stop daemon using ip instead of host
  prserv/serv.py: Better messaging when starting/stopping the server
    with port=0
  prserv/serv: Close the DB connection out of class destructor

 bitbake/lib/prserv/db.py   |  2 +-
 bitbake/lib/prserv/serv.py | 38 ++++++++++++++++++++++++++++++--------
 2 files changed, 31 insertions(+), 9 deletions(-)

-- 
1.8.4.5


