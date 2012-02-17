Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RyLpK-000849-7c
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Feb 2012 12:18:11 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 17 Feb 2012 03:09:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="118595396"
Received: from dcui-desktop.sh.intel.com ([10.239.36.38])
	by fmsmga001.fm.intel.com with ESMTP; 17 Feb 2012 03:09:54 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org, sgw@linux.intel.com,
	dvhart@linux.intel.com
Date: Fri, 17 Feb 2012 19:10:14 +0800
Message-Id: <cover.1329470047.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/2] self-hosted-image: 2 new patches from Dexuan: Feb 17, 2012
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
X-List-Received-Date: Fri, 17 Feb 2012 11:18:11 -0000

Hi Saul, Darren and all,

This is actually v3 of the old patches("self-hosted-image: generate the
.hdddirect and .vmdk image files") I sent 1 month ago.
I'm sorry for sending this out so late, as I was pushed tightly on one other
task... :-(

The new recipe self-hosted-directdisk-image.bb invokes self-hosted-image's
do_rootfs automatically. That is, self-hosted-directdisk-image.bb is an
enhanced version of self-hosted-image.bb.
If we only want to run the generated .ext3 image with "runqemu", we can
run "bitbake self-hosted-image"; if we also want to generated a .vmdk image,
we can run "bitbake self-hosted-directdisk-image".

Please comment. Thanks!

-------------

The following changes since commit 367f34f8bfb816bc396c89c95813246c16a76e1b:

  linux-yocto: enable smp for qemux86 (2012-02-16 13:59:27 +0800)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/self-hosted-v81
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/self-hosted-v81

Dexuan Cui (2):
  syslinux.bbclass: make PROMPT settable
  self-hosted-directdisk-image: create .hdddirect and .vmdk images

 meta/classes/boot-directdisk.bbclass               |    4 +++-
 meta/classes/syslinux.bbclass                      |   11 ++++++-----
 meta/conf/machine/include/qemu.inc                 |    2 ++
 .../images/self-hosted-directdisk-image.bb         |   15 +++++++++++++++
 4 files changed, 26 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-core/images/self-hosted-directdisk-image.bb

-- 
1.7.6



