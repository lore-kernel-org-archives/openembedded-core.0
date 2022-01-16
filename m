Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Tim Orling" <ticotimo@gmail.com>
Subject: [PATCH] python3-hypothesis: upgrade 6.34.1 -> 6.35.0
Date: Sun, 16 Jan 2022 10:04:11 -0800
Message-Id: <20220116180411.3284995-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>

6.35.0 - 2022-01-08¶
This release disallows using typing.ClassVar with from_type() and register_type_strategy().

Why? Because ClassVar can only be used during class definition. We don’t generate class attributes.

It also does not make sense as a runtime type on its own.

6.34.2 - 2022-01-05¶
This patch updates our vendored list of top-level domains, which is used by the provisional domains() strategy.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...ython3-hypothesis_6.34.1.bb => python3-hypothesis_6.35.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.34.1.bb => python3-hypothesis_6.35.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.34.1.bb b/meta/recipes-devtools/python/python3-hypothesis_6.35.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.34.1.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.35.0.bb
index eebca576315..246ff84f61a 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.34.1.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.35.0.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "5002ce1f27fd94b53b0046ac7d20dab17fd74ebc6c90d401979588eadc46f84e"
+SRC_URI[sha256sum] = "ce3961fff61e7353d022608788cbc9876c293d2468749eeba27511adc9565131"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.30.2

