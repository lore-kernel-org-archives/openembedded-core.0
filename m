Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1D25D73211
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 00:31:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0B0VbHp007347
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 10 Jan 2016 16:31:37 -0800
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 10 Jan 2016 16:31:36 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 11 Jan 2016 08:30:35 +0800
Message-ID: <e7acefd026e9db956256f64a9e5ee1379e1d2a3e.1452472146.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452472146.git.hongxu.jia@windriver.com>
References: <cover.1452472146.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/9] libgcrypt: 1.6.3 -> 1.6.4
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
X-List-Received-Date: Mon, 11 Jan 2016 00:31:37 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-support/libgcrypt/libgcrypt_1.6.3.bb | 4 ----
 meta/recipes-support/libgcrypt/libgcrypt_1.6.4.bb | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.6.3.bb
 create mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.6.4.bb

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.6.3.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.6.3.bb
deleted file mode 100644
index cd06ce7..0000000
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.6.3.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require libgcrypt.inc
-
-SRC_URI[md5sum] = "de03b867d02fdf115a1bac8bb8b5c3a3"
-SRC_URI[sha256sum] = "69e94e1a7084d94e1a6ca26d436068cb74862d10a7353cfae579a2d88674ff09"
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.6.4.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.6.4.bb
new file mode 100644
index 0000000..1ed4291
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.6.4.bb
@@ -0,0 +1,4 @@
+require libgcrypt.inc
+
+SRC_URI[md5sum] = "7dc7d51cdbf56ad75e95c4166f90e985"
+SRC_URI[sha256sum] = "5c2076212961712e4774abf32c85cb58537d544d6016a2464fb32783653d1b6d"
-- 
1.9.1


