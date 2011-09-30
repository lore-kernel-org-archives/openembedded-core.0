Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1R9Ypr-00086q-0T
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 10:52:47 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 30 Sep 2011 01:47:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="57526048"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 30 Sep 2011 01:47:17 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 16:42:53 +0800
Message-Id: <cover.1317371971.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1] oprofileui: Update SRCREV
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
X-List-Received-Date: Fri, 30 Sep 2011 08:52:50 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Hi,
This patch update the oprofileui SRCREV to reflect following 2 patches already in upstream:
migrate-from-gnomevfs-to-gio.patch & dso_linking_change_build_fix.patch

Pls. help to pull.

Thanks,
Edwin

The following changes since commit 9d1db6cc928199f8ac4960e8d4648563ef141427:

  python: fix sqlite RPATH issue (2011-09-29 16:57:30 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/master2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master2

Zhai Edwin (1):
  oprofileui: Update SRCREV to reflect recent accpeted patches by
    upstream

 meta/recipes-kernel/oprofile/oprofileui_git.bb |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)



