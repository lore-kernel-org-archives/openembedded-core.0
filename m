Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1D88D615FD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 02:02:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Feb 2020 18:02:04 -0800
X-IronPort-AV: E=Sophos;i="5.70,466,1574150400"; d="scan'208";a="225067421"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/AES256-SHA256;
	20 Feb 2020 18:02:03 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2020 10:01:28 +0800
Message-Id: <1582250488-79398-13-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582250488-79398-1-git-send-email-anuj.mittal@intel.com>
References: <1582250488-79398-1-git-send-email-anuj.mittal@intel.com>
Subject: [PATCH 13/13] stress-ng: upgrade 0.10.16 -> 0.11.00
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
X-List-Received-Date: Fri, 21 Feb 2020 02:02:03 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../stress-ng/{stress-ng_0.10.16.bb => stress-ng_0.11.00.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.10.16.bb => stress-ng_0.11.00.bb} (83%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.10.16.bb b/meta/recipes-extended/stress-ng/stress-ng_0.11.00.bb
similarity index 83%
rename from meta/recipes-extended/stress-ng/stress-ng_0.10.16.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.11.00.bb
index e67b82a..c8471eb 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.10.16.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.11.00.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            "
-SRC_URI[md5sum] = "a337cd5b1412c53c580e95ee2a9fc77b"
-SRC_URI[sha256sum] = "eabfffcffcf53e67765181280456c204ad00214339cfdb3ee2769d58b4a7e304"
+SRC_URI[md5sum] = "781f8a0f8509a01793d815210086e78a"
+SRC_URI[sha256sum] = "a41a6a4a7ea4e50aab7331e5594af7d1b3b6e5815751d137a78a6e166295294e"
 
 DEPENDS = "coreutils-native"
 
-- 
2.7.4


