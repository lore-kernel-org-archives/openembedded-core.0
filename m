Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 601697317D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 23:26:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 17 Jan 2016 15:27:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,309,1449561600"; d="scan'208";a="892646835"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.180.176])
	by orsmga002.jf.intel.com with ESMTP; 17 Jan 2016 15:26:58 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jan 2016 12:26:32 +1300
Message-Id: <cover.1453073170.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/1] Extensible SDK regression fix
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
X-List-Received-Date: Sun, 17 Jan 2016 23:27:00 -0000

The following changes since commit a42229df424552955c0ac62da1063461f97f5938:

  openssh: CVE-2016-1907 (2016-01-17 11:32:21 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/extsdk-depends-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/extsdk-depends-fix

Paul Eggleton (1):
  classes/populate_sdk_ext: fix task dependency regression

 meta/classes/populate_sdk_ext.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.5.0


