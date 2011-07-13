Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qh58z-00034M-II
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 21:30:49 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Jul 2011 12:26:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,526,1304319600"; d="scan'208";a="29976450"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 13 Jul 2011 12:26:50 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2011 05:59:29 -0700
Message-Id: <cover.1310561877.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/3] Misc fixes related to x32
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
X-List-Received-Date: Wed, 13 Jul 2011 19:30:49 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The following changes since commit 18a99c8500c7daa586fbe9f9d4e8398ebc95266f:

  udev-172: add a newer version for newer kernel (2011-07-13 05:55:54 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/x32
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/x32

Nitin A Kamble (3):
  bitbake.conf, bbclasses: define *_LD_ARCH & *AS_ARCH vars
  glib-2.0: fix makefiles
  openssl: compilation fixes for x32

 meta/classes/allarch.bbclass                       |    2 +
 meta/classes/cross-canadian.bbclass                |    2 +
 meta/classes/cross.bbclass                         |    2 +
 meta/classes/crosssdk.bbclass                      |    2 +
 meta/classes/kernel.bbclass                        |    4 +
 meta/classes/native.bbclass                        |   10 ++-
 meta/classes/nativesdk.bbclass                     |    4 +
 meta/classes/toolchain-scripts.bbclass             |    5 +-
 meta/conf/bitbake.conf                             |   21 ++++--
 meta/conf/documentation.conf                       |    2 +
 .../openssl/openssl-0.9.8r/x32_compile_fix.patch   |   74 ++++++++++++++++++++
 meta/recipes-connectivity/openssl/openssl.inc      |    5 ++
 .../recipes-connectivity/openssl/openssl_0.9.8r.bb |    5 +-
 .../glib-2.0/glib-2.0/x32_compile_fix.patch        |   65 +++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb      |    3 +-
 15 files changed, 192 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8r/x32_compile_fix.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/x32_compile_fix.patch

-- 
1.7.5.4



