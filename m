Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 49AEA7FA0C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 17:04:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47znV10HC1z6w
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 18:04:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1579280665;
	bh=9nLhVit0yaFflkI03X+/OVeJTXH89gQquNMMWJnv50Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KNhu90cMnCx11/CAxdOZyYsI9L9rIDi8hO2Z2hyr2LW/tEb1GeE8k1/n8/Ek7OKgM
	zpfnAdT5cuYmFhVY9W81AWHlfuGw6fCnSQY0w8P6rIGKc9xrGwBMGG0Tm42GlNh88+
	lyMst3qwQ8tQoqu+90xqUqt49NJmmdzcwgFTU8YtviCBAPROCZBRrevHfrmxT922dE
	ebZ0z2hAH9Usp2jwymtF+6AmTDOIzmsio2uCF2UxURJ8l2ZZHw4fFgOgvGa6tixwZ8
	g9xfYw+d28gOsUTjn7n9A+4U/GO4w/T23RLVYEshjTFciw60h8fEaspi7lXMYfep71
	DY7Be8ZfOZSxp2EB8shb9bSnwD4IUqDkx3COpe7KtZp0r16vLRGRpc3MSB3d+4SnB+
	pg2fE1P5OWTLs462qe2y0fnJh0wDs3BwZE9Yr/3XmJO1ufb7WEja8pUVGnXR9Sz1Ro
	XM1F2RilqoEjcebSMCPonNRTUmsp5MBugvsRO1hc2p0fsH/5IioSert04c/dc05C+B
	IdDJ5b88YH8aUZe94mpyEpXRWSbAcB+gFPlMyA0DifvqD2GsI7sckHhX1dvPqofIhD
	eQnS7mzUUT3eGLsTdE+lnBN6cMC34LnnqxzhMD4J9nMENtMvO+yhXHDwdX0ZK0NtgM
	d6u3vq/TRr8g1IyL6ZGWVSZs=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 19:04:22 +0200
Message-Id: <20200117170423.2990-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200117170423.2990-1-bunk@stusta.de>
References: <20200117170423.2990-1-bunk@stusta.de>
Subject: [warrior][PATCH] python3: Upgrade 3.7.5 -> 3.7.6
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
X-List-Received-Date: Fri, 17 Jan 2020 17:04:24 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3_3.7.5.bb => python3_3.7.6.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.7.5.bb => python3_3.7.6.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3_3.7.5.bb b/meta/recipes-devtools/python/python3_3.7.6.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.7.5.bb
rename to meta/recipes-devtools/python/python3_3.7.6.bb
index c90054d45a..7a569f9ca7 100644
--- a/meta/recipes-devtools/python/python3_3.7.5.bb
+++ b/meta/recipes-devtools/python/python3_3.7.6.bb
@@ -38,8 +38,8 @@ SRC_URI_append_class-nativesdk = " \
            file://0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch \
            "
 
-SRC_URI[md5sum] = "08ed8030b1183107c48f2092e79a87e2"
-SRC_URI[sha256sum] = "e85a76ea9f3d6c485ec1780fca4e500725a4a7bbc63c78ebc44170de9b619d94"
+SRC_URI[md5sum] = "c08fbee72ad5c2c95b0f4e44bf6fd72c"
+SRC_URI[sha256sum] = "55a2cce72049f0794e9a11a84862e9039af9183603b78bc60d89539f82cf533f"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.17.1


