Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id EE56B7CF88
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 03:16:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,295,1549900800"; d="scan'208";a="58170609"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Apr 2019 11:16:45 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id A85454CD451D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 11:16:45 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 1 Apr 2019 11:16:52 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Apr 2019 11:17:21 +0800
Message-ID: <20190401031721.12936-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: A85454CD451D.A8541
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libxft:upgrade 2.3.2 -> 2.3.3
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
X-List-Received-Date: Mon, 01 Apr 2019 03:16:46 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from libxft_2.3.2.bb to libxft_2.3.3.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../xorg-lib/{libxft_2.3.2.bb => libxft_2.3.3.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxft_2.3.2.bb => libxft_2.3.3.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/libxft_2.3.2.bb b/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/libxft_2.3.2.bb
rename to meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb
index 4565ae2626..65bd9ae494 100644
--- a/meta/recipes-graphics/xorg-lib/libxft_2.3.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb
@@ -20,8 +20,8 @@ PROVIDES = "xft"
 
 PE = "1"
 
-SRC_URI[md5sum] = "331b3a2a3a1a78b5b44cfbd43f86fcfe"
-SRC_URI[sha256sum] = "f5a3c824761df351ca91827ac221090943ef28b248573486050de89f4bfcdc4c"
+SRC_URI[md5sum] = "4a433c24627b4ff60a4dd403a0990796"
+SRC_URI[sha256sum] = "225c68e616dd29dbb27809e45e9eadf18e4d74c50be43020ef20015274529216"
 
 XORG_PN = "libXft"
 
-- 
2.20.1




