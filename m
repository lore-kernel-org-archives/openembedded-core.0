Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5C8296BCA9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 07:40:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,322,1566835200"; d="scan'208";a="77264869"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Oct 2019 15:40:18 +0800
Received: by cn.fujitsu.com (Postfix, from userid 89)
	id 469794CE2800; Mon, 21 Oct 2019 13:50:10 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 982044CE3B64
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 13:50:10 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 21 Oct 2019 13:50:40 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Oct 2019 13:50:52 +0800
Message-ID: <20191021055052.10882-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 469794CE2800.A6D3D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libcap-ng:upgrade 0.7.9 -> 0.7.10
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
X-List-Received-Date: Mon, 21 Oct 2019 07:40:19 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{libcap-ng-python_0.7.9.bb => libcap-ng-python_0.7.10.bb}       | 0
 meta/recipes-support/libcap-ng/libcap-ng.inc                        | 6 +++---
 .../libcap-ng/{libcap-ng_0.7.9.bb => libcap-ng_0.7.10.bb}           | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libcap-ng/{libcap-ng-python_0.7.9.bb => libcap-ng-python_0.7.10.bb} (100%)
 rename meta/recipes-support/libcap-ng/{libcap-ng_0.7.9.bb => libcap-ng_0.7.10.bb} (100%)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.7.9.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.7.10.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng-python_0.7.9.bb
rename to meta/recipes-support/libcap-ng/libcap-ng-python_0.7.10.bb
diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index 739b91f..aec8389 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -11,7 +11,7 @@ SRC_URI = "http://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz \
            file://python.patch \
 "
 
-SRC_URI[md5sum] = "2398d695508fab9ce33668c53a89b0e9"
-SRC_URI[sha256sum] = "4a1532bcf3731aade40936f6d6a586ed5a66ca4c7455e1338d1f6c3e09221328"
+SRC_URI[md5sum] = "57dc267e2949cdecb651a929f9206572"
+SRC_URI[sha256sum] = "a84ca7b4e0444283ed269b7a29f5b6187f647c82e2b876636b49b9a744f0ffbf"
 
-BBCLASSEXTEND = "native nativesdk"
\ No newline at end of file
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.7.9.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.7.10.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng_0.7.9.bb
rename to meta/recipes-support/libcap-ng/libcap-ng_0.7.10.bb
-- 
2.7.4




