Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SJtlA-0006FO-20
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 23:46:56 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Apr 2012 14:37:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="154323050"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.96])
	by fmsmga002.fm.intel.com with ESMTP; 16 Apr 2012 14:37:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Apr 2012 22:37:15 +0100
Message-Id: <cover.1334611909.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] Fix segfault in connman-gnome
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
X-List-Received-Date: Mon, 16 Apr 2012 21:46:56 -0000

Unfortunately this segfault did not show up until I was able to test
connecting to a wifi network from a Poky system at runtime; all other
tests passed (including the same operation on an Ubuntu system).


The following changes since commit 4e1a8ed1ab7e7bd950e511c79ddfe072cb280a6e:

  bitbake.conf: Include abi_version.conf in a early stage (2012-04-16 12:51:50 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/connman-gnome-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/connman-gnome-fix

Paul Eggleton (1):
  connman-gnome: fix segfault on connect

 ...me-fix-segfault-due-to-unchecked-null-val.patch |   30 ++++++++++++++++++++
 .../connman/connman-gnome_0.5.bb                   |    5 ++-
 2 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman-gnome/0007-connman-gnome-fix-segfault-due-to-unchecked-null-val.patch

-- 
1.7.5.4



