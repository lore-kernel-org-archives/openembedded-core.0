Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SWzs6-0008FO-44
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 02:56:14 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 May 2012 17:46:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146522076"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 22 May 2012 17:46:03 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2012 17:46:01 -0700
Message-Id: <cover.1337733905.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
Subject: [PATCH 0/1] updated commit for packaging mtrace seqarately
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
X-List-Received-Date: Wed, 23 May 2012 00:56:14 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The following changes since commit 39a9267dee0a0ee4d87ed51d4a0272549c462b02:

  Hob: add '--select a machine--' and '--select a base image--' to GUI (2012-05-22 14:56:17 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/mtrace
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/mtrace

Nitin A Kamble (1):
  eglibc: package mtrace separately

 meta/recipes-core/eglibc/eglibc-package.inc      |    7 ++++++-
 meta/recipes-core/eglibc/eglibc_2.13.bb          |    2 +-
 meta/recipes-core/eglibc/eglibc_2.15.bb          |    2 +-
 meta/recipes-core/tasks/task-core-tools-debug.bb |    4 ++++
 4 files changed, 12 insertions(+), 3 deletions(-)

-- 
1.7.7



