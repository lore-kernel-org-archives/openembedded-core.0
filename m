Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R0zUt-00037C-VD
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Sep 2011 19:31:44 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Sep 2011 10:26:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,339,1312182000"; d="scan'208";a="49562716"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.39])
	by fmsmga002.fm.intel.com with ESMTP; 06 Sep 2011 10:26:26 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Sep 2011 10:26:20 -0700
Message-Id: <cover.1315329511.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [CONSOLIDATED PULL 0/5] Collection of patches
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
X-List-Received-Date: Tue, 06 Sep 2011 17:31:44 -0000

Richard,

This is a collection of patches that have been sitting around,
and unless I missed some comments should be good to go.

I bumped gettext's PR in this request.

Sau!


The following changes since commit 41b7c955cfdc7b4d5c667c8a8742237d5edaca4f:

  icu-3.6: fix building with big make -j (2011-09-05 20:38:50 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Denis Carikli (1):
  mtd-utils: update to version to 1.4.6

Kumar Gala (1):
  scripts/oe-buildenv-internal: Add SOCKS5_{USER, PASSWD} to
    BB_ENV_EXTRAWHITE

Phil Blundell (1):
  pango: use qemu to generate pango.modules during rootfs construction

Saul Wold (2):
  gettext: use included libxml and libcroco
  web: Update SRCREV to address ccs_parser_parse_stylesheet arg
    mismatch

 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    4 +-
 .../add-exclusion-to-mkfs-jffs2-git-2.patch        |    0
 .../add-exclusion-to-mkfs-jffs2-git-2.patch        |  103 ++++++++++++++++++++
 .../mtd/{mtd-utils_1.4.1.bb => mtd-utils_1.4.6.bb} |    7 +-
 meta/recipes-graphics/pango/pango.inc              |   11 ++-
 meta/recipes-graphics/pango/pango_1.28.4.bb        |    2 +-
 meta/recipes-sato/web/web_git.bb                   |    4 +-
 scripts/oe-buildenv-internal                       |    2 +-
 8 files changed, 119 insertions(+), 14 deletions(-)
 rename meta/recipes-devtools/mtd/{mtd-utils-1.4.1 => mtd-utils-1.4.6}/add-exclusion-to-mkfs-jffs2-git-2.patch (100%)
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils-1.4.6/mtd-utils-1.4.1/add-exclusion-to-mkfs-jffs2-git-2.patch
 rename meta/recipes-devtools/mtd/{mtd-utils_1.4.1.bb => mtd-utils_1.4.6.bb} (81%)

-- 
1.7.6



