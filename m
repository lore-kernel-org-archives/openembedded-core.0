Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TgEgb-000103-RZ
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 14:06:50 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Dec 2012 04:52:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,221,1355126400"; d="scan'208";a="229266781"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.59])
	by orsmga001.jf.intel.com with ESMTP; 05 Dec 2012 04:52:23 -0800
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 14:57:34 +0200
Message-Id: <cover.1354711738.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/4] Pacage Updates
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
X-List-Received-Date: Wed, 05 Dec 2012 13:06:50 -0000

This is a bunch of updates I received from Constantin.
Everything looks good to me, signing off ...

The following changes since commit 600fde2acd1b889a4edbb2ac4661cbf562072db6:

  libxkbcommon: make the build do something (2012-12-04 20:52:02 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib rmoisan/updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rmoisan/updates

Constantin Musca (4):
  babeltrace: upgrade to 1.0.0
  liburcu: upgrade to 0.7.4
  u-boot-mkimage: upgrade to 2012.07
  curl: upgrade to 7.27.0

 ...kimage_2011.06.bb => u-boot-mkimage_2012.07.bb} |    6 ++---
 .../{babeltrace_0.12.bb => babeltrace_1.0.0.bb}    |    8 +++----
 meta/recipes-support/curl/curl/pkgconfig_fix.patch |   25 +++++++++-----------
 .../curl/{curl_7.26.0.bb => curl_7.27.0.bb}        |    6 ++---
 .../liburcu/{liburcu_0.6.7.bb => liburcu_0.7.4.bb} |    8 +++----
 5 files changed, 25 insertions(+), 28 deletions(-)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2011.06.bb => u-boot-mkimage_2012.07.bb} (71%)
 rename meta/recipes-kernel/lttng-2.0/{babeltrace_0.12.bb => babeltrace_1.0.0.bb} (81%)
 rename meta/recipes-support/curl/{curl_7.26.0.bb => curl_7.27.0.bb} (92%)
 rename meta/recipes-support/liburcu/{liburcu_0.6.7.bb => liburcu_0.7.4.bb} (76%)

-- 
1.7.9.5



