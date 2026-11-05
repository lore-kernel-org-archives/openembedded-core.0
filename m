Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29825.1793868241817799963
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:44:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=c0qXfflG;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1311266f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868240; x=1794473040; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CMP/zoUgxbjoDMScvY5xhVSwgFcCJng06K9grBtnQj8=;
        b=c0qXfflGmN/8SJtXLP/F2fJzqVb2lsWrjN5aSMEHuqaNxbZ3AJf0OO0zw73Zp9Vg/J
         PQY+Aw/5fSfnc6FEvQBRdsq2CJKFS2x9c6v6aKuKW7mJXgxBQf+KC/lgZlHDfAObh3ZI
         5hTD2c3ovmhex8u91hp0x400atnUUGEj9JbViVd0U4K6zMg6kIoVo73wscmaafstk7Bu
         wEfx9FgUU9bi3hanUsxN423Q27GP44//GiZH7crdrdjEotj3lUi5WqOD6F90PRu2+s87
         tU5lPTFiLuU2uEeEyZrZgGsBqAbhhty9RF8fSt0PrHz1CsVr8X5JwbMAanLcxEZB+EIU
         L6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868240; x=1794473040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CMP/zoUgxbjoDMScvY5xhVSwgFcCJng06K9grBtnQj8=;
        b=RU4x02FgzYD9c51h3bqp0ZaoYXPgLbWPIAcVZc/0c7emsyvb/tVu77oUIOEOMuWU22
         /LD20WFmNDAj3lLuKiFAQaZDHJiqviswTM0YsuiZe2ThBGn9hj3yHtH62YNZJ/13BdIh
         b9+w1a07d+qKIjF51AS9jryhQFuQOdlruWIaZiZd5wWlk3bF4uHkimi9L+ayidc0eG1k
         mZNIhJ8cU5hqwb58Yl41UczuvfxbhhqJ/cOG/gQKUZIBOeMMMuzvnw6gLn/mkuqI1LVT
         nt0uETN4PfhptdpOrXzg8ZJ7/WE1ac637gJAImbOz0ReIdMgLhQZy4SeiATy0FuGHlTI
         C52Q==
X-Gm-Message-State: APuU4Z9ngKnwqyzt4o4PEzH5e/8PGtviHVuL+CLiJvnkSXDUK3ecLVYP
	pt5uiNyMisDtmr8BUmIstSQriQaZ307lRPoKyQvbCjHABJUOkVinKbm1oMuNADokn31WqYiE60D
	CG3xLtlU=
X-Gm-Gg: AYBFou2xXpRK8to8Ij+Pk8VykjWL8RRboNM2fru+IXeRH8DGwohlo9cSHshlwxUUgOi
	5tzt362yoRCZNGuWU/zuEiJFF427JuBBS9MGUuru+7j2CGoepPgssKq8doLWio6W4pE3ElsrfDe
	t9l0q2sM7YcrU1xMIFXp9gLBsOA41r5wHaI10/EXyqrXl/ntW6inVCMEcFe+AVEBhs8mTos64Ao
	8Kx9gMZ/AG19rK/mM6ZsrEBbicgFv52WmA4zoq8l9qPwoZKL33KFDYv/C+r41uvvcdajBm6WG+E
	DEPFPXWrYLJgudYIhYM29DQH13DYiAjlsS6AsnF4rkzwquVLxh0w+9928IG0gPAe8RLvYwy6tBt
	9lbl3WNUqxBGySkQJMC32c4oynmnDJP8/3xxIbbf98L3m1PvMX/wIWFkemibOYhvYPJ41SAzuZ5
	jJihh0rxPh0MB+/Dd0aD64uPoZfB6w4oqFpp47xRCCOL3Gd019NOJz57C267sVcpc+yAd8ZfR6I
	khfYnPeuZxFwyCR0WQBYcyDxEW/2UcfZ/x6jtX6Zi8G8xY58rn8AFU5MMu7zONEOOapjrOpAZ2n
	xSEBGEr/xPFmXhjcLd8EK2ikdfSLlqeXCQKFYR1vQFZfuGSLGeuPe5/Qo2LAepOaYoF/A9+BFu0
	hkzfD+oFvl15a+SgMGeDz7vMNsZP3GnjT4w5/G4Tp0xAZ64iPnQ==
X-Received: by 2002:a05:6000:25fc:b0:489:bc38:9438 with SMTP id ffacd0b85a97d-491953d51e0mr1772984f8f.29.1793868240105;
        Thu, 05 Nov 2026 00:44:00 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:59 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 40/60] libfyaml: Link with libatomic on targets lacking 64-bit atomics
Date: Thu,  5 Nov 2026 09:42:59 +0100
Message-ID: <f4a481233f479d85be4173bf77f62038740e67d0.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:44:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249499
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <raj.khem@gmail.com>

libfyaml uses 64-bit atomic operations, which need libatomic on 32-bit
targets such as riscv32, otherwise linking fails with

  error: undefined reference: __atomic_load_8
  error: undefined reference: __atomic_compare_exchange_8

Match on the relevant TUNE_FEATURES (32 for riscv32, armv5, o32 for
mips and m32 for ppc/x86) to add -latomic.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit bea66b4bceddada3ac2fb63e1f7fa1afb500b19b)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/libfyaml/libfyaml_0.9.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb b/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb
index 4c3fe42891f..012ff7052d9 100644
--- a/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb
+++ b/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb
@@ -13,5 +13,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libfyaml-${PV}.tar.gz \
 SRC_URI[sha256sum] = "a59cc3331e2eb903ec36933ad52a45888041cac31e44f553a00511131242c483"
 
 inherit autotools pkgconfig github-releases
+# Specify linking with -latomic on architectures missing 64bit atomics.
+LDFLAGS += "${@bb.utils.contains_any('TUNE_FEATURES', '32 armv5 o32 m32', '-latomic', '', d)}"
 
 BBCLASSEXTEND = "native"
