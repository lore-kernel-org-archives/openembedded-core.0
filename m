Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AC0F36AFB5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 14:20:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8NEK8Zl019881
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 07:20:08 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 23 Sep 2014 07:20:07 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Sep 2014 22:19:57 +0800
Message-ID: <b5499b7e326e64e196dd73e7229ad9c483b72ff8.1411473883.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1411473883.git.hongxu.jia@windriver.com>
References: <cover.1411473883.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] busybox: enable CONFIG_BZIP2/CONFIG_XZ/CONFIG_UNXZ by default
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
X-List-Received-Date: Tue, 23 Sep 2014 14:20:07 -0000
Content-Type: text/plain

It was required by info/man command to compress/decompress
doc pages with xz/bz2 compression.

[YOCTO #6750]
[YOCTO #6751]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/busybox/busybox/defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 8394067..676f770 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -134,7 +134,7 @@ CONFIG_AR=y
 # CONFIG_FEATURE_AR_LONG_FILENAMES is not set
 # CONFIG_FEATURE_AR_CREATE is not set
 CONFIG_BUNZIP2=y
-# CONFIG_BZIP2 is not set
+CONFIG_BZIP2=y
 CONFIG_CPIO=y
 # CONFIG_FEATURE_CPIO_O is not set
 # CONFIG_FEATURE_CPIO_P is not set
@@ -165,8 +165,8 @@ CONFIG_FEATURE_TAR_NOPRESERVE_TIME=y
 # CONFIG_UNLZMA is not set
 # CONFIG_FEATURE_LZMA_FAST is not set
 # CONFIG_LZMA is not set
-# CONFIG_UNXZ is not set
-# CONFIG_XZ is not set
+CONFIG_UNXZ=y
+CONFIG_XZ=y
 CONFIG_UNZIP=y
 
 #
-- 
1.9.1


