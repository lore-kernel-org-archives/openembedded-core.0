Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QWElK-0001dG-GR
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 23:33:34 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Jun 2011 14:30:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,360,1304319600"; d="scan'208";a="14054865"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by orsmga001.jf.intel.com with ESMTP; 13 Jun 2011 14:30:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jun 2011 14:30:06 -0700
Message-Id: <cover.1308000501.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 0/1] Bump PR for autoconf/automake find correct perl
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
X-List-Received-Date: Mon, 13 Jun 2011 21:33:34 -0000

This fixes an issue where autoconf and automake are finding the wrong perl
and causing git-native and other recipes to fail.  Bump the PR to force a rebuild.

Sau!

The following changes since commit 6a3e57fcd3a172c9b2707510d65741734c98a143:

  Revert "gcc: rebase the patch to avoid patch rejection" (2011-06-10 12:56:29 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/perl-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/perl-fix

Saul Wold (1):
  autoconf/automake: Bump PR to resolve perl-native issue

 meta/recipes-devtools/autoconf/autoconf_2.68.bb |    2 +-
 meta/recipes-devtools/automake/automake.inc     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.3.4



