Received: from mail-gg0-f169.google.com ([209.85.161.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U6pN0-0002KG-Te
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Feb 2013 22:32:31 +0100
Received: by mail-gg0-f169.google.com with SMTP id j5so687913ggn.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2013 13:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=AqdEZ0P6XazJEXSgUNJcvK2PcA1gU94GCuQaCCMjqlc=;
	b=QHlVtOQBIVQVyz9SzVXepavzbWThUXA81cen8UyAmV8CyxaGgVKJ6mDsfN5Jx4ODpm
	ufY5KLaj/zJSw2gDoPi8JCrr9856OPlr6hC+2zx+8Sbw/ZojRwBBdrEO/azBTZ5txngo
	FfAXLGOfmm8sT26QI4Z7LWJ/vYUT37DAGimtlrivAKTLi8Kkmw00fEfRmumTjhuirVea
	vMZJOovKgYshkZ6xSWhV395sEaO0olDwpLnsAFshBTSg+pqLgSzmCfubJjX1gpvdvW1P
	aMJzqO3RyMnaTqziB9Hv1lIzdlup41zSaYnbAqCddY00pCU0F94+BqIn1/OQD1HHdIxW
	oRzQ==
X-Received: by 10.236.173.106 with SMTP id u70mr10668595yhl.109.1361049384240; 
	Sat, 16 Feb 2013 13:16:24 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id x16sm100839942yhj.6.2013.02.16.13.16.22
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 16 Feb 2013 13:16:23 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sat, 16 Feb 2013 19:20:43 -0200
Message-Id: <1361049644-27904-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1361049644-27904-1-git-send-email-otavio@ossystems.com.br>
References: <1361049644-27904-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 3/4] libsdl: Use 'virtual/libx11' instead of hardcoding nativesdk-libx11
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Feb 2013 21:32:39 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index e25c597..3dbe97a 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -16,7 +16,7 @@ DEPENDS = "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
            ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} \
            ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender', '', d)} \
            tslib"
-DEPENDS_class-nativesdk = "${@base_contains('DISTRO_FEATURES', 'x11', 'nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
+DEPENDS_class-nativesdk = "${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
 
 PR = "r1"
 
-- 
1.8.1



