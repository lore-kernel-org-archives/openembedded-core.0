Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 96E5C7866D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 13:02:25 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id r39so3067817qtr.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 05:02:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=gXaKmXtebbyVEbDxlV2umj/w5pAZB02fQwF5QWoh9o0=;
	b=ag5m8d5moVNusI8RDYaa+cnwSHh4Q5Ny/mWiQho5MEdiG7xRO8cvpy1GyQHvjV3vST
	xcqoZmobcxWeLN5MviR4V6L8I5bzS3PwcCmhRrzaxs5kvSO+LPdCF281e161SRThrWv/
	VXD+duYvP0YFBr1a4ECgDVKF7g4nrBt6QXxQljaXkr6nFneKTl0rXRER/ojoBgBCTt6b
	GWUjSu0n1xr1zgbnF4qE3W8Dx0n/Uq7fBdNVjliQbAkbc4BcQiZFpwUtWcB5zQjd81fs
	q0LNGjhPAFR8cWMLqwLnK7j5EyNb+isnvT2bT2fk4SMxKnRwLovtnB28RA1lbO98Ke4B
	MFvg==
X-Gm-Message-State: AJaThX4JTp5T88Ibq5AI9xQvIt7j4UcLD80PT+IR4O3I2+oQ9+oIptwb
	55obMRxyqlimNkg8qn22xMPBzg==
X-Google-Smtp-Source: AGs4zMbxkFCa77Q+9Dc2DmzRb/MzKOCNu+3af7Shmk/EKGwBHQ+ZrEY7UcNMZeJdrGIkc/P2Iauofw==
X-Received: by 10.200.54.236 with SMTP id b41mr9097612qtc.280.1510578146392;
	Mon, 13 Nov 2017 05:02:26 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	u26sm1738964qtb.55.2017.11.13.05.02.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 13 Nov 2017 05:02:25 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 13 Nov 2017 11:02:17 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Nov 2017 11:02:16 -0200
Message-Id: <20171113130216.19907-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] mesa: Upgrade to 17.2.5
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
X-List-Received-Date: Mon, 13 Nov 2017 13:02:25 -0000

This upgrades the recipe to 17.2.5 bugfix release.

The changes can be seen at:

https://www.mesa3d.org/relnotes/17.2.5.html

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-graphics/mesa/{mesa-gl_17.2.4.bb => mesa-gl_17.2.5.bb} | 0
 meta/recipes-graphics/mesa/{mesa_17.2.4.bb => mesa_17.2.5.bb}       | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_17.2.4.bb => mesa-gl_17.2.5.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_17.2.4.bb => mesa_17.2.5.bb} (88%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.2.4.bb b/meta/recipes-graphics/mesa/mesa-gl_17.2.5.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_17.2.4.bb
rename to meta/recipes-graphics/mesa/mesa-gl_17.2.5.bb
diff --git a/meta/recipes-graphics/mesa/mesa_17.2.4.bb b/meta/recipes-graphics/mesa/mesa_17.2.5.bb
similarity index 88%
rename from meta/recipes-graphics/mesa/mesa_17.2.4.bb
rename to meta/recipes-graphics/mesa/mesa_17.2.5.bb
index 928cb920af..a111df216b 100644
--- a/meta/recipes-graphics/mesa/mesa_17.2.4.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.2.5.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch \
            "
 
-SRC_URI[md5sum] = "cf0b7a297eedd0549cda5ba071d7561f"
-SRC_URI[sha256sum] = "5ba408fecd6e1132e5490eec1a2f04466214e4c65c8b89b331be844768c2e550"
+SRC_URI[md5sum] = "ba649f82a066f710aa23655254a83eb8"
+SRC_URI[sha256sum] = "7f7f914b7b9ea0b15f2d9d01a4375e311b0e90e55683b8e8a67ce8691eb1070f"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.15.0


