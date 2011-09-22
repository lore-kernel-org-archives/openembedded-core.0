Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1R6cLJ-0001qE-6h
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 08:01:05 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Sep 2011 22:55:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="52521147"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 21 Sep 2011 22:55:33 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Sep 2011 13:51:23 +0800
Message-Id: <cover.1316670532.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1] [qemugl] fix opengl calling failure
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
X-List-Received-Date: Thu, 22 Sep 2011 06:01:06 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

All,
This is one fix for [YOCTO #1442] to avoid opengl calling failure led by stack
index disorder.

Pls. help to review and pull.

Thanks,
Edwin

The following changes since commit ff8f0ea563ba3e9d6f8b8e770cfbf4dca8ad5288:

  libxml2: reinclude a -staticdev package (2011-09-22 05:12:31 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/master2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master2

Zhai Edwin (1):
  qemugl: Use local variable rather than "push" to save register

 .../mesa/qemugl/call_opengl_fix.patch              |   58 ++++++++++++++++++++
 meta/recipes-graphics/mesa/qemugl_git.bb           |    5 +-
 2 files changed, 61 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/qemugl/call_opengl_fix.patch



