Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6E8D66B0A6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 00:32:09 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Jul 2013 17:33:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1023,1363158000"; d="scan'208";a="367139950"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.85])
	by fmsmga002.fm.intel.com with ESMTP; 08 Jul 2013 17:32:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jul 2013 17:32:06 -0700
Message-Id: <2a5847e8fc17be444e77d6e7564af05a8e84eb42.1373329833.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1373329833.git.sgw@linux.intel.com>
References: <cover.1373329833.git.sgw@linux.intel.com>
In-Reply-To: <cover.1373329833.git.sgw@linux.intel.com>
References: <cover.1373329833.git.sgw@linux.intel.com>
Subject: [PATCH 3/4] tzcode-native: Update to 2013d
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
X-List-Received-Date: Tue, 09 Jul 2013 00:32:09 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../tzcode/{tzcode-native_2013c.bb => tzcode-native_2013d.bb}        | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/tzcode/{tzcode-native_2013c.bb => tzcode-native_2013d.bb} (83%)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2013c.bb b/meta/recipes-extended/tzcode/tzcode-native_2013d.bb
similarity index 83%
rename from meta/recipes-extended/tzcode/tzcode-native_2013c.bb
rename to meta/recipes-extended/tzcode/tzcode-native_2013d.bb
index 5f562cb..52aa9c2 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2013c.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2013d.bb
@@ -8,11 +8,12 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=d7a19b8c6d8a28785c4cd04ff2e46d2
 SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
            ftp://ftp.iana.org/tz/releases/tzdata2013b.tar.gz;name=tzdata"
 
-SRC_URI[tzcode.md5sum] = "69d333d829802af4475707e32fa01681"
-SRC_URI[tzcode.sha256sum] = "e46ee931927273108db1c6b5ab86c37210e903536a910b35a5699a08799bd6f0"
 SRC_URI[tzdata.md5sum] = "489dbca77d1f2e287a3987ca047bb246"
 SRC_URI[tzdata.sha256sum] = "70d589d0e76a3749403d2bb404e9214c2520dda4c13e4b07b1b945ed2c64edb2"
 
+SRC_URI[tzcode.md5sum] = "4616a9560270f180eeb9a08540636890"
+SRC_URI[tzcode.sha256sum] = "2d9eb90c94644cddb74a490d1184ef9f88efcaa7a2b1bf88be0ee9eeeab707b6"
+
 S = "${WORKDIR}"
 
 inherit native
-- 
1.8.1.4


