Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9EA316E630
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 09:23:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99073883"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Jul 2015 17:27:19 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6U9Lr0R016543
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 17:21:53 +0800
Received: from localhost.localdomain (10.167.226.104) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 30 Jul 2015 17:23:44 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Jul 2015 13:23:38 -0400
Message-ID: <1438277018-8465-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.104]
Subject: [oe][meta-oe][PATCH] ccid: upgrade 1.4.8 -> 1.4.19
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
X-List-Received-Date: Thu, 30 Jul 2015 09:23:53 -0000
Content-Type: text/plain

From: zhangpanpan <zhangpp-fnst@cn.fujitsu.com>

Signed-off-by: Zhang Panpan<zhangpp-fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/ccid/{ccid_1.4.8.bb => ccid_1.4.19.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/ccid/{ccid_1.4.8.bb => ccid_1.4.19.bb} (62%)

diff --git a/meta-oe/recipes-support/ccid/ccid_1.4.8.bb b/meta-oe/recipes-support/ccid/ccid_1.4.19.bb
similarity index 62%
rename from meta-oe/recipes-support/ccid/ccid_1.4.8.bb
rename to meta-oe/recipes-support/ccid/ccid_1.4.19.bb
index 078f785..f77e069 100644
--- a/meta-oe/recipes-support/ccid/ccid_1.4.8.bb
+++ b/meta-oe/recipes-support/ccid/ccid_1.4.19.bb
@@ -6,11 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "virtual/libusb0 pcsc-lite"
 RDEPENDS_${PN} = "pcsc-lite"
 
-SRC_URI = "https://alioth.debian.org/frs/download.php/file/3768/ccid-${PV}.tar.bz2 \
-           file://no-dep-on-libfl.patch"
+SRC_URI = "https://alioth.debian.org/frs/download.php/file/4132/ccid-${PV}.tar.bz2 \
+	   file://no-dep-on-libfl.patch "
 
-SRC_URI[md5sum] = "b6c37110f50b059a8ba94f118cfd679a"
-SRC_URI[sha256sum] = "7aca09fa4b9099e423402fd5df424adbafa502888710d1fda6015b6c1ff637ef"
+SRC_URI[md5sum] = "d1eed995ba9a2eb395a65a8a78090f52"
+SRC_URI[sha256sum] = "cccb2c2bb4e56689efe34559f713102d92f94735542e58d3e4334e1459e934e1"
 
 inherit autotools pkgconfig
 
-- 
1.8.4.2


