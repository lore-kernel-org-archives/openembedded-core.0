Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 048FA6C4D8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 03:11:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,265,1566835200"; d="scan'208";a="76571627"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Oct 2019 11:11:07 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 445E34CE042F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 11:11:03 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 7 Oct 2019 11:11:04 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Oct 2019 11:11:04 +0800
Message-ID: <20191007031104.16579-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 445E34CE042F.A8FC7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] expat:upgrade 2.2.8 -> 2.2.9
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
X-List-Received-Date: Mon, 07 Oct 2019 03:11:07 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-core/expat/{expat_2.2.8.bb => expat_2.2.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/expat/{expat_2.2.8.bb => expat_2.2.9.bb} (81%)

diff --git a/meta/recipes-core/expat/expat_2.2.8.bb b/meta/recipes-core/expat/expat_2.2.9.bb
similarity index 81%
rename from meta/recipes-core/expat/expat_2.2.8.bb
rename to meta/recipes-core/expat/expat_2.2.9.bb
index 0ea2edc..8f3db41 100644
--- a/meta/recipes-core/expat/expat_2.2.8.bb
+++ b/meta/recipes-core/expat/expat_2.2.9.bb
@@ -10,8 +10,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.bz2 \
            file://libtool-tag.patch \
 	  "
 
-SRC_URI[md5sum] = "00858041acfea5757af55e6ee6b86231"
-SRC_URI[sha256sum] = "9a130948b05a82da34e4171d5f5ae5d321d9630277af02c8fa51e431f6475102"
+SRC_URI[md5sum] = "875a2c2ff3e8eb9e5a5cd62db2033ab5"
+SRC_URI[sha256sum] = "f1063084dc4302a427dabcca499c8312b3a32a29b7d2506653ecc8f950a9a237"
 
 inherit autotools lib_package
 
-- 
2.7.4




