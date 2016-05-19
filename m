Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C6160606A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 13:42:46 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 19 May 2016 06:42:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,334,1459839600"; d="scan'208";a="106869851"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 19 May 2016 06:42:46 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 8F0666A4006
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 07:30:17 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 May 2016 16:43:09 +0300
Message-Id: <1463665389-18822-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1463665389-18822-1-git-send-email-maxin.john@intel.com>
References: <1463665389-18822-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 4/4] ghostscript: fix upstream check
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
X-List-Received-Date: Thu, 19 May 2016 13:42:47 -0000

Ghostscript releases from version 9.19 have been moved to GitHub.
Update UPSTREAM_CHECK_URI to fix upstream check.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-extended/ghostscript/ghostscript_9.18.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.18.bb b/meta/recipes-extended/ghostscript/ghostscript_9.18.bb
index d4222c7..b6c3bb1 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.18.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.18.bb
@@ -37,6 +37,8 @@ SRC_URI_class-native = "${SRC_URI_BASE} \
                         file://base-genht.c-add-a-preprocessor-define-to-allow-fope.patch \
                         "
 
+UPSTREAM_CHECK_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases"
+
 SRC_URI[md5sum] = "33a47567d7a591c00a253caddd12a88a"
 SRC_URI[sha256sum] = "5fc93079749a250be5404c465943850e3ed5ffbc0d5c07e10c7c5ee8afbbdb1b"
 
-- 
2.4.0


