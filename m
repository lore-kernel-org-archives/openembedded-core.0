Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3C78E60291
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 02:23:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="38894481"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Apr 2018 10:23:28 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 1C1D048AE921
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 10:23:28 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Mon, 16 Apr 2018 10:23:28 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Apr 2018 19:23:07 +0800
Message-ID: <1523877787-28638-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 1C1D048AE921.A4666
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [PATCH] wayland: 1.14.0 -> 1.15.0
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
X-List-Received-Date: Mon, 16 Apr 2018 02:23:27 -0000
Content-Type: text/plain

Upgrade wayland from 1.14.0 to 1.15.0.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-graphics/wayland/{wayland_1.14.0.bb => wayland_1.15.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland_1.14.0.bb => wayland_1.15.0.bb} (92%)

diff --git a/meta/recipes-graphics/wayland/wayland_1.14.0.bb b/meta/recipes-graphics/wayland/wayland_1.15.0.bb
similarity index 92%
rename from meta/recipes-graphics/wayland/wayland_1.14.0.bb
rename to meta/recipes-graphics/wayland/wayland_1.15.0.bb
index 1a9ff98..788105b 100644
--- a/meta/recipes-graphics/wayland/wayland_1.14.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.15.0.bb
@@ -15,8 +15,8 @@ DEPENDS = "expat libxml2 libffi wayland-native"
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
 	   file://fixpathinpcfiles.patch \
            "
-SRC_URI[md5sum] = "0235f6075c32c3be61cff94fa0b9f108"
-SRC_URI[sha256sum] = "ed80cabc0961a759a42092e2c39aabfc1ec9a13c86c98bbe2b812f008da27ab8"
+SRC_URI[md5sum] = "b7393c17fdce9a8d383edab656c92fd2"
+SRC_URI[sha256sum] = "eb3fbebb8559d56a80ad3753ec3db800f587329067962dbf65e14488b4b7aeb0"
 
 inherit autotools pkgconfig
 
-- 
2.7.4




