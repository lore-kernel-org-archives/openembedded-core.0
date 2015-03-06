Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9605971637
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2015 03:19:52 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 05 Mar 2015 19:14:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,351,1422950400"; d="scan'208";a="463260298"
Received: from aaceves-mobl1.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.254.183.174])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Mar 2015 19:13:25 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Mar 2015 19:19:46 -0800
Message-Id: <1425611986-12058-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] systemtap: Upgrade to 2.7
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
X-List-Received-Date: Fri, 06 Mar 2015 03:19:52 -0000

This address issues with the 3.19 kernel and the number of patches to
back port would be to great

[YOCTO #7401]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index f9a19d9..4a1f4fb 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,7 +1,7 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "7682e51d2e11a35b2977ba9a85ab42f326b8ff8f"
-PV = "2.6+git${SRCPV}"
+SRCREV = "bf16266782e1f2588b519a50d9684279d4e21036"
+PV = "2.7+git${SRCPV}"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://docproc-build-fix.patch \
-- 
2.1.0


