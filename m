Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C5A7C433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 14:30:41 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.11738.1642429840764321190
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 06:30:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WMZCskzk;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642429838; i=@fujitsu.com;
	bh=EzZoFotVxw3yy6WRhhAObHiFda3sPJ6ggyxJ5WGMe+Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=WMZCskzksTx0pwXNJq+xBJ0ICURt2V615v/6pwhkQwCjJZiUmjuDPNDsiNumjWKDG
	 FH9tOZ91+Jwez12s9nqYA6+1uGjiVOk4ttMafAiCM4atVWBUnCNSHHPqlm8TJBfL1f
	 vW1Usk3MqCviLix46RvxBdovPX3iwPQN/B0xm9HcdwEGoqnOrzA+aqwVzBFVTpwmFo
	 xTfYXj+IzSjpdJY2bj8NPGtU+AJkXVJ3W/KdBQmRH71qyc0Q7nGs5xEHABJfoMVaZU
	 lAsYzPqaF0gNGd4hzgOJNyXKym691bHUp6FZJWzzD5be0y/EbY/1G4ds2dGtWuH2CT
	 n68Kl2oH5ZgqA==
Received: from [100.115.71.148] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 48/2C-15539-E8D75E16; Mon, 17 Jan 2022 14:30:38 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRWlGSWpSXmKPExsViZ8MxSbev9mm
  iwbblHBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bTQ/eYCxaoVeyff5G5gXGHYhcjF4eQwGNG
  iabrT5kgnPNMEh9O3WSDcE4wSjy/do61i5GTg01ATWL6rRtANgeHiICexNV/oiBhZgEViRe/e
  9hBbGEBS4nFhyaD2SwCqhIblq4Ga+UVcJLY0n2MGcSWEFCQmPLwPZjNKeAs8erVX2aQkUJANZ
  Nn6EOUC0qcnPmEBWK8hMTBFy+gWhUlZl9uZoGwKyRmzWpjgrDVJK6e28Q8gVFwFpL2WUjaFzA
  yrWK0SyrKTM8oyU3MzNE1NDDQNTQ01TUz0zU0NdVLrNJN1Est1U1OzSspSgRK6yWWF+ulFhfr
  FVfmJuek6OWllmxiBIZySrHT7B2MO/p+6h1ilORgUhLl5Qx7mijEl5SfUpmRWJwRX1Sak1p8i
  FGGg0NJglc9EygnWJSanlqRlpkDjCuYtAQHj5IIr1UNUJq3uCAxtzgzHSJ1itGY48qqJYuYOZ
  onLd/OLMSSl5+XKiXOywVSKgBSmlGaBzcIFu+XGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgn
  zWoJM4cnMK4Hb9wroFCagU1Z9fARySkkiQkqqgclET0G9uWbG8rlfL2cq7jjh6bbwtXfB5ZjX
  kf+lIlPb5LhTgvR9LF7USq09uG954dFGHsuE5HePreu7PzJlrY1n4GHgu7d14SKRk+w7WJcLm
  Mkt+NnGEa2p91DrYqTKpCBn2/X7HhoEbLlwPXv9tq3zLu/tu3y9Jy9+yak//meEL6xZxX1A5P
  zKI3ue5B3/8SLcT3TTM5WVE1y+7nc40HQooDNh1qJ6p031KWqvgxsfTrbO/lNaPb+f77i8VOS
  lx/eOb/+2qzPiIN/JeLNlM+02WU+bKdkm8LK+zP5DOKvqou8d5wNE3bNaJsf9t+xc6s3jHC3t
  cfZexfe3j74e8F63c0PbCVfZKZu4On+rTXyqxFKckWioxVxUnAgAdSOdwHIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-24.tower-545.messagelabs.com!1642429837!19512!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15357 invoked from network); 17 Jan 2022 14:30:38 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-24.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Jan 2022 14:30:38 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 97A92100473
	for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 14:30:37 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 80144100464
	for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 14:30:37 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 17 Jan 2022 14:30:23 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mesa: upgrade 21.3.3 -> 21.3.4
Date: Mon, 17 Jan 2022 22:30:06 +0800
Message-ID: <1642429806-13814-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1642429806-13814-1-git-send-email-wangmy@fujitsu.com>
References: <1642429806-13814-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 14:30:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160646

Changelog:
==========
Bug fixes
---------
i965: gen5 exposes EXT_texture_integer incorrectly
[radeonsi, regression, bisected]: Rendering issues with Factorio
mesa >= 21.x (with llvmpipe) will break the game JVGS
Panfrost - RK3399 - FACTORIO - glitches everywhere
Baldurs Gate 3 (Patch 6) - ribbon-like artifacts on textures
Game Starsector crashes under certain circumstances with mesa 21.3.+
FreeSpace models incorrectly rendered on Polaris cards, causing system freeze
Incomplete evaluation of nested DEFINE macros
[r300g, bisected] piglit glsl-fs-discard-04 fails
Panfrost G52 Firefox terrible glitches on youtube playback

Changes
-------
pan/bi: Fix load_const of 1-bit booleans
gallium/util: Add pixel->blocks box helper
lima,panfrost: Correct pixel vs block mismatches
radv: Set optimal copy alignment to 1.
microsoft/compiler: Fix dxil_nir_create_bare_samplers()
ir3/ra: Fix logic bug in compress_regs_left
ir3: Bump type mismatch penalty to 3
aco: don't allow SDWA on VOP3P instructions
aco: validate VOP3P opsel correctly
tu: fix workaround for depth bounds test without depth test
intel/genxml/gen4-5: fix more Raster Operation in BLT to be a uint
crocus: fail resource allocation properly.
freedreno/afuc: Disable the disassembler on 32-bit builds.
i915g: Turn off FP16 in the vertex shaders.
r300: Fix omod failing to increase the number of channels stored.
nir_to_tgsi: Fix a bug in TXP detection after backend lowering.
pick_status.json: Update to 8a78706643ecad8a1f303cc9358873abc29978b4
pick_status.json: Mark 00bea38242d97e7ace1954f1bc7d32cbf0ce3ee0 as denominated
pick_status.json: Mark 2a0253b9b5d21c7571555abe3a1d851468a18740 as denominated
r300: fix handling swizzle in transform_source_conflicts
intel/compiler/test: Fix build with GCC 7
i965: Disable EXT_texture_integer on Gfx4 and Gfx5
Revert "anv: Stop doing too much per-sample shading"
anv: don't leave anv_batch fields undefined
anv: limit compiler valid color outputs using NIR variables
intel/dev: fixup chv workaround
etnaviv: initialize vertex attributes on context reset
etnaviv: drm: fix size limit in etna_cmd_stream_realloc
etnaviv: drm: properly handle reviving BOs via a lookup
zink: fix -Warray-bounds warning
radv: fix xfb query copy param ordering
zink: always unset vertex shader variant key data when changing last vertex stage
zink: add extra synchronization for buffer descriptor binds
zink: use device-local heap for sparse backing allocations
r300: Remove broken optimization in rc_transform_KILL
radeonsi/gfx8: use the proper dcc clear size
vbo/dlist: fix loopback crash
vbo/dlist: add vertices to incomplete primitives
radeonsi/gfx10: fix si_texture_get_offset for mipmapped tex
glapi: should not add alias function to static_data.py
aco: remove pack_half_2x16(a, 0) optimization
intel/fs: OpImageQueryLod does not support arrayed images as an operand
v3dv: Hotfix: Rename remaining V3DV_HAS_SURFACE->V3DV_USE_WSI_PLATFORM
radv: add drirc radv_disable_htile_layers and enable it for F1 2021
iris: unref syncobjs and free r/w dependencies array for slab entries
mesa: free idalloc storage for display lists
mesa: free vbo_save_vertex_list store prims
glsl/glcpp: make sure to expand new token after concatenation
venus: subtract appended header size in vn_CreatePipelineCache
Fix compilation on armv7l with gcc 11.2.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mesa/{mesa-gl_21.3.3.bb => mesa-gl_21.3.4.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_21.3.3.bb => mesa_21.3.4.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_21.3.3.bb => mesa-gl_21.3.4.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_21.3.3.bb => mesa_21.3.4.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.3.3.bb b/meta/recipes-graphics/mesa/mesa-gl_21.3.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_21.3.3.bb
rename to meta/recipes-graphics/mesa/mesa-gl_21.3.4.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 7f47f18591..71cc3b4617 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -23,7 +23,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch \
            "
 
-SRC_URI[sha256sum] = "ad7f4613ea7c5d08d9fcb5025270199e6ceb9aa99fd72ee572b70342240a8121"
+SRC_URI[sha256sum] = "77104fd4a93bce69da3b0982f8ee88ba7c4fb98cfc491a669894339cdcd4a67d"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_21.3.3.bb b/meta/recipes-graphics/mesa/mesa_21.3.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_21.3.3.bb
rename to meta/recipes-graphics/mesa/mesa_21.3.4.bb
-- 
2.25.1


