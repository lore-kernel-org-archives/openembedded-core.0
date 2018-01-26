Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5F8E478761
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 07:06:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="36008402"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Jan 2018 15:06:29 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 59B3849F19C0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 15:06:30 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Fri, 26 Jan 2018 15:06:29 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Jan 2018 15:06:30 +0800
Message-ID: <1516950393-15372-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1516950393-15372-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1516950393-15372-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 59B3849F19C0.A4CD5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] less: 527 -> 529
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
X-List-Received-Date: Fri, 26 Jan 2018 07:06:31 -0000
Content-Type: text/plain

Upgrade less from 527 to 529.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/less/{less_527.bb => less_529.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/less/{less_527.bb => less_529.bb} (89%)

diff --git a/meta/recipes-extended/less/less_527.bb b/meta/recipes-extended/less/less_529.bb
similarity index 89%
rename from meta/recipes-extended/less/less_527.bb
rename to meta/recipes-extended/less/less_529.bb
index f2d33e5..c86f754 100644
--- a/meta/recipes-extended/less/less_527.bb
+++ b/meta/recipes-extended/less/less_529.bb
@@ -27,8 +27,8 @@ DEPENDS = "ncurses"
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
 	  "
 
-SRC_URI[md5sum] = "1582422b9d608476345bbc049dc90f6b"
-SRC_URI[sha256sum] = "4e302ac0435811c10866988e0c0feb6c867626cdd8444ae3428aeb9d6e538f95"
+SRC_URI[md5sum] = "32018b53a1f7319ab54349baf80e6aa8"
+SRC_URI[sha256sum] = "dba42cd4c38174b7bd0d426d8a39df2be6bcc1ec18946a4642713290f6bf9a0b"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.7.4




