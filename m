Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2EB4C7FC21
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2019 08:57:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,294,1571673600"; d="scan'208";a="79869123"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Dec 2019 16:57:53 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 7A5504CE1C0A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2019 16:49:17 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 9 Dec 2019 16:57:53 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Dec 2019 06:59:59 -0800
Message-ID: <1575903599-113625-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 7A5504CE1C0A.A7EFA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] netbase: upgrade 5.7 -> 5.8
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
X-List-Received-Date: Mon, 09 Dec 2019 08:57:53 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-core/netbase/{netbase_5.7.bb => netbase_5.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/netbase/{netbase_5.7.bb => netbase_5.8.bb} (82%)

diff --git a/meta/recipes-core/netbase/netbase_5.7.bb b/meta/recipes-core/netbase/netbase_5.8.bb
similarity index 82%
rename from meta/recipes-core/netbase/netbase_5.7.bb
rename to meta/recipes-core/netbase/netbase_5.8.bb
index 754c244..df617f4 100644
--- a/meta/recipes-core/netbase/netbase_5.7.bb
+++ b/meta/recipes-core/netbase/netbase_5.8.bb
@@ -8,8 +8,8 @@ PE = "1"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.tar.xz"
 
-SRC_URI[md5sum] = "f1e50e8d637f6be12af169fa1b67b40a"
-SRC_URI[sha256sum] = "1802ed95847a30d0b618cdfb6fc8f62989fda9fc3d1c0efd0b19e3011a34f915"
+SRC_URI[md5sum] = "ca2e339861b64370779341b9696ee3df"
+SRC_URI[sha256sum] = "4a9035eb379c4f7f7d424e5580b219b79566fa366c812542691ae337486cfb8e"
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netbase/"
 do_install () {
-- 
2.7.4




