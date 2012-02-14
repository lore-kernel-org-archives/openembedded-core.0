Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RxJrE-0008JY-PX
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 15:59:54 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 14 Feb 2012 06:51:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="125311736"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by fmsmga002.fm.intel.com with ESMTP; 14 Feb 2012 06:51:23 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Date: Tue, 14 Feb 2012 22:51:45 +0800
Message-Id: <cover.1329230985.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/2] self-hosted-image: 2 new patches from Dexuan: Feb 14, 2012
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
X-List-Received-Date: Tue, 14 Feb 2012 14:59:54 -0000

The following changes since commit 41a83ccfe50ec69425a4828fb5836d38d3f99e67:

  guile: fix cross configure failure (2012-02-10 17:01:42 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/self-hosted-v8
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/self-hosted-v8

Dexuan Cui (2):
  mini-x-session: try to use a resolution that's big enough for hob2's
    window
  task-self-hosted: add connman and connman-plugin-ethernet

 meta/recipes-core/tasks/task-self-hosted.bb        |    4 +++-
 .../mini-x-session/files/mini-x-session            |    4 ++++
 .../mini-x-session/mini-x-session_0.1.bb           |    2 ++
 3 files changed, 9 insertions(+), 1 deletions(-)

-- 
1.7.6



