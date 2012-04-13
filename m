Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1SImkH-0001kw-NW
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 22:05:25 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 Apr 2012 12:56:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="130693898"
Received: from unknown (HELO localhost) ([10.255.12.66])
	by azsmga001.ch.intel.com with ESMTP; 13 Apr 2012 12:56:02 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Apr 2012 14:55:59 -0500
Message-Id: <cover.1334346682.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/2] systemtap doc build fix
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
X-List-Received-Date: Fri, 13 Apr 2012 20:05:26 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

This patchset fixes a documentation build problem with docproc, then
turns documentation generation off by default, since when it works,
it adds a lot to the build time.

The following changes since commit 04b16f1038f7cae445d741e86c2cc19c70f991c1:
  Andrei Gherzan (1):
        rpm-native: Compile python rpm module (with-python)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/2193-fix
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/2193-fix

Tom Zanussi (2):
  systemtap: fix docproc build error
  systemtap: disable document generation by default

 .../systemtap/systemtap/docproc-build-fix.patch    |   19 +++++++++++++++++++
 meta/recipes-kernel/systemtap/systemtap_git.bb     |   10 +++++++++-
 meta/recipes-kernel/systemtap/systemtap_git.inc    |    4 +++-
 3 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/docproc-build-fix.patch



