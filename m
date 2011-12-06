Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1RXrAR-0003HE-Ff
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 10:18:28 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Dec 2011 01:11:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="83930938"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by orsmga002.jf.intel.com with ESMTP; 06 Dec 2011 01:11:38 -0800
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2011 17:09:51 +0800
Message-Id: <cover.1323162150.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1]Fix inappropriate default protocal in distrodata.bbclass
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
X-List-Received-Date: Tue, 06 Dec 2011 09:18:28 -0000

Hi all,
	Some git repo recipes use rsync protocal as their default protocal, this will lead errors when checking upstreawm version.
	Change default protocal from rsync to git for those git recipes.

Thanks,
Lei

The following changes since commit 0a7a8597be05c8def8af58eecab49d963dc9d757:
  Richard Purdie (1):
        libsdl: Disable pulseaudio explicitly

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib lmei3/fix-protocal
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/fix-protocal

Mei Lei (1):
  distrodata.bbclass:Fix some recipes upstream version check issue.

 meta/classes/distrodata.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)



