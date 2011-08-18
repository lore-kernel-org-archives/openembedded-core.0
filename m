Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QtvPM-00028d-Bx
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 07:44:49 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Aug 2011 22:39:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,243,1312182000"; d="scan'208";a="39696004"
Received: from unknown (HELO swold-MOBL.globalsuite.net) ([10.255.15.2])
	by azsmga001.ch.intel.com with ESMTP; 17 Aug 2011 22:39:55 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Aug 2011 22:39:52 -0700
Message-Id: <cover.1313645920.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] remove lttng-ust from mips GDB Build
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
X-List-Received-Date: Thu, 18 Aug 2011 05:44:49 -0000


Richard,

This patch remove lttng-ust from the mips depends list since lttng-ust
and liburcu do not build for mips at this time.

Sau!

The following changes since commit 2e83e6755441cb14bd907d306974338c15173189:

  kernel: restore crtsavres.o to enable building external modules on powerpc (2011-08-17 15:46:16 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Saul Wold (1):
  gdb: remove lttng-ust from DEPENDS for mips

 meta/recipes-devtools/gdb/gdb-common.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

-- 
1.7.6



