Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QUwOT-0002pm-0T
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 09:44:37 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 10 Jun 2011 00:41:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,345,1304319600"; d="scan'208";a="16668641"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by fmsmga001.fm.intel.com with ESMTP; 10 Jun 2011 00:41:14 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Fri, 10 Jun 2011 15:41:03 +0800
Message-Id: <cover.1307691436.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.2
Subject: [PATCH 0/1] a fix to bug #1155(git-native failed to compile)
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
X-List-Received-Date: Fri, 10 Jun 2011 07:44:37 -0000

Please review the fix.

The following changes since commit 1b53eef2769d1b5e4ff527ccabf9b700afc02220:

  native/nativesdk: Clean up the depends ordering after bitbake override handling updates (2011-06-09 22:49:10 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/distro
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/distro

Dexuan Cui (1):
  git: restore the dependency on perl-native

 meta/recipes-devtools/git/git.inc        |    6 +++---
 meta/recipes-devtools/git/git_1.7.5.1.bb |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
1.7.2



