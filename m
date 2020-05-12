Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.6562.1589292862383198552
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 07:14:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=dI/OI5Cr;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=h6oi=62=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49M0DD4cTtz5R
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 16:14:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589292860;
	bh=7dXEm4J5++YGKTw0oqsWLIRGwPyTnUlL0g7wQ6OSeAY=;
	h=From:To:Subject:Date:From;
	b=dI/OI5CryYq5PmN3CIdpTiqNis0zYPdBODjG1gZuov4Afh+8QNhcAXU12I8DyT4m/
	 woUr+H7FTaPUHsIbh5EpEnTE2On6uaFyUCPeRgZQa4usk7UlHKTZRr+FG8zPW5hkYr
	 NMzDXPq0sCFu3ESpiJ6R5dUQ02m8TrH4hOBogGrvjjkikgCXNAPHa89PjktYS5u3qf
	 INCmmzWvcSIKD3GvAoJp5Q6v33xmtgyZQYJJumh46XHucyCp+eg+uXHrpJ5gMvT8bY
	 DGJLCwer2MKlOlHc83dtl8A9zXdz1cccUv/iLyq8xpXR0o61r4x2uAG1Wbt1bxR5xQ
	 khLDMiL+lqrmuQhrqVuJWCJxyqaGtQ2B/z2sZ1A9acBeo7xlcWmyu8BFOI2IDxAFyj
	 6bBsB+Tea3LI1U+NSV6kYLf5xFcUZyLTLv/xDZDwmnI2rT10XJF1gpW+XBFgn3mb1s
	 8rteZzFaFrp2V6B6GckBUXE9sWMSJezMJeVHSnJpi8sGefZORSpsJazeo+ybY66Bf0
	 bYV0/+O1G9q3nPllCXU19wfXtVWX3fEjg6ntMJffeenFqCDsNIjq/eY2IOWsn5hiCq
	 en2oAw+GOffPTHWXrBR4BtG7LRpT02bQ41JoaSOWC8vqyUsWsGsY1SVsYImZ+FSuVl
	 SqUx2ffeE4tcgrMiaqD39FDk=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] llvm: Remove -fcommon
Date: Tue, 12 May 2020 17:14:16 +0300
Message-Id: <20200512141416.5327-8-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

I cannot reproduce the problem.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index a8607f5008..d24ed761bf 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -92,8 +92,6 @@ EXTRA_OECMAKE_append_class-nativesdk = "\
                   -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
                  "
 
-CFLAGS += "-fcommon"
-
 do_configure_prepend() {
 # Fix paths in llvm-config
 	sed -i "s|sys::path::parent_path(CurrentPath))\.str()|sys::path::parent_path(sys::path::parent_path(CurrentPath))).str()|g" ${S}/tools/llvm-config/llvm-config.cpp
-- 
2.17.1

