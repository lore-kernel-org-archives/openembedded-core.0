Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3991C60079
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 01:13:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,278,1549900800"; d="scan'208";a="57874416"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Mar 2019 09:13:32 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id CB03C4CD5D1F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 09:13:29 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 28 Mar 2019 09:13:29 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Mar 2019 09:14:05 +0800
Message-ID: <20190328011405.13868-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: CB03C4CD5D1F.AB4E1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] coreutils:upgrade 8.30 -> 8.31
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
X-List-Received-Date: Thu, 28 Mar 2019 01:13:33 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Upgrade from coreutils_8.30.bb to coreutils_8.31.bb
Change the md5 of file://src/ls.c beacuse of the date change in the file

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../coreutils/{coreutils_8.30.bb => coreutils_8.31.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/coreutils/{coreutils_8.30.bb => coreutils_8.31.bb} (95%)

diff --git a/meta/recipes-core/coreutils/coreutils_8.30.bb b/meta/recipes-core/coreutils/coreutils_8.31.bb
similarity index 95%
rename from meta/recipes-core/coreutils/coreutils_8.30.bb
rename to meta/recipes-core/coreutils/coreutils_8.31.bb
index 8f4ee55712..d171ec93a9 100644
--- a/meta/recipes-core/coreutils/coreutils_8.30.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.31.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.gnu.org/software/coreutils/"
 BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
-                    file://src/ls.c;beginline=1;endline=15;md5=dbe356a88b09c29232b083d1ff8ac82a"
+                    file://src/ls.c;beginline=1;endline=15;md5=c456f9896277a0543e3866777ccc0255"
 DEPENDS = "gmp libcap"
 DEPENDS_class-native = ""
 
@@ -20,8 +20,8 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
           "
 
-SRC_URI[md5sum] = "ab06d68949758971fe744db66b572816"
-SRC_URI[sha256sum] = "e831b3a86091496cdba720411f9748de81507798f6130adeaef872d206e1b057"
+SRC_URI[md5sum] = "0009a224d8e288e8ec406ef0161f9293"
+SRC_URI[sha256sum] = "ff7a9c918edce6b4f4b2725e3f9b37b0c4d193531cac49a48b56c4d0d3a9e9fd"
 
 EXTRA_OECONF_class-native = "--without-gmp"
 EXTRA_OECONF_class-target = "--enable-install-program=arch,hostname --libexecdir=${libdir}"
-- 
2.20.1




