Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QboWM-0005gs-Nk
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 08:45:10 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Jun 2011 23:41:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,442,1304319600"; d="scan'208";a="24130175"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by fmsmga001.fm.intel.com with ESMTP; 28 Jun 2011 23:41:27 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2011 14:39:45 +0800
Message-Id: <cover.1309329457.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1] web-webkit: enable https web page accessing
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
X-List-Received-Date: Wed, 29 Jun 2011 06:45:10 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Let web-webkit RRECOMMENDS glib-networing for TLS support.

The following changes since commit a4f3e006e1f2fd93f156012af2a05adccf41d065:

  u-boot-mkimage: bump version to 2011.03 (2011-06-28 17:13:19 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/master
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master

Zhai Edwin (1):
  web-webkit: recommends glib-networking to access https web page

 meta/recipes-sato/web/web-webkit_svn.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)



