Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R6ZM1-0002Xj-BF
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 04:49:37 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 21 Sep 2011 19:44:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,420,1312182000"; d="scan'208";a="19452618"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Sep 2011 19:44:16 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Sep 2011 10:51:21 +0800
Message-Id: <cover.1316659695.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1][PULL] libglade: python environment fix
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
X-List-Received-Date: Thu, 22 Sep 2011 02:49:37 -0000

Hi Saul,

This pull request is to change the python environment setting in
libglade, which should fix the issue of sato-sdk rootfs error,
please help to review and pull.

Thanks,
Dongxiao

The following changes since commit 80650bf4bce83e4e8d785e9a69eac0abbcdc6844:

  procps 3.2.8: remove initscript (2011-09-22 03:11:30 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/bugfix
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/bugfix

Dongxiao Xu (1):
  libglade: fix the python environment settings

 .../libglade-2.6.4/python_environment.patch        |    9 +++++++++
 meta/recipes-gnome/libglade/libglade_2.6.4.bb      |    4 ++--
 2 files changed, 11 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-gnome/libglade/libglade-2.6.4/python_environment.patch



