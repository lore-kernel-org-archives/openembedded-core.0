Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id EE9CA607A5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 09:08:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10505875"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Sep 2016 17:08:02 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id D4AC840144FF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 17:08:00 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Thu, 1 Sep 2016 17:08:00 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 1 Sep 2016 05:07:56 -0400
Message-ID: <1472720876-2295-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: D4AC840144FF.A63AC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] swig: 3.0.8 -> 3.0.10
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
X-List-Received-Date: Thu, 01 Sep 2016 09:08:12 -0000
Content-Type: text/plain

Upgrade swig from 3.0.8 to 3.0.10.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/swig/{swig_3.0.8.bb => swig_3.0.10.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/swig/{swig_3.0.8.bb => swig_3.0.10.bb} (58%)

diff --git a/meta/recipes-devtools/swig/swig_3.0.8.bb b/meta/recipes-devtools/swig/swig_3.0.10.bb
similarity index 58%
rename from meta/recipes-devtools/swig/swig_3.0.8.bb
rename to meta/recipes-devtools/swig/swig_3.0.10.bb
index c1b820e..44c26c4 100644
--- a/meta/recipes-devtools/swig/swig_3.0.8.bb
+++ b/meta/recipes-devtools/swig/swig_3.0.10.bb
@@ -3,6 +3,6 @@ require ${BPN}.inc
 SRC_URI += "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch \
             file://0001-configure-use-pkg-config-for-pcre-detection.patch \
            "
-SRC_URI[md5sum] = "c96a1d5ecb13d38604d7e92148c73c97"
-SRC_URI[sha256sum] = "58a475dbbd4a4d7075e5fe86d4e54c9edde39847cdb96a3053d87cb64a23a453"
+SRC_URI[md5sum] = "bb4ab8047159469add7d00910e203124"
+SRC_URI[sha256sum] = "2939aae39dec06095462f1b95ce1c958ac80d07b926e48871046d17c0094f44c"
 
-- 
2.7.4




