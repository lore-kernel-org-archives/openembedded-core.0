Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 05AA67FE47
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 05:46:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jan 2020 21:46:43 -0800
X-IronPort-AV: E=Sophos;i="5.70,348,1574150400"; d="scan'208";a="220200327"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.17.19])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jan 2020 21:46:41 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2020 13:46:32 +0800
Message-Id: <20200122054636.10681-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Subject: [PATCH 1/5] stress-ng: upgrade 0.10.15 -> 0.10.16
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
X-List-Received-Date: Wed, 22 Jan 2020 05:46:43 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../stress-ng/{stress-ng_0.10.15.bb => stress-ng_0.10.16.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.10.15.bb => stress-ng_0.10.16.bb} (83%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.10.15.bb b/meta/recipes-extended/stress-ng/stress-ng_0.10.16.bb
similarity index 83%
rename from meta/recipes-extended/stress-ng/stress-ng_0.10.15.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.10.16.bb
index 5402130fda..e67b82a527 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.10.15.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.10.16.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            "
-SRC_URI[md5sum] = "303a7276e3a9e3dd03be6cabc9e84a75"
-SRC_URI[sha256sum] = "1d0ca8a2f287e13c2d36c01e874d16d67bcb368d8d26563324c9aaf0ddb100c1"
+SRC_URI[md5sum] = "a337cd5b1412c53c580e95ee2a9fc77b"
+SRC_URI[sha256sum] = "eabfffcffcf53e67765181280456c204ad00214339cfdb3ee2769d58b4a7e304"
 
 DEPENDS = "coreutils-native"
 
-- 
2.21.1


