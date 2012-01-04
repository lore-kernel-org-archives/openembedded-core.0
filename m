Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RiFoW-0005H0-Jf
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 02:38:48 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 03 Jan 2012 17:31:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="53000792"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.13.115])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Jan 2012 17:31:22 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jan 2012 17:31:18 -0800
Message-Id: <cover.1325640149.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.5
Subject: [PATCH 0/2] Minor fixes
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
X-List-Received-Date: Wed, 04 Jan 2012 01:38:48 -0000

A couple of small patches created in the course of putting together a point
release for Yocto 1.1.

Cheers,
Joshua

The following changes since commit de679a3036ebef1c7d7b8ee23f05590c95e498d9:

  pseudo: ensure libs are included in package (2012-01-03 12:10:59 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/stuff
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/stuff

Joshua Lock (2):
  linux-tools: add binutils to perf DEPENDS
  cogl: ensure we can build on armv4

 .../clutter/cogl/build_for_armv4t.patch            |   23 ++++++++++++++++++++
 meta/recipes-graphics/clutter/cogl_1.8.2.bb        |    5 +++-
 meta/recipes-graphics/clutter/cogl_git.bb          |    5 ++-
 meta/recipes-kernel/linux/linux-tools.inc          |    2 +-
 4 files changed, 31 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-graphics/clutter/cogl/build_for_armv4t.patch

-- 
1.7.7.5



