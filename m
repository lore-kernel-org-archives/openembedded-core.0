Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T4w0H-0005Cy-7O
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 17:40:57 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 24 Aug 2012 08:28:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,304,1344236400"; d="scan'208";a="190888377"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.156])
	by orsmga002.jf.intel.com with ESMTP; 24 Aug 2012 08:28:14 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Aug 2012 17:33:03 +0300
Message-Id: <cover.1345818232.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/4] Package upgrades
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Aug 2012 15:40:57 -0000

This is another set of package upgrades compiled on all architectures
and tested using core-image-sato.
The following changes since commit 054d95edad8d79ef1c6b30681395d50f3c6335b4:

  poky.conf: restore Ubuntu 12.04 LTS to tested distro list (2012-08-23 17:23:40 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib cmuscax/upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=cmuscax/upgrades

Constantin Musca (4):
  wget: upgrade to 1.14
  npth: upgrade to 0.91
  kconfig-frontends: upgrade to 3.5
  base-passwd: upgrade to 3.5.26

 .../nobash.patch                                   |    0
 .../root-home.patch                                |    0
 ...base-passwd_3.5.24.bb => base-passwd_3.5.26.bb} |    6 ++---
 ...g-frontends_3.4.bb => kconfig-frontends_3.5.bb} |    6 ++---
 .../wget/wget-1.13.4/remove-gets.patch             |   23 --------------------
 .../{wget-1.13.4 => wget-1.14}/fix_makefile.patch  |    0
 meta/recipes-extended/wget/wget_1.13.4.bb          |   10 ---------
 meta/recipes-extended/wget/wget_1.14.bb            |    9 ++++++++
 .../npth/{npth_0.90.bb => npth_0.91.bb}            |    4 ++--
 9 files changed, 16 insertions(+), 42 deletions(-)
 rename meta/recipes-core/base-passwd/{base-passwd-3.5.24 => base-passwd-3.5.26}/nobash.patch (100%)
 rename meta/recipes-core/base-passwd/{base-passwd-3.5.24 => base-passwd-3.5.26}/root-home.patch (100%)
 rename meta/recipes-core/base-passwd/{base-passwd_3.5.24.bb => base-passwd_3.5.26.bb} (94%)
 rename meta/recipes-devtools/kconfig-frontends/{kconfig-frontends_3.4.bb => kconfig-frontends_3.5.bb} (88%)
 delete mode 100644 meta/recipes-extended/wget/wget-1.13.4/remove-gets.patch
 rename meta/recipes-extended/wget/{wget-1.13.4 => wget-1.14}/fix_makefile.patch (100%)
 delete mode 100644 meta/recipes-extended/wget/wget_1.13.4.bb
 create mode 100644 meta/recipes-extended/wget/wget_1.14.bb
 rename meta/recipes-support/npth/{npth_0.90.bb => npth_0.91.bb} (76%)

-- 
1.7.9.5



