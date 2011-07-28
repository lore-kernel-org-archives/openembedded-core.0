Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QmQLa-00080A-PC
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 15:09:55 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Jul 2011 06:05:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,282,1309762800"; d="scan'208";a="33091566"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 28 Jul 2011 06:05:37 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2011 21:03:02 +0800
Message-Id: <cover.1311858056.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/7] packages upgrade, Edwin, July 28, 2011
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
X-List-Received-Date: Thu, 28 Jul 2011 13:09:55 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Saul,
These are some package upgrade. Pls. help to review and pull.
Thanks,
Edwin

The following changes since commit 860a41bae6b863a289b06a9684d9cf6c58a307bd:

  arch-ia32.inc: Fix up TUNE_ARCH variable conflicts (2011-07-26 22:39:59 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/master2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master2

Zhai Edwin (7):
  lighttpd: Upgrade to 1.4.29
  libsoup-2.4: Upgrade to 2.34.2
  apr: Upgrade to 1.4.5
  apr-util: Upgrade to 1.3.12
  libassuan: Upgrade to 2.0.2
  gpgme: Upgrade to 1.3.1
  parted: Upgrade to 3.0

 .../{lighttpd_1.4.28.bb => lighttpd_1.4.29.bb}     |    6 ++--
 .../{parted-2.3 => parted-3.0}/no_check.patch      |    0
 .../{parted-2.3 => parted-3.0}/syscalls.patch      |    0
 .../parted/{parted_2.3.bb => parted_3.0.bb}        |    4 +-
 .../apr/{apr-util_1.3.10.bb => apr-util_1.3.12.bb} |    8 ++++-
 meta/recipes-support/apr/apr/buildconf_fix.patch   |   27 --------------------
 .../apr/{apr_1.4.2.bb => apr_1.4.5.bb}             |    9 +++---
 .../disable_gpgconf_check.patch                    |    0
 .../gpgme/{gpgme_1.3.0.bb => gpgme_1.3.1.bb}       |    8 +++---
 .../{libassuan_2.0.1.bb => libassuan_2.0.2.bb}     |    4 +-
 ...libsoup-2.4_2.34.1.bb => libsoup-2.4_2.34.2.bb} |    4 +-
 11 files changed, 24 insertions(+), 46 deletions(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.28.bb => lighttpd_1.4.29.bb} (90%)
 rename meta/recipes-extended/parted/{parted-2.3 => parted-3.0}/no_check.patch (100%)
 rename meta/recipes-extended/parted/{parted-2.3 => parted-3.0}/syscalls.patch (100%)
 rename meta/recipes-extended/parted/{parted_2.3.bb => parted_3.0.bb} (78%)
 rename meta/recipes-support/apr/{apr-util_1.3.10.bb => apr-util_1.3.12.bb} (74%)
 delete mode 100644 meta/recipes-support/apr/apr/buildconf_fix.patch
 rename meta/recipes-support/apr/{apr_1.4.2.bb => apr_1.4.5.bb} (85%)
 rename meta/recipes-support/gpgme/{gpgme-1.3.0 => gpgme-1.3.1}/disable_gpgconf_check.patch (100%)
 rename meta/recipes-support/gpgme/{gpgme_1.3.0.bb => gpgme_1.3.1.bb} (78%)
 rename meta/recipes-support/libassuan/{libassuan_2.0.1.bb => libassuan_2.0.2.bb} (82%)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.34.1.bb => libsoup-2.4_2.34.2.bb} (76%)



