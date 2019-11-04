Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 787EA7F939
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 20:55:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 476Q6L3Gyxz8t
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 21:55:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572900906;
	bh=mEU5CeCdFihfuG78OrfXBdtEOrCsZy8CNvRwu5A2JaI=;
	h=From:To:Subject:Date:From;
	b=O/CW0NtAwawAPyEjWzWrzIipyKbCV8ciR/le9eVF9sXRNzb7PE4KFnC7pCZqfqOtB
	rDgmUrTsyvU0STCkWTkaEJjHt14jukaLFrXH7ZMgFaFXNG+tsYohDUxndRgFwpYYHE
	ZaTLC1TtozjEIrtD+R52GhnKQgbkM/E/yL4ZhlKcUzVP94BmCsDJtG/Ze6t/AP9Oxb
	plKhfoArVx6IXNUhOgncQKc9/PImnCOXMm/Mp3KD4NjAiqdJ5hOPE/6CmTP4ZjACUR
	CtRjp8lHqRcUFxx1AeNQvJenqvFEbPp8F9oLNbvI84KBBnZ6KVd2Iu9Cplg6VTP3aJ
	hcpNIKpilhJtGd0DIGkITdNeOfsuF7M+u+4UMXSEuwXhSOUj9D43s+QTpcz+0bOuvu
	nTLlR9bF1ISv9T+fN0EjUnozuH0XC75XVw9ot8gEF7meWIMpe2WqrBoUwYZiT42gK/
	nP6Lrvlhj0VcbMWiu0bln60KVwt9dE3yVL7Sm7/MGIaM9WSeszJrXc/59oZCRKgS8B
	OoglHvynyGOvU35xSl8ZBC8x6YUiexbaDhHSMz7yzWOHF6eIR7NT3x9qNJe4IlVBS7
	NjbbQskFkcozqHbk9pYIcn/ANVp56W0NOHlnkyIiS6/kfgtQOLP35siyDbUZ3y4A9o
	9xKG2oPkla/L9rCfLf2NzV2A=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Nov 2019 22:55:04 +0200
Message-Id: <20191104205504.24428-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] lz4: Whitelist CVE-2014-4715
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
X-List-Received-Date: Mon, 04 Nov 2019 20:55:08 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-support/lz4/lz4_1.9.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/lz4/lz4_1.9.2.bb b/meta/recipes-support/lz4/lz4_1.9.2.bb
index f0a8416a96..ed4452c82e 100644
--- a/meta/recipes-support/lz4/lz4_1.9.2.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.2.bb
@@ -18,6 +18,9 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 S = "${WORKDIR}/git"
 
+# Fixed in r118, which is larger than the current version.
+CVE_CHECK_WHITELIST += "CVE-2014-4715"
+
 EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir}"
 
 do_install() {
-- 
2.17.1


