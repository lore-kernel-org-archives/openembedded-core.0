Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3712.1793582305882917356
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2026 17:18:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=eE/uGpew;
 spf=pass (domain: konsulko.com, ip: 209.85.215.177, mailfrom: tim.orling@konsulko.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so375398a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2026 17:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793582305; x=1794187105; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4BXsJmRqcszmU8iMz/WHYgcrak5q5ilcLdCF72FMDn4=;
        b=eE/uGpewqmYyTEWGEu5WMKL2f6Q4eslchMG+Nzd1zWYwvraz6cIFTvGnsO+whMklts
         gayoKv5jJXz4gJleocs2+4JY5SXqheWET0v7F4vwmM9menlPEu7J6cHbhAKLsxUwT/3Q
         SIaumW6UufMe67NjvBRKqaGxnREqACD7JxLYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793582305; x=1794187105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4BXsJmRqcszmU8iMz/WHYgcrak5q5ilcLdCF72FMDn4=;
        b=h9s6dTim2kVREKRYDvY42+Wm2PQvC0JDj6J0vj3Pe3AA9D2bmU0EzH1aOp/aoezS5b
         kkFSOaKNmxFRmZTiPLMB/IMRUBOT3F0/CYjzm9mowG+d5+ZTaASqEy51Gx3/eaFaq3kw
         9oo7AqwXbzp+Dob7nThhKrw02lBnFB3V4p+L0FHAoiSedVzqYoqlj4PjMsvjk6EYp+uk
         uMLp6nbeh+PZO6QU+aniyx4NEEnQzGSguV9SKd/6bnB7YQjPnXljufbpwqN0pV884r1M
         Hnf+EjMc+y7NaTLnwv8N+YYsvN85cPMEoZC+Io9Xwxnwg8S5SW+He0L9cuoGGCncGFJo
         zPeg==
X-Gm-Message-State: APuU4Z/uY2O9Jo+pMQSTZ2vGmMAmCuuIIOC6ONRa4g1xVBKmh1Ua+wvv
	nXiMqdy8uipGpajrbN2ZmGhhSvpjsdEOt9mrLKCzjKk1zBeh/pja9lWExCb+9a3WkuPU9ZG+P2c
	56jM/
X-Gm-Gg: AYBFou3BqveWeN8zOwQgdtv7Efe0tsqAd80xXFaFwsMgLbsfJe+cZpRhY85U5XK5AMT
	wuK05AhUd3aiGm5d3XiuyGDdxB7ADD8qBBR6UI9k1KLJJjTOWYU+amuSau4vRNtGg0hzVrMZ5ln
	+huJbloL8eCqed9KtYrMiCnYiDCWrW3Qn4ShzhE7H0k1GewFGVu+JYsQ+d+L/6uofySjZXWmIZL
	JgreVeypaLbRsm3uupcCUaRyJU2iwpFdLrSyEqEWPfvmQqErVxLde0kTuNgYl85ZqDKY0Jpk809
	P9GQyAYCu40MRIIw5LrXXzIpAzZEtRWV/xdrYQgJna0KlneQuVzX+Rfczqmj0ZdMBfNPP+662Ao
	6p0zCK0sXzGmZQ78z1XfMI6foVL4vTP0nb2Dx5PGvl8WSzINPOsDCDr+5umRhxXuyhqYoswntLw
	LRo9YUXxuBO9ZqVdOtxsb/xq3nJ5gr2U1Qqlhc4sLS+EKs6iFMNhI+4fOOu86uCJqPbroWhzUdL
	Qg2/r63uGeeq9QWZiTmR5IuvcbOHKNSl9yv2HfHsbr9Ttqu52xBMbEAbImV4S4PlSgO7uUA3Fnr
	dEEpuB2mYzMvFbT5/0lNmTADHzBTliBP8kKtUV4JAbzFlq54lkEaIyi/bFtJ3WskfaMjkoSTVJ/
	uZf2VXDHFvKRr1pNiGv33qozEiw==
X-Received: by 2002:a17:90b:2e90:b0:3ac:86a0:5764 with SMTP id 98e67ed59e1d1-3ae898311b8mr6374652a91.64.1793582305114;
        Sun, 01 Nov 2026 17:18:25 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from thetis.home.local ([2606:c800:6024:2000:9eb8:9e38:131:9f02])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9426ffsm16436533a91.7.2026.11.01.17.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 17:18:24 -0800 (PST)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 1/5] python3-uvloop: import 0.22.1 from meta-homeassistant
Date: Sun,  1 Nov 2026 17:18:12 -0800
Message-ID: <20261102011816.3710992-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 01:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249165
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

