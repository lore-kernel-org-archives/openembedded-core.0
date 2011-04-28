Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1QFSOV-0003Zz-CT
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Apr 2011 16:40:39 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 28 Apr 2011 07:37:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,280,1301900400"; d="scan'208";a="427135224"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost)
	([10.239.47.161])
	by azsmga001.ch.intel.com with ESMTP; 28 Apr 2011 07:37:00 -0700
Message-Id: <cover.1304000937.git.lei.mei@intel.com>
Old-Date: Thu, 28 Apr 2011 22:28:57 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Mei Lei <lei.mei@intel.com>
Subject: [PATCH 0/1]distro_check.py: Fix some bugs in distro_check.py
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
Date: Thu, 28 Apr 2011 14:40:39 -0000
X-Original-Date: 四, 28  4月 2011 22:39:43 +0800
X-List-Received-Date: Thu, 28 Apr 2011 14:40:39 -0000

From: Mei Lei <lei.mei@intel.com>

This pull request will fix some bugs in meta/lib/oe/distro_check.py.

The recipe meta-ide-support's alias is Poky, but not defined in distro_exceptions, this will lead an error.
The compare_in_distro_packages_list function omit a split process, this will lead to a form issue.
Change the log file generate way, use symbolic links link to the latest log file, instead of appending every log file in old log.

Thanks
Lei

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: lmei3/distrocheck.py
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/distrocheck.py

Thanks,
    Mei Lei <lei.mei@intel.com>
---


Mei Lei (1):
  distro_check.py: Fix some bugs in distro_check.py

 meta/lib/oe/distro_check.py |   17 +++++++++++------
 1 files changed, 11 insertions(+), 6 deletions(-)



