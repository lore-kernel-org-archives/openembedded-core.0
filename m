Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id B893271D79
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 01:30:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="17948145"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Apr 2017 09:30:52 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 628A647CE254
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 09:30:52 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Thu, 20 Apr 2017 09:30:51 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Apr 2017 09:30:35 +0800
Message-ID: <1492651835-48087-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 628A647CE254.A621A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libepoxy: 1.4.0 -> 1.4.1
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
X-List-Received-Date: Thu, 20 Apr 2017 01:30:58 -0000
Content-Type: text/plain

Upgrade libepoxy from 1.4.0 to 1.4.1.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../libepoxy/{libepoxy_1.4.0.bb => libepoxy_1.4.1.bb}               | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/libepoxy/{libepoxy_1.4.0.bb => libepoxy_1.4.1.bb} (70%)

diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.4.0.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.4.1.bb
similarity index 70%
rename from meta/recipes-graphics/libepoxy/libepoxy_1.4.0.bb
rename to meta/recipes-graphics/libepoxy/libepoxy_1.4.1.bb
index ee9f694..4b3f56a 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.4.0.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.4.1.bb
@@ -5,9 +5,9 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
 
-SRC_URI = "https://github.com/anholt/${BPN}/releases/download/v1.4/${BP}.tar.xz"
-SRC_URI[md5sum] = "d8d8cbf2beb64975d424fcc5167a2a38"
-SRC_URI[sha256sum] = "25a906b14a921bc2b488cfeaa21a00486fe92630e4a9dd346e4ecabeae52ab41"
+SRC_URI = "https://github.com/anholt/${BPN}/releases/download/${PV}/${BP}.tar.xz"
+SRC_URI[md5sum] = "a0dc66910009a99c47c5def50b042d77"
+SRC_URI[sha256sum] = "88c6abf5522fc29bab7d6c555fd51a855cbd9253c4315f8ea44e832baef21aa6"
 UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
 
 inherit autotools pkgconfig distro_features_check
-- 
2.7.4




