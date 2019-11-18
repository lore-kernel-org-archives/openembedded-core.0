Return-Path: <anuj.mittal@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 9F6627F8CC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 08:52:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Nov 2019 00:52:05 -0800
X-IronPort-AV: E=Sophos;i="5.68,319,1569308400"; d="scan'208";a="196061735"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.67.150])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Nov 2019 00:52:03 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 16:51:48 +0800
Message-Id: <20191118085149.19903-6-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191118085149.19903-1-anuj.mittal@intel.com>
References: <20191118085149.19903-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] stress-ng: upgrade 0.10.08 -> 0.10.10
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
X-List-Received-Date: Mon, 18 Nov 2019 08:52:03 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../stress-ng/{stress-ng_0.10.08.bb => stress-ng_0.10.10.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.10.08.bb => stress-ng_0.10.10.bb} (83%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.10.08.bb b/meta/recipes-extended/stress-ng/stress-ng_0.10.10.bb
similarity index 83%
rename from meta/recipes-extended/stress-ng/stress-ng_0.10.08.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.10.10.bb
index 470f42295f..47a98f3aac 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.10.08.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.10.10.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            "
-SRC_URI[md5sum] = "e02acd0bc00d3c6a81412537393c2436"
-SRC_URI[sha256sum] = "4addeaabcfcb709581cbc4c61182317b8d91bcf31f529bfa899d170facfd75ce"
+SRC_URI[md5sum] = "ad4de38d6ff1ccf3640573e967dfb136"
+SRC_URI[sha256sum] = "031de5ebc44b49992c11633f10aae96da05a85b326aebdffd88ba8c445d23cf4"
 
 DEPENDS = "coreutils-native"
 
-- 
2.21.0


