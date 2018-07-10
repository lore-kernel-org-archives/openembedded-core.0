Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 112477553B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 02:42:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="42039477"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Jul 2018 10:42:49 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 16BDC4B5CBEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 10:42:45 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Tue, 10 Jul 2018 10:42:44 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jul 2018 10:42:06 +0800
Message-ID: <20180710024207.6296-6-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180710024207.6296-1-hongl.fnst@cn.fujitsu.com>
References: <20180710024207.6296-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: 16BDC4B5CBEB.A1168
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [PATCH] procps:3.3.14 -> 3.3.15
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
X-List-Received-Date: Tue, 10 Jul 2018 02:42:49 -0000
Content-Type: text/plain

Upgrade procps from 3.3.14 to 3.3.15.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/procps/{procps_3.3.14.bb => procps_3.3.15.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/procps/{procps_3.3.14.bb => procps_3.3.15.bb} (94%)

diff --git a/meta/recipes-extended/procps/procps_3.3.14.bb b/meta/recipes-extended/procps/procps_3.3.15.bb
similarity index 94%
rename from meta/recipes-extended/procps/procps_3.3.14.bb
rename to meta/recipes-extended/procps/procps_3.3.15.bb
index 1aba511..9756db0 100644
--- a/meta/recipes-extended/procps/procps_3.3.14.bb
+++ b/meta/recipes-extended/procps/procps_3.3.15.bb
@@ -17,8 +17,8 @@ SRC_URI = "http://downloads.sourceforge.net/project/procps-ng/Production/procps-
            file://0001-Fix-out-of-tree-builds.patch \
            "
 
-SRC_URI[md5sum] = "fce371ccc1c15a67af9d85e4057e559d"
-SRC_URI[sha256sum] = "5eda0253999b7d786e690edfa73301b3113c7a67058478866e98e9ff6736726c"
+SRC_URI[md5sum] = "2b0717a7cb474b3d6dfdeedfbad2eccc"
+SRC_URI[sha256sum] = "10bd744ffcb3de2d591d2f6acf1a54a7ba070fdcc432a855931a5057149f0465"
 
 S = "${WORKDIR}/procps-ng-${PV}"
 
-- 
2.7.4




