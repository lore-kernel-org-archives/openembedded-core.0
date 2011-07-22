Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QkPc1-0005gA-PJ
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Jul 2011 01:58:34 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 Jul 2011 16:54:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,250,1309762800"; d="scan'208";a="30520846"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 22 Jul 2011 16:54:23 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 16:54:18 -0700
Message-Id: <cover.1311378711.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 0/3] Fix for share state native binary issue
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
X-List-Received-Date: Fri, 22 Jul 2011 23:58:34 -0000

Richard,

This fixes the install-catalog issue with shared state native
dependencies.  This is the point fix, it does not address the
underlying issue which will take more work and time.

Sau!


The following changes since commit b4c23fce3eadaff8fc621d38759d493cd03cc131:

  consolekit 0.4.5: fix PAM installation dir (2011-07-22 11:56:42 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Saul Wold (3):
  openjade-native: Add SYSROOT_PREPROCESS_FUNC
  docbook-sgml-dtd-native: Add SYSROOT_PREPROCESS_FUNC
  docbook-dsssl-stylesheets-native: Add SYSROOT_PREPROCESS_FUNC

 .../docbook-dsssl-stylesheets-native_1.79.bb       |   12 ++++++++++--
 .../docbook-sgml-dtd/docbook-sgml-dtd-native.inc   |   11 +++++++++--
 .../openjade/openjade-native_1.3.2.bb              |   12 ++++++++++--
 3 files changed, 29 insertions(+), 6 deletions(-)

-- 
1.7.3.4



