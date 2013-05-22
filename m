Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 80623608CA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 00:40:38 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 21 May 2013 17:40:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,717,1363158000"; d="scan'208";a="341405594"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.171])
	by fmsmga002.fm.intel.com with ESMTP; 21 May 2013 17:40:28 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2013 17:40:22 -0700
Message-Id: <566fc1032c1749390dd18348e4df9dafa5f28afe.1369183108.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1369183108.git.sgw@linux.intel.com>
References: <cover.1369183108.git.sgw@linux.intel.com>
In-Reply-To: <cover.1369183108.git.sgw@linux.intel.com>
References: <cover.1369183108.git.sgw@linux.intel.com>
Subject: [PATCH 4/7] libnl: Update to 3.2.22
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
X-List-Received-Date: Wed, 22 May 2013 00:40:38 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/libnl/{libnl_3.2.21.bb => libnl_3.2.22.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libnl/{libnl_3.2.21.bb => libnl_3.2.22.bb} (90%)

diff --git a/meta/recipes-support/libnl/libnl_3.2.21.bb b/meta/recipes-support/libnl/libnl_3.2.22.bb
similarity index 90%
rename from meta/recipes-support/libnl/libnl_3.2.21.bb
rename to meta/recipes-support/libnl/libnl_3.2.22.bb
index 1e97603..36e98e1 100644
--- a/meta/recipes-support/libnl/libnl_3.2.21.bb
+++ b/meta/recipes-support/libnl/libnl_3.2.22.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
 SECTION = "libs/network"
 
 PE = "1"
-PR = "r0"
 
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
@@ -14,8 +13,8 @@ SRC_URI = "http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz \
            file://fix-pktloc_syntax_h-race.patch \
            file://fix-pc-file.patch "
 
-SRC_URI[md5sum] = "6fe7136558a9071e70673dcda38545b3"
-SRC_URI[sha256sum] = "2dc80f043116ec8610d9d418f5f5e9283f3d9a3a48b8d51a8cb0146b3f279604"
+SRC_URI[md5sum] = "2e1c889494d274aca24ce5f6a748e66e"
+SRC_URI[sha256sum] = "c7c5f267dfeae0c1a530bf96b71fb7c8dbbb07d54beef49b6712d8d6166f629b"
 
 inherit autotools pkgconfig
 
-- 
1.8.1.4


