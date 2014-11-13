Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3AC5160167
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 23:39:49 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Nov 2014 15:39:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,381,1413270000"; d="scan'208";a="622091092"
Received: from aehernan-devstation.zpn.intel.com ([10.219.4.47])
	by fmsmga001.fm.intel.com with ESMTP; 13 Nov 2014 15:39:48 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Nov 2014 17:39:45 -0600
Message-Id: <cover.1415920471.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/2] Upgrades
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
X-List-Received-Date: Thu, 13 Nov 2014 23:40:00 -0000

The following changes since commit dacc4ce59e48129a1a1e5316e10780f7358e29ef:

  nativesdk-cmake: Adjust toolchain paths dynamically (2014-10-24 21:59:46 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib hsalejandro/updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=hsalejandro/updates

Alejandro Hernandez (2):
  nfs-utils: Upgrade to 1.3.1
  cronie: Upgrade to 1.4.12

 .../files/fix-a-Gcc-undefined-behavior.patch       | 38 --------------------
 .../0001-statd-fixed-the-with-statdpath-flag.patch | 41 ----------------------
 .../nfs-utils/nfs-utils/fix-the-start-statd.patch  | 30 ----------------
 .../nfs-utils/nfs-utils-1.0.6-uclibc.patch         | 27 --------------
 .../{nfs-utils_1.3.0.bb => nfs-utils_1.3.1.bb}     |  8 ++---
 .../cronie/cronie/fix-out-of-tree-build.patch      | 31 ----------------
 .../cronie/{cronie_1.4.11.bb => cronie_1.4.12.bb}  | 13 +++----
 7 files changed, 6 insertions(+), 182 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/files/fix-a-Gcc-undefined-behavior.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-statd-fixed-the-with-statdpath-flag.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/fix-the-start-statd.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.0.6-uclibc.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_1.3.0.bb => nfs-utils_1.3.1.bb} (91%)
 delete mode 100644 meta/recipes-extended/cronie/cronie/fix-out-of-tree-build.patch
 rename meta/recipes-extended/cronie/{cronie_1.4.11.bb => cronie_1.4.12.bb} (90%)

-- 
1.9.1


