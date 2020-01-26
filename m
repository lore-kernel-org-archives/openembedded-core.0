Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 03394916B6
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 16:25:14 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id q8so3745193pfh.7
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 08:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Md87sha4pvdfFawgUMUMGV5IzI7qUbT0oVAzenuO7MQ=;
	b=AjzgKGJrJ9EXghkL27ChHshYaYzZ48YuQJ3mwi4PbGTQRpb6z+HcRlBJIAkWvGC2DE
	rm7yBRBqIECDoG5ubCWJNSAZeqkbCJagm6b+3tS8D6zNtYqbIM6/7SROHi/2yXeQEgtF
	mVvQWIgozuYeWkcbsHoyfd56RTxQddTWdESgL80j1khmnjmXfk2Ukl1ZiRRUXUNS3cTi
	F0XxXIJBq2Em8w/uD3NMmeIwH4MrCQrUsumEVg2sdu71KtA+d5yNYX3icpxljbPQClyT
	Tet4oFd26L1xhpZlbyM7xu+7hEJPRaCq6VdhLt0qsbWmgW0tcp0/vquZpbGaM4ufA8Fm
	2lgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Md87sha4pvdfFawgUMUMGV5IzI7qUbT0oVAzenuO7MQ=;
	b=JL6TCk8++i74rcuxatyjrnxj685cHyASlSjEvK5LarEgcwePKudAP+AuTd6M3hnCUn
	9NlaXo3ztVyzMp5DZKW843W3AIA2zC7rDf6uWtU1OZvwTtRY1oEJGx7hMcSEEJ63z5nr
	a2nt0OygLuZehmLMWO8pzzkOc1qTxKWl77ZwMGYBSYDT8UG37GNXFgBWO1rFrz0sqkay
	1WrHa2nJUvqxnKYeMgdYmyj7b7dmgS3cwLHTG7eleaPOz9D2Tdnx6ZnKUPsTQY8XGCxF
	hQkNFZllcw/V4ZQY/JgvBCOa6V6S/viJv8tgcNXun7VR2Dkwqr3KOzLrreXJk50/R6np
	nRUA==
X-Gm-Message-State: APjAAAXkDz4nhpfH3Tw0qQ7FbW1+R3bJ7Pme9pn8P80m4PZtXmxpGbA8
	MdmF0xRrZL1+cCG9cfLIbs+v0zUa
X-Google-Smtp-Source: APXvYqwOFTOjToaUcxJ2W3fDrCIQmNtIgFaVjmfBvCz0W07lEBPsxJBEFUlJ6DNd+p3LXMs4J00rBA==
X-Received: by 2002:aa7:9296:: with SMTP id j22mr11931147pfa.201.1580055915987;
	Sun, 26 Jan 2020 08:25:15 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:bddb:633c:e712:cec2])
	by smtp.gmail.com with ESMTPSA id
	f43sm13046556pje.23.2020.01.26.08.25.15
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 08:25:15 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 26 Jan 2020 08:24:49 -0800
Message-Id: <d9f1bfe681f51f4cb2ad9515454162480993aadf.1580055797.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580055797.git.akuster808@gmail.com>
References: <cover.1580055797.git.akuster808@gmail.com>
Subject: [warrior 24/29] openssl: Upgrade 1.1.1c -> 1.1.1d
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
X-List-Received-Date: Sun, 26 Jan 2020 16:25:15 -0000

From: Adrian Bunk <bunk@stusta.de>

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../openssl/{openssl_1.1.1c.bb => openssl_1.1.1d.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1c.bb => openssl_1.1.1d.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
index 94f4d49724..b00624650a 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
@@ -22,8 +22,8 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[md5sum] = "15e21da6efe8aa0e0768ffd8cd37a5f6"
-SRC_URI[sha256sum] = "f6fb3079ad15076154eda9413fed42877d668e7069d9b87396d0804fdb3f4c90"
+SRC_URI[md5sum] = "3be209000dbc7e1b95bcdf47980a3baa"
+SRC_URI[sha256sum] = "1e3a91bc1f9dfce01af26026f856e064eab4c8ee0a8f457b5ae30b40b8b711f2"
 
 inherit lib_package multilib_header ptest
 
-- 
2.17.1


