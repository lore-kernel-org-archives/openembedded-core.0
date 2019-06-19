Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 886FD7E6C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 04:07:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,391,1557158400"; d="scan'208";a="67995077"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Jun 2019 12:07:18 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id A028D4CDB1CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 12:07:17 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 19 Jun 2019 12:07:20 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Jun 2019 12:08:40 +0800
Message-ID: <20190619040840.3444-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: A028D4CDB1CE.A9C38
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libevdev:upgrade 1.6.0 -> 1.7.0
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
X-List-Received-Date: Wed, 19 Jun 2019 04:07:19 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from libevdev_1.6.0.bb to libevdev_1.7.0.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../libevdev/{libevdev_1.6.0.bb => libevdev_1.7.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libevdev/{libevdev_1.6.0.bb => libevdev_1.7.0.bb} (74%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.6.0.bb b/meta/recipes-support/libevdev/libevdev_1.7.0.bb
similarity index 74%
rename from meta/recipes-support/libevdev/libevdev_1.6.0.bb
rename to meta/recipes-support/libevdev/libevdev_1.7.0.bb
index 12cf5192fc..abd6f386b8 100644
--- a/meta/recipes-support/libevdev/libevdev_1.6.0.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.7.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=75aae0d38feea6fda97ca381cb9132eb \
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "154b24f01425c4c82fdc3e11f2c13af6"
-SRC_URI[sha256sum] = "f5005c865987d980cc1279b9ec6131b06a89fd9892f649f2a68262b8786ef814"
+SRC_URI[md5sum] = "fabe87d8d7d7f7cdb4a26e5dc99fc517"
+SRC_URI[sha256sum] = "11dbe1f2b1d03a51f3e9a196757a75c3a999042ce34cf1fdc00a2363e5a2e369"
 
 inherit autotools pkgconfig
-- 
2.20.1




