Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 287A2605B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 14:33:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 14 Dec 2015 06:33:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,427,1444719600"; d="scan'208";a="840816538"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 14 Dec 2015 06:33:00 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 2A5D06A4007
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 07:21:01 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 16:34:09 +0200
Message-Id: <1450103652-30181-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/4] libxslt: use proper SRC_URI
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
X-List-Received-Date: Mon, 14 Dec 2015 14:33:01 -0000

Remove extra / from SRC_URI

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/libxslt/libxslt_1.1.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.28.bb b/meta/recipes-support/libxslt/libxslt_1.1.28.bb
index bedc03e..23ac599 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.28.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.28.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=0cd9a07afbeb24026c9b03aecfeba458"
 SECTION = "libs"
 DEPENDS = "libxml2"
 
-SRC_URI = "ftp://xmlsoft.org/libxslt//libxslt-${PV}.tar.gz \
+SRC_URI = "ftp://xmlsoft.org/libxslt/libxslt-${PV}.tar.gz \
            file://pkgconfig_fix.patch \
            file://pkgconfig.patch \
            file://CVE-2015-7995.patch"
-- 
2.4.0


