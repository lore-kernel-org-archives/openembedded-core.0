Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 9A2438FFE8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 18:28:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46YT4P5MB8z6W
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 20:28:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1568831285;
	bh=AFs6VB1ba8ZZ8+ThzAn9WVBmjyLTu79MWM6uEt0Xzzk=;
	h=From:To:Subject:Date:From;
	b=k+VzsLuY1a2IZjdSbMPka32QsC+Vbpv91qGCTZQ2n9c1QjV1C+YLla4KcKgMkaWw/
	3Q5fiT56v11gUy9Mvx4RyH8PfFLrnV8eME7IaBcxpLsuoR6aHkKuwozgVXaFUBu/aE
	IrQxlMhHhAY7DOXuxNLeseIZiSWroPV1l02BnUrHHKxfGxhYT67FTsyVunu5Kctnuy
	l2ADi2uIpaiAFVWEophmcYdt2Bm91tQYMw8SzFNeq5WOQkTIarUzbBgIl79p1/emJY
	f/PVHD8bu9lakrDwr6OY7mK5+cy4AVwrBLICEdb1liZGIMpPPC1sjtrtd5G128PCs8
	2IOSkCvONwR03fZWmKXbSKAYRdmKHbIDCkJXOZy2FUZrbczUlGn6CEm4qPilSeBLCU
	GUtaLiPKn0t4kBC5nAW2pgr0HuRG1WtsooV1DKsuLlMU5mOYux6PO32ThCOkcRDHda
	lNU5fFsB/tgsJp52jk10m7NN4tOjqZTFKMgnZBfJxfZsI/IStOvs4TJmnhlOHJ7LCf
	YxleL2tWHCFlNMdrnzc31mrHx0F0CJXaI04Dni6TkgBIpEqzLEgFl/D2hGGFGkB8i1
	Nweo4yctU1z1+IJLx27qj4ZutUkgOF/aJjZqsimXcTET8ffuM/Kqio11oraQNR4OIi
	xDkClOn2oVNz8QSPN1t5C5JM=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Sep 2019 21:28:03 +0300
Message-Id: <20190918182803.29170-5-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] libmpc: Remove dead UPSTREAM_CHECK_URI
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
X-List-Received-Date: Wed, 18 Sep 2019 18:28:06 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-support/libmpc/libmpc_1.1.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-support/libmpc/libmpc_1.1.0.bb b/meta/recipes-support/libmpc/libmpc_1.1.0.bb
index 1e48c576d4..bbc673ff38 100644
--- a/meta/recipes-support/libmpc/libmpc_1.1.0.bb
+++ b/meta/recipes-support/libmpc/libmpc_1.1.0.bb
@@ -8,8 +8,6 @@ SRC_URI = "${GNU_MIRROR}/mpc/mpc-${PV}.tar.gz"
 SRC_URI[md5sum] = "4125404e41e482ec68282a2e687f6c73"
 SRC_URI[sha256sum] = "6985c538143c1208dcb1ac42cedad6ff52e267b47e5f970183a3e75125b43c2e"
 
-UPSTREAM_CHECK_URI = "http://www.multiprecision.org/mpc/download.html"
-
 S = "${WORKDIR}/mpc-${PV}"
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.17.1


