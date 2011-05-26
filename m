Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QPSkw-0007tC-PC
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 07:05:10 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 May 2011 22:01:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,271,1304319600"; 
   d="scan'208";a="1991823"
Received: from unknown (HELO localhost) ([10.255.12.181])
	by azsmga001.ch.intel.com with ESMTP; 25 May 2011 22:01:55 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2011 22:02:02 -0700
Message-Id: <f29f5f7343d2b8b23b8ad25245efe9c205c8ca6e.1306385875.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <c83bebea4e1c4dd15422ad2cb75eab977cea4a59.1306385875.git.dvhart@linux.intel.com>
References: <c83bebea4e1c4dd15422ad2cb75eab977cea4a59.1306385875.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1306385875.git.dvhart@linux.intel.com>
References: <cover.1306385875.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: [pull-oe-uboot 2/2] u-boot: rename u-boot_git.bb to u-boot_${PV}.bb
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
X-List-Received-Date: Thu, 26 May 2011 05:05:11 -0000

In order to facilitate reuse of the oe-core u-boot recipe, there needs to be
some assurance that the oe-core version won't change without a clear indicator
to people extending it.

By renaming the recipe to include its version string instead of "git", BSP
layers can extend a specific base version of u-boot, ie.
u-boot_2011.03.bbappend. When 2011.06 becomes available, we can create that file
without instantly breaking all the BSPs depending on oe-core version of the
recipe.

As a matter of policy I would recommend we not carry more than 2 versioned
u-boot recipess at any given time. This will provide BSP layers time to migrate
to the newer version, without cluttering oe-core with numerous stale versions of
u-boot. We may decide later to resurrect u-boot_git.bb as an AUTOREV recipe to
faciliate upstream development on u-boot in the oe environment.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Cc: Jason Kridner <jkridner@beagleboard.org>
---
 .../uboot/{u-boot_git.bb => u-boot_2011.03.bb}     |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-bsp/uboot/{u-boot_git.bb => u-boot_2011.03.bb} (100%)

diff --git a/meta/recipes-bsp/uboot/u-boot_git.bb b/meta/recipes-bsp/uboot/u-boot_2011.03.bb
similarity index 100%
rename from meta/recipes-bsp/uboot/u-boot_git.bb
rename to meta/recipes-bsp/uboot/u-boot_2011.03.bb
-- 
1.7.1



