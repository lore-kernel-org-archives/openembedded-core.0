Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.4027.1586310777503123323
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2020 18:52:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,357,1580745600"; 
   d="scan'208";a="88651946"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Apr 2020 09:52:52 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 6D5D24BCC8A2
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Apr 2020 09:42:28 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 8 Apr 2020 09:52:49 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 8 Apr 2020 09:52:57 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] gnutls: upgrade 3.6.12 -> 3.6.13
Date: Wed, 8 Apr 2020 02:00:14 -0700
Message-ID: <1586336415-19139-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 6D5D24BCC8A2.A2AB9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../gnutls/{gnutls_3.6.12.bb => gnutls_3.6.13.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.6.12.bb => gnutls_3.6.13.bb} (93%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.6.12.bb b/meta/recipes-support/gnutls/gnutls_3.6.13.bb
similarity index 93%
rename from meta/recipes-support/gnutls/gnutls_3.6.12.bb
rename to meta/recipes-support/gnutls/gnutls_3.6.13.bb
index f1eeebc807..f56d42a613 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.13.bb
@@ -21,8 +21,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://arm_eabi.patch \
 "
 
-SRC_URI[md5sum] = "a23900f14980a467bdce3a0fd31dfa18"
-SRC_URI[sha256sum] = "bfacf16e342949ffd977a9232556092c47164bd26e166736cf3459a870506c4b"
+SRC_URI[md5sum] = "bb1fe696a11543433785b4fc70ca225f"
+SRC_URI[sha256sum] = "32041df447d9f4644570cf573c9f60358e865637d69b7e59d1159b7240b52f38"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-- 
2.17.1



