Return-Path: <otavio.salvador@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3D58C78A50
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 14:04:47 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id t126so12366529vkb.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Mar 2018 06:04:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=aejt8VZYitsdwKiWU0j9zKb5/ffErRTlXVUR4b7Lzko=;
	b=AW89Jbi3rHF+5f7K7XNsu51YygWHY1vMh/vIuOk2dBhWxXRYQJrWElkMHbEiJw6Zjv
	fJpItTpnK30tvYc73nYUEhtJq61vXuTAsSkZMsSu97WtfPBGrAc3K/O8GwHE22qe0lXi
	JmCwoGC2OnNwmk/Z5bC/1yuHeIFtDoeO42VhiDWEw07YTcx0i75ZpRQ9ZJpMvbcfwl3q
	e/7JJT/YarNsNqmCBp+A59VWqN0PF+bYpkTP7SfoQUv1e3enGiklxocngJXfbxmzVjJ8
	5gyV3+ko0nyPigIP7mjom93pl4QMdxL9M5qMmx6mM7yqpiJ0joXS9EbiDCGvn1sEu6FS
	t4lQ==
X-Gm-Message-State: APf1xPCTUMKkOSfOxnURWSEZBlEg7mFi/2P5wWfK3Es/yJiVXHwQpGAH
	6p6r3O2L/0ghBTtbTPNZf0Y7Qg==
X-Google-Smtp-Source: AG47ELv3JwvpLKnjqI918r9oNmvSNPipEZy9+g594U1r5fybbxtbCOFxXcOVu87tgphXWdaGSY3DAg==
X-Received: by 10.31.208.7 with SMTP id h7mr13276593vkg.71.1520345087787;
	Tue, 06 Mar 2018 06:04:47 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	j192sm6851536vke.9.2018.03.06.06.04.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Mar 2018 06:04:46 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 06 Mar 2018 11:04:40 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  6 Mar 2018 11:04:39 -0300
Message-Id: <20180306140439.13059-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.2
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] libdrm: 2.4.90 -> 2.4.91
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
X-List-Received-Date: Tue, 06 Mar 2018 14:04:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a minor release, announced in March 5th, 2018, which includes
following changes:

,----
| Andrey Grodzovsky (1):
|      amdgpu: Fix mistake in initial hole size calculation.
|
| Christian König (3):
|      amdgpu: mostly revert "use the high VA range if possible v2"
|      amdgpu: add AMDGPU_VA_RANGE_HIGH
|      amdgpu: fix "add AMDGPU_VA_RANGE_HIGH"
|
| Chunming Zhou (1):
|      test/amdgpu: disable bo eviction test by default
|
| Eric Engestrom (1):
|      meson: add configuration summary
|
| Heiko Becker (1):
|      *-symbol-check: Don't hard-code nm executable
|
| Igor Gnatenko (1):
|      meson: do not use cairo/valgrind if disabled
|
| Jonathan Gray (1):
|      meson/configure.ac: pthread-stubs not present on OpenBSD
|
| Marek Olšák (2):
|      meson: bump the version number
|      RELEASING: mention meson
|
| Michel Dänzer (1):
|      tests/amdgpu: Fix misspellings of "suite"
|
| Rob Clark (2):
|      freedreno: add interface to get buffer address
|      bump version for release
|
| Rob Herring (4):
|      android: revert making handle magic and version members const
|      android: fix mis-named alloc_handle_t
|      android: add helper to convert buffer_handle_t to gralloc_handle_t ptr
|      android: fix gralloc_handle_create() problems
|
| Thierry Reding (2):
|      drm/fourcc: Fix fourcc_mod_code() definition
|      drm/tegra: Sanitize format modifiers
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-graphics/drm/{libdrm_2.4.90.bb => libdrm_2.4.91.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.90.bb => libdrm_2.4.91.bb} (93%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.90.bb b/meta/recipes-graphics/drm/libdrm_2.4.91.bb
similarity index 93%
rename from meta/recipes-graphics/drm/libdrm_2.4.90.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.91.bb
index 462ed157855..c490285883f 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.90.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.91.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
            file://0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch \
           "
 
-SRC_URI[md5sum] = "61dcb4989c728f566e3c15c236585a17"
-SRC_URI[sha256sum] = "db37ec8f1dbaa2c192ad9903c8d0988b858ae88031e96f169bf76aaf705db68b"
+SRC_URI[md5sum] = "23d87cda92700b710a37d9b8edaa9f54"
+SRC_URI[sha256sum] = "634a0ed0cc1eff06f48674b1da81aafa661a9f001e7a4f43dde81076886dc800"
 
 inherit autotools pkgconfig manpages
 
-- 
2.16.2


