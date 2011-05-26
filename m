Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QPhQH-0007LF-7W
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 22:44:49 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 May 2011 13:41:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,276,1304319600"; 
   d="scan'208";a="9563801"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by fmsmga001.fm.intel.com with ESMTP; 26 May 2011 13:41:44 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org,
	elizabeth.flanagan@intel.com
Date: Thu, 26 May 2011 13:41:39 -0700
Message-Id: <cover.1306442263.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.5
Subject: [bugfix 0/1] workaround for gcc 4.6.0 issue on beagleboard
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
X-List-Received-Date: Thu, 26 May 2011 20:44:49 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The following changes since commit 5168b140183c569409d35b19d8a80265ef8d0a78:

  dbus 1.4.1: enable systemd support, but package systemd files seperately (2011-05-26 16:52:00 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/bugfixes
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/bugfixes

Nitin A Kamble (1):
  mesa-xlib: workaround gcc 4.6.0 ICE

 meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

-- 
1.7.3.5



