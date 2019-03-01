Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id A7A5C7CB04
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 09:03:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.58,426,1544457600"; d="scan'208";a="55604904"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Mar 2019 17:03:41 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 95F6B4C53453
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 17:03:28 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Fri, 1 Mar 2019 17:03:40 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Mar 2019 17:03:50 +0800
Message-ID: <20190301090350.1937-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 95F6B4C53453.A6490
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] elfutils: upgrade 0.175 -> 0.176
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
X-List-Received-Date: Fri, 01 Mar 2019 09:03:43 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

upgrade from elfutils_0.175.bb to elfutils_0.176.bb

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../elfutils/{elfutils_0.175.bb => elfutils_0.176.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.175.bb => elfutils_0.176.bb} (95%)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.175.bb b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
similarity index 95%
rename from meta/recipes-devtools/elfutils/elfutils_0.175.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.176.bb
index b0b9ddc736..fd901c9c9e 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.175.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
@@ -30,8 +30,8 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            "
 SRC_URI_append_libc-musl = " file://0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch"
 
-SRC_URI[md5sum] = "9a02b0382b78cc2d515fb950275d4c02"
-SRC_URI[sha256sum] = "f7ef925541ee32c6d15ae5cb27da5f119e01a5ccdbe9fe57bf836730d7b7a65b"
+SRC_URI[md5sum] = "077e4f49320cad82bf17a997068b1db9"
+SRC_URI[sha256sum] = "eb5747c371b0af0f71e86215a5ebb88728533c3a104a43d4231963f308cd1023"
 
 inherit autotools gettext
 
-- 
2.20.1




