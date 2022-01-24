Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Tim Orling" <ticotimo@gmail.com>
Subject: [PATCH 1/4] python3-hypothesis: upgrade 6.35.0 -> 6.36.0
Date: Mon, 24 Jan 2022 11:49:05 -0800
Message-Id: <6ee01480f22b445f568750b9c7a103ad4e485db7.1643053417.git.tim.orling@konsulko.com>
In-Reply-To: <cover.1643053417.git.tim.orling@konsulko.com>
References: <cover.1643053417.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

6.36.0 - 2022-01-19
* This release disallows using typing.Final with from_type() and register_type_strategy().
  - Why? Because Final can only be used during class definition. We don’t generate class attributes.
  - It also does not make sense as a runtime type on its own.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...ython3-hypothesis_6.35.0.bb => python3-hypothesis_6.36.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.35.0.bb => python3-hypothesis_6.36.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.35.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.36.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.35.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.36.0.bb
index 246ff84f61a..3918d7d15cd 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.35.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.36.0.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "ce3961fff61e7353d022608788cbc9876c293d2468749eeba27511adc9565131"
+SRC_URI[sha256sum] = "2b9c56faa067d660f0802679689f825bf142eec8261ab9e2e6ea916b1d8278a1"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.30.2

