Return-Path: <wangmy@cn.fujitsu.com>
X-Greylist: delayed 623 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 06 Feb 2020 07:11:02 UTC
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 824CE60B70
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 07:11:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,408,1574092800"; d="scan'208";a="82948514"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Feb 2020 15:00:36 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 30EAB406AB15
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 14:51:09 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 6 Feb 2020 15:00:34 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 6 Feb 2020 15:00:43 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Feb 2020 06:52:26 -0800
Message-ID: <1581000746-42975-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 30EAB406AB15.A4261
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] lighttpd: upgrade 1.4.54 -> 1.4.55
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
X-List-Received-Date: Thu, 06 Feb 2020 07:11:03 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../lighttpd/{lighttpd_1.4.54.bb => lighttpd_1.4.55.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.54.bb => lighttpd_1.4.55.bb} (96%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb
similarity index 96%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb
index 20ce698729..7a255ce2f2 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb
@@ -19,8 +19,8 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
         "
 
-SRC_URI[md5sum] = "7abc776243c811e9872f73ab38b7f8b5"
-SRC_URI[sha256sum] = "cf14cce2254a96d8fcb6d3181e1a3c29a8f832531c3e86ff6f2524ecda9a8721"
+SRC_URI[md5sum] = "be4bda2c28bcbdac6eb941528f6edf03"
+SRC_URI[sha256sum] = "6a0b50e9c9d5cc3d9e48592315c25a2d645858f863e1ccd120507a30ce21e927"
 
 PACKAGECONFIG ??= "openssl pcre zlib \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
-- 
2.17.1




