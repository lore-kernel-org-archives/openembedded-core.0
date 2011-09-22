Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R6cHq-0001KL-EH
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 07:57:30 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 21 Sep 2011 22:52:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,421,1312182000"; d="scan'208";a="19492396"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Sep 2011 22:52:07 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Sep 2011 13:59:14 +0800
Message-Id: <cover.1316670879.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1][PULL] usbutils: inherit gettext
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
X-List-Received-Date: Thu, 22 Sep 2011 05:57:30 -0000

Hi Richard and Saul,

This pull request is to fix the do_configure error in usbutils error, reporting errors like:

cp: cannot stat `/distro/dongxiao/build-ml9/tmp/sysroots/qemux86-64/usr/share/aclocal/codeset.m4': No such file or directory.
cp: cannot stat `/distro/dongxiao/build-ml9/tmp/sysroots/qemux86-64/usr/share/aclocal/fcntl-o.m4': No such file or directory.
...

Please help to review and pull.

Thanks,
Dongxiao


The following changes since commit 76052861cc95fd4ad4c4b9eb6ce4cd1065ad4dc9:

  libxml2: reinclude a -staticdev package (2011-09-22 05:11:50 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/bugfix
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/bugfix

Dongxiao Xu (1):
  usbutils: inherit gettext to avoid configure error

 meta/recipes-bsp/usbutils/usbutils_0.91.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)



