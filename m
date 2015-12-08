Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BF2E16FF91
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 14:32:05 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 08 Dec 2015 06:32:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,400,1444719600"; d="scan'208";a="856456206"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 08 Dec 2015 06:32:05 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 6FD8F6A4083
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 06:30:55 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Dec 2015 16:33:03 +0200
Message-Id: <1449585184-7423-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/2] libtirpc: upgrade to 1.0.1
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
X-List-Received-Date: Tue, 08 Dec 2015 14:32:08 -0000

0.2.5  -> 1.0.1

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../libtirpc/{libtirpc_0.2.5.bb => libtirpc_1.0.1.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/libtirpc/{libtirpc_0.2.5.bb => libtirpc_1.0.1.bb} (88%)

diff --git a/meta/recipes-extended/libtirpc/libtirpc_0.2.5.bb b/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb
similarity index 88%
rename from meta/recipes-extended/libtirpc/libtirpc_0.2.5.bb
rename to meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb
index 330b829..0a236d2 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_0.2.5.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb
@@ -19,8 +19,8 @@ SRC_URI_append_libc-uclibc = " file://remove-des-uclibc.patch \
                                file://va_list.patch \
                              "
 
-SRC_URI[libtirpc.md5sum] = "8cd41a5ef5a9b50d0fb6abb98af15368"
-SRC_URI[libtirpc.sha256sum] = "62f9de7c2c8686c568757730e1fef66502a0e00d6cacf33546d0267984e002db"
+SRC_URI[libtirpc.md5sum] = "36ce1c0ff80863bb0839d54aa0b94014"
+SRC_URI[libtirpc.sha256sum] = "5156974f31be7ccbc8ab1de37c4739af6d9d42c87b1d5caf4835dda75fcbb89e"
 SRC_URI[glibc-nfs.md5sum] = "5ae500b9d0b6b72cb875bc04944b9445"
 SRC_URI[glibc-nfs.sha256sum] = "2677cfedf626f3f5a8f6e507aed5bb8f79a7453b589d684dbbc086e755170d83"
 
-- 
2.4.0


