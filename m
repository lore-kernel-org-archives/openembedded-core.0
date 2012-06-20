Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1ShCde-0001QZ-PF
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 06:35:31 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Jun 2012 21:24:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="159846888"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.116])
	by orsmga002.jf.intel.com with ESMTP; 19 Jun 2012 21:24:42 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2012 12:25:20 +0800
Message-Id: <cover.1340166208.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH V2 0/3] misc IMAGE_FEATURE fixings
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jun 2012 04:35:31 -0000

This patch set fixed the bug [YOCTO #2605].

It allows to login to openssh with empty password if the IMAGE_FEATURE
debug-tweak feature is set.

It processes conflicting IMAGE_FEATURE features, i.e. ssh-server-dropbear 
and ssh-server-openssh.

It also adds a new IMAGE_FEATURE 'eclipse-support' for developing user 
applications using Eclipse plugin.

The following changes since commit 6d761ae17ddbd3d936e7fe985b40825ad62b2418:
  James Limbouris (1):
        debian.bbclass: invoke target objdump

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/bug2605
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/bug2605

Lianhao Lu (3):
  classes/image: Allow openssh empty passwords login.
  image/core-image: Handle conflicting IMAGE_FEATURES.
  core-image/misc: Added new IMAGE_FEATURE eclipse-support.

 meta/classes/core-image.bbclass                    |   15 ++++++++++-
 meta/classes/image.bbclass                         |   26 +++++++++++++++++++-
 meta/conf/multilib.conf                            |    1 +
 .../tasks/task-core-eclipse-support.bb             |   17 +++++++++++++
 meta/recipes-sato/images/core-image-sato-sdk.bb    |    4 ++-
 5 files changed, 60 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-core/tasks/task-core-eclipse-support.bb



