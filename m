Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F0F7B72207
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 22:50:56 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 13 Jan 2015 14:50:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="440187496"
Received: from unknown (HELO swold-mobl5.amr.corp.intel.com) ([10.252.252.162])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Jan 2015 14:38:06 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jan 2015 14:50:45 -0800
Message-Id: <2f84f711ff7beda53697dd15056baee6ebef35e3.1421189008.git.sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1421189008.git.sgw@linux.intel.com>
References: <cover.1421189008.git.sgw@linux.intel.com>
In-Reply-To: <cover.1421189008.git.sgw@linux.intel.com>
References: <cover.1421189008.git.sgw@linux.intel.com>
Subject: [PATCH 2/3] dtc: Upgrade to 1.4.1 (git based)
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
X-List-Received-Date: Tue, 13 Jan 2015 22:50:57 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-kernel/dtc/dtc_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/dtc/dtc_git.bb b/meta/recipes-kernel/dtc/dtc_git.bb
index 0bd3acf..4446142 100644
--- a/meta/recipes-kernel/dtc/dtc_git.bb
+++ b/meta/recipes-kernel/dtc/dtc_git.bb
@@ -3,8 +3,8 @@ require dtc.inc
 LIC_FILES_CHKSUM = "file://GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://libfdt/libfdt.h;beginline=3;endline=52;md5=fb360963151f8ec2d6c06b055bcbb68c"
 
-SRCREV = "65cc4d2748a2c2e6f27f1cf39e07a5dbabd80ebf"
-PV = "1.4.0+git${SRCPV}"
+SRCREV = "302fca9f4c283e1994cf0a5a9ce1cf43ca15e6d2"
+PV = "1.4.1+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.1.0


