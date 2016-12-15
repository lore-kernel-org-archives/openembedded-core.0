Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5E1D077233
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 01:24:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13930852"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Dec 2016 09:24:27 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 87235467048A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 09:24:27 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Thu, 15 Dec 2016 09:24:28 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Dec 2016 01:24:07 -0800
Message-ID: <1481793847-5276-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 87235467048A.A3F37
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] sudo: 1.8.17p1 -> 1.8.18p1
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
X-List-Received-Date: Thu, 15 Dec 2016 01:24:35 -0000
Content-Type: text/plain

Upgrade sudo from 1.8.17p1 to 1.8.18p1.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/sudo/{sudo_1.8.17p1.bb => sudo_1.8.18p1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.8.17p1.bb => sudo_1.8.18p1.bb} (90%)

diff --git a/meta/recipes-extended/sudo/sudo_1.8.17p1.bb b/meta/recipes-extended/sudo/sudo_1.8.18p1.bb
similarity index 90%
rename from meta/recipes-extended/sudo/sudo_1.8.17p1.bb
rename to meta/recipes-extended/sudo/sudo_1.8.18p1.bb
index 614ad5c..95e1b84 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.17p1.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.18p1.bb
@@ -7,8 +7,8 @@ SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "50a840a688ceb6fa3ab24fc0adf4fa23"
-SRC_URI[sha256sum] = "c690d707fb561b3ecdf6a6de5563bc0b769388eff201c851edbace408bb155cc"
+SRC_URI[md5sum] = "28f5214d5bcb5af5710decb95184a0a6"
+SRC_URI[sha256sum] = "e5a0471c721281a693025bbde33ebd9d3db43245d83ab8516bbfc23980379434"
 
 DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.7.4




