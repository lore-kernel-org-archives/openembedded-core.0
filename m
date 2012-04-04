Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SFYrz-0005OL-Ex
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 00:40:03 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 04 Apr 2012 15:30:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="85415327"
Received: from unknown (HELO localhost) ([10.255.12.143])
	by AZSMGA002.ch.intel.com with ESMTP; 04 Apr 2012 15:30:45 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org, Saul Wold <sgw@linux.intel.com>
Date: Wed,  4 Apr 2012 15:30:00 -0700
Message-Id: <cover.1333578393.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
Cc: Darren Hart <dvhart@linux.intel.com>, Ross Burton <ross.burton@intel.com>
Subject: [PATCH 0/1] syslinux: Avoid using linux.ext2_fs.h if possible
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
X-List-Received-Date: Wed, 04 Apr 2012 22:40:03 -0000

The following patch is intended as a stop gap to address the compilation
failure for the Yocto 1.2 release. This patch is a backport from syslinux
4.6-pre3. After the Yocto Project 1.2 release and the syslinux 4.6 (or later)
release, the syslinux recipe will be updated and the patch will be dropped.

Tested building atom-pc core-image-minimal live images on Fedora 16 amd64
with the linux/ext2_fs.h file renamed.

The following changes since commit 3e4562500956550dbae5467a5fe9289f1d32f775:

  self-hosted-image: Increase space for build and allow builder user sudo access (2012-04-04 17:17:11 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/user-contrib/dvhart/oe-core syslinux
  http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=syslinux

Darren Hart (1):
  syslinux: Avoid using linux.ext2_fs.h if possible

 .../libinstaller-Avoid-using-linux-ext2_fs.h.patch |  975 ++++++++++++++++++++
 meta/recipes-devtools/syslinux/syslinux_4.03.bb    |    5 +-
 2 files changed, 978 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/syslinux/files/libinstaller-Avoid-using-linux-ext2_fs.h.patch

-- 
1.7.6.5



