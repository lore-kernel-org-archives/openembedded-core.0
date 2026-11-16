Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29474.1794840428312911388
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 06:47:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=Q50wT+al;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.52, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c407213696aso44182066b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 06:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1794840426; x=1795445226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=35LiaxG/DdV2KGlsNPf41xyHX79mHXwOzhpngLub98U=;
        b=Q50wT+al+99KYcCxtldJ5ltn0qI4sIi89abtMqzHxD0+3ELMM8ivQEsvK7EDp1+Gdx
         8h0Qn11jnyGMNwUIJ1dyRKkEF4Wn5aS456NxvXqGUihUXlqWFVGEfZGFCKaEpUIieklx
         XRemeEipw0bTMrqj6GJ+J5vzZo3tcyJkIzZKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794840426; x=1795445226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=35LiaxG/DdV2KGlsNPf41xyHX79mHXwOzhpngLub98U=;
        b=FHT20ww8WKrVVTyi4+2QH1Vq4U1gbTTtZ3VcpnKn3VXDuIdRkh7zH/X/ODLO+usuQJ
         9E7PmnJOVTSkiq3F1DDu2tUhZxqealpS6Rr/3csD5ImOzJZ85y6pa2xaFrn/U7l0Gclp
         /v54oH1XzVruMk7UlifG3iHN83+xaTsA0i+lPVeczMMZg81ZgfUtrg5xWrl/AeIJ/Ocg
         VikvzKRXAL/SHMJO5AY4MwY2V33IVCKjxJJe2i30+1Af8K1+kB0lwWNyPnXYQxsBD1iP
         zOTSdrQdjE0nm/lvf4RrO4neV5sUlQ0vM4i8hD08wBsU2G1vbHciXzPzJedAHMT3QFyX
         yzXg==
X-Gm-Message-State: APuU4Z8azRbToOpkVvNRtpPrZDNrImF3J74Zg0eD4rs+fEvgRHn7Tck7
	1t7zs3flRV/+0VVy5edKoCPfcPtS+r5yDl9PdpZeRC2XWyfZHbOmCoIOM/JAhbb8yilF/B6jB17
	vzl2cGqs=
X-Gm-Gg: AYBFou0ULXkz6FR9MuH7nvxdzqG7cygXUD7qZqKP8VwLsyPyQvVw0NqsyyVCQGWF6Pa
	dDioNl4b7KbMyxvqlwyHKlw7yLYXI+mgOtn24xO1KYXX8aiPgjpmJaoF7JovH5sLEMEZJUENLuX
	0xDLSoHqO60UA53IJyvct+VkARdhGAtodOrbN1kqKb8tFPqCPDUU7sC4QdV8a1i3lQ2z4SdCY7P
	AGGA/Z0KOA9NtYFX+EcVDt8zMwYVble6F0nsbhZYZ0E4WZwK7tD5JzbWA6Ee/bpD1Tfj5V2N9na
	6PaGlda5kCES2p5GndicrwantAbcZlQZCvVpIkM6swt4RwxLO2j2UPSmCcj+c16SxNyeGQC2fKB
	g8dUgMAtXRv08XH3vKanDHzJQAmLeeIOl2CUu3kIdDoV+FUYk2AQ3qg0wP9pGD4hP6Vi6lyvEMe
	WFTHx6JCsMr4z5LYxJO/IL8iwHSFBz3pSXfNhnhjqcBHVoPk89gy14mj8cWLjiwi/LpAnVhrqOe
	HXqlcytJjmCgj96YIv9cugr+NKIM4jMpqlmLab2+QDbmELu064I74dvhRhdBYJu7tsvfCerlJ6U
	qtg7LZ/Ki5bbeUSS3w/SkBFG2HOD0aNj1CWpd2UeFR0S0tHiLV2VrUQE2A+qpVaYTsKxPBCl/Qm
	XHTBFNO07ZZd3ZFVYRhw33ekhdCEX5g2PWdGIPmGcFZUqXUP1PTS2SbEYuc9DSL01YLnm+CaoDB
	QZ8ZMIncmQRXojXDJU1SHrhe2R/fnT3jot3wYZN6T0i5S9LPzd2z0V2P0Zc6hOJBU17OmhH2Prs
	kdb+6MFzSlQvbHc8kg=
X-Received: by 2002:a17:906:3482:b0:c25:2ded:ad36 with SMTP id a640c23a62f3a-c5095db0da6mr855752766b.0.1794840426323;
        Mon, 16 Nov 2026 06:47:06 -0800 (PST)
Return-Path: <adam.duskett@amarulasolutions.com>
Received: from adam-linux.tail032493.ts.net (2001-1c00-8181-e800-dc0e-c162-ac5f-4bbe.cable.dynamic.v6.ziggo.nl. [2001:1c00:8181:e800:dc0e:c162:ac5f:4bbe])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b97440sm433272366b.86.2026.11.16.06.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:47:05 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v2 1/1] mesa: add libdrm to the gbm PACKAGECONFIG dependencies
Date: Mon, 16 Nov 2026 15:47:03 +0100
Message-ID: <20261116144703.1346131-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 14:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250345
Content-Type: text/plain; charset="utf-8"

Mesa requires libdrm whenever GBM is built, but the gbm PACKAGECONFIG
doesn't list it, so libdrm is only pulled in indirectly when another
option (gallium, vulkan, wayland) happens to depend on it.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: Reworded

 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 64f5de12b4..6ef725c9a7 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -99,7 +99,7 @@ INHIBIT_DEFAULT_RUST_DEPS = "${@bb.utils.contains('PACKAGECONFIG', 'opencl', '',
 PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
 
 # "gbm" requires "opengl"
-PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled"
+PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled, libdrm"
 
 # "gles" requires "opengl"
 PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2=disabled"
-- 
2.56.1

