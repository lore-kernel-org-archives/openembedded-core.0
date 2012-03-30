Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SDkRm-0008Tk-2L
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 00:37:30 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 30 Mar 2012 15:28:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="135846722"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 30 Mar 2012 15:28:24 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Mar 2012 15:28:22 -0700
Message-Id: <cover.1333145263.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
MIME-Version: 1.0
Subject: [PATCH 0/3] Misc Fixes
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
X-List-Received-Date: Fri, 30 Mar 2012 22:37:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The following changes since commit 06fc2d2ec8e72f063f2c67601b2f027f76971e05:

  documentation/dev-manual/dev-manual-common-tasks.xml: Title change (2012-03-30 17:20:51 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/misc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (3):
  nasm: fix issue with repeat configure
  cross-canadian.bbclass: fix rpath for sdk executables
  poky-tiny: avoid eglibc locale packaging

 meta-yocto/conf/distro/poky-tiny.conf   |    3 +++
 meta/classes/cross-canadian.bbclass     |    4 +++-
 meta/recipes-devtools/nasm/nasm_2.07.bb |    8 ++++----
 3 files changed, 10 insertions(+), 5 deletions(-)

-- 
1.7.6.4



