Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2264F78077
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Feb 2018 22:21:35 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id l23so10167949qkk.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Feb 2018 14:21:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=3Db1jAD5oCbS1Pi7FyWo7yJZs8CV2Jy9YbXMf0lIYHY=;
	b=omUq5JcnTs+zbvD04/AMRdW/o8jwdErweXW2v4jYYqIdEw2UZUNLxO+IsAa+ugS848
	JlAcIiCd1M1yLzh5HJEXKbrYCDmenwFxEvJbPVzGpOFACZeMUheQD4DQxS+dUoYVdL2S
	LP+pkQJhP4AiyQthmDCs/LMJHIZlAV5Bet6EtfBUqmdWmeMWwNc2x+iP9abkALzg+YYH
	5hwlsD3q7jvi+mhZOX0LPZgFW6L+UP9y02wOHW7cpxhdWtgEMhl48UTfo0KjPmdcU+Iv
	sEitpGDPb+j6AqSliqfDvAjxZkSBXjC7JJHOAUmSblvJ5Co1inf8OqXj28uLuHaFkyJU
	sxHA==
X-Gm-Message-State: APf1xPCPBpRnSDrX28dksSVLj3Sh3JY+lEaR/CSs4T+AZ7msUDX8CKc3
	TbjVWBEtg7xzDAgZP/tItwunAQ==
X-Google-Smtp-Source: AH8x225YGcbWdt/M+eijzWrDr4Nn1v7ykewJWlyxbOzpM17+9U/7qH6qxrwIdJMEDddYvIo+cT0YNg==
X-Received: by 10.55.182.2 with SMTP id g2mr19925869qkf.202.1518992496701;
	Sun, 18 Feb 2018 14:21:36 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	b184sm2072383qkg.84.2018.02.18.14.21.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 18 Feb 2018 14:21:35 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Sun, 18 Feb 2018 19:21:29 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sun, 18 Feb 2018 19:21:20 -0300
Message-Id: <20180218222120.28451-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180218222120.28451-1-otavio@ossystems.com.br>
References: <20180218222120.28451-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] libdrm: Upgrade 2.4.89 -> 2.4.90
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
X-List-Received-Date: Sun, 18 Feb 2018 22:21:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The 2.4.90 was announced in Feb 17th 2018 and had following changes
are listed:

,----
| Andrey Grodzovsky (2):
|       amdgpu: Update deadlock test to not assert on ECANCELED
|       amdgpu: Fix segfault in deadlock test.
|
| Anuj Phogat (1):
|       intel: Add more Coffeelake PCI IDs
|
| Bas Nieuwenhuizen (1):
|       drm: Fix 32-bit drmSyncobjWait.
|
| Christian König (5):
|       amdgpu: fix 32bit VA manager max address
|       headers: sync up amdgpu_drm.h with drm-next
|       amdgpu: use the high VA range if possible v2
|       test/amdgpu: fix compiler warnings
|       amdgpu: fix high VA mask
|
| Christoph Haag (1):
|       meson: fix the install path of amdgpu.ids
|
| Chunming Zhou (5):
|       fix return value for syncobj wait
|       amdgpu: fix inefficient vamgr algorithm
|       amdgpu: clean up non list code path for vamgr
|       tests/amdgpu: add bo eviction test
|       amdgpu: clean up non list code path for
|       vamgr v2
|
| Dylan Baker (7):
|       Add meson build system
|       autotools: Include meson.build files in tarball
|       README: Add note about meson
|       meson: set proper pkg-config version for
|       libdrm_freedreno
|       meson: set the minimum version correctly
|       meson: fix libdrm_nouveau pkgconfig include directories
|       meson: include headers in root directory in ext_libdrm
|
| Emil Velikov (1):
|       tests/amdgpu: add missing config.h include
|
| Eric Engestrom (25):
|       remove unnecessary double-semicolon
|       tests/amdgpu: add parentheses to make operation priority explicit
|       tests/amdgpu: drop unused variables
|       tests/util: fix signed/unsigned comparisons
|       tests/util: drop unused parameters
|       tests/etnaviv: drop unused `return 0`
|       meson: add missing HAVE_RADEON
|       configure: remove unused HAVE_CUNIT define
|       configure: remove unused HAVE_INSTALL_TESTS define
|       meson,configure: remove unused HAVE_OMAP define
|       meson,configure: remove unused HAVE_TEGRA define
|       meson,configure: remove unused HAVE_FREEDRENO define
|       meson,configure: remove unused HAVE_ETNAVIV define
|       meson,configure: always define HAVE_{INTEL,VMWGFX,NOUVEAU,EXYNOS,VC4,RADEON}
|       always define HAVE_FREEDRENO_KGSL
|       always define HAVE_CAIRO
|       always define HAVE_VALGRIND
|       meson: sort HAVE_* defines
|       xf86atomic: fix -Wundef warning
|       meson: cleanup whitespace
|       meson,configure: add warning when using undefined preprocessor tokens
|       xf86drmHash: remove always-false #if guards
|       configure: always define HAVE_LIBDRM_ATOMIC_PRIMITIVES and HAVE_LIB_ATOMIC_OPS
|       exynos/tests: use #ifdef for never-defined token
|       meson,configure: turn undefined preprocessor tokens warnings into errors
|
| Hawking Zhang (3):
|       tests/amdgpu: execute write linear on all the available rings
|       tests/amdgpu: execute const fill on all the available rings
|       tests/amdgpu: execute copy linear on all the available rings
|
| Marek Olšák (2):
|       amdgpu: add amdgpu_query_sw_info for querying high bits of 32-bit address space
|       configure.ac: bump version to 2.4.90
|
| Michel Dänzer (7):
|       amdgpu: Don't print error message if parse_one_line returned -EAGAIN
|       amdgpu: Don't dereference device_handle after
|       amdgpu_device_deinitialize
|       amdgpu: Symlink .editorconfig to tests/amdgpu
|       amdgpu: Disable deadlock test suite by default for SI ASICs
|       amdgpu: Disable VM test suite by default for SI ASICs
|       Revert "amdgpu: clean up non list code path for vamgr"
|       amdgpu: Add amdgpu_query_sw_info to amdgpu-symbol-check
|
| Rob Clark (1):
|       freedreno: clamp priority based on # of rings
|
| Robert Foss (5):
|       android: Move gralloc handle struct to libdrm
|       android: Add version variable to gralloc_handle_t
|       android: Mark gralloc_handle_t magic variable as const
|       android: Remove member name from gralloc_handle_t
|       android: Change gralloc_handle_t members to be fixed width
|
| Seung-Woo Kim (2):
|       amdgpu: fix not to add amdgpu.ids when building without amdgpu
|       modetest: Fix to check return value of asprintf()
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-graphics/drm/{libdrm_2.4.89.bb => libdrm_2.4.90.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.89.bb => libdrm_2.4.90.bb} (93%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.89.bb b/meta/recipes-graphics/drm/libdrm_2.4.90.bb
similarity index 93%
rename from meta/recipes-graphics/drm/libdrm_2.4.89.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.90.bb
index 6754a932427..462ed157855 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.89.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.90.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
            file://0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch \
           "
 
-SRC_URI[md5sum] = "5307a147dde67ac643f6753a42b5d32c"
-SRC_URI[sha256sum] = "629f9782aabbb4809166de5f24d26fe0766055255038f16935602d89f136a02e"
+SRC_URI[md5sum] = "61dcb4989c728f566e3c15c236585a17"
+SRC_URI[sha256sum] = "db37ec8f1dbaa2c192ad9903c8d0988b858ae88031e96f169bf76aaf705db68b"
 
 inherit autotools pkgconfig manpages
 
-- 
2.16.1


