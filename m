Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1EF0D728CB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 15:42:32 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 06 Jan 2015 07:42:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="508183829"
Received: from unknown (HELO localhost.intel.com) ([10.252.252.96])
	by orsmga003.jf.intel.com with ESMTP; 06 Jan 2015 07:36:53 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Jan 2015 07:42:15 -0800
Message-Id: <7bfbcb4ca6a19b4377fa223f10c69309a8a009b7.1420558836.git.sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1420558836.git.sgw@linux.intel.com>
References: <cover.1420558836.git.sgw@linux.intel.com>
In-Reply-To: <cover.1420558836.git.sgw@linux.intel.com>
References: <cover.1420558836.git.sgw@linux.intel.com>
Subject: [PATCH 05/12] gnu-efi: Upgrade to 3.0w
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
X-List-Received-Date: Tue, 06 Jan 2015 15:42:33 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-bsp/gnu-efi/{gnu-efi_3.0u.bb => gnu-efi_3.0w.bb} | 1 +
 1 file changed, 1 insertion(+)
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0u.bb => gnu-efi_3.0w.bb} (99%)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0w.bb
similarity index 99%
rename from meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb
rename to meta/recipes-bsp/gnu-efi/gnu-efi_3.0w.bb
index dbf2a07..e854245 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0w.bb
@@ -8,6 +8,7 @@ SRC_URI = "http://downloads.sourceforge.net/gnu-efi/gnu-efi_3.0u.orig.tar.gz \
            file://parallel-make.patch \
            file://parallel-make-archives.patch \
           "
+
 SRC_URI[md5sum] = "d15d3c700e79a1e2938544d73edc572d"
 SRC_URI[sha256sum] = "3c0d450d5829204ca05dcb3b2aae772e52c379b7c7e09146759c6315606f934e"
 
-- 
2.1.0


