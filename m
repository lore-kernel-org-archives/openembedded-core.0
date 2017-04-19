Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id EE7C571AFA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 04:52:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="17904580"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Apr 2017 12:52:25 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 2BE4047CE23B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 12:52:26 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 19 Apr 2017 12:52:25 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Apr 2017 12:52:07 +0800
Message-ID: <1492577527-21254-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 2BE4047CE23B.A7815
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libdrm: 2.4.75 -> 2.4.80
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
X-List-Received-Date: Wed, 19 Apr 2017 04:52:31 -0000
Content-Type: text/plain

Upgrade libdrm from 2.4.75 to 2.4.80.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-graphics/drm/{libdrm_2.4.75.bb => libdrm_2.4.80.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.75.bb => libdrm_2.4.80.bb} (93%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.75.bb b/meta/recipes-graphics/drm/libdrm_2.4.80.bb
similarity index 93%
rename from meta/recipes-graphics/drm/libdrm_2.4.75.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.80.bb
index 56963d4..063381f 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.75.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.80.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
            file://0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch \
           "
 
-SRC_URI[md5sum] = "57b0589122ec4b8d5dfb9e430a21f0b3"
-SRC_URI[sha256sum] = "2d5a500eef412cc287d12268eed79d571e262d4957a2ec9258073f305985054f"
+SRC_URI[md5sum] = "4867866477f228973a64e68051ca9c66"
+SRC_URI[sha256sum] = "a82a519601e9cdfad795e760807eb07ac8913b225e25fc8fe9bc03e3be6549f1"
 
 inherit autotools pkgconfig manpages
 
-- 
2.7.4




