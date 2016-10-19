Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B073171BF7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 15:09:16 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP; 19 Oct 2016 08:09:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,514,1473145200"; d="scan'208";a="21266947"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 19 Oct 2016 08:09:17 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Oct 2016 18:06:43 +0300
Message-Id: <d10a82b5a5501333f2950388b5b012c78387cbc5.1476888929.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 08/19] dtc: update to 1.4.2
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
X-List-Received-Date: Wed, 19 Oct 2016 15:09:16 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-kernel/dtc/{dtc_git.bb => dtc_1.4.2.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-kernel/dtc/{dtc_git.bb => dtc_1.4.2.bb} (75%)

diff --git a/meta/recipes-kernel/dtc/dtc_git.bb b/meta/recipes-kernel/dtc/dtc_1.4.2.bb
similarity index 75%
rename from meta/recipes-kernel/dtc/dtc_git.bb
rename to meta/recipes-kernel/dtc/dtc_1.4.2.bb
index 4446142..cc72adc 100644
--- a/meta/recipes-kernel/dtc/dtc_git.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.4.2.bb
@@ -3,8 +3,7 @@ require dtc.inc
 LIC_FILES_CHKSUM = "file://GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://libfdt/libfdt.h;beginline=3;endline=52;md5=fb360963151f8ec2d6c06b055bcbb68c"
 
-SRCREV = "302fca9f4c283e1994cf0a5a9ce1cf43ca15e6d2"
-PV = "1.4.1+git${SRCPV}"
+SRCREV = "ec02b34c05be04f249ffaaca4b666f5246877dea"
 
 S = "${WORKDIR}/git"
 
-- 
2.9.3


