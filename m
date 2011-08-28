Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QxmDZ-0000vY-3v
	for openembedded-core@lists.openembedded.org;
	Sun, 28 Aug 2011 22:44:33 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Aug 2011 13:39:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,294,1312182000"; d="scan'208";a="11892811"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.18.134])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Aug 2011 13:39:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 28 Aug 2011 21:39:31 +0100
Message-Id: <cover.1314563914.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1] Fix binutils fetch failure
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
X-List-Received-Date: Sun, 28 Aug 2011 20:44:33 -0000

The following changes since commit 81aa4bfbde871af1d569b64499c34a315bf6218e:

  classes/sanity: enhance the network connectivity test (2011-08-25 08:49:12 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/binutils-2211a
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/binutils-2211a

Paul Eggleton (1):
  binutils: update to 2.21.1a

 ....21.1.bb => binutils-cross-canadian_2.21.1a.bb} |    0
 ...s-cross_2.21.1.bb => binutils-cross_2.21.1a.bb} |    0
 ...ssdk_2.21.1.bb => binutils-crosssdk_2.21.1a.bb} |    0
 .../{binutils_2.21.1.bb => binutils_2.21.1a.bb}    |    9 ++++++---
 4 files changed, 6 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.21.1.bb => binutils-cross-canadian_2.21.1a.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.21.1.bb => binutils-cross_2.21.1a.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.21.1.bb => binutils-crosssdk_2.21.1a.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils_2.21.1.bb => binutils_2.21.1a.bb} (85%)

-- 
1.7.4.1



