Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RqpWW-0007HY-P3
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 18:23:41 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Jan 2012 09:15:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="117133166"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.96])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jan 2012 09:15:50 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2012 09:15:43 -0800
Message-Id: <cover.1327684299.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL 0/6] Various patches from the list
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
X-List-Received-Date: Fri, 27 Jan 2012 17:23:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard,

This is a set of patches that I have tested with, it also includes a 
couple of fixes to issues reported recently.

Thanks
	Sau!

The following changes since commit fba0459da7f274ae284d36b7fdbf2f9d10a52610:

  distro_tracking_fields: fix the typos in the field of maintainer. (2012-01-27 09:52:00 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andrea Adami (1):
  image_types.bbclass: refactor cpio images generation.

Eric Bénard (1):
  qt4-tools-nativesdk-4.8.0: fix build

Martin Jansa (1):
  rootfs_ipk: remove runtime_script_required usage

Saul Wold (3):
  default-providers: add kbd as PREFERRED_PROVIDER for console-tools
  gcc-runtime: fix override from poky-lsb to linuxstdbase
  genext2fs: fix inode computation

 meta/classes/image_types.bbclass                   |   21 +++++++++--
 meta/classes/rootfs_ipk.bbclass                    |    2 +-
 meta/conf/distro/include/default-providers.inc     |    2 +-
 meta/recipes-devtools/gcc/gcc-runtime_4.6.bb       |    2 +-
 .../genext2fs-1.4.1/fix-nbblocks-cast.patch        |   35 ++++++++++++++++++++
 meta/recipes-devtools/genext2fs/genext2fs_1.4.1.bb |    4 ++-
 .../qt4/{files => qt-4.7.4}/configure-lflags.patch |    0
 .../recipes-qt/qt4/qt-4.8.0/configure-lflags.patch |   18 ++++++++++
 meta/recipes-qt/qt4/qt4-tools-nativesdk.inc        |   10 ++++--
 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb   |    3 +-
 10 files changed, 85 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/fix-nbblocks-cast.patch
 rename meta/recipes-qt/qt4/{files => qt-4.7.4}/configure-lflags.patch (100%)
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.0/configure-lflags.patch

-- 
1.7.6.5



