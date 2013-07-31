Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 30F206007C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 14:19:22 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 31 Jul 2013 07:16:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,787,1367996400"; d="scan'208";a="379500135"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 31 Jul 2013 07:19:02 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2013 17:20:41 +0300
Message-Id: <1375280443-21430-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/2] ALSA stack upgrades
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
X-List-Received-Date: Wed, 31 Jul 2013 14:19:22 -0000

alsa-lib, alsa-utils, alsa-utils-alsaconf upgrades to v1.0.27.2

Cristian Iorga (2):
  alsa-lib: upgrade to v1.0.27.2
  alsa-utils: upgrade to 1.0.27.2

 .../fix-O0-Optimize-unable-inline-function.patch   | 63 ----------------------
 .../alsa/alsa-lib/obsolete_automake_macros.patch   | 15 ------
 .../alsa/alsa-lib/unbreak_plugindir.patch          | 14 -----
 .../{alsa-lib_1.0.26.bb => alsa-lib_1.0.27.2.bb}   | 12 ++---
 ...f_1.0.26.bb => alsa-utils-alsaconf_1.0.27.2.bb} |  0
 ...-t-let-systemd-unit-restore-the-volume-wh.patch | 40 ++++++--------
 .../alsa/alsa-utils/obsolete_automake_macros.patch | 15 ------
 .../alsa/alsa-utils/uclibc-exp10-replacement.patch | 21 --------
 ...alsa-utils_1.0.26.bb => alsa-utils_1.0.27.2.bb} |  7 +--
 9 files changed, 23 insertions(+), 164 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib/fix-O0-Optimize-unable-inline-function.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib/unbreak_plugindir.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.0.26.bb => alsa-lib_1.0.27.2.bb} (84%)
 rename meta/recipes-multimedia/alsa/{alsa-utils-alsaconf_1.0.26.bb => alsa-utils-alsaconf_1.0.27.2.bb} (100%)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-utils/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-utils/uclibc-exp10-replacement.patch
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.0.26.bb => alsa-utils_1.0.27.2.bb} (93%)

-- 
1.8.1.2


