Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Se0hB-0000dB-26
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 11:13:57 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 11 Jun 2012 02:03:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="154648636"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.123])
	by azsmga001.ch.intel.com with ESMTP; 11 Jun 2012 02:03:20 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jun 2012 17:02:29 +0800
Message-Id: <cover.1339405061.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/3] Use openssh to provide sftp-server service
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
X-List-Received-Date: Mon, 11 Jun 2012 09:13:57 -0000

This patch set changes dropbear to openssh in the referenced core sato-sdk
image to provide the sftp-server service which is required by some other 
tools, e.g. the Eclipse Remote System Explorer.

The following changes since commit 75a973328d50ef3c007edb7a471ea77fb97911ea:
  Bruce Ashfield (1):
        kern-tools: anchor KMACHINE test

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/ssh
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/ssh

Lianhao Lu (3):
  openssh: Allow empty passwords login.
  task-core-ssh-openssh: Added openssh-sftp-server.
  core-image-sato-sdk: Replace dropbear by openssh.

 .../openssh/openssh-6.0p1/sshd_config              |    2 +-
 meta/recipes-connectivity/openssh/openssh_6.0p1.bb |    2 +-
 meta/recipes-core/tasks/task-core-ssh-openssh.bb   |    2 +-
 meta/recipes-sato/images/core-image-sato-sdk.bb    |    4 +++-
 4 files changed, 6 insertions(+), 4 deletions(-)



