Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 626206FAB1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 03:26:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Jun 2014 20:21:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,962,1392192000"; d="scan'208";a="521786731"
Received: from kmaligas-mobl1.gar.corp.intel.com (HELO swold-linux.bigsur.com)
	([10.255.12.167])
	by orsmga001.jf.intel.com with ESMTP; 02 Jun 2014 20:26:14 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jun 2014 20:26:08 -0700
Message-Id: <8ecde9b243308546b77455bfd8391509657445e9.1401765630.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1401765630.git.sgw@linux.intel.com>
References: <cover.1401765630.git.sgw@linux.intel.com>
In-Reply-To: <cover.1401765630.git.sgw@linux.intel.com>
References: <cover.1401765630.git.sgw@linux.intel.com>
Subject: [PATCH 3/7] libffi: Update to 3.1
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
X-List-Received-Date: Tue, 03 Jun 2014 03:26:35 -0000

LICENSE file has updated year

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-gnome/libffi/{libffi_3.0.13.bb => libffi_3.1.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/libffi/{libffi_3.0.13.bb => libffi_3.1.bb} (77%)

diff --git a/meta/recipes-gnome/libffi/libffi_3.0.13.bb b/meta/recipes-gnome/libffi/libffi_3.1.bb
similarity index 77%
rename from meta/recipes-gnome/libffi/libffi_3.0.13.bb
rename to meta/recipes-gnome/libffi/libffi_3.1.bb
index 9897ca8..bc97aba 100644
--- a/meta/recipes-gnome/libffi/libffi_3.0.13.bb
+++ b/meta/recipes-gnome/libffi/libffi_3.1.bb
@@ -7,13 +7,13 @@ library really only provides the lowest, machine dependent layer of a fully feat
 A layer must exist above `libffi' that handles type conversions for values passed between the two languages."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e54c573c49435ccbbd3f6dc9e49a065e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3610bb17683a0089ed64055416b2ae1b"
 
-SRC_URI = "ftp://sourceware.org/pub/libffi/${BPN}-${PV}.tar.gz \
+SRC_URI = "ftp://sourceware.org/pub/libffi/${BP}.tar.gz \
            file://fix-libffi.la-location.patch"
 
-SRC_URI[md5sum] = "45f3b6dbc9ee7c7dfbbbc5feba571529"
-SRC_URI[sha256sum] = "1dddde1400c3bcb7749d398071af88c3e4754058d2d4c0b3696c2f82dc5cf11c"
+SRC_URI[md5sum] = "f5898b29bbfd70502831a212d9249d10"
+SRC_URI[sha256sum] = "97feeeadca5e21870fa4433bc953d1b3af3f698d5df8a428f68b73cd60aef6eb"
 
 EXTRA_OECONF += "--disable-builddir"
 
-- 
1.8.3.1


