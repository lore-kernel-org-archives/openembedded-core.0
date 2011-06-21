Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QZ02t-00026q-7K
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 14:27:07 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Jun 2011 05:23:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,401,1304319600"; d="scan'208";a="20872962"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by fmsmga001.fm.intel.com with ESMTP; 21 Jun 2011 05:23:32 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jun 2011 20:22:05 +0800
Message-Id: <cover.1308658641.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1] clutter: Use new git repo
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
X-List-Received-Date: Tue, 21 Jun 2011 12:27:07 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

clutter-project.org moved its git repo to gnome.org, so need update SRC_URI.

[YOCTO #1040] got fixed.

The following changes since commit aa366699d62266365c6acd5bea71f02aedb63adc:

  gnome-vfs: remove gnome-vfs as it is deprecated in favour of GVFS and GIO (2011-06-21 14:51:01 +0800)

are available in the git repository at:
  git@git.pokylinux.org:poky-contrib.git gzhai/master
  http://git.pokylinux.org/cgit.cgi//log/?h=gzhai/master

Zhai Edwin (1):
  clutter: Use new git repo

 meta/recipes-graphics/clutter/clutter-box2d_git.bb |    2 +-
 meta/recipes-graphics/clutter/clutter_git.bb       |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)



