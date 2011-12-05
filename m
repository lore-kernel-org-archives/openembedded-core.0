Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RXdNZ-0000wP-VF
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Dec 2011 19:35:06 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Dec 2011 10:28:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,300,1320652800"; d="scan'208";a="44067105"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.228])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Dec 2011 10:28:17 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Dec 2011 18:28:11 +0000
Message-Id: <cover.1323109431.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] buildhistory fix
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
X-List-Received-Date: Mon, 05 Dec 2011 18:35:06 -0000

Because of a screw-up by me when I fixed the copyright date in the
buildhistory branch, a previous version of the tree got pushed and the
default to not create package history files for every version got lost.
This patch restores the functionality.

(To be clear, this change *was* in the original RFC pull request.)

The following changes since commit d512a41ed8843a66ed9c5c5978c5f33248083464:

  libx11-trim: Fix keysymdir configure option mismatch (2011-12-05 16:47:50 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory-fixes

Paul Eggleton (1):
  classes/buildhistory: do not save old packagehistory files by default

 meta/classes/buildhistory.bbclass |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

-- 
1.7.5.4



