Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9F9E86C1CF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 08:57:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wA98v7mV003280
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 9 Nov 2018 00:57:07 -0800 (PST)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Fri, 9 Nov 2018 00:57:05 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Fri, 9 Nov 2018 17:07:06 +0800
Message-ID: <0daea4c1d84400063b4594fe778465f954b6cc6e.1541754319.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1541754319.git.hongxu.jia@windriver.com>
References: <cover.1541754319.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] man-db: 2.8.3 -> 2.8.4
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
X-List-Received-Date: Fri, 09 Nov 2018 08:57:06 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/man-db/{man-db_2.8.3.bb => man-db_2.8.4.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-db/{man-db_2.8.3.bb => man-db_2.8.4.bb} (90%)

diff --git a/meta/recipes-extended/man-db/man-db_2.8.3.bb b/meta/recipes-extended/man-db/man-db_2.8.4.bb
similarity index 90%
rename from meta/recipes-extended/man-db/man-db_2.8.3.bb
rename to meta/recipes-extended/man-db/man-db_2.8.4.bb
index cd8d27c..aa36465 100644
--- a/meta/recipes-extended/man-db/man-db_2.8.3.bb
+++ b/meta/recipes-extended/man-db/man-db_2.8.4.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://docs/COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
            file://99_mandb \
            file://man_db.conf-avoid-multilib-install-file-conflict.patch"
-SRC_URI[md5sum] = "6f3055e18fdd1ce5cbbdb30403991ec7"
-SRC_URI[sha256sum] = "5932a1ca366e1ec61a3ece1a3afa0e92f2fdc125b61d236f20cc6ff9d80cc4ac"
+SRC_URI[md5sum] = "ab41db551f500e4a595b11203b86c67a"
+SRC_URI[sha256sum] = "103c185f9d8269b9ee3b8a4cb27912b3aa393e952731ef96fedc880723472bc3"
 
 DEPENDS = "libpipeline gdbm groff-native base-passwd"
 RDEPENDS_${PN} += "base-passwd"
@@ -19,6 +19,7 @@ USE_NLS_libc-musl = "no"
 inherit gettext pkgconfig autotools
 
 EXTRA_OECONF = "--with-pager=less"
+EXTRA_AUTORECONF += "-I ${S}/gl/m4"
 
 do_install() {
 	autotools_do_install
-- 
2.7.4


