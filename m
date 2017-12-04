Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7E70C787EA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 18:53:39 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id d4so23449718qtj.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Dec 2017 10:53:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=svbKReOkBiVRFJuUS7C3hZhw9ImoVUcxjQCScU1XmbY=;
	b=HjP/UKa7hZEq78rEUteD2rZTH0tIRlcmSDIR9un4lFInk2RTpma3J5cDm4AWqVOS69
	diDmCP7MFdCNilOqS2ZCOmysUjRLIunZeDMRFmKvUeM+ch0QbXowkzl63U74qo/7JCU3
	vExEVN97tSAquo4xCSV9RVFz605/Yb3yTDGLyelrNKdvddhalWTHt5RhI4KrUSoL3QiA
	QurthuHyERooNfptmS7J2hjl1r7kpY2TViRwRTnWZ3obb9pugdeyQ9IzrViWtdtDVs6M
	g5KkmA/cBWKlv1MLk0uDEFtwC/yEr2kpNC8i174Nghi0XQqvuaa54cWoNNYANMwe9a7+
	dAkw==
X-Gm-Message-State: AKGB3mIOf+jiC7UV1tgxXhwhUWshKIgFZR0buEr7nOr4DJf+Xny+RyWy
	kv2kFfN0ZS+hY5Klx+iP384SHg==
X-Google-Smtp-Source: AGs4zMY+WWG/cLPXo2DrZxTPb0j+A8ZxXg43roFC0w5c02BI2+jzeO5LLib0jsfUhMkVK94c9CTCwA==
X-Received: by 10.200.23.221 with SMTP id r29mr1410qtk.27.1512413620131;
	Mon, 04 Dec 2017 10:53:40 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	s18sm7510981qtc.25.2017.12.04.10.53.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 04 Dec 2017 10:53:39 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 04 Dec 2017 16:53:31 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  4 Dec 2017 16:53:31 -0200
Message-Id: <20171204185331.24131-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] mesa: Upgrade to 17.2.6 stable release
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
X-List-Received-Date: Mon, 04 Dec 2017 18:53:39 -0000

This upgrades the recipe to 17.2.6 bugfix release.

The changes can be seen at:

https://www.mesa3d.org/relnotes/17.2.6.html

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-graphics/mesa/{mesa-gl_17.2.5.bb => mesa-gl_17.2.6.bb} | 0
 meta/recipes-graphics/mesa/{mesa_17.2.5.bb => mesa_17.2.6.bb}       | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_17.2.5.bb => mesa-gl_17.2.6.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_17.2.5.bb => mesa_17.2.6.bb} (88%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.2.5.bb b/meta/recipes-graphics/mesa/mesa-gl_17.2.6.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_17.2.5.bb
rename to meta/recipes-graphics/mesa/mesa-gl_17.2.6.bb
diff --git a/meta/recipes-graphics/mesa/mesa_17.2.5.bb b/meta/recipes-graphics/mesa/mesa_17.2.6.bb
similarity index 88%
rename from meta/recipes-graphics/mesa/mesa_17.2.5.bb
rename to meta/recipes-graphics/mesa/mesa_17.2.6.bb
index a111df216b..fc3ac75f7e 100644
--- a/meta/recipes-graphics/mesa/mesa_17.2.5.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.2.6.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch \
            "
 
-SRC_URI[md5sum] = "ba649f82a066f710aa23655254a83eb8"
-SRC_URI[sha256sum] = "7f7f914b7b9ea0b15f2d9d01a4375e311b0e90e55683b8e8a67ce8691eb1070f"
+SRC_URI[md5sum] = "862f2b7e2a08554570b192a89f723b6f"
+SRC_URI[sha256sum] = "6ad85224620330be26ab68c8fc78381b12b38b610ade2db8716b38faaa8f30de"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.15.1


