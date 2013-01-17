Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kevin.strasser@linux.intel.com>) id 1TvydB-0004tI-B7
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 00:12:38 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Jan 2013 14:54:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,488,1355126400"; d="scan'208";a="248678292"
Received: from wrk.jf.intel.com ([10.7.202.162])
	by orsmga001.jf.intel.com with ESMTP; 17 Jan 2013 14:55:41 -0800
From: Kevin Strasser <kevin.strasser@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2013 14:54:27 -0800
Message-Id: <cover.1358463028.git.kevin.strasser@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] archiver: remove create_diff_gz
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
X-List-Received-Date: Thu, 17 Jan 2013 23:12:39 -0000

The following changes since commit 98f17da7ccc1bf79fc5894f90e52769bdbcf89df:

  update-rc.d: fix failure on target (2013-01-17 20:16:38 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib strassek/create_diff_gz
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=strassek/create_diff_gz

Kevin Strasser (1):
  archiver: remove create_diff_gz

 meta/classes/archive-configured-source.bbclass |   17 +++----
 meta/classes/archive-original-source.bbclass   |   17 +++----
 meta/classes/archive-patched-source.bbclass    |   17 +++----
 meta/classes/archiver.bbclass                  |   62 ++----------------------
 4 files changed, 25 insertions(+), 88 deletions(-)

-- 
1.7.9.5



