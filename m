Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 02D3E7FCB1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:02:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,341,1574092800"; d="scan'208";a="82302838"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Jan 2020 17:02:50 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 234E34CE2811
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 16:53:40 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 20 Jan 2020 17:02:52 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 20 Jan 2020 17:02:57 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Jan 2020 04:26:51 -0800
Message-ID: <1579523214-47426-9-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1579523214-47426-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1579523214-47426-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 234E34CE2811.AED63
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libpipeline: upgrade 1.5.2 -> 1.5.2
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
X-List-Received-Date: Mon, 20 Jan 2020 09:02:50 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{libpipeline_1.5.1.bb => libpipeline_1.5.2.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/libpipeline/{libpipeline_1.5.1.bb => libpipeline_1.5.2.bb} (78%)

diff --git a/meta/recipes-extended/libpipeline/libpipeline_1.5.1.bb b/meta/recipes-extended/libpipeline/libpipeline_1.5.2.bb
similarity index 78%
rename from meta/recipes-extended/libpipeline/libpipeline_1.5.1.bb
rename to meta/recipes-extended/libpipeline/libpipeline_1.5.2.bb
index a5802074b1..a182461607 100644
--- a/meta/recipes-extended/libpipeline/libpipeline_1.5.1.bb
+++ b/meta/recipes-extended/libpipeline/libpipeline_1.5.2.bb
@@ -7,8 +7,8 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/libpipeline/libpipeline-${PV}.tar.gz"
-SRC_URI[md5sum] = "4c8fe6cd85422baafd6e060f896c61bc"
-SRC_URI[sha256sum] = "d633706b7d845f08b42bc66ddbe845d57e726bf89298e2cee29f09577e2f902f"
+SRC_URI[md5sum] = "169de4cc1f6f7f7d430a5bed858b2fd3"
+SRC_URI[sha256sum] = "fd59c649c1ae9d67604d1644f116ad4d297eaa66f838e3dfab96b41e85b059fb"
 
 inherit pkgconfig autotools
 
-- 
2.17.1




