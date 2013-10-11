Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id BFEBD6D04E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 15:27:28 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Oct 2013 08:27:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1081,1371106800"; d="scan'208";a="373506407"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.234])
	by azsmga001.ch.intel.com with ESMTP; 11 Oct 2013 08:27:30 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2013 08:27:10 -0700
Message-Id: <9602b57816718e3931a89c1010b962ff6a7f5c8a.1381505051.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <664cd9c705a03b0529f30e091b6e8b721ef13a09.1381505051.git.sgw@linux.intel.com>
References: <664cd9c705a03b0529f30e091b6e8b721ef13a09.1381505051.git.sgw@linux.intel.com>
In-Reply-To: <cover.1381505051.git.sgw@linux.intel.com>
References: <cover.1381505051.git.sgw@linux.intel.com>
Subject: [PATCH 04/18] cups: upgrade to 1.6.4
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
X-List-Received-Date: Fri, 11 Oct 2013 15:27:29 -0000

(From OE-Core rev: 537a9a6d4cb7700cd683010d06672aa557b7fa1e)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/cups/{cups_1.6.3.bb => cups_1.6.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/cups/{cups_1.6.3.bb => cups_1.6.4.bb} (80%)

diff --git a/meta/recipes-extended/cups/cups_1.6.3.bb b/meta/recipes-extended/cups/cups_1.6.4.bb
similarity index 80%
rename from meta/recipes-extended/cups/cups_1.6.3.bb
rename to meta/recipes-extended/cups/cups_1.6.4.bb
index 5ed52fe..8aabd49 100644
--- a/meta/recipes-extended/cups/cups_1.6.3.bb
+++ b/meta/recipes-extended/cups/cups_1.6.4.bb
@@ -10,8 +10,8 @@ SRC_URI += " \
             file://cups_serverbin.patch \
 	"
 
-SRC_URI[md5sum] = "946a2d8ad1aec6beced312fce18543da"
-SRC_URI[sha256sum] = "84fa83dea6ed08dbd4d1112d9b0005424713b32bcb13111857836312896cf29d"
+SRC_URI[md5sum] = "52c3df269709a4d25472cfe72ab5e856"
+SRC_URI[sha256sum] = "b910c3e43b2d06f54154d12710e849455d0710c9983dab0a5f49a5e93b1b7e73"
 
 EXTRA_OECONF += " --disable-gssapi --enable-debug --disable-relro --enable-libusb \
        ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)}"
-- 
1.8.3.1


