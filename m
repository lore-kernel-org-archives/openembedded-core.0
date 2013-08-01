Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 49B066B1ED
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 17:17:19 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Aug 2013 10:17:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,795,1367996400"; d="scan'208";a="340243452"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.169])
	by azsmga001.ch.intel.com with ESMTP; 01 Aug 2013 10:17:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Aug 2013 18:17:15 +0100
Message-Id: <cover.1375377305.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH v2 0/2] sanity.bbclass fixes
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
X-List-Received-Date: Thu, 01 Aug 2013 17:17:19 -0000

Changes since v1:
* Change the suid root binary check to a run-once check to be consistent
  with other similar checks
* Add a patch fixing grammatical errors in messages 

The following changes since commit f192c444c2d88c49738bea4ff4c3af0cc72916de:

  texinfo: Update to 5.1 (2013-07-31 06:56:28 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/sanity
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/sanity

Paul Eggleton (2):
  classes/sanity: check for suid root command evility
  classes/sanity: fix some grammatical errors in messages

 meta/classes/sanity.bbclass | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

-- 
1.8.1.2


