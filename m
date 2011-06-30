Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qc5Jr-0004Xv-Ar
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 02:41:26 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Jun 2011 17:37:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,446,1304319600"; d="scan'208";a="22119441"
Received: from swold-mobl.jf.intel.com ([10.24.82.35])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jun 2011 17:37:39 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2011 17:35:48 -0700
Message-Id: <cover.1309393926.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 0/1] util-linux: Rebase remove-lscpu patch for non-gplv3
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
X-List-Received-Date: Thu, 30 Jun 2011 00:41:26 -0000

This patch rebases the remove-lscpu patch for util-linux so that it
can build a non-gplv3 compliant image.

Sau!

The following changes since commit ff014d9634638457622f6019b163e75bafcefada:

  task-base: add 3G into DISTRO_FEATURE (2011-06-29 14:46:46 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Saul Wold (1):
  util-linux: Rebase remove-lscpu patch from non-gplv3

 .../util-linux-2.19.1/remove-lscpu.patch           |  120 ++++++++++---------
 meta/recipes-core/util-linux/util-linux_2.19.1.bb  |    2 +-
 2 files changed, 64 insertions(+), 58 deletions(-)

-- 
1.7.3.4



