Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1U1RIm-0006ir-Ak
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Feb 2013 01:50:05 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 Feb 2013 16:32:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,588,1355126400"; d="scan'208";a="256580641"
Received: from unknown (HELO localhost) ([10.255.12.85])
	by orsmga001.jf.intel.com with ESMTP; 01 Feb 2013 16:34:05 -0800
From: tom.zanussi@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Feb 2013 18:34:03 -0600
Message-Id: <cover.1359764964.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/1] systemtap 'crosstap' fix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 02 Feb 2013 00:50:07 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

This is a patch to systemtap and fixes a problem where a passed-in
builddir gets lost in the session copy constructor when connecting
to remote hosts, resulting in failed script compilation.

The patch has been submitted upstream but no feedback yet.

The following changes since commit 75f470cd18d693a9a96d9849291c2c8de4dcbeb8:

  qt4: Add space for _appends (2013-02-01 22:49:47 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/systemtap-constructor-fix
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/systemtap-constructor-fix

Tom Zanussi (1):
  systemtap: make session copy constructor pick up kernel builddir

 .../systemtap/systemtap/copy-constructor-builddir.patch | 17 +++++++++++++++++
 meta/recipes-kernel/systemtap/systemtap_git.bb          |  2 +-
 meta/recipes-kernel/systemtap/systemtap_git.inc         |  1 +
 3 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/copy-constructor-builddir.patch

-- 
1.7.11.4



