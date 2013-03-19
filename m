Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UHvBZ-0005M8-5T
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 12:58:56 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Mar 2013 04:41:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,872,1355126400"; d="scan'208";a="304385661"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.154])
	by orsmga002.jf.intel.com with ESMTP; 19 Mar 2013 04:41:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Mar 2013 11:41:37 +0000
Message-Id: <cover.1363692967.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [RFC PATCH 0/2] Tidy up tools-debug package group
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
X-List-Received-Date: Tue, 19 Mar 2013 11:58:59 -0000

Remove rsync from packagegroup-core-tools-debug (since it was added for
Anjuta and will now be brought in by anjuta-remote-run), and move the
packages required for Eclipse support to their own packagegroup.

If there's a compelling reason for rsync to be left in or I've missed
something please let me know.


Please review the following changes for suitability for inclusion. If you have
any objections or suggestions for improvement, please respond to the patches. If
you agree with the changes, please provide your Acked-by.

The following changes since commit 7032d559c04bae09e6b7c39ddeb1bf35acc0584c:

  syslinux.bbclass: Add a default serial console option and real boot menu support (2013-03-18 21:42:19 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/eclipse-debug
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/eclipse-debug

Paul Eggleton (2):
  packagegroup-core-tools-debug: remove rsync
  packagegroup-core-tools-debug: split out Eclipse packages

 meta/classes/core-image.bbclass                              |    2 ++
 meta/conf/local.conf.sample                                  |    1 +
 .../packagegroups/packagegroup-core-eclipse-debug.bb         |   10 ++++++++++
 .../packagegroups/packagegroup-core-tools-debug.bb           |    3 ---
 meta/recipes-extended/images/core-image-lsb-sdk.bb           |    2 +-
 meta/recipes-rt/images/core-image-rt-sdk.bb                  |    2 +-
 meta/recipes-sato/images/core-image-sato-sdk.bb              |    2 +-
 7 files changed, 16 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb

-- 
1.7.10.4



