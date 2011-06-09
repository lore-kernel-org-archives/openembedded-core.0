Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QUo5c-0006jP-6H
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 00:52:36 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jun 2011 15:49:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,343,1304319600"; d="scan'208";a="14415061"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jun 2011 15:49:15 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jun 2011 15:49:58 -0700
Message-Id: <cover.1307659488.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCHFIX 0/1] fix a patch application error
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
X-List-Received-Date: Thu, 09 Jun 2011 22:52:36 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The patch was getting rejected for me on a clean master tree. The error was
parts of the patch was previously applied, so rebased the patch to avoid the 
error.

The following changes since commit 7a086abc257ed433fda7a8a21c23a23199dc7cd5:

  scripts/bitbake: Only build tar-replacement-native when the build system tar version < 1.24 (2011-06-09 16:44:39 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/bugfixes
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/bugfixes

Nitin A Kamble (1):
  gcc: rebase the patch to avoid patch rejection

 ...-de.po-el.po-es.po-fi.po-fr.po-id.po-ja.p.patch |161900 +-------------------
 1 files changed, 2375 insertions(+), 159525 deletions(-)

-- 
1.7.3.4



