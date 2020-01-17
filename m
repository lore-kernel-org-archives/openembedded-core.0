Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id DAA367F9C4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 16:58:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47znM16xRTz6m
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 17:58:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1579280302;
	bh=4Q7J2pA710sLmgHOXJqbbBATqf3odFlqyCncIw9FvnA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lYZ3Hq8FszXD/zDIOpCig4hD23yGFHjMXIXMTNYBrdM/DW55cxGPMqmjwvY7lB8/v
	0iiA2zK3XpFOcElyBao39p8HztGB/JGETLpJz7nR1fnA15VDnmlVsXaVKtKmGf2GQ8
	CcpDwlxc6TAP/OH60izchmHRHEMyFbLL86WJ2qm21gDYXh1q79F5gku6+EA+E0bthy
	3LzZOm5T6ftRzvlUQLx0n1eo+PwpqqXJGlHWnDwkYOyWPDsrnQDaZ3KwpBPfn1O4Db
	iK9MgmyqsSks3HlZj9J41Zwy2+JFdw7lrlR2tbcAlndIEKwfce+ISYtyNQt7BmlYji
	FxKFO9gYNE2kvYFXyKU8gXF1bHkmvUYJzg9LP4rA2sgA6cMJS4TRvTqv5oFKZ6elUN
	BbhHJjzuls++29rXmPw1JE8Zbvy8GkqGdJpgZmwnExTKpgsnTWUbDWGVmswUejZYpS
	yfBmbCXf9NIXbM9VZoOxncFlWW8iKyBeOz0hcuBOnXnG7H+8L3bGRQDNl1uURragUr
	tTZAGF+TwqFmhU4zODsxE2X876vZpyzUf+hMd4a9oXKBHu9y+4XJqhwxTfaUMgHF3Q
	Th2eHU2nt+j9RUdxiGat0MLqx+dOXzE1Sqy/gtS1NeWUwUWNX3iYdESnykAif/r0gp
	Hdsm4ng6C7vZCQ9NLcFGT7sg=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 18:58:16 +0200
Message-Id: <20200117165819.2542-4-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200117165819.2542-1-bunk@stusta.de>
References: <20200117165819.2542-1-bunk@stusta.de>
Subject: [warrior][PATCH] openssl: Upgrade 1.1.1c -> 1.1.1d
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
X-List-Received-Date: Fri, 17 Jan 2020 16:58:22 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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


