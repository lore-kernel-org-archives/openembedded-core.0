Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 558546A886
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 23:33:20 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Jun 2013 16:34:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,947,1363158000"; d="scan'208";a="356326985"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.111])
	by fmsmga001.fm.intel.com with ESMTP; 26 Jun 2013 16:34:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2013 16:33:20 -0700
Message-Id: <1372289600-20996-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH] mc: Don't remove libdir
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
X-List-Received-Date: Wed, 26 Jun 2013 23:33:20 -0000

It contains helper programs that are needed to make mc do the right actions
for the various file formats it understands.

[YOCTO #4432]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/mc/mc_4.8.8.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-extended/mc/mc_4.8.8.bb b/meta/recipes-extended/mc/mc_4.8.8.bb
index 20ae797..e4699dd 100644
--- a/meta/recipes-extended/mc/mc_4.8.8.bb
+++ b/meta/recipes-extended/mc/mc_4.8.8.bb
@@ -19,5 +19,4 @@ FILES_${PN}-dbg += "${libexecdir}/mc/.debug/"
 
 do_install_append () {
 	sed -i -e '1s,#!.*perl,#!${bindir}/env perl,' ${D}${libexecdir}/mc/extfs.d/*
-	rm -rf ${D}${libdir}
 }
-- 
1.8.1.4


