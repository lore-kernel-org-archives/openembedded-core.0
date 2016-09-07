Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 3F91F60616
	for <openembedded-core@openembedded.org>;
	Wed,  7 Sep 2016 14:10:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 07 Sep 2016 07:10:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,296,1470726000"; d="scan'208";a="1026322321"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.9.194])
	by orsmga001.jf.intel.com with ESMTP; 07 Sep 2016 07:10:35 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@openembedded.org
Date: Wed,  7 Sep 2016 15:10:28 +0100
Message-Id: <cover.1473257282.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/1] Python3 runqemu: remove use of subprocess.run()
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
X-List-Received-Date: Wed, 07 Sep 2016 14:10:36 -0000

Note: This patch is against master-next, as the Python 3 runqemu hasn't made it
to master yet.

Use of subprocess.run() in recent runqemu changes (by me) elevates the Python 3
requirement from 3.4+ to 3.5+. Replace subprocess.run() with 
subprocess.check_output(), as that is available in Python 3.1+

The following changes since commit 3df3462d81216d8b26a87d9915abd9de1b2c2faa:

  bitbake: cooker: record events on cooker exit (2016-09-06 23:18:06 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib joshuagl/runqemu
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=joshuagl/runqemu

Joshua Lock (1):
  runqemu: remove use of subprocess.run()

 scripts/runqemu | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
2.7.4

