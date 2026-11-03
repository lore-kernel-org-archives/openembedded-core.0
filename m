Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2844.1793734751664963932
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 11:39:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=HL0WIdNF;
 spf=pass (domain: konsulko.com, ip: 209.85.214.176, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e9f6a16aedso27913335ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 11:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793734751; x=1794339551; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qLhyck6DGjG2GIrEerdAcp25xJ7nnc25KOWXIQqM7Lk=;
        b=HL0WIdNFwZxUpoPt5V8ajJM4FV5zgud0t47jPRpHQlehK4BJKMaB8WVW9tnoGol16t
         tNhLKvX8FyJEuHTb647WgZq7g9HTEtFWfXzDUZSkEtGYMvsBL9dSB6T/kklXByD8XaPC
         5PLRk9R6tYoaOdYwxtxZpg3/DXPRynAg36sIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793734751; x=1794339551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qLhyck6DGjG2GIrEerdAcp25xJ7nnc25KOWXIQqM7Lk=;
        b=2f48ba7Z1MiZl5QKtxHj3LlEMD3sJN8LF0qEkawIF4jd286QjC0ouqzc4IHMJGu4ca
         bZoJObP5DpKT10wTRD/EsqzYNOXlVHEIpaYN1bttNKtZ6X3hR7edC4ga+leZ6lfftLcb
         ARKVxxR94Dsg39WpGbrOLUKmeva5FagTlxQEn2sdMTj245CZccRGP0kNnmXVhPS9ItKB
         1MqGOKwTWAoPclSXJFZm17Y+OSZ9fv9mES5bVYsXNxdGUPO99m/Jwsa0iyDpKiCE4rFU
         InpwvMYIzxeF3EGE6btC79lAa9hnAw+wZ+atT/WuiDqyOBeb5GJslTamOWOhwwBkdEzT
         7gFg==
X-Gm-Message-State: APuU4Z/OgDdjKNSVmQfPOOdIsQ3XOfKtfPiXbLdh3Yuo2IpB9d5JHgpk
	hi1SmDkmJZ0lJ1clG/pNYhP1a+oz1Zu4tyoGlBe+XvaFbWIjeU3FQLVCAny+pcsrMAnLKzzSRtG
	OHH0i
X-Gm-Gg: AYBFou20sR/Mr3UyjSLmD9pz7qjZTRB5UlWixC8TlXuvdITzIYHjTh20OR8p3C4ziP+
	vfqP+tQdaJLxQCNWQC3BtBPK4eQWijNwSVCn7Jd3QA/qApvZ6cp5vNoywjq2RKAK5S/UfK/5JZj
	BiBGfTmRE30ZjAmquw7TPvsk+h0DOJTL1cCxgWL0bOg8w9dznWBuxnwNd56YjtVpvdimF6jDZRX
	vRtjNEzl4AmS61ymf0iQl7DdS4HTTDf12NxxVahAXqc3nhfu9lfzNnCEDOwNq2TF7y0qPVUYxHw
	ksDyJzqFL1UXvhdOnvn188O2jS3lvUyecpek4Snc0Ba/hlDe8UTlZJQJloSP16Gfkrrdo7aKAzG
	UYyBAComTAsKLtuu9Jgk0CcuEvcfkuHg19tFYAFnGj8mmpB7p55SF85M+2rC3yQdLJa/YEB0AWb
	FRvkmUzU0phGpaS9g0jp8qWfCXyhoEOJ+4sE9hV80xjDnxda7OyxMGAnpCkiMD4kedJM4AFoZOE
	t60V9Hw/dn6iHxHgtD2eNRcSX5mBd7QlvtI0Kiop79sSBup6cLS+fX7aXbJt6gAsWV9GBHXV5c8
	AZj6PGIG/1jXtkAykXyK8H6BusloO9NyT3FA1Qb0iU9FUerxGfpplmsiyCaolqJ68EgMrh3ki54
	cqXjHTUPDfHRPOp5XV8sOiRefGso=
X-Received: by 2002:a17:902:fd8d:b0:2e8:7686:4d46 with SMTP id d9443c01a7336-2eb364552bemr133563665ad.34.1793734750901;
        Tue, 03 Nov 2026 11:39:10 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from thetis.home.local ([2606:c800:6024:2000:d453:884b:8607:3eb7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052ec9sm44562375ad.6.2026.11.03.11.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:39:10 -0800 (PST)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2 1/5] python3-uvloop: import 0.22.1 from meta-homeassistant
Date: Tue,  3 Nov 2026 11:38:26 -0800
Message-ID: <20261103193829.1806542-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102011816.3710992-1-tim.orling@konsulko.com>
References: <20261102011816.3710992-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 19:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249292
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
Unchanged from v1

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

