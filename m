Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id E7264779F9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 20:22:35 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id k139so9546786qke.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 13:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=p18VoSpL416HACWBSN5z9fF5FrvuFmD5ooFzZtZqHo4=;
	b=s04vqF/SUExMZDXL92U5nHskAJU2K5gUciMCm8MtH7/8URWfH/h4x0mE6wKnfUWFzX
	MCegco2K3OfSfjgVvmLZtaYt+ob5l8QUpGC4492+dMFHu7IGuxDY02Dga5v3gM8xkSro
	s3r3tFXBMI6Oixd4Yh35FelbRTjblLnNNrh45K6q1lYBL8b/C8wcXHoem84hX65iobxD
	SMs/M0BVsUzP1sJ5DYcu+LwBqmJVNsz0htm6lZh66uY+3fATdeHaeB8D9D5a17tnGEkW
	ZhljqbJqS9a3DtaPgkB17EN64XVWqhcC4UMbwS+Uomx1i/mHwy7zFcjR8X219EsT1LQg
	kcBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=p18VoSpL416HACWBSN5z9fF5FrvuFmD5ooFzZtZqHo4=;
	b=R/47I+cHROm9Obesm9EWaI/XlP7ft7KRMCoqLphRhb2vfncViCI03wKQcrSGK81TXJ
	VIQrHBuJT4yS5zgZ6kRH/+vbXrWv8A5GCOrtUTKwBpXERJgMEn4QHzoRfmLfPwPVRkAb
	jG3xAsAVda9FZI/9OvLz2jUNAGUuOtROh/eY56Fxru+n4ud7DSDjJUUgAwf3YpMHYTk0
	xJdY6Sw2YLJ5Uz1lJabGV+VdJ625GWYPNKSn3TzEO6/WZSsGTsVLQwUYmwgLu9e+R09t
	Q9WG7kfufjKNY2pmmRU5mFHfYjGXX5ebWICNKHHa2gtCDsQzGX0uIMOllMuk3tk5vAUx
	vG+g==
X-Gm-Message-State: AN3rC/7CZkNwgkqfD1ZJjxtOTYLcLVWiniCfZj5DaymRMeH7685A3Ll+
	5qUxDvJEBLQnmyFK
X-Received: by 10.55.67.79 with SMTP id q76mr10206648qka.98.1492719756217;
	Thu, 20 Apr 2017 13:22:36 -0700 (PDT)
Received: from centrium.lab.ossystems ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id j1sm4865474qkf.57.2017.04.20.13.22.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 20 Apr 2017 13:22:35 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Apr 2017 17:22:16 -0300
Message-Id: <20170420202216.8360-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.11.0
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] mesa: Update to version 17.0.4
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
X-List-Received-Date: Thu, 20 Apr 2017 20:22:36 -0000

This commit apply bug fixes found in both mesa 17.0.2 and mesa 17.0.3
releases.

  - Mesa 17.0.4 is a bug fix release which fixes the following bugs
    found since the 17.0.3 release:

      Bug 99515  - SIGSEGV MAPERR on Android nougat-x86 with mesa 17.0.0rc
      Bug 100391 - SachaWillems deferredmultisampling asserts
      Bug 100452 - push_constants host memory leak when resetting command buffer
      Bug 100582 - [GEN8+] piglit.spec.arb_stencil_texturing.glblitframebuffer
                   corrupts state.gl_texture* assertions

  - Mesa 17.0.3 is a bug fix release which fixes the following bugs
    found since the 17.0.2 release:

      Bug 96743  - [BYT, HSW, SKL, BXT, KBL] GPU hangs with GfxBench 4.0 CarChase
      Bug 99246  - [d3dadapter+radeonsi & bisect] EVE-Online : hang on wormhole sight
      Bug 100061 - LODQ instruction generated with invalid dst mask
      Bug 100182 - Flickering in The Talos Principle on Sky Lake GT4.
      Bug 100201 - Windows scons build with MSVC toolchain and LLVM 4.0 fails

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta/recipes-graphics/mesa/{mesa-gl_17.0.2.bb => mesa-gl_17.0.4.bb} | 0
 meta/recipes-graphics/mesa/{mesa_17.0.2.bb => mesa_17.0.4.bb}       | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_17.0.2.bb => mesa-gl_17.0.4.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_17.0.2.bb => mesa_17.0.4.bb} (83%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.0.2.bb b/meta/recipes-graphics/mesa/mesa-gl_17.0.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_17.0.2.bb
rename to meta/recipes-graphics/mesa/mesa-gl_17.0.4.bb
diff --git a/meta/recipes-graphics/mesa/mesa_17.0.2.bb b/meta/recipes-graphics/mesa/mesa_17.0.4.bb
similarity index 83%
rename from meta/recipes-graphics/mesa/mesa_17.0.2.bb
rename to meta/recipes-graphics/mesa/mesa_17.0.4.bb
index 2689e8fac2..396076d2a1 100644
--- a/meta/recipes-graphics/mesa/mesa_17.0.2.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.0.4.bb
@@ -6,8 +6,8 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/mesa-${PV}.tar.xz \
            file://0001-Use-wayland-scanner-in-the-path.patch \
 "
 
-SRC_URI[md5sum] = "8f808e92b893d412fbd6510e1d16f5c5"
-SRC_URI[sha256sum] = "f8f191f909e01e65de38d5bdea5fb057f21649a3aed20948be02348e77a689d4"
+SRC_URI[md5sum] = "4a16cfc1c6d034cc17314b866eada628"
+SRC_URI[sha256sum] = "1269dc8545a193932a0779b2db5bce9be4a5f6813b98c38b93b372be8362a346"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.11.0


