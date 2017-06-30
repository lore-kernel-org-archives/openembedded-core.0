Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2E1AF7821C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 02:18:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="20675540"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Jun 2017 10:18:42 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 7B51346B53F6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 10:18:42 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Fri, 30 Jun 2017 10:18:40 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Jun 2017 10:18:40 +0800
Message-ID: <1498789120-10990-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 7B51346B53F6.A5C2E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Cc: susanbian <bianyq@cn.fujitsu.com>
Subject: [PATCH] strace:4.16 -> 4.17
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
X-List-Received-Date: Fri, 30 Jun 2017 02:18:47 -0000
Content-Type: text/plain

From: susanbian <bianyq@cn.fujitsu.com>

Upgrade strace from 4.16 to 4.17.

Signed-off-by: susanbian <bianyq@cn.fujitsu.com>
---
 meta/recipes-devtools/strace/{strace_4.16.bb => strace_4.17.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/strace/{strace_4.16.bb => strace_4.17.bb} (91%)

diff --git a/meta/recipes-devtools/strace/strace_4.16.bb b/meta/recipes-devtools/strace/strace_4.17.bb
similarity index 91%
rename from meta/recipes-devtools/strace/strace_4.16.bb
rename to meta/recipes-devtools/strace/strace_4.17.bb
index b6cd2ac..9434294 100644
--- a/meta/recipes-devtools/strace/strace_4.16.bb
+++ b/meta/recipes-devtools/strace/strace_4.17.bb
@@ -15,8 +15,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
            file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
            "
 
-SRC_URI[md5sum] = "2873366cac98770efcbed6e748d5ef23"
-SRC_URI[sha256sum] = "98487cb5178ec1259986cc9f6e2a844f50e5d1208c112cc22431a1e4d9adf0ef"
+SRC_URI[md5sum] = "8d7eb10eba68bad83a269197e634b626"
+SRC_URI[sha256sum] = "81f35b085fbb3cfa806eb521a8522ac3406deaccfe121ce35064bad268237419"
 
 inherit autotools ptest bluetooth
 
-- 
2.7.4




