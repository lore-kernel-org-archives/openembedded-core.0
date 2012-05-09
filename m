Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SSFrU-0002jF-0w
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 01:00:00 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 May 2012 15:50:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="142077325"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.218])
	by orsmga002.jf.intel.com with ESMTP; 09 May 2012 15:50:04 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2012 15:50:02 -0700
Message-Id: <cover.1336603412.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH 0/1] eglibc Packaging fix
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
X-List-Received-Date: Wed, 09 May 2012 23:00:00 -0000

Richard,

This is the correct fix for the eglibc packaging issue, the one that got
pulled was an under test at the time you pulled it.

Sorry for the confusion.

Sau!


The following changes since commit 910452727fc277c1caec7612b36c37b58d845350:

  eglibc: Add patch to fix /var installation location (2012-05-09 21:42:37 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Saul Wold (1):
  eglibc: Add patch to fix /var installation location

 ....patch => use-localstatedir-for-vardbdir.patch} |    6 ++++--
 meta/recipes-core/eglibc/eglibc_2.15.bb            |    4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)
 rename meta/recipes-core/eglibc/eglibc-2.15/{add-prefix-to-var.patch => use-localstatedir-for-vardbdir.patch} (74%)

-- 
1.7.7.6



