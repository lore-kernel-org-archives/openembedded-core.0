Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AD8EE73F96
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 21:57:02 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 26 Aug 2015 14:57:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,418,1437462000"; d="scan'208";a="632871910"
Received: from afshjern.zpn.intel.com ([10.219.17.7])
	by orsmga003.jf.intel.com with ESMTP; 26 Aug 2015 14:57:01 -0700
From: Alex Franco <alejandro.franco@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2015 16:57:32 -0500
Message-Id: <1440626255-29614-1-git-send-email-alejandro.franco@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 0/3] Empty-image functionality
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
X-List-Received-Date: Wed, 26 Aug 2015 21:57:05 -0000

Enable creation of core-empty-image (a recipe that inherits image
without any extra packages) or similar empty images, whether RPM,
DEB or IPK packaging is selected.

[YOCTO #7664]

Alex Franco (3):
  Empty image: core-image-empty recipe, Rootfs fix
  Empty image: package list splitting and iteration
  Empty image: filesystem allocation

 meta/classes/image_types.bbclass             | 10 +++++++++-
 meta/classes/license.bbclass                 |  2 +-
 meta/lib/oe/package_manager.py               |  5 +++--
 meta/lib/oe/rootfs.py                        |  8 ++++++--
 meta/recipes-core/images/core-image-empty.bb |  7 +++++++
 5 files changed, 26 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-core/images/core-image-empty.bb

-- 
2.5.0


