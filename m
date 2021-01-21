Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.1841.1611197817716191629
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jan 2021 18:56:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,362,1602518400"; 
   d="scan'208";a="103682009"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Jan 2021 10:56:47 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 8F22B4CE603F
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Jan 2021 10:56:44 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 21 Jan 2021 10:56:44 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] btrfs-tools: upgrade 5.9 -> 5.10
Date: Thu, 21 Jan 2021 10:56:40 +0800
Message-ID: <1611197800-44287-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 8F22B4CE603F.A367E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../btrfs-tools/{btrfs-tools_5.9.bb => btrfs-tools_5.10.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.9.bb => btrfs-tools_5.10.bb} (97%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.bb
similarity index 97%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.bb
index 15a958e624..8095319f0c 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.bb
@@ -14,7 +14,7 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "2e1fa482300449042ff6612bb51027f3f5765270"
+SRCREV = "273380d98f4412ae8b0f35ad69debf682e48c6bd"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-- 
2.25.1



