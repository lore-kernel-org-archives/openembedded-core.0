Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A41BB6E680
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 16:46:10 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 10 Mar 2016 08:46:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,316,1455004800"; d="scan'208";a="933975088"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 10 Mar 2016 08:46:10 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 555D42C8001
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 09:33:56 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Mar 2016 13:56:11 +0200
Message-Id: <1457610972-10872-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/2] lsof: update UPSTREAM_CHECK_URI
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
X-List-Received-Date: Thu, 10 Mar 2016 16:46:13 -0000

Set UPSTREAM_CHECK_URI to the below listed URL:
http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-extended/lsof/lsof_4.89.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lsof/lsof_4.89.bb b/meta/recipes-extended/lsof/lsof_4.89.bb
index 5cce0ef..c10337b 100644
--- a/meta/recipes-extended/lsof/lsof_4.89.bb
+++ b/meta/recipes-extended/lsof/lsof_4.89.bb
@@ -9,7 +9,7 @@ SRC_URI = "ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2"
 SRC_URI[md5sum] = "1b9cd34f3fb86856a125abbf2be3a386"
 SRC_URI[sha256sum] = "81ac2fc5fdc944793baf41a14002b6deb5a29096b387744e28f8c30a360a3718"
 
-UPSTREAM_CHECK_URI = "ftp://sunsite.ualberta.ca/pub/Mirror/lsof/"
+UPSTREAM_CHECK_URI = "http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof"
 
 LOCALSRC = "file://${WORKDIR}/lsof_${PV}/lsof_${PV}_src.tar"
 S = "${WORKDIR}/lsof_${PV}_src"
-- 
2.4.0


