Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 127097F888
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 23:41:36 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id w14so6175091qto.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 16:41:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=tu4lqNzyhF8X18xBUF0QhaxhyZ3FbHjJkfOHUi4+0UI=;
	b=YGr7Y4dd97FouF4Zsew8+FZGjqGS/ThOQHCl2b6m8w4ec3inXQgO0oEeFS36CHbe3k
	5gdDZtSgNT6yLfQd+mceGXBdJkPyeyHH5YyoSXGQ6s8MBlJyaiKljTo/7COqCTehNjum
	7ntBbMac66xprvQauqrQoGK11EuU24g1tM11RUZq6HVfWnyFmlLN2gzfDrFhwu8sxLvN
	8igdo84SuGqpv43yfAlz1Awr/FIolRT0qRp396DkB9fDSRq1oQtpMoE7p1i9DDK+J5eX
	l2NjxLTjjdCZDdjhDDoQEF0TJT5NroZKDckw3+82FxQ5Vd4my+Rs4aQy5KBLt+H6OY4a
	wq4g==
X-Gm-Message-State: APjAAAUVlFpwxQhpBILVGtN+TA0n7nzcykY+Itj/puxyfIxmKGEM3zEZ
	HdCvvPy6Ycx6R5Crprszsuywoe9MRMI=
X-Google-Smtp-Source: APXvYqxTxjFAMMicS3Uihhm+LnRRF0Q49sT7Jos/EuiU7OfV5hrInWX9FNgKrBmfKsRTENvjELR7XA==
X-Received: by 2002:ac8:36c7:: with SMTP id b7mr6183313qtc.275.1569022897514; 
	Fri, 20 Sep 2019 16:41:37 -0700 (PDT)
Received: from localhost ([181.220.83.67]) by smtp.gmail.com with ESMTPSA id
	x55sm2133482qtj.69.2019.09.20.16.41.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Sep 2019 16:41:36 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Sep 2019 20:41:32 -0300
Message-Id: <20190920234133.558667-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] mesa: Upgrade 19.1.6 -> 19.1.7
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
X-List-Received-Date: Fri, 20 Sep 2019 23:41:37 -0000
Content-Transfer-Encoding: 8bit

This is a stable bugfix release. Detailed release notes available at:
https://www.mesa3d.org/relnotes/19.1.7.html

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../mesa/{mesa-gl_19.1.6.bb => mesa-gl_19.1.7.bb}             | 0
 meta/recipes-graphics/mesa/{mesa_19.1.6.bb => mesa_19.1.7.bb} | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_19.1.6.bb => mesa-gl_19.1.7.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_19.1.6.bb => mesa_19.1.7.bb} (85%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_19.1.6.bb b/meta/recipes-graphics/mesa/mesa-gl_19.1.7.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_19.1.6.bb
rename to meta/recipes-graphics/mesa/mesa-gl_19.1.7.bb
diff --git a/meta/recipes-graphics/mesa/mesa_19.1.6.bb b/meta/recipes-graphics/mesa/mesa_19.1.7.bb
similarity index 85%
rename from meta/recipes-graphics/mesa/mesa_19.1.6.bb
rename to meta/recipes-graphics/mesa/mesa_19.1.7.bb
index 19221e9e25..d0518322ae 100644
--- a/meta/recipes-graphics/mesa/mesa_19.1.6.bb
+++ b/meta/recipes-graphics/mesa/mesa_19.1.7.bb
@@ -6,8 +6,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0003-Allow-enable-DRI-without-DRI-drivers.patch \
            "
 
-SRC_URI[md5sum] = "7dbb40b8d10e89bee0a5bfc85350647b"
-SRC_URI[sha256sum] = "2a369b7b48545c6486e7e44913ad022daca097c8bd937bf30dcf3f17a94d3496"
+SRC_URI[md5sum] = "cd1345c9b0d5121b860a0bdb20abc347"
+SRC_URI[sha256sum] = "e287920fdb38712a9fed448dc90b3ca95048c7face5db52e58361f8b6e0f3cd5"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.23.0


