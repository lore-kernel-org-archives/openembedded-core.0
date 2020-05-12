Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.6637.1589292860104243713
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 07:14:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=RhfyKyJG;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=h6oi=62=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49M0DB2D2fzCY
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 16:14:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589292858;
	bh=5xYHGHvTkCTjbdsY6QKQdV6wPENFsc9LB/Ltd1rbRpc=;
	h=From:To:Subject:Date:From;
	b=RhfyKyJGWXQAsNz/+z9hVO0NLN66xQ4r78iZC7SiL2gkxlC+nnufPsMpFnt/J6PDx
	 FCNQZUWYQTvceNSv/yIP43brMGyitwgceuXslXqkol8tl7XTZ3iS/w3YAZ/qhUPRut
	 Wqe5h6YaB1IRAENNRFT3nqUD0HiMqm9mfJXeD6O74BpNUby1sgur8Fi25ATcyj3tpR
	 8Su0bXrpnVi2PIJg9/Xp882fRTtAF0lhsIk80vEHJdu1+JhdsllN37LpHYyQVxBSa2
	 g7EtKNHB5UmTaDiFwH5jWA673n39uOnP/ppVqOP6c2Yi0wuSPbCGwlacGq9pswen31
	 627oRNodlS4Y01XTenWLdUemInadSaflE3n2t0pesMeV9WS67pMpomCkjoVJ11WSjs
	 NaLcyup/W5qzn4lvvt83DcYApRz5KXt2EzIiiyazmeHxDosJdlTsVPgiE5tTi98mUt
	 wX+8w1/tIdFJi5EF235S/FdxGtp9vQm9W22yxDXTBSpnEw51IpqTdGSo2MaJNTSBy6
	 RHQF85ydu7zfpFV7jbJOqR4+ch3lnzJmzA4Bo9tCQCC5niBKguM7Aosi5iczmlwXr+
	 e1MNb3em5rgTJg1FDZiYxs8dhWffj/w7gxboAd5EQGOwAZIHBizRHtXY4MleRusPq5
	 O3qCF8gnccDsNOm5oQC9AgdM=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] xorg-xserver: Remove -fcommon
Date: Tue, 12 May 2020 17:14:11 +0300
Message-Id: <20200512141416.5327-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

This was fixed in upstream version 1.20.8.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
index 3f7fbe85b8..26815feb33 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
@@ -9,8 +9,6 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
 SRC_URI[md5sum] = "a770aec600116444a953ff632f51f839"
 SRC_URI[sha256sum] = "d17b646bee4ba0fb7850c1cc55b18e3e8513ed5c02bdf38da7e107f84e2d0146"
 
-CFLAGS += "-fcommon"
-
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
 
-- 
2.17.1

