Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id EA6757E5BD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 15:56:25 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id v22so6258868wml.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 08:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yPwNlbqe7/c/8LV5NbXoinIJwUtPA3iX/+5tBGWWNfA=;
	b=gGPgH+pVuq3dMImhZXViHZgoQsXms+Ofa9a9umlB4ZFxsbWTY1tge//Jiaf6wT08DA
	H2N9V5ayy8p6K5lnKXUTH+0av2N6qGXCKDHOAp9fahQZblghth4OupVgzJiSDLeEE8sb
	nYNdvniuT01pjIrDmCTK2m2LIq1hKLZfDN5vvX2HWVzsljFUh1cTu1DWovsymuqZ7Cil
	j/xtDWAuKVTHe79YIbx9M6/rDN6GPsNM2EUHWNygjJKjMLu9VzomL8Yt48qe7XJz5zWb
	TN+oK2oiJW2kHrXZPG8o/rUt9qEm/6ifBLKTQKPy9c8BoTg9Ve2K8lr5/gKoj5DNX3Fh
	yGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yPwNlbqe7/c/8LV5NbXoinIJwUtPA3iX/+5tBGWWNfA=;
	b=tRHgr4iNNKRtHfXwtksSno9z0yYwvP8RNswTLWE7Fc4doHpmwGx/CAx7t8flN2Paef
	zj0dCmXkV8Kqb/wn8uT3OKjvC81l1de8akUhFE1BNpQoHaYU+AeOIqd/IjtjFu2xXoNl
	ynseW2dxakpG08gBYsUK4fP/mcCXGlhEJctiIEzldZXrHNoKaxRYsM3Swa5TJGpMwpyG
	g+bmnv4XCww8A0n7jaJeM+uw9U+AbxFL0xs3ALZ5Fla2ohvb3taP4f54UGSNZnsmwEoE
	PU24a3mkRuT/9/Y+jEQIA6JAMu3AJr6DFjOm7Ad4UPSrOEsjBtaeD8+XjkCrobgewqcB
	iFMQ==
X-Gm-Message-State: APjAAAWCAAqK+QAX6WJfcVnU/QVlhEpqD2NKDbBEpOHR5SEp7uol3SrL
	3zmmoXGYaD/bjBLitdghOb4DAvG1+IuWtg==
X-Google-Smtp-Source: APXvYqyJoXOFwiyEPYoxcLxfCHuofB3is4G9uSLoZI7cjq7H4z+pUunp7/RaJrVH/dfrPAPm8X/scA==
X-Received: by 2002:a7b:cd15:: with SMTP id f21mr5933633wmj.99.1559318186241; 
	Fri, 31 May 2019 08:56:26 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	u19sm16496445wmu.41.2019.05.31.08.56.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 May 2019 08:56:25 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2019 17:56:11 +0200
Message-Id: <20190531155612.75663-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190531155612.75663-1-alex.kanavin@gmail.com>
References: <20190531155612.75663-1-alex.kanavin@gmail.com>
Subject: [PATCH 7/8] mesa: switch over to official git
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
X-List-Received-Date: Fri, 31 May 2019 15:56:26 -0000

The tarballs for all versions prior to 18.x have been moved to
https://mesa.freedesktop.org/archive/older-versions/

To avoid this practice causing fetching failures in the future,
let's use the git.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/mesa/mesa_19.0.3.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa_19.0.3.bb b/meta/recipes-graphics/mesa/mesa_19.0.3.bb
index 8a72df10147..001c2f41237 100644
--- a/meta/recipes-graphics/mesa/mesa_19.0.3.bb
+++ b/meta/recipes-graphics/mesa/mesa_19.0.3.bb
@@ -1,13 +1,15 @@
 require ${BPN}.inc
 
-SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
+def ver_branch(v):
+    return oe.utils.trim_version(v, 2)
+
+SRC_URI = "git://gitlab.freedesktop.org/mesa/mesa.git;protocol=https;branch=${@ver_branch("${PV}")} \
            file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
            file://0001-meson.build-make-TLS-GLX-optional-again.patch \
            file://0001-Allow-enable-DRI-without-DRI-drivers.patch \
            "
-
-SRC_URI[md5sum] = "d03bf14e42c0e54ebae5730712ccc408"
-SRC_URI[sha256sum] = "f027244e38dc309a4c12db45ef79be81ab62c797a50a88d566e4edb6159fc4d5"
+SRCREV = "c8cdee5dc3c6f9856ee73aed2b47cee77d675022"
+S = "${WORKDIR}/git"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.17.1


