Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 483F060FB2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 09:50:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,424,1574092800"; d="scan'208";a="83096254"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Feb 2020 17:50:09 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 12A3750A9962
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 17:40:37 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 10 Feb 2020 17:50:08 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 10 Feb 2020 17:50:11 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Feb 2020 09:38:03 -0800
Message-ID: <1581356285-65315-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1581356285-65315-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1581356285-65315-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 12A3750A9962.A3FAD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libxcrypt: upgrade 4.4.10 -> 4.4.12
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
X-List-Received-Date: Mon, 10 Feb 2020 09:50:09 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{libxcrypt-compat_4.4.10.bb => libxcrypt-compat_4.4.12.bb}  | 0
 meta/recipes-core/libxcrypt/libxcrypt.inc                       | 2 +-
 .../libxcrypt/{libxcrypt_4.4.10.bb => libxcrypt_4.4.12.bb}      | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.10.bb => libxcrypt-compat_4.4.12.bb} (100%)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.10.bb => libxcrypt_4.4.12.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.10.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.12.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.10.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.12.bb
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index accbdd6361..59744c0cf8 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM ?= "file://LICENSING;md5=3bb6614cf5880cbf1b9dbd9e3d145e2c \
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}"
-SRCREV = "dcf7d7509a26a2fe83f115f5ee731c59749ae17e"
+SRCREV = "21f93470aad8634fcf39f72db0b62642c7073a0c"
 SRCBRANCH ?= "develop"
 
 PROVIDES = "virtual/crypt"
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.10.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.12.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.10.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.12.bb
-- 
2.17.1




