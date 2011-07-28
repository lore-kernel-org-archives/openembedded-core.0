Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1QmKpr-0008Am-Ch
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 09:16:48 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 Jul 2011 00:12:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,280,1309762800"; d="scan'208";a="33184144"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by fmsmga002.fm.intel.com with ESMTP; 28 Jul 2011 00:12:15 -0700
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2011 15:20:35 +0800
Message-Id: <cover.1311836896.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.6.3.3
Subject: [PATCH 0/1]python-native: Fix a compiler finding issue
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
X-List-Received-Date: Thu, 28 Jul 2011 07:16:48 -0000

Hi,
    This patch will fix an compiler finding issue.
    The CC variable, its value sometimes like "x86_64-poky-linux-gcc   -m64 --sysroot=/${TMPDIR}/sysroots/qemux86-64", contains option information. This will confuse python when finding the compiler name, wrong compiler name "qemux86-64" were found rather than the "x86_64-poky-linux-gcc".
    When I fixing python-pycairo multilib dir issue, above issue appeared and block the compile process. Please review it.

Thanks
Lei

The following changes since commit 819f18f8bc000f13b644edc194d2a12b4ea5fecf:
  Richard Purdie (1):
        Move architecture specific TARGET_OS mangling into tune files

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib lmei3/python-pycairo
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/python-pycairo

Mei Lei (1):
  python-native: Fix a compiler finding issue

 .../python/python-native/unixccompiler.patch       |   20 ++++++++++++++++++++
 .../recipes-devtools/python/python-native_2.6.6.bb |    3 ++-
 2 files changed, 22 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-native/unixccompiler.patch



