Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2931.1794165934385807238
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2026 11:25:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: roosesweb@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a208d93758so2055115e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 11:25:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165932; x=1794770732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RZr2J9IQT5nGrlrfk3tJS0GONJvZHArIJzHQ456x3Xc=;
        b=yOK8Zpwhm1SdvqqfUieNK3zIrNjo2xCV0bCSxOMISxx/Qpmd/UI2ZEhhKL9Izd7lyX
         OvJUnktZTXphLSMY+mRcNuluuJHQr9sYBS82WSsOTc77lneoxSW0ttuLGCJ2D+pKh4BV
         /3qkrl0w79UF6rpTdsQWhRcibFP6v7M9fQ6nU378hJsUiFAkMQVPoQq+EJE69i7K2rhz
         HubMnG+7eRceqRozB5KLHOjAMSygjnXd5jNMnDdrqnXNl8rSVNIHlt9HgjjAe+ga9uhN
         3OFglo0TXe/GqvndcW7yb8TZgablFb8D36D7YjrfcmU7PCoQ7JjEUI8Uv6R76VN5MwV1
         3cMQ==
X-Gm-Message-State: APuU4Z8ZV6ZRmxHiKcYvuTAGk0X5L4o0BthUJ+jv0G9WA+JDhpjG/woI
	AGX3hWjp0Iu76RzSa3PNsqKIIrEOSjPPDbhJfmtaek27RMNJ0p7VpsRFBvwGlQ==
X-Gm-Gg: AYBFou2MGvGBNAUGzSJKoWlM7Jcyutdl6JPmtKiIyLznhJGHadOEBjsSSJd1esrDkxm
	O3K/UpYdy1BPK8ZsYryN7l0kN3NdYWgfnTy48Pirni/6Z2kqnyDmozOQRrlz9O1KTyN/TUW8ASU
	Ny8saSG83IdMrEmifFBTUdJXyFrukNCYbIdx1YBLR4w9v0Dh8V39L7PXSqnxKKV6V5+xMn9SMbn
	HgKdcov2vWitEH7pxl+rXY3mhenf5TY2AHK1T0u2TZf5dZEAgwOovXmcSWyNbnB24q0Seh0sRfv
	ed1edh9TQK2gkMUG0VtKKScOEnhyTnf7i3+8MVmm1qO7H47KpbMmUKIvN0/bOMpwuxGWY97tUOh
	Ml2/vDuZkDvHo4mj7qlFHtw/WXsn/4ZGKI5gWz5opSNi5Of7A5VcEydb7dTeGun0i/apmZUb4ou
	8t0yAvsdNJ3TwqwluX8W+qrESpiro7sShWyTXgfgO+s/W513vzCEnj0B3pgro8pTiUt0YEjQJfI
	a78k4UO17J5l7YqoH1tx5gRkKA2906SKH5WPUE+/6YybR8ELnoOrBmy52HRk84XoNOK24zBh3dL
	ueR3+x8dQRNg9WySsprwBgQMN4B3Mf+Xe9xkeisTvAKtj2zIXZwHk8WwpxpHsZgTdJ/7dD/nsOX
	1hADAWjtBAcSu9gSKfWzgYeB7E4jOTsRCv9REQqyL05GoO/Tpt+SCnGKeXg==
X-Received: by 2002:a05:6000:22c1:b0:48d:eec6:308b with SMTP id ffacd0b85a97d-4958a9b260amr4952367f8f.21.1794165932345;
        Sun, 08 Nov 2026 11:25:32 -0800 (PST)
Return-Path: <roosesweb@gmail.com>
Received: from mother.tail4535.ts.net ([2a02:810d:ae08:d00:e5a9:b4b9:ba2:5901])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm5453136f8f.7.2026.11.08.11.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:25:32 -0800 (PST)
From: Thomas Roos <thomas@roosesweb.de>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Roos <thomas@roosesweb.de>
Subject: [PATCH] python3-cython: upgrade 3.2.9 -> 3.3.1
Date: Sun,  8 Nov 2026 20:25:25 +0100
Message-ID: <20261108192525.1082675-1-thomas@roosesweb.de>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 19:25:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249763
Content-Type: text/plain; charset="utf-8"

PyAV 19.0.0, which Home Assistant 2026.11 pins for its stream and
generic camera integrations, requires Cython 3.3: its generated code
uses __Pyx_BEGIN_CRITICAL_SECTION, which Cython 3.2 does not provide.

Refresh the line numbers of the build path patch for 3.3.1.

License-Update: none, LICENSE.txt is unchanged.
AI-Generated: Claude Code, Claude Opus 5.5
Signed-off-by: Thomas Roos <thomas@roosesweb.de>
---

PyAV 19.0.0 (needed by Home Assistant 2026.11) requires Cython >= 3.3.0.
Built with this upgrade for qemux86-64: python3-av 19.0.0, aiohttp, yarl,
multidict, frozenlist, propcache (with its 0.5.4 upgrade in meta-python),
numpy, pandas, scipy and uvloop. python3-propcache 0.4.1 in meta-python
pins Cython ~= 3.2.0 and fails with this patch; the meta-python series
upgrades it to 0.5.4, so the two should land together.
Checked with bodnuti: patchtest 10 pass, 0 fail; no new findings.

Related changes for the Home Assistant 2026.11 upgrade. They belong
together and are meant to land as a set:

- openembedded-core: python3-cython 3.2.9 -> 3.3.1
  https://github.com/thomas-roos/openembedded-core/commits/ha-2026.11
- meta-openembedded (meta-python): two series, fixes (6) and updates (13)
  https://github.com/thomas-roos/meta-openembedded/commits/ha-2026.11
- meta-python-ai: 7 upgrades
  https://github.com/zboszor/meta-python-ai/pull/46
- meta-homeassistant: Home Assistant 2026.3.1 -> 2026.11.0
  https://github.com/meta-homeassistant/meta-homeassistant/pull/207

AI disclosure: the patch and its commit message were written with Claude
Code (Claude Opus 5.5), as the AI-Generated tag says. I reviewed the
change and ran the builds above.

 ...1-Replace-not-predictable-build-path-prefix-with-hardc.patch | 2 +-
 .../python/{python3-cython_3.2.9.bb => python3-cython_3.3.1.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-cython_3.2.9.bb => python3-cython_3.3.1.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
index 573a53ee56..9481b9c16f 100644
--- a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
+++ b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
@@ -56,7 +56,7 @@ diff --git a/Cython/Compiler/ModuleNode.py b/Cython/Compiler/ModuleNode.py
 index 34f1b32..b09350b 100644
 --- a/Cython/Compiler/ModuleNode.py
 +++ b/Cython/Compiler/ModuleNode.py
-@@ -877,7 +877,9 @@ class ModuleNode(Nodes.Node, Nodes.BlockNode):
+@@ -899,7 +899,9 @@ class ModuleNode(Nodes.Node, Nodes.BlockNode):
          code.put_generated_by()
          if metadata:
              code.putln("/* BEGIN: Cython Metadata")
diff --git a/meta/recipes-devtools/python/python3-cython_3.2.9.bb b/meta/recipes-devtools/python/python3-cython_3.3.1.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-cython_3.2.9.bb
rename to meta/recipes-devtools/python/python3-cython_3.3.1.bb
index 3457a91490..49f1e83cb0 100644
--- a/meta/recipes-devtools/python/python3-cython_3.2.9.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.3.1.bb
@@ -7,7 +7,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 
-SRC_URI[sha256sum] = "d249c9022ab13286b17bd66f30609e800c5f95efeecb06168990c7a66cecde6c"
+SRC_URI[sha256sum] = "e0e45989e821bef6aa9ae15c7d583ab5e055f7406c4b3624e49e06d24e90375a"
 
 inherit pypi setuptools3 cython
 
-- 
2.56.0

