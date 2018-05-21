Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 22DCB607A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 21:51:06 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id h2-v6so20897524qtp.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 14:51:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=aQ1IrhQYVmo7Sr/CxnbecWIZWZ+k76PZmQCygJKOcKU=;
	b=HzHYtA3HIL7hRhbeh/IZIthjN8KQojgYRI4tyK0sFJCC+VJgurBFcQIzwXwZkj9H6+
	CsU0NI8mC4pNxM+HOLnLvePdmndSbCgvQyqZVxP/MBEarN7HSeq6PC0arC2D7ZmNhGxA
	UninSsv0VPcXqU8pD8seCX8zED4YZzh+lH5MtiOK2+csrr5njLLWQmsTW56tN8Z4jvZn
	teg3TpZCXadWAPJJ3KkR0HEwZVeagpUy4DCaHl8TCbSl3Na2cfESjU1kszQgEXy9vMhZ
	I2dLEupg0rM2Y9QLjHc1xzFJYIbBjHWbuRr42ygQbatnwAmIlwfPgp/cU81WsauUbO3t
	jNGg==
X-Gm-Message-State: ALKqPwenXLwfWN+gs8a5ZN6IUarsQhPpmFDKntI1jaqieQPPWo/0UYSZ
	9rWR5GaWNSJ8k/NFDU+U/y24RQ==
X-Google-Smtp-Source: AB8JxZpZ0z7AcRGHA4YS685FhShyLOvlOSBjPYkuxT0fE5XR6tuPZXOtATXaevFx5lHFrhmL1fVL4g==
X-Received: by 2002:a0c:bdac:: with SMTP id
	n44-v6mr18936355qvg.165.1526939466845; 
	Mon, 21 May 2018 14:51:06 -0700 (PDT)
Received: from localhost.localdomain ([177.194.217.140])
	by smtp.gmail.com with ESMTPSA id
	x28-v6sm12542122qtx.95.2018.05.21.14.51.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 21 May 2018 14:51:06 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 21 May 2018 18:51:00 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 21 May 2018 18:50:50 -0300
Message-Id: <20180521215050.30322-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180521215050.30322-1-otavio@ossystems.com.br>
References: <20180521215050.30322-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] libdrm: upgrade 2.4.91 -> 2.4.92
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
X-List-Received-Date: Mon, 21 May 2018 21:51:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

    Daniel Stone (3):
      drm/atomic: Refuse to add invalid objects to requests
      headers: Sync with drm-next
      headers: Update README

    Dylan Baker (1):
      meson: don't use compiler.has_header

    Emil Velikov (1):
      Revert "libdrm: intel/Android.mk: Filter libdrm_intel library requirements on x86/x86_64"

    Eric Engestrom (13):
      freedreno: add missing symbols to symbol-check
      meson: use pkg-config to detect libatomic_ops
      meson: make it easy to add headers to check
      meson: detect alloca.h
      meson,configure: always define HAVE_OPEN_MEMSTREAM
      meson,configure: always define HAVE_VISIBILITY
      meson,configure: always define UDEV
      meson: replace `if(compiles) have=true` with `have=compiles`
      meson,configure: include config.h automatically
      meson: drop unneeded dependency to libudev
      meson: move line to allow using `config` earlier
      meson: drop unnecessary variable
      xf86drmMode: merge successive mutually-exclusive #ifs

    Gowtham Tammana (1):
      omap: add Android build support

    Inki Dae (1):
      tests: fix memory leak issue

    James Zhu (1):
      tests/amdgpu: add vce mv tests support and sets

    John Stultz (3):
      libdrm: intel/Android.mk: Filter libdrm_intel library requirements on x86/x86_64
      libdrm: Use readdir instead of readdir_r to avoid build warnings
      libdrm: gralloc_handle.h: Fix build issue with Android

    Marek Olšák (1):
      Revert "amdgpu:support 16 ibs per submit for PAL/SRIOV"

    Matt Atwood (1):
      Intel: Add a Kaby Lake PCI ID

    Michel Dänzer (1):
      amdgpu: Deinitialize vamgr_high{,_32}

    Paulo Zanoni (1):
      intel: add support for ICL 11

    Qiang Yu (1):
      amdgpu:support 16 ibs per submit for PAL/SRIOV

    Rex Zhu (1):
      headers: sync up amdgpu_drm.h with drm-next

    Rob Clark (2):
      freedreno: add fd_pipe refcounting
      bump version for release

    Rodrigo Vivi (1):
      intel/intel_chipset.h: Sync Cannonlake IDs.

    Sabre Shao (1):
      drm/amdgpu: Remove IB count checking

    Satyajit (1):
      libdrm: amdgpu: Adding DRM_RDWR flag in amdgpu_bo_export

    Seung-Woo Kim (1):
      tests/exynos: remove dead condition

    Stefan Schake (1):
      android: Add missing include exports

    Tomasz Figa (1):
      intel: Do not use libpciaccess on Android

    Xiaojie Yuan (1):
      amdgpu: enlarge the maximum number of cards supported

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../drm/{libdrm_2.4.91.bb => libdrm_2.4.92.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.91.bb => libdrm_2.4.92.bb} (93%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.91.bb b/meta/recipes-graphics/drm/libdrm_2.4.92.bb
similarity index 93%
rename from meta/recipes-graphics/drm/libdrm_2.4.91.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.92.bb
index c490285883..8f59452a49 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.91.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.92.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
            file://0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch \
           "
 
-SRC_URI[md5sum] = "23d87cda92700b710a37d9b8edaa9f54"
-SRC_URI[sha256sum] = "634a0ed0cc1eff06f48674b1da81aafa661a9f001e7a4f43dde81076886dc800"
+SRC_URI[md5sum] = "f9b00d985f82d0be6ecc20c799acc89e"
+SRC_URI[sha256sum] = "e9e48fdb4de139dc4d9880aa1473158a16ff6aff63d14341367bd30a51ff39fa"
 
 inherit autotools pkgconfig manpages
 
-- 
2.17.0


