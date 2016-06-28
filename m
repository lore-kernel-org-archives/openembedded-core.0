Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1407C731C1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2016 08:06:38 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 28 Jun 2016 01:06:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,540,1459839600"; d="scan'208";a="129745561"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 28 Jun 2016 01:06:38 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jun 2016 11:06:20 +0300
Message-Id: <1467101180-23116-10-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1467101180-23116-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1467101180-23116-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/10] vala: update to 0.32.1
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
X-List-Received-Date: Tue, 28 Jun 2016 08:06:39 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/vala/{vala_0.30.1.bb => vala_0.32.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/vala/{vala_0.30.1.bb => vala_0.32.1.bb} (56%)

diff --git a/meta/recipes-devtools/vala/vala_0.30.1.bb b/meta/recipes-devtools/vala/vala_0.32.1.bb
similarity index 56%
rename from meta/recipes-devtools/vala/vala_0.30.1.bb
rename to meta/recipes-devtools/vala/vala_0.32.1.bb
index 6394afc..b34086e 100644
--- a/meta/recipes-devtools/vala/vala_0.30.1.bb
+++ b/meta/recipes-devtools/vala/vala_0.32.1.bb
@@ -4,5 +4,5 @@ SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.pa
              file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch \
 "
 
-SRC_URI[md5sum] = "cc2eb2384fc10038b643753d734a5a51"
-SRC_URI[sha256sum] = "23add78e5c6a5e6df019d4a885c9c79814c9e0b957519ec8a4f4d826c4e5df2c"
+SRC_URI[md5sum] = "755881770bffac020b5ea5f625fbe528"
+SRC_URI[sha256sum] = "dd0d47e548a34cfb1e4b04149acd082a86414c49057ffb79902eb9a508a161a9"
-- 
2.8.1


