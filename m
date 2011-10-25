Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RIpLU-0006NE-8h
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Oct 2011 00:19:44 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 Oct 2011 15:12:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="67184286"
Received: from unknown (HELO localhost) ([10.255.14.225])
	by orsmga002.jf.intel.com with ESMTP; 25 Oct 2011 15:12:40 -0700
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Oct 2011 15:12:32 -0700
Message-Id: <cover.1319580412.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] documentation audit script
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
X-List-Received-Date: Tue, 25 Oct 2011 22:19:44 -0000

Hello,

I've been using this script to perform audits of which packages
are producing documentation, and feel it's long overdue for this
to be added to the git tree. So here it is.

The following changes since commit f586aaa8d00361a9597a546d665077c75cf4d520:

  libxml-parser-perl, libxml-simple-perl, expat, sgmlspl-native, git: bump PR to rebuild after perl upgrade (2011-10-25 08:36:01 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib sgarman/docaudit-script
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgarman/docaudit-script

Scott Garman (1):
  documentation-audit.sh: script for auditing documentation build
    status

 scripts/contrib/documentation-audit.sh |   92 ++++++++++++++++++++++++++++++++
 1 files changed, 92 insertions(+), 0 deletions(-)
 create mode 100755 scripts/contrib/documentation-audit.sh

-- 
1.7.5.4



