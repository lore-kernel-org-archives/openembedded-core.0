Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9B7C37850B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 14:58:10 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2017 06:58:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,395,1505804400"; d="scan'208";a="173402271"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 14 Nov 2017 06:58:11 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 16:57:48 +0200
Message-Id: <20171114145754.9643-21-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
References: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 21/27] libpciaccess: update to 0.14
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
X-List-Received-Date: Tue, 14 Nov 2017 14:58:10 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../xorg-lib/{libpciaccess_0.13.5.bb => libpciaccess_0.14.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libpciaccess_0.13.5.bb => libpciaccess_0.14.bb} (74%)

diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.5.bb b/meta/recipes-graphics/xorg-lib/libpciaccess_0.14.bb
similarity index 74%
rename from meta/recipes-graphics/xorg-lib/libpciaccess_0.13.5.bb
rename to meta/recipes-graphics/xorg-lib/libpciaccess_0.14.bb
index a3b682b09b6..a44a5c89279 100644
--- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.14.bb
@@ -9,8 +9,8 @@ SRC_URI += "\
             file://0004-Don-t-include-sys-io.h-on-arm.patch \
 "
 
-SRC_URI[md5sum] = "d810ab17e24c1418dedf7207fb2841d4"
-SRC_URI[sha256sum] = "752c54e9b3c311b4347cb50aea8566fa48eab274346ea8a06f7f15de3240b999"
+SRC_URI[md5sum] = "8f436e151d5106a9cfaa71857a066d33"
+SRC_URI[sha256sum] = "3df543e12afd41fea8eac817e48cbfde5aed8817b81670a4e9e493bb2f5bf2a4"
 
 LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=277aada5222b9a22fbf3471ff3687068"
-- 
2.15.0


