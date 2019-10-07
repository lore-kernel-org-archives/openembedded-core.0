Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5381A7C5F0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 02:52:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,265,1566835200"; d="scan'208";a="76571161"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Oct 2019 10:52:18 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id CB4D34CE14E1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 10:52:13 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 7 Oct 2019 10:52:14 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Oct 2019 10:52:14 +0800
Message-ID: <20191007025214.16260-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: CB4D34CE14E1.A9EB9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libpcap:upgrade 1.9.0 -> 1.9.1
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
X-List-Received-Date: Mon, 07 Oct 2019 02:52:20 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-libpcap/0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-syste.patch
 Removed since this is included in 1.9.1.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...nux.c-add-missing-limits.h-for-musl-syste.patch | 29 ----------------------
 .../libpcap/{libpcap_1.9.0.bb => libpcap_1.9.1.bb} |  5 ++--
 2 files changed, 2 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-syste.patch
 rename meta/recipes-connectivity/libpcap/{libpcap_1.9.0.bb => libpcap_1.9.1.bb} (88%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap/0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-syste.patch b/meta/recipes-connectivity/libpcap/libpcap/0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-syste.patch
deleted file mode 100644
index 0177383..0000000
--- a/meta/recipes-connectivity/libpcap/libpcap/0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-syste.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From aafa3512b7b742f5e66a5543e41974cc5e7eebfa Mon Sep 17 00:00:00 2001
-From: maxice8 <thinkabit.ukim@gmail.com>
-Date: Sun, 22 Jul 2018 18:54:17 -0300
-Subject: [PATCH] pcap-usb-linux.c: add missing limits.h for musl systems.
-
-fix compilation on musl libc systems like Void Linux and Alpine.
-
-Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/commit/d557c98a16dc254aaff03762b694fe624e180bea]
-
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- pcap-usb-linux.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/pcap-usb-linux.c b/pcap-usb-linux.c
-index 6f8adf65..b92c05ea 100644
---- a/pcap-usb-linux.c
-+++ b/pcap-usb-linux.c
-@@ -50,6 +50,7 @@
- #include <stdlib.h>
- #include <unistd.h>
- #include <fcntl.h>
-+#include <limits.h>
- #include <string.h>
- #include <dirent.h>
- #include <byteswap.h>
--- 
-2.17.1
-
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.9.0.bb b/meta/recipes-connectivity/libpcap/libpcap_1.9.1.bb
similarity index 88%
rename from meta/recipes-connectivity/libpcap/libpcap_1.9.0.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.9.1.bb
index 77bc31a..318e2d7 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.9.0.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.9.1.bb
@@ -11,10 +11,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5eb289217c160e2920d2e35bddc36453 \
 DEPENDS = "flex-native bison-native"
 
 SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz \
-           file://0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-syste.patch \
            "
-SRC_URI[md5sum] = "dffd65cb14406ab9841f421732eb0f33"
-SRC_URI[sha256sum] = "2edb88808e5913fdaa8e9c1fcaf272e19b2485338742b5074b9fe44d68f37019"
+SRC_URI[md5sum] = "21af603d9a591c7d96a6457021d84e6c"
+SRC_URI[sha256sum] = "635237637c5b619bcceba91900666b64d56ecb7be63f298f601ec786ce087094"
 
 inherit autotools binconfig-disabled pkgconfig
 
-- 
2.7.4




