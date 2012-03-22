Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SAbaF-0008AY-FL
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 07:33:15 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 21 Mar 2012 23:24:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="80273607"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Mar 2012 23:24:19 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2012 14:22:23 +0800
Message-Id: <cover.1332397079.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] tcf-agent using git instead of svn
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
X-List-Received-Date: Thu, 22 Mar 2012 06:33:15 -0000

tcf-agent upstream has changed to using git repository instead of svn.

The following changes since commit d036265de1d9931bedb660e01a763d3d1d9e4097:
  Saul Wold (1):
        xserver-kdrive: Fix packaging warnings

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/tcf-agent
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/tcf-agent

Lianhao Lu (1):
  tcf-agent: Using git repository instead of svn.

 .../{tcf-agent_svn.bb => tcf-agent_git.bb}         |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/tcf-agent/{tcf-agent_svn.bb => tcf-agent_git.bb} (83%)



