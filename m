Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1QrMol-00085w-Ql
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 06:24:28 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 10 Aug 2011 21:19:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,354,1309762800"; d="scan'208";a="37312777"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by azsmga001.ch.intel.com with ESMTP; 10 Aug 2011 21:19:55 -0700
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2011 12:28:05 +0800
Message-Id: <cover.1313036597.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1]Fix bug 1151
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
X-List-Received-Date: Thu, 11 Aug 2011 04:24:28 -0000

The following changes since commit a1f87ec65fa1a6d5ce9a010548dbe7c01ab9b711:
  Kumar Gala (1):
        eglibc: force GLIBC_EXTRA_OECONF to not be uset for nativesdk

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib lmei3/bug1151
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/bug1151

Mei Lei (1):
  init-install.sh: Fix make partition and make file system issues

 .../initrdscripts/files/init-install.sh            |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)



