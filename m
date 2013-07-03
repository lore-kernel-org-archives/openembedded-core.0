Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 414916AFD4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 22:26:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Jul 2013 15:26:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,991,1363158000"; d="scan'208";a="340154937"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.183])
	by orsmga001.jf.intel.com with ESMTP; 03 Jul 2013 15:26:31 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jul 2013 15:26:26 -0700
Message-Id: <97a0437328ec93c7ded99bc9be7ff9fa0fc830d4.1372890071.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1372890071.git.sgw@linux.intel.com>
References: <cover.1372890071.git.sgw@linux.intel.com>
In-Reply-To: <cover.1372890071.git.sgw@linux.intel.com>
References: <cover.1372890071.git.sgw@linux.intel.com>
Subject: [PATCH 5/8] dtc: Update to 1.4.0 Git Tag
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
X-List-Received-Date: Wed, 03 Jul 2013 22:26:30 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-kernel/dtc/dtc.inc    | 1 -
 meta/recipes-kernel/dtc/dtc_git.bb | 5 ++---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dtc.inc
index 18847c6..6888c55 100644
--- a/meta/recipes-kernel/dtc/dtc.inc
+++ b/meta/recipes-kernel/dtc/dtc.inc
@@ -11,7 +11,6 @@ SRC_URI = "git://www.jdl.com/software/dtc.git;protocol=git \
 	  "
 
 EXTRA_OEMAKE='PREFIX="${prefix}" LIBDIR="${libdir}"'
-INC_PR = "r3"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-kernel/dtc/dtc_git.bb b/meta/recipes-kernel/dtc/dtc_git.bb
index c205de7..0bd3acf 100644
--- a/meta/recipes-kernel/dtc/dtc_git.bb
+++ b/meta/recipes-kernel/dtc/dtc_git.bb
@@ -3,9 +3,8 @@ require dtc.inc
 LIC_FILES_CHKSUM = "file://GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://libfdt/libfdt.h;beginline=3;endline=52;md5=fb360963151f8ec2d6c06b055bcbb68c"
 
-SRCREV = "033089f29099bdfd5c2d6986cdb9fd07b16cfde0"
-PV = "1.3.0+git${SRCPV}"
-PR = "${INC_PR}.1"
+SRCREV = "65cc4d2748a2c2e6f27f1cf39e07a5dbabd80ebf"
+PV = "1.4.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
1.8.1.4


