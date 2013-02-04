Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U2IZH-0005ZV-Hp
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 10:42:30 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 Feb 2013 01:26:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,598,1355126400"; d="scan'208";a="282427136"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 04 Feb 2013 01:26:13 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2013 11:26:04 +0200
Message-Id: <cover.1359968730.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/5] Remove /var/cache from volatiles directory
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
X-List-Received-Date: Mon, 04 Feb 2013 09:42:31 -0000

Hi,

Re-generating applications' cache every time the system is rebooted is not a
very efficient process for an embedded device. Usually, the cache directory is
used by applications to store data resulting from time consmuming I/O or
calculation. So, this patchset will take out /var/cache from tmpfs.

Thanks,
Laurentiu

The following changes since commit 75f470cd18d693a9a96d9849291c2c8de4dcbeb8:

  qt4: Add space for _appends (2013-02-01 22:49:47 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/remove_cache_from_volatiles
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/remove_cache_from_volatiles

Laurentiu Palcu (5):
  base-files: remove /var/cache from volatiles
  fs-perms: remove /var/cache from volatiles
  initscripts: remove /var/cache from volatiles
  systemd: remove /var/cache from volatiles
  rpm: remove /var/volatiles/cache/rpm from the FILEs list

 meta/files/fs-perms.txt                            |    1 -
 meta/recipes-core/base-files/base-files_3.0.14.bb  |    4 ++--
 .../initscripts/initscripts-1.0/volatiles          |    2 --
 .../systemd/systemd/00-create-volatile.conf        |    1 -
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    1 -
 5 files changed, 2 insertions(+), 7 deletions(-)

-- 
1.7.9.5



