Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 92F8F71993
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2017 06:45:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v196jt4O028888
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 8 Feb 2017 22:45:55 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 8 Feb 2017 22:45:54 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Thu, 9 Feb 2017 01:45:36 -0500
Message-ID: <691255561ffcd19751b1960de519901d5e962622.1486622006.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1486622006.git.hongxu.jia@windriver.com>
References: <cover.1486622006.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 03/13] libgcrypt: 1.7.3 -> 1.7.6
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
X-List-Received-Date: Thu, 09 Feb 2017 06:45:58 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-support/libgcrypt/libgcrypt_1.7.3.bb | 4 ----
 meta/recipes-support/libgcrypt/libgcrypt_1.7.6.bb | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.7.3.bb
 create mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.7.6.bb

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.7.3.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.7.3.bb
deleted file mode 100644
index ddd7c53..0000000
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.7.3.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require libgcrypt.inc
-
-SRC_URI[md5sum] = "bb5b00cb70b1215833857fd690080fbb"
-SRC_URI[sha256sum] = "c98470cf6a781f2af4bdfda710ad39f0f54b5044e8c43b878d4005737d6c213f"
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.7.6.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.7.6.bb
new file mode 100644
index 0000000..da0a1fe
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.7.6.bb
@@ -0,0 +1,4 @@
+require libgcrypt.inc
+
+SRC_URI[md5sum] = "eac6d11999650e8a1493674c1bdbc7f8"
+SRC_URI[sha256sum] = "fc0aec7714d75d812b665bd510d66031b1b2ce8fa855cc2c02238c954ea36982"
-- 
2.8.1


