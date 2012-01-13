Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RllGu-0007aO-99
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 18:50:36 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 Jan 2012 09:43:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95565794"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.110])
	by azsmga001.ch.intel.com with ESMTP; 13 Jan 2012 09:43:01 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2012 17:42:55 +0000
Message-Id: <cover.1326476501.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/4] Error message fixes / cleanup
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
X-List-Received-Date: Fri, 13 Jan 2012 17:50:36 -0000

A trio of of minor improvements to error messages as well as the removal
of packagehistory.bbclass.

The following changes since commit bd047935305c872b565f30b46c94b7077e5fb3a2:

  patch.bbclass: Ensure the DATE and SRCDATE variable exclusions apply to the correct function (2012-01-13 16:56:20 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/fixes10
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/fixes10

Paul Eggleton (4):
  classes/base: note variable name in COMPATIBLE_* skip messages
  conf/bitbake.conf: allow wget to output error messages
  classes/package: remove out-of-date notice referring to the OE
    bugtracker
  classes/packagehistory: remove now obsolete class

 meta/classes/base.bbclass           |    4 +-
 meta/classes/package.bbclass        |    3 -
 meta/classes/packagehistory.bbclass |  249 -----------------------------------
 meta/conf/bitbake.conf              |    6 +-
 4 files changed, 5 insertions(+), 257 deletions(-)
 delete mode 100644 meta/classes/packagehistory.bbclass

-- 
1.7.5.4



