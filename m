Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 66F286C109
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 19:55:40 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id m29so3872755qtu.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 12:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version:organization
	:content-transfer-encoding;
	bh=B4CBKsdVKXZHigPVJF4JI1JepJFEVhWY1QBdMdxZsX0=;
	b=Kset6fYo2H1YDG+T6p2ms1XpuNywGCRrhinKfxQwKo990pt5v44jpFzel22gq7URSB
	pP3wVTF3l3aO9hyEIuOx4pzD2infUkTl5nprnEP1oGaON6dir9LgsyQQ5pmg7DxI4dHw
	yZPJDYzgyVlCtJyUJV8fN3ziFrYHP6eeSewzqsVdLjqH9C1Sa201sM+QsUvnzJVFzUmz
	3p1bvm3E/zDu3PPD5vwPAOdWrsuRcPPsTQcTPEkssw65fQXq6WhS+HVUZYqcjIowmt+z
	6uhwnEl8cS4NwLRUKUeiEOLohEHlHKJdqbfRWbeRaGu+kjmbrWMfgoSVbYN7jpalXcuK
	AxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=B4CBKsdVKXZHigPVJF4JI1JepJFEVhWY1QBdMdxZsX0=;
	b=Uw/K8tVnMEHiZkpbgkyN3z7j8mq/ksoOT+fuyeianaTgqA9mRhOyE1h/bB2chQ3NlN
	gFu2gCQ9pdbYYDCBcqy+ddRnnxgr5bhgkzG7BJS+vgU8Ed4jvcPMEZP0bj5/Ej7CQCvG
	W1maErzV3H1mDNQYqcEdSUn5IyV5EemqOgg/2vKMkxSGbmki0Wzzbbd4vW8J5f5rZBxT
	OPzXbo8hA6dpOfZ7NZF/3iRbzJvFJADtgbiitQbMRcMWsUH9uW5Qm3SU3xQhRm287s5p
	IbSYm8L+bfreQxpmGZgsLma2XpRq3gsESSXpxqUyRez25Y0qj2FSKnJ1Z2NSfMU+27IY
	+/CQ==
X-Gm-Message-State: APjAAAVN7I7OlYFSjy4kvNt/9SlTBAMqbYcLFWvAtfPoEt2r9C3wAenl
	03lzFQuI05bahzhpSTL96dUUVj4lfzZIRQ==
X-Google-Smtp-Source: APXvYqwdoTQH145AGYRRYcAtAHZKdI0W8pYNMv1dm4G4+tTDXI2I8TEpmMic3oRWZ1FAaqu1nE7czg==
X-Received: by 2002:ac8:2b51:: with SMTP id 17mr4761494qtv.206.1561665341206; 
	Thu, 27 Jun 2019 12:55:41 -0700 (PDT)
Received: from centrium.lab.ossystems ([181.220.86.53])
	by smtp.gmail.com with ESMTPSA id s134sm39759qke.51.2019.06.27.12.55.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 27 Jun 2019 12:55:40 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2019 16:55:23 -0300
Message-Id: <20190627195523.6629-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [warrior][PATCH] mesa: Update 19.0.1 -> 19.0.8
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
X-List-Received-Date: Thu, 27 Jun 2019 19:55:40 -0000
Content-Transfer-Encoding: 8bit

This commit adds the following changes:

Updates from 19.0.8:

  - Mesa 19.0.8 is an emergency bug fix release which fixes a critical
    bug found in the 19.0.7 release.

  Full log:
  https://www.mesa3d.org/relnotes/19.0.8.html

Updates from 19.0.7:

  - Mesa 19.0.7 is a bug fix release which fixes bugs found since the
    19.0.6 release.

  Full log:
  https://www.mesa3d.org/relnotes/19.0.7.html

Updates from 19.0.6:

  - Mesa 19.0.6 is a bug fix release which fixes bugs found since the
    19.0.5 release.

  Full log:
  https://www.mesa3d.org/relnotes/19.0.6.html

Updates from 19.0.5:

  - Mesa 19.0.5 is a bug fix release which fixes bugs found since the
    19.0.4 release.

  Full log:
  https://www.mesa3d.org/relnotes/19.0.5.html

Updates from 19.0.4:

  - Mesa 19.0.4 is a bug fix release which fixes bugs found since the
    19.0.3 release.

  Full log:
  https://www.mesa3d.org/relnotes/19.0.4.html

Updates from 19.0.3:

  - Mesa 19.0.3 is a bug fix release which fixes bugs found since the
    19.0.2 release.

  Full log:
  https://www.mesa3d.org/relnotes/19.0.3.html

Updates from 19.0.2:

  - Mesa 19.0.2 is a bug fix release which fixes bugs found since the
    19.0.1 release.

  Full log:
  https://www.mesa3d.org/relnotes/19.0.2.html

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../mesa/{mesa-gl_19.0.1.bb => mesa-gl_19.0.8.bb}             | 0
 meta/recipes-graphics/mesa/{mesa_19.0.1.bb => mesa_19.0.8.bb} | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_19.0.1.bb => mesa-gl_19.0.8.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_19.0.1.bb => mesa_19.0.8.bb} (85%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_19.0.1.bb b/meta/recipes-graphics/mesa/mesa-gl_19.0.8.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_19.0.1.bb
rename to meta/recipes-graphics/mesa/mesa-gl_19.0.8.bb
diff --git a/meta/recipes-graphics/mesa/mesa_19.0.1.bb b/meta/recipes-graphics/mesa/mesa_19.0.8.bb
similarity index 85%
rename from meta/recipes-graphics/mesa/mesa_19.0.1.bb
rename to meta/recipes-graphics/mesa/mesa_19.0.8.bb
index d90be8a074..8cb80b541e 100644
--- a/meta/recipes-graphics/mesa/mesa_19.0.1.bb
+++ b/meta/recipes-graphics/mesa/mesa_19.0.8.bb
@@ -7,8 +7,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch \
 "
 
-SRC_URI[md5sum] = "19636bb3da35c21f43040d31e575d5ce"
-SRC_URI[sha256sum] = "6884163c0ea9e4c98378ab8fecd72fe7b5f437713a14471beda378df247999d4"
+SRC_URI[md5sum] = "9634964d87f1ce8d0230493e43f34c50"
+SRC_URI[sha256sum] = "d017eb53a810c32dabeedf6ca2238ae1e897ce9090e470e9ce1d6c9e3f1b0862"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.20.1


