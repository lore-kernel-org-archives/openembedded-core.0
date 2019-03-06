Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7399D7CDBE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 19:23:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44F3Zn0HR0z5Q
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 20:23:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1551900209;
	bh=3ivloo8YUlrpRLbYHrGL8KC0Ij+yl9qY/NJFimfwgic=;
	h=From:To:Subject:Date:From;
	b=pAYCvuuuEB4jjXqcuXg4JYHRt47BdW0/7KBbye/0rVdY+N4KBQncpQ4almzaGC4YJ
	VqtWGG+C+vzJvlkUY8Sb8r0w6H3hp9k3+dIbnXX6JYEWodvSDLPHQRQ6q5dO3FFmdZ
	ogDuBRLvH3FTwlkKB7oGxGkjs1i3CFFGWr+RNv0aQ7kEB6PeoCQ73rKc8zxcJKsW2P
	N/d22kCfsfJbn3vvbFUCCcWgJrX18Q/kpoFBHU8XcqzkwI7sDNYRluJqZxmoeQzLXP
	j3UwSJnuF2tEEidTKQL0ky45aQlOoDDZYSlgsiZcLje8jLJk2d2Bn+UsqW3nul1NkC
	WY07dfrRnbsfYktak5hTFTtYaThdO4PPmI4WSL3Aew/AfnOVip+TFR1RPCfrcJAgOU
	mMUvJBBzc4fi6rE/NyY3q63qJUNhRG4hkHKUbhkApYNkZ3TqC/m5RLRQOhS8Bd1BPZ
	8hwEBlpmJPMryCPW0nZZ23xgo31yGY1GK3QH/mjw6IyfENGJgCGETl53wj7vQJQ4ph
	SHPnhYNjW0uPXQHojKeY+yXfoeKtbKEI7vyApXG8gxDT9s4apPP0TiWVQ2HOjcSFTX
	J4QXVERWk0jbFtuR2GRJScKiGt7I8XXrxRwjkcqrsM31EEgfanBQcCoP2xluzOCSFR
	l4k+8rVIuoBpOlQh0VFw0sQ0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Mar 2019 21:23:28 +0200
Message-Id: <20190306192328.7300-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] gdb: Upgrade 8.2 -> 8.2.1
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
X-List-Received-Date: Wed, 06 Mar 2019 19:23:28 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/gdb/{gdb-8.2.inc => gdb-8.2.1.inc}      | 4 ++--
 ...{gdb-cross-canadian_8.2.bb => gdb-cross-canadian_8.2.1.bb} | 0
 .../gdb/{gdb-cross_8.2.bb => gdb-cross_8.2.1.bb}              | 0
 meta/recipes-devtools/gdb/{gdb_8.2.bb => gdb_8.2.1.bb}        | 0
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-8.2.inc => gdb-8.2.1.inc} (89%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_8.2.bb => gdb-cross-canadian_8.2.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_8.2.bb => gdb-cross_8.2.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb_8.2.bb => gdb_8.2.1.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-8.2.inc b/meta/recipes-devtools/gdb/gdb-8.2.1.inc
similarity index 89%
rename from meta/recipes-devtools/gdb/gdb-8.2.inc
rename to meta/recipes-devtools/gdb/gdb-8.2.1.inc
index f6d75ed081..1fc1ec0da4 100644
--- a/meta/recipes-devtools/gdb/gdb-8.2.inc
+++ b/meta/recipes-devtools/gdb/gdb-8.2.1.inc
@@ -18,6 +18,6 @@ SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
            file://gdbserver-ctrl-c-handling.patch \
            file://0001-Fix-build-with-latest-GCC-9.0-tree.patch \
 "
-SRC_URI[md5sum] = "b5a49dbff00d9a87fbe114d14b3101c0"
-SRC_URI[sha256sum] = "c3a441a29c7c89720b734e5a9c6289c0a06be7e0c76ef538f7bbcef389347c39"
+SRC_URI[md5sum] = "f8b2562e830a4098dd5b5ea9e9296c70"
+SRC_URI[sha256sum] = "0a6a432907a03c5c8eaad3c3cffd50c00a40c3a5e3c4039440624bae703f2202"
 
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_8.2.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_8.2.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_8.2.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_8.2.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_8.2.bb b/meta/recipes-devtools/gdb/gdb-cross_8.2.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_8.2.bb
rename to meta/recipes-devtools/gdb/gdb-cross_8.2.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb_8.2.bb b/meta/recipes-devtools/gdb/gdb_8.2.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_8.2.bb
rename to meta/recipes-devtools/gdb/gdb_8.2.1.bb
-- 
2.17.1


