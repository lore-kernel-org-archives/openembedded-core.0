Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UJ8Ic-0007bF-MM
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 21:10:58 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 22 Mar 2013 12:53:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,893,1355126400"; d="scan'208";a="217882345"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.1])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Mar 2013 12:53:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 19:53:51 +0000
Message-Id: <cover.1363981980.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/2] Buildhistory improvements
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
X-List-Received-Date: Fri, 22 Mar 2013 20:11:06 -0000

(No changes from a few minutes ago, just not erroneously marked as RFC this time.)

The following changes since commit 7846f68537a942d340d5931e23a4fceb84b6edcb:

  vte: Fix conflict between FILES_${PN}-dbg and FILES_vte-dbg (2013-03-22 17:05:09 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-fix5
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory-fix5

Paul Eggleton (2):
  classes/buildhistory: implement history collection for SDKs
  classes/buildhistory: trim trailing spaces in file listings

 meta/classes/buildhistory.bbclass      |  130 ++++++++++++++++++++++----------
 meta/classes/package_deb.bbclass       |   28 +++++++
 meta/classes/package_ipk.bbclass       |   24 ++++++
 meta/classes/package_rpm.bbclass       |   17 +++++
 meta/classes/populate_sdk_base.bbclass |    2 +
 meta/classes/populate_sdk_deb.bbclass  |    1 +
 meta/classes/populate_sdk_ipk.bbclass  |    2 +
 meta/classes/populate_sdk_rpm.bbclass  |    1 +
 meta/classes/rootfs_deb.bbclass        |   27 -------
 meta/classes/rootfs_ipk.bbclass        |   22 ------
 meta/classes/rootfs_rpm.bbclass        |   16 ----
 11 files changed, 165 insertions(+), 105 deletions(-)

-- 
1.7.10.4



