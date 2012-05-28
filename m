Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SYsyA-000762-Gv
	for openembedded-core@lists.openembedded.org;
	Mon, 28 May 2012 07:58:18 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 May 2012 22:48:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="149128192"
Received: from lpalcu-laptop.sh.intel.com ([10.239.196.129])
	by orsmga002.jf.intel.com with ESMTP; 27 May 2012 22:48:01 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 May 2012 08:47:57 +0300
Message-Id: <1338184080-18892-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/3] Package updates: fontconfig, fontsproto, libpciaccess
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
X-List-Received-Date: Mon, 28 May 2012 05:58:18 -0000

This patchset includes some leftovers from a previous commit that weren't merged because there were some
suspicions that some packages (especially libpciaccess) might have some problems compiling/running on some
architectures.

This is what I tested:
- that the packages compile fine on x86/ppc/arm/mips;
- basic functionality in qemu for all architectures;

Laurentiu Palcu (3):
  fontconfig: upgrade to 2.9.0
  fontsproto: upgrade to 2.1.2
  libpciaccess: upgrade to 0.13.1

 .../97_fontconfig                                  |    0
 .../fix-pkgconfig.patch                            |    4 +-
 ...-native_2.8.0.bb => fontconfig-native_2.9.0.bb} |    0
 .../{fontconfig_2.8.0.bb => fontconfig_2.9.0.bb}   |   16 +++---
 .../fix_deletion_of_last_handle.patch              |   51 --------------------
 ...ciaccess_0.12.902.bb => libpciaccess_0.13.1.bb} |    6 +--
 .../{fontsproto_2.1.1.bb => fontsproto_2.1.2.bb}   |    4 +-
 7 files changed, 12 insertions(+), 69 deletions(-)
 rename meta/recipes-graphics/fontconfig/{fontconfig-2.8.0 => fontconfig-2.9.0}/97_fontconfig (100%)
 rename meta/recipes-graphics/fontconfig/{fontconfig-2.8.0 => fontconfig-2.9.0}/fix-pkgconfig.patch (84%)
 rename meta/recipes-graphics/fontconfig/{fontconfig-native_2.8.0.bb => fontconfig-native_2.9.0.bb} (100%)
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.8.0.bb => fontconfig_2.9.0.bb} (80%)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libpciaccess-0.12.902/fix_deletion_of_last_handle.patch
 rename meta/recipes-graphics/xorg-lib/{libpciaccess_0.12.902.bb => libpciaccess_0.13.1.bb} (64%)
 rename meta/recipes-graphics/xorg-proto/{fontsproto_2.1.1.bb => fontsproto_2.1.2.bb} (77%)

-- 
1.7.9.5



