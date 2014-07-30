Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 607A470976
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 22:54:55 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Jul 2014 15:54:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,768,1400050800"; d="scan'208";a="463358294"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	swold-linux.amr.corp.intel.com) ([10.255.12.249])
	by azsmga001.ch.intel.com with ESMTP; 30 Jul 2014 15:54:52 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jul 2014 15:54:48 -0700
Message-Id: <bb11ef806716bfab67cbe833bdd219b5119c3d18.1406760824.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1406760824.git.sgw@linux.intel.com>
References: <cover.1406760824.git.sgw@linux.intel.com>
In-Reply-To: <cover.1406760824.git.sgw@linux.intel.com>
References: <cover.1406760824.git.sgw@linux.intel.com>
Subject: [PATCH 3/4] libcheck: Upgrade to 0.9.14
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
X-List-Received-Date: Wed, 30 Jul 2014 22:54:56 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../libcheck/{libcheck_0.9.13.bb => libcheck_0.9.14.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libcheck/{libcheck_0.9.13.bb => libcheck_0.9.14.bb} (79%)

diff --git a/meta/recipes-support/libcheck/libcheck_0.9.13.bb b/meta/recipes-support/libcheck/libcheck_0.9.14.bb
similarity index 79%
rename from meta/recipes-support/libcheck/libcheck_0.9.13.bb
rename to meta/recipes-support/libcheck/libcheck_0.9.14.bb
index 8c063d4..2a69ff7 100644
--- a/meta/recipes-support/libcheck/libcheck_0.9.13.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.9.14.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=2d5025d4aa3495befef8f17206a5b0a1"
 SRC_URI = "${SOURCEFORGE_MIRROR}/check/check-${PV}.tar.gz \
           "
 
-SRC_URI[md5sum] = "95530868f81a9496b2518fd2b713008a"
-SRC_URI[sha256sum] = "ca6589c34f9c60ffd4c3e198ce581e944a9f040ca9352ed54068dd61bebb5cb7"
+SRC_URI[md5sum] = "38263d115d784c17aa3b959ce94be8b8"
+SRC_URI[sha256sum] = "c272624645b1b738cf57fd5d81a3e4d9b722b99d6133ee3f3c4007d4d279840a"
 
 S = "${WORKDIR}/check-${PV}"
 
-- 
1.8.3.1


