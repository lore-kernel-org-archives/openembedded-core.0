Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CF5AC6FE64
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 17:06:38 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Aug 2014 10:06:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,425,1406617200"; d="scan'208";a="565468706"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga001.jf.intel.com with ESMTP; 29 Aug 2014 10:06:37 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Aug 2014 20:06:31 +0300
Message-Id: <cover.1409331937.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/3] ALSA upgrades
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Aug 2014 17:06:38 -0000

The following changes since commit fe2e53ba30ba679c038bd5b48b9a91a41af4c49e:

  bitbake: toaster: create Build methods for calculating progress and ETA (2014-08-29 13:56:50 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PU2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PU2

Cristian Iorga (3):
  alsa-lib: upgrade to 1.0.28
  alsa-tools: upgrade to 1.0.28
  alsa-utils: upgrade to 1.0.28

 .../Check-if-wordexp-function-is-supported.patch   | 31 +++++-----
 ...-iatomic.h-functions-definitions-for-mips.patch | 68 ----------------------
 .../{alsa-lib_1.0.27.2.bb => alsa-lib_1.0.28.bb}   |  7 +--
 .../alsa/alsa-tools/mips_has_no_io_h.patch         | 16 -----
 .../{alsa-tools_1.0.27.bb => alsa-tools_1.0.28.bb} |  7 +--
 ...f_1.0.27.2.bb => alsa-utils-alsaconf_1.0.28.bb} |  0
 ...-t-let-systemd-unit-restore-the-volume-wh.patch | 42 ++++++++-----
 ...alsa-utils_1.0.27.2.bb => alsa-utils_1.0.28.bb} |  6 +-
 8 files changed, 52 insertions(+), 125 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib/Update-iatomic.h-functions-definitions-for-mips.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.0.27.2.bb => alsa-lib_1.0.28.bb} (86%)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-tools/mips_has_no_io_h.patch
 rename meta/recipes-multimedia/alsa/{alsa-tools_1.0.27.bb => alsa-tools_1.0.28.bb} (82%)
 rename meta/recipes-multimedia/alsa/{alsa-utils-alsaconf_1.0.27.2.bb => alsa-utils-alsaconf_1.0.28.bb} (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.0.27.2.bb => alsa-utils_1.0.28.bb} (94%)

-- 
1.9.1


