Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5201.1794174170135589446
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2026 13:42:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: roosesweb@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so1942755e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 13:42:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794174168; x=1794778968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j8WT9m2bcPpHGU9OqCoEUYxlaH71ZS+quDZKtv0CzjM=;
        b=zpR9QYrgTc4I4zSiFS27dPXpI9+0QBFTWu/H63ImcBUOYtJTmHxxWEQHiRXINuBbOq
         ikJ/aglix77UiuyNna26awUQjTajxlyA00kBoxIq/peNZgzf8VgdRRBI96zTN08UyOSF
         Zy4f1hB1obj3CMOtPPFD2GfB/ppdN2OYjkJZZ/+7RVBn6biNLxg3Mq+YB2HjQLAfuUX+
         3e4nn+rFJh/+R5NnokiCy+vY9N+/kb+v5VT+lM1SNT44RNjh5/VLHi+KzCRTSP1IFT2z
         t6HwknHIsNohj9FDTeu0r/VGTHQMZutlN4qs3eJPZ36DHi4AKnfC0Cw6fRR7PMUKprF7
         SXYw==
X-Gm-Message-State: APuU4Z+CCgTGi3AJmj1/2vY2Z84XKSpyNT/VB9bDaCt5/NckE3lOcu69
	i6D0ettUrTD9t5XjRIq6e/pI2RNeRUrqdvx+bT2Dc7yLZeJpi7h0YMtYvB8AcQ==
X-Gm-Gg: AYBFou2vy7NipJtOtJiDvMVoqhMY4pZ1bxZkUaExq4ztfSURxkh3xDJsYHTjTgP5gNm
	y0yl9YgTyqTU+qvEmBff4WKekLczl70YkNI2DeadUyNDnOjRKD5+6X3NIFbByny9TsfU8/NqtGb
	jUrybRQvxFh3e675swQjkT/egK2OX0iJuH7gYSHy33wS4b4gl8SNqMRLEDHY1eo95XbF9ACTob0
	UVROcESlEpto9Wqvozl3f8LEnmpnvgtR/kjhCaEo2J+o+tRU9+hvXDwlxuhMeGTWOFmIidOQ0CX
	TBz4o9jsr3tgZGwfzYOhgaBUczjIBuS1YYNZWfTbWr3S1czdWnRptBEwP5wPWfaapS/43Yi81pU
	J6OmyCs+Jxzn/GEK0DLBhf4eXzhwxwgOaEvzOAI2sPUZpe/QAS6lHt8fkE+MWoSg0vNaKit0iOa
	CY59sKEQfY4E7klaYW69MfjUtXZHHdqIsWctR/AKW/m/wnKeqmcWxm8EM1R5rdUP6zo8TqKVcp7
	GHsuuTKxNjCv802SOLSjCSkIzArKMF3h5n0szaKWiucMrJEk4svFc3PiEpGpmv3pa0zZVblovX4
	uLr9rLS5OUwKtCEYzqOq2DHlDqez84vVV7xL3lSCP0mN4lVnubJt+HiIHILOvmQXYlyR/QtqAfx
	FEs9emPcMcpDu+qnQ7TfbqS/jrYuW0LaaMHH2Thc/xFpXq1zycpjHf0zOXA==
X-Received: by 2002:a05:600c:34cc:b0:4a1:de8a:603a with SMTP id 5b1f17b1804b1-4b960da49admr43903365e9.6.1794174168136;
        Sun, 08 Nov 2026 13:42:48 -0800 (PST)
Return-Path: <roosesweb@gmail.com>
Received: from mother.tail4535.ts.net ([2a02:810d:ae08:d00:e5a9:b4b9:ba2:5901])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597371cc4sm5894020f8f.36.2026.11.08.13.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:42:47 -0800 (PST)
From: Thomas Roos <thomas@roosesweb.de>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Thomas Roos <thomas@roosesweb.de>
Subject: [PATCH v2] python3-cython: upgrade 3.2.9 -> 3.3.1
Date: Sun,  8 Nov 2026 22:42:36 +0100
Message-ID: <20261108214236.1294076-1-thomas@roosesweb.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108192525.1082675-1-thomas@roosesweb.de>
References: <20261108192525.1082675-1-thomas@roosesweb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 21:42:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249776
Content-Type: text/plain; charset="utf-8"

PyAV 19.0.0, which Home Assistant 2026.11 pins for its stream and
generic camera integrations, requires Cython 3.3: its generated code
uses __Pyx_BEGIN_CRITICAL_SECTION, which Cython 3.2 does not provide.

3.3.1 contains the upstream fixes for the non-deterministic generated
code that held back the 3.3.0 upgrade (cython#8045, #7982, #8025).

Cython 3.3 still fails intermittently when it builds itself in
parallel (cython#7997; #8008 and #8013 are not merged). Clean builds
of python3-cython-native with PARALLEL_MAKE = "-j 32" failed 6 out of
20 times with 3.3.1 (and 8 out of 20 with 3.3.0), with the refnanny
error seen on the autobuilder. With PARALLEL_MAKE = "" all 20 builds
passed, so build serially for now.

Refresh the line numbers of the build path patch for 3.3.1.

License-Update: none, LICENSE.txt is unchanged.
AI-Generated: Claude Code, Claude Opus 5.5
Signed-off-by: Thomas Roos <thomas@roosesweb.de>
---

Changes in v2:
- Build serially (PARALLEL_MAKE = ""). Cython 3.3 races when setuptools
  runs cythonize in threads (cython#7997, still open; #8008 and #8013 are
  not merged). Clean builds of python3-cython-native with
  PARALLEL_MAKE = "-j 32" failed 6 of 20 times with 3.3.1 and 8 of 20
  times with 3.3.0, with the refnanny error from the autobuilder
  ("'__Pyx_refnanny_mutex' redeclared", "C attributes cannot be added in
  implementation part of extension type"). With PARALLEL_MAKE = "" all
  20 builds of 3.3.1 passed. v1 did not have this and would have failed
  on the autobuilder sooner or later.
  With cython PR #8008 applied on top of 3.3.1 the parallel build passed
  20 of 20 times as well, so the serial build can go once a release
  contains that fix.

Ross, this follows your 3.3.0 upgrade that was held back for
reproducibility and these build failures. 3.3.1 contains the fixes for
the non-deterministic generated code (#8045 via #7982, #8025,
0a948c7d). I have not run the reproducibility selftest. If you would
rather carry this on with your patch, please drop mine.

PyAV 19.0.0 (needed by Home Assistant 2026.11) requires Cython >= 3.3.0.
Built with this upgrade for qemux86-64: python3-av 19.0.0, aiohttp, yarl,
multidict, frozenlist, propcache (with its 0.5.4 upgrade in meta-python),
numpy, pandas, scipy and uvloop.

Related changes for the Home Assistant 2026.11 upgrade:
- meta-openembedded (meta-python): two series, fixes and updates
- meta-python-ai: https://github.com/zboszor/meta-python-ai/pull/46
- meta-homeassistant: https://github.com/meta-homeassistant/meta-homeassistant/pull/207

AI disclosure: the patch, its commit message and these notes were
written with Claude Code (Claude Opus 5.5), which also ran the build
tests above in my build environment. I reviewed the change.

 ...ace-not-predictable-build-path-prefix-with-hardc.patch | 2 +-
 .../{python3-cython_3.2.9.bb => python3-cython_3.3.1.bb}  | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-cython_3.2.9.bb => python3-cython_3.3.1.bb} (78%)

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
similarity index 78%
rename from meta/recipes-devtools/python/python3-cython_3.2.9.bb
rename to meta/recipes-devtools/python/python3-cython_3.3.1.bb
index 3457a91490..75cde4ef70 100644
--- a/meta/recipes-devtools/python/python3-cython_3.2.9.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.3.1.bb
@@ -7,12 +7,18 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 
-SRC_URI[sha256sum] = "d249c9022ab13286b17bd66f30609e800c5f95efeecb06168990c7a66cecde6c"
+SRC_URI[sha256sum] = "e0e45989e821bef6aa9ae15c7d583ab5e055f7406c4b3624e49e06d24e90375a"
 
 inherit pypi setuptools3 cython
 
 SRC_URI += "file://0001-Replace-not-predictable-build-path-prefix-with-hardc.patch"
 
+# Cython 3.3 races when it builds itself in parallel: setuptools runs
+# cythonize in threads and Cython keeps global state, which fails
+# intermittently (https://github.com/cython/cython/issues/7997, not fixed
+# in 3.3.1). Build serially until upstream fixes it.
+PARALLEL_MAKE = ""
+
 # No need to depend on self
 DEPENDS:remove = "python3-cython-native"
 
-- 
2.56.0

