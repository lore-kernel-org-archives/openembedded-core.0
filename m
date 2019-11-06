Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B80967F822
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 01:20:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,271,1569254400"; 
   d="scan'208";a="43027"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Nov 2019 09:20:33 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 289A34B6EC73
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 09:12:25 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 6 Nov 2019 09:20:32 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Nov 2019 09:20:47 +0800
Message-ID: <20191106012047.12490-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 289A34B6EC73.A726A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] ruby:upgrade 2.6.4 -> 2.6.5
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
X-List-Received-Date: Wed, 06 Nov 2019 01:20:34 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/ruby/{ruby_2.6.4.bb => ruby_2.6.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_2.6.4.bb => ruby_2.6.5.bb} (94%)

diff --git a/meta/recipes-devtools/ruby/ruby_2.6.4.bb b/meta/recipes-devtools/ruby/ruby_2.6.5.bb
similarity index 94%
rename from meta/recipes-devtools/ruby/ruby_2.6.4.bb
rename to meta/recipes-devtools/ruby/ruby_2.6.5.bb
index fb202b8f1f..1828f65d51 100644
--- a/meta/recipes-devtools/ruby/ruby_2.6.4.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.6.5.bb
@@ -5,8 +5,8 @@ SRC_URI += " \
            file://run-ptest \
            "
 
-SRC_URI[md5sum] = "49b628cdb21db967d8a3f6ca6e222583"
-SRC_URI[sha256sum] = "4fc1d8ba75505b3797020a6ffc85a8bcff6adc4dabae343b6572bf281ee17937"
+SRC_URI[md5sum] = "8754bfb36d52c2bf1fb3d3ddc7101606"
+SRC_URI[sha256sum] = "66976b716ecc1fd34f9b7c3c2b07bbd37631815377a2e3e85a5b194cfdcbed7d"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.20.1




