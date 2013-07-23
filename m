Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 456886AFF3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 23:54:00 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 23 Jul 2013 16:54:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,731,1367996400"; d="scan'208";a="335789710"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.5])
	by azsmga001.ch.intel.com with ESMTP; 23 Jul 2013 16:54:00 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jul 2013 16:53:57 -0700
Message-Id: <0e5ed8dbacf69b9a70797a51948cc31dbc45834b.1374622196.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1374622196.git.sgw@linux.intel.com>
References: <cover.1374622196.git.sgw@linux.intel.com>
In-Reply-To: <cover.1374622196.git.sgw@linux.intel.com>
References: <cover.1374622196.git.sgw@linux.intel.com>
Subject: [PATCH 3/3] cups: Update to 1.6.3
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
X-List-Received-Date: Tue, 23 Jul 2013 23:54:00 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/cups/{cups_1.6.2.bb => cups_1.6.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/cups/{cups_1.6.2.bb => cups_1.6.3.bb} (80%)

diff --git a/meta/recipes-extended/cups/cups_1.6.2.bb b/meta/recipes-extended/cups/cups_1.6.3.bb
similarity index 80%
rename from meta/recipes-extended/cups/cups_1.6.2.bb
rename to meta/recipes-extended/cups/cups_1.6.3.bb
index aa199e9..5ed52fe 100644
--- a/meta/recipes-extended/cups/cups_1.6.2.bb
+++ b/meta/recipes-extended/cups/cups_1.6.3.bb
@@ -10,8 +10,8 @@ SRC_URI += " \
             file://cups_serverbin.patch \
 	"
 
-SRC_URI[md5sum] = "13c8b2b2336d42001abe4899766b62dc"
-SRC_URI[sha256sum] = "37a3ebd305e76cfd4c9c53013e89c0f7a4dcb04b2e9da61029a29faa57e0f10d"
+SRC_URI[md5sum] = "946a2d8ad1aec6beced312fce18543da"
+SRC_URI[sha256sum] = "84fa83dea6ed08dbd4d1112d9b0005424713b32bcb13111857836312896cf29d"
 
 EXTRA_OECONF += " --disable-gssapi --enable-debug --disable-relro --enable-libusb \
        ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)}"
-- 
1.8.1.4


