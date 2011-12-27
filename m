Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RfX0v-0005bU-Bq
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Dec 2011 14:24:21 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Dec 2011 05:17:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="90644482"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 27 Dec 2011 05:17:07 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Dec 2011 21:06:44 +0800
Message-Id: <cover.1324991041.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1] Fix gsettings-data-convert seg fault
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
X-List-Received-Date: Tue, 27 Dec 2011 13:24:21 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

All,
This is the fix for [YOCTO #1779]. Seg fault comes from missing of
"gschemas.compiled" made by glib-compile-schemas.

Pls. help to pull.
Thanks,
Edwin

The following changes since commit 0ef108a0152bb4893741ac95857525fc50b8d3a6:

  self-hosted-image: Add builder user and mini X (2011-12-22 19:28:56 +0800)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/build-appliance2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/build-appliance2

Zhai Edwin (1):
  gnome-keyring: fix gsettings_data_convert seg fault

 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)



