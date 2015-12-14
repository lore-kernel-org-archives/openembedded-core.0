Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm03.jp.fujitsu.com (mgwkm03.jp.fujitsu.com [202.219.69.170])
	by mail.openembedded.org (Postfix) with ESMTP id CAABB70101
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 12:30:25 +0000 (UTC)
Received: from kw-mxoi2.gw.nic.fujitsu.com (unknown [192.168.231.133]) by
	mgwkm03.jp.fujitsu.com with smtp
	id 7220_75bd_86b6dfe8_cc50_45f2_a512_3f874e4ba619;
	Mon, 14 Dec 2015 21:30:17 +0900
Received: from g01jpfmpwkw02.exch.g01.fujitsu.local
	(g01jpfmpwkw02.exch.g01.fujitsu.local [10.0.193.56])
	by kw-mxoi2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8836DAC0227
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 21:30:17 +0900 (JST)
Received: from g01jpexchkw37.g01.fujitsu.local (unknown [10.0.193.4])
	by g01jpfmpwkw02.exch.g01.fujitsu.local (Postfix) with ESMTP id
	D27DF3286DE for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 21:30:16 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchkw37.g01.fujitsu.local (10.0.193.67) with Microsoft SMTP
	Server id 14.3.266.1; Mon, 14 Dec 2015 21:30:15 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Dec 2015 21:31:24 +0900
Message-ID: <1450096284-21791-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-MML: disable
Cc: Fan Xin <fan.xin@jp.fujitsu.com>
Subject: [PATCH] gettext: Upgrade 0.19.4 -> 0.19.6
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
X-List-Received-Date: Mon, 14 Dec 2015 12:30:26 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 .../gettext/{gettext-0.19.4 => gettext-0.19.6}/parallel.patch         | 0
 meta/recipes-core/gettext/{gettext_0.19.4.bb => gettext_0.19.6.bb}    | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/gettext/{gettext-0.19.4 => gettext-0.19.6}/parallel.patch (100%)
 rename meta/recipes-core/gettext/{gettext_0.19.4.bb => gettext_0.19.6.bb} (97%)

diff --git a/meta/recipes-core/gettext/gettext-0.19.4/parallel.patch b/meta/recipes-core/gettext/gettext-0.19.6/parallel.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.19.4/parallel.patch
rename to meta/recipes-core/gettext/gettext-0.19.6/parallel.patch
diff --git a/meta/recipes-core/gettext/gettext_0.19.4.bb b/meta/recipes-core/gettext/gettext_0.19.6.bb
similarity index 97%
rename from meta/recipes-core/gettext/gettext_0.19.4.bb
rename to meta/recipes-core/gettext/gettext_0.19.6.bb
index a9c919a..737561d 100644
--- a/meta/recipes-core/gettext/gettext_0.19.4.bb
+++ b/meta/recipes-core/gettext/gettext_0.19.6.bb
@@ -18,8 +18,8 @@ PACKAGECONFIG[msgcat-curses] = "--with-libncurses-prefix=${STAGING_LIBDIR}/..,--
 
 LDFLAGS_prepend_libc-uclibc = " -lrt -lpthread "
 
-SRC_URI[md5sum] = "d3511af1e604a3478900d2c2b4a4a48e"
-SRC_URI[sha256sum] = "8ac9f1ed1a5f8c4e656a2f37f5ba6b9ee04c4df79a575e876b0b6946aa417f3f"
+SRC_URI[md5sum] = "6d1447f8c5c45c329371ef4bfe7d79a5"
+SRC_URI[sha256sum] = "ed4b4c19bd3a3034eb6769500a3592ff616759ef43cf30586dbb7a17c9dd695d"
 
 inherit autotools texinfo
 
-- 
1.8.4.2


