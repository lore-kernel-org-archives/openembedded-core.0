Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5E4947E63A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 01:53:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,414,1559491200"; d="scan'208";a="74034639"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Aug 2019 09:53:07 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 886A04CE03E9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 09:53:04 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 22 Aug 2019 09:53:09 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Aug 2019 09:52:30 +0800
Message-ID: <20190822015230.17565-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 886A04CE03E9.A967E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] python3-pip:upgrade 19.2.1 -> 19.2.2
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
X-List-Received-Date: Thu, 22 Aug 2019 01:53:08 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python3-pip_19.2.1.bb => python3-pip_19.2.2.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_19.2.1.bb => python3-pip_19.2.2.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-pip_19.2.1.bb b/meta/recipes-devtools/python/python3-pip_19.2.2.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-pip_19.2.1.bb
rename to meta/recipes-devtools/python/python3-pip_19.2.2.bb
index ebf1f25..faafbc1 100644
--- a/meta/recipes-devtools/python/python3-pip_19.2.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_19.2.2.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8ba06d529c955048e5ddd7c45459eb2e"
 
 DEPENDS += "python3 python3-setuptools-native"
 
-SRC_URI[md5sum] = "e9ac3e030e88b6c076a20ab371a30742"
-SRC_URI[sha256sum] = "258d702483dd749400aec59c23d638a5b2249ae28a0f478b6cab12ad45681a80"
+SRC_URI[md5sum] = "2ba0a3b76d39ccd90ca22bfa82fc635f"
+SRC_URI[sha256sum] = "e05103825871e210d50a44c7e448587b0ed99dd775d3ef586304c58f40224a53"
 
 inherit pypi distutils3
 
-- 
2.7.4




