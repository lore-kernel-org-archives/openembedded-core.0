Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jiajun.xu@intel.com>) id 1SV1n0-0003XC-89
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 16:34:50 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 May 2012 07:23:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="141693678"
Received: from unknown (HELO localhost) ([10.239.48.201])
	by orsmga001.jf.intel.com with ESMTP; 17 May 2012 07:23:41 -0700
From: Jiajun Xu <jiajun.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 May 2012 22:48:50 +0800
Message-Id: <cover.1337265813.git.jiajun.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1] Add test script to re-execute tasks
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
X-List-Received-Date: Thu, 17 May 2012 14:34:50 -0000

Hi Richard,
This patch is to address bug 2123. Please help to review it.
It is based on the patch you posted on bugzilla. A similar function is
added into the script to remove sstate files only.

Thanks,
Jiajun

The following changes since commit 2cf6e7cf81c0b864b5d51be60094a6eb3e584383:

  fotowall: Add #include ui_wizard.h to ExportWizard.cpp (2012-05-16 07:33:15 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jxu49/oe-contrib
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jxu49/oe-contrib

Jiajun Xu (1):
  test-reexec: Add script to address issues when task re-execution

 scripts/test-reexec |  123 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 123 insertions(+), 0 deletions(-)
 create mode 100755 scripts/test-reexec



