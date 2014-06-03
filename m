Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5EF296FAA8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 03:26:34 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Jun 2014 20:26:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,962,1392192000"; d="scan'208";a="521786729"
Received: from kmaligas-mobl1.gar.corp.intel.com (HELO swold-linux.bigsur.com)
	([10.255.12.167])
	by orsmga001.jf.intel.com with ESMTP; 02 Jun 2014 20:26:14 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jun 2014 20:26:07 -0700
Message-Id: <720bfd3c1a0f0d7dad6f7e613951ded302f495e8.1401765630.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1401765630.git.sgw@linux.intel.com>
References: <cover.1401765630.git.sgw@linux.intel.com>
In-Reply-To: <cover.1401765630.git.sgw@linux.intel.com>
References: <cover.1401765630.git.sgw@linux.intel.com>
Subject: [PATCH 2/7] libcheck: Update to 0.9.13
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
X-List-Received-Date: Tue, 03 Jun 2014 03:26:35 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../libcheck/{libcheck_0.9.12.bb => libcheck_0.9.13.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libcheck/{libcheck_0.9.12.bb => libcheck_0.9.13.bb} (79%)

diff --git a/meta/recipes-support/libcheck/libcheck_0.9.12.bb b/meta/recipes-support/libcheck/libcheck_0.9.13.bb
similarity index 79%
rename from meta/recipes-support/libcheck/libcheck_0.9.12.bb
rename to meta/recipes-support/libcheck/libcheck_0.9.13.bb
index 2a83031..8c063d4 100644
--- a/meta/recipes-support/libcheck/libcheck_0.9.12.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.9.13.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=2d5025d4aa3495befef8f17206a5b0a1"
 SRC_URI = "${SOURCEFORGE_MIRROR}/check/check-${PV}.tar.gz \
           "
 
-SRC_URI[md5sum] = "46fe540d1a03714c7a1967dbc6d484e7"
-SRC_URI[sha256sum] = "c7d47e55e133a0ca19a52e08a99333ac55cb22618b53719b7f4117a1875b1ea3"
+SRC_URI[md5sum] = "95530868f81a9496b2518fd2b713008a"
+SRC_URI[sha256sum] = "ca6589c34f9c60ffd4c3e198ce581e944a9f040ca9352ed54068dd61bebb5cb7"
 
 S = "${WORKDIR}/check-${PV}"
 
-- 
1.8.3.1


