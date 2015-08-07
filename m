Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 59EEA767D6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 20:18:55 +0000 (UTC)
Received: by igbpg9 with SMTP id pg9so38734589igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Aug 2015 13:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=PXCawum4w8RZvLMzlKbna+D+9XJVMTSX7w4Tcsj6C3c=;
	b=MF0JPLtOZCY0Hmf+5xFEx4RBkMOJ628XfSsIfBqFlkHhmzoFZKY1cLcXD3vhARk9Qx
	cGQeRIP0cXQFAvxV4NH8NLkPZCL5AI9HkJ2XUWrI71nw2NyTjaBzQg84gDCo0WTJ2SFM
	J5YR7p0h+5139ftBIvjCpqp6d+9qVOBbcArM4EEEL/G4QSZmjYYxRRbY2uyC1Blqaq73
	za5rGaq4Aocq2Pfr7KyWDC9ItV/c8BBm/KVgJhV4EZAjNJkeKu7QslkYpbh4Zxrq0IGa
	5NjbHpybqv/MFJcDokQqPZfg3yz1yUACySjHntTplOdPbNGnsvFm3KJZou+/hTo2RZ4a
	X/Lw==
X-Received: by 10.50.62.243 with SMTP id b19mr5717860igs.88.1438978736100;
	Fri, 07 Aug 2015 13:18:56 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79]) by smtp.gmail.com with ESMTPSA id
	m134sm7550995ioe.42.2015.08.07.13.18.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 07 Aug 2015 13:18:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Aug 2015 13:18:46 -0700
Message-Id: <1438978727-2172-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] packagegroup-core-sdk: Disable sanitizers on musl
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
X-List-Received-Date: Fri, 07 Aug 2015 20:19:00 -0000

sanitizers assume linux == glibc :(

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-sdk.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index 5b11861..3badd0e 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -34,6 +34,7 @@ SANITIZERS_mips64 = ""
 SANITIZERS_mips64n32 = ""
 SANITIZERS_powerpc64 = ""
 SANITIZERS_sparc = ""
+SANITIZERS_libc-musl = ""
 
 RRECOMMENDS_packagegroup-core-sdk = "\
     libgomp \
-- 
2.1.4


