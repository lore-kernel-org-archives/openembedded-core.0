Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 566E5762B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 02:51:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,321,1566835200"; d="scan'208";a="77251510"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Oct 2019 10:51:38 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id E82FC4CE032B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 10:51:03 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 21 Oct 2019 10:51:46 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Oct 2019 10:51:45 +0800
Message-ID: <20191021025145.15154-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: E82FC4CE032B.A8EDE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] python3-pip:upgrade 19.2.3 -> 19.3.1
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
X-List-Received-Date: Mon, 21 Oct 2019 02:51:39 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python3-pip_19.2.3.bb => python3-pip_19.3.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_19.2.3.bb => python3-pip_19.3.1.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-pip_19.2.3.bb b/meta/recipes-devtools/python/python3-pip_19.3.1.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-pip_19.2.3.bb
rename to meta/recipes-devtools/python/python3-pip_19.3.1.bb
index 019e327..d27e6fc 100644
--- a/meta/recipes-devtools/python/python3-pip_19.2.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_19.3.1.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8ba06d529c955048e5ddd7c45459eb2e"
 
 DEPENDS += "python3 python3-setuptools-native"
 
-SRC_URI[md5sum] = "f417444c66a0db1a82c8d9d2283a2f95"
-SRC_URI[sha256sum] = "e7a31f147974362e6c82d84b91c7f2bdf57e4d3163d3d454e6c3e71944d67135"
+SRC_URI[md5sum] = "1aaaf90fbafc50e7ba1e66ffceb00960"
+SRC_URI[sha256sum] = "21207d76c1031e517668898a6b46a9fb1501c7a4710ef5dfd6a40ad9e6757ea7"
 
 inherit pypi distutils3
 
-- 
2.7.4




