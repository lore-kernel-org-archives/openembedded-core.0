Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2EF8460720
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 06:04:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13449677"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Nov 2016 14:04:04 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id A95E247A866F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 14:04:01 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 30 Nov 2016 14:04:00 +0800
From: huangqy <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Nov 2016 06:04:05 -0800
Message-ID: <1480514645-11090-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: A95E247A866F.A84EC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] iw: 4.7 -> 4.9
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
X-List-Received-Date: Wed, 30 Nov 2016 06:04:06 -0000
Content-Type: text/plain

From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>

Upgrade iw from 4.7 to 4.9.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-connectivity/iw/{iw_4.7.bb => iw_4.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iw/{iw_4.7.bb => iw_4.9.bb} (86%)

diff --git a/meta/recipes-connectivity/iw/iw_4.7.bb b/meta/recipes-connectivity/iw/iw_4.9.bb
similarity index 86%
rename from meta/recipes-connectivity/iw/iw_4.7.bb
rename to meta/recipes-connectivity/iw/iw_4.9.bb
index e9f4141..6daeb07 100644
--- a/meta/recipes-connectivity/iw/iw_4.7.bb
+++ b/meta/recipes-connectivity/iw/iw_4.9.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://www.kernel.org/pub/software/network/iw/${BP}.tar.gz \
            file://separate-objdir.patch \
 "
 
-SRC_URI[md5sum] = "19d1edd276b2ac0c6cccfc7ae8d2b732"
-SRC_URI[sha256sum] = "758092229f13d691968060a0ad41364ba8eb8da4503626c20233a5b1eb33b4d9"
+SRC_URI[md5sum] = "06e96ab7a5c652f8eaed6f71533a9e0f"
+SRC_URI[sha256sum] = "12f921f3dbe0f33c309f5f2891cccf5325c94bd48dceeb102de183f5f048a9e2"
 
 inherit pkgconfig
 
-- 
2.7.4




