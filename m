Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SUiqY-0007Vg-3N
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 20:21:14 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 May 2012 11:11:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="167218682"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga002.fm.intel.com with ESMTP; 16 May 2012 11:11:11 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 May 2012 11:11:08 -0700
Message-Id: <cover.1337191798.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
Subject: [PATCH 0/2] Misc fixes
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
X-List-Received-Date: Wed, 16 May 2012 18:21:14 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Here are few misc fixes:
Nitin

The following changes since commit d4e265661517f8dd4e1648fdc56bac5973f986f6:

  poky.conf: Change WARNS -> ERRORS (2012-05-16 07:35:20 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/work
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/work

Nitin A Kamble (2):
  eglibc: package mtrace separately
  gcc: fix DEPENDS to avoid a build issue

 meta/recipes-core/eglibc/eglibc-package.inc      |    7 ++++++-
 meta/recipes-core/eglibc/eglibc_2.13.bb          |    2 +-
 meta/recipes-core/eglibc/eglibc_2.15.bb          |    2 +-
 meta/recipes-core/tasks/task-core-tools-debug.bb |    1 +
 meta/recipes-devtools/gcc/gcc-4.7.inc            |    4 ++--
 5 files changed, 11 insertions(+), 5 deletions(-)

-- 
1.7.7



