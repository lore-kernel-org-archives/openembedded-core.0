Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C75F07F383
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 10:34:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45z8tJ5cc6z3n
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 12:34:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1564569256;
	bh=HmdwA0RJmm70+V/GKd1RAqjRTwpz9PwJjk8Wy6WvEkI=;
	h=From:To:Subject:Date:From;
	b=CPrRC+JEFzaT8aLdY4Nu9S7SqsXblKl+LhQ+VdMdfcmrJhdc1fYJ99ZgbvISXqhqw
	jKWF3pR4hc6ZbagkCVViz+u7ysjDx30v+Lht0w3YeO/EzI+zcqcbX0Eq4QS6+nhBIT
	ysfZ/nHcrOQ2M1wbDVxuYC/VLIv0QAodp09vW5Z8zhzWOOBjMKni9ZYpt892QsBQcw
	t16O8Al4FFszXmbiusD7Rev0oy8ZnzmV/bYibzqhFXPZQSf80BBYwBeU/v6eEG2gsE
	ZkZdWcffpkb9B3hrzOwGfqit2YahPmEwOPm1j2JaDi2TlmKTLK33DcmuWk/ByVVmAb
	18TUNP4g07B9FNwpTR6jbR3xFMZcYk327iMYVg2jIhaYxhzYJ6F2qmYPEfiTq/O1U7
	cdjgIOVeN45ZPizT8+euHSq7MA1+Hc8uqCleUnfu1RjrTXtwyrSCpncMW4zrnjwZIJ
	UrHbsjC7RBZZl3s9q4O8djYL7RzMxuSiTh1k9oEtNsXovEUqMuFkUFO1ZkUzU7xdHl
	Mt/meOUhi011mu59XiW0WGE9MnlNIEWVCUeq8YMQx8VBgL1Q+12CzByQ2NNV6PUHEK
	I9MG+BaVgYaCYumnsNCEWuL+bkFXzEwh19i/ZumNlzWoncVNjO9mZFSIJq6Imsw33x
	EoBiFdddKkoY93lg0sDusMAc=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2019 13:34:16 +0300
Message-Id: <20190731103416.7812-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v2] mtd-utils: Upgrade to 2.1.1
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
X-List-Received-Date: Wed, 31 Jul 2019 10:34:17 -0000

Add zstd PACKAGECONFIG to disable the zstd support that upstream
enables by default, zstd is not in oe-core.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/mtd/mtd-utils_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 49a650a9ef..810fe40f4e 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -10,9 +10,9 @@ inherit autotools pkgconfig update-alternatives
 DEPENDS = "zlib e2fsprogs util-linux"
 RDEPENDS_mtd-utils-tests += "bash"
 
-PV = "2.1.0+${SRCPV}"
+PV = "2.1.1"
 
-SRCREV = "b5027be5f470830ac9543db3c52e076b13abd313"
+SRCREV = "4443221ce9b88440cd9f5bb78e6fe95621d36c8a"
 SRC_URI = "git://git.infradead.org/mtd-utils.git \
            file://add-exclusion-to-mkfs-jffs2-git-2.patch \
 "
@@ -30,6 +30,7 @@ PACKAGECONFIG[xattr] = "--with-xattr,--without-xattr,acl"
 PACKAGECONFIG[crypto] = "--with-crypto,--without-crypto,openssl"
 PACKAGECONFIG[jffs] = "--with-jffs,--without-jffs"
 PACKAGECONFIG[ubifs] = "--with-ubifs,--without-ubifs"
+PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
 
 CPPFLAGS_append_riscv64  = " -pthread -D_REENTRANT"
 
-- 
2.17.1


