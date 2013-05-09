Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UaTVe-0001pZ-W8
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 18:15:59 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 May 2013 08:55:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,641,1363158000"; d="scan'208";a="334364315"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.12.169])
	by orsmga002.jf.intel.com with ESMTP; 09 May 2013 08:57:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 May 2013 16:57:46 +0100
Message-Id: <cover.1368115039.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/2] buildhistory improvements
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 May 2013 16:16:03 -0000
X-List-Received-Date: Thu, 09 May 2013 16:16:03 -0000

The following changes since commit 2253e9f12734c6e6aa489942b5e4628eca1fa29d:

  classes/lib: Fix getcmdstatus breakage (2013-05-09 16:05:02 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-7
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory-7

Paul Eggleton (2):
  buildhistory-diff: improve bad command-line argument handling
  classes/buildhistory: track contents of selected files in images

 meta/classes/buildhistory.bbclass    | 10 ++++++++++
 meta/lib/oe/buildhistory_analysis.py | 23 +++++++++++++++++------
 scripts/buildhistory-diff            | 22 +++++++++++++++++-----
 3 files changed, 44 insertions(+), 11 deletions(-)

-- 
1.8.1.2



