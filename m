Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Qrpdu-0001mR-Tc
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 13:11:11 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Aug 2011 04:06:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="37139943"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by orsmga002.jf.intel.com with ESMTP; 12 Aug 2011 04:06:37 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2011 19:08:03 +0800
Message-Id: <cover.1313146924.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH v2 BUG #1236 0/2] Unify ldd/ldconfig for all multilib eglibcs
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
X-List-Received-Date: Fri, 12 Aug 2011 11:11:11 -0000

This is rebase of original patch for bug #1236 to the latest oe-core master.

The original pull request is at:
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-August/007365.html

The following changes since commit a92d56058b21913570bb17ae416c3b00afce055e:
  Kumar Gala (1):
        gnome-doc-utils: respect python-dir setting EXTRA_OECONF

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/bug1236-oecore
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/bug1236-oecore

Lianhao Lu (2):
  utils.bbclass/multilib.class: Added misc supporting functions.
  eglibc: Modify ldd script according to multilib config.

 meta/classes/multilib.bbclass                      |    7 ++-
 meta/classes/utils.bbclass                         |   29 +++++++++++
 meta/conf/bitbake.conf                             |    1 +
 meta/conf/multilib.conf                            |    3 +
 .../eglibc/eglibc-2.13/multilib_readlib.patch      |   17 ++++++
 meta/recipes-core/eglibc/eglibc-ld.inc             |   54 ++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc.inc                |    1 +
 meta/recipes-core/eglibc/eglibc_2.13.bb            |   13 ++++-
 8 files changed, 123 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/multilib_readlib.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-ld.inc



