Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 20A3C73D1F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 11:24:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t37BOXrb025058
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Apr 2015 04:24:33 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 7 Apr 2015 04:24:32 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Apr 2015 04:24:25 -0700
Message-ID: <10dc41e719581547eb4ff34ab8b2df94bf657dc8.1428405830.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1428405830.git.liezhi.yang@windriver.com>
References: <cover.1428405830.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 04/10] libgcrypt: 1.6.2 -> 1.6.3
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
X-List-Received-Date: Tue, 07 Apr 2015 11:24:32 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/libgcrypt/libgcrypt_1.6.2.bb |    4 ----
 meta/recipes-support/libgcrypt/libgcrypt_1.6.3.bb |    4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.6.2.bb
 create mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.6.3.bb

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.6.2.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.6.2.bb
deleted file mode 100644
index c49c0e7..0000000
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.6.2.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require libgcrypt.inc
-
-SRC_URI[md5sum] = "d19adc062edff0ebc7e887212733ef1f"
-SRC_URI[sha256sum] = "936921644b9c81e2395e18a554a9a5f9252aae3976f8afc3e4229ee9d785e627"
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.6.3.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.6.3.bb
new file mode 100644
index 0000000..cd06ce7
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.6.3.bb
@@ -0,0 +1,4 @@
+require libgcrypt.inc
+
+SRC_URI[md5sum] = "de03b867d02fdf115a1bac8bb8b5c3a3"
+SRC_URI[sha256sum] = "69e94e1a7084d94e1a6ca26d436068cb74862d10a7353cfae579a2d88674ff09"
-- 
1.7.9.5


