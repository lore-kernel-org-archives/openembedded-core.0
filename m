Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B53AA606A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 13:42:42 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 19 May 2016 06:42:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,334,1459839600"; d="scan'208";a="970412113"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 19 May 2016 06:42:43 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id A46A66A4006
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 07:30:13 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 May 2016 16:43:07 +0300
Message-Id: <1463665389-18822-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1463665389-18822-1-git-send-email-maxin.john@intel.com>
References: <1463665389-18822-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/4] freetype: fix upstream check
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
X-List-Received-Date: Thu, 19 May 2016 13:42:42 -0000

Provide UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX for proper
upstream check.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-graphics/freetype/freetype_2.6.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/freetype/freetype_2.6.3.bb b/meta/recipes-graphics/freetype/freetype_2.6.3.bb
index 3ed9070..bcd5044 100644
--- a/meta/recipes-graphics/freetype/freetype_2.6.3.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.6.3.bb
@@ -15,6 +15,9 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=4af6221506f202774ef74f64932878a1
 SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
            file://use-right-libtool.patch"
 
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/freetype/files/freetype2/"
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
+
 SRC_URI[md5sum] = "0037b25a8c090bc8a1218e867b32beb1"
 SRC_URI[sha256sum] = "371e707aa522acf5b15ce93f11183c725b8ed1ee8546d7b3af549863045863a2"
 
-- 
2.4.0


