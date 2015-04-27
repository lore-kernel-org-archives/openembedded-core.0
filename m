Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0052565CD0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 06:53:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="91276024"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Apr 2015 14:49:37 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t3R6qExt032143
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 14:52:14 +0800
Received: from localhost.localdomain (10.167.226.48) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 27 Apr 2015 14:53:29 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Apr 2015 14:53:27 +0800
Message-ID: <1430117607-3627-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.48]
Subject: [PATCH] xkeyboard-config: modified the license
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
X-List-Received-Date: Mon, 27 Apr 2015 06:53:33 -0000
Content-Type: text/plain

Because usr/share/X11/xkb/symbols/eu and usr/share/X11/xkb/symbols/ph are GPLv3.
So add GPLv3 in the license.

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta/recipes-graphics/xorg-lib/xkeyboard-config_2.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.13.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.13.bb
index 5536b62..7df25c4 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.13.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.13.bb
@@ -9,7 +9,7 @@ systems."
 HOMEPAGE = "http://freedesktop.org/wiki/Software/XKeyboardConfig"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=xkeyboard-config"
 
-LICENSE = "MIT & MIT-style"
+LICENSE = "MIT & MIT-style & GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
 SRC_URI="${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
-- 
1.8.4.2


