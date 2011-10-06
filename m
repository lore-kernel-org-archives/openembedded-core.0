Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RBsjJ-0003fI-9o
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 20:31:37 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 Oct 2011 11:25:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="60635651"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.197])
	by orsmga002.jf.intel.com with ESMTP; 06 Oct 2011 11:25:57 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Oct 2011 11:25:55 -0700
Message-Id: <cover.1317925433.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
Subject: [PATCH 0/1] acl/attr fix for libdir = base_libdir
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
X-List-Received-Date: Thu, 06 Oct 2011 18:31:37 -0000

Richard,

This should address the above situation.

Phil, please let me know if this works for you.

Thanks

Sau!

The following changes since commit cc626b9e1671670a931ea3e528ea4b0f7b2e923b:

  webkit-gtk: Enable dependency tracking since the webkit makefiles have bugs (2011-10-05 14:36:18 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Saul Wold (1):
  acl/attr: don't make symlink if base_libdir = libdir

 meta/recipes-support/attr/ea-acl.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

-- 
1.7.6.2



