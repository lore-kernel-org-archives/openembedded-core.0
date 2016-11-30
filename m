Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4383E71A30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 04:03:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13446138"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Nov 2016 12:03:10 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 0147447AC8CB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 12:03:11 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 30 Nov 2016 12:03:09 +0800
From: huangqy <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Nov 2016 04:02:48 -0800
Message-ID: <1480507368-10692-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 0147447AC8CB.A6B1D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] strace: 4.13 -> 4.14
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
X-List-Received-Date: Wed, 30 Nov 2016 04:03:19 -0000
Content-Type: text/plain

From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>

Upgrade strace from 4.13 to 4.14.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/strace/{strace_4.13.bb => strace_4.14.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/strace/{strace_4.13.bb => strace_4.14.bb} (91%)

diff --git a/meta/recipes-devtools/strace/strace_4.13.bb b/meta/recipes-devtools/strace/strace_4.14.bb
similarity index 91%
rename from meta/recipes-devtools/strace/strace_4.13.bb
rename to meta/recipes-devtools/strace/strace_4.14.bb
index cae7f21..452925c 100644
--- a/meta/recipes-devtools/strace/strace_4.13.bb
+++ b/meta/recipes-devtools/strace/strace_4.14.bb
@@ -15,8 +15,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
            file://mips-SIGEMT.patch \
            "
 
-SRC_URI[md5sum] = "4b78c7febdd24c79d5147824d1a080a3"
-SRC_URI[sha256sum] = "d48f732576c91ece36a5843d63f9be054c40ef59f1e4773986042636861625d7"
+SRC_URI[md5sum] = "1e39b5f7583256d7dc21170b9da529ae"
+SRC_URI[sha256sum] = "5bed5110b243dce6864bedba269446c18c8c63f553cdd7fd4f808d89a764712f"
 
 inherit autotools ptest bluetooth
 
-- 
2.7.4




