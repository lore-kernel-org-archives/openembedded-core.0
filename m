Return-Path: <armccurdy@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 96D3B73D8C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 03:31:11 +0000 (UTC)
Received: by pdbki1 with SMTP id ki1so21138458pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jun 2015 20:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=OJVBDs4+2HYp8W5bUmdakqaFJ4cLtaxBrOxQH6y2i/k=;
	b=LEfxHwql+Elq3f1RZNtUPGtv0vHBLgK62pbH2FO8YY7EVpwqog8FS1dOLDhp0BPohg
	dhwgJ7bltgCxQSSIwunNuhjzm0lgn9m8IvTQOC7REB2Gm2MMyCjZsXIsuVwyhcfgJa+Q
	7qnYS/5bUIs2jC7WE2hcf1XYCbVltqw03Mdn+IbRmku60UlPLGAhC2lfLHnEK1kxSXR0
	hRTQdCoqT15V3VAIj3foRjq3Sf0gfW4BrIHkGoSb3rxu2YBBA7yOr/Tvhn9u/SRDvd9t
	v7KLkUWOoF/Lrsiv9ygWFGb1B9uYarUs5CEccJ6j9kQxuBi16jDn8HOmtk4r+5a/Fvvg
	KoTg==
X-Received: by 10.68.167.66 with SMTP id zm2mr27721096pbb.164.1433388673283;
	Wed, 03 Jun 2015 20:31:13 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id ms7sm2144901pdb.11.2015.06.03.20.31.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Jun 2015 20:31:12 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jun 2015 20:31:03 -0700
Message-Id: <1433388666-8923-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/4] python-numpy: duplicate i586 over-ride for i686
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
X-List-Received-Date: Thu, 04 Jun 2015 03:31:12 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/python/python-numpy_1.7.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/python/python-numpy_1.7.0.bb b/meta/recipes-devtools/python/python-numpy_1.7.0.bb
index d4fd279..28ad97f 100644
--- a/meta/recipes-devtools/python/python-numpy_1.7.0.bb
+++ b/meta/recipes-devtools/python/python-numpy_1.7.0.bb
@@ -30,6 +30,10 @@ CONFIGFILESURI_i586 = " \
     file://config.h \
     file://numpyconfig.h \
 "
+CONFIGFILESURI_i686 = " \
+    file://config.h \
+    file://numpyconfig.h \
+"
 CONFIGFILESURI_x86-64 = " \
     file://config.h \
     file://_numpyconfig.h \
-- 
1.9.1


