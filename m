Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11931.1793806541095826404
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 07:35:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=g0GO5L18;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4e4a4d77e5bso1287413b6e.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 07:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793806540; x=1794411340; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k6HhJL9qpsmK5T5siTyfRkDD4MIqxFfeTZ9MsiurJnE=;
        b=g0GO5L186HFZZQCAQy+QPGoKHjd+05UXHpgCKre2w+dfK14PJ0unTqnmt3XHPihZQq
         AMIK7ZGrP8p4ZYLuQmfkBf1mdQwcFtxh3UxB1FK68JVvzo4HeyHR80Vi4J+XOFE9tPAb
         cJxGAdcu4UzH/kWZUV0Kksa8ZNuKX4VG19vVhOMfUoEcZAH00nHvlY6Z/IPHSQkI6I1Q
         jiQavSvPL/g13Jma4AQyY7yR5W6cCdg5Ne7BZLEias2R//DJHeBZaiQpcmwpPHNSHS8O
         jJzAfKKmGuWV0n77O8aF997S+ZqqT5JiPi1Y65/9KUpvHlhcKbMAzF0vWf8aFZYUATO+
         jdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806540; x=1794411340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k6HhJL9qpsmK5T5siTyfRkDD4MIqxFfeTZ9MsiurJnE=;
        b=uLB/gfqZTOZWa+RMEMl/4jBAFQ1ctkCyAOosk2Toqsgo52OjmJCcxZnZZCSfCSxRj6
         YfxO9TMhIdmclFB+y2PlYYrLrLiQFXIIDLX050Q6GL3PLpOj9zVhCjFQjkQynxmY1Otg
         t/910oFTJOYE8Qwi6yxJJSr2cHbNNE/JUjoJD2iZpjck8IDFXtpLs7dckKdUJsHFF7Cr
         IDovbZtFi+cB301GpYszeYeoB9Iy1HPXTItwSQuwIA/K5U11EENEbIdMLFl08Kp/fe59
         CDNuBamfSjcaI/5a/L9Ynn2BxPU8zcyR/84qGp6317/JvaTPlcPnPGIledX/ABlkUSad
         4OuQ==
X-Gm-Message-State: APuU4Z/jy2fRq5lWO6blpVp8P+zzGlZ7cQsfxXt9Y1gZFouHIrcHMBCj
	OkbJJVHOwG4+oR8FQxyY4uD5701YIrvclSF2iYwaVczS8IE4bU3bxMfYk9pp8g==
X-Gm-Gg: AYBFou2BP1XnNFh41zxX8maxKye8+xY+QNfTeK9HAP7KbJbXN65veX56RIGs1cjjbEM
	3hSfuu14RqXF6fla6BSo66C9gzWP+/LClG46/4drvW9dYwfCMNSyvZfI/1WVVf6/OGoxS2L1XtH
	ilP1lYa6uXw4aK6j4Yf9SNYVVkX3Td10iAsAiRowVgJno5qIs9HOy4zdKmztcByECSx6/KaJvmR
	du90OqnGlPGjT7Cihrp3SIQ8+ygIcfngBqHAQCq16vW4fOdryyGi3fWvvO4eq4by9XSIfrzsc57
	RqdxzupddiMbSltm+hmoNX83SUCPYTcgBZy+a0mI7XsgSadyyNqpgXyzlyY5H529pl2RKqinzEb
	G6XTqclNzQA30evFChkuuZoukT0Tn7WA4QPtV5HTzYcOEQ0x7BlX81OJlRhNctC+FiHOEmsMLMX
	XAhLI8ZvlmCuUfDf30H6e8mfDE2EpDh1YtSf5espYVHwZDcZ+A2/+xCl2hDzepvF+x4z8ioYpC7
	fnYmzhlCsqjd9kWqOGWpqgy4yjVw3tbNE3FwJqia1HYebSXy3YKZot9eVlc/UAHfyW/RMrRLz7s
	1G+Urz/GYEceU9zeQ84d92SJb9o=
X-Received: by 2002:a05:6808:250d:b0:546:306d:45eb with SMTP id 5614622812f47-563efb56084mr9466264b6e.35.1793806539588;
        Wed, 04 Nov 2026 07:35:39 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::1d6f])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9f8basm1894928b6e.12.2026.11.04.07.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:35:39 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v8 1/9] spdx: Skip dependencies that are not in the taskhash
Date: Wed,  4 Nov 2026 08:33:54 -0700
Message-ID: <20261104153535.3184146-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104153535.3184146-1-JPEWhacker@gmail.com>
References: <20261028220609.1348489-1-JPEWhacker@gmail.com>
 <20261104153535.3184146-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 15:35:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249395
Content-Type: text/plain; charset="utf-8"

If a dependency is not in the taskhash, it cannot be included in the
SPDX data because the dependency may not trigger the recipe to rebuild
if it changes (although aliases help with this), but more importantly
bitbake may not restore the sstate object associated with the dependency
which causes errors when constructing the final SBoM

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/spdx30_tasks.py | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 646ec7d074..3c3ba15e74 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -306,13 +306,14 @@ def collect_dep_objsets(d, direct_deps, subdir, fn_prefix, obj_type, **attr_filt
         dep_obj, dep_objset = oe.sbom30.find_root_obj_in_jsonld(
             d, subdir, fn_prefix + dep.pn, obj_type, **attr_filter
         )
-        # If the dependency is part of the taskhash, return it to be linked
-        # against. Otherwise, it cannot be linked against because this recipe
-        # will not rebuilt if dependency changes
-        if dep.in_taskhash:
-            dep_objsets.append(dep_objset)
+        # If the dependency is not part of the task hash, do not include it
+        # since the dependency may not be present in subsequent runs, and may
+        # not rebuild if it changes
+        if not dep.in_taskhash:
+            bb.debug(1, f"Skipping dependency {dep.pn} (not in taskhash)")
+            continue
 
-        # The object _can_ be linked against (by alias)
+        dep_objsets.append(dep_objset)
         dep_objs.add(dep_obj)
 
     return dep_objsets, dep_objs
-- 
2.56.0

