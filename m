Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 14B3770031
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jun 2016 05:57:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jun 2016 22:57:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,437,1459839600"; d="scan'208";a="993287623"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by orsmga002.jf.intel.com with ESMTP; 07 Jun 2016 22:57:09 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jun 2016 05:56:07 +0000
Message-Id: <12b9dd4338999b75a21fd1d293fa911e9dca3f1e.1465365165.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1465365165.git.alejandro.hernandez@linux.intel.com>
References: <cover.1465365165.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/9] eudev: upgrade to 3.2
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
X-List-Received-Date: Wed, 08 Jun 2016 05:57:10 -0000

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-core/udev/{eudev_3.1.5.bb => eudev_3.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/udev/{eudev_3.1.5.bb => eudev_3.2.bb} (96%)

diff --git a/meta/recipes-core/udev/eudev_3.1.5.bb b/meta/recipes-core/udev/eudev_3.2.bb
similarity index 96%
rename from meta/recipes-core/udev/eudev_3.1.5.bb
rename to meta/recipes-core/udev/eudev_3.2.bb
index 60f4a85..6270617 100644
--- a/meta/recipes-core/udev/eudev_3.1.5.bb
+++ b/meta/recipes-core/udev/eudev_3.2.bb
@@ -20,8 +20,8 @@ SRC_URI = "https://github.com/gentoo/${BPN}/archive/v${PV}.tar.gz \
 "
 UPSTREAM_CHECK_URI = "https://github.com/gentoo/eudev/releases"
 
-SRC_URI[md5sum] = "e130f892d8744e292cb855db79935f68"
-SRC_URI[sha256sum] = "ce9d5fa91e3a42c7eb95512ca0fa2a631e89833053066bb6cdf42046b2a88553"
+SRC_URI[md5sum] = "9eb477cc8718db272b5d24dff1126b04"
+SRC_URI[sha256sum] = "37829d37f4beb7e358ca33abc1ad0907d87f917ce157777aeaeebeacae24efdc"
 
 inherit autotools update-rc.d qemu
 
-- 
2.6.6


