Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PwHdq-0001vJ-Qn
	for openembedded-core@lists.openembedded.org;
	Sun, 06 Mar 2011 18:21:14 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Mar 2011 09:19:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,272,1297065600"; d="scan'208";a="894350908"
Received: from unknown (HELO localhost) ([10.255.12.181])
	by fmsmga001.fm.intel.com with ESMTP; 06 Mar 2011 09:19:39 -0800
Message-Id: <cover.1299431945.git.sgw@linux.intel.com>
Old-Date: Sun, 6 Mar 2011 09:19:05 -0800
Date: Sun, 06 Mar 2011  9:19:38 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 0/2] 2 More Dependency Fixes for RC2
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
X-List-Received-Date: Sun, 06 Mar 2011 17:21:15 -0000

From: Saul Wold <sgw@linux.intel.com>

Fix more dependency issues

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: distro/oe-core
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=distro/oe-core

Thanks,
    Saul Wold <sgw@linux.intel.com>
---


Saul Wold (2):
  gst-plugins: Added hal to DEPENDS
  attr: Added ncurses to depends

 meta/recipes-multimedia/gstreamer/gst-plugins.inc |    2 +-
 meta/recipes-support/attr/attr.inc                |    2 ++
 2 files changed, 3 insertions(+), 1 deletions(-)



