Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5ECAC7DE2E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 06:56:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,471,1549900800"; d="scan'208";a="63116521"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 May 2019 14:56:52 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 787844CDFCC5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 14:56:54 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 15 May 2019 14:56:53 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 May 2019 14:57:51 +0800
Message-ID: <20190515065751.2989-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 787844CDFCC5.A89EE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libinput:upgrade 1.13.1 -> 1.13.2
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
X-List-Received-Date: Wed, 15 May 2019 06:56:53 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from libinput_1.13.1.bb to libinput_1.13.2.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../wayland/{libinput_1.13.1.bb => libinput_1.13.2.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.13.1.bb => libinput_1.13.2.bb} (86%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.13.1.bb b/meta/recipes-graphics/wayland/libinput_1.13.2.bb
similarity index 86%
rename from meta/recipes-graphics/wayland/libinput_1.13.1.bb
rename to meta/recipes-graphics/wayland/libinput_1.13.2.bb
index 5a6dd9aecb..049674c098 100644
--- a/meta/recipes-graphics/wayland/libinput_1.13.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.13.2.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1f2ea9ebff3a2c6d458faf58492efb63"
 DEPENDS = "libevdev udev mtdev"
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "869a7e68c4290d99868500a369645def"
-SRC_URI[sha256sum] = "e1d487d478ee2bb118890a64211c2b7f2348aaed7363b214bed4d642274841ab"
+SRC_URI[md5sum] = "8b745894f5d1b2e883bfc686aebadcfe"
+SRC_URI[sha256sum] = "1d9fa0698348dea46f75321d98788f8ac7181c069b70c4d10736910a12bb6a6d"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.20.1




