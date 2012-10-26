Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mihaix.lindner@linux.intel.com>) id 1TRlGn-0008IM-C5
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Oct 2012 16:52:21 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Oct 2012 07:37:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,654,1344236400"; d="scan'208";a="209706545"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 26 Oct 2012 07:37:44 -0700
Received: from mlindnex-mobl1.ger.corp.intel.com (unknown [10.237.105.54])
	by linux.intel.com (Postfix) with ESMTP id 6DC0D2C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2012 07:37:44 -0700 (PDT)
From: Mihai Lindner <mihaix.lindner@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Oct 2012 17:37:16 +0300
Message-Id: <cover.1351261721.git.mihaix.lindner@linux.intel.com>
X-Mailer: git-send-email 1.7.12.4
Subject: [PATCH 0/2] check lsb_release exists and avoid sstate subdirectory
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
X-List-Received-Date: Fri, 26 Oct 2012 14:52:21 -0000

Make sure `lsb_release` exists;
Documentation updated to reflect the above;
Replace "/" to avoid subdirectories in ./sstate-cache/

Signed-off-by: Mihai Lindner <mihaix.lindner@linux.intel.com>
---
The following changes since commit 3f14eb3674d44b61fe19016902d41cae57be8e6c:

  poky.conf: Add multiarch to DISTRO_FEATURES (2012-10-25 17:50:19 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mihai/lsb_release
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mihai/lsb_release

Mihai Lindner (2):
  lsb_release: add sanity to avoid Unknown
  distro_identifier: replace slash with hyphen

 documentation/poky.ent      | 4 ++--
 meta/classes/sanity.bbclass | 2 +-
 meta/lib/oe/lsb.py          | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
1.7.12.4



