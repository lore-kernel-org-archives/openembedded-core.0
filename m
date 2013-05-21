Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id D259F6041F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 23:54:34 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 21 May 2013 16:54:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,717,1363158000"; d="scan'208";a="305962044"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.171])
	by azsmga001.ch.intel.com with ESMTP; 21 May 2013 16:54:35 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2013 16:54:35 -0700
Message-Id: <1369180475-31178-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH] patch: diable xattr as default
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
X-List-Received-Date: Tue, 21 May 2013 23:54:35 -0000

There is a optional dependency on xattr (and thus the attr package),
disable it by default, to ensure it builds correctly.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/patch/patch_2.7.1.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/patch/patch_2.7.1.bb b/meta/recipes-devtools/patch/patch_2.7.1.bb
index 38df034..b131204 100644
--- a/meta/recipes-devtools/patch/patch_2.7.1.bb
+++ b/meta/recipes-devtools/patch/patch_2.7.1.bb
@@ -9,3 +9,5 @@ SRC_URI[sha256sum] = "c05f28668c3474bc63adcd48abae921d15e71c254fbebdbaeda40456d6
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 acpaths = "-I ${S}/m4 "
+
+EXTRA_OECONF += "--disable-xattr"
-- 
1.7.10.4


