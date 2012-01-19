Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rnsdm-00051o-Gz
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 15:06:58 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Jan 2012 05:59:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="100399915"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.198])
	by orsmga002.jf.intel.com with ESMTP; 19 Jan 2012 05:59:17 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 13:59:14 +0000
Message-Id: <cover.1326981478.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/2] Misc fixes
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
X-List-Received-Date: Thu, 19 Jan 2012 14:06:58 -0000

A fix for the patch error backtrace as well as removing PRIORITY from
the recently upgraded hdparm recipe.

The following changes since commit a0f5dd25a37fe3b8664c2133e80b6214559f93f6:

  package_rpm.bbclass: Add support for filenames with spaces (2012-01-17 16:20:46 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/fixes11
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/fixes11

Paul Eggleton (2):
  classes/patch: avoid backtrace when patch does not apply
  hdparm: remove PRIORITY

 meta/classes/patch.bbclass                  |    5 ++++-
 meta/lib/oe/patch.py                        |   10 +++++-----
 meta/recipes-extended/hdparm/hdparm_9.37.bb |    1 -
 3 files changed, 9 insertions(+), 7 deletions(-)

-- 
1.7.5.4



