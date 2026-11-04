Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3449.1793750802734086961
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 16:06:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=FRlkKZ/G;
 spf=pass (domain: konsulko.com, ip: 209.85.216.46, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so153982a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 16:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793750802; x=1794355602; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QLSlCqjgjc9HeOKNswVsGYYSGgtNRl6bbcpseGUmw4c=;
        b=FRlkKZ/GAt7iUWXgxN4OFd0oi4pti1KY0/tpUO1ATq1OOHxN9abfc11Dn8w5Br3XNh
         rloKR7vpISaEXBZrQVYfGQuyNkt8sYDZB4RHMI/OrCD8Csg525xXcodlccHqAnldd7jv
         pY3f7nvvpN99Iv2KZEY+Xmvm+Rkmx5z7MFOmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793750802; x=1794355602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QLSlCqjgjc9HeOKNswVsGYYSGgtNRl6bbcpseGUmw4c=;
        b=pNnbVDLLMPxDmmomAao6tcYLoIJ6zdr2oKPj3OtwMVr8+jrbGNBtOx6JDGhXaK9Fpa
         RlfG/gmxuAVOd17lCpNe8zxMPmMKKEuJ8+nvG0HIvqNT23tajLgJQrNBmXaiN81HodwB
         VcCXm+BChCrxIzbNiaQUZXOpFkG2uVmzrQyPO8Li4ya9MZ9lQgeEG/FiJu3aPdYKmJfE
         Ira+3ZRs6lbFACrxHVXlmkm6EZd1P1fTqE4OBL6BztT99gcHUYLotaYjo0PnLnze6qxX
         8mq0/jXqIzRtjY5LOqFBN/4ROYjwhdUYPkTDpWAEkzEjxnDAMiLbjpVkfZu+JzYgyLAU
         BpBQ==
X-Gm-Message-State: APuU4Z9h0+Lp3XR0RuKhT/QZscTygodHHnc3vzRHN6iZAlvMSVyvWHLU
	Ge+LXzixYTfyd8hrztq9vmuiASgb8nLYwZjZjT4gH2BuniN9dI47ki7+/vSpZkawSOs6zKMdYsy
	TDppN
X-Gm-Gg: AYBFou0YbJGzSuC+6dLQmBwjRZFu3ROS26FzHSErozQ31M97SrrnyspJWP2axv5HJU9
	1lq0oXZNo0yOOVc9uLR3sFS7RKsm6Pbr7TJIQFfd6QIe1HL1mINThl2jCRekMXmzln/YqQEZHfJ
	J8E92RpP2q551i2XX/qLj1fXSIo7H+sZxlOZVKVTxuZpXa425jydkc0bSi3aEdmE6OOo0fjNRRj
	yY5bcse/gkOEYSo6OqABaAPJLelUEMPIS4CDV7CHmNBef6HBs5zGRSkZT8hACBb7GlKu2Rm//6E
	1EPflpUacqrJ8D3XOpzeMT6B7TWNzM7xnNOfceyobKUuOwLKYMrjGJzbymZPoPhCFmBRuDjAyd+
	w0DikCq5sXf4rRJ89id6CvCyvQ0GuBqbpxuKxai0U3tTL+fF54iCspQAJSMQEfGoPLZ/liMt+Pv
	KpuWdntAe2qqkGAF1m9gvW2JsYYdxdGZI18cZoR2PWZWfCS0gXXG9H+pTU+yAxTcKuS3raYADIh
	V6YW/YOrjiKyWzWZmXPL7+teD4ovnEqMqL92P1xvj7PPQxJaIKBL4A9F7EUhRu345tbPr7f14kP
	UgbmBKZMS8tCzFk6Vs2UtJhzGveulQuNfkoK1odT47wMqy0y5Pqp3ic4D8mE9dQxTQH5O6d0UT4
	X/S4OUg81haidt1L6ro03rSwZto0=
X-Received: by 2002:a17:90b:5686:b0:3ac:9c37:9430 with SMTP id 98e67ed59e1d1-3ae89724b1dmr12188501a91.21.1793750801967;
        Tue, 03 Nov 2026 16:06:41 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from thetis.home.local ([2606:c800:6024:2000:d453:884b:8607:3eb7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed088a624esm588985ad.0.2026.11.03.16.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:06:41 -0800 (PST)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: tgamblin@baylibre.com,
	Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v3 3/5] python3-uvloop: upgrade 0.22.1 -> 0.23.0
Date: Tue,  3 Nov 2026 16:06:27 -0800
Message-ID: <20261104000629.3345377-3-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104000629.3345377-1-tim.orling@konsulko.com>
References: <20261103193829.1806542-2-tim.orling@konsulko.com>
 <20261104000629.3345377-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 00:06:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249311
Content-Type: text/plain; charset="utf-8"

From: Tim Orling <tim.orling@konsulko.com>

Upstream replaced the wheel build dependency with packaging.

https://github.com/MagicStack/uvloop/releases/tag/v0.23.0
https://github.com/MagicStack/uvloop/compare/v0.22.1...v0.23.0

Tested with core-image-ptest-python3-uvloop on qemux86-64 and
qemuriscv64.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v3: none

Changes in v2:
- Drop the test counts from the commit message

 .../{python3-uvloop_0.22.1.bb => python3-uvloop_0.23.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-uvloop_0.22.1.bb => python3-uvloop_0.23.0.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-uvloop_0.22.1.bb b/meta/recipes-devtools/python/python3-uvloop_0.23.0.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-uvloop_0.22.1.bb
rename to meta/recipes-devtools/python/python3-uvloop_0.23.0.bb
index e414f2b470..3aa5e2fbe9 100644
--- a/meta/recipes-devtools/python/python3-uvloop_0.22.1.bb
+++ b/meta/recipes-devtools/python/python3-uvloop_0.23.0.bb
@@ -5,13 +5,13 @@ LICENSE = "Apache-2.0 OR MIT"
 LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=bb92739ddad0a2811957bd98bdb90474 \
                     file://LICENSE-MIT;md5=489c8bc34154e4b59f5c58e664f7d70f"
 
-DEPENDS += "libuv python3-wheel-native"
+DEPENDS += "libuv python3-packaging-native"
 
 SRC_URI += "\
     file://0001-setup.cfg-use-system-libuv.patch \
     file://run-ptest \
 "
-SRC_URI[sha256sum] = "6c84bae345b9147082b17371e3dd5d42775bddce91f885499017f4607fdaf39f"
+SRC_URI[sha256sum] = "28d160f51ab4da3b187063652e643dea6831072add4adc1e6d62afbe73b6be27"
 
 inherit pypi python_setuptools_build_meta cython ptest-python-pytest
 
-- 
2.47.3

