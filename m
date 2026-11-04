Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3447.1793750797322547467
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 16:06:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=oodw3YDL;
 spf=pass (domain: konsulko.com, ip: 209.85.214.172, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e9d7791b00so881315ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 16:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793750797; x=1794355597; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AUw70Yge+8TVjO1iMgrrsL9pycDODoqX4oTggk2Qx4E=;
        b=oodw3YDL9O2cQe5b0Qgi67/seyIw0NOODv702l3YT/yWNVnWVLtF/+teqWFsnDznHf
         wXjHFQPOBB/HfYcAa1rfEO5R+VJ9NCiBqV/4925ZBXYTVKzpew8Uol4DIHKRrx1wW8Wc
         c/8YxGElQJMYV5BQXjPkyRKy5c+liz19LAn3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793750797; x=1794355597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AUw70Yge+8TVjO1iMgrrsL9pycDODoqX4oTggk2Qx4E=;
        b=QGFp/R6DggjH8klN1GptqP3Hb82e5T87wnWGFoVYMcNpRdN4T5uyXCqZ8cUJnPvcxk
         WvEFL/e8XAY1DdswPAxXZuA69dLhvU99WUWWRCrbdU+wdMukSM/zJHR0Qiq9Sg/Nd2kn
         6MKFr6G+2vewu4phu1XBjmXvQJiHeW09wK0plJIoynYj3dZqmrp4gEGFgFv1Ot2hvccF
         ckjLDoQKfLFlC2VJKStNih6xWg/B8pB91V5Bk3KIkr32aI6EcVl/cL17wOcurw42NIws
         cQH5m5UF4/goUMStW0MVaNE79Jk7s4tCbmNoqtmgMDrT5d7E/n59hNxFgC6nuua7BbXM
         p6EA==
X-Gm-Message-State: APuU4Z8Jy/ik5a/wSdLbRP/4TFIpZfR7k+hJOq71pdHI9D107ugCvta7
	rONJLKbyGFMhgu2zf71Vz1p9vnO5xl6kGwmZYepp/7eL+bv2+i8AakpWKpSdiCRqYFxIYESGukF
	TLc1O
X-Gm-Gg: AYBFou3MfgH5vInDz7ba5a/EPaE9as93MxK2mKvG4bq/lXc6o6aDNxTSvHR4chP0tbL
	5vkGj804uZqp4r8w0fbK+nuqvzKl2tvid1QJyU4lUm/w9wGCAnexydWJa5xY+Gji7t0TU4dXzsL
	wUpGcmgQ0PNBVHl/52VR5XcP2vqif2i+sm+ptDv694A4KDdpDZ9sepTICqh0eDUrT1GqMI466ND
	czVpBNiIfQfniKrLLUjzAb8iuT/eeGpCi0JCUBrp23k81Xgk26R1aDOa4TcL8DhuQbifoB+3Vwg
	qvX4EDL4Hk8STQT3/TBnNdz0bZZkkQmNoHyTpbHDgx90rTYAip39S822/1VlGuKCFdzxmsAeEgu
	DGbjwDXhWDBVz7qzAfCh/RDpKkyaxLnTDu1a2lMM6bVI88FvmiOQxaErTTs1//PEnluTmn72/u4
	PUM1YTWhbT8WEcXyyQTSr9Hi+9HjR1X69K1roJd2ikt41QaFqBQ7K2kxSkGhgaio+Rx5M6Tkx5q
	CBz0/wdfbqh3LLyp+jhLYsAd5HcfjnbfLd1v1GuvBEPWWV9AAg7hWs+XvdWEK1VrDHx2KgK6E+P
	DE8uZVOP/RGrA5IAYFFbcBeCjIiSR+YgXqd71yHrnACyBjFi18OlGT7pte86K/+55v3sZSsaFJu
	fFpmmIYyDGOHUdyFhhOUBuZt/bC8BF/nalgWbzkxamR5Ihd91
X-Received: by 2002:a17:902:e74b:b0:2e5:70cd:b606 with SMTP id d9443c01a7336-2eb364f2b71mr134960955ad.56.1793750796550;
        Tue, 03 Nov 2026 16:06:36 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from thetis.home.local ([2606:c800:6024:2000:d453:884b:8607:3eb7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed088a624esm588985ad.0.2026.11.03.16.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:06:35 -0800 (PST)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: tgamblin@baylibre.com,
	Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v3 1/5] python3-uvloop: import 0.22.1 from meta-homeassistant
Date: Tue,  3 Nov 2026 16:06:25 -0800
Message-ID: <20261104000629.3345377-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103193829.1806542-2-tim.orling@konsulko.com>
References: <20261103193829.1806542-2-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 00:06:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249309
Content-Type: text/plain; charset="utf-8"

From: Tim Orling <tim.orling@konsulko.com>

uvloop is an asyncio event loop built on libuv. The python3-websockets
test suite exercises it, so bring it into oe-core.

Changes from the meta-homeassistant recipe:
* Build against the oe-core libuv recipe through setup.cfg, instead of
  patching setup.py; drop the Cython pin relaxation, since ~=3.1 already
  allows Cython 3.2.
* LICENSE is "Apache-2.0 OR MIT" (dual-licensed upstream), and the
  vendored libuv licenses are dropped since it is not built.
* Drop aiohttp, psutil and pyopenssl from RDEPENDS; they are only test
  dependencies. Add python3-asyncio.
* Move the maintainer entry to maintainers.inc.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
No changes in v2 or v3.

 meta/conf/distro/include/maintainers.inc      |  1 +
 .../0001-setup.cfg-use-system-libuv.patch     | 21 +++++++++++++++++++
 .../python/python3-uvloop_0.22.1.bb           | 17 +++++++++++++++
 3 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-uvloop/0001-setup.cfg-use-system-libuv.patch
 create mode 100644 meta/recipes-devtools/python/python3-uvloop_0.22.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 74db3e44e9..0b2b8c5b8a 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -750,6 +750,7 @@ RECIPE_MAINTAINER:pn-python3-unittest-automake-output = "Ross Burton <ross.burto
 RECIPE_MAINTAINER:pn-python3-uritools = "Marta Rybczynska <marta.rybczynska@ygreky.com>"
 RECIPE_MAINTAINER:pn-python3-urllib3 = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-uv-build = "Trevor Gamblin <tgamblin@baylibre.com>"
+RECIPE_MAINTAINER:pn-python3-uvloop = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-vcs-versioning = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-vcversioner = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-wcwidth = "Tim Orling <tim.orling@konsulko.com>"
diff --git a/meta/recipes-devtools/python/python3-uvloop/0001-setup.cfg-use-system-libuv.patch b/meta/recipes-devtools/python/python3-uvloop/0001-setup.cfg-use-system-libuv.patch
new file mode 100644
index 0000000000..d295239b90
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-uvloop/0001-setup.cfg-use-system-libuv.patch
@@ -0,0 +1,21 @@
+From: Tim Orling <tim.orling@konsulko.com>
+Subject: [PATCH] setup.cfg: use system libuv
+
+Build against the libuv recipe instead of the bundled copy in
+vendor/libuv.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+---
+ setup.cfg | 3 +++
+ 1 file changed, 3 insertions(+)
+
+--- a/setup.cfg
++++ b/setup.cfg
+@@ -1,3 +1,6 @@
++[build_ext]
++use_system_libuv = 1
++
+ [egg_info]
+ tag_build = 
+ tag_date = 0
diff --git a/meta/recipes-devtools/python/python3-uvloop_0.22.1.bb b/meta/recipes-devtools/python/python3-uvloop_0.22.1.bb
new file mode 100644
index 0000000000..887c262ae7
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-uvloop_0.22.1.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Fast implementation of asyncio event loop on top of libuv"
+HOMEPAGE = "https://github.com/MagicStack/uvloop"
+BUGTRACKER = "https://github.com/MagicStack/uvloop/issues"
+LICENSE = "Apache-2.0 OR MIT"
+LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=bb92739ddad0a2811957bd98bdb90474 \
+                    file://LICENSE-MIT;md5=489c8bc34154e4b59f5c58e664f7d70f"
+
+DEPENDS += "libuv python3-wheel-native"
+
+SRC_URI += "file://0001-setup.cfg-use-system-libuv.patch"
+SRC_URI[sha256sum] = "6c84bae345b9147082b17371e3dd5d42775bddce91f885499017f4607fdaf39f"
+
+inherit pypi python_setuptools_build_meta cython
+
+RDEPENDS:${PN} = "python3-asyncio"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3

