Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SuPKl-0002Ym-31
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 16:46:35 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 26 Jul 2012 07:35:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="127179854"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.37])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Jul 2012 07:35:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jul 2012 15:34:58 +0100
Message-Id: <cover.1343313237.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] dbg/dev package dependency improvements
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
X-List-Received-Date: Thu, 26 Jul 2012 14:46:35 -0000

The following changes since commit 14b70cd222519e5bccaca955334787f123d9fc54:

  base/perlnative/pythonnative/gzipnative: Add a new variable to enable easier handling of native path issues (2012-07-26 14:55:35 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/dbgdeps
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/dbgdeps

Paul Eggleton (2):
  classes/package: do not add self-dependencies to dev/dbg packages
  classes/package: reduce dbg package dependencies

 meta/classes/package.bbclass |   36 +++++++++++++++++++++++++++++-------
 meta/classes/task.bbclass    |    3 +++
 2 files changed, 32 insertions(+), 7 deletions(-)

-- 
1.7.9.5



