Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@envy.jf.intel.com>) id 1TGziQ-0000Jm-Db
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 00:04:22 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 Sep 2012 14:51:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,492,1344236400"; d="scan'208";a="198277625"
Received: from envy.jf.intel.com (HELO envy) ([10.7.201.159])
	by orsmga001.jf.intel.com with ESMTP; 26 Sep 2012 14:51:30 -0700
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id q8QLo31s027817;
	Wed, 26 Sep 2012 14:50:04 -0700
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id q8QLo3mH027816;
	Wed, 26 Sep 2012 14:50:03 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Sep 2012 14:50:02 -0700
Message-Id: <cover.1348695851.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/3] license.bbclass fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Sep 2012 22:04:22 -0000

[YOCTO #3118]

license.conf hasn't been being parsed. This commit series ensures that 
license.conf is parsed, that it contains useful variables that should be
in a global conf file and that those variables are not kept within 
license.bbclass.

This also fixes an discreprancy between the documentation of LICENSE_PATH (which
is what we tell people to use) and what we were using "LICENSE_DIR". This ensures
that when the end user needs to add additional licenses, that they use 
LICENSE_PATH += "path/to/additional/licenses" and that it works.

The following changes since commit 0b09e50810162a07ef0aecee91ee32b4a36334a3:

  busybox: Fix misplaced quote (2012-09-26 18:28:36 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib eflanagan/LICENSE_PATH
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/LICENSE_PATH

Elizabeth Flanagan (3):
  license.bbclass: Variable standardization
  bitbake.conf: parse license config
  license.conf/bbclass: Move globals to license.conf

 meta/classes/license.bbclass |   67 +-----------------------------------------
 meta/conf/bitbake.conf       |    1 +
 meta/conf/licenses.conf      |   64 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 66 insertions(+), 66 deletions(-)

-- 
1.7.5.4



