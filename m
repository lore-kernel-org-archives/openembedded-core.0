Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F1DA976312
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 00:39:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7N0dPgq009392
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 17:39:25 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 22 Aug 2016 17:39:25 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Aug 2016 17:39:22 -0700
Message-ID: <c33a911ba7fa8dec1f51deb65853c0cd6d30aa15.1471912673.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1471912673.git.liezhi.yang@windriver.com>
References: <cover.1471912673.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] nasm: 2.11.08 -> 2.12.02
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
X-List-Received-Date: Tue, 23 Aug 2016 00:39:25 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/nasm/{nasm_2.11.08.bb => nasm_2.12.02.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/nasm/{nasm_2.11.08.bb => nasm_2.12.02.bb} (81%)

diff --git a/meta/recipes-devtools/nasm/nasm_2.11.08.bb b/meta/recipes-devtools/nasm/nasm_2.12.02.bb
similarity index 81%
rename from meta/recipes-devtools/nasm/nasm_2.11.08.bb
rename to meta/recipes-devtools/nasm/nasm_2.12.02.bb
index e0724e6..9c4b60f 100644
--- a/meta/recipes-devtools/nasm/nasm_2.11.08.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.12.02.bb
@@ -4,11 +4,10 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
 COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|freebsd.*)'
 
-
 SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 "
 
-SRC_URI[md5sum] = "7aae5cb8e03fac48029c82a7470ab066"
-SRC_URI[sha256sum] = "9da3a0291a0bdc06305b7ba194f1e2c2b55ae6f11210b4af43729868149d5445"
+SRC_URI[md5sum] = "d15843c3fb7db39af80571ee27ec6fad"
+SRC_URI[sha256sum] = "00b0891c678c065446ca59bcee64719d0096d54d6886e6e472aeee2e170ae324"
 
 inherit autotools-brokensep
 
-- 
2.9.0


