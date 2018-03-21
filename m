Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id B2FB678757
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 18:49:12 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id w6so6563007qkb.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 11:49:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=rczWoEi9DgyEFatEP9AbjRizzRKOA8H8LSKh+cDSfh8=;
	b=a1EJwONnoIqqP4LhwGl27naiqrZlQIe6KReI51YpWfdZOd3bUfVy8NJuNTGwMWUnwv
	6s2wIF/Arg9xGENnCIhQ0OMpIAhV5CugtF/1AtuVLXM46NyxqwiPj2SO70EB7Sv0e6gu
	OnCwGC1NKIYyAIIUA1si7YCLgx0mpIP0MdGC64Y1Luuk0/PiScujXwmspBTf2jHvJLjk
	NU80CZSDDIosNpmnIPTwENp+v0JvQ8faw+3h7U3/bcd6omaCcKoUTWJzt44eaiSyvM1w
	WmSsW+HGb20BLlc15VKJ9LOCdkFcaNsY1US67FQqeRqke0mMx556TtlUC20r768xAa2p
	jwCQ==
X-Gm-Message-State: AElRT7GBXYOU6lmsd+KaFgn0hlowah+9pYx/TAOuAe6PG0uy0R7GwIFy
	9KAvn785xGW4AFcLKoR2kpRt7g==
X-Google-Smtp-Source: AG47ELtI5Yfo6mRROB6t0UVLPfhmpJ1PErqfy3HcazeCAqAvgGPajHuvni5cn+X+Pc3m6grcIly7GA==
X-Received: by 10.55.214.25 with SMTP id t25mr31329287qki.233.1521658153319;
	Wed, 21 Mar 2018 11:49:13 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	e36sm3063655qtk.41.2018.03.21.11.49.10
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 21 Mar 2018 11:49:12 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 21 Mar 2018 15:49:06 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Mar 2018 15:49:05 -0300
Message-Id: <20180321184905.25175-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] mesa: Upgrade 17.3.6 -> 17.3.7
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
X-List-Received-Date: Wed, 21 Mar 2018 18:49:12 -0000

This version has been published at March 21, 2018, and it is a bugfix
only release. It includes several important fixes that were made as
part of 18.0.0 development cycle.

Full list of bug fixes can be see online at:

 https://www.mesa3d.org/relnotes/17.3.7.html

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-graphics/mesa/{mesa-gl_17.3.6.bb => mesa-gl_17.3.7.bb} | 0
 meta/recipes-graphics/mesa/{mesa_17.3.6.bb => mesa_17.3.7.bb}       | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_17.3.6.bb => mesa-gl_17.3.7.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_17.3.6.bb => mesa_17.3.7.bb} (87%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.3.6.bb b/meta/recipes-graphics/mesa/mesa-gl_17.3.7.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_17.3.6.bb
rename to meta/recipes-graphics/mesa/mesa-gl_17.3.7.bb
diff --git a/meta/recipes-graphics/mesa/mesa_17.3.6.bb b/meta/recipes-graphics/mesa/mesa_17.3.7.bb
similarity index 87%
rename from meta/recipes-graphics/mesa/mesa_17.3.6.bb
rename to meta/recipes-graphics/mesa/mesa_17.3.7.bb
index 1ace5fd2443..fe09a2988df 100644
--- a/meta/recipes-graphics/mesa/mesa_17.3.6.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.3.7.bb
@@ -11,8 +11,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch \
            "
 
-SRC_URI[md5sum] = "ba66ae0f09b9b84482268608557cd175"
-SRC_URI[sha256sum] = "e5915680d44ac9d05defdec529db7459ac9edd441c9845266eff2e2d3e57fbf8"
+SRC_URI[md5sum] = "769137f2538562c300c4b76bcb097377"
+SRC_URI[sha256sum] = "0595904a8fba65a8fe853a84ad3c940205503b94af41e8ceed245fada777ac1e"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.16.2


