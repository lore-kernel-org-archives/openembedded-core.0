Return-Path: <anuj.mittal@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 65C277CED7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 05:41:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2019 21:41:21 -0800
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="206089312"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.17.193])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2019 21:41:21 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 13:41:06 +0800
Message-Id: <9e637e4887f408f592264e0f95a34f80818c7218.1576733575.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1576733575.git.anuj.mittal@intel.com>
References: <cover.1576733575.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] stress-ng: upgrade 0.10.11 -> 0.10.13
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
X-List-Received-Date: Thu, 19 Dec 2019 05:41:20 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../stress-ng/{stress-ng_0.10.11.bb => stress-ng_0.10.13.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.10.11.bb => stress-ng_0.10.13.bb} (83%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.10.11.bb b/meta/recipes-extended/stress-ng/stress-ng_0.10.13.bb
similarity index 83%
rename from meta/recipes-extended/stress-ng/stress-ng_0.10.11.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.10.13.bb
index 6173ace866..37ace21d48 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.10.11.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.10.13.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            "
-SRC_URI[md5sum] = "03e836175d039cd69a64d2790b9d1a98"
-SRC_URI[sha256sum] = "b84d38a336300fe1c5ae97d13a7154e7a6ea7056fcb690f602ea32bbab2be49b"
+SRC_URI[md5sum] = "f7e53cae53e37d882131e87dc88af0ea"
+SRC_URI[sha256sum] = "da0442053de6db62517c49ad129a8a3f776f60e60591f3be05819eef512acb45"
 
 DEPENDS = "coreutils-native"
 
-- 
2.21.0


