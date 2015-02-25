Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2DAAF71F1B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Feb 2015 11:22:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 25 Feb 2015 03:22:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,644,1418112000"; d="scan'208";a="690514689"
Received: from gcattani-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.20.5])
	by orsmga002.jf.intel.com with ESMTP; 25 Feb 2015 03:22:31 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Feb 2015 11:22:23 +0000
Message-Id: <cover.1424863308.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/2] Terminal fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Feb 2015 11:22:36 -0000

Fix up some regressions and Konsole 2.x+ support. The Konsole patch can
be left until M4 if we want to be conservative.

These were tested with both old and new versions of konsole and
gnome-terminal.


The following changes since commit c578f5d34ce1718aaeb7dcbf3fc014fd48bac5fc:

  build-appliance-image: Update to master head revision (2015-02-24 23:37:49 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/terminal
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/terminal

Paul Eggleton (2):
  lib/oe/terminal: fix regressions
  lib/oe/terminal: fix konsole terminal support for KDE 4.x

 meta/lib/oe/terminal.py | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

-- 
1.9.3


