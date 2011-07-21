Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Qju0W-00029v-Kt
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 16:13:44 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 21 Jul 2011 07:09:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,240,1309762800"; d="scan'208";a="30751220"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.112])
	by fmsmga002.fm.intel.com with ESMTP; 21 Jul 2011 07:09:35 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jul 2011 22:09:44 +0800
Message-Id: <cover.1311256622.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/2] upgrade tcf-agent to the latest stable revision 0.0+svnr1855
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
X-List-Received-Date: Thu, 21 Jul 2011 14:13:44 -0000

The following changes since commit 068839698fe192d8846c0ed4db65861448e8e524:

  eglibc: fix runtime assertion failure (2011-07-13 12:34:30 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/tcf-agent
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/tcf-agent

Dexuan Cui (2):
  tcf-agent: upgrade to the latest stable revision 0.0+svnr1855
  distro_tracking_fields.inc: update the info for tcf-agent

 .../conf/distro/include/distro_tracking_fields.inc |   12 +-
 .../tcf-agent/tcf-agent/fix_ranlib.patch           |   14 +
 .../tcf-agent/tcf-agent/fix_tcf-agent.init.patch   |   14 +-
 .../tcf-agent/tcf-agent/terminals_agent.patch      | 1027 --------------------
 meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb   |   21 +-
 5 files changed, 40 insertions(+), 1048 deletions(-)
 create mode 100644 meta/recipes-devtools/tcf-agent/tcf-agent/fix_ranlib.patch
 delete mode 100644 meta/recipes-devtools/tcf-agent/tcf-agent/terminals_agent.patch

-- 
1.7.6



