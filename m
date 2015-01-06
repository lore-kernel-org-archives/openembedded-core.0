Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E002F72952
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 15:42:35 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 06 Jan 2015 07:42:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="508183839"
Received: from unknown (HELO localhost.intel.com) ([10.252.252.96])
	by orsmga003.jf.intel.com with ESMTP; 06 Jan 2015 07:36:57 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Jan 2015 07:42:18 -0800
Message-Id: <056428fb7af6fe4c262b3c713880615b79868cdc.1420558836.git.sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1420558836.git.sgw@linux.intel.com>
References: <cover.1420558836.git.sgw@linux.intel.com>
In-Reply-To: <cover.1420558836.git.sgw@linux.intel.com>
References: <cover.1420558836.git.sgw@linux.intel.com>
Subject: [PATCH 08/12] libffi: Upgrade to 3.2.1
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
X-List-Received-Date: Tue, 06 Jan 2015 15:42:36 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-gnome/libffi/{libffi_3.1.bb => libffi_3.2.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/libffi/{libffi_3.1.bb => libffi_3.2.1.bb} (88%)

diff --git a/meta/recipes-gnome/libffi/libffi_3.1.bb b/meta/recipes-gnome/libffi/libffi_3.2.1.bb
similarity index 88%
rename from meta/recipes-gnome/libffi/libffi_3.1.bb
rename to meta/recipes-gnome/libffi/libffi_3.2.1.bb
index bc97aba..2302810 100644
--- a/meta/recipes-gnome/libffi/libffi_3.1.bb
+++ b/meta/recipes-gnome/libffi/libffi_3.2.1.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3610bb17683a0089ed64055416b2ae1b"
 SRC_URI = "ftp://sourceware.org/pub/libffi/${BP}.tar.gz \
            file://fix-libffi.la-location.patch"
 
-SRC_URI[md5sum] = "f5898b29bbfd70502831a212d9249d10"
-SRC_URI[sha256sum] = "97feeeadca5e21870fa4433bc953d1b3af3f698d5df8a428f68b73cd60aef6eb"
+SRC_URI[md5sum] = "83b89587607e3eb65c70d361f13bab43"
+SRC_URI[sha256sum] = "d06ebb8e1d9a22d19e38d63fdb83954253f39bedc5d46232a05645685722ca37"
 
 EXTRA_OECONF += "--disable-builddir"
 
-- 
2.1.0


