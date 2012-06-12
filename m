Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SeOE0-000648-6M
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 12:21:24 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Jun 2012 03:10:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="151833351"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.123])
	by orsmga001.jf.intel.com with ESMTP; 12 Jun 2012 03:10:47 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2012 18:10:04 +0800
Message-Id: <cover.1339495723.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH V2 0/3] Use openssh to provide sftp-server service
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
X-List-Received-Date: Tue, 12 Jun 2012 10:21:24 -0000

This patch set changes dropbear to openssh in the referenced core sato-sdk
image to provide the sftp-server service which is required by some other 
tools, e.g. the Eclipse Remote System Explorer.

The following changes since commit 0eddc176e73e74d4b1a7d3163d65f619fcd4baf0:
  Saul Wold (1):
        gnomebase: add GNOME_COMPRESS_TYPE variable

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/ssh
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/ssh

Lianhao Lu (3):
  task-core-ssh-openssh: Added openssh-sftp-server.
  core-image-sato-sdk: Replace dropbear by openssh.
  classes/image: Allow openssh empty passwords login.

 meta/classes/core-image.bbclass                  |    2 ++
 meta/classes/image.bbclass                       |   10 +++++++++-
 meta/recipes-core/tasks/task-core-ssh-openssh.bb |    2 +-
 meta/recipes-sato/images/core-image-sato-sdk.bb  |    4 +++-
 4 files changed, 15 insertions(+), 3 deletions(-)



