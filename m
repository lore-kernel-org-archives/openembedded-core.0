Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D9F476103A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 10:54:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,428,1574092800"; d="scan'208";a="83207881"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Feb 2020 18:54:24 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 020BD50A9960
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 18:44:52 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 12 Feb 2020 18:54:23 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 12 Feb 2020 18:54:30 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Feb 2020 10:35:05 -0800
Message-ID: <1581532506-107041-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 020BD50A9960.A6006
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] python3-pip: upgrade 19.3.1 -> 20.0.2
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
X-List-Received-Date: Wed, 12 Feb 2020 10:54:25 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/{python3-pip_19.3.1.bb => python3-pip_20.0.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_19.3.1.bb => python3-pip_20.0.2.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-pip_19.3.1.bb b/meta/recipes-devtools/python/python3-pip_20.0.2.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-pip_19.3.1.bb
rename to meta/recipes-devtools/python/python3-pip_20.0.2.bb
index d27e6fce5c..08738fb2f9 100644
--- a/meta/recipes-devtools/python/python3-pip_19.3.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_20.0.2.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8ba06d529c955048e5ddd7c45459eb2e"
 
 DEPENDS += "python3 python3-setuptools-native"
 
-SRC_URI[md5sum] = "1aaaf90fbafc50e7ba1e66ffceb00960"
-SRC_URI[sha256sum] = "21207d76c1031e517668898a6b46a9fb1501c7a4710ef5dfd6a40ad9e6757ea7"
+SRC_URI[md5sum] = "7d42ba49b809604f0df3d55df1c3fd86"
+SRC_URI[sha256sum] = "7db0c8ea4c7ea51c8049640e8e6e7fde949de672bfa4949920675563a5a6967f"
 
 inherit pypi distutils3
 
-- 
2.17.1




