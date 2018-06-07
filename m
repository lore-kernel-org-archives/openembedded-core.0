Return-Path: <kai.kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 084F071B99
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 09:02:04 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w57924ML008576;
	Thu, 7 Jun 2018 02:02:04 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Thu, 07 Jun 2018 02:02:04 -0700
From: Kai Kang <kai.kang@windriver.com>
To: alexander.kanavin@linux.intel.com
Date: Thu,  7 Jun 2018 02:02:00 -0700
Message-Id: <20180607090200.44857-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180607090200.44857-1-kai.kang@windriver.com>
References: <20180607090200.44857-1-kai.kang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] man-pages: inherit manpages
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
X-List-Received-Date: Thu, 07 Jun 2018 09:02:04 -0000

Inherit manpages to update manual file index caches after installation
for man-pages.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/man-pages/man-pages_4.14.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/man-pages/man-pages_4.14.bb b/meta/recipes-extended/man-pages/man-pages_4.14.bb
index f8bd090d192..4ce0b13ce83 100644
--- a/meta/recipes-extended/man-pages/man-pages_4.14.bb
+++ b/meta/recipes-extended/man-pages/man-pages_4.14.bb
@@ -10,7 +10,13 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
 SRC_URI[md5sum] = "82bd2d05c4d0dba5e7a90d39c9555197"
 SRC_URI[sha256sum] = "aeebc6b09a11e7f7bbc98f3984fe8b8b2bde9d2f5f9dcbd4348a9e0d93704238"
 
-RDEPENDS_${PN} = "man"
+inherit manpages
+
+MAN_PKG = "${PN}"
+
+# help manpages.bbclass deal with RDEPNDS and postinstall scripts
+PACKAGECONFIG = "manpages"
+PACKAGECONFIG[manpages] = ""
 
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
-- 
2.11.0


