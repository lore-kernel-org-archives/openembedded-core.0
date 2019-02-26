Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 49BCC6B96C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 05:58:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.58,414,1544457600"; d="scan'208";a="55259086"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Feb 2019 13:58:42 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 03C2446BA6D2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 13:58:35 +0800 (CST)
Received: from localhost.localdomain (10.167.225.47) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Tue, 26 Feb 2019 13:58:53 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Feb 2019 14:00:00 +0800
Message-ID: <20190226060000.4210-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.47]
X-yoursite-MailScanner-ID: 03C2446BA6D2.AB6C5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [PATCH] wayland:Upgrade to 1.16.91
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
X-List-Received-Date: Tue, 26 Feb 2019 05:58:43 -0000
Content-Type: text/plain

Upgrade wayland from 1.16.0 to 1.16.91.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../wayland/{wayland_1.16.0.bb => wayland_1.16.91.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland_1.16.0.bb => wayland_1.16.91.bb} (92%)

diff --git a/meta/recipes-graphics/wayland/wayland_1.16.0.bb b/meta/recipes-graphics/wayland/wayland_1.16.91.bb
similarity index 92%
rename from meta/recipes-graphics/wayland/wayland_1.16.0.bb
rename to meta/recipes-graphics/wayland/wayland_1.16.91.bb
index 112ee1a25e..8d7a06cdde 100644
--- a/meta/recipes-graphics/wayland/wayland_1.16.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.16.91.bb
@@ -15,8 +15,8 @@ DEPENDS = "expat libxml2 libffi wayland-native"
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
 	   file://fixpathinpcfiles.patch \
            "
-SRC_URI[md5sum] = "0c215e53de71d6fb26f7102cdc6432d3"
-SRC_URI[sha256sum] = "4e72c2b56109ccfb6610d776e465f4ca0af2280c9c2f7d5cc23f0ed2548752f5"
+SRC_URI[md5sum] = "711fea532899f2de096ebafdc54d1e3f"
+SRC_URI[sha256sum] = "d51b83a51034ed5474517e0b0bca2d4e7056e4c51d720ea885f0c34f243fee90"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-- 
2.17.2




