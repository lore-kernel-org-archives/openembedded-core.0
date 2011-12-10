Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1RZAZ1-00087J-Ni
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Dec 2011 01:13:15 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 Dec 2011 16:05:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="84193128"
Received: from unknown (HELO cenodoxus.amr.corp.intel.com) ([10.255.12.199])
	by azsmga001.ch.intel.com with ESMTP; 09 Dec 2011 16:05:17 -0800
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Dec 2011 16:05:14 -0800
Message-Id: <cover.1323475141.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/3] License: dash fix, deb support and ast parse fix
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
X-List-Received-Date: Sat, 10 Dec 2011 00:13:16 -0000

Three patches here, one of which requires 4a13766c7b223d.

- Fixed the bashism during license manifest creation.
- Add deb as a valid pkg type for manifest creation. This requires 4a137766c
- Handle LICENSE fields that ast chokes on nicer.

The following changes since commit af7fbd6083f4b5f1770e58fe0a2262951037c176:

  connman: disable ntp support (2011-12-09 19:18:24 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib eflanagan/license_fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/license_fixes

Elizabeth Flanagan (3):
  license.bbclass: remove bashism.
  license.bbclass: remove deb exlusion
  license/copyleft: exception for ast parse

 meta/classes/copyleft_compliance.bbclass |    2 +
 meta/classes/license.bbclass             |   54 +++++++++++++++---------------
 2 files changed, 29 insertions(+), 27 deletions(-)



