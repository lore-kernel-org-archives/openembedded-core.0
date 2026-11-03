Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2910.1793734870995764568
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 11:41:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=SGuDCDpJ;
 spf=pass (domain: konsulko.com, ip: 209.85.214.171, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e60f9af6e6so42497855ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 11:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793734870; x=1794339670; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PqEYd0UGztRPCa/l3VEqQlRlXgOa0QMhVyEmhqplbB8=;
        b=SGuDCDpJrGn3Y8qwm0Hgb6zG6pnZWBmV8vb8XR+Myf2ig8rU1chog5tZTpKDDHX+Xw
         cLiBrYE2iJar3lUZ7FkgGOnUK4CUCr0ks+GZwrrBrae0kFEXiuNFCZhCo3MzUa1A37nE
         jVHXN61JAgMA7s/rQHzCRQenVGG/ezCfdVcUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793734870; x=1794339670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PqEYd0UGztRPCa/l3VEqQlRlXgOa0QMhVyEmhqplbB8=;
        b=Yn+DFUU0FtpEjzZP6GTvfQVitppGKPm/dImfEJXM8jNBLHAbQeomrAz2tBnKwEiSxW
         UtHHyKeu//UolEmviOlWpuft6EeZI7s/HTddzpHtrjPhR5He7zOCbYkOh2zhK9d/61gM
         wAc85NYAJSL38Hg8N/jdWfT4AB+ohVwaWnheCcqEzkb9K/N14e1gkHJPCY0ulIqSyROp
         9RRyLgrZdDWGPCZUsUoYeRa1p1ilyQbUIuJsyHBw4ZRjsc0Wkgo8AW6Nw5MhgXTz9kN/
         X+WkVnbPvSrtmm9rZTGGRpLPWWPbW7LSvguhE7nfr9sTWKenCA0WrG6V/HJQtc8JX/DU
         z85A==
X-Gm-Message-State: APuU4Z+4d0QIKcy6BGND3Sdn6t3WTS7U/5erj9N2vRmrpdOgqnPkt5bS
	fMwWkyo3LVH6KjxRpcJujicwyvn5WR9pZCKSzOltEsAB8xZvEXHXhHM1NfS9LInbxO3kWv8E5cc
	KrVbt
X-Gm-Gg: AYBFou2BaWtApWXO3OxAKFteUUEbXi0Nyyuoi6cgS4QquScTZsVtGT34kht1MNozRJA
	JrwflCzOrUzYdnTqtXW/I6Oxl61Vnz9d2ZSQMJ3EFZCn5ymmmrMjxPy5QiBx5ixAfhdHesreGfX
	vxQvrmCN/cYLM7ZC48loB1x2mLBAHP8AzmZf6AOkoa+LD026XhGIJJpML+43i6cK8qdCoyoOCPb
	Ame+hD8fHwWfNLf++FDXPlYEFoZeVXYrYGBnqVU100iy6qs8HsWWUj20p4WM72HWfL/IjplrNth
	npg9pHqqi6pYI5LcmM4PUPHiB7dLk2zd6eyLnIgybA5Uqqy5CyrSpJhz+Je7+gSaZVHv/wgWXaj
	d8Xro64CCtJ66A0wcU9YxS3C7/QrUbjxU7ufWaVUm/eTDH0I47p/TpHeNduZG7lQVxxWh7wRcM5
	fiuZXK8VsueRzkG9jEuzEXc0dHFa5eZeS0agUiWTvSckcBL+woJc9pdL56muv3S4ntDxyxo+yBB
	0OHyOq9Kyed9+wTZ1p8dGqQ+gqkpwC0OazTMobGXRE3oz5/juKWrXswB95+G0+Yj9EoML8Fqr4w
	s0LPg6N53aOtSyFL0Nn7wRrhcpyQq82oIquGosc9mhuXASofX0ujGBGPPYz1nSCYE0pWwCXM8Bp
	RHn9CtUXhxIVEQodNfLoKPKkv5LM=
X-Received: by 2002:a17:903:144b:b0:2e9:42d8:48d3 with SMTP id d9443c01a7336-2eb364d2529mr135340205ad.36.1793734870417;
        Tue, 03 Nov 2026 11:41:10 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from thetis.home.local ([2606:c800:6024:2000:d453:884b:8607:3eb7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052ec9sm44562375ad.6.2026.11.03.11.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:41:09 -0800 (PST)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2 3/5] python3-uvloop: upgrade 0.22.1 -> 0.23.0
Date: Tue,  3 Nov 2026 11:38:30 -0800
Message-ID: <20261103193829.1806542-6-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102011816.3710992-1-tim.orling@konsulko.com>
References: <20261102011816.3710992-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 19:41:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249294
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
Changes in v2:
- Drop the test counts from the commit message

 .../{python3-uvloop_0.22.1.bb => python3-uvloop_0.23.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-uvloop_0.22.1.bb => python3-uvloop_0.23.0.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-uvloop_0.22.1.bb b/meta/recipes-devtools/python/python3-uvloop_0.23.0.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-uvloop_0.22.1.bb
rename to meta/recipes-devtools/python/python3-uvloop_0.23.0.bb
index 39b6a2602a..7321429483 100644
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

