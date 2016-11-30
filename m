Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id CFD147199E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 08:37:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13456055"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Nov 2016 16:37:06 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 6EAC647A866F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 16:37:07 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 30 Nov 2016 16:37:06 +0800
From: huangqy <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Nov 2016 08:36:41 -0800
Message-ID: <1480523801-795-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 6EAC647A866F.A79F6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] msmtp: 1.6.5 -> 1.6.6
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
X-List-Received-Date: Wed, 30 Nov 2016 08:37:14 -0000
Content-Type: text/plain

From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>

Upgrade msmtp from 1.6.5 to 1.6.6.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/msmtp/{msmtp_1.6.5.bb => msmtp_1.6.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.6.5.bb => msmtp_1.6.6.bb} (86%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.6.5.bb b/meta/recipes-extended/msmtp/msmtp_1.6.6.bb
similarity index 86%
rename from meta/recipes-extended/msmtp/msmtp_1.6.5.bb
rename to meta/recipes-extended/msmtp/msmtp_1.6.6.bb
index d0c39eb..e172193 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.6.5.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.6.6.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI = "http://sourceforge.net/projects/msmtp/files/msmtp/${PV}/${BPN}-${PV}.tar.xz \
           "
 
-SRC_URI[md5sum] = "50a8c9bb72f8222779db6b4aae2965e0"
-SRC_URI[sha256sum] = "76a0d60693c7e65d0c7a12f01d300882d280b1e1be0202f54730ae44d44a5006"
+SRC_URI[md5sum] = "82b0520b57db4b2cf05333d11fb5974d"
+SRC_URI[sha256sum] = "da15db1f62bd0201fce5310adb89c86188be91cd745b7cb3b62b81a501e7fb5e"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.7.4




