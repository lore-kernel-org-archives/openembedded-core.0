Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id E5FD4752F2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 19:14:59 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id s9-v6so16188978qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 12:15:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=wmc/CnOVmLwcCuFY8O6Wuq+Ith7ALdsF2ypuUzm80Xk=;
	b=ZhPuaHOkWh3XekkF15Y2Ou35kA/pCJZfVInXJhhDAU5pt8RIgq+SfaH+IYYs8I7j4L
	Uz+xIapg5H7+TJ896yW0ohycek0n4oHxBZqbVE5nKLjZlKw3s7o0tPz1NqfL6oNp77jf
	5lenxNrKAcXFo3gTXYFzFa0IH/gMPt0N9vFV7Sr98pMPxXPUlnrAEDUXJnf/J3LhJxJ0
	N7qf1EnJHExKJY7C0oz5iFokINEujr8lwsi+BU8zuxcorDZHgF/cyf/sk2P4x23Z/V2K
	WQc6nJkaG/pIe3TvBAZpMLWFtjwMoTBHGVvuB6jSZwyud/Gf9OjQ6fXM+P3coUVw1gdT
	+a0A==
X-Gm-Message-State: APt69E0okhcpXeolG0LslCWPeYssq9UL1HPa4TibLQIDttr4+qXSTyMn
	VZJECi1k4VINgd8hnYIVvbHeqA==
X-Google-Smtp-Source: ADUXVKLvqqwkSwhFPu/ARzdTWxPUbDAB9LbnF100zM9f56nb/GmiDXueJYTEpqTxJYLNi/JMZ05qHQ==
X-Received: by 2002:ac8:3661:: with SMTP id
	n30-v6mr12615199qtb.1.1529349300622; 
	Mon, 18 Jun 2018 12:15:00 -0700 (PDT)
Received: from localhost.localdomain ([187.23.153.102])
	by smtp.gmail.com with ESMTPSA id
	a24-v6sm10085250qth.70.2018.06.18.12.14.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Jun 2018 12:14:59 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 18 Jun 2018 16:14:55 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jun 2018 16:14:47 -0300
Message-Id: <20180618191447.12465-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180618191447.12465-1-otavio@ossystems.com.br>
References: <20180618191447.12465-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] mesa: Update 18.1.1 -> 18.1.2
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
X-List-Received-Date: Mon, 18 Jun 2018 19:15:00 -0000

This includes bug fixes for 18.1.x series. For list of changes check:

https://www.mesa3d.org/relnotes/18.1.2.html

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../mesa/{mesa-gl_18.1.1.bb => mesa-gl_18.1.2.bb}             | 0
 meta/recipes-graphics/mesa/{mesa_18.1.1.bb => mesa_18.1.2.bb} | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_18.1.1.bb => mesa-gl_18.1.2.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_18.1.1.bb => mesa_18.1.2.bb} (87%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_18.1.1.bb b/meta/recipes-graphics/mesa/mesa-gl_18.1.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_18.1.1.bb
rename to meta/recipes-graphics/mesa/mesa-gl_18.1.2.bb
diff --git a/meta/recipes-graphics/mesa/mesa_18.1.1.bb b/meta/recipes-graphics/mesa/mesa_18.1.2.bb
similarity index 87%
rename from meta/recipes-graphics/mesa/mesa_18.1.1.bb
rename to meta/recipes-graphics/mesa/mesa_18.1.2.bb
index aab4a19315..2c06b1eb7b 100644
--- a/meta/recipes-graphics/mesa/mesa_18.1.1.bb
+++ b/meta/recipes-graphics/mesa/mesa_18.1.2.bb
@@ -10,8 +10,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0007-dri-i965-Add-missing-time.h-include.patch \
 "
 
-SRC_URI[md5sum] = "063468c930ff61d211ece0191874fa95"
-SRC_URI[sha256sum] = "d3312a2ede5aac14a47476b208b8e3a401367838330197c4588ab8ad420d7781"
+SRC_URI[md5sum] = "a2d4f031eb6bd6111d44d84004476918"
+SRC_URI[sha256sum] = "070bf0648ba5b242d7303ceed32aed80842f4c0ba16e5acc1a650a46eadfb1f9"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.17.1


