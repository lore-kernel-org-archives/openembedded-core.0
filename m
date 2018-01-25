Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6524160939
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 08:13:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="35916928"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Jan 2018 16:13:03 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 71AAF48AEA1E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 16:13:02 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Thu, 25 Jan 2018 16:13:01 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Jan 2018 16:13:15 +0800
Message-ID: <1516867995-13801-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 71AAF48AEA1E.A9553
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] hdparm: 9.52 -> 9.53
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
X-List-Received-Date: Thu, 25 Jan 2018 08:13:07 -0000
Content-Type: text/plain

Upgrade hdparm from 9.52 to 9.53.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/hdparm/{hdparm_9.52.bb => hdparm_9.53.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/hdparm/{hdparm_9.52.bb => hdparm_9.53.bb} (90%)

diff --git a/meta/recipes-extended/hdparm/hdparm_9.52.bb b/meta/recipes-extended/hdparm/hdparm_9.53.bb
similarity index 90%
rename from meta/recipes-extended/hdparm/hdparm_9.52.bb
rename to meta/recipes-extended/hdparm/hdparm_9.53.bb
index 13cfb3f..4c3ec5c 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.52.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.53.bb
@@ -25,8 +25,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/${BP}.tar.gz \
            file://wiper.sh-fix-stat-path.patch \
           "
 
-SRC_URI[md5sum] = "410539d0bf3cc247181594581edbfb53"
-SRC_URI[sha256sum] = "c3429cd423e271fa565bf584598fd751dd2e773bb7199a592b06b5a61cec4fb6"
+SRC_URI[md5sum] = "1e54b52e0c8cb79389d4d47eacba411d"
+SRC_URI[sha256sum] = "2673f591df6916c6a1faec07069a7eb1cb8ee307615a615d808192fb0c0265e5"
 
 EXTRA_OEMAKE = 'STRIP="echo" LDFLAGS="${LDFLAGS}"'
 
-- 
2.7.4




