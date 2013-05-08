Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ionutx.radu@intel.com>) id 1Ua5pu-0001dU-H5
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 16:59:20 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 May 2013 07:40:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,635,1363158000"; d="scan'208";a="330858582"
Received: from work.rb.intel.com ([10.237.105.51])
	by fmsmga001.fm.intel.com with ESMTP; 08 May 2013 07:40:08 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2013 17:41:50 +0300
Message-Id: <1368024119-4149-1-git-send-email-ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/9] Package Updates (libxi, json-glib, js, pciutils, libfontenc, qemu, ethtool, pixman, gpgme)
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
X-List-Received-Date: Wed, 08 May 2013 14:59:36 -0000

*** BLURB HERE ***

Ionut Radu (9):
  libxi: updated from 1.7 to 1.7.1
  json-glib: updated from 0.15.2 to 0.16.0
  js: updated from 1.7.0+1.8.0rc1 to 185-1.0.0
  pciutils: updated from 3.1.10 to 3.2.
  libfontenc: Updated from 1.1.1 to 1.1.2
  qemu: Updated from 1.4.0 to 1.4.1
  ethtool: Updated from 3.8 to 3.9
  pixman: Update from 0.29.2 to 0.29.4
  gpgme: Updated from 1.4.0 to 1.4.1

 .../configure.patch                                  |    0
 .../guess-fix.patch                                  |    0
 .../lib-build-fix.patch                              |    0
 .../makefile.patch                                   |   18 ++++++++++++++----
 .../pcimodules-pciutils.diff                         |    0
 .../{pciutils_3.1.10.bb => pciutils_3.2.0.bb}        |    4 ++--
 meta/recipes-devtools/qemu/qemu.inc                  |    1 -
 .../qemu/{qemu_1.4.0.bb => qemu_1.4.1.bb}            |    8 +++-----
 .../ethtool/{ethtool_3.8.bb => ethtool_3.9.bb}       |    5 ++---
 .../{json-glib_0.15.2.bb => json-glib_0.16.0.bb}     |    4 ++--
 .../{libfontenc_1.1.1.bb => libfontenc_1.1.2.bb}     |    5 ++---
 .../xorg-lib/{libxi_1.7.bb => libxi_1.7.1.bb}        |    4 ++--
 .../xorg-lib/{pixman_0.29.2.bb => pixman_0.29.4.bb}  |    6 ++----
 .../disable_gpgconf_check.patch                      |    0
 .../gpgme/{gpgme_1.4.0.bb => gpgme_1.4.1.bb}         |    6 ++----
 .../js/{js_1.7.0+1.8.0rc1.bb => js_185-1.0.0.bb}     |    7 +++----
 16 files changed, 34 insertions(+), 34 deletions(-)
 rename meta/recipes-bsp/pciutils/{pciutils-3.1.10 => pciutils-3.2.0}/configure.patch (100%)
 rename meta/recipes-bsp/pciutils/{pciutils-3.1.10 => pciutils-3.2.0}/guess-fix.patch (100%)
 rename meta/recipes-bsp/pciutils/{pciutils-3.1.10 => pciutils-3.2.0}/lib-build-fix.patch (100%)
 rename meta/recipes-bsp/pciutils/{pciutils-3.1.10 => pciutils-3.2.0}/makefile.patch (26%)
 rename meta/recipes-bsp/pciutils/{pciutils-3.1.10 => pciutils-3.2.0}/pcimodules-pciutils.diff (100%)
 rename meta/recipes-bsp/pciutils/{pciutils_3.1.10.bb => pciutils_3.2.0.bb} (92%)
 rename meta/recipes-devtools/qemu/{qemu_1.4.0.bb => qemu_1.4.1.bb} (49%)
 rename meta/recipes-extended/ethtool/{ethtool_3.8.bb => ethtool_3.9.bb} (78%)
 rename meta/recipes-gnome/json-glib/{json-glib_0.15.2.bb => json-glib_0.16.0.bb} (79%)
 rename meta/recipes-graphics/xorg-lib/{libfontenc_1.1.1.bb => libfontenc_1.1.2.bb} (70%)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.7.bb => libxi_1.7.1.bb} (81%)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.29.2.bb => pixman_0.29.4.bb} (88%)
 rename meta/recipes-support/gpgme/{gpgme-1.4.0 => gpgme-1.4.1}/disable_gpgconf_check.patch (100%)
 rename meta/recipes-support/gpgme/{gpgme_1.4.0.bb => gpgme_1.4.1.bb} (89%)
 rename meta/recipes-support/js/{js_1.7.0+1.8.0rc1.bb => js_185-1.0.0.bb} (85%)

-- 
1.7.10.4



